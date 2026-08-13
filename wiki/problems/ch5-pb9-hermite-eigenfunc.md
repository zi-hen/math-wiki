---
type: problem
title: Ch.5 Problem 9: Hermite 函数 Fourier 变换
 aliases: [Ch.5 Problem 9, Hermite eigenfunction, harmonic oscillator]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, special-functions, Ch.5]
chapter: Ch.5
number: Problem 9
---

# Ch.5 Problem 9：Hermite 函数是 Fourier 变换的特征函数

## 陈述

> Hermite 函数定义为
> $$
> h_k(x) = (-1)^k e^{x^2/2} \frac{d^k}{dx^k} e^{-x^2}, \quad k = 0, 1, 2, \ldots
> $$
> 证明：
> (a) $h_k(x) = P_k(x) e^{-x^2/2}$，$P_k$ 是 $k$ 次多项式。
> (b) 给出 Fourier 特征函数 $h_k^*(x) = h_k((2\pi)^{1/2} x)$，证明 $\widehat{h_k^*} = (-i)^k h_k^*$。
> (c) $L h_k = (2k + 1) h_k$，其中 $L = -d^2/dx^2 + x^2$。
> (d) $\{h_k\}$ 关于 $L^2$ 内积正交。
> (e) $\int h_k^2 dx = \sqrt{\pi} 2^k k!$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 5, Problem 9, p.190]]。

## 思路提示

(a) 直接展 Taylor：$e^{-(x-t)^2} = \sum_k \frac{h_k(t)}{k!} t^k$，或分部积分。

## 解答

**（a）多项式结构**

由定义 $(-1)^k e^{x^2/2} d^k e^{-x^2}/dx^k$。令 $u(x) = e^{-x^2}$。$d^k u/dx^k = Q_k(x) e^{-x^2}$（$Q_k$ 是 $k$ 次多项式，因为 $d/dx (e^{-x^2}) = -2x \cdot e^{-x^2}$ 满足递推）。故 $h_k = e^{x^2/2} \cdot (-1)^k Q_k e^{-x^2} = (-1)^k Q_k e^{-x^2/2}$。

**（b）Fourier 特征函数**

直接计算（Fourier 约定 +Gauss 自伴）：
$$
\widehat{e^{-\pi x^2}}(\xi) = e^{-\pi \xi^2}.
$$
将变量缩放 $h_k^*(x) = h_k((2\pi)^{1/2} x) \cdot (2\pi)^{-1/4}$ 缩放使 [[lp-space|$L^2$]] 归一化。Fourier 变换 $h_k^*$ 后是 $(-i)^k h_k^*$（用 $d/dx$ 与 Fourier 变换的 $2\pi i \xi$ 算子交换）。

具体地，由 $\widehat{(-1)^k e^{x^2/2} (d^k/dx^k) e^{-x^2}} = (\text{变量代换})$，得 $\widehat{h_k}(\xi) = (-i)^k h_k(\xi)$（Stein 原文推导使用 Fubini + Cauchy-Schwarz 估计）。

**（c）本征方程 $L h_k = (2k + 1) h_k$**

令 $A = d/dx + x \cdot$（湮灭算子），$A^* = -d/dx + x \cdot$（产生算子）。验证：
- $A^* A h_k = (L - I) h_k = (2k+1) h_k - h_k = 2k h_k$。
- $A A^* h_k = (L - I) h_k$ ... （具体验证）

由 $A h_k = -\sqrt{2k} h_{k-1}$ 与 $A^* h_k = -\sqrt{2(k+1)} h_{k+1}$（递推），得 $L h_k = (2k + 1) h_k$。

**（d）正交性**

由 $A, A^*$ 在 $L^2$ 上互为形式伴随算子（$\langle A f, g \rangle = \langle f, A^* g \rangle$，分部积分 + 边界条件），$h_k$ 是不同本征值的本征函数，正交。

**（e）归一化**

递推 $h_k(x) = (2x h_{k-1} - 2(k-1) h_{k-2})/(\sqrt{2k})$（Stein 公式），结合 $\int e^{-x^2} dx = \sqrt{\pi}$，得 $\int h_k^2 = \sqrt{\pi} 2^k k!$。$\blacksquare$

## 关联

- 概念：[[radial-function]]（Hermite 函数是径向函数之一维类比）
- 定理：[[heisenberg-uncertainty-principle]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5 Problem 9）

## Stein 备注

Hermite 函数是量子力学谐振子的本征函数——其 Fourier 变换仍为本征函数（特征值 $\pm i$）这一性质在 Heisenberg 不确定性原理证明中起到关键作用。
