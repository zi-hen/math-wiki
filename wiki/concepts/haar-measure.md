---
type: concept
title: Haar 测度
aliases: [Haar measure, Haar measure on locally compact group]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [real-analysis, group-theory, fourier-analysis]
strength: standard
strength_basis: 条件：局部紧拓扑群 $G$（弱——自然放宽）；结论：$G$ 上存在平移不变正则 Borel 测度（Haar 测度），且在 $G$ 紧时唯一（强——存在性 + 唯一性）。Haar 测度是局部紧阿贝尔群上 Pontryagin 对偶、抽象 Fourier 分析的基础。
---

# Haar 测度

> **工作空间**：局部紧 Hausdorff 群 $G$。Stein 在 Ch. 7 §2 提及基础存在性，详细证明在后续 Real Analysis 卷。

## What — 定义与基本事实

### 定义

局部紧 Hausdorff 群 $G$ 上的**Haar 测度** $\mu$ 是 $G$ 上的非零正则 Borel 测度，满足**左平移不变性**：
$$
\mu(gE) = \mu(E), \qquad \forall g \in G, \forall E \text{ Borel}.
$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 7]]。

### 基本性质

1. **存在性**：每个局部紧 Hausdorff 群 $G$ 上 Haar 测度存在（Haar 1933）。
2. **紧群上唯一**：若 $G$ 紧，Haar 测度在归一化下唯一（$\mu(G) = 1$）。
3. **离散有限群**：$G$ 离散有限时，$\mu = \frac{1}{|G|} \cdot \text{counting measure}$。
4. **$\mathbb{R}$ 与 $\mathbb{T}$**：Haar 测度退化为 Lebesgue 测度（$\mathbb{R}$）与 $\frac{1}{2\pi} d\theta$（$\mathbb{T}$）。
5. **Fourier 变换基**：在阿贝尔 $G$ 上，$\int_G f \,d\mu$ 与 Fourier 变换 $\hat{f}(\chi) = \int_G f(g) \overline{\chi(g)} d\mu(g)$ 自然联系。

## Why — 动机与直观

### 为什么引入 Haar 测度？

抽象调和分析的基底。Stein 在 Ch. 7 §2.2 中将 $\mathbb{Z}(N)$ 上 Fourier 视为 $\frac{1}{N}\sum$（左不变测度的离散类比）；Dirichlet 定理（Ch. 8）的特征标分解建立在 $(\mathbb{Z}/q\mathbb{Z})^*$ 上的离散 Haar 测度上。

## What-if — 等价叙述

### 等价叙述

1. **左不变 Haar 测度**：满足 $\mu(gE) = \mu(E)$。
2. **右不变 Haar 测度**：满足 $\mu(Eg) = \mu(E)$；在阿贝尔群上两者一致。

**等价关系**：在阿贝尔群上两者 iff（阿贝尔群左 = 右）。

## 关联

- 概念：[[character]]、[[regular-measure]]、[[finite-abelian-group]]
- 定理：[[dirichlet-theorem-on-primes]]（在 $\mathbb{Z}^*(q)$ 上展开）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 7 §2 引入）
