# apply-new-schema-to-wiki.ps1
# 应用新 schema 修订现有 wiki 页：
#   1. 去除 UTF-8 BOM 字节（0xEF 0xBB 0xBF）
#   2. 按 SCHEMA.md §1 顺序重排 frontmatter 字段
#   3. （可选）补 authors / chapter / number 字段
# 幂等；只处理 frontmatter 块，保留正文不动。

[CmdletBinding()]
param(
    [string]$WikiRoot,
    [switch]$DryRun
)

if (-not $WikiRoot) {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $WikiRoot = (Resolve-Path (Join-Path $scriptDir "..\wiki")).Path
}

$canonicalOrder = @(
    'type','title','aliases','created','updated','sources','status','tags',
    'strength','strength_basis','strength_struct','last_proof_audit','audit_notes',
    'authors','chapter','number'
)

# Required fields per type (per docs/EXAMPLES.md templates)
$typeRequiredFields = @{
    'note' = @('authors')
    'exercise' = @('chapter','number')
    'problem' = @('chapter','number')
}

function Has-Utf8Bom {
    param([byte[]]$Bytes)
    return ($Bytes.Length -ge 3 -and $Bytes[0] -eq 0xEF -and $Bytes[1] -eq 0xBB -and $Bytes[2] -eq 0xBF)
}

function Strip-Utf8Bom {
    param([byte[]]$Bytes)
    if (Has-Utf8Bom $Bytes) { return $Bytes[3..($Bytes.Length-1)] }
    return $Bytes
}

function Get-FrontmatterBlock {
    param([string]$Content)
    if ($Content -notmatch '^---\r?\n') { return $null }
    $pattern = "(?s)^---\r?\n(.*?)\r?\n---\r?\n?(.*)"
    if ($Content -match $pattern) {
        return @{ Yaml = $matches[1]; Body = $matches[2] }
    }
    return $null
}

function Parse-YamlFields {
    param([string]$Yaml)
    $fields = [ordered]@{}
    $currentKey = $null
    $currentLines = @()
    foreach ($line in $Yaml -split "`r?`n") {
        if ($line -match '^([A-Za-z_][A-Za-z0-9_]*):\s*(.*)$') {
            if ($null -ne $currentKey) {
                $fields[$currentKey] = ($currentLines -join "`n")
            }
            $currentKey = $matches[1]
            $val = $matches[2]
            if ($val -ne '') {
                $currentLines = @($val)
            } else {
                $currentLines = @()
            }
        } elseif ($line -match '^\s+(.+)$' -and $null -ne $currentKey) {
            $currentLines += $line
        }
    }
    if ($null -ne $currentKey) {
        $fields[$currentKey] = ($currentLines -join "`n")
    }
    return $fields
}

function Serialize-Frontmatter {
    param($Fields, [string[]]$Canonical)
    $lines = @()
    $seen = @{}
    foreach ($key in $Canonical) {
        if ($Fields.Contains($key)) {
            $lines += "$key`: $($Fields[$key])"
            $seen[$key] = $true
        }
    }
    foreach ($key in $Fields.Keys) {
        if (-not $seen.ContainsKey($key)) {
            $lines += "$key`: $($Fields[$key])"
        }
    }
    return $lines -join "`n"
}

function Ensure-RequiredFields {
    param($Fields, [string]$Type)
    $added = @()
    if ($typeRequiredFields.ContainsKey($Type)) {
        foreach ($f in $typeRequiredFields[$Type]) {
            if (-not $Fields.Contains($f) -or [string]::IsNullOrWhiteSpace([string]$Fields[$f])) {
                $default = switch ($f) {
                    'authors' { '[人类, AI]' }
                    'chapter' { 'Ch.?' }
                    'number'  { '?' }
                }
                $Fields[$f] = $default
                $added += $f
            }
        }
    }
    return $added
}

$files = Get-ChildItem -Path $WikiRoot -Filter '*.md' -Recurse
$modified = @()

foreach ($file in $files) {
    $rawBytes = [System.IO.File]::ReadAllBytes($file.FullName)
    if ($rawBytes.Length -eq 0) { continue }
    $hadBom = Has-Utf8Bom $rawBytes
    $stripped = if ($hadBom) { $rawBytes[3..($rawBytes.Length-1)] } else { $rawBytes }
    if ($null -eq $stripped -or $stripped.Count -eq 0) { continue }
    $content = [System.Text.Encoding]::UTF8.GetString($stripped)
    $fm = Get-FrontmatterBlock -Content $content
    if ($null -eq $fm) { continue }

    $fields = Parse-YamlFields -Yaml $fm.Yaml

    # Determine page type
    $type = if ($fields.Contains('type')) { [string]$fields['type'] } else { '' }

    # Add missing required fields for this type
    $addedFields = Ensure-RequiredFields -Fields $fields -Type $type

    # Reorder fields per canonical order
    $newYaml = Serialize-Frontmatter -Fields $fields -Canonical $canonicalOrder

    $body = $fm.Body
    if (-not $body.StartsWith("`n")) { $body = "`n" + $body }
    $newContent = "---`n$newYaml`n---$body"

    $changed = $hadBom -or ($newContent -ne $content) -or ($addedFields.Count -gt 0)
    if ($changed) {
        if (-not $DryRun) {
            $newBytes = [System.Text.Encoding]::UTF8.GetBytes($newContent)
            [System.IO.File]::WriteAllBytes($file.FullName, $newBytes)
        }
        $modified += [pscustomobject]@{
            File = $file.FullName.Replace((Resolve-Path $WikiRoot).Path + [IO.Path]::DirectorySeparatorChar, '')
            BomRemoved = $hadBom
            FieldsAdded = ($addedFields -join ',')
        }
    }
}

Write-Host "Modified $($modified.Count) files."
foreach ($m in $modified) {
    $info = "  - $($m.File)"
    if ($m.BomRemoved) { $info += " [BOM removed]" }
    if ($m.FieldsAdded) { $info += " [added: $($m.FieldsAdded)]" }
    Write-Host $info
}
