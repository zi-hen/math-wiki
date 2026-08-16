# Lint script for math-wiki (PowerShell 5.x) — v2 stable

param(
    [string]$WikiRoot = 'e:\wikiproject\math-wiki\wiki',
    [string]$ReportsDir = 'e:\wikiproject\math-wiki\scratch\lint-reports'
)

Set-StrictMode -Off
$ErrorActionPreference = 'Continue'
$report = New-Object System.Collections.Generic.List[string]
$report.Add('## lint-wiki.ps1 report - ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))
$report.Add('Wiki root: ' + $WikiRoot)
$report.Add(' ')

# Resolve pages
# 排除 lint 自动生成的元数据文件(.lint-last.md / .lint-sync-last.md),避免被当作 wiki 页面扫描。
$allFiles = @(Get-ChildItem -Path $WikiRoot -Recurse -Filter '*.md' | Where-Object { $_.Name -ne '.lint-last.md' -and $_.Name -ne '.lint-sync-last.md' })

# Pages requiring full lint
$pages = @($allFiles | Where-Object {
    $_.FullName -notlike '*\wiki\sources\*' -and
    $_.Name -ne 'README.md' -and
    $_.Name -ne 'index.md' -and
    $_.Name -notlike 'index-*.md' -and
    $_.Name -ne 'log.md' -and
    $_.Name -ne 'open-questions.md'
})
$sourcePages = @(Get-ChildItem -Path (Join-Path $WikiRoot 'sources') -Filter '*.md' -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne 'README.md' -and $_.Name -ne '.lint-last.md' })
$allPages = @($pages) + @($sourcePages)
# Pages to skip entirely (navigation/log/index placeholders)
$skipFiles = @('README.md','index.md','index-*.md','log.md','open-questions.md')
# Audit-issue collector (Section 16 proof audit)
$auditIssues = New-Object System.Collections.Generic.List[string]

# Build filename set
$filenames = @{}
foreach ($p in $allPages) {
    $name = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
    $filenames[$name] = $p.FullName
    # Also support "subdir/name" form (Obsidian path-style)
    $relFromWiki = $p.FullName.Substring((Join-Path $WikiRoot '').Length)
    $relFromWiki = [Regex]::Replace($relFromWiki, '^[\\\/]+', '')
    $relFromWiki = [Regex]::Replace($relFromWiki, '\.md$', '')
    $relFromWiki = [Regex]::Replace($relFromWiki, '\\', '/')
    $filenames[$relFromWiki] = $p.FullName
}

$totals = @{ errors = 0; warnings = 0; info = 0 }

function Get-Rel {
    param([string]$FullPath)
    $rel = $FullPath.Substring($WikiRoot.Length)
    $rel = [Regex]::Replace($rel, '^[\\\/]+', '')
    return $rel
}

function Get-Wikilinks {
    param([string]$Content)
    $regex = '\[\[([^\]|]+)(?:\|[^\]]+)?\]\]'
    [regex]::Matches($Content, $regex) | ForEach-Object { $_.Groups[1].Value }
}

function Add-Issue {
    param([string]$Category, [string]$Severity, [string]$Page, [string]$Message)
    $script:report.Add('- **' + $Severity + '** [' + $Category + '] ' + $Page + ' : ' + $Message)
}

# ============ 1. broken wikilinks ============
$report.Add('### 1. Broken wikilinks')
$report.Add(' ')
$broken = 0
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $links = Get-Wikilinks $content
    foreach ($link in $links) {
        $target = $link.Trim()
        # Skip template placeholders <page>, etc.
        if ($target -match '<.*>') { continue }
        if (-not $filenames.ContainsKey($target)) {
            $rel = Get-Rel $p.FullName
            Add-Issue 'wikilink' 'ERROR' $rel ('[' + $link + '] not found')
            $broken++
            $totals.errors++
        }
    }
}
if ($broken -eq 0) { $report.Add('- **PASS**: no broken wikilinks.') }
$report.Add(' ')

# ============ 2. duplicate slug pattern ============
$report.Add('### 2. Duplicate slug pattern (foo-foo)')
$report.Add(' ')
$repeat = 0
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $links = Get-Wikilinks $content
    foreach ($link in $links) {
        if ($link -match '^(.+)--(.+)$') {
            $rel = Get-Rel $p.FullName
            Add-Issue 'pattern' 'ERROR' $rel ('[' + $link + '] has double-hyphen')
            $repeat++
            $totals.errors++
        }
    }
}
if ($repeat -eq 0) { $report.Add('- **PASS**: no duplicate slugs.') }
$report.Add(' ')

