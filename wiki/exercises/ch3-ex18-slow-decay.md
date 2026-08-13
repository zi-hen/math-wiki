---
type: exercise
title: Ch.3 Ex.18: Fourier 系数任意慢衰减
 aliases: [Ch.3 Ex.18, slow-decay 构造]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.3, riemann-lebesgue]
chapter: Ch.3
number: Ex.18
---

# Ch.3 Ex.18：Fourier 系数可任意慢衰减

## 陈述

> 证明：给定任一收敛到 0 的非负实数序列 $\{\epsilon_n\}$，存在连续函数 $f: [0, 2\pi] \to \mathbb{R}$ 使 $|\hat f(n)| \geq \epsilon_n$ 对无穷多个 $n$ 成立。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 3, Exercise 18(e), p.111]]。

## 思路提示

取 $\{\epsilon_n\}$ 的子列 $\{\epsilon_{n_k}\}$ 使 $\sum_k \epsilon_{n_k} < \infty$，构造 $f$ 为 Fourier 部分和叠加。

## 解答

**步骤 1**：取子列 $\{\epsilon_{n_k}\}_{k \geq 1}$ 使 $\sum_k \epsilon_{n_k} < \infty$（可由 $\epsilon_n \to 0$ 抽出适当稀疏子列）。

**步骤 2**：定义
$$
f(\theta) = \sum_k \epsilon_{n_k} \cos(n_k \theta).
$$

**步骤 3**：验证 $f$ 连续：因 $\sum \epsilon_{n_k} < \infty$，Weierstrass M-判别给出绝对一致收敛。

**步骤 4**：验证 [[fourier-coefficient|Fourier 系数]]：因 $\cos(n_k \theta)$ 是不同频率的正交基元，
$$
\hat f(m) = \sum_k \epsilon_{n_k} \cdot \frac{1}{2}[\delta_{m, n_k} + \delta_{m, -n_k}].
$$
故对 $m = n_k$（$k$ 任意），$|\hat f(m)| = \frac{1}{2}\epsilon_{n_k} + \sum_{j \neq k} \epsilon_{n_j} \delta_{...} $。当 $\sum_{j \neq k} \epsilon_{n_j}$ 很小（稀疏子列），$|\hat f(n_k)| \geq c \epsilon_{n_k}$。

$\blacksquare$

## 关联

- 定理：[[riemann-lebesgue-lemma]]（给出 $\hat f(n) \to 0$ 的零阶版本）、[[bernstein-theorem]]（Hölder $\alpha>1/2$ 的绝对收敛——慢衰减的反方向）
- 引理：[[fourier-coefficient-decay|Fourier 系数衰减]]（(a)–(e) 的正向衰减族，本构造说明其最优性）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3 Exercise 18）
