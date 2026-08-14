---
type: concept
title: Fourier 级数
aliases: [Fourier series, 傅里叶级数]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis]
strength: standard
strength_basis: 条件：$f \in L^1(\mathbb{T})$（弱条件——Riemann 可积即可定义系数）；结论：频率分解 $f \sim \sum_{n \in \mathbb{Z}} \hat f(n) e^{2\pi i n x}$（标准结论——分解本身为形式级数，收敛性由 Fejér 定理与逐点收敛定理补充）。
description: Fourier 级数——周期函数的频率分解（Stein 约定 $e^{2\pi i n x}$）
---

# Fourier 级数

> **工作空间**：圆群 $\mathbb{T}$（等价地，$[0,1]$ 上周期 $1$ 的函数）。Stein 在 Ch. 1–4 处理。

## What — 定义与基本事实

### 定义（Stein 约定）

设 $f \in$ [[lp-space|$L^1(\mathbb{T})$]]（周期 $1$），$f$ 的 **Fourier 级数**是如下形式三角级数：
$$
f(x) \sim \sum_{n \in \mathbb{Z}} \hat f(n)\, e^{2\pi i n x},
$$
其中第 $n$ 个 [[fourier-coefficient|Fourier 系数]] 为
$$
\hat f(n) = \int_0^1 f(x)\, e^{-2\pi i n x}\, dx, \qquad n \in \mathbb{Z}.
$$

记 $\sim$ 而非 $=$：右侧是**形式级数**，其收敛性是需要单独建立的事实（见下）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 2, §1.2, p.51]]（圆群 Fourier 系数定义）与 [[fourier-analysis-zh-notes|笔记 §1.1]]（$[0,1]$ 归一化约定）。

### 基本性质

