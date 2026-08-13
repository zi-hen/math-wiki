# SCHEMA.md — Frontmatter 模式与字段定义

> 本文件是 wiki 页面 frontmatter 模式、状态流转、AI 核验分级的**唯一权威**。页面类型的目录归属与正文结构不在本文件范围,详见 [docs/STRUCTURE.md](STRUCTURE.md) 与 [docs/EXAMPLES.md](EXAMPLES.md)。

---

## 1. 完整字段

```yaml
---
type: concept | theorem | lemma | method | topic | person | source | exercise | problem | note
title: <中文标题>
description: <一句话摘要>   # 可选,概念/定理/方法/引理页推荐填写;用于 index.md 同步与检索预览(OKF 对齐)
aliases: [<英文别名>, <中译别名>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [<citekey1>, <citekey2>]   # 支撑本页的 citekey 列表
status: verified | unverified | pending-verification | superseded | draft | in-progress | mature | archived
tags: [<主题>, <子领域>]
strength: strong | standard | weak  # concept / theorem / method / topic / person 必填;source / lemma / exercise / problem / note 不设(见 §10 与 docs/STRUCTURE.md §3.1)
strength_basis: <强弱判定依据或理由>
strength_struct:                  # 可选,机器可读
  conditions: <弱条件的简短描述>
  conclusions: <强结论的简短描述>
  verdict: <一句话判定>
last_proof_audit: YYYY-MM-DD       # 可选,定理页证明重审日期
audit_notes: <可选,本次审核的备注>
authors: [<人类>, <AI>]            # 笔记页
chapter: <章节号>                  # 练习/问题页
number: <题号>                     # 练习/问题页
---
```

**注意**:不设 `space` 元数据字段。工作空间($\mathbb{R}$、$\mathbb{R}^d$、圆群 $\mathbb{T}$、抽象阿贝尔群 $G$)属于定理叙述的一部分,应在「陈述」/「定义」区段显式声明。

---

## 2. status 流转规则

### 2.1 实体页(概念/定理/引理/方法/练习/问题)

```
unverified → pending-verification → verified
unverified → superseded
```

- 仅允许上述流转;反向流转须用户明示。
- AI 对话笔记中的**显式主张**(E 级)可由 LLM 自行核验后直接升 `pending-verification`;**抽象主张**(A 级)须用户核验。

### 2.2 笔记页

```
draft → in-progress → mature → archived
draft → archived
```

- `draft`:初始草稿,可能未完成或含错误。
- `in-progress`:正在迭代修订中。
- `mature`:内容相对稳定,已与现有 wiki 充分交叉引用。
- `archived`:已整合到综述页或其他页,不再独立维护。

### 2.3 status 取值合法性

仅允许上述取值,见 [docs/STRUCTURE.md](STRUCTURE.md) 的页面类型表与 [docs/REGRESSION.md](REGRESSION.md) §状态流转合法性。

---

## 3. AI 核验分级

| 等级 | 类型 | 核验责任 |
|------|------|---------|
| **E(Explicit)** | 教材中**显式陈述**的定理、定义、公式(页码明确、与原书逐字匹配、未引入抽象框架) | LLM 自行核验(grep + WebFetch),标 `[AI-核验]` |
| **A(Abstract)** | 抽象综合、群论诠释、统一结构等对话提升内容 | 用户人工核验 |

E 级认定标准(**全部**满足):

1. 引用页码与定理编号明确。
2. 公式或叙述**逐字**匹配 Stein 原书。
3. 未引入抽象数学框架(如 Pontryagin 对偶、商群、谱定理等未在原书出现的术语)。

---

## 4. 工作空间声明

在「陈述」或「定义」区段开头声明,模板:

```markdown
> 在 **$\mathbb{R}^d$** 上(圆群 $\mathbb{T}$ / 抽象阿贝尔群 $G$ / 有限阿贝尔群 $G$),设 $f \in \dots$,则 …
```

---

## 5. 等价叙述判定标准

在特殊的空间 / 背景 / 条件下,同一概念或定理可能有多种等价叙述。每个定理页与概念页应在「陈述」之后、「证明思路」之前增设「等价叙述」区段。

- **形式等价**:通过显式代数变换即可互推。
- **本质等价**:需引入更深层结构才能互推。
- **条件等价**:在特定条件下等价。

