---
type: lemma
title: 绝对收敛判别
 aliases: [absolute convergence, comparison test]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [analysis, convergence-tests]
---

# 绝对收敛判别

> **工作空间**：$\mathbb{C}$ 上序列 / 级数。

## 陈述

**比较判别**：设 $\sum a_n, \sum b_n$ 均为非负项级数，$0 \le a_n \le b_n$。若 $\sum b_n$ 收敛，则 $\sum a_n$ 收敛；且 $\sum a_n \le \sum b_n$。

**比率判别**：若 $a_{n+1}/a_n \to L < 1$（$n \to \infty$），则 $\sum a_n$ 收敛；若 $L > 1$，则发散。

**根判别**：若 $\sqrt[n]{|a_n|} \to L < 1$，则 $\sum a_n$ 绝对收敛；若 $L > 1$，发散。

**绝对收敛蕴含收敛**：$\sum |a_n| < \infty \Rightarrow \sum a_n$ 收敛。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 2 §2 Corollary 2.3]]（圆群 Fourier 级数一致收敛条件：$\hat f \in \ell^1 \Rightarrow$ 一致收敛）。

## 证明（简要）

比较判别：$0 \le \sum_{n=1}^N a_n \le \sum_{n=1}^N b_n \le \sum_{n=1}^\infty b_n < \infty$，单调有界 ⇒ 收敛。比率 / 根判别：与几何级数 $\sum L^n$ 对照。

$\blacksquare$

## 应用

- **Ch. 2 Corollary 2.3**：若 $f \in C(\mathbb{T})$ 且 $\hat f \in \ell^1$，则 Fourier 级数一致收敛于 $f$。
- **Ch. 5 Fourier 反演前置**：[[schwartz-space|Schwartz 类]]的 $|\hat f|$ 衰减保证绝对收敛。

## 关联

- 概念：[[ellp-space|$\ell^p$ 空间]]
- 定理：[[fourier-inversion]]、[[poisson-summation-formula]]
- 源：[[steinFourierAnalysisIntroduction2003a]]
