---
type: lemma
title: 乘法公式技巧
aliases: [multiplication formula trick, Parseval-Plancherel convolution trick]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, schwartz]
---

# 乘法公式技巧

> **工作空间**：实直线 $\mathbb{R}$（亦推广 $\mathbb{R}^d$）。Stein Ch. 5 Proposition 1.8 严格建立。

## 陈述

> 设 $f, g \in \mathcal{S}(\mathbb{R})$（[[schwartz-space|Schwartz 空间]]），则
> $$
> \int_{\mathbb{R}} f(x)\,\overline{g(x)}\,dx = \int_{\mathbb{R}} \hat f(\xi)\,\overline{\hat g(\xi)}\,d\xi.
> $$

即内积与 Fourier 变换对易（Fourier 变换的酉性在 Schwartz 框架下的初等形式）。依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 5, Proposition 1.8]]。

## 证明

将右端写成双积分并交换求积次序（双积分 $\iint f(x)\overline{g(y)} e^{-2\pi i x y}\,dx\,dy$ 的两种「哪个求和先做」路径给出等式两端）：
$$
\int \hat f(\xi)\,\overline{\hat g(\xi)}\,d\xi = \int \hat f(\xi)\Big(\int \overline{g(y)}\, e^{2\pi i\xi y}\,dy\Big)d\xi = \int \overline{g(y)}\Big(\int \hat f(\xi)\, e^{2\pi i\xi y}\,d\xi\Big)dy.
$$
中间等号由 $f, g \in \mathcal{S}$ 的绝对可积性（[[fubini-tonelli|Fubini 定理]]）保证；内层积分正是 [[fourier-inversion|Fourier 反演]] $\int \hat f(\xi) e^{2\pi i\xi y}\,d\xi = f(y)$，故右端等于 $\int \overline{g(y)} f(y)\,dy$。$\blacksquare$

> **依赖关系小结**：本证明依赖链为「[[fubini-tonelli|Fubini 定理]]（交换双积分次序，由 $f,g\in\mathcal{S}$ 的绝对可积性保证）⇒ [[fourier-inversion|Fourier 反演]]（对内层积分求值）⇒ 乘法公式」。依赖方向为本页 ⇒ [[fourier-inversion|Fourier 反演]]，而 Fourier 反演独立建立（Gauss 磨光路线），**不反向依赖**本引理；Plancherel 定理的主证明亦不经由此引理推出。本证明除 Fubini 与 Fourier 反演外无定理级依赖，依赖图无环。

## 应用

- [[plancherel-theorem]]：取 $g = f$ 即得 $\|f\|_2 = \|\hat f\|_2$（Ch. 5 Theorem 1.12）。
- [[fourier-inversion]]：乘法公式与 Fourier 反演相互支撑，Plancherel 由二者结合推出。
- [[heisenberg-uncertainty-principle]]：乘法公式 + Schwarz 不等式给出 $\sigma_x \sigma_\xi \geq 1/(4\pi)$（Ch. 5 Exercise 23）。