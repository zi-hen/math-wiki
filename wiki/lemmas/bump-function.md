---
type: lemma
title: Bump 函数的构造
aliases: [bump function, bump 函数, smooth cutoff]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.5, regularity]
---

# Bump 函数的构造

> **工作空间**：实数线 $\mathbb{R}$。

## 陈述

设 $a < b$，$\delta > 0$ 满足 $a + \delta < b - \delta$。

> **引理（Ch. 5, Ex. 4, p.179）**。
> (a) 函数
> $$
> f(x) = \begin{cases} e^{-1/(x-a)}e^{-1/(b-x)}, & a < x < b, \\ 0, & x \le a \text{ 或 } x \ge b, \end{cases}
> $$
> 在 $\mathbb{R}$ 上无穷可微（紧支集于 $[a,b]$ 的 bump）；
> (b) 存在无穷可微的 $F$，$F(x) = 0$（$x \le a$）、$F(x) = 1$（$x \ge b$），且在 $[a,b]$ 上严格递增；
> (c) 存在无穷可微的 $g$，$g = 0$（$x \le a$ 或 $x \ge b$）、$g = 1$（$a+\delta \le x \le b-\delta$）。

**核心应用**：$\mathbb{R}$ 上存在紧支集的非平凡 [[schwartz-space|Schwartz 函数]]（光滑截断 / 单位分解的技术基石）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Exercise 4, p.179]]。

## 证明

**Claim 1（$e^{-1/t}$ 型函数的正规性）**。$\varphi(t) = e^{-1/t}$（$t > 0$），$\varphi(t) = 0$（$t \le 0$）在 $\mathbb{R}$ 上无穷可微。

*证明.* 对 $t > 0$，$\varphi^{(k)}(t) = P_k(1/t)e^{-1/t}$（$P_k$ 为多项式，归纳验证）；因 $\lim_{t\to 0^+}t^{-m}e^{-1/t} = 0$（指数衰减压制多项式），各阶导数在 $t \to 0^+$ 时趋于 $0$，与 $t \le 0$ 侧的 $0$ 连续衔接，故 $\varphi \in C^\infty$。$\blacksquare$

**(a)** 取 $\varphi(x-a)\varphi(b-x)$（两个 $\varphi$ 型因子）：$x \le a$ 时 $\varphi(x-a) = 0$，$x \ge b$ 时 $\varphi(b-x) = 0$，$a < x < b$ 时等于 $e^{-1/(x-a)}e^{-1/(b-x)}$；由 Claim 1 与乘积的 $C^\infty$ 性，$f \in C^\infty$ 且紧支集于 $[a,b]$。$\blacksquare$

**(b)** 令 $F(x) = c\int_{-\infty}^x f(t)\,dt$，其中 $c = \left(\int_{-\infty}^\infty f\right)^{-1}$。$f \ge 0$ 且 $f > 0$ 于 $(a,b)$ 上，故 $F$ 严格递增、$F(x) = 0$（$x \le a$）、$F(x) = 1$（$x \ge b$），且 $F' = cf \in C^\infty$。$\blacksquare$

**(c)** 取 $F$ 为 (b) 中 $a \mapsto a$、$b \mapsto b$ 的函数，令
$$
g(x) = F(x - \delta)\,\bigl(1 - F(x - b + \delta)\bigr),
$$
则 $g = 0$（$x \le a$ 或 $x \ge b$），$g = 1$（$a + \delta \le x \le b - \delta$），且 $g \in C^\infty$（(b) 中两因子之积，在各自平台区间上取值 $0$ 或 $1$ 并光滑过渡）。$\blacksquare$

## 应用

- **Schwartz 类非平凡元**（[[schwartz-space]]）：bump 给出 $C_c^\infty(\mathbb{R}) \subset \mathcal{S}(\mathbb{R})$ 的显式例子，是 Fourier 分析中试验函数的基石。
- **光滑截断（soft cutoff）**：$\int f = 1$ 归一化后的 $f$ 是 [[approx-by-good-kernel|好核逼近]] 的紧支集实例；(c) 的 $g$ 用于把局部构造延拓到全局（单位分解）。
- **Paley-Wiener 定理**（[[paley-wiener-theorem]]）：紧支集 Schwartz 函数是紧支集 Fourier 变换（整函数指数型）的典型例子。
- **无穷可微的光滑阶梯**：(b) 的 $F$ 是 $\chi_{[a,\infty)}$ 的光滑化，常用于把不等式从 $C^\infty_c$ 推广到一般函数。

## 关联

- 概念：[[schwartz-space|Schwartz 空间]]、[[fourier-transform]]、[[good-kernel]]（紧支集好核）
- 定理：[[paley-wiener-theorem]]、[[plancherel-theorem]]（试验函数框架）
- 方法：[[approx-by-good-kernel|近似核逼近]]（Gauss 磨光的紧支集变体）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5, Exercise 4, p.179）
