---
type: concept
title: 正则测度
aliases: [regular measure, 正则 Borel 测度]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [real-analysis, measure-theory]
strength: standard
strength_basis: 条件：拓扑空间 $X$ 上的 Borel 测度 $\mu$（弱——只需 Borel 性）；结论：$\mu$ 满足"内正则 + 外正则"性质（强——使得紧集 / 开集的近似计算成为可能）。正则测度是拓扑群上调和分析的基础（与 Haar 测度密切相关）。
---

# 正则测度

> **工作空间**：局部紧 Hausdorff 拓扑空间 $X$ 上 Borel 测度 $\mu$。Stein 在后续 Real Analysis 卷系统展开。

## What — 定义与基本事实

### 定义

$\mu$ 是拓扑空间 $X$ 上的 Borel 测度，称 **正则**，若：

1. **外正则**：$\mu(E) = \inf \{\mu(U) : E \subseteq U, U \text{ 开}\}$ 对所有 Borel 集 $E$。
2. **内正则**：$\mu(E) = \sup \{\mu(K) : K \subseteq E, K \text{ 紧}\}$ 对所有 Borel 集 $E$。

### 基本性质

1. **黎曼积分结构**：正则性使得 $\int f d\mu = \sup\{\text{下积分}\} = \inf\{\text{上积分}\}$（黎曼 / Daniell 框架）。
2. **紧集近似**：所有有限测度的 Borel 集可被紧集逼近（$\sigma$-有限性 + 内正则）。
3. **Haar 测度的预备**：局部紧群上的 Haar 测度自动正则。

## Why — 动机与直观

### 为什么引入正则测度？

正则性是"紧集 / 开集"成为研究测度的基本构件。在局部紧 Hausdorff 群上，**正则性 + Haar 测度**给调和分析提供完整框架。Stein Ch. 7 §2.2 中隐含使用正则性：在有限群上 Dirac 测度的归一化用到 $\frac{1}{|G|}\sum_{a \in G} D(a) = 1$（这是内正则的极端情形）。

## 关联

- 概念：[[haar-measure]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 7 §2 隐式使用）
