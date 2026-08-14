---
type: lemma
title: 有界可积函数由一致有界连续函数在 L¹ 中逼近（Stein Ch. 2 Lemma 3.2）
aliases: [Ch. 2 Lemma 3.2, integrable L1 approximation by continuous functions, bounded integrable approximation]
description: 圆上有界 Riemann 可积函数可由一致有界连续函数在 L¹ 范数下逼近——Parseval 与均方收敛证明中连接「一般可积函数」与「连续函数」的桥梁。
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, approximation, Riemann-integration]
---

# 有界可积函数由一致有界连续函数在 L¹ 中逼近（Stein Ch. 2 Lemma 3.2）

> **工作空间**：$\mathbb{T} = \mathbb{R} / 2\pi\mathbb{Z}$（圆群），函数类为**Riemann 可积**（Stein 在 Fourier 级数前四章的默认框架；不要求 Lebesgue 积分）。

## 陈述

> **Lemma 3.2（Stein, Ch. 2, p.65）**。设 $f$ 为圆上的可积函数且 $|f(\theta)| \le B$。则存在连续函数序列 $\{f_k\}_{k=1}^{\infty}$ 满足
> 1. **一致有界性**：$\sup_{x\in[-\pi,\pi]} |f_k(x)| \le B$；
> 2. **$L^1$ 收敛**：$\int_{-\pi}^{\pi} |f(x) - f_k(x)|\,dx \to 0$（$k \to \infty$；此为 [[lp-space|$L^1$ 范数]] 意义下的收敛）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 2, Lemma 3.2, p.65]]。

## 证明

证法为**褶积逼近**（参见 [[approx-by-good-kernel|好核逼近]] 的方法概述）：

1. 取一族好核 $K_N$（如 Fejér 核 $F_N$，见 [[good-kernel|好核]]）；
2. 令 $f_k = f * K_N$（$k \to \infty$ 时 $N \to \infty$）；
3. 由 [[good-kernel|好核条件]]，$f * K_N$ 连续（卷积正则化）且一致收敛于 $f$；
4. 由 $|f|\le B$ 与 $K_N$ 非负且 $\int K_N = 1$，立即得 $\sup|f*K_N|\le B$（保持有界性）。

$\blacksquare$

> **注（Stein 框架的特点）**。Stein 不引入测度论与 Lebesgue 积分。Lemma 3.2 正是用以替代 Lebesgue 框架中"$C(\mathbb{T})$ 在 $L^1(\mathbb{T})$ 中稠密"这条抽象事实——后者在 Lebesgue 理论中由 Lusin 定理或简单函数逼近直接得到，但在 Riemann 框架下需要显式构造。Parseval 与均方收敛的证明中，**这一步不可省略**：它把"任意可积（有界）函数"化归为"连续函数"，再由 Fejér / Weierstrass 三角多项式逼近处理。

> **依赖关系小结**：本证明依赖链为「[[good-kernel|好核]]（Fejér 核）的核性质 ⇒ 卷积 $f * K_N$ 的正则化（连续性）与一致收敛 ⇒ 一致有界性（$|f|\le B$ 与 $K_N$ 非负归一）」。定理级依赖仅 [[good-kernel|好核]] 的定义与逼近性质，其余为卷积与积分的基本估计。本证明**不依赖** Parseval、均方收敛或 Fejér 定理本身（该引理是这些定理的证明工具，而非其推论）。依赖图无环。

## 应用

- [[parseval-identity]]：在「详细证明」第二阶段使用——化归一般可积函数为连续函数，再由 Fejér / Weierstrass 一致逼近完成 $L^2$ 逼近。
- [[mean-square-convergence]]：在「详细证明」中以相同方式使用；均方收敛定理的整个证明结构依赖此引理。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 2, Lemma 3.2, p.65]]

---

**注**: 引理页与定理页的区别见 [docs/SCHEMA.md](../docs/SCHEMA.md)「引理页（Lemma）」节。

- 无 `strength` 与 `strength_basis` 字段。
- 无 What/Why/What-if 框架。
- 无「证明动机」「证明思路」「详细证明」分层。
- 必须列出「应用」区段（已包含 2 个引用页）。