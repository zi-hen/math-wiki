---
type: exercise
title: Ch.2 §5 Ex.15: Weierstrass 三角多项式逼近
 aliases: [Ch.2 Ex.15, Weierstrass 三角多项式证明]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.2, approximation]
chapter: Ch.2 §5
number: Ex.15
---

# Ch.2 §5 Ex.15：Weierstrass 三角多项式逼近

## 陈述

> 设 $f$ 是 $[a, b]$ 上的连续函数（$[a, b] \subset \mathbb{R}$，未必是圆群）。证明存在三角多项式 $P$ 满足 $\sup_{[a, b]} |f - P| < \varepsilon$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 2, Exercise 15, p.80]]。

## 思路提示

通过变量替换将 $[a, b]$ 上的实区间转化为 $\mathbb{T}$。由 [[fejer-theorem|Fejér 定理]]得结果。

## 解答

**步骤 1**：取线性映射 $\phi: [a, b] \to [-\pi, \pi]$，$\phi(t) = \pi \frac{2t - a - b}{b - a}$（将端点映到 $-\pi, \pi$）。定义 $g(\theta) = f(\phi^{-1}(\theta))$ 延拓为 $\mathbb{T}$ 上的连续函数。

**步骤 2**：由 [[fejer-theorem|Fejér 定理]]，存在三角多项式 $Q(\theta) = \sum_{|n|\le N} c_n e^{in\theta}$ 使 $\|g - Q\|_\infty < \varepsilon/2$。

**步骤 3**：回代 $P(t) = Q(\phi(t))$。$P$ 是 $[a, b]$ 上的三角多项式（因 $e^{in\phi(t)}$ 可展为 $t$ 的有限和代数多项式），且
$$
|f(t) - P(t)| = |g(\phi(t)) - Q(\phi(t))| < \varepsilon. \qquad \blacksquare
$$

## 关联

- 用到的定理：[[fejer-theorem]]
- 用到的方法：[[cesaro-summation]]
- 来源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 2 Exercise 15）
