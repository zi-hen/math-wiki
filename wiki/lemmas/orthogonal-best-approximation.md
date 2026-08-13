---
type: lemma
title: 正交最佳逼近
aliases: [orthogonal best approximation]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, l2-theory]
---

# 正交最佳逼近

> **工作空间**：Hilbert 空间 $H$（典型为 [[lp-space|$L^2(\mathbb{T})$]] / [[ellp-space|$\ell^2(\mathbb{Z})$]] / $L^2(\mathbb{R}^d)$）。Stein 在 Ch. 3 §1 显式建立。

## 陈述

> 设 $V$ 是 Hilbert 空间 $H$ 的闭子空间。对任意 $u \in H$，存在**唯一的** $v_0 \in V$ 使
> $$
> \|u - v_0\|_H = \inf_{v \in V} \|u - v\|_H.
> $$
> 且 $v_0$ 恰好是 $u$ 在 $V$ 上的**正交投影**：$v_0 \in V$ 且 $u - v_0 \perp V$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 3, Lemma 1.2]]（$S_N(f)$ 在 $\{e_n\}_{|n| \leq N}$ 张成的子空间中的最优性）。

## 证明

存在性：取极小化序列 $\{v_n\} \subset V$，即 $\|u - v_n\| \to d = \inf_{v \in V} \|u - v\|$。由平行四边形恒等式
$$
\|v_n - v_m\|^2 = 2\|u - v_n\|^2 + 2\|u - v_m\|^2 - 4\left\|u - \frac{v_n + v_m}{2}\right\|^2 \le 2\|u - v_n\|^2 + 2\|u - v_m\|^2 - 4d^2 \to 0,
$$
故 $\{v_n\}$ 为 Cauchy 列；因 $V$ 闭（故完备），收敛于 $v_0 \in V$，取极限得 $\|u - v_0\| = d$。

正交性：若存在 $w \in V$ 使 $\langle u - v_0, w\rangle \neq 0$，则对 $v_0 + \varepsilon w \in V$ 有
$$
\|u - v_0 - \varepsilon w\|^2 = \|u - v_0\|^2 - 2\varepsilon\operatorname{Re}\langle u - v_0, w\rangle + \varepsilon^2\|w\|^2,
$$
取充分小的同号 $\varepsilon$ 使右端小于 $d^2$，矛盾于 $d$ 的最小性。故 $u - v_0 \perp V$。唯一性由平行四边形恒等式同理可得。$\blacksquare$

## 应用

- [[parseval-identity]]：$S_N(f)$ 在 $\{e_n\}_{|n| \le N}$ 张成子空间中的最优性是 Parseval 反向不等式（$\|f\|_2 \le (\sum|\hat f|^2)^{1/2}$）证明的核心步骤（Ch. 3 Theorem 1.3）。
- [[mean-square-convergence|均方收敛]]：最优性使 $S_N(f)$ 的均方逼近误差不超过任何三角多项式，是均方收敛定理（Ch. 3 Theorem 1.1）证明的枢纽。