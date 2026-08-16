# Formal Verification — 形式化验证文档目录

> 本目录收纳 math-wiki 中与"机器可核验"相关的规范、试点报告、扩展提案。

## 背景

math-wiki 的 `status: verified` 当前**仅由 lint + 人工核验**保证——lint 校验 frontmatter / wikilink / 记号一致性,但**不**校验"定理证明本身的数学正确性"。这意味着:

- 一个 `verified` 的 theorem 页可能含有未发现的逻辑漏洞;
- 当依赖页面修订时,长期陈旧的证明可能产生"暗 bug"(lint PASS 但证明依赖的子命题已变);
- 第三方审稿人无法仅凭 wiki 文本快速判定证明可靠性。

**Lean 4 形式化**是当前工程界最成熟的解决方案。本目录下的文档负责把 Lean 集成到 math-wiki 工作流中。

## 当前范围(试点)

| 定理 | Lean 文件 | wiki 页 | 状态 |
|------|-----------|---------|------|
| Cauchy 定理(Goursat 三角版本) | [lean/MathWIKI/CauchyGoursat.lean](../../lean/MathWIKI/CauchyGoursat.lean) | [wiki/theorems/cauchy-theorem.md](../../wiki/theorems/cauchy-theorem.md) | 试点中 |
| Weierstrass 三角多项式逼近 | [lean/MathWIKI/WeierstrassApprox.lean](../../lean/MathWIKI/WeierstrassApprox.lean) | [wiki/theorems/weierstrass-approximation-trig.md](../../wiki/theorems/weierstrass-approximation-trig.md) | 试点中 |
| Fourier 反演定理(主证明) | [lean/MathWIKI/FourierInversion.lean](../../lean/MathWIKI/FourierInversion.lean) | [wiki/theorems/fourier-inversion.md](../../wiki/theorems/fourier-inversion.md) | 试点中 |

**扩展规则**:新增形式化定理需先在 `docs/formal-verification/` 写一个简短 spec(目标、依赖、估计工时),经用户确认后再实施,避免范围蔓延。

## 试点进度(2026-08-16 截至)

| 维度 | 状态 |
|------|------|
| Lean 项目骨架(`lean/lean-toolchain` + `lakefile.lean` + `MathWIKI.lean` + `MathWIKI/Defs.lean`) | ✅ 已落地 |
| 三个 theorem 占位文件(CauchyGoursat / WeierstrassApprox / FourierInversion),带 WIKI_SOURCE/WIKI_STATUS 标记 | ✅ 已落地 |
| `formal_proof` schema 字段(SCHEMA.md §12) | ✅ 已落地 |
| lint §17 "Formal proof anchor" 校验 | ✅ 已落地;9 个 pre-existing verified theorem 标记 INFO 渐进迁移 |
| Lean↔wiki 同步校验脚本(`scripts/check-lean-wiki-sync.ps1`) | ✅ 已落地 |
| ReasLab 工作流脚手架(`lean/.reaslab/README.md`) | ✅ 已落地 |
| T5/T6/T7 三个 theorem 的 100% 完整 Lean 战术链 | ⏸ 延期 — 本机无 lake 工具链,需 ReasLab/本机 lake 环境就绪后实施 |

## 下一步

1. 在 ReasLab 创建项目并把 `lean/` 推到 GitHub;
2. 在 ReasLab Infoview 中逐步填写三个 theorem 的 Lean 战术链;
3. 每完成一个 theorem,把对应 wiki 页 frontmatter `formal_proof` 块填全(path / commit / verifier / verified_on / status: formalized),并把 `status: unverified` 提升为 `verified`;
4. 跑 `pwsh scripts/lint-wiki.ps1` 与 `pwsh scripts/check-lean-wiki-sync.ps1` 验证。

## 目录约定

每个 Lean 文件 = 一个 theorem 页的 **1:1 映射**。

- Lean 文件首部必须有注释块 `/-! WIKI_SOURCE: <theorem-slug> -/`,把 slug 显式声明;
- 主定理命名 `wiki_<slug>_main`(全小写、连字符转下划线);
- 文件末尾必须有 `/-! WIKI_STATUS: formalized | pending-formalization | failed-formalization -/`;
- 每个 Lean 文件仅承载**一个**定理页的「主证明」;「其他证明」按需各开一个文件(如 `FourierInversionPoisson.lean`)。

## 角色分工

| 角色 | 责任 |
|------|------|
| **LLM** | 维护 Lean 文件与 wiki 句段的同步;按 wiki 主页「详细证明」复述为 Lean 战术链;跑 lint + sync + lake build |
| **人** | 审核 Lean 证明的数学正确性;在 ReasLab Infoview 中逐 tactic 复核 |
| **CI / 自动化** | `pwsh scripts/lint-wiki.ps1` 校 §17 形式化字段;`pwsh scripts/check-lean-wiki-sync.ps1` 校 WIKI_SOURCE/theorem 命名 |

## 文档清单

- [2026-08-16-lean-formalization-pilot.md](./2026-08-16-lean-formalization-pilot.md) — 试点 3 个定理的完整实施方案(任务清单 + 自检 + 风险)
- 本文件 — 概览、范围、约定

## 相关规范

- [SCHEMA.md §12](../SCHEMA.md) — `formal_proof` frontmatter 字段定义
- [STRUCTURE.md §3.1](../STRUCTURE.md) — theorem 页类型表的 formal_proof 标注
- [scripts/lint-wiki.ps1](../../scripts/lint-wiki.ps1) — §17 形式化字段校验
- [scripts/check-lean-wiki-sync.ps1](../../scripts/check-lean-wiki-sync.ps1) — Lean↔wiki 同步校验