**等价性须证明**:「等价叙述」区段列出的每一条等价命题,必须给出等价性证明(双方向蕴含),或引用给出该证明的实体页/习题页。未证明的等价叙述不得列入。形式等价可用一段话完成推导;本质等价与条件等价须按 [docs/PROOFS.md](PROOFS.md) 的完整证明标准书写。

---

## 6. 证明难度差异评估维度

在「证明思路」之后增设「证明难度差异」区段,评估维度:

- 所需预备知识(测度论 / 抽象代数 / 泛函分析等)
- 核心工具(Fourier 系数比较 / 谱定理 / Haar 测度 / Pontryagin 对偶等)
- 估计精度($O(\cdot)$ / 渐近 / 精确等)
- 历史里程碑(是否依赖现代调和分析的关键突破)

四档难度:low / medium / high / extremely high。

---

## 7. 基础概念登记

wiki 任何页面使用基础概念时,**必须**先有该概念的独立 wiki 页。概念页定义 + 性质 + 反例 + 等价叙述 + 证明难度差异。定理页引用基础概念时,**必须**用 wikilink。**禁止**在定理页直接定义基础概念。

强制建页清单(截至 2026-08-11):

| 基础概念 | 页面 | 状态 |
|---------|------|------|
| $L^p$ 空间 | `wiki/concepts/lp-space.md` | ✓ |
| $\ell^p$ 空间 | `wiki/concepts/ellp-space.md` | ✓ |
| Schwartz 空间 | `wiki/concepts/schwartz-space.md` | ✓ |
| 好核 | `wiki/concepts/good-kernel.md` | ✓ |

新增基础概念时在此表追加一行;状态 `unverified` → 抽到独立页 → 状态 `verified` 后允许引用。

---

## 8. 结构化 strength 字段(可选)

除 `strength` 与 `strength_basis`(自由文本)外,可选的结构化字段 `strength_struct` 提供机器可读的判定依据:

```yaml
strength_struct:
  conditions: <弱条件的简短描述,中文/英文>
  conclusions: <强结论的简短描述,中文/英文>
  verdict: <一句话判定,如「弱条件 + 强结论,标准强定理」>
```

示例:

```yaml
strength: strong
strength_basis: 弱条件 + 强结论。条件:$f \in L^1(\mathbb{R}^d)$(弱——$\mathbb{R}^d$ 上很广的函数类);结论:Fourier 变换 $\hat{f}(\xi) = \int f(x) e^{-2\pi i \xi\cdot x} dx$(强——导出平移、微分、卷积的对角化)。Plancherel 在 $L^2$ 上的等距同构(条件 $L^2$,结论 $L^2$ 等距)进一步强化。
strength_struct:
  conditions: $f \in L^1(\mathbb{R}^d)$
  conclusions: Fourier 变换对平移、微分、卷积的对角化
  verdict: 弱条件 + 强结论,标准强定理
```

**约束**:

- `strength_struct` 是**可选字段**,不强制使用。现有页面无须添加。
- 使用该字段时,`strength_struct.conditions` 与 `strength_struct.conclusions` 须与 `strength_basis` 中叙述一致。
- Lint Section 12 当前**仅**检查 `strength_basis` 关键词;若改用 `strength_struct`,可放宽 Section 12 阈值——但需要时用户须明示。
- LLM 在创建定理页时,优先使用 `strength_basis`(自由文本);如需机器可读,可附加 `strength_struct`。

---

## 9. 证明审核字段(last_proof_audit,可选)

定理页 frontmatter 可选字段:

```yaml
last_proof_audit: 2026-08-12   # 由 LLM 在证明重审后写入
audit_notes: <可选,本次审核的备注>
```

**触发审核的时机**:

- 该定理页的 `updated` 字段距今超过 90 天,且页面状态为 `verified`。
- 任何引用此定理页的页面被修订时(由 LLM 在摄取 / 重构流程中自动触发)。
- 用户明示「核验 <页面>」时。

**审核 SOP**:

