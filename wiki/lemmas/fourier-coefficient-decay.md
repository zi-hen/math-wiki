---
type: lemma
title: Fourier 系数的衰减（正则性 ⟹ 衰减）
aliases: [Fourier coefficient decay, 系数衰减, decay of Fourier coefficients]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.3, decay]
---

# Fourier 系数的衰减（正则性 ⟹ 衰减）

> **工作空间**：圆群 $\mathbb{T}$（亦适用 $\mathbb{R}$ 的 Fourier 变换版本）。

## 陈述

设 $f$ 为圆上的可积函数，$\hat f(n)$ 为其 [[fourier-coefficient|Fourier 系数]]。则：

| 条件 | 结论 | 来源 |
|------|------|------|
| (a) $f \in C^k$ | $\hat f(n) = o(|n|^{-k})$ | Ch.3 Ex.18(a) |
| (b) $f$ Lipschitz（$|f(x)-f(y)| \le K|x-y|$） | $\hat f(n) = O(1/|n|)$ | Ch.3 Ex.18(b) |
| (c) $f$ 有界单调 | $\hat f(n) = O(1/|n|)$ | Ch.3 Ex.17 / Ex.18(c) |
| (d) $f$ 满足 Hölder 阶 $\alpha \in (0,1)$ | $\hat f(n) = O(|n|^{-\alpha})$ | Ch.3 Ex.18(d) |
| (e) $f$ Riemann 可积 | $\sum_n|\hat f(n)|^2 < \infty$，故 $\hat f(n) = o(1)$ | Ch.3 Ex.18(e) / Parseval |

**反方向（慢衰减例子）**：连续函数的系数可以任意慢地趋于 $0$——见 [[ch3-ex18-slow-decay|Ch.3 Ex.18]] 的构造。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Exercises 17–18, p.110–111]]。

## 证明

**(a)** 分部积分 $k$ 次：$f \in C^k$ 时
$$
\hat f(n) = \frac{1}{2\pi}\int f^{(k)}(\theta)\frac{e^{-in\theta}}{(in)^k}\,d\theta,
$$
（边界项因周期性消失），故 $|\hat f(n)| \le \frac{1}{2\pi|n|^k}\int|f^{(k)}| = O(|n|^{-k})$；再由 [[riemann-lebesgue-lemma|Riemann-Lebesgue]] 应用于 $f^{(k)}$ 得 $o(|n|^{-k})$。$\blacksquare$

**(b)（差值技巧）** 由平移 $f(\theta + \pi/n)$ 的系数为 $e^{in\pi/n}\hat f(n) = -\hat f(n)$：
$$
\hat f(n) = \frac{1}{4\pi}\int_0^{2\pi}\bigl[f(\theta) - f(\theta+\pi/n)\bigr]e^{-in\theta}\,d\theta,
$$
（两式相加除 2）。取模并用 Lipschitz 条件：
$$
|\hat f(n)| \le \frac{1}{4\pi}\int K\frac{\pi}{n}\,d\theta = \frac{K\pi}{2n}.
$$
故 $\hat f(n) = O(1/|n|)$。$\blacksquare$

**(c)** 有界单调 $f$ 为有界变差。按 Ch.3 Ex.17：先对区间指示函数 $\chi_{[a,b]}$ 验证 $|\widehat{\chi_{[a,b]}}(n)| \le 2/|n|$（显式积分 $\int_a^b e^{-in\theta}d\theta$），再对 $\sum_k\alpha_k\chi_{[a_k,a_{k+1}]}$（$\alpha_k$ 单调、$|\alpha_k|\le M$）用分部求和得一致于 $N$ 的 $O(1/|n|)$ 界，最后以 Ch.2 Lemma 3.2 逼近一般单调函数。$\blacksquare$

**(d)** 同 (b) 的差值技巧，以 Hölder 条件 $|f(\theta)-f(\theta+\pi/n)| \le K(\pi/n)^\alpha$ 取代 Lipschitz 界：
$$
|\hat f(n)| \le \frac{1}{4\pi}\int K(\pi/n)^\alpha\,d\theta = O(|n|^{-\alpha}).
$$
$\blacksquare$

**(e)** 由 [[parseval-identity|Parseval 恒等式]]，$\sum_n|\hat f(n)|^2 = \frac{1}{2\pi}\int|f|^2 < \infty$（$f$ 可积故有界）；级数项趋于 $0$ 即 $\hat f(n) \to 0$（[[riemann-lebesgue-lemma|Riemann-Lebesgue]]）。$\blacksquare$

## 应用

- [[bernstein-theorem|Bernstein 定理]]：Hölder $\alpha > 1/2$ 时由二进块 $L^2$ 估计得 $\ell^1$ 可和——(d) 的逐项界 $O(|n|^{-\alpha})$ 对 $\alpha \le 1$ 不可和，故 Bernstein 需要更精细的块估计。
- [[riemann-lebesgue-lemma|Riemann-Lebesgue 引理]]：(e) 是其 Parseval 视角下的再证与改进（$\ell^2$ 可和）。
- [[ch3-ex18-slow-decay|Ch.3 Ex.18]]：慢衰减例子说明 (a)–(e) 的「衰减速率」已是最优——连续函数的系数可慢于任何给定速率。

## 关联

- 定理：[[riemann-lebesgue-lemma]]、[[parseval-identity]]、[[bernstein-theorem]]、[[mean-square-convergence]]
- 概念：[[fourier-coefficient|Fourier 系数]]、[[fourier-series]]、[[lp-space|$L^2$ 空间]]（(e) 的能量框架）、[[ellp-space|$\ell^2$ 序列空间]]（(e) 的能量可和性）
- 习题：[[ch3-ex18-slow-decay|Ch.3 Ex.18]]
- 方法：[[integration-by-parts|分部积分]]（(a)）、[[cesaro-summation]]（(c) 的 Abel 求和）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Exercises 17–18, p.110–111）
