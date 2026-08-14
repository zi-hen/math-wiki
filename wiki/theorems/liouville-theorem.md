---
type: theorem
title: Liouville 定理
aliases: [Liouville's theorem]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, entire-functions, maximum-modulus-principle]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 整 + $f$ 有界（弱——只需有界）；结论：$f$ 为常数（强——全局刚性）。这是全纯函数刚性的极致体现，直接推出代数基本定理。
---
# Liouville 定理

> **工作空间**：复平面 $\mathbb{C}$。

## What — 陈述

### Corollary 4.5（Stein, p.69）

> 若 $f$ 在 $\mathbb{C}$ 上全纯且有界，则 $f$ 为常数。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, Corollary 4.5, p.69]]。

### 推论 1：代数基本定理（Corollary 4.6, p.69）

> 每个非常数多项式 $P(z) = a_n z^n + \cdots + a_0$（$a_n \neq 0$）在 $\mathbb{C}$ 中有根。

### 推论 2：多项式增长刻画

> 若整函数 $f$ 满足 $|f(z)| \leq C(1+|z|)^n$ 对某 $C, n > 0$，则 $f$ 为次数 $\leq n$ 的多项式。

这是 Liouville 定理的高阶推广。证明：对 $f^{(n+1)}$ 应用 Liouville 定理。

## Why — 动机与证明

### 动机

Liouville 定理是复分析「有界 $\Rightarrow$ 常数」的标志性结论，揭示了全纯函数的极端刚性：

1. **代数基本定理的复分析证明**：Liouville 定理是代数基本定理最简洁的复分析证明的基础（见下方证明）。
2. **整函数分类的起点**：Liouville 定理是 [[jensen-formula|Jensen 公式]]等更精细整函数理论的起点。
3. **PDE 推论**：调和函数的有界性蕴含常数（实 Liouville 定理），是 Liouville 定理的实类比。

### 证明思路（核心版本）

1. **应用 Cauchy 不等式**：对以 $0$ 为中心、半径 $R$ 的圆周 $C_R$，$f^{(n)}(0) \leq n! \|f\|_{C_R}/R^n$。
2. **取 $n = 1$**：$|f'(0)| \leq \|f\|_{C_R}/R$。
3. **令 $R \to \infty$**：因 $f$ 有界，$\|f\|_{C_R}$ 有界；故 $|f'(0)| \leq \|f\|/R \to 0$。得 $f'(0) = 0$。
4. **对任意 $z_0$**：将 $f(z) - f(z_0)$ 视为整函数应用 Liouville 定理，或由平移不变性，对任意 $z_0$ 有 $f'(z_0) = 0$。故 $f$ 为常数。

### 详细证明

#### 证明动机

Liouville 定理的关键在于全纯函数在无穷远处的「刚性」：若 $f$ 在全平面有界，则其导数在每点为零。直觉上，$f'$ 若在某些点非零，则 $f$ 在该点附近线性增长，无法在无穷远处保持有界。Cauchy 不等式将此直觉严格化——导数的增长受限于函数在圆周上的最大模除以半径。

#### 详细证明

设 $f$ 在 $\mathbb{C}$ 上全纯，$|f(z)| \leq M$ 对所有 $z \in \mathbb{C}$。对任意 $z_0 \in \mathbb{C}$，考虑以 $z_0$ 为中心、半径 $R > 0$ 的圆周 $C_R(z_0)$。由 [[cauchy-inequalities]]（Stein, Corollary 4.3, p.67），
$$
|f'(z_0)| \leq \frac{\|f\|_{C_R}}{R}.
$$

其中 $\|f\|_{C_R} = \sup_{z \in C_R(z_0)} |f(z)| \leq M$。故
$$
|f'(z_0)| \leq \frac{M}{R}.
$$

令 $R \to \infty$，得 $|f'(z_0)| = 0$，即 $f'(z_0) = 0$。因 $z_0$ 任意，故 $f' \equiv 0$，$f$ 为常数。 $\blacksquare$

### 代数基本定理的证明

