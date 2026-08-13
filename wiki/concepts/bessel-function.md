---
type: concept
title: Bessel 函数
aliases: [Bessel function, $J_n$]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, special-functions]
strength: standard
strength_basis: 条件：整数阶 $n \in \mathbb{Z}$ 或非整数阶 $n \in \mathbb{C}$（Stein 给出两种）；结论：$J_n(\rho)$ 是 Bessel 微分方程的解。$J_n$ 是径向 Fourier 变换化简（一维 Hankel 形式）后的核心对象；亦是 Fourier-Bessel 展开的本征函数。
---

# Bessel 函数

> **工作空间**：$\mathbb{R}$（实变量 $\rho$）或 $\mathbb{C}$。Stein 在 Ch. 6 §2 与 Problems 1–2 详细讨论。

## What — 定义与基本事实

### 定义（整数阶 $n \in \mathbb{Z}$）

$$
J_n(\rho) = \frac{1}{2\pi i} \oint e^{(\rho/2)(z - 1/z)} z^{-n-1}\,dz
$$

Stein 在 p.229 给出整数阶递推与等价表达式：
$$
J_n(\rho) = \sum_{m=0}^\infty \frac{(-1)^m}{m! \, (n+m)!} \left(\frac{\rho}{2}\right)^{n + 2m}.
$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 6, Problem 1, p.229]]。

### 基本性质

1. **递推关系**：
   - $J_{-n}(\rho) = (-1)^n J_n(\rho)$
   - $2 J_n'(\rho) = J_{n-1}(\rho) - J_{n+1}(\rho)$
   - $\frac{2n}{\rho} J_n(\rho) = J_{n-1}(\rho) + J_{n+1}(\rho)$
2. **Bessel 微分方程**：$\rho^2 y'' + \rho y' + (\rho^2 - n^2) y = 0$。
3. **实值性**：$J_n(\rho)$ 对实 $\rho$ 实值。
4. **半整数公式**：$J_{1/2}(\rho) = \sqrt{2/(\pi\rho)} \sin \rho$，$J_{-1/2}(\rho) = \sqrt{2/(\pi\rho)} \cos \rho$。

### 非整数阶（Problem 2）

$n > -1/2$ 时，可表示为：
$$
J_n(\rho) = \left(\frac{\rho}{2}\right)^n \cdot \frac{1}{\Gamma(n+1/2)\sqrt{\pi}} \int_{-1}^1 e^{i\rho t}(1-t^2)^{n-1/2}\,dt.
$$

## Why — 动机与直观

### 为什么引入 Bessel 函数？

$\mathbb{R}^d$ 上**径向 Fourier 变换**化简后（Ch. 6 Theorem 5）出现的核心函数。Stein 利用 Hankel 变换得到：
$$
\hat{f}_0(\rho) = 2\pi \rho^{-(d/2) + 1} \int_0^\infty J_{(d/2)-1}(2\pi \rho r) f_0(r) r^{d/2}\,dr.
$$

奇数 $d = 1, 3$ 下 $J_{-1/2}, J_{1/2}$ 是初等函数（$J_{1/2}(\rho) = \sqrt{2/(\pi\rho)} \sin \rho$），可直接化简为初等 Fourier 变换。

## What-if — 反例

1. **$J_n$ 不属于 $L^1$**：当 $\rho \to \infty$，$J_n(\rho) \sim \sqrt{2/(\pi \rho)} \cos(\rho - n\pi/2 - \pi/4)$，衰减仅 $O(\rho^{-1/2})$，故 $\int_0^\infty |J_n(\rho)| d\rho = \infty$。

## 关联

- 概念：[[radial-function]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 6 §2、Problem 1、Problem 2）
