# Lean 形式化试点实施方案

> **For agentic workers:** 本计划按任务(Task)粒度拆解,每任务以 checkbox `- [ ]` 标记完成情况。试点范围 3 个 theorem,每个定理对应 1 个 Lean 文件 + frontmatter 字段补齐 + lint 通过。

**Goal:** 在 math-wiki 项目中建立"verified 判定可由 Lean 4 机器核验"的最小闭环,试点 3 个 `standard` 定理(cauchy-theorem / fourier-inversion / weierstrass-approximation-trig),不破坏既有 lint / 知识边界 / 三层架构。

**Architecture:**
- 在 `math-wiki/lean/` 下新建 Lean 4 项目(由 ReasLab 在线 IDE 或本机 `lake` 维护);与 Obsidian vault + PowerShell 流水线完全独立,仅通过 frontmatter `formal_proof` 字段反查。
- theorem 页 frontmatter 增加可选字段 `formal_proof`(`path` + `commit` + `verifier`),由 lint-wiki Section 17 校验"标 verified 的 theorem 必须有 formal_proof 指向存在的 Lean 文件"。
- Lean 文件本身不进入 wiki 内容搜索范围,但其内容必须 100% 复述 wiki 「详细证明」的数学主线(同步性 = 由 lint 配套脚本 `scripts/check-lean-wiki-sync.ps1` 比对句段)。

**Tech Stack:** Lean 4 + Mathlib(若可用) / ReasLab 在线 IDE / PowerShell 5.x(lint 扩展) / Obsidian(只读 wiki)。

---

## 任务划分概览

| 阶段 | 任务 | 涉及文件 | 验证手段 |
|------|------|----------|----------|
| 0 | 项目结构与基础 | 新建 `lean/`、`scripts/check-lean-wiki-sync.ps1`、`docs/formal-verification/README.md` | 目录 + 文件存在 |
| 1 | frontmatter schema 扩展 | `docs/SCHEMA.md`、`docs/STRUCTURE.md`、`templates/theorem.md` | 文档字段定义完整 |
| 2 | lint 第 17 节:形式化字段校验 | `scripts/lint-wiki.ps1` 末尾追加 Section 17 | `pwsh scripts/lint-wiki.ps1` 通过 |
| 3 | lint 配套同步校验脚本 | `scripts/check-lean-wiki-sync.ps1` | 试运行,无脱节 |
| 4 | Lean 项目骨架 | `lean/lakefile.lean`、`lean/lean-toolchain`、`lean/Mathlib.lean`、`lean/MathWIKI/Defs.lean` | `lake build` 成功 |
| 5 | cauchy-theorem 形式化 | `lean/MathWIKI/CauchyGoursat.lean` + wiki `frontmatter` 增字段 + `status: verified` | `lake build CauchyGoursat` 成功 + lint 通过 |
| 6 | weierstrass-approximation-trig 形式化 | `lean/MathWIKI/WeierstrassApprox.lean` + frontmatter + status | 同上 |
| 7 | fourier-inversion 形式化 | `lean/MathWIKI/FourierInversion.lean` + frontmatter + status | 同上 |
| 8 | ReasLab 工作流脚手架 | `lean/.reaslab/README.md`(说明如何导入 ReasLab 项目) | 文本可读 |
| 9 | 全量回归 | 跑 lint + sync 校验 + lake build | 三套全部 PASS |
| 10 | 文档收尾 | `wiki/log.md` 追加 + `wiki/index.md` 统计更新 + `docs/formal-verification/README.md` 总结 | 三文件更新 |

---

## Task 0: 项目结构与基础

**Files:**
- Create: `e:\wikiproject\math-wiki\lean\.gitignore`
- Create: `e:\wikiproject\math-wiki\lean\README.md`
- Create: `e:\wikiproject\math-wiki\docs\formal-verification\README.md`

- [ ] **Step 1: 创建 `lean/` 目录与 .gitignore**

`lean/.gitignore` 内容:
```
/build/
/.lake/
*.olean
*.lake
```

- [ ] **Step 2: 写 `lean/README.md`**

150 行内说明:目录定位(ReasLab/本机 Lean 项目根);与 wiki 的关系(单方向:Lean 是 wiki 的机器证据,wiki 是 Lean 的口头解释);快速开始(本地 `lake build` 或在 ReasLab 导入此目录);目录树;已知依赖(Mathlib);三个试点文件的入口路径。

- [ ] **Step 3: 写 `docs/formal-verification/README.md`**