1. LLM 读取本定理页,识别所有 `[[xxx]]` 引用的依赖页面。
2. 对每个依赖页面,读取其当前 `status`、`updated` 字段。
3. 若任一依赖页面在 `last_proof_audit` 之后被修订,LLM 须重审证明的 keystep。
4. 若 keystep 仍引用有效内容,更新 `last_proof_audit` 字段与 `updated` 字段。
5. 若 keystep 失效,标记 `status: pending-verification`,并在 `open-questions.md` 记录。

详见 [docs/PROOFS.md](PROOFS.md) §7 与 [docs/REGRESSION.md](REGRESSION.md) §1。

---

## 10. 页面类型补充说明

### 10.1 引理页(Lemma)

引理页用于收录频繁使用但规模较小的性质(如 $|e^z| = e^{\operatorname{Re}(z)}$、$e^{2\pi in} = 1$)。

| 维度 | 定理页 | 引理页 |
|------|--------|--------|
| strength 字段 | 必须 | 不需要 |
| What/Why/What-if 框架 | 必须 | 不需要 |
| 证明区段 | 「详细证明」(分阶段 + 技术性 Claim) | 「证明」(简要,1–2 段) |
| 应用区段 | 可选 | 必须 |

引理页 frontmatter 不设 `strength` 与 `strength_basis` 字段。完整模板见 [docs/EXAMPLES.md](EXAMPLES.md)。

### 10.2 练习题页(Exercise)

练习题页收录参考教材(如 Stein–Shakarchi)各章末尾的编号练习。结构包括陈述、思路提示、解答、关联。完整模板见 [docs/EXAMPLES.md](EXAMPLES.md)。

frontmatter 增加字段 `chapter` 与 `number`,不设 `strength` 字段。

### 10.3 问题页(Problem)

问题页收录参考教材各章末尾的 Problems(与 Exercises 相比通常更具挑战性、综合性或开放性)。结构与练习题页一致。完整模板见 [docs/EXAMPLES.md](EXAMPLES.md)。

frontmatter 增加字段 `chapter` 与 `number`,不设 `strength` 字段。lint 不要求习题解答区段完备(用户可后续补充)。

### 10.4 笔记页(Note)

笔记页是**人类与 AI 共同维护的创作性学习笔记**。结构与概念/定理页差异最大,详见 [docs/EXAMPLES.md](EXAMPLES.md)。

- frontmatter 增加字段 `authors`,不设 `strength` 字段。
- status 取值见 §2.2。
- 笔记页不得作为**其他页面**的**唯一依据**(可作为旁证)。
- 笔记页中出现的事实性主张须链接到对应 wiki 实体页,保持可回溯。
- 笔记页是**唯一允许 AI 撰写原创内容**的页面;其他页面类型仅允许引用、综述与核验。

### 10.5 综述页(Topic)

综述页对某主题作渐进式综合,含 evolving thesis。必设 `strength` 与 `strength_basis`(见 §1 与 [docs/STRUCTURE.md](STRUCTURE.md) §3.1)。

- 可选字段 `thesis`:一句话核心论点(evolving thesis),与正文「论点」区段一致。
- status 取值须在 §1 的 8 值枚举内(推荐 `in-progress`,随摄取演进);**不得**使用枚举外的取值。

### 10.6 人物页(Person)

必设 `strength` 与 `strength_basis`(见 §1 与 [docs/STRUCTURE.md](STRUCTURE.md) §3.1)。可选字段 `born` / `died` / `fields`。

### 10.7 源页(Source)

源页除 §1 通用字段外,常用附加字段:`citekey`(与文件名一致)、`authors`、`year`、`raw`(指向 raw/ 层的 wikilink)。status 采用实体页流转(§2.1)。

---

## 11. 修订记录

| 日期 | 变更 | 原因 |
|------|------|------|
| 2026-08-12 | 拆出页面类型正文结构到 STRUCTURE.md / EXAMPLES.md;保留字段定义、status 流转、AI 核验、工作空间声明、等价叙述、证明难度差异、strength_struct、last_proof_audit | docs 结构重构(spec:restructure-docs-eliminate-overlap) |
| 2026-08-12 | 新增 `strength_struct` 可选字段 | 提供机器可读的 strength 判定依据 |
| 2026-08-12 | 新增 `last_proof_audit` 可选字段 | 证明审核签字机制 |
| 2026-08-13 | 新增可选 `description` 字段 | OKF 对齐(新雇测试/index 同步) |
