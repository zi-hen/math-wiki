---
type: concept
title: 径向函数
 aliases: [radial function, spherical function]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, geometry]
strength: standard
strength_basis: 条件：$f: \mathbb{R}^d \to \mathbb{C}$（弱——任意函数）；结论：$f$ 满足 $f(x) = f(|x|)$（旋转不变性）。径向函数在 $\mathbb{R}^d$ Fourier 变换下仍径向——这是把 $d$ 维 Fourier 变换化为一维 Hankel / Bessel 变换的关键。
---

# 径向函数

> **工作空间**：$\mathbb{R}^d$（$d \geq 1$）。Stein 在 Ch. 6 §1 引入用于化简多维 Fourier 变换。

## What — 定义与基本事实

### 定义

$f: \mathbb{R}^d \to \mathbb{C}$ 称为**径向函数**，若存在函数 $g: [0, \infty) \to \mathbb{C}$ 使
$$
f(x) = f_0(|x|), \qquad \forall x \in \mathbb{R}^d.
$$

等价地，$f$ 在原点对称群 $O(d)$ 下不变：$f(Rx) = f(x)$ 对所有正交矩阵 $R \in O(d)$。

### 基本性质

1. **旋转下不变**：$f(Rx) = f(x)$，$R \in O(d)$。
2. **径向函数的 Fourier 变换仍径向**（见 Ch. 6 Corollary 2.3）。
3. **Fourier 化简**：若 $f$ 径向，则
$$
\hat{f}(\xi) = \int_{\mathbb{R}^d} f(x)\,e^{-2\pi i \xi \cdot x}\,dx = \int_0^\infty f_0(r) \cdot F_d(\rho r) \cdot r^{d-1} dr
$$
其中 $\rho = |\xi|$，$F_d$ 是显式核（$d = 1, 3$ 用初等函数，$d$ 一般用 Bessel 函数）。

## Why — 动机与直观

### 为什么引入径向函数？

多维 Fourier 分析的核心简化技巧：当 $f$ 径向时，$f$ 与 $\hat{f}$ 都只依赖 $|x|$ 与 $|\xi|$，可降维到一维积分。这是球面调和分析（spherical harmonics）的起点。

### 直观解释

旋转下不变性使得 Fourier 变换的相位信息被约化——多维 Fourier 积分退化为 Bessel 函数（$d=2$）或初等函数（$d=1, 3$）的 Hankel 形式变换。

## What-if — 等价叙述

### 等价叙述

#### 叙述 1（$O(d)$ 不变）
$f(x) = f(Rx)$ 对所有 $R \in O(d)$。

#### 叙述 2（球坐标）
$f(x) = f_0(|x|)$（仅依赖 $|x|$）。

#### 叙述 3（Spherical harmonics 零阶）
$f$ 是 spherical harmonic $Y_{00}$ 的倍数——在所有 higher order 上投影为 0。

**等价关系**：叙述 1 ≡ 叙述 2（$O(d)$ 不变性等价于球对称）；叙述 3 是叙述 1 的频域版。

## 关联

- 概念：[[bessel-function]]（径向 Fourier 的核心工具）
- 定理：Ch. 6 Corollary 2.3（径向 Fourier 仍径向）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 6 §1，p.193–197）
