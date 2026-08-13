---
type: theorem
title: Fejér 定理
 aliases: [Fejér's theorem, Cesàro summability of Fourier series]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, convergence]
strength: strong
strength_basis: 条件：$f \in L^1(\mathbb{T})$ 或 $f$ 连续（弱条件）；结论：$f$ 的 Fourier 部分和的 Cesàro 平均一致收敛于 $f$（连续情形）或在连续点收敛（$L^1$ 情形）（强结论）。这是 Dirichlet 核不收敛情况下，用 Cesàro 求和恢复 Fourier 级数收敛性的关键。
---

# Fejér 定理

> **工作空间**：圆群 $\mathbb{T}$。Stein 在 Ch. 4 §5 Theorem 5.2 给出。

## What — 陈述

> 设 $f \in$ [[lp-space|$L^1(\mathbb{T})$]]（或 $f$ 在 $\mathbb{T}$ 上连续），部分和 $S_N(f)(\theta) = \sum_{|n|\le N} \hat f(n) e^{in\theta}$。定义 Cesàro 平均 $\sigma_N(f) = \frac{1}{N}(S_0 + \cdots + S_{N-1})$。则
> - 若 $f$ 在 $\theta_0$ 连续，则 $\sigma_N(f)(\theta_0) \to f(\theta_0)$。
> - 若 $f$ 连续，则收敛一致。
> - 若 $f$ 有 jump 不连续（$f(\theta_0+) = f(\theta_0-)$ 不等），则 $\sigma_N(f)(\theta_0) \to \frac{1}{2}(f(\theta_0+) + f(\theta_0-))$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 4, Theorem 5.2]]。

## Why — 动机与证明

### 动机

Dirichlet 核 $D_N$ **不**是好核（$L^1$ 范数无界，$\int |D_N| \ge c \log N$），故 Fourier 级数逐点收敛是微妙问题。Fejér 核 $F_N = \frac{1}{N}(D_0 + \cdots + D_{N-1})$ 是 Dirichlet 核的 Cesàro 平均，**是**好核——这是用 [[cesaro-summation]] 救 Fourier 级数收敛性的核心。

### 证明思路

定义 Cesàro 平均 $\sigma_N(f)(x) = (f * F_N)(x)$，其中
$$
F_N(x) = \frac{1}{N} \frac{\sin^2(Nx/2)}{\sin^2(x/2)}.
$$

由 [[approx-by-good-kernel|好核逼近]]定理，$f * F_N \to f$（在连续点）。关键：$F_N$ 验证好核三条件（[[good-kernel]]）。

### 详细证明

**Claim 1**（Fejér 核是好核）。设 $F_N(x) = \frac{1}{N} \frac{\sin^2(Nx/2)}{\sin^2(x/2)}$。
- (a) 单位质量：$\frac{1}{2\pi}\int F_N\,dx = 1$。
- (b) $L^1$ 有界：$\int |F_N| \leq (2\pi) \cdot \frac{1}{N} \cdot \sum_{k=0}^{N-1}(2k+1) \cdot \pi = O(1)$，或更精确估计 $\int F_N = \pi$。
- (c) 质量集中：固定 $\delta > 0$，$\int_{\delta \le |x| \le \pi} |F_N(x)|\,dx \to 0$，因 $|\sin(x/2)| \geq c_\delta > 0$ 在 $[\delta, \pi]$ 上，且 $\sin^2(Nx/2)$ 平均后衰减。

$\blacksquare$

**主证明**：由 [[good-kernel|好核]]定理（Ch. 2 Theorem 4.1，Stein），$f * F_N \to f$ 在 $f$ 连续点；若 $f$ 处处连续则一致收敛。

**跳跃点**：当 $f$ 在 $\theta_0$ 有 jump，$f * F_N(\theta_0) \to \frac{1}{2}(f(\theta_0+) + f(\theta_0-))$ 是标准好核定理的推广（参 [[riemann-localization]] 的同样论证）。

## What-if — 反例、等价叙述

### 等价叙述

#### 叙述 1（Stein Ch. 4 形式）
$f \in L^1(\mathbb{T})$ 在 $\theta_0$ 连续 ⇒ $\sigma_N(f)(\theta_0) \to f(\theta_0)$。

#### 叙述 2（Weierstrass 逼近）
$f$ 在 $\mathbb{T}$ 上连续 ⇒ 三角多项式一致逼近（Corollary 5.4）。

#### 叙述 3（$f * F_N$ 形式）
$\sigma_N(f)(x) = (f * F_N)(x)$，其中 $F_N$ 为 Fejér 核。

**等价关系**：三个叙述**iff**（直接互推）。

### 反例（条件不可削弱）

1. **Cesàro 不收敛蕴含 Fourier 不收敛**：若 $f$ 不连续，部分和 $S_N(f)(\theta_0)$ 可能不收敛；但 Cesàro 平均 $\sigma_N(f)$ 仍可收敛——这正是 Fejér 定理的意义。

## 相关习题

- [[ch2-ex15-weierstrass|Ch.2 Ex.15]]：$[a,b]$ 上三角多项式逼近是 Fejér 定理经变量替换的等价形式

## 应用

- **Weierstrass 三角多项式逼近**（Corollary 5.4）：连续函数被三角多项式一致逼近。
- **三角多项式逼近的应用**：实分析中代数多项式 / 三角多项式逼近统一框架。

## 关联

- 概念：[[good-kernel]]、[[cesaro-summation]]
- 定理：[[weierstrass-approximation-trig]]
- 方法：[[cesaro-summation]]、[[approx-by-good-kernel]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 4 §5）
