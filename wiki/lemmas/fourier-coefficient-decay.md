---
type: lemma
title: Fourier 系数的衰减（正则性 ⟹ 衰减）
aliases: [Fourier coefficient decay, 系数衰减, decay of Fourier coefficients, regular Sobolev decay]
description: 正则性条件（C^k / Lipschitz / 单调 / Hölder / 可积）下 Fourier 系数的衰减速率——ch.3 Ex.17–18 的统一摘要。
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.3, decay, regularity]
---

# Fourier 系数的衰减（正则性 ⟹ 衰减）

> **工作空间**：Stein 圆群约定，圆群 $\mathbb{T}$ 上的 Fourier 系数 $\hat f(n)=\frac{1}{2\pi}\int f(\theta)e^{-in\theta}d\theta$，核 $e^{-in\theta}$（无 $2\pi$ 因子）；也适用 $\mathbb{R}$ 的 Fourier 变换版本（附平移对偶）。

## 陈述

设 $f$ 为圆上的可积函数，$\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi} f(\theta)\,e^{-in\theta}\,d\theta$ 为其 [[fourier-coefficient|Fourier 系数]]。则正则性条件蕴含衰减：

| 条件 | 结论 | 来源 |
|------|------|------|
| (a) $f \in C^k$（$k \geq 1$） | $\hat f(n) = o(\lvert n\rvert^{-k})$（特别 $k=1$：$\hat f(n) = o(1/\lvert n\rvert)$） | Ch.3 Ex.18(a) |
| (b) $f$ 满足阶 $\alpha\in(0,1]$ 的 Hölder 条件 $\lvert f(x)-f(y)\rvert \le K\lvert x-y\rvert^\alpha$ | $\hat f(n) = O(\lvert n\rvert^{-\alpha})$ | Ch.3 Ex.18(d) |
| (c) $f$ Lipschitz（(b) 取 $\alpha=1$） | $\hat f(n) = O(1/\lvert n\rvert)$ | Ch.3 Ex.18(b) |
| (d) $f$ 有界且单调（或更一般：有界变差） | $\hat f(n) = O(1/\lvert n\rvert)$ | Ch.3 Ex.17 / Ex.18(c) |
| (e) $f$ Riemann 可积（无额外正则性） | $\sum_n \lvert\hat f(n)\rvert^2 < \infty$，故 $\hat f(n) \to 0$ | Parseval / Ch.3 Ex.18(e) |

**反方向（任意慢衰减）**：连续函数的系数可以任意慢地趋于 $0$——见 [[ch3-ex18-slow-decay|Ch.3 Ex.18]] 的构造。这说明上表的衰减速率**阶**已是最优。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Exercises 17–18, p.110–111]]。

## 动机

衰减关系是 Fourier 分析的"正则性-衰减对偶"：

- **平滑性**（$f$ 可微、连续、单调等）**$\Rightarrow$ 系数衰减**（$|\hat f(n)|$ 趋于 $0$ 的速率反映 $f$ 的光滑阶）；
- **衰减性**（$\hat f(n)$ 衰减足够快）**$\Rightarrow f$ 重建**（逐点收敛、绝对收敛、$L^2$ 收敛，由衰减阶决定）。

物理直觉：高频振荡对应"快速变化"——若 $f$ 光滑，则其 Fourier 表示中不应有太多高频成分，故系数小。本页的 (a)–(d) 给"足够正则 ⇒ 系数至少以某速率衰减"；**反方向**（慢衰减不一定无规则）由 [[ch3-ex18-slow-decay]] 体现：连续函数的系数可以多慢都可以，证明"正则性 ≠ 任意快速衰减"。

## 证明

### 框架：(a)–(d) 三个机制

- **(a)** 直接对 Fourier 系数定义分部积分 $k$ 次，把每阶导数 $f^{(k)}$ 的范数作为界。
- **(b)–(c)** 差值技巧：取**对偶点** $h=\pi/n$ 使 $e^{-inh}=e^{-i\pi}=-1$，从而 $\hat f(n) = \tfrac{1}{2}\bigl[\hat f(n) - \widehat{f(\cdot+\pi/n)}\bigr] = \tfrac{1}{4\pi}\int[f(\theta)-f(\theta+\pi/n)]e^{-in\theta}\,d\theta$——把 Hölder/Lipschitz 条件搬到积分号下得 $O(\lvert n\rvert^{-\alpha})$。
- **(d)** 单调 $\Rightarrow$ 有界变差 $\Rightarrow$ 把 $f$ 表为分段常数（差分-求和，Abel 求和）——比 (a) 更精细，因为不要求 $f$ 连续，但仍得 $O(1/\lvert n\rvert)$。
- **(e)** Parseval：可积函数有界 $\Rightarrow$ $\frac{1}{2\pi}\int\lvert f\rvert^2<\infty$，与 Parseval 直接给出 $\ell^2$ 可和性。

