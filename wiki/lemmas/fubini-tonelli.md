---
type: lemma
title: Fubini-Tonelli 定理
 aliases: [Fubini-Tonelli theorem, Fubini, Tonelli]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a, steinComplexAnalysis]
status: verified
tags: [analysis, measure-theory]
---

# Fubini-Tonelli 定理

> **工作空间**：测度空间 $(X, \mathcal{M}, \mu)$、$(Y, \mathcal{N}, \nu)$，乘积空间 $X \times Y$。

## 陈述

设 $f: X \times Y \to \mathbb{C}$ 可测。

**(Tonelli)**：若 $f \geq 0$，则
$$
\int_{X \times Y} f\, d(\mu \otimes \nu) = \int_X \left( \int_Y f(x, y)\, d\nu(y) \right) d\mu(x) = \int_Y \left( \int_X f(x, y)\, d\mu(x) \right) d\nu(y).
$$
（$\int = \infty$ 时仍成立。）

**(Fubini)**：若 $f \in L^1(X \times Y)$（绝对可积），则
- $f(x, \cdot) \in L^1(Y)$ 对 a.e. $x$；
- $f(\cdot, y) \in L^1(X)$ 对 a.e. $y$；
- 两个累次积分均等于 $\int_{X \times Y} f\, d(\mu \otimes \nu)$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, 后续 Real Analysis 卷]] 与 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis Ch. 6]]。

## 证明（简要）

1. **Tonelli**（非负情形）：先证对 $f = \chi_A$（$A \in \mathcal{M} \otimes \mathcal{N}$），由可测矩形张成。
2. **Fubini**（一般情形）：将 $f$ 拆为 $f = f^+ - f^-$。由 Tonelli 应用于 $|f|$ 给出 $|f| \in L^1$ ⇒ $f \in L^1$，且逐点绝对可积。

$\blacksquare$

## 应用

- [[poisson-summation-formula|Poisson 求和公式]]：在 Claim 2（积分与求和可交换性）证明中使用 Fubini 控制交换。
- Complex Analysis 卷（citekey：`steinComplexAnalysis`）：重积分换序。
- **Chebyshev 不等式**、**Fubini 测度的密度**
- **期望值与边际分布**：概率论核心

## 关联

- 概念：[[character|特征标]]
- 定理：[[poisson-summation-formula]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（隐式）+ [[steinComplexAnalysis]]（Ch. 6 详）