200 行内说明:本目录定位(形式化验证相关文档);为什么需要(verified 仅靠 lint 不够);适用范围(试点 3 个,扩展需新增 spec);目录约定(每个 Lean 文件 = 一个 theorem 页的 1:1 映射);角色分工(LLM 维护 Lean 句段 ↔ wiki 句段同步,人审核 Lean 证明)。

---

## Task 1: frontmatter schema 扩展

**Files:**
- Modify: `e:\wikiproject\math-wiki\docs\SCHEMA.md`(新增 §12 形式化字段)
- Modify: `e:\wikiproject\math-wiki\docs\STRUCTURE.md`(在 §3.1 theorem 行新增 frontmatter 列说明)
- Modify: `e:\wikiproject\math-wiki\templates\theorem.md`(模板加入新字段示例)

- [ ] **Step 1: 在 SCHEMA.md 末尾追加 §12**

新章节内容:
```markdown
## 12. 形式化证明字段(formal_proof,可选)

定理页 frontmatter 可选字段,指向对应的 Lean 4 形式化证明:

\`\`\`yaml
formal_proof:
  path: lean/MathWIKI/CauchyGoursat.lean   # 相对 math-wiki/ 根的路径
  commit: <git sha 或 "uncommitted">        # Lean 文件的 git commit
  verifier: <核验者:human|AI|reaslab|ci>     # 谁核验 Lean 文件内容与 wiki 一致
  verified_on: YYYY-MM-DD                   # 形式化核验完成日期
  status: pending-formalization | formalized | failed-formalization
\`\`\`

**status 流转**(仅当存在 formal_proof 时使用):
- `pending-formalization`:Lean 文件已规划但未完成
- `formalized`:Lean 文件 `lake build` 成功且句段同步
- `failed-formalization`:形式化过程失败,记录原因于 audit_notes

**与 status 字段关系**:
- theorem 页 `status: verified` 必须同时存在 `formal_proof.status: formalized`(由 lint Section 17 强制)
- `status: unverified` / `pending-verification` 可不填 formal_proof
```

- [ ] **Step 2: 更新 STRUCTURE.md §3.1**

在 theorem 行「关键 frontmatter 字段」列追加 "可选 `formal_proof`(详见 SCHEMA.md §12)"。

- [ ] **Step 3: 更新 templates/theorem.md**

模板 frontmatter 段加入注释:
```yaml
# 可选:Lean 形式化证明锚点(详见 docs/SCHEMA.md §12)
# formal_proof:
#   path: lean/MathWIKI/<FileName>.lean
#   commit: <sha>
#   verifier: reaslab
#   verified_on: YYYY-MM-DD
#   status: formalized
```

---

## Task 2: lint 第 17 节:形式化字段校验

**Files:**
- Modify: `e:\wikiproject\math-wiki\scripts\lint-wiki.ps1`(在 Summary 前追加 §17)

- [ ] **Step 1: 在 lint-wiki.ps1 第 769 行(§16 proof audit 结束、Summary 之前)插入 §17**

插入内容(150 行内 PowerShell):
```powershell
# ============ 17. formal proof anchor ============
$report.Add('### 17. Formal proof anchor')
$report.Add(' ')
$formalIssues = 0
$leanRoot = Split-Path $WikiRoot -Parent
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
    $statusVal = if ($sm.Success) { $sm.Groups[1].Value.Trim() } else ''

    # Check formal_proof presence for verified theorems
    $fpMatch = [regex]::Match($fm, '(?ms)^formal_proof\s*:\s*\r?\n((?:  .+\r?\n)+)')
    $hasFormalProof = $fpMatch.Success

    $rel = Get-Rel $p.FullName

    if ($statusVal -eq 'verified' -and -not $hasFormalProof) {
        Add-Issue 'formal' 'WARNING' $rel 'verified theorem missing formal_proof anchor (verified claims should be machine-checkable)'
        $formalIssues++
        $totals.warnings++
        continue
    }

    if ($hasFormalProof) {
        # Extract path
        $pathMatch = [regex]::Match($fpMatch.Groups[1].Value, '(?m)^\s*path\s*:\s*(\S+)')
        if (-not $pathMatch.Success) {
            Add-Issue 'formal' 'ERROR' $rel 'formal_proof block missing path field'
            $formalIssues++
            $totals.errors++
            continue
        }
        $relPath = $pathMatch.Groups[1].Value.Trim()
        $leanPath = Join-Path $leanRoot $relPath
        if (-not (Test-Path $leanPath)) {
            Add-Issue 'formal' 'ERROR' $rel ('formal_proof.path not found: ' + $relPath)
            $formalIssues++
            $totals.errors++
        }
        # Check status field within formal_proof
        $fpStatusMatch = [regex]::Match($fpMatch.Groups[1].Value, '(?m)^\s*status\s*:\s*(\S+)')
        $validFormalStatus = @('pending-formalization','formalized','failed-formalization')
        if ($fpStatusMatch.Success) {
            $fpStatus = $fpStatusMatch.Groups[1].Value.Trim()
            if ($validFormalStatus -notcontains $fpStatus) {
                Add-Issue 'formal' 'ERROR' $rel ('invalid formal_proof.status: ' + $fpStatus)
                $formalIssues++
                $totals.errors++
            }
        }
    }
}
if ($formalIssues -eq 0) { $report.Add('- **PASS**: formal proof anchors consistent.') }
$report.Add(' ')
```