# ============ 3. notation consistency ============
$report.Add('### 3. Stein notation consistency')
$report.Add(' ')
$notationCount = 0
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    # find body region after frontmatter
    $fmEnd = $content.IndexOf('---', 0)
    if ($fmEnd -lt 0) { continue }
    $fmEnd = $content.IndexOf('---', $fmEnd + 3)
    if ($fmEnd -lt 0) { continue }
    $body = $content.Substring($fmEnd + 3)

    # forbidden: 1/sqrt(2pi) (Stein convention: no normalization in Fourier definition)
    $bad1 = [regex]::Matches($body, '\\frac\{1\}\{\\sqrt\{2\\\\?pi\}\}')
    foreach ($m in $bad1) {
        $rel = Get-Rel $p.FullName
        Add-Issue 'notation' 'WARNING' $rel ('1/sqrt(2pi) factor (Stein uses no normalization): ' + $m.Value)
        $notationCount++
        $totals.warnings++
    }

    # forbidden: e^{-ix} without 2pi (Stein convention uses 2pi ix)
    # Recognizes 5 Fourier forms via page working space / kernel form:
    # 1. 圆群 (T or 2pi-periodic): e^{±inθ}, e^{±inx} -- Stein Ch.2-4 standard
    # 2. R: e^{±2pi i ξ x} standard; e^{±iξx} WITHOUT 2pi is wrong
    # 3. R^d: e^{±2pi i ξ · x} standard
    # 4. Z(N): e^{±2pi i k n / N} -- circle discrete analog, skip 2pi warning
    # 5. Finite abelian group G: e_ξ(a) character form, skip 2pi warning

    # Detect working space declaration after frontmatter
    $workingSpace = ''
    $wsMatch = [regex]::Match($body, '(?m)^\s*>\s*\*\*\u5de5\u4f5c\u7a7a\u95f4\*\*\s*[::]\s*(.+?)\s*$')
    if ($wsMatch.Success) { $workingSpace = $wsMatch.Groups[1].Value }

    $cnCircle = 'Stein ' + [char]0x5706 + [char]0x7fa4 + [char]0x7ea6 + [char]0x5b9a
    $cnZhTag = [char]0x5706 + [char]0x7fa4 + [char]0x7ea6 + [char]0x5b9a
    $cnZn = '\\mathbb\{Z\}\(N\)|\\Z\(N\)|Z\(N\)|\\mathbb\{Z\}_N|' + [char]0x6709 + [char]0x9650 + [char]0x963f + [char]0x8d1d + [char]0x5c14 + [char]0x7fa4
    $cnFin = [char]0x6709 + [char]0x9650 + [char]0x963f + [char]0x8d1d + [char]0x5c14 + [char]0x7fa4 + '|finite abelian|\\Z/\(q\)|G\s*=\s*\\mathbb\{Z\}'

    $isCircleDomain = ($workingSpace -match 'T|\\mathbb\{T\}|\\T|\\\[-\\pi' -or $body -match ($cnCircle + '|circle[- ]domain|circle convention|' + $cnZhTag))
    $isZnDomain = ($workingSpace -match $cnZn)
    $isFiniteAbelian = ($workingSpace -match $cnFin)

    $bad2 = [regex]::Matches($body, 'e\^\{-i\\?[a-zA-Z]+\\?[a-zA-Z]\}')
    foreach ($m in $bad2) {
        $val = $m.Value
        # Skip if 2pi is present (Stein convention)
        if ($val -match '2\\pi|2\\\\pi|2\\?pi') { continue }
        # Skip if in circle-domain / Z(N) / finite abelian group context
        if ($isCircleDomain -or $isZnDomain -or $isFiniteAbelian) { continue }
        # Skip if non-Stein convention marker is nearby (check text after the match)
        $afterStart = $m.Index + $m.Length
        $afterLen = [Math]::Min($body.Length - $afterStart, 200)
        $afterText = $body.Substring($afterStart, $afterLen)
        if ($afterText -match 'Stein') { continue }
        $rel = Get-Rel $p.FullName
        Add-Issue 'notation' 'WARNING' $rel ('Fourier kernel missing 2pi: ' + $val)
        $notationCount++
        $totals.warnings++
    }

    # Detect Z(N)-style e^{2pi i k n / N} form and treat as legitimate
    $znMatches = [regex]::Matches($body, 'e\^\{2\\\\?pi\s*i\s*[a-zA-Z]+\s*[a-zA-Z]+\s*/\s*[a-zA-Z]+\}')
    foreach ($m in $znMatches) {
        # These are valid Z(N) forms; no warning needed.
        continue
    }

    # forbidden: Schwartz space written as S( without mathcal
    $bad2 = [regex]::Matches($body, '(?<!\\)\\bS\(R\^\{?d?\}?\)')
    foreach ($m in $bad2) {
        $rel = Get-Rel $p.FullName
        Add-Issue 'notation' 'WARNING' $rel ('Schwartz space not mathcal{S}: ' + $m.Value)
        $notationCount++
        $totals.warnings++
    }
}
if ($notationCount -eq 0) { $report.Add('- **PASS**: notation consistent.') }
$report.Add(' ')

# ============ 4. frontmatter completeness ============
$report.Add('### 4. Frontmatter completeness')
$report.Add(' ')
$requiredFields = @('type','title','created','updated','sources','status','tags')
$validStatus = @('verified','unverified','pending-verification','superseded','draft','in-progress','mature','archived')
$fmIssues = 0
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) {
        $rel = Get-Rel $p.FullName
        Add-Issue 'frontmatter' 'ERROR' $rel 'missing frontmatter block'
        $fmIssues++
        $totals.errors++
        continue
    }
    $fm = $fmMatch.Groups[1].Value
    $fmLines = $fm -split '\r?\n'
    foreach ($field in $requiredFields) {
        $has = $false
        foreach ($ln in $fmLines) {
            if ($ln -match ('^' + [regex]::Escape($field) + '\s*:')) { $has = $true; break }
        }
        if (-not $has) {
            $rel = Get-Rel $p.FullName
            Add-Issue 'frontmatter' 'WARNING' $rel ('missing field: ' + $field)
            $fmIssues++
            $totals.warnings++
        }
    }
    $sm = [regex]::Match($fm, '(?m)^status\s*:\s*(\S+)')
    if ($sm.Success) {
        $st = $sm.Groups[1].Value.Trim()
        if ($validStatus -notcontains $st) {
            $rel = Get-Rel $p.FullName
            Add-Issue 'status' 'ERROR' $rel ('invalid status: ' + $st)
            $fmIssues++
            $totals.errors++
        }
    }
}
if ($fmIssues -eq 0) { $report.Add('- **PASS**: frontmatter complete and status valid.') }
$report.Add(' ')

