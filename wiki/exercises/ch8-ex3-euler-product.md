---
type: exercise
title: Ch.8 Exercise 3: Euler 乘积
 aliases: [Ch.8 Ex.3, Euler product, L-functions]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [number-theory, Ch.8]
chapter: Ch.8
number: Ex.3
---

# Ch.8 Exercise 3：Euler 乘积

## 陈述

> 设 $\chi$ 是模 $q$ 的 Dirichlet 字符（即 $(\mathbb{Z}/q\mathbb{Z})^*$ 上的群同态 $\chi: (\mathbb{Z}/q\mathbb{Z})^* \to S^1$）。证明 Dirichlet $L$-函数
> $$
> L(s, \chi) = \sum_{n=1}^\infty \frac{\chi(n)}{n^s}, \quad s > 1
> $$
> 有 Euler 乘积
> $$
> L(s, \chi) = \prod_p \frac{1}{1 - \chi(p)/p^s},
> $$
> 其中乘积遍历所有素数 $p$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 8, Exercise 3, p.254]]。

## 思路提示

完全类似 Riemann zeta 函数的 Euler 乘积证明，仅需将 1 替换为 $\chi$。

## 解答

**步骤 1**：先证 $s > 1$ 时 $\sum_n |\chi(n)|/n^s$ 绝对收敛（$|\chi(n)| \leq 1$，与 zeta 函数相同）。

**步骤 2**：将正整数 $n$ 唯一分解为 $n = \prod p^{a_p}$，$a_p \geq 0$。

**步骤 3**：因 $\chi$ 是完全积性函数：$\chi(ab) = \chi(a)\chi(b)$ 对 $(a, q) = (b, q) = 1$。故
$$
\chi(n) = \prod_p \chi(p^{a_p}).
$$

特别地 $\chi(p^a) = \chi(p)^a$。于是
$$
\sum_{n \geq 1} \frac{\chi(n)}{n^s} = \sum_{(a_p)} \prod_p \frac{\chi(p)^{a_p}}{p^{a_p s}} = \prod_p \sum_{a=0}^\infty \frac{\chi(p)^a}{p^{as}} = \prod_p \frac{1}{1 - \chi(p)/p^s}.
$$

**步骤 4**：绝对收敛允许多次交换（$\sum \prod = \prod \sum$）。$\blacksquare$

## 应用

- **Dirichlet 定理**：对每个 $\chi$（主与非主），$L(1, \chi) \neq 0$ 蕴含 $\sum \chi(n)/n$ 收敛，最终得 $\pi(x; q, a) \to \infty$。
- **类数公式**：二次域的类数 = 各素分裂模式乘积。
- **解析数论核心工具**：所有 $L$-函数的解析性质均依赖 Euler 乘积。

## 关联

- 定理：[[dirichlet-theorem-on-primes]]
- 概念：[[character]]、[[finite-abelian-group]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 8 Exercise 3）
