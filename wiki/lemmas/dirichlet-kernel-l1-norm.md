---
type: lemma
title: Dirichlet 核的积分范数增长（$L_N \ge c\log N$）
aliases: [Dirichlet kernel L1 norm, L_N ≥ c log N]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.3, kernels]
---

# Dirichlet 核的积分范数增长（$L_N \ge c\log N$）

> **工作空间**：圆群 $\mathbb{T}$。

## 陈述

**Dirichlet 核** $D_N(\theta) = \sum_{k=-N}^{N}e^{ik\theta} = \dfrac{\sin((N+1/2)\theta)}{\sin(\theta/2)}$。其积分范数
$$
L_N = \frac{1}{2\pi}\int_{-\pi}^{\pi}|D_N(\theta)|\,d\theta
$$
满足：
$$
L_N \ge c\log N \quad (c > 0), \qquad \text{更精细地} \quad L_N = \frac{4}{\pi^2}\log N + O(1).
$$

**推论（Ch.3 Ex.2(b)）**：对每个 $n \ge 1$，存在连续函数 $f_n$，$|f_n| \le 1$，使 $|S_n(f_n)(0)| \ge c'\log n$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Exercise 2, p.83]]。

## 证明

**下界（$L_N \ge c\log N$）**。

*第一步（核的分母估计）*。对 $|\theta| \le \pi$，$|\sin(\theta/2)| \le |\theta|/2$，故
$$
|D_N(\theta)| \ge \frac{|\sin((N+1/2)\theta)|}{|\theta|/2} = \frac{2|\sin((N+1/2)\theta)|}{|\theta|}.
$$

*第二步（换元）*。由对称性取 $\theta \ge 0$，并令 $u = (N+1/2)\theta$：
$$
L_N \ge \frac{1}{2\pi}\cdot 2\int_0^{\pi}\frac{2|\sin((N+1/2)\theta)|}{\theta}\,d\theta
= \frac{2}{\pi}\int_0^{(N+1/2)\pi}\frac{|\sin u|}{u}\,du.
$$

*第三步（区间求和）*。$\int_0^{M\pi}\frac{|\sin u|}{u}\,du \ge \sum_{k=1}^{M-1}\int_{k\pi}^{(k+1)\pi}\frac{|\sin u|}{u}\,du \ge \sum_{k=1}^{M-1}\frac{1}{(k+1)\pi}\int_{k\pi}^{(k+1)\pi}|\sin u|\,du$。因 $\int_{k\pi}^{(k+1)\pi}|\sin u|\,du = 2$，
$$
L_N \ge \frac{2}{\pi}\cdot\frac{2}{\pi}\sum_{k=1}^{M-1}\frac{1}{k+1} \ge c\log M \ge c\log N,
$$
（$M = N + 1/2$，最后一步用调和级数的对数下界 $\sum_{k\le M}1/k \ge c\log M$）。$\blacksquare$

**更精细的估计（$L_N = \frac{4}{\pi^2}\log N + O(1)$）**。在第一步与第二步的反方向用 $\frac{1}{2}|\theta| \le |\sin(\theta/2)|$ 于 $|\theta|$ 远离 $\pi$ 处，且 $\int_{k\pi}^{(k+1)\pi}|\sin u|/u\,du = \frac{2}{(k+1/2)\pi} + O(1/k^2)$（中点估计），求和得 $\frac{4}{\pi^2}\sum_{k\le N}1/k + O(1) = \frac{4}{\pi^2}\log N + O(1)$。$\blacksquare$

**推论**。令 $g_n(\theta) = \operatorname{sgn}(D_n(\theta))$（仅有有限个跳跃间断的不连续函数）。由 Ch.2 Lemma 3.2 以连续函数 $h_k$（$|h_k| \le 1$）逼近 $g_n$ 于积分范数，使
$$
|S_n(h_k)(0) - S_n(g_n)(0)| = \left|\frac{1}{2\pi}\int (h_k - g_n)D_n\,d\theta\right| \le \frac{1}{2\pi}\int|h_k - g_n|\cdot|D_n|
$$
可控（$|D_n|$ 有界，$n$ 固定），而 $S_n(g_n)(0) = \frac{1}{2\pi}\int|D_n| = L_n \ge c\log n$，取 $k$ 充分大即得 $|S_n(h_k)(0)| \ge c'\log n$。$\blacksquare$

## 应用

- **Ch.3 §3 发散构造**：$L_N \to \infty$ 是「连续函数的 Fourier 级数在某点发散」这一经典反例的核心定量基础（部分和范数无界，Banach-Steinhaus / 均匀有界原理视角）。
- **Dirichlet 核不是好核**（[[good-kernel]]）：好核的 $L^1$ 范数有界，而 $L_N \to \infty$ 说明 $D_N$ 不属于好核——这是 Cesàro/Fejér 平均（[[cesaro-summation]]）取代部分和的动机。
- **Gibbs 现象**（[[gibbs-phenomenon]]）：$L_N \asymp \log N$ 的振荡结构是部分和过冲的来源之一。

## 关联

- 概念：[[good-kernel]]（$D_N$ 的范数无界性对照）、[[fourier-series]]、[[lp-space|$L^1$ 空间]]（范数的框架）
- 定理：[[gibbs-phenomenon]]、[[mean-square-convergence]]（$D_N$ 无界 vs 均方收敛成立）
- 方法：[[integral-truncation|积分分拆]]（$\int_{k\pi}^{(k+1)\pi}$ 的区间拆分）、[[integration-by-parts]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Exercise 2, p.83）
