---
type: theorem
title: Radon 变换
 aliases: [Radon transform, X-ray transform]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [integral-geometry, medical-imaging]
strength: strong
strength_basis: 条件：$f \in \mathcal{S}(\mathbb{R}^d)$（弱条件——Schwartz 类）；结论：Radon 变换 $R(f)(P) = \int_P f$ 在 $L^2$ 上可逆，且显式重建公式 $f = c_d (-\Delta)^{(d-1)/2} R^* R(f)$（强结论——精确反演）。Stein Ch. 6 §5。
---

# Radon 变换

> **工作空间**：$\mathbb{R}^d$。Stein 在 Ch. 6 §5 系统讨论（特别 $d = 2$ 为 X-射线变换，$d = 3$ 为 Radon 原始版）。

## What — 陈述

**X-射线变换**（$d = 2$，沿直线 $L$）：
$$
X(f)(L) = \int_L f \,ds.
$$

**Radon 变换**（$d \geq 2$，沿超平面 $P$）：
$$
R(f)(P) = \int_P f \,d\sigma.
$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 6, §5, p.217–222]]。

### 基本性质

1. **Fourier 切片定理**（Ch. 6 Lemma 5.2）：$\widehat{R(f)}(s, \gamma) = \hat f(s \gamma)$。
2. **单射性**（Corollary 5.3）：$R(f) = R(g) \Rightarrow f = g$。
3. **唯一性 + 重建**（Theorem 5.4）：$\Delta R^* R(f) = -8\pi^2 f$。

## Why — 动机与证明

### 动机

CT 扫描的数学基础：医院 CT 机通过测量沿不同方向 X-射线衰减的总和（即沿直线的积分）来重建人体断层图像。

### 证明思路（Fourier 切片定理）

取 $\gamma \in S^{d-1}$，$\{e_1, e_2\}$ 是 $\gamma^\perp$ 的正交基。沿 $P_{t, \gamma} = \{t\gamma + u_1 e_1 + u_2 e_2\}$ 的 Radon 变换：
$$
R(f)(t, \gamma) = \int_{\mathbb{R}^{d-1}} f(t\gamma + u)\,du.
$$

对 $t$ 做 Fourier 变换：
$$
\widehat{R(f)}(s, \gamma) = \int_{\mathbb{R}} e^{-2\pi i s t} \int_{\mathbb{R}^{d-1}} f(t \gamma + u)\,du\,dt = \int_{\mathbb{R}^d} f(x) e^{-2\pi i s x \cdot \gamma}\,dx = \hat f(s\gamma).
$$

最后一个等号应用 Fourier 变换的定义 $\hat f(\xi) = \int f(x) e^{-2\pi i x \cdot \xi} dx$ 在 $\xi = s \gamma$ 处。$\blacksquare$

## What-if — 反例、等价叙述

### 等价叙述

1. **$d = 2$ X-射线变换**
2. **$d = 3$ Radon 变换**
3. **重建公式**（Ch. 6 Problem 8）：
   - $d = 2$：$(-4\pi)^{1/2} \cdot \frac{1}{4\pi} R^* R(f) = f$（其中 $(-\Delta)^{1/2}$ 由定义 7）。
   - $d$ 一般：$(2\pi)^{1-d} \cdot 2 \cdot (-\Delta)^{(d-1)/2} R^* R(f) = f$。

**等价关系**：三个叙述**iff**（Fourier 切片定理统一）。

### 反例

1. **紧支外信号不可重构**：若 $f$ 紧支，但无法仅用超平面积分确定（除非 $f = 0$）。
2. **非 [[schwartz-space|Schwartz 类]]**：$R$ 的延拓需测度论（实分析卷内容）。

## 应用

- **CT 扫描**：1979 年 Hounsfield / Cormack 获诺贝尔奖（基于 Radon 1917 数学）
- **地震学**：地层重建
- **天文成像**：太阳 / 银河系的断层重建

## 关联

- 概念：[[character]]、Haar 测度、[[lp-space|$L^2$ 空间]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 6 §5、Problem 8）
