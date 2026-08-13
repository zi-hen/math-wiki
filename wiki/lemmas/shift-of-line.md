---
type: lemma
title: Fourier 反演的水平线移位（围道平移）
aliases: [contour shift, horizontal line shift, $\mathscr{F}_a$ contour translation, Stein Ch.4 eq. (1)]
created: 2026-08-13
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, fourier-analysis, contour-integration]
---

# Fourier 反演的水平线移位（围道平移）

> **工作空间**：水平条带 $S_a = \{z \in \mathbb{C} : |\operatorname{Im}(z)| < a\}$，$f \in \mathscr{F}_a$。

## 陈述

设 $f \in \mathscr{F}_a$。对任意 $0 \le b < a$ 与 $\xi \in \mathbb{R}$，有
$$
\hat f(\xi) = \int_{-\infty}^{\infty} f(u - ib)\,e^{-2\pi i(u-ib)\xi}\,du = \int_{-\infty}^{\infty} f(u + ib)\,e^{-2\pi i(u+ib)\xi}\,du. \tag{1}
$$

即 Fourier 变换的定义围道（实轴）可在条带 $S_a$ 内上下平移 $b$ 个单位，**积分值不变**。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 4, Lemma 2.3 / eq. (1), p.135–138]]。

**附**（Stein Lemma 2.3 单独陈述）：若 $A > 0$、$B \in \mathbb{R}$，则
$$
\int_0^{\infty} e^{-(A+iB)\xi}\,d\xi = \frac{1}{A + iB}.
$$

## 证明

固定 $\xi > 0$ 与 $0 \le b < a$。设 $L_0 = \mathbb{R}$（实轴）、$L_1 = \{u - ib : u \in \mathbb{R}\}$（下平移 $b$ 的水平线）。

**Step 1（被积函数在 $S_a$ 内全纯）**。函数 $z \mapsto f(z) e^{-2\pi i z \xi}$ 在 $S_a$ 内全纯。理由——$e^{-2\pi i z \xi}$ 为整函数；$f$ 在 $S_a$ 全纯（$\mathscr{F}_a$ 定义）；两者的积仍全纯。

**Step 2（矩形围道上的 Cauchy 定理）**。对任意 $R > 0$，考虑以 $[-R, R] \subset L_0$ 与 $[-R - ib, R - ib] \subset L_1$ 为水平边的矩形围道 $\gamma_R$，竖直边为 $\{R + iy : y \in [-b, 0]\}$ 与 $\{-R + iy : y \in [-b, 0]\}$。因 $f(z) e^{-2\pi i z \xi}$ 在 $\gamma_R$ 内（矩形围道的内部）全纯，由 [[cauchy-theorem|Cauchy 定理]]（Ch. 2 Theorem 2.2 的矩形版本），
$$
\oint_{\gamma_R} f(z)\,e^{-2\pi i z \xi}\,dz = 0.
$$

按 $\gamma_R$ 的四边分段：
$$
\int_{-R}^{R} f(u)\,e^{-2\pi i u \xi}\,du + \int_{0}^{-b} f(R+iy)\,e^{-2\pi i (R+iy)\xi} \cdot i\,dy + \int_{R}^{-R} f(u-ib)\,e^{-2\pi i (u-ib)\xi}\,du + \int_{-b}^{0} f(-R+iy)\,e^{-2\pi i (-R+iy)\xi} \cdot i\,dy = 0.
$$

**Step 3（竖直边积分随 $R \to \infty$ 趋于 $0$）**。

在右竖直边 $z = R + iy$（$y \in [-b, 0]$）上：
- $|f(z)| \le A/(1 + R^2)$（由 $\mathscr{F}_a$ 衰减条件）；
- $|e^{-2\pi i z \xi}| = |e^{-2\pi i (R+iy)\xi}| = e^{2\pi \xi y}$。因 $\xi > 0$ 且 $y \in [-b, 0]$，故 $e^{2\pi \xi y} \le 1$。

故右竖直边的积分之模不超过
$$
\int_{-b}^{0} \frac{A}{1+R^2} \cdot 1 \cdot |i|\,dy = \frac{bA}{1+R^2} \to 0 \quad (R \to \infty).
$$

类似地，左竖直边 $\{-R + iy : y \in [-b, 0]\}$ 给出 $|f| \le A/(1+R^2)$、$|e^{-2\pi i z\xi}| = e^{-2\pi\xi y} \le 1$（注意 $\xi > 0$、$y \le 0$ 故 $-\pi\xi y \ge 0$），故左竖直边积分亦趋于 $0$。

**Step 4（取极限 $R \to \infty$）**。竖直边积分 $\to 0$，矩形围道上的 Cauchy 定理给出
$$
\int_{-\infty}^{\infty} f(u)\,e^{-2\pi i u\xi}\,du - \int_{-\infty}^{\infty} f(u - ib)\,e^{-2\pi i(u-ib)\xi}\,du = 0,
$$
即
$$
\hat f(\xi) = \int_{-\infty}^{\infty} f(u - ib)\,e^{-2\pi i(u-ib)\xi}\,du.
$$

对 $\xi < 0$ 的情形：固定 $\xi < 0$，取 $L_2 = \{u + ib : u \in \mathbb{R}\}$（上平移 $b$）并对实轴与 $L_2$ 之间的矩形用 Cauchy 定理。竖直边估计中 $|e^{-2\pi i z \xi}| = e^{2\pi\xi y}$：当 $y \in [0, b]$、$\xi < 0$ 时 $\xi y \le 0$，故 $e^{2\pi\xi y} \le 1$——结论对称。

对 $\xi = 0$：$\hat f(0) = \int f(u) du$。由 $e^{0} = 1$ 与平移不变性（$\int f(u)\,du = \int f(u - ib)\,du$，变数替换 $v = u - ib$ 沿实轴积分），两侧相等。 $\blacksquare$

## 应用

- [[fourier-inversion]]（证明三）：Theorem 2.2 的核心中间结果（Claim 2）——把 $\hat f$ 的水平线表示与指数衰减同时证得。此 Claim 2 实质上包含了本引理（移位公式）加 $\mathscr{F}_a$ 的衰减估计。
- [[poisson-summation-formula]]（证明二）：Theorem 2.4 的核心工具——把 $1/(e^{2\pi i z} - 1)$ 在 $L_1, L_2$ 上的围道积分通过「shifted line formula」化为实线积分。
- [[paley-wiener-theorem]]（其他证明）：利用围道平移在条带内水平移动实线，是 Paley-Wiener 定理的围道积分证法的基本组件。
- [[contour-integration]]（方法）：本引理是围道积分法在 Fourier 分析中的典型应用。