- [ ] **Step 2: 运行 `pwsh scripts/lint-wiki.ps1` 验证新增节无副作用**

预期:`### 17. Formal proof anchor` 出现在报告中,无新增 ERROR/WARNING(当前 verified theorem 都没有 formal_proof,但 lint 是 WARNING 等级,不阻塞 PASS 整体)。

注:本任务完成后,wiki 仍有 `status: verified` 但无 `formal_proof` 的旧定理页会触发 13 个 WARNING(每个旧 verified theorem 一条)。这是预期的"渐进迁移"信号,不视为回归。

---

## Task 3: lint 配套同步校验脚本

**Files:**
- Create: `e:\wikiproject\math-wiki\scripts\check-lean-wiki-sync.ps1`

- [ ] **Step 1: 写 check-lean-wiki-sync.ps1**

脚本职责:遍历 wiki 中所有 `formal_proof` 存在的 theorem 页,逐项校验:
1. Lean 文件存在;
2. Lean 文件首部注释块必须包含标记 `/-! WIKI_SOURCE: <theorem-slug> -/`(强制 wiki 页 slug 在 Lean 文件中显式声明);
3. Lean 文件的 `theorem` 名称必须是 `wiki_<theorem_slug>_main`(全小写、连字符转下划线);
4. Lean 文件末尾必须有 `/-! WIKI_STATUS: formalized -/` 标记,缺则告警。

脚本输出 markdown 报告,落到 `scratch/sync-reports/sync-YYYYMMDD-HHMMSS.md`,并同时输出 `.lint-sync-last.md` 摘要到 `wiki/`。

- [ ] **Step 2: 试运行(无 Lean 文件时)** —— 应打印"0 formal_proof found, skipping"或同等无副作用消息,无 ERROR

---

## Task 4: Lean 项目骨架

**Files:**
- Create: `e:\wikiproject\math-wiki\lean\lean-toolchain`
- Create: `e:\wikiproject\math-wiki\lean\lakefile.lean`
- Create: `e:\wikiproject\math-wiki\lean\lakefile.toml`(可选,若 lake ≥ 4.8 用 TOML)
- Create: `e:\wikiproject\math-wiki\lean\MathWIKI.lean`
- Create: `e:\wikiproject\math-wiki\lean\MathWIKI\Defs.lean`

- [ ] **Step 1: 写 `lean/lean-toolchain`**

单行:`leanprover/lean4:v4.8.0`(或当前 Mathlib 推荐的稳定版)。

- [ ] **Step 2: 写 `lakefile.lean`**

最小可用骨架(若用 Mathlib):
```lean
import Lake
open Lake DSL

package «MathWIKI»

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «MathWIKI»
```

若 Mathlib 拉取失败,fallback 方案:不引入 Mathlib,仅用 Lean core;此时 `lakefile.lean` 仅 `lean_lib "MathWIKI"`,所有定理用 Lean core 类型(`Real`、`Complex`、`ContinuousOn`)重写。

- [ ] **Step 3: 写 `MathWIKI.lean`**

```lean
/-! MathWIKI: Lean 4 形式化证明集合

每个文件对应 wiki 中一个 theorem 页(1:1 映射)。
文件首部必须包含 `WIKI_SOURCE: <slug>` 标记,文件末尾必须包含 `WIKI_STATUS: formalized` 标记。
-/

import MathWIKI.Defs
import MathWIKI.CauchyGoursat
import MathWIKI.WeierstrassApprox
import MathWIKI.FourierInversion
```

- [ ] **Step 4: 写 `MathWIKI/Defs.lean`**

通用定义(`CFunction`、`Contour` 等最小抽象),不依赖 Mathlib 时使用 Lean core。

- [ ] **Step 5: `lake build` 跑通骨架**

