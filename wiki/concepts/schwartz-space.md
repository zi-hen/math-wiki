---
type: concept
title: Schwartz 空间
aliases: [Schwartz space, rapidly decreasing functions, test functions]
created: 2026-08-11
updated: 2026-08-11
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, real-analysis]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f \in C^\infty$ 且所有导数速降（强——要求无穷阶光滑与多项式衰减）；结论：Fourier 变换的自同构（强——$\mathcal{F}: \mathcal{S} \to \mathcal{S}$ 为连续双射）。Schwartz 空间是 Fourier 分析的核心函数类，连接光滑性与衰减性，是分布理论的基础。
---
# Schwartz 空间

> **工作空间**：$\mathbb{R}^d$（亦可定义于 $\mathbb{R}^n$ 或局部紧阿贝尔群）。Stein 在 Ch.5 §1 中严格定义。

## 定义

$\mathcal{S}(\mathbb{R}^d)$（Schwartz 空间）由所有满足下述条件的 $C^\infty$ 函数 $f: \mathbb{R}^d \to \mathbb{C}$ 构成：

$$
\sup_{x \in \mathbb{R}^d} |x^\alpha \partial^\beta f(x)| < \infty, \qquad \forall \alpha, \beta \in \mathbb{N}^d.
$$

其中 $\alpha$、$\beta$ 为多重指标。

直观解释：$f$ 与其所有导数**比多项式衰减得快**（rapid decrease）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5 §1.2, p. 132]]。

## 动机与背景

Schwartz 空间为 Fourier 变换提供理想的封闭函数类：

1. **Fourier 变换自身封闭**：若 $f \in \mathcal{S}$，则 $\hat{f} \in \mathcal{S}$（详见 [[fourier-transform]]）。
2. **Fourier 反演成立**：若 $f \in \mathcal{S}$，则 $f(x) = \int \hat{f}(\xi) e^{2\pi i \xi\cdot x} d\xi$。
3. **基本运算封闭**：平移、伸缩、卷积、微分、乘法均将 $\mathcal{S}$ 映为 $\mathcal{S}$。

## 性质

- **拓扑向量空间**：$\mathcal{S}$ 上可定义一族半范数 $\|f\|_{\alpha,\beta} = \sup_x |x^\alpha \partial^\beta f(x)|$ 构成 Fréchet 空间。
- **稠密性**：$\mathcal{S}$ 在 $L^p(\mathbb{R}^d)$ 中稠密（$1 \leq p < \infty$）。
- **包含关系**：$C_c^\infty(\mathbb{R}^d) \subsetneq \mathcal{S}(\mathbb{R}^d) \subsetneq L^p(\mathbb{R}^d)$（$1 \leq p < \infty$）。
- **包含 $C_c^\infty$**：紧支撑光滑函数类是 $\mathcal{S}$ 的稠密子集。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5 §1.2–§1.3]]。

## 关联

- 概念：[[fourier-transform]]（在 $\mathcal{S}$ 上 Fourier 变换是自同构）。
- 概念：[[lp-space]]（$\mathcal{S} \subset L^2$）。
- 概念：[[bump-function|bump 函数]]（$C_c^\infty$ 的非平凡元，$\mathcal{S}$ 的紧支集子类）。
- 定理：[[poisson-summation-formula]]（条件 $f \in \mathcal{S}$）。
- 引理：[[absolute-convergence-test]]（Schwartz 类衰减 ⇒ Fourier 反演所需绝对收敛）。

## 典型反例 / 边界

- $e^{-x^2/2} \in \mathcal{S}$：经典 Schwartz函数（高斯）。
- $e^{-x^2} \in \mathcal{S}$：衰减快于多项式。
- $\frac{1}{(1+x^2)^n}$（$n$ 足够大）$\in \mathcal{S}$。
- **不属于 $\mathcal{S}$**：
 - $e^{-|x|}$（衰减不够快，$\partial^k f$ 在 $\infty$ 不衰减）。
 - $\sin(x)/x$（非光滑）。
 - 多项式本身（无衰减）。

## 等价叙述

### 叙述 1（多重指标定义，Stein Ch.5）

> $f \in \mathcal{S}(\mathbb{R}^d)$ 当且仅当 $\sup_x |x^\alpha \partial^\beta f(x)| < \infty$ 对所有 $\alpha, \beta \in \mathbb{N}^d$。

### 叙述 2（积分等价条件）

> $f \in \mathcal{S}$ 当且仅当 $\int |x^\alpha \partial^\beta f(x)| dx < \infty$ 对所有 $\alpha, \beta$。

### 叙述 3（形式幂级数等价）

> $f \in \mathcal{S}$ 当且仅当 $f$ 及其 Fourier 变换 $\hat{f}$ 均光滑且快速衰减。

**等价关系**：叙述 1 ≡ 叙述 2（$L^\infty$ vs $L^1$ 范数差异）；叙述 3 等价于 1（经 Fourier 变换 $\mathcal{S} \to \mathcal{S}$ 自同构）。

## 证明难度差异

### 叙述 1（Stein 原始）的证明

- **方法**：直接用多重指标定义，验证基本运算封闭性。
- **难度**：**低**——Stein Ch.5 §1.2 即给出定义与基本性质。
- **代价**：仅适用 $\mathbb{R}^d$。

### 叙述 3（$\mathcal{S}$ 自同构）的证明

- **方法**：利用 $\widehat{x^\alpha f}$ 与 $\widehat{\partial^\beta f}$ 的封闭公式，证明 Fourier 变换是 $\mathcal{S} \to \mathcal{S}$ 的自同构。
- **难度**：**中**——Stein Ch.5 Theorem 1.5。
- **结论**：$\mathcal{S}$ 是 Fourier 变换的封闭函数类。

### 推广——广义函数（distributions）

- **方法**：将 $\mathcal{S}$ 上的连续线性泛函定义为广义函数。
- **难度**：**高**——需引入拓扑对偶空间 $\mathcal{S}'$。
- **结论**：Fourier 变换扩展为 $\mathcal{S}' \to \mathcal{S}'$ 的自同构。

**总评**：本 wiki 覆盖叙述 1 与 3；广义函数（叙述 4）属 Stein 后续卷。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 5 §1.2]]
- [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验）]]