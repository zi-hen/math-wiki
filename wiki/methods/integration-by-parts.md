---
type: method
title: 分部积分法
description: 用积分核的导数结构换取被积函数的光滑性——Fourier 系数/变换衰减阶（$C^k$ 改善）的连续版核心工具
aliases: [integration by parts, summation by parts, Abel summation, 两次分部积分, 分部求和]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a, steinComplexAnalysis]
status: unverified
tags: [fourier-analysis, complex-analysis, method, calculus]
strength: standard
strength_basis: 条件：被积函数可微且边界项消失（弱——只需 $f \in C^k$ 与周期性/衰减假设）；结论：将导数转移到积分核上，把对 $f$ 的光滑性转化为 Fourier 系数的衰减阶 $O(1/|n|^k)$（强——Riemann-Lebesgue 的 $C^k$ 改善、Heisenberg 中 Hermite 伴随计算等多个证明的核心步骤）。
---
# 分部积分法

> **工作空间**：圆群 $\mathbb{T}$（Fourier 级数）或实直线 $\mathbb{R}$（Fourier 变换）等具有可显式求导的积分核 $e^{-in\theta}$、$e^{-2\pi i\xi x}$ 的结构。

## 适用场景

- 由 $f$ 的光滑性推出 Fourier 系数/变换的衰减（Riemann-Lebesgue 引理的 $C^k$ 改善：$f \in C^k \Rightarrow \hat f(n) = o(|n|^{-k})$）；
- 需要将导数从难以处理的因子转移到可显式求积的核上（如 $e^{-in\theta}$、$e^{-2\pi i\xi x}$）；
- **两次分部积分**：当一次不足以获得所需衰减阶时（如 $f \in C^2(\mathbb{T}) \Rightarrow |\hat f(n)| \leq c/|n|^2$、Heisenberg 不确定性证明中的伴随计算）；
- **不适用**：边界项不消失时（周期函数自动消失；$\mathbb{R}$ 上须附加衰减假设）。

## 关键思想

分部积分把恒等式 $\int u\,dv = uv - \int v\,du$ 反用为「求积技巧」：对 Fourier 系数
$$
\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi} f(\theta)\, e^{-in\theta}\, d\theta,
$$
把导数作用到 $f$ 上，核 $e^{-in\theta}$ 吸收因子 $in$。$f$ 有 $k$ 阶导数 ⇒ 系数获得 $O(|n|^{-k})$ 衰减；「两次分部积分」即连续应用两次，把二阶导数转移到核上。技巧本身无真假；所用恒等式与核的结构见 [[fourier-coefficient|Fourier 系数]]。其离散类比是 Abel 求和（分部求和），见下文「离散形式」小节。

## 离散形式（Abel 求和 / 分部求和）

> **工作空间**：复数序列 $\{a_n\}$、$\{b_n\}$，通常 $b_n \to 0$ 单调。
**恒等式**：设 $A_N = \sum_{n=1}^N a_n$（$A_0 = 0$），则
$$
\sum_{n=M}^{N} a_n b_n = A_N b_N - A_{M-1} b_M + \sum_{n=M}^{N-1} A_n (b_n - b_{n+1}).
$$

**等价形式**（以 $\{b_n\}$ 的部分和 $B_k = \sum_{n=1}^k b_n$ 表达、对 $a$ 取差分）：
$$
\sum_{n=M}^N a_n b_n = a_N B_N - a_{M} B_{M-1} - \sum_{n=M}^{N-1} (a_{n+1} - a_n) B_n.
$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 3, Exercise 7a, p.77]]。

**证明（简要）**：写 $a_n = A_n - A_{n-1}$，交换求和顺序：
$$
\sum_{n=M}^N a_n b_n = \sum_{n=M}^N (A_n - A_{n-1}) b_n = A_N b_N - A_{M-1} b_M + \sum_{n=M}^{N-1} A_n (b_n - b_{n+1}).
$$
$\blacksquare$

**Dirichlet 判别法**：若 $\{B_n\}$ 有界且 $\{a_n\}$ 单调趋于 $0$，则 $\sum a_n b_n$ 收敛。

### 离散形式的应用

- **Dirichlet 判别法**：证明 $\sum \sin(n\theta)/n$ 收敛（Ch. 3 Exercise 7 推论）；
- **判别 $\sum a_n$ 收敛性**：Dirichlet 与 Abel 判别法；
- **$\sum_{n} a_n / n^s$ 收敛分析**（Ch. 8 Dirichlet 定理）；
- **Riemann-Lebesgue 引理的光滑性改善版**：$f \in C^k \Rightarrow \hat f(n) = o(|n|^{-k})$ 的核心工具（详见 [[riemann-lebesgue-lemma]]）——分部积分的离散类比。

## 步骤（可选）

1. 写出 $\int f(\theta) e^{-in\theta}\,d\theta$，取 $u = f(\theta)$，$dv = e^{-in\theta}\,d\theta$；
2. 分部积分一次，边界项由周期性（或 $\mathbb{R}$ 上的衰减假设）消失；
3. 核的导数给出因子 $in$；若需更高阶，重复直至导数次数足够；
4. 估计剩余积分（由 $f^{(k)}$ 有界/可积给出）。

## 陷阱

- **边界项不消失**：$f$ 在端点不连续（如锯齿波）时分部积分失败，需先正则化；
- 分部积分不改变被积函数的支集/周期性问题；
- 仅当核可显式求导时有效——核是 $e^{\pm in\theta}$、$e^{\pm 2\pi i\xi x}$ 的情形。

## 实例

- 在 [[riemann-lebesgue-lemma]] 中：叙述 4（$C^k$ 改善）——连续版核心工具；
- 在 [[ch5-problem-1-psf-without-schwartz]] 中：第一步由 $f' \in L^1(\mathbb{R})$ 分部积分；
- 在 [[ch5-ex23-heisenberg]] 中：(a) 直接做**两次分部积分**；
- 在 [[cauchy-theorem]] 中：$\int z\,dz = \frac{1}{2}z^2\big|$（闭曲线）的技术性恒等。

## 相关命题

- 依据 [[fourier-coefficient|Fourier 系数]]：系数定义与积分核 $e^{-in\theta}$ 的结构；
- 离散类比（Abel 求和恒等式，$f \in C^k$ 的级数版本）见本页「离散形式（Abel 求和 / 分部求和）」小节。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 3, §3]]
- [[steinComplexAnalysis|Stein & Shakarchi (2003), 《Complex Analysis》, Ch. 1, §2]]
