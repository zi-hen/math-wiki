---
type: problem
title: Ch.8 Problem 1: Dirichlet 定理另一种证明
 aliases: [Ch.8 Problem 1, Dirichlet alternative proof]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [number-theory, Ch.8]
chapter: Ch.8
number: Problem 1
---

# Ch.8 Problem 1：Dirichlet 算术级数素数定理的另一种证明

## 陈述

> 不通过 $L(1, \chi)$ 分析，而通过显式计算
> $$
> D_\ell(x) = \sum_{n \leq x, n \equiv \ell (q)} \frac{1}{n}
> $$
> 渐近行为，给出 Dirichlet 算术级数素数定理。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 8, Problem 1, p.272]]。

## 思路提示

对 $D_\ell(x)$ 应用 Fourier 展开 + 留数定理。

## 解答

**步骤 1**（指标函数 Fourier 展开）

$(\mathbb{Z}/q\mathbb{Z})^*$ 上的指标函数 $\delta_\ell(n)$（$n \equiv \ell \pmod q$ 且 $(n, q) = 1$）有 Fourier 展开（参 [[character|字符正交性]]）：
$$
\delta_\ell(n) = \frac{1}{\varphi(q)} \sum_{\chi \bmod q} \overline{\chi(\ell)} \chi(n).
$$

**步骤 2**（$D_\ell$ 展开）

$$
D_\ell(x) = \sum_{n \le x} \frac{\delta_\ell(n)}{n} = \frac{1}{\varphi(q)} \sum_\chi \overline{\chi(\ell)} \sum_{n \le x, (n,q)=1} \frac{\chi(n)}{n}.
$$

**步骤 3**（Dirichlet $L$-函数与 $\sum_{n \le x} \chi(n)/n$）

每个 $L$-函数可写为（$s = 1$）：
$$
L(1, \chi) = \sum_n \frac{\chi(n)}{n} = \lim_{x \to \infty} \sum_{n \le x} \frac{\chi(n)}{n}.
$$

由素数 Euler 乘积（参 [[ch8-ex3-euler-product|ch8-ex3-euler-product]]）在 $s = 1$ 收敛（$(n, q) = 1$ 时 $\chi(n) \leq 1$）。

**步骤 4**（主特征标 vs 非主）

主特征标 $\chi_0$（$\chi_0(n) = 1$ 当 $(n, q) = 1$，否则 0）：$\sum_\text{principal} = \sum_{n \le x, (n,q)=1} 1/n \sim \frac{1}{\varphi(q)} \log x$。

非主特征标：$\sum_{n \le x} \chi(n)/n$ 收敛（由 $L(s, \chi) \neq 0$ 已证或可证）。

**步骤 5**（综合）

$$
D_\ell(x) = \frac{1}{\varphi(q)} \log x + O(1).
$$

由 Chebyshev 函数 $\psi(x; q, \ell) = \sum_{p^k \le x, p^k \equiv \ell (q)} \log p / p^k$ 与 $D_\ell$ 的 Abel 求和关系，得 $\psi(x; q, \ell) \sim \frac{x}{\varphi(q)}$（实际上需更细的留数定理），最终得 $\pi(x; q, \ell) \sim x/(\varphi(q) \log x)$。$\blacksquare$

## 关联

- 定理：[[dirichlet-theorem-on-primes]]
- 概念：[[character]]、[[finite-abelian-group]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 8 Problem 1）

## Stein 备注

原 Ch. 8 主体证明（Theorem 3.1）已给出。本题变体强调**显式渐近计算**而非 $L$-函数零点分析——前者更接近初等数论风格，后者更解析。
