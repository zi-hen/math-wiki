---
type: concept
title: Fourier 变换
aliases: [Fourier transform, FT]
created: 2026-08-11
updated: 2026-08-11
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f \in L^1(\mathbb{R}^d)$（弱——$\mathbb{R}^d$ 上很广的函数类）；结论：Fourier 变换 $\hat{f}(\xi) = \int f(x) e^{-2\pi i \xi\cdot x} dx$（强——导出平移、微分、卷积的对角化）。Plancherel 在 $L^2$ 上的等距同构（条件 $L^2$，结论 $L^2$ 等距）进一步强化。
---
# Fourier 变换

> **工作空间**：$\mathbb{R}^d$（$d \in \mathbb{Z}_{\geq 1}$）；Stein 在 Ch.5 处理 $d=1$，Ch.6 处理一般 $d$。

## What — 定义与基本事实

### 定义

设 $f\in$ [[lp-space|$L^1(\mathbb{R}^d)$]]，其 Fourier 变换定义为

$$
\hat{f}(\xi)=\int_{\mathbb{R}^d} f(x)\,e^{-2\pi i \xi\cdot x}\,dx,\qquad \xi\in\mathbb{R}^d.
$$

逆 Fourier 变换为

$$
f(x)=\int_{\mathbb{R}^d} \hat{f}(\xi)\,e^{2\pi i \xi\cdot x}\,d\xi.
$$

（公式采用 Stein 约定：核为 $e^{-2\pi i\xi\cdot x}$，积分测度为 $d\xi$，无 $(2\pi)^{-d}$ 因子。）

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5–6]]。

### 基本性质

- **线性**：$\widehat{af+bg}=a\hat{f}+b\hat{g}$。
- **平移**：$\widehat{f(\cdot -a)}(\xi)=e^{-2\pi i a\cdot \xi}\hat{f}(\xi)$；$\widehat{e^{2\pi i a\cdot x}f(x)}(\xi)=\hat{f}(\xi-a)$。
- **伸缩**：$\widehat{f(\lambda\cdot)}(\xi)=|\lambda|^{-d}\hat{f}(\xi/\lambda)$。
- **卷积**：$\widehat{f*g}=\hat{f}\cdot\hat{g}$。
- **导数**：$\widehat{\partial_j f}(\xi)=2\pi i \xi_j \hat{f}(\xi)$（在分布意义下）。
- **Plancherel 等式**：若 $f\in$ [[lp-space|$L^2(\mathbb{R}^d)$]]，则 $\int|\hat{f}|^2=\int|f|^2$。

### 典型例子

1. **Gauss 函数**：$f(x) = e^{-\pi |x|^2}$。则 $\hat{f}(\xi) = e^{-\pi |\xi|^2}$——Gauss 函数是 Fourier 变换的特征函数（在 Stein 约定下）。这是 Parseval 与 Plancherel 等式的核心测试函数，也是热核基本解的 Fourier 变换。

2. **特征函数**：$f(x) = \chi_{[-a,a]}(x)$（区间 $[-a,a]$ 的指示函数）。则 $\hat{f}(\xi) = \frac{\sin(2\pi a\xi)}{\pi\xi}$（sinc 函数）。此例展示了 $L^1$ 函数的 Fourier 变换未必属于 $L^1$（sinc 不可积，$\int |\hat{f}| = \infty$）。

3. **指数衰减**：$f(x) = e^{-2\pi |x|}$。则 $\hat{f}(\xi) = \frac{1}{\pi}\frac{1}{1+\xi^2}$（Cauchy 分布）。$f \in L^1$ 且 $\hat{f} \in L^1$，Fourier 反演公式成立。

## Why — 动机与直观

### 为什么引入 Fourier 变换？

将 $\mathbb{R}^d$ 上的函数分解为平面波的叠加。核心洞察：**Fourier 变换将对角化平移不变算子**——平移算子 $T_a f(x) = f(x-a)$ 在 Fourier 变换下变为乘以 $e^{-2\pi i a\cdot\xi}$；微分算子 $\partial_j$ 变为乘以 $2\pi i\xi_j$。因此，常系数偏微分方程在 Fourier 变换下变为代数方程。

### 直观解释

$\hat{f}(\xi)$ 度量 $f$ 中频率 $\xi$ 的「含量」。与 Fourier 级数不同，$\mathbb{R}^d$ 上的频率是连续的（$\xi \in \mathbb{R}^d$），因此 Fourier 变换是积分变换而非级数展开。$f$ 的正则性（光滑性）对应 $\hat{f}$ 的衰减速率：$f \in C^k$ 意味着 $|\hat{f}(\xi)| = O(|\xi|^{-k})$。

## What-if — 反例、等价叙述与边界

### 反例（条件不可削弱）

