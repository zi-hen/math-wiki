---
type: lemma
title: 几何级数估计
aliases: [geometric series bound]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, number-theory]
---

# 几何级数估计

> **工作空间**：任何 $r \neq 1$ 复数 / 整数参数。Stein 在 Ch. 4 §3 Weyl 判据证明中显式使用。

## 陈述

> 设 $r \in \mathbb{C}$，$r \neq 1$。则
> $$
> \sum_{n=1}^N r^n = r \cdot \frac{1 - r^N}{1 - r}.
> $$
> 若 $|r| = 1$ 且 $r^N \neq 1$，则部分和有界：
> $$
> \left|\sum_{n=1}^N r^n\right| \leq \frac{2}{|1 - r|}.
> $$

**关键事实**：上界与 $N$ 无关。这是 Weyl 等分布判据证明的关键——$\frac{1}{N}\sum r^n \to 0$ 当且仅当 $r \neq 1$。依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 4, §3, p.129]]。

## 证明

求和恒等式 $\sum_{n=1}^N r^n = r(1 - r^N)/(1 - r)$ 由几何级数求和公式给出（两端同乘 $1 - r$ 即验）。设 $|r| = 1$，由模的乘法性（[[multiplicativity-of-modulus]]）与 [[triangle-inequality-complex|三角不等式]] $|1 - r^N| \le 1 + |r^N| = 2$：
$$
\left|\sum_{n=1}^N r^n\right| = \left|\frac{r(1 - r^N)}{1 - r}\right| = \frac{|r|\,|1 - r^N|}{|1 - r|} \le \frac{2}{|1 - r|}.
$$
$\blacksquare$

## 应用

- [[weyl-equidistribution]]：证明中 $\sum_{n=1}^N e^{2\pi i k n \gamma}$ 的部分和有界性（$\le 2/|1 - e^{2\pi i k\gamma}|$，与 $N$ 无关），从而 $\frac{1}{N}\sum_{n=1}^N e^{2\pi i k n\gamma} \to 0$ 当且仅当 $k\gamma \notin \mathbb{Z}$。