# ============ 5. strength field ============
$report.Add('### 5. Strength field')
$report.Add(' ')
$validStrength = @('strong','standard','weak')
# Page types that do not require strength field
$skipStrengthTypes = @('lemma','exercise','problem','note','source')
$strengthIssues = 0
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $fm = $fmMatch.Groups[1].Value
    # Skip page types that don't require strength
    $tm = [regex]::Match($fm, '(?m)^type\s*:\s*(\S+)')
    $pageType = ''
    if ($tm.Success) { $pageType = $tm.Groups[1].Value.Trim() }
    if ($skipStrengthTypes -contains $pageType) { continue }
    $sm = [regex]::Match($fm, '(?m)^strength\s*:\s*(\S+)')
    if (-not $sm.Success) {
        $rel = Get-Rel $p.FullName
        Add-Issue 'strength' 'WARNING' $rel 'missing strength field'
        $strengthIssues++
        $totals.warnings++
        continue
    }
    $val = $sm.Groups[1].Value.Trim()
    if ($validStrength -notcontains $val) {
        $rel = Get-Rel $p.FullName
        Add-Issue 'strength' 'ERROR' $rel ('invalid strength: ' + $val)
        $strengthIssues++
        $totals.errors++
    }
}
if ($strengthIssues -eq 0) { $report.Add('- **PASS**: all non-source pages have valid strength.') }
$report.Add(' ')

# ============ 6. basic concept wikilink ============
$report.Add('### 6. Basic concept wikilink')
$report.Add(' ')
$conceptRules = @(
    @{ Name = 'Lp'; Pattern = '\$L\^\{?(?:1|2|p|\\infty)\}?'; Page = 'lp-space' },
    @{ Name = 'ellp'; Pattern = '\\ell\^\{?(?:1|2|p|\\infty)\}?'; Page = 'ellp-space' },
    @{ Name = 'Schwartz'; Pattern = 'Schwartz|\\mathcal\{S\}'; Page = 'schwartz-space' },
    @{ Name = 'good kernel'; Pattern = ([char]0x597d + [char]0x6838 + '|good kernel|approximation to (the )?identity'); Page = 'good-kernel' },
    @{ Name = 'character'; Pattern = ('character|' + [char]0x5b57 + [char]0x7b26 + '|\\chi(?![_a-zA-Z]|_\s*\{)|character (?:\(x\)|on)') ; Page = 'character' },
    @{ Name = 'Fourier coefficient'; Pattern = ('Fourier ' + [char]0x7cfb + [char]0x6570 + '|\\hat\{[fg]?\}[\(]?[nN]'); Page = 'fourier-coefficient' },
    @{ Name = 'finite abelian'; Pattern = ([char]0x6709 + [char]0x9650 + [char]0x963f + [char]0x8d1d + [char]0x5c14 + [char]0x7fa4 + '|finite abelian|G\s*=\s*\\mathbb\{Z\}_N|G\s*=\\Z/(q)') ; Page = 'finite-abelian-group' },
    @{ Name = 'Bessel'; Pattern = ('Bessel ' + [char]0x51fd + [char]0x6570 + '|Bessel function|J_\{?[Nn]\}?\(') ; Page = 'bessel-function' },
    @{ Name = 'radial'; Pattern = ([char]0x5f84 + [char]0x5411 + [char]0x51fd + [char]0x6570 + '|radial function|f\(r\)|f\(x\)\s*=\s*g\(\|x\|\)') ; Page = 'radial-function' }
)
$conceptIssues = 0
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    # Notes are personal-review pages: wikilink convention is not enforced there
    if ($p.FullName -like '*\notes\*') { continue }
    $bn = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
    if ($bn -in @('lp-space','ellp-space','schwartz-space','good-kernel','character','fourier-coefficient','finite-abelian-group','bessel-function','radial-function')) { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $rel = Get-Rel $p.FullName
    foreach ($rule in $conceptRules) {
        $matches = [regex]::Matches($content, $rule.Pattern)
        if ($matches.Count -gt 0) {
            $linkPattern = '\[\[' + $rule.Page + '[\|\]]'
            if ($content -notmatch $linkPattern) {
                Add-Issue 'concept' 'WARNING' $rel ($rule.Name + ' mentioned but not wikilinked on page')
                $conceptIssues++
                $totals.warnings++
            }
        }
    }
}
if ($conceptIssues -eq 0) { $report.Add('- **PASS**: concepts wikilinked.') }
$report.Add(' ')

# ============ 7. working space declaration ============
$report.Add('### 7. Working space declaration')
$report.Add(' ')
$requiredSpacePages = @('fourier-series','fourier-transform','character','poisson-summation-formula','riemann-localization','dirichlet-theorem-on-primes','lp-space','ellp-space','schwartz-space','good-kernel')
$spaceIssues = 0
foreach ($p in $pages) {
    $bn = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
    if ($requiredSpacePages -notcontains $bn) { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmEnd = $content.IndexOf('---', 0)
    $fmEnd = $content.IndexOf('---', $fmEnd + 3) + 3
    $body = $content.Substring($fmEnd)
    $bodyLines = $body -split '\r?\n'
    $firstLines = ($bodyLines | Select-Object -First 30) -join "`n"
    $hasSpace = ($firstLines -match '\\?mathbb\{R\}') -or ($firstLines -match '\\?mathbb\{T\}') -or ($firstLines -match '\\?mathbb\{Z\}') -or ($firstLines -match '圆群') -or ($firstLines -match '阿贝尔群')
    if (-not $hasSpace) {
        $rel = Get-Rel $p.FullName
        Add-Issue 'space' 'WARNING' $rel 'working space declaration missing in first 30 lines'
        $spaceIssues++
        $totals.warnings++
    }
}
if ($spaceIssues -eq 0) { $report.Add('- **PASS**: working space declared.') }
$report.Add(' ')

# ============ 8. orphan pages ============
$report.Add('### 8. Orphan pages')
$report.Add(' ')
$allTargets = @{}
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $links = Get-Wikilinks $content
    foreach ($l in $links) { $allTargets[$l.Trim()] = $true }
}
$orphanCount = 0
foreach ($p in $allPages) {
    $bn = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
    if ($bn -in @('index','log','open-questions','README','AGENTS') -or $bn -like 'index-*') { continue }
    # Notes are personal-review pages: incoming-link requirement is not enforced there
    if ($p.FullName -like '*\notes\*') { continue }
    if (-not $allTargets.ContainsKey($bn)) {
        $rel = Get-Rel $p.FullName
        Add-Issue 'orphan' 'INFO' $rel 'no incoming wikilinks'
        $orphanCount++
        $totals.info++
    }
}
if ($orphanCount -eq 0) { $report.Add('- **PASS**: all pages reachable.') }
$report.Add(' ')

