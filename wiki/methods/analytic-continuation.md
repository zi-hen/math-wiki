---
type: method
title: 解析延拓法
aliases: [analytic continuation]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, method, analytic-continuation]
strength: standard
strength_basis: 条件：$f$ 在某开集全纯（弱——局部信息）；结论：$f$ 可延拓至连通区域（强——边界值/支集决定全局行为）。
---
# 解析延拓法

> **工作空间**：$\mathbb{C}$。

## 概述

解析延拓法（analytic continuation）将一个区域 $\Omega_1$ 上的全纯函数 $f_1$ 扩展到更大的区域 $\Omega \supset \Omega_1$。由 [[steinComplexAnalysis|Stein, Ch. 2, Theorem 4.8]]（恒等定理）可知，延拓若存在必唯一。

## 三类延拓技术

### 1. 幂级数延拓

若 $f_1(z) = \sum a_n (z - z_0)^n$ 在 $|z - z_0| < R_1$ 内收敛，且在 $|z - z_0| = R_1$ 上某点 $z_1$ 处 $f_1$ 全纯延拓到 $z_1$ 邻域，则可在 $z_1$ 处重新展开幂级数，扩展收敛域。

经典例：$\sum z^n$ 在 $|z| < 1$ 收敛到 $1/(1-z)$；后者将定义域扩展到 $\mathbb{C} \setminus \{1\}$。

### 2. Schwarz 反射

见 [[schwarz-reflection-principle|Schwarz 反射原理]]。条件：$f$ 在 $\Omega^+$ 全纯 + 连续延拓至边界段 $I$ + $f(I) \subset \mathbb{R}$。结论：$f$ 可全纯延拓至 $\Omega^- \cup \Omega^+ \cup I$。

### 3. 全纯延拓的对偶（边界值 → 内部值）

Paley-Wiener 定理（[[paley-wiener-theorem]]）是这一方向的极致：
- 正向：全纯延拓 + 中速下降 $\Rightarrow$ Fourier 变换紧支集。
- 逆向：Fourier 变换紧支集 $\Rightarrow$ 整函数延拓为指数型。

## 唯一性定理

### Theorem 4.8（Stein, p.71）

> 设 $f$ 在区域 $\Omega$ 上全纯。若 $f$ 在某序列 $\{z_k\} \subset \Omega$ 上为零且 $\{z_k\}$ 在 $\Omega$ 中有聚点，则 $f \equiv 0$。

推论：若 $f_1, f_2$ 在某开集 $U \subset \Omega_1 \cap \Omega_2$ 上相等，则 $f_1, f_2$ 在各自定义域内的「解析延拓」（若存在）必相等。

## 典型例子

### 例子 1：Gamma 函数的解析延拓

Gamma 函数 $\Gamma(s) = \int_0^\infty t^{s-1} e^{-t}\,dt$ 在 $\operatorname{Re}(s) > 0$ 上绝对收敛。由 Euler 反射公式 + Weierstrass 乘积可延拓至整个 $\mathbb{C}$（$s = 0, -1, -2, \ldots$ 处有简单极点）。详见 Stein Ch. 6。

### 例子 2：Riemann zeta 函数

$\zeta(s) = \sum_{n=1}^\infty n^{-s}$ 在 $\operatorname{Re}(s) > 1$ 收敛。通过 Euler 乘积 $\zeta(s) = \prod_p (1 - p^{-s})^{-1}$ 与函数方程可延拓至整个 $\mathbb{C}$（$s = 1$ 处有简单极点）。详见 Stein Ch. 6, 7。

### 例子 3：对数分支

$\log z$ 在 $\mathbb{C} \setminus (-\infty, 0]$ 上有主分支（全纯）。其他分支通过不同的解析延拓路径得到（$\arg z \in (-\pi + 2\pi k, \pi + 2\pi k)$）。所有分支在 $\mathbb{C} \setminus \{0\}$ 上是同一函数的不同延拓。

### 例子 4：$1/\Gamma(z)$ 的 Weierstrass 乘积

Weierstrass 乘积定理给出整函数 $1/\Gamma(z)$，它在 $z = 0, -1, -2, \ldots$ 处有零点。这定义了 Gamma 函数在 $\mathbb{C}$ 上的解析延拓（除极点外）。

## 应用

- [[schwarz-reflection-principle|Schwarz 反射原理]]
- [[paley-wiener-theorem|Paley-Wiener 定理]]
- [[weierstrass-product-theorem|Weierstrass 乘积定理]]
- 共形映射的延拓（Stein Ch. 8 Schwarz-Christoffel 公式）

## 关联

- 概念：[[holomorphic-function]]
- 定理：[[schwarz-reflection-principle]]、[[paley-wiener-theorem]]、[[weierstrass-product-theorem]]、[[cauchy-integral-formula]]
- 方法：[[contour-integration|围道积分法]]、[[residue-calculus|留数计算法]]
- 源：[[steinComplexAnalysis]]（Ch. 2, §4, p.68–72; Ch. 5, §4, p.164）