1. **部分和 = 与 Dirichlet 核的卷积**：$S_N(f)(x) = \sum_{|n| \le N} \hat f(n) e^{2\pi i n x} = (f * D_N)(x)$，其中 $D_N$ 为 Dirichlet 核（Ch. 2, p.46）。详见 [Claim 1](#详细证明核心代数性质)。
2. **卷积的 Fourier 系数**：$\widehat{f * g}(n) = \hat f(n)\hat g(n)$（Ch. 2, Proposition 3.1）。详见 [Claim 2](#详细证明核心代数性质)。
3. **均方收敛**：$\|f - S_N(f)\|_{L^2} \to 0$（$f \in L^2$，Ch. 3, Theorem 1.1）。见 [[mean-square-convergence|均方收敛定理]]。
4. **Parseval 恒等式**：$\sum_{n \in \mathbb{Z}} |\hat f(n)|^2 = \int_0^1 |f(x)|^2\, dx$（Ch. 3, Theorem 1.3）。见 [[parseval-identity]]。
5. **Riemann–Lebesgue 引理**：$\hat f(n) \to 0$（$|n| \to \infty$，Ch. 3, Theorem 1.4）。见 [[riemann-lebesgue-lemma]]。
6. **逐点收敛**：若 $f$ 在 $x_0$ 可微，则 $S_N(f)(x_0) \to f(x_0)$（Ch. 3, Theorem 2.1）。证明用 [fourier-coefficient|求导公式]] + 分部积分.
7. **Riemann 局部化**：$f$ 与 $g$ 在 $x_0$ 邻域相等 ⇒ $S_N(f)(x_0) = S_N(g)(x_0) + o(1)$（Ch. 3, Theorem 2.2）。见 [[riemann-localization]]。
8. **光滑性–衰减对应**：$f \in C^k \Rightarrow \hat f(n) = O(|n|^{-k})$（[[fourier-coefficient]] 页性质 4 + [Claim 3](#详细证明核心代数性质)）。

#### 详细证明（核心代数性质）

以下逐条证明 [[parseval-identity|Parseval]] 与 [[fourier-inversion|Fourier 反演]]（圆群版）证明链所依赖的基本性质, 仅依赖 Fourier 系数定义与积分换元, **不依赖 Fourier 反演或 Parseval 本身**.

**Claim 1**（部分和 = Dirichlet 卷积）. $S_N(f)(x) = (f * D_N)(x)$, 其中 Dirichlet 核 $D_N(x) = \sum_{|n| \le N} e^{2\pi i n x}$.

*证明.* 由 Fourier 系数定义:
$$
S_N(f)(x) = \sum_{|n| \le N} \hat f(n)\, e^{2\pi i n x} = \sum_{|n| \le N} \left(\int_0^1 f(y) e^{-2\pi i n y}\, dy\right) e^{2\pi i n x}.
$$
交换有限和与积分（合法, 因有限项）:
$$
= \int_0^1 f(y) \sum_{|n| \le N} e^{2\pi i n (x - y)}\, dy = \int_0^1 f(y) D_N(x - y)\, dy = (f * D_N)(x). \qquad\blacksquare
$$

**Claim 2**（卷积的 Fourier 系数 = 乘积, Ch. 2 Proposition 3.1）. 对 $f, g \in L^1(\mathbb T)$, $f * g \in L^1(\mathbb T)$ 且 $\widehat{f * g}(n) = \hat f(n) \hat g(n)$.

*证明.* 由 Fourier 系数定义 + Fubini（$|f(x - y)g(y)| \in L^1$ 因 $f, g \in L^1$）:
$$
\widehat{f * g}(n) = \int_0^1 \left(\int_0^1 f(x - y) g(y)\, dy\right) e^{-2\pi i n x}\, dx = \int_0^1 g(y)\left(\int_0^1 f(x - y) e^{-2\pi i n x}\, dx\right) dy.
$$
对内层积分作换元 $z = x - y$（$dz = dx$, 区间 $[0, 1]$ 经周期延拓等价于 $[-y, 1 - y]$, 由 $D_N$ 周期性回到 $[0, 1]$）:
$$
\int_0^1 f(x - y) e^{-2\pi i n x}\, dx = \int_0^1 f(z) e^{-2\pi i n (z + y)}\, dz = e^{-2\pi i n y} \hat f(n).
$$
故 $\widehat{f * g}(n) = \hat f(n) \int_0^1 g(y) e^{-2\pi i n y}\, dy = \hat f(n) \hat g(n)$. $\blacksquare$

> **附注**: 上述证明仅依赖 Fourier 系数定义与积分换元 + Fubini, **不依赖 Fourier 反演**. Parseval 证明与均方收敛（[[mean-square-convergence]]）用 Claim 1, 2 把 Fourier 部分和写为 Dirichlet 卷积形式.

### 典型例子

1. **Dirichlet 核**：$D_N(x) = \sum_{|n| \le N} e^{2\pi i n x}$，是部分和 $S_N(f) = f * D_N$ 的积分核。
2. **Fejér 核**：$F_N(x) = \frac{1}{N} \frac{\sin^2(Nx/2)}{\sin^2(x/2)}$，是 Dirichlet 核的 Cesàro 平均，构成 [[good-kernel|好核]]（[[fejer-theorem]]）。
3. **du Bois-Reymond 反例**：存在连续函数，其 Fourier 级数部分和在某点发散——逐点收敛须额外条件（依据 [[fourier-analysis-zh-notes|笔记 §1.1]]）。

## Why — 动机与直观

### 为什么引入 Fourier 级数？

物理动机来自弦振动与热传导：分离变量法（[[separation-of-variables]]）把波动方程化为基本振荡模式 $e_n(x) = e^{2\pi i n x}$（$n \in \mathbb{Z}$）的叠加。Fourier 的核心思想是「任何函数都可写成最基础三角函数（可能无限）的线性组合」（Ch. 1, p.31）。Fourier 级数把函数（连续对象）化为系数序列 $\{\hat f(n)\}$（可数对象），是调和分析最基础的分解工具。

### 直观解释

$\mathbb{T}$ 上的函数 = 各频率 $n \in \mathbb{Z}$ 上振幅 $\hat f(n)$ 的叠加。光滑性对应高频衰减（$O(|n|^{-k})$）：越光滑的函数，其高频分量越小。

## What-if — 反例与边界

### 反例

1. **连续函数部分和发散**（du Bois-Reymond）：连续性不足以保证部分和 $S_N(f)$ 逐点收敛；改用 Cesàro 平均 $\sigma_N(f)$（[[cesaro-summation]]）后由 [[fejer-theorem|Fejér 定理]] 得一致收敛。
2. **Dirichlet 核不是好核**：$\|D_N\|_{L^1} \ge c \log N$ 无界，故逐点收敛问题微妙（Ch. 2, p.46–47）；Fejér 核弥补了这一点（[[good-kernel]]）。

### 边界情形

若 $f$ 在 $x_0$ 有跳跃间断，则 Fejér 平均收敛到 $\frac{1}{2}(f(x_0+) + f(x_0-))$（见 [[fejer-theorem]]）。

### 等价叙述

1. **$[-\pi,\pi]$ 约定**（Stein 正文，Ch. 2–4）：$\hat f(n) = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(\theta)\, e^{-in\theta}\, d\theta$，级数为 $\sum \hat f(n) e^{in\theta}$。
2. **$[0,1]$ 归一化约定**（本页采用，笔记 §1.1）：$\hat f(n) = \int_0^1 f(x)\, e^{-2\pi i n x}\, dx$，级数为 $\sum \hat f(n) e^{2\pi i n x}$。
3. **离散版（有限 Fourier 分析）**：$\mathbb{Z}(N)$ 上 $\hat f(k) = \frac{1}{N} \sum_{n=0}^{N-1} f(n) e^{-2\pi i k n / N}$（见 [[finite-abelian-group]]）。

**等价关系**：叙述 1 与叙述 2 相差变量替换 $\theta = 2\pi x$；叙述 3 是叙述 2 的 $N$ 点离散化。

## 关联

- 概念：[[fourier-coefficient]]、[[fourier-transform]]（$\mathbb{R}$ 上的对应物）、[[character]]（$e_n(x) = e^{2\pi i n x}$ 是 $\mathbb{T}$ 上的字符）、[[good-kernel]]、[[lp-space|$L^1$ / $L^2$]]
- 定理：[[fejer-theorem]]、[[parseval-identity]]、[[riemann-lebesgue-lemma]]、[[riemann-localization]]、[[weierstrass-approximation-trig]]、[[fourier-inversion]]（圆群版）、[[poisson-summation-formula]]（周期化视角）
- 方法：[[cesaro-summation]]、[[separation-of-variables]]、[[orthogonal-best-approximation]]（$S_N(f)$ 的最优逼近性）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 1–4）、[[fourier-analysis-zh-notes]]（笔记 §1.1）

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 1–4]]
- [[fourier-analysis-zh-notes|Fourier 分析中文笔记 §1.1（圆群场景）]]