---
type: method
title: Cesàro 求和法
aliases: [Cesàro summation, Cesàro mean]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [summation-method, fourier-analysis]
strength: standard
strength_basis: 条件：发散或部分收敛的 Fourier 级数 / 序列（弱——只需部分和有界）；结论：用部分和的算术平均替换原级数，若极限存在则称 Cesàro 可和。Stein 在 Ch. 4 §5 用此证 Fejér 定理（连续函数 Fourier 级数 Cesàro 一致收敛）。
---

# Cesàro 求和法

> **工作空间**：任何 Banach 空间或 $\mathbb{C}^n$ 上的序列 / 级数。Stein 在 Ch. 4 §5 应用。

## 核心思想

给定部分和 $S_N = \sum_{n=1}^N a_n$，定义**Cesàro 平均**（一阶）：
$$
\sigma_N = \frac{1}{N} \sum_{k=0}^{N-1} S_k.
$$

若 $\sigma_N \to s$，称原级数 **Cesàro 可和到 $s$**。

推广：$k$ 阶 Cesàro 平均 $(C, k)$：
$$
\sigma_N^{(k)} = \frac{1}{\binom{N + k}{k}} \sum_{j=0}^{N} \binom{N - j + k}{k} S_j.
$$

## Stein 出现位置

- **Ch. 4 §5 Lemma 5.1**（Fejér 核）：$F_N = \frac{1}{N}(D_0 + D_1 + \cdots + D_{N-1})$ 恰好是 Dirichlet 核 $D_n$ 的 Cesàro 平均。
- **Ch. 4 §5 Theorem 5.2**：Fejér 定理——连续函数 Fourier 级数 Cesàro 一致收敛。
- **Ch. 4 §5 Corollary 5.4**：连续函数被三角多项式一致逼近（Weierstrass）。

## 典型应用

- **Fejér 定理**（最经典）：因 Dirichlet 核**不**是[[good-kernel|好核]]（$L^1$ 无界），但其 Cesàro 平均（Fejér 核）是好核——这是用 Cesàro 救 Fourier 级数收敛性的核心思想。
- **Abel 求和**（相关但不同）：以 $A(r) = \sum a_n r^n$（$0 \le r < 1$）的 $r \to 1^-$ 极限代替原级数（Stein Ch. 4 §5 末尾）。

## 与已有 method 的关系

- **与 [[approx-by-good-kernel]]**：Cesàro 求和的副产品（Fejér 核）是好核，故它本质上是「造一个好核」的构造手段。
- **与 [[integral-truncation]]**：两者都是"截断 + 修正"思想——Cesàro 通过平均，截断通过限范围。

## 关联

- 概念：[[lp-space|$L^p$ 空间]]
- 定理：[[fejer-theorem|Fejér 定理]]、[[weierstrass-approximation-trig]]、[[gibbs-phenomenon]]（Cesàro 平均消除过冲）
- 引理：[[dirichlet-kernel-l1-norm|Dirichlet 核的 $L^1$ 范数]]（部分和范数无界 ⟹ 需平均化）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 4 §5）
