---
type: exercise
title: Ch.7 Exercise 8: 有限采样重建（三角多项式插值）
aliases: [Ch.7 Ex.8, finite reconstruction, trig interpolation]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [number-theory, fourier-analysis, Ch.7]
chapter: Ch.7
number: Ex.8
---

# Ch.7 Exercise 8：有限采样重建（三角多项式插值）

## 陈述

> 设 $P(x) = \sum_{n=1}^N a_n e^{2\pi i n x}$ 为次数 $\le N$ 的三角多项式。
> (a) 用圆群与 $\mathbb{Z}(N)$ 的 Parseval 恒等式证明
> $$
> \int_0^1 |P(x)|^2\,dx = \frac{1}{N}\sum_{j=1}^N |P(j/N)|^2.
> $$
> (b) 证明重建公式
> $$
> P(x) = \sum_{j=1}^N P(j/N)\,K(x - j/N),
> $$
> 其中
> $$
> K(x) = \frac{e^{2\pi i x}}{N}\cdot\frac{1 - e^{2\pi i N x}}{1 - e^{2\pi i x}} = \frac{1}{N}\left(e^{2\pi i x} + e^{2\pi i\cdot 2x} + \cdots + e^{2\pi i N x}\right).
> $$
> 特别地，$P$ 由 $N$ 个采样值 $P(j/N)$（$1 \le j \le N$）完全确定；$K(0) = 1$，且 $K(j/N) = 0$（$j$ 不整除 $N$ 时）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 7, Exercise 8, p.255]]。

## 解答

**步骤 1（$\mathbb{Z}(N)$ 上的 Parseval）**。记 $\mathbf{p} = (P(j/N))_{j=1}^N \in \mathbb{C}^N$，其 $\mathbb{Z}(N)$-Fourier 系数
$$
\widehat{\mathbf{p}}(k) = \frac{1}{N}\sum_{j=1}^N P(j/N)\,e^{-2\pi i k j/N}.
$$
代入 $P(j/N) = \sum_n a_n e^{2\pi i n j/N}$：
$$
\widehat{\mathbf{p}}(k) = \sum_n a_n\cdot\frac{1}{N}\sum_{j=1}^N e^{2\pi i (n-k)j/N} = a_k,
$$
（因 $n, k \in \{1,\ldots,N\}$ 时 $\frac{1}{N}\sum_j e^{2\pi i(n-k)j/N} = \delta_{n,k}$）。由 [[parseval-identity|$\mathbb{Z}(N)$ 的 Parseval 恒等式]]（Ch. 7, Theorem 2.8）与圆群 Parseval：
$$
\frac{1}{N}\sum_{j=1}^N |P(j/N)|^2 = \sum_k |\widehat{\mathbf{p}}(k)|^2 = \sum_n |a_n|^2 = \int_0^1 |P(x)|^2\,dx.
$$
$\blacksquare$

**步骤 2（核的插值性质）**。$K(x) = \frac{1}{N}\sum_{r=1}^N e^{2\pi i r x}$（几何级数求和），故
$$
K(0) = 1, \qquad K(j/N) = \frac{1}{N}\sum_{r=1}^N e^{2\pi i r j/N} = \begin{cases} 1, & N \mid j, \\ 0, & N \nmid j, \end{cases}
$$
（$j = 1,\ldots,N$ 时 $N \mid j$ 仅当 $j = N$，此时 $K(1) = \frac{1}{N}\sum_r 1 = 1$；其余 $j$ 处为单位根几何和）。$\blacksquare$

**步骤 3（重建）**。由步骤 2 与步骤 1 的系数识别：
$$
\sum_{j=1}^N P(j/N)K(x - j/N)
= \frac{1}{N}\sum_{r=1}^N e^{2\pi i r x}\underbrace{\sum_{j=1}^N P(j/N)e^{-2\pi i r j/N}}_{= N a_r}
= \sum_{r=1}^N a_r e^{2\pi i r x} = P(x).
$$
$\blacksquare$

## 关联

- 定理：[[sampling-theorem]]（连续版本的采样重建——本习题是 $\mathbb{Z}(N)$ 离散类比）、[[parseval-identity]]（圆群与有限群两版本）
- 概念：[[finite-abelian-group]]、[[fourier-coefficient|Fourier 系数]]、[[character|特征标]]（$e^{2\pi i n x}$ 为圆群特征标）
- 方法：[[fft|快速 Fourier 变换]]（$\mathbb{Z}(N)$ 上的算法实现）、[[integral-truncation]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 7, Exercise 8, p.255）
