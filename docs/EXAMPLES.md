# EXAMPLES.md — 概念与定理页书写范例

本文件给出概念页与定理页的书写框架。核心原则来自 De Regt (2017) 的理解理论：**理解不是感觉，不是知识量，而是一种能力**——能否用理论做预测、做推理、解释现象、推导新东西。对应三类问题：

| 问题类型 | 含义 | 对应区段 |
|---------|------|---------|
| **What** | 知道相关信息吗？能找到正确事实吗？ | 定义、陈述、性质 |
| **Why** | 能构建解释吗？能说清楚为什么吗？ | 动机、证明思路 |
| **What-if** | 条件变化后结果如何？反事实推理 | 反例、等价叙述、推广/变体 |

---

## 概念页模板

```markdown
---
type: concept
title: <中文标题>
aliases: [<英文别名>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [<citekey>]
status: unverified
tags: [<主题>]
strength: standard
strength_basis: <判定依据>
---

# <中文标题>

> **工作空间**：$\mathbb{R}^d$（或 $\mathbb{T}$、$G$ 等）。

## What — 定义与基本事实

### 定义

[精确的数学定义，Stein 记号。]

依据 [[citekey|来源, 页码]]。

### 基本性质

[列举关键性质，每一条附简要说明。]

### 典型例子

1. **[例1]**：[具体函数/对象]，因为 [理由]。
2. **[例2]**：[具体函数/对象]，展示 [特殊性质]。

## Why — 动机与直观

### 为什么引入此概念？

[说明该概念在理论中的位置：它解决了什么问题？为什么自然出现？]

### 直观解释

[非形式的直观说明，帮助理解「为什么是这样」。]

## What-if — 反例与边界

### 反例

[削弱条件后不成立的反例。]

1. **[反例1]**：若去掉条件 X，则 [具体反例]，因为 [理由]。
2. **[反例2]**：若将条件 Y 替换为 Z，则 [具体反例]。

### 边界情形

[概念适用范围边界处的特殊情形。]

### 等价叙述

[在不同空间/条件下的等价定义。]

## 相关习题

> **规则**:与概念**强相关**的 exercise/problem(特例、反例、证明直接引用)必须在此填充**陈述**(不含证明);证明仅存在于习题/问题页。

- [[<exercise-slug>|Ch.X Ex.N]]: <一句话陈述摘要>(陈述不含证明;完整解答见习题页)
- [[<problem-slug>|Ch.X Pb.M]]: <一句话陈述摘要>

## 关联

- 关联定理：[[theorem-1]]、[[theorem-2]]
- 关联概念：[[concept-1]]、[[concept-2]]
- 关联方法：[[method-1]]
```

---

## 定理页模板

**适用场景**：有明确陈述、完整证明的定理（条件 + 结论）。需要详细证明 + What/Why/What-if 完整。

**字段说明**：`type: theorem`，必填 `strength` 与 `strength_basis`（可附 `strength_struct`）；可选 `last_proof_audit` 与 `audit_notes`（审核机制见 [docs/PROOFS.md](PROOFS.md) §7）。

