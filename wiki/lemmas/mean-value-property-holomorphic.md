---
type: lemma
title: 全纯函数平均值性质
aliases: [mean value property for holomorphic functions]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, harmonic-functions]
---
# 全纯函数平均值性质

> **工作空间**：$\mathbb{C}$ 中以 $z_0$ 为中心、$R$ 为半径的圆盘 $D_R(z_0)$。

## 陈述

设 $f$ 在 $D_R(z_0)$ 上全纯。则对任意 $0 < r < R$，
$$
f(z_0) = \frac{1}{2\pi} \int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta.
$$

特别地，若 $f = u + iv$，则其实部 $u$ 与虚部 $v$ 都满足平均值性质：
$$
u(z_0) = \frac{1}{2\pi} \int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta.
$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Corollary 7.2, p.121]]。

## 证明

由 [[cauchy-integral-formula|Cauchy 积分公式]]（Stein Theorem 4.1, p.64），
$$
f(z_0) = \frac{1}{2\pi i} \int_{|z - z_0| = r} \frac{f(\zeta)}{\zeta - z_0}\,d\zeta.
$$

参数化 $\zeta = z_0 + re^{i\theta}$，$d\zeta = ire^{i\theta} d\theta$，
$$
f(z_0) = \frac{1}{2\pi i} \int_0^{2\pi} \frac{f(z_0 + re^{i\theta})}{re^{i\theta}} \cdot ire^{i\theta}\,d\theta = \frac{1}{2\pi} \int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta. \quad \blacksquare
$$

## 应用

- [[holomorphic-function]]（核心刻画工具）
- [[maximum-modulus-principle]]（推论：调和函数平均值性质蕴含最大模原理）
- [[argument-principle]]（[[fourier-coefficient|Fourier 系数]]的对偶）
- [[cauchy-integral-formula]]（推导基础）