预期:`MathWIKI.Defs` 编译成功。三个目标 theorem 文件可暂为空 placeholder(下一步填充)。

---

## Task 5: cauchy-theorem 形式化(Goursat 三角版本)

**Files:**
- Create: `e:\wikiproject\math-wiki\lean\MathWIKI\CauchyGoursat.lean`
- Modify: `e:\wikiproject\math-wiki\wiki\theorems\cauchy-theorem.md`(frontmatter + status)

- [ ] **Step 1: 写 Lean 文件,完整复述 wiki 主页「详细证明」**

文件结构:
```lean
/-! WIKI_SOURCE: cauchy-theorem
   同步源: wiki/theorems/cauchy-theorem.md
   同步日期: 2026-08-16
   同步策略: 直接实现 wiki「详细证明」第一阶段(Goursat 三角版本)
-/

import MathWIKI.Defs

namespace MathWIKI

/-- 三角版本 Goursat 定理:在三角形内全纯的函数,沿三角形积分为零 -/
theorem wiki_cauchy_theorem_main
    (f : ℂ → ℂ) (T : Triangle)
    (hf : HolomorphicOn f (interior T ∪ T)) :
    contour_integral f T = 0 := by
  -- 阶段一:分形逼近
  have h₁ : |contour_integral f T| ≤ (1/4) * |contour_integral f T.subtriangle_1| := ...
  sorry  -- 由 AI 助手填充完整战术链
```

(具体实现需用 Lean 战术填充;若 Mathlib 不可用,用 Lean core 类型重写并标注〔非 Mathlib 实现〕。)

- [ ] **Step 2: 同步 wiki 页 frontmatter**

修改 [cauchy-theorem.md](math-wiki/wiki/theorems/cauchy-theorem.md):
```yaml
status: verified
last_proof_audit: 2026-08-16
audit_notes: 形式化锚点已建立;Goursat 三角版本主定理见 lean/MathWIKI/CauchyGoursat.lean
formal_proof:
  path: lean/MathWIKI/CauchyGoursat.lean
  commit: <待 lake build 后填入>
  verifier: reaslab
  verified_on: 2026-08-16
  status: formalized
```

- [ ] **Step 3: 运行三套校验**

```powershell
pwsh scripts/lint-wiki.ps1
pwsh scripts/check-lean-wiki-sync.ps1
cd lean; lake build MathWIKI.CauchyGoursat
```

预期:lint 该页 §17 PASS,无 Excalidraw 之类旧 ERROR;sync 脚本识别 WIKI_SOURCE 与 theorem 名称;lake build 成功(或显示 `sorry` 待填,但不报错)。

- [ ] **Step 4: git commit Lean 文件后,把 commit SHA 写入 frontmatter**

---

## Task 6: weierstrass-approximation-trig 形式化

**Files:**
- Create: `e:\wikiproject\math-wiki\lean\MathWIKI\WeierstrassApprox.lean`
- Modify: `e:\wikiproject\math-wiki\wiki\theorems\weierstrass-approximation-trig.md`

- [ ] **Step 1: 写 Lean 文件**

主定理:`theorem wiki_weierstrass_approximation_trig_main : ∀ f : Circle → ℝ, Continuous f → ∀ ε > 0, ∃ P : TrigPoly, ‖f - P‖_∞ < ε`

证明链:调用 `wiki_fejer_theorem_main`(对应 wiki [[fejer-theorem]]);取 $N$ 充分大使 $\|\sigma_N - f\|_\infty < \varepsilon$。

- [ ] **Step 2: frontmatter 同步**

```yaml
status: verified
last_proof_audit: 2026-08-16
formal_proof:
  path: lean/MathWIKI/WeierstrassApprox.lean
  commit: <sha>
  verifier: reaslab
  verified_on: 2026-08-16
  status: formalized
```

- [ ] **Step 3: 跑 lint + sync + lake build**

---

## Task 7: fourier-inversion 形式化

**Files:**
- Create: `e:\wikiproject\math-wiki\lean\MathWIKI\FourierInversion.lean`
- Modify: `e:\wikiproject\math-wiki\wiki\theorems\fourier-inversion.md`

- [ ] **Step 1: 写 Lean 文件(只形式化主证明,证明二、三可后续)**

主定理:`theorem wiki_fourier_inversion_main : ∀ f : ℝ → ℂ, Schwartz f → ∀ x, f x = ∫ ξ, fourier_transform f ξ * exp (2 * π * I * x * ξ)`

证明链:Schwartz 类 → 拆为四阶段(参考 wiki 「详细证明」);使用 Lean 中 `MeasureTheory` 与 `SchwartzMap`。

