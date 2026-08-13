---
type: lemma
title: 控制收敛定理
 aliases: [Dominated Convergence Theorem, DCT]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [analysis, measure-theory]
---

# 控制收敛定理

> **工作空间**：测度空间 $(X, \mu)$。

## 陈述

设 $\{f_n\}$ 是 $(X, \mu)$ 上可测函数序列，$f_n \to f$ 逐点 a.e.。若存在**可积控制函数** $g \in L^1(\mu)$ 使 $|f_n(x)| \le g(x)$（a.e.），则
$$
\int_X |f_n - f|\,d\mu \to 0, \quad \int_X f_n\,d\mu \to \int_X f\,d\mu.
$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis 与 Real Analysis 卷]]。

**〔Stein 不使用〕** Stein Fourier 卷采用 Riemann 积分框架，避免此定理；本引理作为工具预备。

## 证明（简要）

应用 Fatou 引理（也是 Stein 不使用）到 $|g| - |f_n - f|$：先证 $\int |f| \le \liminf \int |f_n| < \infty$，再证 $\int |f_n - f| \to 0$。

$\blacksquare$

## 应用

- **$\mathcal{S}$ 封闭性**（后续卷）：$\hat{\mathcal{S}} = \mathcal{S}$ 的 $L^2$ 延拓
- **Plancherel 定理的 $L^2$ 延拓**：Plancherel 在 $L^1 \cap L^2$ 成立后用 DCT 扩张

## 关联

- 概念：[[lp-space|$L^p$ 空间]]、[[schwartz-space|Schwartz 空间]]
- 源：[[steinComplexAnalysis]]（Stein Fourier 卷不显式使用）
- 注：[[plancherel-theorem]] 的 $L^2$ 延拓须此引理