```markdown
---
type: theorem
title: <中文标题>
aliases: [<英文别名>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [<citekey>]
status: unverified
tags: [<主题>]
strength: strong
strength_basis: 条件：$f \in \mathcal{S}$（弱条件）；结论：精确恒等（强结论）
---

# <中文标题>

## What — 陈述

> 在 **$\mathbb{R}^d$** 上，设 $f \in \dots$，则
> $$
> \text{[定理陈述]}
> $$

依据 [[citekey|来源, 页码]]。

## Why — 动机与证明

### 动机

[为什么这个定理重要？它解决了什么问题？证明思路的核心洞察是什么？]

### 证明思路

[以编号列表给出证明的逻辑骨架，每条注明阶段目标与所用工具。]

1. **第一阶段**：[目标]——[所用工具]。
2. **第二阶段**：[目标]——[所用工具]。
3. ...

### 详细证明

[以完整语句逐步写出证明。每步须标注依据（定理、引理、定义、公式编号）。原文以文字概括的部分须提取为技术性 Claim。证明以 $\blacksquare$ 结尾。]

**Claim 1**（Claim 描述）. [形式化陈述]

*证明.* [完整证明] $\blacksquare$

[主证明继续，引用 Claim 1。]

### 其他证明（如有）

[学到新证法时在此追加，不另立新页。每个证明独立完整，遵循 docs/PROOFS.md 全部规范。]

#### 证明二：<方法名>（来源 [[citekey]]，录入于 YYYY-MM-DD）

[动机 + 证明思路 + 详细证明 + 技术性 Claim，以 $\blacksquare$ 收尾。]

## What-if — 反例、等价叙述与推广

### 等价叙述

[在不同空间/条件下的等价形式。]

### 反例（条件不可削弱）

[说明若削弱某条件，结论不成立，并给出具体反例。]

1. **条件 X 不可削弱为 X'**：当 [条件 X'] 时，[反例]，因为 [理由]。
2. **结论 Y 不可加强为 Y'**：即使 [原条件]，[Y'] 也不成立，反例：[具体反例]。

### 推广 / 变体

[定理的推广形式或重要变体。]

## 证明难度差异

[不同等价叙述对应的证明路径与难度比较。]

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1 | [方法] | 低 | [代价] |
| 叙述 2 | [方法] | 高 | [代价] |

## 相关习题

> **规则**:与定理**强相关**的 exercise/problem(替代证法、特例、反例、证明直接引用)必须在此填充**陈述**(不含证明);证明仅存在于习题/问题页。

- [[<exercise-slug>|Ch.X Ex.N]]: <一句话陈述摘要>(陈述不含证明;完整解答见习题页)
- [[<problem-slug>|Ch.X Pb.M]]: <一句话陈述摘要>

## 应用

[定理在哪些问题中发挥作用。]

- [[application-1]]
- [[application-2]]

## 关联

- 前置定理：[[prerequisite-1]]
- 推论：[[corollary-1]]
- 关联概念：[[concept-1]]
```

---

## 方法/引理「真假」差异说明

method 与 lemma 的本质区别在于陈述**有无真假**:

- **命题(有真假)** → lemma / theorem:任何可判真假的数学陈述,收录为 lemma 或 theorem 页。
- **技巧 / 思路 / 套路(无真假)** → method:无真假可言,允许抽象描述,**步骤非必填**。

如何抉择见 [docs/STRUCTURE.md](STRUCTURE.md) §3.2 决策树。

---

## 引理页模板

**适用场景**：频繁使用但规模较小的性质（如 $|e^z| = e^{\operatorname{Re}(z)}$、$e^{2\pi in} = 1$）。与定理页的差异：

| 维度 | 定理页 | 引理页 |
|------|--------|--------|
| strength 字段 | 必须 | 不需要 |
| What/Why/What-if 框架 | 必须 | 不需要 |
| 证明区段 | 「详细证明」（分阶段 + 技术性 Claim） | 「证明」（简要，1–2 段） |
| 等价叙述 / 证明难度差异 | 必须 | 不需要 |
| 应用区段 | 可选 | **必须**（列出引用此引理的页面） |

**字段说明**：`type: lemma`，**不设** `strength` 与 `strength_basis` 字段。`status` 取 `unverified | pending-verification | verified | superseded`。

```markdown
---
type: lemma
title: <中文标题>
aliases: [<英文别名>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [<citekey>]
status: verified
tags: [<主题>]
---

# <中文标题>

> **工作空间**：$\mathbb{C}$（或 $\mathbb{R}^d$、$\mathbb{T}$ 等）。

## 陈述

> [性质的精确陈述]

依据 [[citekey|来源, 页码]]。

## 证明

[简要证明，1–2 段。每步标注依据，但不需分阶段或提取技术性 Claim。禁止「显然」「易见」等措辞。]

$\blacksquare$

## 应用

- [[theorem-1]]：[在此定理证明中的具体用途]
- [[theorem-2]]：[在此定理证明中的具体用途]
```

