---
type: concept
title: Fourier 系数
aliases: [Fourier coefficient, 傅里叶系数]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, fourier-coefficients]
strength: standard
strength_basis: 条件：$f$ 在圆群 $\mathbb{T} = [-\pi, \pi]$ 上 Riemann 可积（弱）；结论：可计算一系列系数 $\{\hat{f}(n)\}_{n \in \mathbb{Z}} \subset \mathbb{C}$。Fourier 系数是 Fourier 分析的基础对象，连接函数与其频率分解；平滑性与衰减率对应（$f \in C^k \Rightarrow \hat{f}(n) = O(|n|^{-k})$）。
---

# Fourier 系数

> **工作空间**：圆群 $\mathbb{T} = [-\pi, \pi]$ 或 $\mathbb{R}$。Stein 在 Ch. 2 §1 显式定义（圆群），Ch. 5 推广到 $\mathbb{R}$（演变为 Fourier 变换 $\hat{f}(\xi)$）。

## What — 定义与基本事实

### 定义（圆群，Stein 约定）

设 $f$ 在 $[-\pi, \pi]$ 上 Riemann 可积（或 $\hat{f} \in L^1$ 框架），$f$ 的**第 $n$ 个 Fourier 系数**定义为
$$
\hat{f}(n) = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(\theta)\,e^{-in\theta}\,d\theta, \qquad n \in \mathbb{Z}.
$$

（Stein Ch. 2–4 约定。）

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 2, §1.2, p.51]]。

### 基本性质

1. **线性性**：$\widehat{af + bg} = a\hat{f} + b\hat{g}$。
2. **Parseval**：$\sum_{n} |\hat{f}(n)|^2 = \int |f|^2$（若 $f \in L^2$）。见 [[parseval-identity]]。
3. **Riemann-Lebesgue**：$\hat{f}(n) \to 0$（$|n| \to \infty$）。见 [[riemann-lebesgue-lemma]]。
4. **衰减-光滑性对应**：$f \in C^k \Rightarrow \hat{f}(n) = O(|n|^{-k})$。
5. **求导公式**：$\widehat{f'}(n) = in\,\hat{f}(n)$（若 $f$ 可微）。

### $\mathbb{R}$ 版（Fourier 变换在离散点采样）

设 $f \in L^1(\mathbb{R})$，则 $f$ 的 Fourier 变换 $\hat{f}(\xi)$ 在每个 $\xi \in \mathbb{R}$ 上有定义，$\hat{f}(n)$（$n \in \mathbb{Z}$）即是 $\hat{f}$ 在整数点的采样。

**约定关系**（Stein）：
$$
\hat{f}(\xi) = \int_{\mathbb{R}} f(x)\,e^{-2\pi i \xi x}\,dx,\qquad \hat{f}(n) = \int f(x)\,e^{-2\pi i n x}\,dx.
$$

$\mathbb{R}$ 形式与圆群形式在约定上**截然不同**：圆群核为 $e^{-in\theta}$（无 $2\pi$），$\mathbb{R}$ 核为 $e^{-2\pi i \xi x}$。

## Why — 动机与直观

### 为什么引入 Fourier 系数？

Fourier 系数将函数（连续对象）分解为可数序列 $\{\hat{f}(n)\}_{n \in \mathbb{Z}}$——把无限维函数空间"降维"到序列空间。这是经典调和分析的核心降维技巧。

## What-if — 反例、等价叙述

### 反例

1. **Fourier 系数衰减可任意慢**：Ch. 3 Exercise 18 构造连续函数使 $|\hat{f}(n)| \geq \epsilon_n$ 对任意给定的趋零序列 $\{\epsilon_n\}$。说明 Riemann-Lebesgue 的"衰减"是充分弱的下界。

### 等价叙述

#### 叙述 1（圆群，Stein Ch.2）
$f \in L^1(\mathbb{T}) \Rightarrow \hat{f}(n) = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(\theta) e^{-in\theta} d\theta$。

#### 叙述 2（$[0,1]$ 周期，Ch. 2 等价形式）
$f \in L^1([0,1])$，$\hat{f}(n) = \int_0^1 f(\theta) e^{-2\pi i n \theta} d\theta$（带 $2\pi$，与 $2\pi$-周期核一致）。

#### 叙述 3（$\mathbb{Z}(N)$ 上的离散 Fourier 系数）
$f: \mathbb{Z}(N) \to \mathbb{C}$，$\hat{f}(k) = \frac{1}{N} \sum_{n=0}^{N-1} f(n) e^{-2\pi i k n / N}$（参 [[character]] 与 Finite Fourier Analysis）。

#### 叙述 4（$\mathbb{R}$ 上的 Fourier 变换采样）
$f \in \mathcal{S}(\mathbb{R})$，$\hat{f}(n) = \int f(x) e^{-2\pi i n x} dx$。与圆群叙述的关系：当 $f$ 周期为 1 时，$\hat{f}(n) = \hat{f}|_{\xi=n}$ 一致——这是 [[poisson-summation-formula]] 的核心。

**等价关系**：叙述 1 严格等价叙述 2（变量替换 $\theta \to 2\pi\theta$）；叙述 3 是叙述 2 的离散化（$N$ 点采样）；叙述 4 是叙述 1 / 2 的连续版（Stein Fourier 变换）。各形式的等价 iff 由变量替换给出。

## 关联

- 概念：[[fourier-series]]（圆群 Fourier 级数）、[[fourier-transform]]（$\mathbb{R}$ Fourier 变换）
- 定理：[[parseval-identity]]、[[riemann-lebesgue-lemma]]
- 引理：[[integer-periodicity-of-exponential]]（Poisson 求和中的 Fourier 系数计算）、[[mean-value-property-holomorphic]]（全纯 Fourier 系数的对偶）、[[rolle-mean-value-theorem]]（Lipschitz 估计 $\hat f(n) = O(1/|n|)$）、[[residue-by-taylor-coeff]]（Laurent 系数与 Fourier 系数的对应）
- 概念：[[fourier-coefficient-holomorphic]]（圆周全纯函数 Fourier 系数——Stein Ch. 3 Thm 7.1 负频率消失）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 2 §1.2）