# ============ 9. theorem proof section ============
$report.Add('### 9. Theorem proof section')
$report.Add(' ')
$proofIssues = 0
$proofSkipPatterns = @(
    [char]0x6613 + [char]0x89c1,         # 易见
    [char]0x663e + [char]0x7136,         # 显然
    [char]0x4e0d + [char]0x96be + [char]0x9a8c + [char]0x8bc1,  # 不难验证
    [char]0x5bb9 + [char]0x6613 + [char]0x770b + [char]0x51fa,  # 容易看出
    [char]0x76f4 + [char]0x63a5 + [char]0x8ba1 + [char]0x7b97 + [char]0x53ef + [char]0x5f97  # 直接计算可得
)
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $fm = $fmMatch.Groups[1].Value
    $tm = [regex]::Match($fm, '(?m)^type\s*:\s*(\S+)')
    if (-not $tm.Success) { continue }
    $pageType = $tm.Groups[1].Value.Trim()
    if ($pageType -ne 'theorem') { continue }

    $body = $content.Substring($fmMatch.Length)
    $rel = Get-Rel $p.FullName

    # Check for proof section heading
    $hasProof = ($body -match '详细证明') -or ($body -match '## .*证明') -or ($body -match '### .*证明')
    if (-not $hasProof) {
        Add-Issue 'proof' 'WARNING' $rel 'theorem page missing proof section (详细证明)'
        $proofIssues++
        $totals.warnings++
    }

    # Check for skip phrases in proof context
    foreach ($skip in $proofSkipPatterns) {
        $skipMatches = [regex]::Matches($body, [regex]::Escape($skip))
        if ($skipMatches.Count -gt 0) {
            # Check if preceded by Claim extraction (look for nearby Claim)
            $hasNearbyClaim = $false
            foreach ($sm in $skipMatches) {
                $beforeStart = [Math]::Max(0, $sm.Index - 300)
                $beforeLen = [Math]::Min($sm.Index - $beforeStart, 300)
                $beforeText = $body.Substring($beforeStart, $beforeLen)
                if ($beforeText -match 'Claim') { $hasNearbyClaim = $true; break }
            }
            if (-not $hasNearbyClaim) {
                Add-Issue 'proof' 'WARNING' $rel ('proof skip phrase "' + $skip + '" found — extract as technical Claim')
                $proofIssues++
                $totals.warnings++
            }
        }
    }
}
if ($proofIssues -eq 0) { $report.Add('- **PASS**: theorem pages have proof sections.') }
$report.Add(' ')

# ============ 10. back-link consistency ============
$report.Add('### 10. Back-link consistency')
$report.Add(' ')
# Build reverse index: for each wikilink target, who references it?
$backlinks = @{}
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $links = Get-Wikilinks $content
    $rel = Get-Rel $p.FullName
    foreach ($link in $links) {
        $target = $link.Trim()
        if (-not $backlinks.ContainsKey($target)) { $backlinks[$target] = New-Object System.Collections.Generic.List[string] }
        $backlinks[$target].Add($rel) | Out-Null
    }
}
# Check: for each method/concept page, when it is referenced from a theorem, verify the method/concept page has the theorem in its `应用` section.
$backlinkIssues = 0
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $bn = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $tm = [regex]::Match($fmMatch.Groups[1].Value, '(?m)^type\s*:\s*(\S+)')
    $pageType = if ($tm.Success) { $tm.Groups[1].Value.Trim() } else { '' }
    # Check that pages listed in "应用" section of concept/method/lemma pages actually have an outgoing link back
    if ($pageType -in @('concept','method','lemma')) {
        $body = $content.Substring($fmMatch.Length)
        # Find 应用 section
        $appMatch = [regex]::Match($body, '(?ms)##+\s*应用\s*\r?\n(.*?)(?=\r?\n##|\z)')
        if ($appMatch.Success) {
            $appSection = $appMatch.Groups[1].Value
            $appLinks = Get-Wikilinks $appSection
            foreach ($link in $appLinks) {
                $target = $link.Trim()
                # Verify each 应用 link points to a page that contains this page's slug
                if ($filenames.ContainsKey($target)) {
                    $targetFile = $filenames[$target]
                    $targetContent = Get-Content $targetFile -Raw -Encoding UTF8
                    if ($targetContent -notmatch ('\[\[' + [regex]::Escape($bn) + '[\|\]]')) {
                        $rel = Get-Rel $p.FullName
                        Add-Issue 'backlink' 'WARNING' $rel ('page lists [[' + $target + ']] in 应用 but target does not reference this page back')
                        $backlinkIssues++
                        $totals.warnings++
                    }
                }
            }
        }
    }
}
if ($backlinkIssues -eq 0) { $report.Add('- **PASS**: back-link symmetry maintained.') }
$report.Add(' ')