### 引理页检查清单

- [ ] 陈述是否精确、完整？
- [ ] 是否标注了来源？
- [ ] 证明是否以完整语句写出，每步标注依据？
- [ ] 证明是否以 $\blacksquare$ 结尾？
- [ ] 是否列出了应用场景（哪些页面引用此引理）？
- [ ] 是否有「显然」「易见」等跳过措辞？

---

## 练习题页模板

```markdown
---
type: exercise
title: <题目简述>
aliases: [<章号-Ex.<编号>>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [<citekey>]
status: verified
tags: [<章号>, <主题>]
chapter: <章节号>           # 如 "Ch.3 §2"
number: <题号>              # 如 "Ex.4"
---

# <章号> Ex.<编号>：<题目简述>

## 陈述

> [原题完整陈述]

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch.X, Ex.Y]]。

## 思路提示

[关键思路的简要勾勒，1–3 句话。]

## 解答

[完整书写过程，每步标注依据。禁止「显然」「易见」。]

$\blacksquare$

## 关联

- 用到的定理/概念：[[theorem-1]]、[[concept-1]]
- 关联引理：[[lemma-1]]
```

---

## 问题页模板

```markdown
---
type: problem
title: <题目简述>
aliases: [<章号-Problem-<编号>>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [<citekey>]
status: verified
tags: [<章号>, <主题>]
chapter: <章节号>
number: <题号>              # 如 "Problem 3.5"
---

# <章号> Problem.<编号>：<题目简述>

## 陈述

> [原题完整陈述]

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch.X, Problem Y]]。

## 思路提示

[关键思路的简要勾勒。]

## 解答

[完整书写过程；Problems 通常更具挑战性，可能需要引用跨章节工具。]

$\blacksquare$

## 关联

- 用到的定理/概念：[[theorem-1]]、[[concept-1]]
- 关联引理：[[lemma-1]]
```

---

## 笔记页模板

**适用场景**：人类与 AI 共同维护的创作性学习笔记，反映对学习内容的深度理解与跨章节联系。与概念/定理页差异最大：

| 维度 | 概念/定理页 | 笔记页 |
|------|------------|--------|
| 内容来源 | raw/ 中可追溯的源 | 人类思考 + AI 综合 |
| sources 字段 | 必有（可回溯） | 可空（独立创作）或包含参考 |
| status 取值 | unverified / pending-verification / verified / superseded | draft / in-progress / mature / archived |
| 强度分类 | strength（strong/standard/weak） | 不需要 |
| 主观性 | 客观事实 | 主观反思，允许推测 |

**字段说明**：`type: note`，必填 `authors` 标识人类与 AI；**不设** `strength` 字段。status 流转：`draft → in-progress → mature → archived`，或 `draft → archived`。

**约束**：
- 笔记页不得作为**其他页面**的**唯一依据**（可作为旁证）。
- 笔记页中出现的事实性主张须链接到对应 wiki 实体页（`[[fourier-transform]]` 等），保持可回溯。
- 笔记页中若与现有 `verified` 页内容冲突，须以 `open-questions.md` 记录该矛盾，不得直接修改被引用页。
- 笔记页是**唯一允许 AI 撰写原创内容**的页面；其他页面类型仅允许引用、综述与核验。

