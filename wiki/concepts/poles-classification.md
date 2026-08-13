---
type: concept
title: 极点分类（可去/极点/本质奇点）
aliases: [classification of isolated singularities, three types of singularities]
created: 2026-08-13
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, isolated-singularities, meromorphic-functions]
strength: standard
strength_basis: 条件：$f$ 在 $z_0$ 去心邻域全纯（弱——标准的孤立奇点假设）；结论：奇点分为三类（可去/极点/本质），每类由 Laurent 展开主部精确刻画，且有判定准则（Cauchy 不等式 → 残部 / Casorati-Weierstrass）（标准——亚纯函数理论的入口定理）。
---

# 极点分类（可去/极点/本质奇点）

> **工作空间**：$\mathbb{C}$ 中以 $z_0$ 为中心的去心邻域 $D_r(z_0)\setminus\{z_0\}$。

## What — 定义与基本事实

### 定义（Stein, Ch. 3, §1）

设 $f$ 在 $z_0$ 的去心邻域 $D_r(z_0) \setminus \{z_0\}$ 上全纯。则 $f$ 在 $z_0$ 处有 Laurent 展开
$$
f(z) = \sum_{k=-\infty}^{\infty} a_k (z - z_0)^k.
$$

按 Laurent 展开中**负幂项是否为零**（及如何为零），$z_0$ 分为三类孤立奇点：

| 类型 | Laurent 展开特征 | 行为 |
|------|------------------|------|
| **可去奇点**（removable） | $a_k = 0$ 对所有 $k < 0$（即主部为空） | $f$ 在 $z_0$ 邻域有界，可全纯延拓（[[steinComplexAnalysis|Stein Theorem 3.1, p.103]]） |
| **极点**（pole） | 存在 $n \ge 1$ 使 $a_{-n} \ne 0$，$a_k = 0$ 对 $k < -n$ | $\|f(z)\| \to \infty$ 当 $z \to z_0$；$f$ 局部 $f(z) = (z - z_0)^{-n} g(z)$（$g$ 全纯非零） |
| **本性奇点**（essential） | 无穷多 $a_k \ne 0$（$k < 0$） | 既非可去也非极点；$f$ 在邻域取值稠密于 $\mathbb{C}$（Casorati-Weierstrass） |

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, §1, p.91–94]]。

### Theorem 1.2（Stein, p.93）— 极点的局部结构

> 若 $f$ 在 $z_0 \in \Omega$ 处有极点，则在该点邻域存在非零全纯函数 $h$ 与唯一正整数 $n$ 使
> $$
> f(z) = (z - z_0)^{-n} h(z), \quad h(z_0) \ne 0.
> $$

即 $f$ 在 $z_0$ 处有 $n$ 阶极点 $\Leftrightarrow$ 局部 $f$ 形如 $(z-z_0)^{-n}$ 乘以非零全纯函数。

### Theorem 1.3（Stein, p.94）— 主部展开

> 若 $f$ 在 $z_0$ 处有 $n$ 阶极点，则
> $$
> f(z) = \frac{a_{-n}}{(z - z_0)^n} + \frac{a_{-n+1}}{(z - z_0)^{n-1}} + \cdots + \frac{a_{-1}}{z - z_0} + G(z),
> $$
> 其中 $G$ 在 $z_0$ 邻域全纯。

### 留数公式（Theorem 1.4, p.95）

对 $n$ 阶极点，
$$
\operatorname{Res}(f, z_0) = \frac{1}{(n-1)!}\lim_{z\to z_0}\frac{d^{n-1}}{dz^{n-1}}\bigl[(z - z_0)^n f(z)\bigr] = a_{-1}.
$$

简单极点情形（$n = 1$）：
$$
\operatorname{Res}(f, z_0) = \lim_{z\to z_0}(z - z_0)f(z).
$$