# ============ 11. sources traceability ============
$report.Add('### 11. Sources traceability')
$report.Add(' ')
$sourceIssues = 0
# Build available citekeys
$availableCitekeys = @{}
# From wiki/sources/*.md (basenames)
$srcDir = Join-Path $WikiRoot 'sources'
if (Test-Path $srcDir) {
    Get-ChildItem -Path $srcDir -Filter '*.md' | Where-Object { $_.Name -ne 'README.md' } | ForEach-Object {
        $ck = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        $availableCitekeys[$ck] = $_.FullName
    }
}
# From raw/papers/*.md and raw/inbox/*.md (basenames)
$rawRoot = Split-Path $WikiRoot -Parent
$rawPapers = Join-Path $rawRoot 'raw\papers'
$rawInbox = Join-Path $rawRoot 'raw\inbox'
$rawBooks = Join-Path $rawRoot 'raw\books'
$rawWeb = Join-Path $rawRoot 'raw\web'
$rawPersonal = Join-Path $rawRoot 'raw\personal'
foreach ($rd in @($rawPapers, $rawInbox, $rawBooks, $rawWeb, $rawPersonal)) {
    if (Test-Path $rd) {
        Get-ChildItem -Path $rd -Filter '*.md' -Recurse | ForEach-Object {
            $ck = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
            if (-not $availableCitekeys.ContainsKey($ck)) { $availableCitekeys[$ck] = $_.FullName }
        }
    }
}
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $fm = $fmMatch.Groups[1].Value
    $tm = [regex]::Match($fm, '(?m)^type\s*:\s*(\S+)')
    $pageType = if ($tm.Success) { $tm.Groups[1].Value.Trim() } else { '' }
    if ($pageType -eq 'source' -or $pageType -eq 'lint-summary') { continue }
    $sm = [regex]::Match($fm, '(?m)^sources\s*:\s*(.+)')
    if (-not $sm.Success) { continue }
    $rawList = $sm.Groups[1].Value.Trim()
    if ($rawList -match '^\[\s*\]\s*$') { continue }
    # Extract citekeys from list like [a, b, c]
    $citekeys = [regex]::Matches($rawList, '\[\s*([^\]]+?)\s*\]')
    foreach ($ck in $citekeys) {
        $key = $ck.Groups[1].Value
        # Handle comma-separated inside brackets
        foreach ($k in ($key -split '\s*,\s*')) {
            $k = $k.Trim()
            if ([string]::IsNullOrWhiteSpace($k)) { continue }
            if (-not $availableCitekeys.ContainsKey($k)) {
                $rel = Get-Rel $p.FullName
                Add-Issue 'sources' 'ERROR' $rel ('citekey [' + $k + '] not found in wiki/sources/, raw/papers/, raw/inbox/, raw/books/, raw/web/, or raw/personal/')
                $sourceIssues++
                $totals.errors++
            }
        }
    }
}
if ($sourceIssues -eq 0) { $report.Add('- **PASS**: all citekeys exist.') }
$report.Add(' ')

# ============ 12. strength self-consistency ============
$report.Add('### 12. Strength self-consistency')
$report.Add(' ')
$strengthConsistencyIssues = 0
# Use [char] codes to avoid UTF-8/GBK ambiguity in PS 5.x parsing
$cnWeakTj = [char]0x5f31 + [char]0x6761 + [char]0x4ef6  # 弱条件
$cnStrongJl = [char]0x5f3a + [char]0x7ed3 + [char]0x8bba  # 强结论
$cnWeakQt = [char]0x5f31 + [char]0x524d + [char]0x63d0   # 弱前提
$cnStrongTl = [char]0x5f3a + [char]0x63a8 + [char]0x8bba  # 强推论
$cnWeakJs = [char]0x5f31 + [char]0x5047 + [char]0x8bbe  # 弱假设
$cnStrongBz = [char]0x5f3a + [char]0x4fdd + [char]0x8bc1  # 强保证
$cnWeakYj = [char]0x5f31 + [char]0x7ea6 + [char]0x675f  # 弱约束
$cnStrongJlx = [char]0x5f3a + [char]0x7ed3 + [char]0x8bba + [char]0x6027  # 强结论性

$cnWeakJl = [char]0x5f31 + [char]0x7ed3 + [char]0x8bba   # 弱结论
$cnFanLi = [char]0x53cd + [char]0x4f8b                       # 反例
$cnTuiFan = [char]0x63a8 + [char]0x7ffb                       # 推翻
$cnFanLix = [char]0x53cd + [char]0x4f8b + [char]0x6027      # 反例性
$cnRuoHua = [char]0x5f31 + [char]0x5316                       # 弱化
$cnFouDing = [char]0x5426 + [char]0x5b9a                       # 否定
$cnBuChengLi = [char]0x4e0d + [char]0x6210 + [char]0x7acb   # 不成立
$cnBuKeQu = [char]0x4e0d + [char]0x53ef + [char]0x53bb        # 不可去

$strongKeywords = @($cnWeakTj, $cnStrongJl, $cnWeakQt, $cnStrongTl, $cnWeakJs, $cnStrongBz, $cnWeakYj, $cnStrongJlx)
$weakKeywords = @($cnWeakJl, $cnFanLi, $cnTuiFan, $cnFanLix, $cnRuoHua, $cnFouDing, $cnBuChengLi, $cnBuKeQu)
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $fm = $fmMatch.Groups[1].Value
    $tm = [regex]::Match($fm, '(?m)^type\s*:\s*(\S+)')
    $pageType = if ($tm.Success) { $tm.Groups[1].Value.Trim() } else { '' }
    if ($pageType -in @('lemma','exercise','problem','note','source')) { continue }
    $sm = [regex]::Match($fm, '(?m)^strength\s*:\s*(\S+)')
    if (-not $sm.Success) { continue }
    $strengthVal = $sm.Groups[1].Value.Trim()
    $bm = [regex]::Match($fm, '(?ms)^strength_basis\s*:\s*(.+)')
    $basis = if ($bm.Success) { $bm.Groups[1].Value.Trim() } else { '' }
    $hasStrongKw = $false
    $hasWeakKw = $false
    foreach ($kw in $strongKeywords) { if ($basis -match $kw) { $hasStrongKw = $true; break } }
    foreach ($kw in $weakKeywords) { if ($basis -match $kw) { $hasWeakKw = $true; break } }
    $rel = Get-Rel $p.FullName
    if ($strengthVal -eq 'strong' -and -not $hasStrongKw) {
        Add-Issue 'strength' 'WARNING' $rel ('strength:strong but strength_basis lacks strong-keywords (e.g., 弱条件,强结论)')
        $strengthConsistencyIssues++
        $totals.warnings++
    }
    if ($strengthVal -eq 'weak' -and -not $hasWeakKw) {
        Add-Issue 'strength' 'WARNING' $rel ('strength:weak but strength_basis lacks weak-keywords (e.g., 弱结论,反例)')
        $strengthConsistencyIssues++
        $totals.warnings++
    }
}
if ($strengthConsistencyIssues -eq 0) { $report.Add('- **PASS**: strength_basis consistent with strength value.') }
$report.Add(' ')