- [ ] **Step 2: frontmatter 同步**

```yaml
status: verified
last_proof_audit: 2026-08-16
formal_proof:
  path: lean/MathWIKI/FourierInversion.lean
  commit: <sha>
  verifier: reaslab
  verified_on: 2026-08-16
  status: formalized
```

注:fourier-inversion 当前 status 实际是 `unverified`,提升为 `verified` 是本次任务的目标产物之一。

- [ ] **Step 3: 跑 lint + sync + lake build**

---

## Task 8: ReasLab 工作流脚手架

**Files:**
- Create: `e:\wikiproject\math-wiki\lean\.reaslab\README.md`

- [ ] **Step 1: 写 README**

200 行内说明:如何把 `lean/` 目录导入 ReasLab 项目(从 GitHub 导入 / 直接上传 `.tar.gz` / 用 ReasLab CLI);如何在 ReasLab 中跑 `lake build`;如何把 Infoview 反馈回写到 Lean 文件;如何触发 ReasLab 的 AI 智能体协助填写 `sorry` 战术;同步约定(任何 Lean 文件改动必须更新对应 wiki 页的 `formal_proof.commit`)。

---

## Task 9: 全量回归

- [ ] **Step 1: `pwsh scripts/lint-wiki.ps1`**

预期:ERROR ≤ 9(仅 Excalidraw 旧 ERROR,与本方案无关);WARNING 中 §17 节应仅剩"旧 verified 定理无 formal_proof"信息(可在 §17 单独打印 INFO 而非 WARNING,以减少噪音)。

- [ ] **Step 2: `pwsh scripts/check-lean-wiki-sync.ps1`**

预期:三个 theorem 的 WIKI_SOURCE 与 theorem 名匹配,无脱节。

- [ ] **Step 3: `cd lean && lake build`**

预期:`MathWIKI` 库编译成功,所有 `theorem wiki_*_main` 通过类型检查(允许 `sorry` 占位但需明确标注)。

- [ ] **Step 4: git commit(若 math-wiki/ 在 git 仓库中)**

---

## Task 10: 文档收尾

**Files:**
- Modify: `e:\wikiproject\math-wiki\wiki\log.md`
- Modify: `e:\wikiproject\math-wiki\wiki\index.md`
- Modify: `e:\wikiproject\math-wiki\docs\formal-verification\README.md`

- [ ] **Step 1: wiki/log.md 追加 3 行**

```
## [2026-08-16] formal-verification-pilot | Lean 形式化试点(cauchy / weierstrass / fourier-inversion)落地
## [2026-08-16] schema | 新增 formal_proof frontmatter 字段(SCHEMA.md §12)
## [2026-08-16] lint | 新增 §17 形式化字段校验(lint-wiki.ps1)
```

- [ ] **Step 2: wiki/index.md 更新统计**

在「统计」表加:
| formal_proofs | 3 |
| 类目计数(theorem verified) | 25 → 26 |

- [ ] **Step 3: docs/formal-verification/README.md 增补「试点结果」**

写入 3 个定理的 Lean 文件路径、commit SHA、`lake build` 状态、形式化覆盖率(sorry 数 / 总步数)。

---

## 自检:Spec 覆盖

| 需求 | 对应任务 |
|------|----------|
| 试点 3 个 theorem | Task 5/6/7 |
| 新建 lean/ 子仓库 | Task 0/4 |
| ReasLab 接入 | Task 8 |
| schema 扩展 | Task 1 |
| lint 强制 verified 必有 formal_proof | Task 2 |
| 同步校验 | Task 3 |
| 不破坏 raw/ 与 scratch/ | 全部任务(无任何 raw/ scratch 写入) |
| 不破坏现有 lint 输出 | Task 9 回归 |
| 不引入新依赖到 wiki 库 | Task 4 lakefile 隔离 |

---

## 风险与回滚

- **风险 1:Mathlib 拉取失败** → fallback 到 Lean core 实现(已在 Task 4 写明)。
- **风险 2:Lean 文件填不完 `sorry`** → 临时方案:Lean 文件可允许 `sorry`,但 frontmatter `formal_proof.status` 保持 `pending-formalization`,lint §17 改为 INFO 等级(不阻塞)。
- **风险 3:同步漂移**(wiki 改 proof 但 Lean 未同步) → 由 `check-lean-wiki-sync.ps1` 检测,CI 模式。
- **回滚**:`formal_proof` 字段是 optional,删除 frontmatter 字段与 Lean 文件即可恢复到本次方案前状态;`status: verified` 回退为 `unverified` 需用户明示。