商形式（$f = g/h$，$h(z_0) = 0$、$h'(z_0) \ne 0$）：
$$
\operatorname{Res}(f, z_0) = \frac{g(z_0)}{h'(z_0)}.
$$

详见 [[residue-by-taylor-coeff]] 引理。

### 基本性质

1. **孤立奇点三分性**：每个孤立奇点必属三类之一——由 Laurent 展开主部**精确**决定（$a_k = 0$ 对所有 $k < 0$ → 可去；有限个非零 → 极点；无穷多 → 本性）。
2. **零点-极点对偶**：$f$ 在 $z_0$ 有零点（阶 $n$）$\Leftrightarrow$ $1/f$ 在 $z_0$ 有极点（阶 $n$）。
3. **极点的边界行为**：$f$ 在极点处 $\|f(z)\| \to \infty$（Stein Corollary 3.2, p.104）。
4. **本性奇点的混沌性**：$f$ 在本性奇点的邻域内取值稠密于 $\mathbb{C}$（Casorati-Weierstrass Theorem 3.3, p.105）。

### 典型例子

| 函数 | 奇点 $z_0$ | 类型 | 阶 |
|------|------------|------|-----|
| $\sin z / z$ | $0$ | 可去 | — |
| $1/z$ | $0$ | 极点 | $1$ |
| $1/(z-1)^n$ | $1$ | 极点 | $n$ |
| $\cot z$ | $n\pi$ | 极点 | $1$ |
| $e^{1/z}$ | $0$ | 本性 | — |
| $\sin(1/z)$ | $0$ | 本性 | — |
| $1/\sin z$ | $n\pi$ | 极点 | $1$ |

## Why — 动机与直观

### 为什么研究极点分类？

极点分类是全纯函数在奇点处行为的**完整分类**——把「奇点」这一模糊概念分解为三类可精确处理的子情形，每类有对应的工具：

1. **可去奇点**：唯一「无害」的奇点——$f$ 可全纯延拓，故实际上无奇点（Riemann 定理）。
2. **极点**：保留「有限阶爆破」的结构——主部展开使极点处的留数精确可计算，进而支撑整个留数理论。
3. **本性奇点**：唯一「真正奇异」的奇点——Casorati-Weierstrass 表明此处函数行为复杂（值域稠密），无 Laurent 系数可利用。

此分类在三个方向上扩展了理论：

- **亚纯函数**：允许极点的全纯函数（[[meromorphic-function]]）。
- **辐角原理**：零点-极点计数统一处理（[[argument-principle]]）。
- **Rouché 定理**：极点与零点的局部比较（[[rouche-theorem]]）。

### 直观解释

孤立奇点像全纯函数内部的「小型爆炸」：
- **可去奇点**：「微扰」——补上值即可延拓。
- **极点**：「有限阶爆破」——函数值趋于 $\infty$，但有精确的主部结构。
- **本性奇点**：「混沌」——函数值在邻域内任意振荡。

## What-if — 反例与边界

### 反例

1. **$z_0$ 非孤立奇点**：若 $f$ 在 $z_0$ 邻域内有无穷多奇点聚于 $z_0$，则分类不适用。例 $f(z) = 1/\sin(1/z)$ 在 $z = 1/(n\pi)$ 处有极点聚于 $0$，故 $0$ 非孤立奇点。
2. **本质奇点的非密度情形**：Picard 大定理指出，本性奇点邻域内 $f$ 取所有复数值**至多一个例外**。Casorati-Weierstrass 仅断言稠密性——这是大 Picard 定理更强的结论。
3. **可去 vs 极点的边界**：$\sin(z)/z$ 在 $z = 0$ 处极限为 $1$，故可去。若 $|f(z)| \to \infty$（包括振荡到 $\infty$），必为极点——但本质奇点处 $f$ 可取任意大值，**但不**趋于 $\infty$。

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. Riemann 可可可去定理（Theorem 3.1） | 有界孤立奇点 $\Rightarrow$ 可去 | Stein p.103 |
| 2. 极点准则（Corollary 3.2） | $\|f(z)\| \to \infty \Leftrightarrow$ 极点 | Stein p.104 |
| 3. Casorati-Weierstrass（Theorem 3.3） | 本性奇点 $\Rightarrow$ 值域稠密 | Stein p.105 |
| 4. Laurent 系数三分 | 主部为空/有限/无限 | Stein p.91–94 |

### 推广 / 变体

- **无穷远点**：$z_0 = \infty$ 通过 $F(z) = f(1/z)$ 在 $0$ 处的行为分析。
- **聚点奇点**：聚点奇点（如 $\tan(\pi/2 \cdot (1+z)/(1-z))$ 在 $z = 1$）无简单分类——需用聚点奇点的代数处理。

## 相关习题

- 与定理强相关的 exercise/problem(替代证法、特例、反例、证明直接引用)必须在此填充**陈述**(不含证明);证明仅存在于习题/问题页。

## 关联

- 概念：[[holomorphic-function]]、[[meromorphic-function]]、[[isolated-singularity]]
- 定理：[[residue-theorem]]、[[argument-principle]]、[[rouche-theorem]]
- 引理：[[residue-by-taylor-coeff]]（留数 = $a_{-1}$）、[[removable-singularity-criterion]]（可去奇点判定）
- 源：[[steinComplexAnalysis]]（Ch. 3, §1, p.91–94; Theorem 1.2, 1.3, 1.4）