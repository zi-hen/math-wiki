---
type: method
title: 对参数求导（积分号下求导）
description: 在积分号下对参数求导——由被积函数对参数的正则性推出积分定义函数的可微性/全纯性，或化简参数积分（Feynman 技巧）
aliases: [differentiation under the integral sign, 参数化微分, Feynman 技巧, Leibniz integral rule]
created: 2026-08-13
updated: 2026-08-13
sources: [steinComplexAnalysis, steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [complex-analysis, fourier-analysis, method, calculus]
strength: standard
strength_basis: 条件：被积函数对积分变量与参数的联合连续/一致可微与局部控制（弱——只需局部正则性）；结论：导数可进入积分号内，积分定义函数自动可微甚至全纯（强——这是 Cauchy 高阶导数公式、Paley-Wiener 整函数延拓、参数化全纯、Feynman 积分求值等证明的核心步骤）。
---
# 对参数求导（积分号下求导）

> **工作空间**：参数 $z$（或 $a$）属于复平面 $\mathbb{C}$ 的开集（或实区间）；积分变量属于圆群/实直线等。

## 适用场景

- **分析性用法**：证明积分定义的函数可微/全纯——$f(z) = \int F(z, s)\,ds$ 由 $F$ 对 $z$ 的正则性与联合连续性推出 $f$ 的正则性（参数化全纯，Stein Theorem 5.4）；
- **计算性用法**：在积分号下对参数求导获得简化积分（Feynman 技巧）——对 $a$ 求导将难积分的被积函数化为可积形式；
- 对含核 $e^{2\pi i\xi z}$ 的积分对 $z$ 求导（核的指数型行为直接暴露，如 [[paley-wiener-theorem]] 中整函数性的证明）；
- **不适用**：被积函数关于参数不一致可微或无一致控制时，须先验证交换条件（一致收敛或 [[dominated-convergence|控制收敛]]）。

## 关键思想

将导数运算与积分运算交换：
$$
\frac{d}{dz} \int F(z, s)\,ds = \int \frac{\partial}{\partial z} F(z, s)\,ds.
$$

「对参数求导」的两种用法共享同一机制：
1. 分析性——由被积函数的正则性证明积分函数的正则性（参数化全纯/可微）；这是 [[amplification|增强技巧]]「参数化增强」的姊妹技巧；
2. 计算性——对参数求导把难积分化为易积分（如 $\frac{d}{da} I(a)$ 得到 $\int_0^\infty e^{-at}\sin t\,dt = \frac{1}{1+a^2}$）。

交换的合法性由被积函数在参数局部一致可微且导数项有可积控制保证（一致收敛论证或 [[dominated-convergence|控制收敛]]）。

## 步骤（可选）

1. 识别可导参数 $a$（或 $z$）与积分变量；
2. 验证：被积函数对参数局部一致可微，且导数项有可积控制；
3. 在积分号下求导，得到简化积分；
4. 求解简化积分（常为初等积分或递推），再对参数积分/由边界条件定积分常数。

## 陷阱

- **未验证交换条件**时积分号下求导可能失效（极限与积分不可交换）；
- 对**复参数**求导须先确认被积函数对 $z$ 全纯（否则用实部/虚部分别处理）；
- Feynman 求值中，积分常数须由边界条件（如 $a \to \infty$）确定。

## 实例

- 在 [[cauchy-integral-formula]] 中：高阶导数公式 $f^{(n)}(z) = \frac{n!}{2\pi i}\int \frac{f(\zeta)}{(\zeta-z)^{n+1}}\,d\zeta$ 的「在积分号下求导」；
- 在 [[paley-wiener-theorem]] 中：逆向定理 Claim 4——$f(z) = \int_{-M}^{M}\hat f(\xi)e^{2\pi i\xi z}\,d\xi$ 在积分号下求导，证明整函数性；
- 在 [[morera-theorem]] 中：Theorem 5.4 参数积分 $f(z) = \int_0^1 F(z, s)\,ds$ 的全纯性（亦见 [[amplification|增强技巧]] 应用 3）；
- 在 [[ch4-ex12-feynman]] 中：$I(a) = \int_0^\infty e^{-at}\frac{\sin t}{t}\,dt$ 对 $a$ 求导得 $-\frac{1}{1+a^2}$。

## 相关命题

- 依据 [[cauchy-inequalities|Cauchy 不等式]]：由高阶导数公式推出的导数上界；
- 依据 [[fubini-tonelli|Fubini]] / [[dominated-convergence|控制收敛]]：积分与极限（导数）交换的合法性基础。

## 来源

- [[steinComplexAnalysis|Stein & Shakarchi (2003), 《Complex Analysis》, Ch. 2, Theorem 5.4, p.75; Ch. 4, §3]]
- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 4, Exercise 12, p.80]]
