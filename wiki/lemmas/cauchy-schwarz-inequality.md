---
type: lemma
title: Cauchy–Schwarz 不等式
aliases: [Cauchy-Schwarz inequality, Schwarz inequality]
created: 2026-08-11
updated: 2026-08-11
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [analysis, inequality, elementary]
---
# Cauchy–Schwarz 不等式

> **工作空间**：测度空间 $(X, \mu)$。

## 陈述

> 设 $f, g$ 为测度空间 $(X, \mu)$ 上的可测函数。若 $f \in$ [[lp-space|$L^2(X)$]] 且 $g \in$ [[lp-space|$L^2(X)$]]，则 $fg \in$ [[lp-space|$L^1(X)$]]，且
> $$\left|\int_X f\,\bar{g}\, d\mu\right| \leq \|f\|_{L^2}\, \|g\|_{L^2}.$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Fourier Analysis, Ch. 1, §2]]。

## 证明

若 $\|g\|_{L^2} = 0$，则 $g = 0$ a.e.，不等式两端为零，平凡成立。设 $\|g\|_{L^2} > 0$。对任意 $\lambda \in \mathbb{C}$，考虑非负量
$$
0 \leq \|f - \lambda g\|_{L^2}^2 = \int |f - \lambda g|^2\, d\mu = \|f\|_{L^2}^2 - 2\operatorname{Re}\left(\bar{\lambda} \int f\bar{g}\, d\mu\right) + |\lambda|^2 \|g\|_{L^2}^2.
$$
取 $\lambda = \frac{\int f\bar{g}\, d\mu}{\|g\|_{L^2}^2}$（最优选择），代入得
$$
0 \leq \|f\|_{L^2}^2 - \frac{2\left|\int f\bar{g}\, d\mu\right|^2}{\|g\|_{L^2}^2} + \frac{\left|\int f\bar{g}\, d\mu\right|^2}{\|g\|_{L^2}^2} = \|f\|_{L^2}^2 - \frac{\left|\int f\bar{g}\, d\mu\right|^2}{\|g\|_{L^2}^2}.
$$
整理得 $\left|\int f\bar{g}\, d\mu\right|^2 \leq \|f\|_{L^2}^2 \|g\|_{L^2}^2$，取平方根即得。$\blacksquare$

## 重要推论

> 若 $\mu(X) < \infty$，则 [[lp-space|$L^2(X) \subset L^1(X)$]]，且 $\|f\|_{L^1} \leq \|f\|_{L^2} \cdot \sqrt{\mu(X)}$。

*证明.* 取 $g = 1$（常函数），则 $\|g\|_{L^2} = \sqrt{\mu(X)}$，由 Cauchy–Schwarz 不等式，$\|f\|_{L^1} = \int |f| \cdot 1\, d\mu \leq \|f\|_{L^2} \sqrt{\mu(X)}$。$\blacksquare$

## 应用

- [[paley-wiener-theorem]]：在逆向定理证明中，由 $f \in L^2(\mathbb{R})$ 与 $\operatorname{supp}(\hat{f}) \subset [-M,M]$ 推出 $\hat{f} \in L^1([-M,M])$（因 $[-M,M]$ 测度有限，$L^2 \subset L^1$）。
- [[dirichlet-theorem-on-primes]]：特征标的正交性证明中使用内积估计。
