---
type: lemma
title: Rolle 与均值定理
 aliases: [Rolle's theorem, mean value theorem, MVT]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [analysis, calculus]
---

# Rolle 与均值定理

> **工作空间**：实区间 $[a, b]$ 上的 $C^1$ 函数。

## 陈述

**Rolle 定理**：若 $f \in C^1([a, b])$ 且 $f(a) = f(b)$，则存在 $\xi \in (a, b)$ 使 $f'(\xi) = 0$。

**均值定理**（MVT）：若 $f \in C^1([a, b])$，则存在 $\xi \in (a, b)$ 使
$$
f'(\xi) = \frac{f(b) - f(a)}{b - a}.
$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 2 §1.3, p.56]]（均值定理用于 Fourier 级数在可微点的逐点收敛，Theorem 2.1）。

## 证明（简要）

Rolle：辅助函数 $g(t) = \int_a^t f'(s) ds - \lambda \cdot (\text{线性})$，由极值点给出 $f'(\xi) = 0$。MVT：构造 $h(t) = f(t) - \big(f(a) + (t-a)\frac{f(b)-f(a)}{b-a}\big)$，应用 Rolle。

$\blacksquare$

## 应用

- **Ch. 3 Theorem 2.1**（Riemann 局部化证明）：用 MVT 推出 $f(\theta_0 - t) - f(\theta_0) = t f'(\theta_0 - ct)$ 形式，得到 Riemann-Lebesgue 的精细版本。
- **Lipschitz 估计**：[[fourier-coefficient|Fourier 系数]] $\hat f(n) = O(1/|n|)$（Ch. 3 Exercise 16）

## 关联

- 定理：[[riemann-localization]]
- 源：[[steinFourierAnalysisIntroduction2003a]]