```markdown
---
type: note
title: <笔记标题>
aliases: [<别名>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: []              # 默认为空；若引用具体页则填写 citekey 或 wikilink
status: draft            # draft | in-progress | mature | archived
tags: [<主题>]
authors: [<人类>, <AI>]
---

# <笔记标题>

> **创建者**：<人类>（原始想法 / 草稿 / 口述）+ AI（整理、补充引用、综合）
> **状态**：draft（2026-08-12）

## 主题与背景

[为什么写这篇笔记？涉及哪几个章节的联系？解决了什么困惑？]

## 核心想法

[主要观点。可以分多节，每节独立呈现一个想法。允许推测、猜想、跨章节类比。]

### 想法 1：<标题>

[详细论述。每段提及的事实性主张须用 wikilink 引用对应 wiki 页。]

### 想法 2：<标题>

[详细论述。]

## 待澄清与下一步

- [ ] 需要验证的猜测
- [ ] 待补充的引用
- [ ] 与其他笔记的交叉引用

## 关联

- 涉及的 wiki 实体：[[fourier-transform]]、[[poisson-summation-formula]]
- 关联笔记：[[note-1]]
- 引用源（如有）：[[steinFourierAnalysisIntroduction2003a]]
```

### 笔记页检查清单

- [ ] frontmatter 的 `status` 是否在 `draft / in-progress / mature / archived` 中？
- [ ] `authors` 是否标识了人类与 AI 双方？
- [ ] 事实性主张是否都用 wikilink 引用对应 wiki 页？
- [ ] 是否避免充当其他页面的唯一依据？
- [ ] 若与现有页冲突，是否在 `open-questions.md` 记录？

---

## 三类问题的检查清单

撰写任何概念/定理页后，逐项检查：

### What（事实层）
- [ ] 定义/陈述是否精确、完整？
- [ ] 是否标注了来源（citekey + 页码）？
- [ ] 是否给出了至少 2 个典型例子？

### Why（解释层）
- [ ] 是否说明了动机（为什么引入 / 为什么重要）？
- [ ] 证明思路是否分步，每步注明目标与工具？
- [ ] 详细证明是否以完整语句逐步写出，每步标注依据？
- [ ] 原文以文字概括的推理是否已提取为技术性 Claim？
- [ ] 证明是否以 $\blacksquare$ 结尾？
- [ ] 完整证明规范见 [docs/PROOFS.md](PROOFS.md)

### What-if（反事实层）
- [ ] 是否给出了至少 1 个反例（条件削弱后不成立的情形）？
- [ ] 是否讨论了等价叙述？
- [ ] 是否讨论了推广 / 变体？
- [ ] 是否比较了不同证明路径的难度？

---

## 实际范例：Poisson 求和公式（简略版）

### What

> 在 $\mathbb{R}$ 上，设 $f \in \mathcal{S}$（Schwartz 空间），则
> $$
> \sum_{n\in\mathbb{Z}} f(n) = \sum_{n\in\mathbb{Z}} \hat{f}(n).
> $$

### Why（动机与证明）

Poisson 求和公式连接了函数的逐点值与 Fourier 系数的和。核心洞察：周期化 $F(x) = \sum_{n} f(x+n)$ 的 Fourier 系数恰为 $\hat{f}(n)$。这解释了为什么该公式在数论（Dirichlet 定理的证明）和调和分析中同时出现。

#### 证明思路

1. **构造周期化函数**：定义 $F_1(x) = \sum_n f(x+n)$ 与 $F_2(x) = \sum_n \hat{f}(n) e^{2\pi i n x}$——目标：证明 $F_1 = F_2$。
2. **比较 Fourier 系数**：分别计算 $F_1$ 与 $F_2$ 的第 $m$ 个 Fourier 系数——工具：积分变量替换 + Fubini 定理。
3. **由唯一性得等式**：Fourier 系数相同则函数相同（Ch.2, Theorem 2.1）——在 $x=0$ 取值得公式。

#### 详细证明

**第一阶段**：$F_2$ 的 Fourier 系数。

$F_2$ 已为 Fourier 级数形式 $F_2(x) = \sum_n \hat{f}(n) e^{2\pi i n x}$，故其第 $m$ 个 Fourier 系数为 $\hat{f}(m)$。

