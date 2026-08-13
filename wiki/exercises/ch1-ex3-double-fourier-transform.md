---
type: exercise
title: 双重 Fourier 变换的反演
aliases: [Ch.1 Ex.3, Fourier 逆变换的反演]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.1, schwartz-space]
chapter: Ch.1 §2
number: Ex.3
---
# Ch.1 §2 Ex.3：双重 Fourier 变换的反演

## 陈述

> 设 $f \in$ [[schwartz-space|$\mathcal{S}(\mathbb{R})$]]（Schwartz 空间）。证明
> $$\widehat{\hat{f}}(\xi) = f(-\xi), \qquad \xi \in \mathbb{R}.$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Fourier Analysis, Ch. 1, §2, Ex. 3]]。

## 思路提示

将内层 Fourier 变换显式写出，交换积分次序，再对外层 Fourier 变换进行变量替换。

## 解答

由 [[fourier-transform|Fourier 变换]]的定义（Stein 约定，无 $(2\pi)^{-1}$ 归一化），
$$
\widehat{\hat{f}}(\xi) = \int_{\mathbb{R}} \hat{f}(x)\, e^{-2\pi i \xi x}\, dx
= \int_{\mathbb{R}} \left( \int_{\mathbb{R}} f(y)\, e^{-2\pi i x y}\, dy \right) e^{-2\pi i \xi x}\, dx.
$$

将积分显式写出为
$$
\widehat{\hat{f}}(\xi) = \iint_{\mathbb{R} \times \mathbb{R}} f(y)\, e^{-2\pi i x (y + \xi)}\, dy\, dx.
$$

因 $f \in \mathcal{S}(\mathbb{R})$，由 Schwartz 衰减性（对任意 $N$，$|f(y)| \leq C_N (1+|y|)^{-N}$），且 $|e^{-2\pi i x(y+\xi)}| = 1$，故双重积分的被积函数在 $\mathbb{R}^2$ 上关于 $y$ 绝对可积（对固定 $x$，$|f(y)| \in L^1$）。由 Fubini 定理，可交换积分次序：
$$
\widehat{\hat{f}}(\xi) = \int_{\mathbb{R}} f(y) \left( \int_{\mathbb{R}} e^{-2\pi i x (y+\xi)}\, dx \right) dy.
$$

对内层积分应用分布意义下的 Dirac 梳：
$$
\int_{\mathbb{R}} e^{-2\pi i x (y+\xi)}\, dx = \delta(y + \xi),
$$
其中 $\delta$ 是 Dirac 测度（在 Schwartz 分布意义下）。形式上，由 [[integer-periodicity-of-exponential|$e^{2\pi i x(y+\xi)}$ 在 $y = -\xi$ 时为 1]] 的积分性质，此表达式仅在 $y = -\xi$ 处「贡献」一个单位质量。

为给出严格证明（不借助分布），可在有限区间 $[-R, R]$ 上作部分积分，并令 $R \to \infty$：
$$
\int_{-R}^{R} e^{-2\pi i x(y+\xi)}\, dx = \frac{\sin(2\pi R (y+\xi))}{\pi (y+\xi)}.
$$
此 Dirichlet 核 $\frac{\sin(2\pi R t)}{\pi t}$（$t = y + \xi$）作为 $R \to \infty$ 的近似恒等（[[good-kernel|好核]]），作用于 $f(y)$ 后收敛到 $f(-\xi)$。

因 $f \in \mathcal{S}(\mathbb{R}) \subset L^1(\mathbb{R})$，由 Dirichlet 积分定理（[[riemann-localization|Riemann 局部化原理]]的特例），
$$
\lim_{R \to \infty} \int_{\mathbb{R}} f(y) \frac{\sin(2\pi R (y+\xi))}{\pi (y+\xi)}\, dy = f(-\xi).
$$

故 $\widehat{\hat{f}}(\xi) = f(-\xi)$。$\blacksquare$

## 备注

- **Stein 记号约束**：原题使用 Stein 约定（无 $(2\pi)^{-1}$ 因子），与本题解答一致。
- **替代证法**：亦可由 [[fourier-transform|Fourier 逆变换公式]] $f(x) = \int \hat{f}(\xi)\, e^{2\pi i x \xi}\, d\xi$ 直接取 $x = -\xi$ 推得（只需 Schwartz 空间允许交换积分与求和），无需显式计算双重积分。本解答给出了更初等的路径，凸显 Dirichlet 核与 Riemann 局部化原理的内在联系。

## 关联

- 用到的概念：[[fourier-transform]]、[[schwartz-space]]
- 用到的引理：[[integer-periodicity-of-exponential]]、[[multiplicativity-of-modulus]]
- 用到的定理：[[riemann-localization]]
- 用到的方法：[[good-kernel]]（Dirichlet 核）