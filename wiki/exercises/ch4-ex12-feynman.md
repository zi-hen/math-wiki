---
type: exercise
title: Ch.4 §5 Ex.12: Feynman 微分法则
aliases: [Ch.4 Ex.12, Feynman's trick, differentiation under integral]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, calculus, Ch.4]
chapter: Ch.4 §5
number: Ex.12
---

# Ch.4 §5 Ex.12：Feynman 微分法则（Feynman's trick）

## 陈述

> 设 $I(a) = \int_0^\infty e^{-at} \frac{\sin t}{t}\,dt$（$a > 0$）。证明：
> 1. $I(a) = \frac{\pi}{2} - \arctan a$。
> 2. 推广到 $a$ 的高阶导数与原函数族。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 4, Exercise 12, p.80]]。

## 思路提示

本题的实质是**利用求导构造微分方程**（Feynman 技巧的计算性用法）：对 $a$ 求导后，被积函数中 $\sin t/t$ 的因子 $t$ 被抵消，剩下初等积分 $\int_0^\infty e^{-at}\sin t\,dt$。于是 $I$ 满足一阶线性微分方程 $I'(a) = -\frac{1}{1+a^2}$，再结合边界条件 $I(\infty) = 0$ 求解。

求导与积分互换需要条件——本页在 **Riemann 积分框架**下用「一致收敛 / 连续 / 有界」的语言给出完整论证（预备引理 1–4），这一「一致收敛 ⟶ 换序」的理解是后续学习 [[dominated-convergence|控制收敛]]（Lebesgue 框架下的推广）的基础。

## 预备引理（Riemann 积分框架）

以下引理均在被积函数连续的前提下叙述，积分均取（正常或反常）Riemann 积分。

**引理 1（含参反常积分的一致收敛：Weierstrass 判别法的积分版）**。设 $h: [0,\infty)\times[\alpha,\beta] \to \mathbb{R}$ 连续，且存在非负可积控制函数 $\varphi$（即 $\int_0^\infty\varphi(t)\,dt < \infty$）使
$$
|h(t,a)| \le \varphi(t), \qquad \forall (t,a) \in [0,\infty)\times[\alpha,\beta].
$$
则 $\int_0^\infty h(t,a)\,dt$ 在 $[\alpha,\beta]$ 上**一致收敛**：
$$
\lim_{R\to\infty}\sup_{a\in[\alpha,\beta]}\left|\int_R^\infty h(t,a)\,dt\right| = 0.
$$

*证明.* $\left|\int_R^\infty h(t,a)\,dt\right| \le \int_R^\infty \varphi(t)\,dt$，右端与 $a$ 无关且趋于 $0$。$\blacksquare$

**引理 2（积分号下求导：Riemann 框架的莱布尼茨法则）**。设 $g, \partial_a g: [0,\infty)\times(\alpha_0,\beta_0) \to \mathbb{R}$ 连续。若对每个紧区间 $[\alpha,\beta]\subset(\alpha_0,\beta_0)$，积分 $\int_0^\infty g(t,a)\,dt$ 存在，且 $\int_0^\infty \partial_a g(t,a)\,dt$ 在 $[\alpha,\beta]$ 上一致收敛，则
$$
I(a) = \int_0^\infty g(t,a)\,dt
$$
在 $(\alpha_0,\beta_0)$ 上可导，且
$$
I'(a) = \int_0^\infty \partial_a g(t,a)\,dt.
$$

*证明.* 固定 $a \in [\alpha,\beta]$，$|h|$ 充分小。写
$$
\frac{I(a+h)-I(a)}{h} = \int_0^R \frac{g(t,a+h)-g(t,a)}{h}\,dt + \int_R^\infty \frac{g(t,a+h)-g(t,a)}{h}\,dt.
$$
有限区间部分：由中值定理 $\frac{g(t,a+h)-g(t,a)}{h} = \partial_a g(t, a+\theta h)$（$\theta = \theta(t) \in (0,1)$）与 $\partial_a g$ 在紧集上的连续性，该项随 $h \to 0$ 收敛到 $\int_0^R \partial_a g(t,a)\,dt$。尾部部分：由
$$
\frac{g(t,a+h)-g(t,a)}{h} = \int_0^1 \partial_a g(t, a + sh)\,ds
$$
与 $\int_R^\infty \partial_a g(t, \cdot)\,dt$ 的一致收敛（引理 1 的结论形式），其绝对值可任意小（与 $h$ 无关）。先令 $h \to 0$ 再令 $R \to \infty$ 即得结论。$\blacksquare$

**引理 3（初等积分）**。对 $a > 0$，
$$
\int_0^\infty e^{-at}\sin t\,dt = \frac{1}{1+a^2}.
$$

*证明.* 复化：$\sin t = \operatorname{Im}(e^{it})$，且
$$
\int_0^\infty e^{(i-a)t}\,dt = \left[\frac{e^{(i-a)t}}{i-a}\right]_{t=0}^{\infty} = \frac{1}{a-i} = \frac{a+i}{a^2+1},
$$
取虚部即得 $\frac{1}{a^2+1}$。$\blacksquare$

