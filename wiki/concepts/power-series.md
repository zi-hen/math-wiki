---
type: concept
title: 幂级数
aliases: [power series]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, power-series]
strength: standard
strength_basis: 条件：$\sum a_n (z - z_0)^n$（弱——系数任意）；结论：在收敛圆盘内自动全纯且无穷可微，导数仍为幂级数（强）。
---
# 幂级数

> **工作空间**：复平面 $\mathbb{C}$（开子集 $\Omega$ 内的幂级数）。

## What — 定义与基本事实

### 定义

形如
$$
f(z) = \sum_{n=0}^{\infty} a_n (z - z_0)^n, \qquad a_n, z_0 \in \mathbb{C}
$$
的级数称为以 $z_0$ 为中心的幂级数。

### 收敛半径（Hadamard 公式）

对任意幂级数 $\sum a_n z^n$，存在 $0 \leq R \leq \infty$（**收敛半径**）使得：
1. 当 $|z| < R$ 时级数绝对收敛；
2. 当 $|z| > R$ 时级数发散。

$Hadamard$ 公式给出
$$
\frac{1}{R} = \limsup_{n \to \infty} |a_n|^{1/n}.
$$

约定 $1/0 = \infty$, $1/\infty = 0$。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 1, Theorem 2.5, p.34]]。

### 关键定理（Stein, Theorem 2.6）

幂级数 $\sum a_n z^n$ 在其收敛圆盘 $\{z : |z| < R\}$ 内：
1. 定义全纯函数 $f$；
2. 导数仍为幂级数 $f'(z) = \sum_{n=1}^{\infty} n a_n z^{n-1}$；
3. $f'$ 与 $f$ 有相同的收敛半径 $R$。

由此推论（Stein, Corollary 2.7, p.37）：幂级数在其收敛圆盘内无穷次复可微，高阶导数亦为幂级数。

### 典型例子

| 幂级数 | 收敛半径 | 性质 |
|--------|---------|------|
| $\sum z^n / n!$（指数函数） | $\infty$ | 整函数，$(e^z)' = e^z$ |
| $\sum z^n$（几何级数） | $1$ | 当 $\lvert z\rvert < 1$ 时 $1/(1-z)$ |
| $\sum (-1)^n z^{2n}/(2n)!$（$\cos z$） | $\infty$ | 整函数 |
| $\sum (-1)^n z^{2n+1}/(2n+1)!$（$\sin z$） | $\infty$ | 整函数 |
| $\sum z^n$ 在 $\|z\| < 1$ 内全纯 | $1$ | 收敛圆周上点态行为取决于方向 |

## Why — 动机与直观

### 为什么引入幂级数？

幂级数是全纯函数的「坐标表示」：

1. **存在性**：每个全纯函数在每点邻域有幂级数展开（[[steinComplexAnalysis|Stein, Ch. 2, Theorem 4.4, p.68]]）。这是 [[holomorphic-function|全纯函数]]自动解析的核心定理。
2. **分析便利性**：幂级数的收敛半径、系数给出函数增长的精确信息（如 Hadamard 公式）。
3. **计算可行性**：幂级数可逐项微分、积分，便于具体计算（[[steinComplexAnalysis|Stein, p.74]]）。

### 直观解释

幂级数在收敛圆盘内具有「自相似性」：导数仍为幂级数、积分仍为幂级数。这与全纯函数的刚性（无穷可微）相互印证——幂级数即全纯函数的「局部 Fourier 展开」。

## What-if — 反例与边界

### 等价叙述

幂级数的收敛行为有多种刻画：

| 叙述 | 公式 | 来源 |
|------|------|------|
| Hadamard 公式 | $1/R = \limsup \lvert a_n\rvert^{1/n}$ | Stein Theorem 2.5 |
| 比值判别法（特例） | $R = \lim \lvert a_n\rvert/\lvert a_{n+1}\rvert$ | Cauchy-Hadamard |
| Cauchy 根值判别法 | $\sum \lvert a_n\rvert r^n$ 在 $r < R$ 收敛 | Stein Theorem 2.5 |

### 反例

1. **收敛圆周上的发散点**：$\sum z^n$ 在 $|z| < 1$ 收敛，但 $z = 1$ 处发散。Stein, p.34 指出：收敛半径不依赖于收敛圆周上的行为。
2. **导数与原函数同半径，但可去奇点**：若 $f(z) = \sum a_n z^n$ 在 $|z| < R$ 内收敛，则 $f'$ 也在 $|z| < R$ 内收敛。然而若 $f$ 可全纯延拓至更大的圆盘（如 $f(z) = \sum z^n / n^2$ 在 $|z| \leq 1$ 内连续可微），$f'$ 不必能延拓至同一区域。

### 边界情形

- **$R = 0$**：级数仅在 $z = z_0$ 处收敛（如 $\sum n! z^n$）。
- **$R = \infty$**：级数对所有 $z \in \mathbb{C}$ 收敛——定义整函数（[[entire-function]]）。
- **收敛圆周上的点态行为**：Stein, p.34 指出，幂级数在收敛圆周上的收敛/发散性**不**由收敛半径决定。这是经典的边界现象。

## 关联

- 概念：[[holomorphic-function]]、[[entire-function]]、[[order-of-growth]]
- 定理：[[hadamard-formula]]（Stein, Theorem 2.5）、[[cauchy-integral-formula]]、[[weierstrass-product-theorem]]
- 引用本概念的工具：[[cauchy-inequalities]]（幂级数系数增长控制）
- 源：[[steinComplexAnalysis]]（Ch. 1, §2, p.33–37）
