---
type: exercise
title: Ch.7 Exercise 5: 圆群特征标完整刻画
aliases: [Ch.7 Ex.5, circle characters]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [number-theory, group-theory, Ch.7]
chapter: Ch.7
number: Ex.5
---

# Ch.7 Exercise 5：$S^1$ 特征标完整刻画

## 陈述

> 证明 $S^1$ 的所有连续特征标恰好是 $e_n(x) = e^{2\pi i n x}$（$n \in \mathbb{Z}$），并验证 $e_n \mapsto n$ 给出 $\widehat{S^1}$ 与 $\mathbb{Z}$ 的同构。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 7, Exercise 5, p.254]]。

## 思路提示

把 $S^1$ 上的特征标 $e$ 提升为 $\mathbb{R}$ 上的函数 $F(x) = e(e^{2\pi i x})$（周期 $1$），则 $F$ 连续且满足**柯西方程**
$$
F(x + y) = F(x)F(y), \qquad F(0) = 1.
$$
剩下的问题归结为：解柯西方程并施加周期条件 $F(1) = 1$。本题用 **Stein 的提示（途径 A：积分-微分法）** 完成解答；同一定理另有「归纳-有理数逼近法」（途径 B），两种解法在下方「补充」中并列给出。

## 解答（途径 A：Stein 提示——积分-微分法）

**步骤 1：积分技巧证明 $F$ 可微。** 由 $F(0) = 1$ 与 $F$ 的连续性，取 $\delta > 0$ 充分小使
$$
c = \int_0^\delta F(y)\,dy \neq 0.
$$
由函数方程 $F(x+y) = F(x)F(y)$，
$$
cF(x) = \int_0^\delta F(x)F(y)\,dy = \int_0^\delta F(x+y)\,dy = \int_x^{x+\delta} F(z)\,dz.
$$
右端作为 $x$ 的函数可微（微积分基本定理，$F$ 连续），故 $F$ 可微，且
$$
cF'(x) = F(x+\delta) - F(x) = F(x)\bigl(F(\delta) - 1\bigr).
$$
记 $A = \dfrac{F(\delta)-1}{c}$，得线性微分方程
$$
F'(x) = A F(x), \qquad \text{对所有 } x \in \mathbb{R}.
$$

**步骤 2：解线性微分方程。** 构造 $G(x) = e^{-Ax}F(x)$（积分因子法）。由
$$
G'(x) = e^{-Ax}\bigl(F'(x) - AF(x)\bigr) = 0,
$$
$G$ 为常数；又 $G(0) = 1$，故 $G \equiv 1$，即
$$
F(x) = e^{Ax}.
$$

**步骤 3：由 $F(1) = 1$ 确定 $A$。** $F$ 以 $1$ 为周期（来自 $S^1$），故 $e^A = F(1) = 1$。由复指数方程 $e^A = 1$ 的解恰为 $A = 2\pi i n$（$n \in \mathbb{Z}$）——见 [[integer-periodicity-of-exponential|复指数的整数周期性]]。故
$$
F(x) = e^{2\pi i n x} = e_n(x).
$$

**步骤 4：同构验证。** 每个 $e_n$ 均为 $S^1$ 的连续特征标（$|e_n(x)| = 1$ 且 $e_n(x+y) = e_n(x)e_n(y)$）；由步骤 1–3，任何连续特征标必为某个 $e_n$。映射 $e_n \mapsto n$ 为双射，且保持群结构（$e_n e_m = e_{n+m}$ 对应 $n + m$），故 $\widehat{S^1} \cong \mathbb{Z}$。$\blacksquare$

## 补充：柯西方程 $F(x+y)=F(x)F(y)$ 的两种解法

同一定理有两条独立的解法路线，本补充将其并列，便于对照。

**定理（指数型柯西方程）**。设 $F: \mathbb{R} \to \mathbb{C}$ 连续且对一切 $x, y$ 有 $F(x+y) = F(x)F(y)$。则 $F \equiv 0$ 或存在 $A \in \mathbb{C}$ 使 $F(x) = e^{Ax}$。

