---
type: lemma
title: 极点判定准则
aliases: [criterion for poles, removable singularity criterion]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, isolated-singularity]
---
# 极点判定准则

> **工作空间**：$\mathbb{C}$ 中 $z_0$ 的去心邻域 $D_r(z_0) \setminus \{z_0\}$。

## 陈述

设 $f$ 在 $z_0$ 处有孤立奇点（即在 $z_0$ 的某去心邻域全纯）。则 $z_0$ 是 $f$ 的**极点**当且仅当
$$
|f(z)| \to \infty \quad \text{当 } z \to z_0.
$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Corollary 3.2, p.104]]。

## 证明

**($\Leftarrow$)** 设 $|f(z)| \to \infty$ 当 $z \to z_0$。由 [[isolated-singularity]] 中的 Riemann 可去定理（[[steinComplexAnalysis|Stein, p.103]]），$z_0$ 不是可去奇点。又 $f$ 在 $z_0$ 邻域无界，故 $z_0$ 不是可去奇点。又由 [[steinComplexAnalysis|Stein, p.91]] 三分法，$z_0$ 为极点。

**($\Rightarrow$)** 若 $z_0$ 为极点，局部 $f(z) = (z - z_0)^{-n} g(z)$（$g(z_0) \neq 0$，$g$ 全纯，$n \geq 1$）。故 $|f(z)| = |z - z_0|^{-n} |g(z)|$。当 $z \to z_0$，$|z - z_0|^{-n} \to \infty$，$|g(z)| \to |g(z_0)| > 0$。故 $|f(z)| \to \infty$。 $\blacksquare$

## 应用

- [[isolated-singularity]]（孤立奇点的分类判定）
- [[residue-theorem]]（极点阶数计算的准备）
- [[meromorphic-function]]（亚纯函数定义中极点的判定）
