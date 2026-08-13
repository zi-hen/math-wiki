---
type: lemma
title: 复指数的整数周期性
aliases: [integer periodicity of exponential, e^{2πin}=1]
created: 2026-08-11
updated: 2026-08-11
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, elementary]
---
# 复指数的整数周期性

> **工作空间**：复平面 $\mathbb{C}$。

## 陈述

> 对任意 $n \in \mathbb{Z}$，
> $$e^{2\pi i n} = 1.$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Fourier Analysis, Ch. 1, §1]]。

## 证明

由 Euler 公式，$e^{2\pi i n} = \cos(2\pi n) + i\sin(2\pi n)$。因 $n \in \mathbb{Z}$，$2\pi n$ 为 $2\pi$ 的整数倍。由 $\cos$ 与 $\sin$ 的 $2\pi$ 周期性，$\cos(2\pi n) = \cos 0 = 1$，$\sin(2\pi n) = \sin 0 = 0$。故 $e^{2\pi i n} = 1 + 0i = 1$。$\blacksquare$

## 推论

> 对任意 $m, n \in \mathbb{Z}$，
> $$e^{2\pi i m n} = 1.$$

此为上述性质的应用：$mn \in \mathbb{Z}$，故 $e^{2\pi i mn} = 1$。

## 应用

- [[poisson-summation-formula]]：在计算 $F_1$ 的 [[fourier-coefficient|Fourier 系数]]时，变量替换后 $e^{-2\pi i m(y-n)} = e^{-2\pi i my} \cdot e^{2\pi i mn} = e^{-2\pi i my}$（因 $e^{2\pi i mn} = 1$）。
- [[dirichlet-theorem-on-primes]]：Fourier 展开中特征标的周期性依赖此性质。