### 详细推导

**(a) $C^k \Rightarrow o(\lvert n\rvert^{-k})$**。由 $f$ 周期性与逐阶分部积分（参见 [[integration-by-parts|分部积分]]方法）：
$$
\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi} f(\theta)\,e^{-in\theta}\,d\theta = \frac{1}{2\pi}\int_0^{2\pi} f(\theta)\,\frac{d}{d\theta}\!\left(\frac{e^{-in\theta}}{-in}\right)d\theta.
$$
分部积分一次：边界项 $f(\theta)\frac{e^{-in\theta}}{-in}\big|_0^{2\pi} = 0$（$f$ 周期且 $e^{-in\cdot 2\pi}=1$），得
$$
\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi} f'(\theta)\,\frac{e^{-in\theta}}{in}\,d\theta = \frac{1}{in}\cdot \widehat{f'}(n).
$$
对 $C^k$ 重复 $k$ 次：$\hat f(n) = \widehat{f^{(k)}}(n) / (in)^k$。由 [[riemann-lebesgue-lemma|Riemann-Lebesgue 引理]] 应用于 $f^{(k)} \in C^0$ 得 $\widehat{f^{(k)}}(n) \to 0$，故 $\hat f(n) = o(\lvert n\rvert^{-k})$。特别 $k=1$ 时 $\hat f(n) = o(1/\lvert n\rvert)$，给出"连续可微 ⇒ $o(1/\lvert n\rvert)$"。$\blacksquare$

**(b) Hölder $\alpha$ 阶 $\Rightarrow O(\lvert n\rvert^{-\alpha})$**。关键偏移：取 $h_n = \pi/n$，使得 $e^{-in\cdot h_n} = e^{-i\pi} = -1$。由 [[fourier-coefficient|Fourier 系数]]的平移性质 $\widehat{f(\cdot+h)}(n) = e^{inh}\hat f(n)$，故
$$
\widehat{f(\cdot+\pi/n)}(n) = e^{i\pi}\hat f(n) = -\hat f(n).
$$
两式相减（先把 $\hat f(n)$ 的定义乘以 $1=(-1)/(-1)$）：
$$
2\hat f(n) = \hat f(n) - \widehat{f(\cdot+\pi/n)}(n) = \frac{1}{2\pi}\int_0^{2\pi}\bigl[f(\theta) - f(\theta+\pi/n)\bigr]e^{-in\theta}\,d\theta.
$$
（这正是把"$\hat f(n) = \tfrac{1}{2}[\hat f(n) - (-\hat f(n))]$"的两边同时写成积分形式，整理而得。）取模并用 Hölder 条件 $\lvert f(\theta)-f(\theta+\pi/n)\rvert \le K(\pi/n)^\alpha$：
$$
2\lvert\hat f(n)\rvert \le \frac{1}{2\pi}\int_0^{2\pi} K(\pi/n)^\alpha\,d\theta = \frac{K\pi^\alpha}{n^\alpha},
$$
故 $\hat f(n) = O(\lvert n\rvert^{-\alpha})$。当 $\alpha=1$ 即 (c) Lipschitz 时给出 $O(1/\lvert n\rvert)$。$\blacksquare$