**第二阶段**：$F_1$ 的 Fourier 系数。

$F_1$ 的第 $m$ 个 Fourier 系数为
$$
\int_0^1 F_1(x)\,e^{-2\pi i m x}\,dx = \int_0^1 \sum_{n \in \mathbb{Z}} f(x+n)\,e^{-2\pi i m x}\,dx. \tag{$*$}
$$

此处须交换积分与求和的次序。此步骤在 Stein 原文中以"由 Schwarz 衰减性保证绝对收敛"概括，须提取为技术性 Claim。

**Claim 1**（积分与求和的可交换性）. 设 $f \in \mathcal{S}(\mathbb{R})$，则
$$\int_0^1 \sum_{n \in \mathbb{Z}} f(x+n)\,e^{-2\pi i m x}\,dx = \sum_{n \in \mathbb{Z}} \int_0^1 f(x+n)\,e^{-2\pi i m x}\,dx.$$

*证明.* 由 [[schwartz-space|Schwartz 空间]]的定义，对任意 $N \geq 1$，存在常数 $C_N$ 使得 $|f(x)| \leq C_N(1+|x|)^{-N}$。从而
$$\sum_{n \in \mathbb{Z}} \int_0^1 |f(x+n)|\,dx \leq \sum_{n \in \mathbb{Z}} \int_0^1 C_N(1+|x+n|)^{-N}\,dx \leq C_N \sum_{n \in \mathbb{Z}} (1+|n|)^{-N}.$$
取 $N \geq 2$，右端级数收敛。由 Fubini 定理，$(*)$ 中的积分与求和可交换。$\blacksquare$

由 Claim 1，交换 $(*)$ 中的次序并作变量替换 $y = x + n$：
$$
\sum_{n \in \mathbb{Z}} \int_0^1 f(x+n)\,e^{-2\pi i m x}\,dx = \sum_{n \in \mathbb{Z}} \int_n^{n+1} f(y)\,e^{-2\pi i m (y-n)}\,dy = \sum_{n \in \mathbb{Z}} \int_n^{n+1} f(y)\,e^{-2\pi i m y}\,dy = \int_{\mathbb{R}} f(y)\,e^{-2\pi i m y}\,dy = \hat{f}(m).
$$
其中第三个等号因为 $e^{-2\pi i m n} = 1$（$m, n \in \mathbb{Z}$），且区间 $[n, n+1)$ 铺满 $\mathbb{R}$。

**第三阶段**：$F_1$ 与 $F_2$ 的 Fourier 系数均为 $\hat{f}(m)$，由 Fourier 系数的唯一性（[[steinFourierAnalysisIntroduction2003a|Stein, Ch.2, Theorem 2.1]]），$F_1 = F_2$。在 $x = 0$ 处取值，得 $\sum_n f(n) = \sum_n \hat{f}(n)$。$\blacksquare$

### What-if（反例与等价）

- **条件不可削弱**：若 $f \notin \mathcal{S}$（如 $f \in L^1$ 但衰减不够快），右侧和可能发散。反例：$f(x) = e^{-|x|}$，$\hat{f}(\xi) = \frac{2}{1+4\pi^2\xi^2}$，$\sum \hat{f}(n)$ 收敛但 $\sum f(n)$ 也收敛——此例并非反例，需更精细的构造。
- **等价叙述**：在 $\mathbb{R}^d$ 上，$\sum_{\mathbb{Z}^d} f(n) = \sum_{\mathbb{Z}^d} \hat{f}(n)$；在局部紧阿贝尔群上，$\int_H f = \int_{H^\perp} \hat{f}$（Pontryagin 对偶）。
- **证明难度**：$\mathbb{R}$ 上的证明（Stein 方法）仅需 Schwartz 衰减性与重积分次序交换；局部紧群上的证明需 Haar 测度与 Pontryagin 对偶理论。