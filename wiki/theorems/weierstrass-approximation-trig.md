---
type: theorem
title: Weierstrass 三角多项式逼近定理
 aliases: [Weierstrass trigonometric approximation, Weierstrass approximation]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [approximation, fourier-analysis]
strength: strong
strength_basis: 条件：$f$ 在圆群 $\mathbb{T}$ 上连续（弱条件——$C^0$ 即足）；结论：存在三角多项式 $P$ 一致逼近 $f$（强结论——$C^0$ 类可由三角多项式稠密逼近）。Stein Ch. 4 Corollary 5.4。
---

# Weierstrass 三角多项式逼近定理

> **工作空间**：圆群 $\mathbb{T}$ 上的连续函数空间 $C(\mathbb{T})$。Stein 在 Ch. 4 Corollary 5.4 给出。

## What — 陈述

> 设 $f \in C(\mathbb{T})$。则对任意 $\varepsilon > 0$，存在三角多项式
> $$P(\theta) = \sum_{|n| \le N} c_n e^{in\theta}$$
> 使 $\sup_\theta |f(\theta) - P(\theta)| < \varepsilon$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 4, Corollary 5.4]]。

## Why — 动机与证明

### 动机

Weierstrass 1885 的"任何连续函数可用多项式逼近"是分析学的奠基性结论。Stein Ch. 4 中给出 Fourier 框架下的版本：**圆群上的连续函数可用三角多项式一致逼近**——其证明由 [[fejer-theorem|Fejér 定理]]直接推论。

### 证明思路

由 [[fejer-theorem|Fejér 定理]]，$\sigma_N(f)$ 是三角多项式且一致收敛于 $f$。取 $N$ 充分大使 $\|f - \sigma_N(f)\|_\infty < \varepsilon$，得 $\sigma_N$ 即所求三角多项式。

### 详细证明

**第一阶段**：Fejér 平均 $\sigma_N(f)(\theta) = \sum_{|n| \le N-1} (1 - |n|/N) \hat f(n) e^{in\theta}$ 是三角多项式（最高频 $N-1$）。

**第二阶段**：取 $N$ 充分大，由 Fejér 定理 $\sup_\theta |f(\theta) - \sigma_N(f)(\theta)| < \varepsilon$。

$\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[fejer-theorem|Fejér 定理]]（Cesàro 平均 $\sigma_N(f)$ 一致收敛到 $f$，Stein Ch. 4 Theorem 5.2）⇒ 本页定理（Weierstrass 三角逼近）」。第一阶段仅用 Cesàro 平均的定义验证 $\sigma_N(f)$ 是三角多项式（最高频 $N-1$），无其他定理级依赖。本证明不依赖本页自身。依赖图无环。

## What-if — 反例、等价叙述

### 等价叙述

1. **多项式版**（Weierstrass 原版）：$[a, b]$ 上 $C^0$ 函数可由代数多项式一致逼近。证明与三角多项式版本完全不同（用 Bernstein 多项式）。
2. **三角多项式版**（Stein 形式）：$\mathbb{T}$ 上 $C^0$ 函数可由三角多项式一致逼近。
3. **Stone-Weierstrass**：紧 Hausdorff 空间 $X$ 上的 $C(X)$ 可由一族分离点且含常函数的子代数一致逼近（C*-代数视角）。

**等价关系**：Weierstrass 原版 + 三角多项式版**iff**（通过变量替换 $x = \cos\theta$ 互通），但**证明**截然不同。

### 反例

1. **不连续函数不可一致逼近**：不连续函数无法由连续函数（多项式 / 三角多项式）一致逼近——定理的"连续"假设不可去。
2. **[[lp-space|$L^1$]] 类函数无可点逼近**：Fejér 定理给出连续点逼近，但无一致逼近。

## 相关习题

- [[ch2-ex15-weierstrass|Ch.2 Ex.15]]：习题结论 = 定理（$\mathbb{T}$ 版）经 $\phi:[a,b]\to\mathbb{T}$ 替换的等价版本

## 应用

- **多项式逼近实分析**：代数多项式逼近（Bernstein 多项式法）
- **数值分析**：三角插值、Fourier 谱方法
- **量子力学的 Stone-von Neumann 定理**（更深层推广）

## 关联

- 定理：[[fejer-theorem]]
- 方法：[[cesaro-summation]]、[[approx-by-good-kernel]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 4 Corollary 5.4）
