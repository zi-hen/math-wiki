# Check Lean ↔ wiki sync (PowerShell 5.x) — v1
#
# Walks wiki/theorems/*.md, reads each `formal_proof` block, and verifies the
# referenced Lean file satisfies three sync invariants:
#   1. File exists on disk (under math-wiki/).
#   2. Header comment contains `WIKI_SOURCE: <slug>`.
#   3. The main theorem name is `wiki_<slug>_main` (kebab → snake).
#   4. Trailing comment contains `WIKI_STATUS: formalized | pending-formalization | failed-formalization`.
#
# Output: full markdown report under scratch/sync-reports/, plus a short
#         wiki/.lint-sync-last.md summary visible to the LLM.

param(
    [string]$WikiRoot = 'e:\wikiproject\math-wiki\wiki',
    [string]$LeanRoot = 'e:\wikiproject\math-wiki\lean',
    [string]$ReportsDir = 'e:\wikiproject\math-wiki\scratch\sync-reports'
)

Set-StrictMode -Off
$ErrorActionPreference = 'Continue'

$report = New-Object System.Collections.Generic.List[string]
$report.Add('## check-lean-wiki-sync.ps1 report - ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))
$report.Add('Wiki root: ' + $WikiRoot)
$report.Add('Lean root: ' + $LeanRoot)
$report.Add(' ')

$totals = @{ errors = 0; warnings = 0; info = 0 }

# Resolve theorem pages
$theoremPages = @(Get-ChildItem -Path (Join-Path $WikiRoot 'theorems') -Filter '*.md' -ErrorAction SilentlyContinue)

if ($theoremPages.Count -eq 0) {
    $report.Add('- **INFO**: no theorem pages found; nothing to check.')
    $report.Add(' ')
} else {
    $report.Add('### Sync checks')
    $report.Add(' ')

    foreach ($p in $theoremPages) {
        $content = Get-Content $p.FullName -Raw -Encoding UTF8
        $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
        if (-not $fmMatch.Success) { continue }
        $fm = $fmMatch.Groups[1].Value

        $fpMatch = [regex]::Match($fm, '(?ms)^formal_proof\s*:\s*\r?\n((?:  [^\r\n]+\r?\n)+)')
        if (-not $fpMatch.Success) { continue }   # No formal_proof: skip (backward compat)

        $fpBlock = $fpMatch.Groups[1].Value
        $bn = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
        $pathMatch = [regex]::Match($fpBlock, '(?m)^\s*path\s*:\s*(\S+)')
        $statusMatch = [regex]::Match($fpBlock, '(?m)^\s*status\s*:\s*(\S+)')

        if (-not $pathMatch.Success) {
            $report.Add('- **ERROR** [sync] theorems\' + $bn + '.md : formal_proof missing path')
            $totals.errors++
            continue
        }
        $relPath = $pathMatch.Groups[1].Value.Trim()
        $leanAbs = Join-Path (Split-Path $WikiRoot -Parent) $relPath
        $relFromWiki = 'theorems\' + $bn + '.md'

        if (-not (Test-Path $leanAbs)) {
            $report.Add('- **ERROR** [sync] ' + $relFromWiki + ' : Lean file not found at ' + $relPath)
            $totals.errors++
            continue
        }

        $leanContent = Get-Content $leanAbs -Raw -Encoding UTF8

        # Check 1: header marker WIKI_SOURCE
        $expectedSource = 'WIKI_SOURCE: ' + $bn
        $headerOk = $false
        foreach ($line in ($leanContent -split '\r?\n' | Select-Object -First 20)) {
            if ($line -match [regex]::Escape($expectedSource)) { $headerOk = $true; break }
        }
        if (-not $headerOk) {
            $report.Add('- **ERROR** [sync] ' + $relFromWiki + ' : Lean header missing `/-! ' + $expectedSource + ' -/`')
            $totals.errors++
        }

        # Check 2: main theorem name wiki_<slug>_main (slug: kebab → snake)
        $snakeSlug = ($bn -replace '-', '_')
        $expectedName = 'wiki_' + $snakeSlug + '_main'
        $namePattern = 'theorem\s+' + [regex]::Escape($expectedName) + '\b'
        if ($leanContent -notmatch $namePattern) {
            $report.Add('- **ERROR** [sync] ' + $relFromWiki + ' : Lean missing theorem `' + $expectedName + '`')
            $totals.errors++
        }

        # Check 3: trailing status marker
        $fpStatus = if ($statusMatch.Success) { $statusMatch.Groups[1].Value.Trim() } else { 'pending-formalization' }
        $expectedStatusMarker = 'WIKI_STATUS: ' + $fpStatus
        $markerOk = $false
        foreach ($line in ($leanContent -split '\r?\n' | Select-Object -Last 10)) {
            if ($line -match [regex]::Escape($expectedStatusMarker)) { $markerOk = $true; break }
        }
        if (-not $markerOk) {
            $report.Add('- **WARNING** [sync] ' + $relFromWiki + ' : Lean footer missing `' + $expectedStatusMarker + '` (formal_proof.status=' + $fpStatus + ')')
            $totals.warnings++
        } else {
            $report.Add('- **PASS** [sync] ' + $relFromWiki + ' ↔ ' + $relPath + ' (theorem `' + $expectedName + '`, status `' + $fpStatus + '`)')
        }
    }

    $report.Add(' ')
}

# Summary
$report.Add('### Summary')
$report.Add(' ')
$report.Add('| Category | Count |')
$report.Add('|---|---|')
$report.Add('| **ERROR** | ' + $totals.errors + ' |')
$report.Add('| **WARNING** | ' + $totals.warnings + ' |')
$report.Add('| **INFO** | ' + $totals.info + ' |')
$report.Add(' ')

# Persist full report
$reportText = $report -join ([Environment]::NewLine)
if (-not (Test-Path $ReportsDir)) {
    New-Item -ItemType Directory -Path $ReportsDir -Force | Out-Null
}
$stamp = (Get-Date -Format 'yyyyMMdd-HHmmss')
$reportFile = Join-Path $ReportsDir ('sync-' + $stamp + '.md')
$reportText | Out-File -FilePath $reportFile -Encoding UTF8

# LLM-visible short summary in wiki/.lint-sync-last.md
$llm = New-Object System.Collections.Generic.List[string]
$llm.Add('---')
$llm.Add('type: sync-summary')
$llm.Add('title: 最近一次 Lean ↔ wiki 同步摘要')
$llm.Add('generated: ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))
$llm.Add('wiki_root: ' + $WikiRoot)
$llm.Add('lean_root: ' + $LeanRoot)
$llm.Add('---')
$llm.Add(' ')
$llm.Add('## 摘要')
$llm.Add(' ')
$llm.Add('| 类别 | 计数 |')
$llm.Add('|------|------|')
$llm.Add('| **ERROR** | ' + $totals.errors + ' |')
$llm.Add('| **WARNING** | ' + $totals.warnings + ' |')
$llm.Add('| **INFO** | ' + $totals.info + ' |')
$llm.Add(' ')
$llm.Add('## 各条结果')
$llm.Add(' ')
foreach ($line in $report) {
    if ($line.StartsWith('- **')) { $llm.Add('  ' + $line) }
}
$llm.Add(' ')
$llm.Add('## 完整报告')
$llm.Add(' ')
$llm.Add('详见 `scratch/sync-reports/sync-' + $stamp + '.md`。')
$llmText = $llm -join ([Environment]::NewLine)
$syncSummaryFile = Join-Path $WikiRoot '.lint-sync-last.md'
$llmText | Out-File -FilePath $syncSummaryFile -Encoding UTF8

Write-Output $reportText
Write-Output ''
Write-Output ('Report saved to: ' + $reportFile)
Write-Output ('LLM summary saved to: ' + $syncSummaryFile)