设 $P(z) = a_n z^n + \cdots + a_0$（$a_n \neq 0$，$n \geq 1$）无根。则 $1/P(z)$ 在 $\mathbb{C}$ 上全纯。当 $|z| \to \infty$ 时，$|P(z)| \sim |a_n||z|^n \to \infty$，故 $1/P(z) \to 0$。特别地，$|1/P(z)|$ 在某圆 $|z| \geq R$ 外一致有界；在紧集 $\{|z| \leq R\}$ 上，$1/P$ 连续故有界。合并得 $1/P$ 在 $\mathbb{C}$ 上有界。由 Liouville 定理，$1/P$ 为常数，与 $n \geq 1$ 矛盾。故 $P$ 必有根。 $\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[cauchy-inequalities|Cauchy 不等式]]（Cauchy 积分公式的推论，Stein Corollary 4.3）⇒ $|f'(z_0)| \leq M/R$ ⇒ $R \to \infty$ 得 $f' \equiv 0$ ⇒ Liouville 定理」。代数基本定理的证明依赖本页 Liouville 定理本身（同页递进，非循环）与初等有界性论证（$|P(z)| \sim |a_n||z|^n$ + 紧集上连续）。本证明不依赖最大模原理、Jensen 公式等后续定理，依赖图无环。

## What-if — 反例与边界

### 典型例子

1. **有界整函数**：$\sin z$ 在 $\mathbb{C}$ 上**不**有界（因 $\sin(iy) = i\sinh(y) \to \infty$）。故 $\sin z$ 不满足 Liouville 定理条件。
2. **多项式**：$\sin$ 非多项式，但任何多项式 $P$（$n \geq 1$）无界，由 Liouville 定理的逆否命题自然成立。
3. **$e^z$**：整函数无界（沿实轴），不满足 Liouville 定理条件。

### 反例

1. **去掉有界条件**：任意非常数整函数必无界（否则由 Liouville 定理为常数）。
2. **去掉全平面全纯条件**：$f(z) = 1/z$ 在 $\mathbb{C} \setminus \{0\}$ 上全纯，且在 $1 < |z| < \infty$ 内有界（$|1/z| < 1$）。但 $1/z$ 不是整函数——Liouville 定理**不适用**。事实上 $1/z$ 在 $z = 0$ 处有极点。
3. **实类比**：$f(x) = \sin x$ 是 $C^\infty(\mathbb{R})$ 有界函数但非常数——实分析中无 Liouville 定理，全纯刚性独特。

### 边界情形

- **多项式增长**：Liouville 定理可推广：若 $|f(z)| \leq C(1+|z|)^n$ 则 $f$ 为 $\leq n$ 次多项式。证明：将 $g(z) = f(z)/(1+z)^{n+1}$ 应用 Liouville 定理（需分母分析）。
- **亚纯函数**：若 $f$ 在 $\mathbb{C}$ 上亚纯（允许极点）且有界，则 $f$ 为常数——极点数必须有限，且由辐角原理可推出无极点。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 基本版本（Stein Corollary 4.5） | 有界整 $\Rightarrow$ 常数 | $\mathbb{C}$ 上全纯 + 有界 |
| 2. 多项式增长版本 | $\|f\| \leq C(1+\|z\|)^n \Rightarrow$ $n$ 次多项式 | $\mathbb{C}$ 上全纯 |
| 3. 推广至调和函数 | 有界整调和函数 $\Rightarrow$ 常数 | $\mathbb{R}^d$ 上调和 |
| 4. 亚纯有界 | 亚纯有界 $\Rightarrow$ 常数 | $\mathbb{C}$ 上亚纯 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 基本版本 | Cauchy 不等式 + $R \to \infty$ | 低 |
| 多项式增长版本 | 构造 $g(z) = f(z)/(1+z)^{n+1}$ + Liouville | 中 |
| 调和函数推广 | 平均值性质 + 极值原理 | 中 |
| 代数基本定理 | Liouville + 反证 | 低 |

## 关联

- 概念：[[entire-function]]、[[holomorphic-function]]
- 定理：[[cauchy-integral-formula]]（前置，提供 Cauchy 不等式）、[[maximum-modulus-principle]]、[[jensen-formula]]、[[paley-wiener-theorem]]（与 Liouville 同源思想：边界控制内部）
- 方法：[[local-to-global|局部到整体原理]]、[[comparison-modulus|模的下界转化]]
- 应用：代数基本定理（Stein, Corollary 4.6）
- 源：[[steinComplexAnalysis]]（Ch. 2, Corollary 4.5, p.69）
