---
type: exercise
title: Ch.5 Exercise 20: 采样定理
 aliases: [Ch.5 Ex.20, sampling theorem]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.5, signal-processing]
chapter: Ch.5
number: Ex.20
---

# Ch.5 Exercise 20：采样定理

## 陈述

> 设 $f \in \mathcal{S}(\mathbb{R})$（或更一般 $L^2(\mathbb{R})$），其 Fourier 变换 $\hat f$ 紧支于 $I = [-1/2, 1/2]$。证明：
> (a) 重建公式 $f(x) = \sum_{n \in \mathbb{Z}} f(n) K(x - n)$，其中 $K(y) = \sin(\pi y)/(\pi y)$。
> (b) Plancherel 等式 $\int |f(x)|^2 dx = \sum |f(n)|^2$。
> (c) 更细采样的重建公式：若 $\lambda > 1$，$K_\lambda(y) = \frac{\cos(\pi y) - \cos(\pi \lambda y)}{\pi^2 (\lambda - 1) y^2}$ 给出 $f(x) = \sum_n f(n/\lambda) K_\lambda(x - n/\lambda)$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 5, Exercise 20, p.184]]。

## 思路提示

(a) 取 $\chi_I$ 特征函数，由 Poisson 求和或直接 Fourier 计算得 $\hat f(\xi) = \chi_I(\xi) \sum f(n) e^{-2\pi i n \xi}$，然后 Fourier 逆变换。

## 解答

**(a) 重建公式**

设 $\chi_I$ 为 $I = [-1/2, 1/2]$ 的特征函数。Poisson 求和公式给出（对 $\hat f$ 本身）：
$$
\sum_{n \in \mathbb{Z}} \hat f(n) e^{2\pi i n \xi} = \sum_{n \in \mathbb{Z}} \hat f(\xi + n).
$$
当 $\hat f$ 紧支于 $I$，右端当 $\xi \notin I$ 时求和各项 $\hat f(\xi + n) = 0$；当 $\xi \in I$，$\hat f(\xi) = $ 该和。

故对 $\xi \in I$：$\hat f(\xi) = \chi_I(\xi) \sum_{n \in \mathbb{Z}} \hat f(n) e^{2\pi i n \xi}$。

由 $\widehat{\chi_I}(y) = K(y) = \sin(\pi y)/(\pi y)$（直接计算 Fourier 逆变换），Fourier 逆变换给出：
$$
f(x) = \sum_{n} \hat f(n) \cdot \widehat{\chi_I}(x - n) = \sum_n f(n) K(x - n). \qquad \blacksquare
$$

**(b) Plancherel**

由（a）右端是 $\sum_n f(n) K(x - n)$，Parseval（或直接 $\|f\|_2 = \|\hat f\|_2 = \int_I |\hat f|^2$，结合 $|I| = 1$ 与 $\sum |f(n)|^2 = \int |f|^2$ 通过 (a) 推出）。

**(c) 更细采样**

将 $\chi_I$ 替换为更细的特征函数（对 $\hat f$ 紧支 $I' = [-\lambda/2, \lambda/2]$）。其 Fourier 逆变换为 $K_\lambda$。直接 Fourier 计算给出：
$$
\widehat{K_\lambda}(y) = \text{indicator of } [-\lambda/2, \lambda/2].
$$

故
$$
f(x) = \int \hat f(\xi) \chi_{I'}(\xi) e^{2\pi i x \xi}\,d\xi = \sum_n f(n/\lambda) K_\lambda(x - n/\lambda). \qquad \blacksquare
$$

## 关联

- 概念：[[lp-space|$L^p$ 空间]]、[[schwartz-space|Schwartz 空间]]、[[character|特征标]]
- 定理：[[sampling-theorem]]（独立强化版）、[[fourier-inversion]]
- 方法：[[poisson-summation-formula]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5 Exercise 20）