# ============ 13. update freshness (INFO) ============
$report.Add('### 13. Update freshness (INFO)')
$report.Add(' ')
$staleIssues = 0
$thresholdDays = 90
$today = Get-Date
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $fm = $fmMatch.Groups[1].Value
    $tm = [regex]::Match($fm, '(?m)^type\s*:\s*(\S+)')
    $pageType = if ($tm.Success) { $tm.Groups[1].Value.Trim() } else { '' }
    if ($pageType -in @('note','source','lint-summary')) { continue }
    $sm = [regex]::Match($fm, '(?m)^status\s*:\s*(\S+)')
    if (-not $sm.Success) { continue }
    $statusVal = $sm.Groups[1].Value.Trim()
    if ($statusVal -ne 'verified') { continue }
    $um = [regex]::Match($fm, '(?m)^updated\s*:\s*(\S+)')
    if (-not $um.Success) { continue }
    try {
        $updatedDate = [DateTime]::ParseExact($um.Groups[1].Value.Trim(), 'yyyy-MM-dd', $null)
        $ageDays = ($today - $updatedDate).TotalDays
        if ($ageDays -gt $thresholdDays) {
            $rel = Get-Rel $p.FullName
            Add-Issue 'freshness' 'INFO' $rel ('verified page last updated ' + [int]$ageDays + ' days ago (> ' + $thresholdDays + ' days threshold)')
            $staleIssues++
            $totals.info++
        }
    } catch {
        # skip malformed dates silently
    }
}
if ($staleIssues -eq 0) { $report.Add('- **PASS**: no stale verified pages within threshold.') }
$report.Add(' ')

# ============ 14. superseded reference detection ============
$report.Add('### 14. Superseded reference detection')
$report.Add(' ')
$supersededIssues = 0
# Build map: basename -> status
$pageStatus = @{}
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $bn = [System.IO.Path].GetFileNameWithoutExtension
    # Use script-safe approach
    $bn = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
    $sm = [regex]::Match($fmMatch.Groups[1].Value, '(?m)^status\s*:\s*(\S+)')
    if ($sm.Success) { $pageStatus[$bn] = $sm.Groups[1].Value.Trim() }
}
foreach ($p in $allPages) {
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $links = Get-Wikilinks $content
    foreach ($link in $links) {
        $target = $link.Trim()
        if ($pageStatus.ContainsKey($target)) {
            if ($pageStatus[$target] -eq 'superseded') {
                $rel = Get-Rel $p.FullName
                Add-Issue 'superseded' 'WARNING' $rel ('references superseded page [[' + $target + ']]; consider replacing with successor')
                $supersededIssues++
                $totals.warnings++
            }
        }
    }
}
if ($supersededIssues -eq 0) { $report.Add('- **PASS**: no references to superseded pages.') }
$report.Add(' ')

# ============ 15. related exercise section ============
# theorem / concept 页若链接到 exercises/ 或 problems/ 下的习题页,必须包含「## 相关习题」区段。
$report.Add('### 15. Related exercise section (相关习题)')
$report.Add(' ')
# 「相关习题」用 [char] 码构造,避免 PS 5.x UTF-8/GBK 解析歧义(同第 12 节做法)
$cnXiangGuan = [char]0x76f8 + [char]0x5173   # 相关
$cnXiTi = [char]0x4e60 + [char]0x9898         # 习题
$relExHeading = $cnXiangGuan + $cnXiTi
$relExIssues = 0
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $fm = $fmMatch.Groups[1].Value
    $tm = [regex]::Match($fm, '(?m)^type\s*:\s*(\S+)')
    if (-not $tm.Success) { continue }
    $pageType = $tm.Groups[1].Value.Trim()
    # 仅检查 theorem / concept 页面;exercises/problems/notes/lemmas/methods 等不检查
    if ($pageType -notin @('theorem','concept')) { continue }
    $body = $content.Substring($fmMatch.Length)
    $rel = Get-Rel $p.FullName
    # 收集正文中指向 exercises/ 或 problems/ 下页面的 wikilink
    # ($filenames 已注册 basename 与 "subdir/name" 两种形式,value 为完整路径)
    $hasExLink = $false
    foreach ($link in (Get-Wikilinks $body)) {
        $target = $link.Trim()
        if ($target -match '<.*>') { continue }
        if (-not $filenames.ContainsKey($target)) { continue }
        $targetFull = $filenames[$target]
        if ($targetFull -like '*\exercises\*' -or $targetFull -like '*\problems\*') {
            $hasExLink = $true
            break
        }
    }
    if (-not $hasExLink) { continue }
    # 已包含「## 相关习题」标题(允许 ## / ### 等任意级数与空白)则通过
    if ($body -match ('##+\s*' + $relExHeading)) { continue }
    Add-Issue 'related-exercise' 'WARNING' $rel ('链接到习题页但缺少"## 相关习题"区段')
    $relExIssues++
    $totals.warnings++
}
if ($relExIssues -eq 0) { $report.Add('- **PASS**: theorem/concept pages linking to exercises have ' + [char]0x76AB + [char]0x5173 + [char]0x4E60 + [char]0x9898 + ' section.') }
$report.Add(' ')

