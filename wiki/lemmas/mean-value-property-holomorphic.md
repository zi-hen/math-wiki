---
type: lemma
title: 全纯函数平均值性质（圆盘情形）
aliases: [mean value property for holomorphic functions, MVP, average of holomorphic functions, holomorphic disc mean value]
created: 2026-08-12
updated: 2026-08-15
sources: [steinComplexAnalysis, steinFourierAnalysisIntroduction2003a]
status: verified
tags: [complex-analysis, harmonic-functions, fourier-series]
---

# 全纯函数平均值性质（圆盘情形）

> **工作空间**：$\mathbb{C}$ 中以 $z_0$ 为中心、$R$ 为半径的圆盘 $D_R(z_0)$。

## 陈述

设 $f$ 在 $D_R(z_0)$ 上全纯。则对任意 $0 < r < R$，
$$
\boxed{f(z_0) = \frac{1}{2\pi} \int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta.}
$$

特别地，若 $f = u + iv$，则其实部 $u$ 与虚部 $v$ 都满足平均值性质：
$$
u(z_0) = \frac{1}{2\pi} \int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta, \qquad
v(z_0) = \frac{1}{2\pi} \int_0^{2\pi} v(z_0 + re^{i\theta})\,d\theta.
$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Corollary 7.2, p.121]]；调和版本见 [[steinComplexAnalysis|Ch. 3, Corollary 7.3, p.122]]。

## 证明

本页提供**两条独立证明**：

- **证法一（复分析路线，Cauchy 积分公式）**：直接由 Cauchy 积分公式导出——这是 Stein 原书的「复分析证明」。
- **证法二（Fourier 路线，[[fourier-coeffs-holomorphic-disc|Theorem 7.1]]）**：由全纯函数 Fourier 系数在 $n < 0$ 时为零推出。

两条路线互相独立，分别对应 Fourier 分析与复分析的视角；殊途同归。

---

### 证法一：复分析路线（Cauchy 积分公式）

由 [[cauchy-integral-formula|Cauchy 积分公式]]（Stein Theorem 4.1, p.64），
$$
f(z_0) = \frac{1}{2\pi i} \int_{|z - z_0| = r} \frac{f(\zeta)}{\zeta - z_0}\,d\zeta.
$$

参数化 $\zeta = z_0 + re^{i\theta}$，$d\zeta = ire^{i\theta} d\theta$，
$$
f(z_0) = \frac{1}{2\pi i} \int_0^{2\pi} \frac{f(z_0 + re^{i\theta})}{re^{i\theta}} \cdot ire^{i\theta}\,d\theta = \frac{1}{2\pi} \int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta. \quad \blacksquare
$$

---

### 证法二：Fourier 路线（由 Theorem 7.1 推出）

由 [[fourier-coeffs-holomorphic-disc|Theorem 7.1]]（Stein, p.120–122）：$f$ 在 $D_R(z_0)$ 上全纯，则 $f$ 在圆周 $|z - z_0| = r$（$0 < r < R$）上的 Fourier 系数（核 $e^{-in\theta}$，$n \in \mathbb{Z}$）为
$$
\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-in\theta}\,d\theta = \begin{cases} a_n r^n, & n \ge 0, \\ 0, & n < 0, \end{cases}
$$
其中 $a_n$ 为 $f$ 在 $z_0$ 处的 Taylor 系数（$f(z) = \sum_{n\ge 0} a_n(z-z_0)^n$）。

**取 $n = 0$ 情形**：$\hat f(0) = a_0 = f(z_0)$（Taylor 展开零次项恰为 $f(z_0)$）。代入上式：
$$
f(z_0) = \hat f(0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-i\cdot 0\cdot\theta}\,d\theta = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta. \quad \blacksquare
$$

---

### 实部与虚部的平均值性质

由 $f = u + iv$（$u, v$ 为实值函数），将证法一应用于 $u, v$（注意 $u, v$ 本身**不**全纯——它们只调和；直接对 $u$ 应用 Cauchy 公式不合法）。

**正确推导**：由证法一 / 证法二的结论，对 $f$ 取实部或虚部，**两端线性运算**给出
$$
u(z_0) = \operatorname{Re}\left[\frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta\right] = \frac{1}{2\pi}\int_0^{2\pi} \operatorname{Re}[f(z_0 + re^{i\theta})]\,d\theta = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta,
$$
（交换 $\operatorname{Re}$ 与积分由积分线性性保证——实部算子是 $\mathbb{C}$-线性算子与 $\mathbb{R}$-线性算子一致。）$v$ 类似。$\blacksquare$

> **调和版本的独立性**. 实部 $u$ 满足平均值性质是**调和函数**的刻画之一（Stein Ch. 3, p.122 末段明示：「Recall that $u$ is harmonic whenever $f$ is holomorphic, and in fact, the above corollary is a property enjoyed by every harmonic function in the disc $D_R(z_0)$」）。详见 [[holomorphic-impl-harmonic|全纯 ⇒ 实部虚部调和]]。

## 应用

- [[holomorphic-function]]（核心刻画工具）
- [[maximum-modulus-principle]]（推论：调和函数平均值性质蕴含最大模原理；取 $u = \log|f|$ 或 $u = |f|$ 当 $f$ 无零点）
- [[argument-principle]]（[[fourier-coefficient|Fourier 系数]]的对偶：$\frac{1}{2\pi i}\int \frac{f'}{f} = N - P$）
- [[cauchy-integral-formula]]（证法一的推导基础）
- [[fourier-coeffs-holomorphic-disc|Theorem 7.1]]（证法二的来源；Corollary 7.2 是 Theorem 7.1 在 $n = 0$ 的特例）
- [[holomorphic-impl-harmonic]]（调和版本与平均值性质的内在联系）