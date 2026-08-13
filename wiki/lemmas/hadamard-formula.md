---
type: lemma
title: Hadamard 收敛半径公式
aliases: [Hadamard's formula, radius of convergence]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, power-series]
---
# Hadamard 收敛半径公式

> **工作空间**：$\mathbb{C}$。

## 陈述

对任意幂级数 $\sum_{n=0}^{\infty} a_n z^n$，其收敛半径 $R$ 满足
$$
\frac{1}{R} = \limsup_{n \to \infty} |a_n|^{1/n}.
$$

约定 $1/0 = \infty$, $1/\infty = 0$。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 1, Theorem 2.5, p.34]]。

## 证明

设 $\alpha = \limsup_{n \to \infty} |a_n|^{1/n}$。

**情形 1**：$\alpha = 0$（即 $|a_n|^{1/n} \to 0$）。对任意 $z \in \mathbb{C}$，$|a_n|^{1/n}|z| \to 0$，故对充分大 $n$，$|a_n z^n| < 2^{-n}$，级数对所有 $z$ 收敛（$R = \infty$）。

**情形 2**：$\alpha = \infty$（即存在子列 $|a_{n_k}|^{1/n_k} \to \infty$）。取 $|z| > 0$ 任意，对该子列 $|a_{n_k}|^{1/n_k}|z| \to \infty$，故 $|a_{n_k} z^{n_k}| \to \infty$，级数发散。故 $R = 0$。

**情形 3**：$0 < \alpha < \infty$。

(a) 若 $|z| < 1/\alpha$，则对 $\varepsilon > 0$ 充分小，$|a_n|^{1/n}|z| < (\alpha + \varepsilon)|z| < 1$ 对充分大 $n$。故 $|a_n z^n| < r^n$ 对某 $r < 1$，由 Weierstrass M-判别法级数绝对收敛。

(b) 若 $|z| > 1/\alpha$，则 $|a_n|^{1/n}|z| > (\alpha - \varepsilon)|z| > 1$ 对无穷多 $n$（由 $\limsup$ 定义）。故 $|a_n z^n| \not\to 0$，级数发散。

合并得 $R = 1/\alpha$。 $\blacksquare$

## 应用

- [[power-series]]（幂级数收敛性判定）
- [[entire-function]]（整函数定义为 $R = \infty$ 的幂级数）
- [[weierstrass-product-theorem]]（Weierstrass 典型因子的构造依赖收敛半径）
- [[cauchy-inequalities]]（Cauchy 不等式的级数收敛性论证）