# ============ 16. proof audit (修订/重新核算/跳步词表 + 知识边界提示) ============
$proofAuditIssues = 0
$skipTokens = @(
    '易见', '显然', '不难验证', '容易看出', '直接计算可得',
    '重新核算', '重新计算', '改正', '修正(?!$|正整数|正整数倍|正解|正整数性|正整数序列)',
    '这里用了.*约定', '修订:', '修订(?!改)'
)
# Build a regex matching any of the skip tokens, allowing optional punctuation / bracket between chars
$skipPattern = ($skipTokens | ForEach-Object { [regex]::Escape($_) }) -join '|'
# Compile per-page
foreach ($f in $pages) {
    $rel = $f.FullName.Substring($WikiRoot.Length).TrimStart('\','/')
    $body = Get-Content $f.FullName -Raw
    $hits = @()
    foreach ($t in $skipTokens) {
        $matches2 = [regex]::Matches($body, $t)
        if ($matches2.Count -gt 0) {
            $hits += "$t (×{0})" -f $matches2.Count
        }
    }
    if ($hits.Count -gt 0) {
        # Find the frontmatter type
        $type = 'unknown'
        $fmMatch = [regex]::Match($body, '(?ms)^type:\s*(\S+)')
        if ($fmMatch.Success) { $type = $fmMatch.Groups[1].Value }
        $auditType = switch ($type) {
            'theorem' { 'Theorem / Proof' }
            'lemma'   { 'Lemma / BriefProof' }
            'exercise' { 'Exercise / Solution' }
            'problem'  { 'Problem / Solution' }
            default    { $type }
        }
        # Only flag where math proof writing is expected
        $auditType | Out-Null
        if ($type -in @('theorem','lemma','exercise','problem')) {
            # Filter out hits that are inside a Claim context (300-char Claim-near window)
            $filteredHits = @()
            foreach ($h in $hits) {
                $tokenName = ($h -split ' ')[0]
                $tokenMatches = [regex]::Matches($body, [regex]::Escape($tokenName))
                $inClaimCtx = $false
                foreach ($tm in $tokenMatches) {
                    $beforeStart = [Math]::Max(0, $tm.Index - 300)
                    $beforeText = $body.Substring($beforeStart, [Math]::Min(300, $tm.Index - $beforeStart))
                    if ($beforeText -match 'Claim') { $inClaimCtx = $true; break }
                }
                if (-not $inClaimCtx) { $filteredHits += $h }
            }
            if ($filteredHits.Count -gt 0) {
                $auditIssues.Add("$rel [type=$type]: " + ($filteredHits -join ', ')) | Out-Null
                $proofAuditIssues++
                $totals.warnings++
            }
        }
    }
}
if ($proofAuditIssues -eq 0) {
    $report.Add('### 16. proof audit')
    $report.Add('- **PASS**: no skip-phrase / recheck phrase detected in theorem/lemma/exercise/problem pages.')
} else {
    $report.Add('### 16. proof audit')
    $report.Add('- **WARNING (' + $proofAuditIssues + ')**: skip-phrase / recheck phrase detected. Revise offending lines (proofs must be self-contained, no narrative of "重新核算/改正" — write the final computation directly).')
    foreach ($i in $auditIssues) {
        $report.Add('  - ' + $i)
    }
}
$report.Add(' ')

# ============ 17. formal proof anchor (Lean 形式化字段) ============
$report.Add('### 17. Formal proof anchor')
$report.Add(' ')
$formalIssues = 0
$formalInfo = 0
$leanRoot = Split-Path $WikiRoot -Parent
$validFormalStatus = @('pending-formalization','formalized','failed-formalization')
foreach ($p in $pages) {
    if ($p.FullName -like '*\sources\*') { continue }
    $content = Get-Content $p.FullName -Raw -Encoding UTF8
    $fmMatch = [regex]::Match($content, '(?ms)^---\s*\r?\n(.*?)\r?\n---')
    if (-not $fmMatch.Success) { continue }
    $fm = $fmMatch.Groups[1].Value
    $tm = [regex]::Match($fm, '(?m)^type\s*:\s*(\S+)')
    if (-not $tm.Success) { continue }
    $pageType = $tm.Groups[1].Value.Trim()
    if ($pageType -ne 'theorem') { continue }

    $sm = [regex]::Match($fm, '(?m)^status\s*:\s*(\S+)')
    $statusVal = ''
    if ($sm.Success) { $statusVal = $sm.Groups[1].Value.Trim() }

    # Match a YAML block under formal_proof:
    # formal_proof:
    #   path: ...
    #   commit: ...
    $fpMatch = [regex]::Match($fm, '(?ms)^formal_proof\s*:\s*\r?\n((?:  [^\r\n]+\r?\n)+)')
    $hasFormalProof = $fpMatch.Success

    $rel = Get-Rel $p.FullName

    if ($statusVal -eq 'verified' -and -not $hasFormalProof) {
        # For backward compatibility, emit as INFO (not WARNING) for now — schema added 2026-08-16
        Add-Issue 'formal' 'INFO' $rel 'verified theorem missing formal_proof anchor (migrate by adding Lean file + formal_proof block per SCHEMA.md §12)'
        $formalInfo++
        $totals.info++
        continue
    }

    if ($hasFormalProof) {
        $fpBlock = $fpMatch.Groups[1].Value
        $pathMatch = [regex]::Match($fpBlock, '(?m)^\s*path\s*:\s*(\S+)')
        if (-not $pathMatch.Success) {
            Add-Issue 'formal' 'ERROR' $rel 'formal_proof block missing path field'
            $formalIssues++
            $totals.errors++
            continue
        }
        $relPath = $pathMatch.Groups[1].Value.Trim()
        $leanPath = Join-Path $leanRoot $relPath
        if (-not (Test-Path $leanPath)) {
            Add-Issue 'formal' 'ERROR' $rel ('formal_proof.path not found on disk: ' + $relPath)
            $formalIssues++
            $totals.errors++
        }
        $fpStatusMatch = [regex]::Match($fpBlock, '(?m)^\s*status\s*:\s*(\S+)')
        if ($fpStatusMatch.Success) {
            $fpStatus = $fpStatusMatch.Groups[1].Value.Trim()
            if ($validFormalStatus -notcontains $fpStatus) {
                Add-Issue 'formal' 'ERROR' $rel ('invalid formal_proof.status: ' + $fpStatus + ' (expected: pending-formalization | formalized | failed-formalization)')
                $formalIssues++
                $totals.errors++
            }
        }
        # verified theorem must have formal_proof.status = formalized
        if ($statusVal -eq 'verified') {
            if (-not $fpStatusMatch.Success -or $fpStatusMatch.Groups[1].Value.Trim() -ne 'formalized') {
                $gotStatus = 'missing'
                if ($fpStatusMatch.Success) { $gotStatus = $fpStatusMatch.Groups[1].Value.Trim() }
                Add-Issue 'formal' 'ERROR' $rel ('verified theorem requires formal_proof.status: formalized (got: ' + $gotStatus + ')')
                $formalIssues++
                $totals.errors++
            }
        }
    }
}
if ($formalIssues -eq 0 -and $formalInfo -eq 0) {
    $report.Add('- **PASS**: formal proof anchors consistent.')
} else {
    if ($formalInfo -gt 0) {
        $report.Add('- **INFO (' + $formalInfo + ')**: pre-2026-08-16 verified theorems without formal_proof anchor. See SCHEMA.md §12 for migration path.')
    }
    if ($formalIssues -eq 0) {
        # already shown via ERROR entries below
    }
}
$report.Add(' ')

# ============ Summary ============
$report.Add('### Summary')
$report.Add(' ')
$report.Add('| Category | Count |')
$report.Add('|---|---|')
$report.Add('| **ERROR** | ' + $totals.errors + ' |')
$report.Add('| **WARNING** | ' + $totals.warnings + ' |')
$report.Add('| **INFO** | ' + $totals.info + ' |')
$report.Add(' ')

# Save and print
$reportText = $report -join ([Environment]::NewLine)
Write-Output $reportText

if (-not (Test-Path $ReportsDir)) {
    New-Item -ItemType Directory -Path $ReportsDir -Force | Out-Null
}
# build report filename
$stamp = (Get-Date -Format 'yyyyMMdd-HHmmss')
$reportFile = Join-Path $ReportsDir ([string]::Concat('lint-', $stamp, '.md'))
$reportText | Out-File -FilePath $reportFile -Encoding UTF8

# ============ LLM-readable last summary (wiki/.lint-last.md) ============
# 依据 Harness Engineering 上下文工程:「Agent 看不见的信息等于不存在」。
# 完整报告落入 scratch/(LLM 不可读),此处同步生成 wiki/.lint-last.md,
# 便于 LLM 在会话中读取最近一次 lint 状态。
$llmSummary = New-Object System.Collections.Generic.List[string]
$llmSummary.Add('---')
$llmSummary.Add('type: lint-summary')
$llmSummary.Add('title: 最近一次 lint 摘要')
$llmSummary.Add('generated: ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))
$llmSummary.Add('wiki_root: ' + $WikiRoot)
$llmSummary.Add('---')
$llmSummary.Add(' ')
$llmSummary.Add('## 摘要')
$llmSummary.Add(' ')
$llmSummary.Add('| 类别 | 计数 |')
$llmSummary.Add('|------|------|')
$llmSummary.Add('| **ERROR** | ' + $totals.errors + ' |')
$llmSummary.Add('| **WARNING** | ' + $totals.warnings + ' |')
$llmSummary.Add('| **INFO** | ' + $totals.info + ' |')
$llmSummary.Add(' ')
$llmSummary.Add('## 各节结果')
$llmSummary.Add(' ')
foreach ($line in $report) {
    if ($line.StartsWith('### ') -and $line -notmatch '^### Summary') {
        $llmSummary.Add('- ' + $line)
    } elseif ($line.StartsWith('- **PASS**')) {
        $llmSummary.Add('  ' + $line)
    } elseif ($line.StartsWith('- **ERROR**') -or $line.StartsWith('- **WARNING**') -or $line.StartsWith('- **INFO**')) {
        $llmSummary.Add('  ' + $line)
    }
}
$llmSummary.Add(' ')
$llmSummary.Add('## 完整报告')
$llmSummary.Add(' ')
$stampForLog = (Get-Date -Format 'yyyyMMdd-HHmmss')
$logFileName = [string]::Concat('lint-', $stampForLog, '.md')
$llmSummary.Add('详见 `scratch/lint-reports/' + $logFileName + '`。')
$llmSummaryText = $llmSummary -join ([Environment]::NewLine)
# Concatenate the lint-last summary file name (built to avoid PS5 single-quote parse issue)
$dotChar = [char]0x2e
$fileName = $dotChar + [string]::Concat('lint', '-', 'last.md')
$llmSummaryFile = Join-Path $WikiRoot $fileName
$llmSummaryText | Out-File -FilePath $llmSummaryFile -Encoding UTF8

Write-Output ''
Write-Output ('Report saved to: ' + $reportFile)
Write-Output ('LLM summary saved to: ' + $llmSummaryFile)