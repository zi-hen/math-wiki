# REGRESSION.md — 回归测试清单

> 本文件是 wiki 的**人工 / LLM 语义回归审计清单**。机械检查(断链、记号、frontmatter、反链对称性等)由 [`scripts/lint-wiki.ps1`](../scripts/lint-wiki.ps1) 自动执行,不在本清单范围。
>
> 对应 Harness Engineering「Entropy Management」支柱:定期回归测试,防止一致性随时间衰减。

---

## 1. 与 lint 的分工

| 检查类别 | 执行者 | 频率 |
|---------|--------|------|
| 断链、记号、frontmatter、status、strength、反链对称性、sources 可回溯 | `scripts/lint-wiki.ps1`(14 节) | 每次 wiki 修订后立即 |
| **证明 keystep 与依赖健康** | **人工 / LLM 审计** | **每月或重大 schema 修订后** |
| **跨页字面一致性** | **人工 / LLM 审计** | **每月或 audit 命令触发时** |
| **矛盾与人机协调** | **人工 / LLM 审计** | **每月或 audit 命令触发时** |

**回归清单只收录 lint 无法自动检测的项**。

---

## 2. 核心定理语义审计

以下 5 个核心定理页承载了 Stein Fourier / 复分析体系的关键节点。每个 lint 周期逐项核对(对每条定理只问 2-3 个 keystep / 易错点,机械项由 lint 覆盖):

### 2.1 Poisson 求和公式 `[[poisson-summation-formula]]`

- 证明 keystep(Claim 1:积分与求和可交换)是否完整,Schwartz 衰减估计是否引用了 `[[schwartz-space]]` 的具体衰减率。
- 反链:`[[paley-wiener-theorem]]` / `[[fourier-transform]]` 等关键依赖页面是否仍能回引。

### 2.2 Cauchy 定理 `[[cauchy-theorem]]`

- 同伦论证或围道变形的 keystep 是否完整。
- 反链:`[[cauchy-integral-formula]]` / `[[liouville-theorem]]` / `[[residue-theorem]]` 与 `[[homotopy-argument]]` / `[[local-to-global]]` 方法页是否回引。

### 2.3 Paley-Wiener 定理 `[[paley-wiener-theorem]]`

- 正向(Thm 3.1)+ 逆向(Thm 3.3)两个陈述是否齐全。
- 逆向证明的关键工具 `[[phragmen-lindelof-theorem]]` 是否仍有效。
- 工作空间「实直线 $\mathbb{R}$ / 复平面 $\mathbb{C}$」是否在陈述区段开头声明。

### 2.4 Phragmén-Lindelöf 定理 `[[phragmen-lindelof-theorem]]`

- 辅助函数 $F_\varepsilon(z) = F(z) e^{-\varepsilon z^{3/2}}$(3/2 次幂,非 2 次幂)是否准确。
- 几何事实 $\operatorname{Re}(z^{3/2}) \geq r^{3/2} \cos(3\pi/8) > 0$ 在闭扇形中的论证是否仍清晰。

---

## 3. 引用网络健康度(语义层)

### 3.1 反链对称性

每个 lemma / method / concept 页的「应用」区段中列出的目标页,应在目标页的「关联」或「引用本 X 的 Y」区段中回引。

- **机械检查**:lint Section 10(自动)
- **语义检查**:人工抽查「应用」区段是否完整列出,有无遗漏应回引的页。

### 3.2 基础概念登记

`[[lp-space]]`、`[[ellp-space]]`、`[[schwartz-space]]`、`[[good-kernel]]` 在任何 wiki 页面出现时,均须以 wikilink 形式引用(非内联定义)。

- **机械检查**:lint Section 6(自动)
- **语义检查**:新出现的「基础概念候选」须主动登记到 [docs/SCHEMA.md](SCHEMA.md) §7。

---

## 4. 状态流转合法性(语义层)

实体页 `unverified → pending-verification → verified` / `→ superseded`,笔记页 `draft → in-progress → mature → archived`。

- **机械检查**:lint Section 4(自动)
- **语义检查**:人工抽查 `wiki/log.md` 与 `wiki/open-questions.md`,确认无未登记的反向流转。

---

## 5. 测试周期

| 项目 | 频率 |
|------|------|
| `scripts/lint-wiki.ps1` | 每次 wiki 修订后立即 |
| 本清单(§2–§4 语义审计) | 每月一次,或重大 schema 修订后 |
| audit 命令(`.trae/commands/audit.md`) | 每月一次,或大事件后 |

---

## 6. 修订记录

| 日期 | 变更 | 原因 |
|------|------|------|
| 2026-08-12 | 删除复制的 Stein 记号表与 status 流转规则(指向 `NOTATION.md` / `SCHEMA.md`);核心定理回归测试从 6-7 行机械项精简为 2-3 个 keystep;明确「lint 已能检测的项不列入本清单」 | docs 结构重构(spec:restructure-docs-eliminate-overlap) |
| 2026-08-12 | 新建 REGRESSION.md(5 个核心定理 + 引用网络 + 状态) | 对齐 Harness Engineering Entropy Management 支柱 |
