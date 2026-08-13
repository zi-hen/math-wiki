---
type: lemma
title: Cauchy 不等式
aliases: [Cauchy inequalities, Cauchy estimates]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, cauchy-theorem, inequality]
---
# Cauchy 不等式

> **工作空间**：$\mathbb{C}$ 中以 $z_0$ 为中心、$R$ 为半径的闭圆盘 $\bar{D}$。

## 陈述

设 $f$ 在包含闭圆盘 $\bar{D}$ 的某开集 $\Omega$ 上全纯。则对任意 $n \geq 0$，
$$
|f^{(n)}(z_0)| \leq \frac{n!\, \|f\|_C}{R^n},
$$
其中 $\|f\|_C = \sup_{z \in C} |f(z)|$，$C$ 为 $\bar{D}$ 的边界圆周。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, Corollary 4.3, p.67]]。

## 证明

由 [[cauchy-integral-formula]]（高阶导数版本，Corollary 4.2, p.66）：
$$
f^{(n)}(z_0) = \frac{n!}{2\pi i} \int_C \frac{f(\zeta)}{(\zeta - z_0)^{n+1}}\,d\zeta.
$$

取模并应用 [[triangle-inequality-complex|三角不等式]]：
$$
|f^{(n)}(z_0)| \leq \frac{n!}{2\pi} \int_C \frac{|f(\zeta)|}{|\zeta - z_0|^{n+1}}\,|d\zeta| \leq \frac{n!}{2\pi} \cdot \|f\|_C \cdot \frac{1}{R^{n+1}} \cdot 2\pi R = \frac{n!\, \|f\|_C}{R^n}.
$$

其中用了 $|\zeta - z_0| = R$（对 $\zeta \in C$）与 $\int_C |d\zeta| = 2\pi R$（圆周长）。 $\blacksquare$

## 应用

- [[liouville-theorem]]（Liouville 定理证明的核心：取 $R \to \infty$）
- [[cauchy-integral-formula]]（高阶导数公式的直接推论）
- [[power-series]]（幂级数系数的增长控制）
- 引用本引理的引理：[[hadamard-formula]]（Cauchy 不等式给出 Hadamard 公式中的系数上界）