**(d) 有界单调 $\Rightarrow O(1/\lvert n\rvert)$**。先证区间指示函数 $\chi_{[a,b]}$ 的衰减。由直接积分
$$
\widehat{\chi_{[a,b]}}(n) = \frac{1}{2\pi}\int_a^b e^{-in\theta}\,d\theta = \frac{1}{2\pi}\cdot\frac{e^{-ina}-e^{-inb}}{in} = O(1/\lvert n\rvert).
$$
对有界单调 $f$，可将 $[0,2\pi]$ 拆为 $0=a_0<a_1<\cdots<a_m=2\pi$（$f$ 单调故有限个跳变点即可），写
$$
f(\theta) = f(a_0)\chi_{[a_0,a_1]} + \sum_{k=1}^{m-1}\bigl[f(a_k)-f(a_{k-1})\bigr]\chi_{[a_k,a_{k+1}]} + f(2\pi)\chi_{\{2\pi\}}.
$$
注意系数 $\alpha_k = f(a_k)-f(a_{k-1})$ 单调（$f$ 单调），故 $\lvert\alpha_k\rvert \le M := \sup\lvert f\rvert$。Fourier 系数的线性性给出
$$
\hat f(n) = \alpha_0\widehat{\chi_{[a_0,a_1]}}(n) + \sum_{k=1}^{m-1}\alpha_k\widehat{\chi_{[a_k,a_{k+1}]}}(n).
$$
对 $\lvert n\rvert > 0$，**分部求和**（Abel 求和）：因 $\alpha_k$ 单调，差分 $\alpha_k-\alpha_{k+1}$ 单调且绝对值有界，可把上和"重新累积"得
$$
\sum_{k=0}^{m-1}\alpha_k\beta_k = \alpha_0\sum_{k=0}^{m-1}\beta_k + \sum_{k=1}^{m-1}(\alpha_k-\alpha_{k+1})\sum_{j=0}^{k}\beta_j
$$
（对 $\beta_k = \widehat{\chi_{[a_k,a_{k+1}]}}(n)$ 满足 $\lvert\beta_k\rvert \le C/\lvert n\rvert$ 与 $\sum_{j=0}^{k}\beta_j = O(1/\lvert n\rvert)$——后者由分部求和的 telescoping）。由此 $\lvert\hat f(n)\rvert \le C' M/\lvert n\rvert$，故 $O(1/\lvert n\rvert)$。**一般有界变差** $f$（不要求单调）由 [[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]] 以一致有界连续函数逼近（变差亦受控）化归。$\blacksquare$

**(e) 可积 $\Rightarrow \ell^2$ 可和 $\Rightarrow \hat f(n) \to 0$**。Riemann 可积函数必有界（Stein 框架基本事实），故 $\frac{1}{2\pi}\int\lvert f\rvert^2 < \infty$。由 [[parseval-identity|Parseval 恒等式]]：
$$
\sum_{n\in\mathbb{Z}}\lvert\hat f(n)\rvert^2 = \frac{1}{2\pi}\int_0^{2\pi}\lvert f(\theta)\rvert^2\,d\theta < \infty.
$$
故 $\{\hat f(n)\} \in \ell^2$，从而 $\hat f(n) \to 0$（$\ell^2 \subset c_0$）。这与 (a)–(d) 的**逐项** $O(1/\lvert n\rvert)$ 不同：$\ell^2$ 可和只要求平方和有限，不给单项衰减速率——这反映 Riemann 可积（弱条件）vs Hölder / Lipschitz（强条件）的层级。$\blacksquare$

## 应用

- [[bernstein-theorem|Bernstein 定理]]：Hölder $\alpha > 1/2$ 时由 (b) 的逐项界 $\lvert\hat f(n)\rvert = O(\lvert n\rvert^{-\alpha})$ 仍不可得 $\ell^1$ 可和（因 $\alpha \le 1$ 时 $\sum \lvert n\rvert^{-\alpha} = \infty$），故需要更精细的二进块 $L^2$ 估计。
- [[riemann-lebesgue-lemma|Riemann-Lebesgue 引理]]：(e) 是其 Parseval 视角下的再证与改进（$\ell^2$ 可和 ⇒ 逐项趋于零）。
- [[ch3-ex18-slow-decay|Ch.3 Ex.18]]：慢衰减例子说明 (a)–(d) 的「衰减速率」已是最优——连续函数的系数可慢于任何给定速率（与 (e) 形成对比）。
- **采样定理**（[[sampling-theorem]]）：(a) 的 $C^k \Rightarrow O(\lvert n\rvert^{-k})$ 保证 Shannon 重建级数绝对收敛。

## 关联

- 定理：[[riemann-lebesgue-lemma]]、[[parseval-identity]]、[[bernstein-theorem]]、[[mean-square-convergence]]
- 概念：[[fourier-coefficient|Fourier 系数]]、[[fourier-series]]、[[lp-space|$L^2$ 空间]]（(e) 的能量框架）、[[ellp-space|$\ell^2$ 序列空间]]（(e) 的能量可和性）
- 引理：[[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]]（(d) 的逼近工具）
- 习题：[[ch3-ex18-slow-decay|Ch.3 Ex.18]]
- 方法：[[integration-by-parts|分部积分]]（(a)）、[[cesaro-summation]]（(d) 的 Abel 求和）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Exercises 17–18, p.110–111）