两法共有的准备：若某个 $x_0$ 使 $F(x_0) = 0$，则 $F(x) = F(x_0 + x - x_0) = F(x_0)F(x - x_0) = 0$ 对一切 $x$，即 $F \equiv 0$。下设 $F$ 不恒为零，则 $F(0) = F(0)^2$ 且 $F(0) \neq 0$，故 $F(0) = 1$。

### 途径 A：积分-微分法（Stein 提示，本解答所用）

*第一步（可微性）*。同「解答」步骤 1：取 $c = \int_0^\delta F(y)\,dy \neq 0$，由 $cF(x) = \int_x^{x+\delta}F(z)\,dz$ 与微积分基本定理，$F$ 可微且满足 $F'(x) = AF(x)$，其中 $A = (F(\delta) - 1)/c$。

*第二步（积分因子解 ODE）*。$G = e^{-Ax}F$ 满足 $G' = 0$ 与 $G(0) = 1$，故 $G \equiv 1$，即 $F(x) = e^{Ax}$。$\blacksquare$

要点：**先证可微，再解一阶线性 ODE**——把函数方程化为微分方程是核心一步。

### 途径 B：归纳-有理数逼近法

不引入可微性，直接用方程本身的代数结构递推，再以连续性延拓。

*第一步（递推关系）*。由归纳法，对一切正整数 $n$：
$$
F(nx) = F(x)^n, \qquad F(x/n)^n = F(x), \qquad F(-x) = F(x)^{-1}.
$$
（第一式：$F((n+1)x) = F(nx)F(x)$；第二式是第一式取 $x/n$；第三式由 $F(x)F(-x) = F(0) = 1$。）

*第二步（有理数上的值）*。取定 $A \in \mathbb{C}$ 使 $e^A = F(1)$（特征标情形 $|F(1)| = 1$，这样的 $A$ 存在）。对有理数 $q = m/n$：
$$
F(q)^n = F(m/n)^n = F(m) = F(1)^m = e^{Am},
$$
故 $F(q)$ 是 $e^{Am}$ 的一个 $n$ 次根。相容性条件
$$
F\!\left(\frac{1}{mn}\right)^{\!m} = F\!\left(\frac{1}{n}\right)
$$
保证这些根构成**几何系统**：存在 $B \in \mathbb{C}$ 使 $F(m/n) = e^{Bm/n}$ 对所有有理数一致成立（根的选择整体吸收进 $B$ 的选取，$B$ 与 $A$ 相差 $2\pi i$ 的整数倍）。

*第三步（连续性延拓）*。$F$ 连续且 $F(0) = 1$，而有理数在 $\mathbb{R}$ 中稠密，故由 $F(q) = e^{Bq}$（$q \in \mathbb{Q}$）延拓得 $F(x) = e^{Bx}$ 对所有实数成立。$\blacksquare$

要点：**归纳递推 + 根系统相容性 + 连续性延拓**——全程不需要「可微」概念，但论证根的选取比途径 A 繁琐；且连续性不可或缺。

### 两条途径的关系与差异

| 维度 | 途径 A（积分-微分） | 途径 B（归纳-有理数） |
|------|-------------------|---------------------|
| 核心工具 | 积分技巧 + 微积分基本定理 + 一阶线性 ODE | 递推关系 + 根系统相容性 + 连续性延拓 |
| 是否先证可微 | 是（积分技巧直接给出） | 否（绕开可微） |
| 连续性作用 | 保证 $c \neq 0$ 与可微性 | 保证根选取一致 + 有理数到实数的延拓 |
| 繁琐程度 | 较短 | 较长（须处理 n 次根的选取） |

两条途径的共同前提是**连续性**。事实上，去掉连续性后方程存在病态解（基于 Hamel 基的不可测加法函数取指数），连续性（或可测性 / 局部有界性）不可省。Stein 习题中 $F$ 来自 $S^1$ 的连续特征标，条件自动满足，故两条途径均可使用。

## 关联

- 概念：[[character|特征标]]（本习题支撑其「连续群的推广」区段）、[[integer-periodicity-of-exponential|复指数的整数周期性]]
- 定理：[[parseval-identity]]（在 $S^1$ 上的应用）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 7 Exercise 5）