1. **$L^1$ 的 Fourier 变换未必属于 $L^1$**：$f(x) = \chi_{[-1,1]}(x)$ 的 Fourier 变换 $\hat{f}(\xi) = \frac{\sin(2\pi\xi)}{\pi\xi} \notin L^1$。因此 $L^1$ 假设不足以直接用 Fourier 反演公式——需在 Schwartz 类或 $L^2$ 框架下处理。

2. **$L^1$ 的 Fourier 变换未必连续到零点**：考虑 $f(x) = \frac{1}{\sqrt{|x|}}e^{-|x|}$（$d=1$），$f \in L^1$ 但 $\hat{f}$ 在 $\xi=0$ 处不连续——因为 $\hat{f}(0) = \int f = \infty$ 的矛盾。实际上 Riemann-Lebesgue 引理保证 $\hat{f}$ 连续且趋于零，但 $\hat{f}$ 未必可积。

3. **Fourier 变换不是满射**：$L^1$ 上 Fourier 变换的像不是整个 $C_0(\mathbb{R}^d)$（连续且趋于零的函数空间）。存在 $C_0$ 函数不是任何 $L^1$ 函数的 Fourier 变换。

### 边界情形

- **$L^1 \cap L^2$ 稠密性**：Plancherel 定理的证明依赖 $L^1 \cap L^2$ 在 $L^2$ 中的稠密性——先在稠密子空间上建立等距，再扩展到整个 $L^2$。
- **不确定性原理**：$f$ 与 $\hat{f}$ 不能同时集中——$\mathrm{Var}(f) \cdot \mathrm{Var}(\hat{f}) \geq \frac{1}{16\pi^2}$（在 Stein 约定下）。极端情形：Gauss 函数达到等号。

### 等价叙述

#### 叙述 1（Stein 约定，$L^1$ 形式）

> 在 $\mathbb{R}^d$ 上，$f \in L^1(\mathbb{R}^d)$，则

$$
\hat{f}(\xi) = \int_{\mathbb{R}^d} f(x)\,e^{-2\pi i \xi \cdot x}\,dx.
$$

**核**：$e^{-2\pi i \xi\cdot x}$；**测度**：$dx$；**无 $(2\pi)^{-d}$ 因子**。

#### 叙述 2（经典约定，$L^1$ 形式）

> 在 $\mathbb{R}^d$ 上，$f \in L^1(\mathbb{R}^d)$，则

$$
\hat{f}(\xi) = \frac{1}{(2\pi)^{d/2}} \int_{\mathbb{R}^d} f(x)\,e^{-i \xi \cdot x}\,dx.
$$

**核**：$e^{-i\xi\cdot x}$；**测度**：$dx$；**有 $(2\pi)^{-d/2}$ 因子**。

#### 叙述 3（Schwartz 类形式）

> 在 $\mathbb{R}^d$ 上，$f \in \mathcal{S}(\mathbb{R}^d)$，则 Fourier 变换与逆变换均良定义且互为逆。

**等价关系**：通过换元 $\xi \to 2\pi \xi$ 与乘以 $(2\pi)^{d/2}$，叙述 1 ↔ 叙述 2 ↔ 叙述 3。本 wiki 统一采用 Stein 约定（叙述 1 / 3）。源若用叙述 2，摄取时须换算并注「〔已换算为 Stein 约定〕」。

## 证明难度差异

### 叙述 1（$L^1$ 形式）的证明

- **方法**：直接定义 + 验证基本性质（线性、平移、伸缩、卷积、导数）。
- **难度**：**低**——Stein Ch.5 §1.1–§1.2 即可完成。
- **代价**：仅适用 $L^1$；某些关键性质（如反演）需更精细的核估计。

### 叙述 3（Schwartz 类形式）的证明

- **方法**：用 Gauss 核逼近 + [[fourier-coefficient|Fourier 系数]]比较。
- **难度**：**中**——Stein Ch.5 §1.5–§1.9 涉及反演与 Plancherel 的核心论证。
- **代价**：依赖 Schwartz 类的强衰减性。

### 叙述 4（$L^2$ 形式）的证明

- **方法**：先用 $L^1 \cap L^2$ 稠密性 + Plancherel 在该子空间成立，再扩展到 $L^2$。
- **难度**：**高**——需引入 Hilbert 空间理论；Stein Ch.5 Theorem 1.12 仅用近似方法避开。
- **结论**：等距同构 $\mathcal{F}: L^2 \to L^2$。

**总评**：本 wiki 覆盖叙述 1–3；叙述 4 是 Plancherel 在 $L^2$ 上的扩展，依赖 Lebesgue 积分理论，属后续卷。

## 关联

- 概念：[[fourier-series]]（周期情形对应离散频率；Fourier 变换对应连续频率）、[[character|特征标]]。
- 方法：试验函数（test functions）与 [[schwartz-space|Schwartz 空间]]（$\mathcal{S}(\mathbb{R}^d)$）上的 Fourier 变换。
- 应用：波动方程的解可表示为 Fourier 变换的乘积；Radon 变换的研究借 Fourier 变换化简。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 5–6]]