**引理 4（微分方程 + 边界条件定常数）**。若 $J: (0,\infty) \to \mathbb{R}$ 可导，$J'(a) = -\frac{1}{1+a^2}$，且 $\lim_{a\to\infty}J(a) = 0$，则
$$
J(a) = \frac{\pi}{2} - \arctan a.
$$

*证明.* 因 $\frac{d}{da}\arctan a = \frac{1}{1+a^2}$，有 $\frac{d}{da}\bigl(J(a) + \arctan a\bigr) = 0$，故 $J(a) + \arctan a \equiv C$。令 $a \to \infty$：$0 + \frac{\pi}{2} = C$。$\blacksquare$

## 解答

**第一问。** 记 $g(t,a) = e^{-at}\frac{\sin t}{t}$。注意 $\frac{\sin t}{t}$ 在 $t=0$ 处有可去间断，连续延拓为 $1$（由 $\lim_{t\to 0}\sin t/t = 1$），故 $g$ 与 $\partial_a g(t,a) = -e^{-at}\sin t$ 在 $[0,\infty)\times(0,\infty)$ 上连续。

1. **验证换序条件**。对紧区间 $[\alpha,\beta]\subset(0,\infty)$，有
$$
|\partial_a g(t,a)| = |{-e}^{-at}\sin t| \le e^{-\alpha t},
$$
而 $\int_0^\infty e^{-\alpha t}\,dt = 1/\alpha < \infty$。由引理 1，$\int_0^\infty \partial_a g(t,a)\,dt$ 在 $[\alpha,\beta]$ 上一致收敛；由引理 2，
$$
I'(a) = \int_0^\infty \partial_a g(t,a)\,dt = -\int_0^\infty e^{-at}\sin t\,dt = -\frac{1}{1+a^2} \qquad (\text{引理 3}).
$$
2. **边界条件**。$|I(a)| \le \int_0^\infty e^{-at}\,dt = \frac{1}{a}$，故 $\lim_{a\to\infty}I(a) = 0$。
3. 由引理 4，$I(a) = \frac{\pi}{2} - \arctan a$。$\blacksquare$

**第二问（高阶导数与原函数族）。** 对 $k \ge 1$ 归纳地使用引理 2。$\partial_a^k g(t,a) = (-1)^k t^{k-1}e^{-at}\sin t$，且对 $a\in[\alpha,\beta]$，
$$
\left|\partial_a^k g(t,a)\right| \le t^{k-1}e^{-\alpha t},
$$
而 $\int_0^\infty t^{k-1}e^{-\alpha t}\,dt < \infty$（指数衰减压制多项式增长），故逐次换序均合法：
$$
I^{(k)}(a) = (-1)^k \int_0^\infty t^{k-1}e^{-at}\sin t\,dt, \qquad k \ge 1.
$$
另一方面，由第一问的闭式，$I^{(k)}(a) = \frac{d^k}{da^k}\bigl(\frac{\pi}{2} - \arctan a\bigr)$；两者一致，给出原函数族 $\{I^{(k)}\}$ 的显式表达。$\blacksquare$

## 方法归纳：利用求导构造微分方程

本题展示的 Feynman 技巧，其本质不是「积分号下求导」本身，而是三步结构：

1. **参数化**：把目标积分嵌入参数族 $I(a)$（引入 $a > 0$ 使积分收敛）；
2. **求导构造微分方程**：在积分号下对 $a$ 求导，$t/t = 1$ 抵消奇异因子，得到 $I'$ 的初等表达式，从而 $I$ 满足一阶线性微分方程
$$
I'(a) = -\frac{1}{1+a^2};
$$
3. **解方程 + 边界条件**：由 $\frac{d}{da}(I + \arctan a) = 0$（引理 4）与 $I(\infty) = 0$ 唯一确定 $I(a) = \frac{\pi}{2} - \arctan a$。

即：**求导的目的不是直接算出积分，而是把积分求值转化为「微分方程 + 边界条件」的求解问题**。这与 [[differentiation-under-integral|对参数求导（积分号下求导）]] 方法页的「计算性用法」一致；换序的合法性由引理 1–2 的一致收敛条件保证——这就是把「一致收敛 ⟶ 换序」作为后续 [[dominated-convergence|控制收敛]]（Lebesgue 框架下同一问题）基础的含义。

## Stein 备注

Feynman 的「积分号下求导」是物理学家的核心技巧之一。Stein 在 Ch. 4 中未使用此技巧（该章证明以围道积分与级数方法为主），但作为 Fourier 卷方法的补充，它揭示了含参积分的一般程序：参数化 → 换序 → 微分方程。换序条件在 Riemann 框架下表现为一致收敛（本页引理 1–2），在 Lebesgue 框架下表现为 [[dominated-convergence|控制收敛]]——二者是「一致（可积控制）⟶ 换序」这一思想的两种语言。

## 关联

- 方法：[[differentiation-under-integral]]（积分号下求导 / Feynman 技巧）
- 概念：[[dominated-convergence|控制收敛]]（后续 Lebesgue 框架的推广）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 4 Exercise 12）
