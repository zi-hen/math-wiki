---
type: method
title: 好核逼近
aliases: [approximation by good kernel, good-kernel approximation, Gauss mollification, mollification by Gauss kernel, 磨光, Gauss 磨光]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, approximation]
strength: standard
strength_basis: 条件：一族函数 $\{K_n\}$ 满足好核三条件（单位质量 / $L^1$ 有界 / 质量集中）；结论：$K_n$ 与 $f$ 的卷积逼近 $f$（在 $f$ 连续点处）。Stein 在 Ch. 2 §5、Ch. 4 §2、Ch. 5 反复使用。
---
# 好核逼近

> **工作空间**：圆群 $\mathbb{T}$ 或 $\mathbb{R}^d$。

## 核心思想

若 $\{K_n\}_{n \to \infty}$ 是满足三条件的好核族（参 [[good-kernel]]），则
$$
(f * K_n)(x) \to f(x), \quad n \to \infty
$$
在 $f$ 连续点处成立；$f$ 处处连续时为一致收敛。

好核逼近的典型实例依工作空间而异：圆群上的 Dirichlet / Fejér 核、$\mathbb{R}$ 上的 Poisson 核，以及**Gauss 核**（见下文「特例」小节）——后者是连续 Fourier 分析（Ch. 5）的核心工具。

## 特例：Gauss 磨光（Gauss mollification）

> **工作空间**：实直线 $\mathbb{R}$（亦可推广 $\mathbb{R}^d$）。Stein Ch. 5 §1 严格用法。

### 核心构造

取 Gauss 核（Stein 约定）：
$$
K_\delta(x) = \delta^{-1/2} e^{-\pi x^2 / \delta}, \qquad \delta > 0.
$$

$\{K_\delta\}_{\delta \to 0}$ 是好核族（三条件：单位质量 $\int K_\delta = 1$、$L^1$ 有界、质量集中于原点），故是好核逼近框架的特例。定义
$$
(f * K_\delta)(x) = \int_{\mathbb{R}} f(y) K_\delta(x - y)\,dy.
$$

* 磨光：$f * K_\delta \in C^\infty$（对任意 $\delta > 0$）。
* 逼近：$f * K_\delta \to f$ 一致（Ch. 5 Corollary 1.7）。
* Fourier 显式：$\widehat{f * K_\delta}(\xi) = \hat{f}(\xi) e^{-\pi \delta \xi^2}$——由 Ch. 5 Theorem 1.4（Gauss 函数 Fourier 变换的恒等点 $\widehat{e^{-\pi x^2}} = e^{-\pi \xi^2}$）与 Corollary 1.5（$\hat{K}_\delta(\xi) = e^{-\pi \delta \xi^2}$）给出。

### 磨光-极限用法

Gauss 磨光在 Fourier 反演与 Plancherel 中的标准路径是**先磨光、再取极限 $\delta \to 0$**：

- **Fourier 反演**（Ch. 5 Theorem 1.9）：用 **$K_\delta$ 的反演恒等式**（由 Theorem 1.4 + 缩放对**显式 $K_\delta$** 独立给出, 不依赖 Theorem 1.9）展开 $f * K_\delta = \int e^{-\pi\delta\xi^2} e^{2\pi i x\xi} \hat f(\xi) d\xi$（Fubini 交换），再令 $\delta \to 0$ 得 $f(x) = \int \hat f(\xi) e^{2\pi i x\xi} d\xi$（详见 [[fourier-inversion]]）。**关键**: 第二阶段的内层积分是 **Fourier 变换定义**（非反演）, 不构成对 Theorem 1.9 的循环。
- **Plancherel 定理**（Ch. 5 Theorem 1.12）：将 $\mathcal{S}$ 上的等距结果经 $L^2$ 稠密性 + 磨光延拓至 $L^2$（详见 [[plancherel-theorem]]）。
- **$\hat{\mathcal{S}} = \mathcal{S}$ 封闭性**（Ch. 5 Theorem 1.3）：Fourier 变换保持 [[schwartz-space|Schwartz 类]]，磨光核的显式 Fourier 形式支撑该证明。
- **半平面调和方程**（Ch. 5 Theorem 2.6）：$\mathbb{R}$ 版 Poisson 核是好核（更优的磨光），用于解 Dirichlet 问题。

### 与 multiplication-formula-trick 的配合

用 Gauss 核的 Fourier 显式形式 $\hat K_\delta(\xi) = e^{-\pi\delta\xi^2}$ 可辅助构造 $g_\delta = f * K_\delta$ 的 Fourier 表示, 但 **Plancherel 本身的证明**走的是 Fourier 反演（Theorem 1.9）+ Fubini 交换路线（见 [[plancherel-theorem]] 主证明）, 不是直接靠 Gauss 核验证. 见 [[multiplication-formula-trick]] lemma 页.

## Stein 出现位置

- **Ch. 2 §5 Theorem 4.1**（圆群）：好核逼近
- **Ch. 4 §2**（再述）：Poisson / Dirichlet / Fejér / Heat 核作为好核的具体例
- **Ch. 5 §1.2**（[[schwartz-space|Schwartz 框架]]）：Gauss 核 $K_\delta$ 作为 $\delta \to 0$ 的好核族，用于 Fourier 反演（Ch. 5 Theorem 1.6）
- **Ch. 5 Theorem 1.4 / Corollary 1.5**：Gauss 函数 Fourier 变换恒等点与磨光核的显式 Fourier 形式
- **Ch. 5 Theorem 2.6**：$\mathbb{R}$ 版 Poisson 核是好核（更优的磨光）

## 典型应用

- **Ch. 2 Theorem 4.1**：好核 → 卷积逼近原函数
- **Ch. 4 Theorem 5.2**：Fejér 核是好核 → 连续函数 Fourier 级数 Cesàro 一致收敛
- **Ch. 4 Theorem 5.6**：Poisson 核是好核 → 调和方程边界逼近
- **Ch. 4 Theorem 5.7**：Poisson 核圆盘调和方程解
- **Ch. 5 Theorem 1.9**：Gauss 核好核 → Fourier 反演（[[fourier-inversion]]）
- **Ch. 5 Theorem 1.12**：Gauss 磨光 → Plancherel 的 $L^2$ 延拓（[[plancherel-theorem]]）
- **Ch. 5 Theorem 2.6**：Poisson 核 $\mathbb{R}$ 版好核 → 半平面调和方程解

## 与已有 method 的关系

- **与 [[good-kernel]]**：好核是定义概念；好核逼近是依赖它的工具方法。
- **与 [[multiplication-formula-trick]]**：配合使用——用 Gauss 核的 Fourier 显式形式避开抽象展开。
- **与 [[integral-truncation|积分截断]]**：Gauss 磨光是「截断」的连续版本——Gauss 核替代硬截断（见 [[integral-truncation]]）。
- **与 [[contour-integration|围道平移（积分法变体）]]**：完全不同的工具，一个用卷积，一个用围道形变。

## 关联

- 概念：[[good-kernel]]、[[lp-space|$L^p$ 空间]]、[[schwartz-space|Schwartz 类]]、[[bump-function|bump 函数]]（紧支集好核的构造）
- 定理：[[poisson-summation-formula]]、[[fourier-inversion]]、[[plancherel-theorem]]、[[cauchy-theorem]]、Ch. 4 Theorem 5.2 等
- 源：[[steinFourierAnalysisIntroduction2003a]]
