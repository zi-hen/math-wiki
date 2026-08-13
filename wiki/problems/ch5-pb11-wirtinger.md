---
type: problem
title: Ch.5 Problem 11: Wirtinger / Poincaré 不等式
 aliases: [Ch.5 Problem 11, Wirtinger, Poincaré]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, inequality, Ch.5]
chapter: Ch.5
number: Problem 11
---

# Ch.5 Problem 11：Wirtinger / Poincaré 不等式（$\mathbb{R}$ 版）

## 陈述

> 证明以下不等式：
> (a) 若 $f \in C^1(\mathbb{R})$，$f$ 周期 $T$，$\int_0^T f = 0$，则 $\int |f|^2 \leq (T/2\pi)^2 \int |f'|^2$，等号当且仅当 $f$ 为基波。
> (b) 若 $f, g$ 为 $T$-周期，$\int f = 0$，$g \in C^1$，则 $\left|\int f g\right|^2 \leq (T/2\pi)^2 \int |f|^2 \int |g'|^2$。
> (c) 若 $f$ 在 $[a, b]$ 上 $C^1$，$f(a) = f(b) = 0$，则 $\int_a^b |f|^2 \leq (b-a)^2/\pi^2 \int |a^b |f'|^2$。
> (d) 等周不等式的扩展。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 5, Problem 11, p.108]]。

## 思路提示

(a) 由 [[parseval-identity|Parseval]] 立得。(b) Cauchy-Schwarz + (a) 取 $g$ 为 $f$ 的 Fourier 反演。(c) 反射为奇周期函数 + (a)。

## 解答

**(a) 周期情形**

由 [[parseval-identity|Parseval]]，
$$
\|f\|_2^2 = \sum_n |a_n|^2 = \sum_n \frac{(2\pi n/T)^2}{(2\pi n/T)^2} |a_n|^2 \le \left(\frac{T}{2\pi}\right)^2 \sum_n (2\pi n/T)^2 |a_n|^2 = \left(\frac{T}{2\pi}\right)^2 \|f'\|_2^2.
$$
（用 $\int f = 0 \Rightarrow a_0 = 0$。）

等号当且仅当 $|a_n| = 0$（$n \geq 2$），即 $f = a_1 e^{2\pi i t/T}$（基波）。

**(b) 内积估计**

由 [[cauchy-schwarz-inequality|Cauchy-Schwarz]] 与 (a)：
$$
\left|\int fg\right| \le \|f\|_2 \|g\|_2 \le \left(\frac{T}{2\pi}\right)\|f\|_2 \|g'\|_2.
$$

**(c) 区间情形**

将 $f$ 反射延拓为 $[a, b]$ 镜像到 $[b, 2b - a]$ 的奇函数，定义 $F$ 为 $[2(b-a)]$ 周期奇函数。则 $F$ 均值零，由 (a)：
$$
\int_a^b |f|^2 dx = \frac{1}{2}\int_a^{2b-a} |F|^2 dx \le \frac{1}{2}\left(\frac{2(b-a)}{2\pi}\right)^2 \int_a^{2b-a} |F'|^2 dx = \frac{(b-a)^2}{\pi^2} \int_a^b |f'|^2 dx.
$$

**(d) 等周不等式**

由 (a) 在 $[0, 2\pi]$ 上对 $x(t), y(t)$ 两个分量应用，与 [[isoperimetric-inequality|等周 Hurwitz 证明]]衔接。

$\blacksquare$

## 关联

- 定理：[[isoperimetric-inequality]]、[[wirtinger-inequality]]
- 方法：[[wirtinger-inequality]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5 Problem 11）
