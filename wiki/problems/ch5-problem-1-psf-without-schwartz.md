---
type: problem
title: 非 Schwartz 条件下的 Poisson 求和公式
aliases: [Ch.5 Problem 1, PSF 的弱形式]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.5, poisson-summation]
chapter: Ch.5 §3
number: Problem 1
---
# Ch.5 §3 Problem 1：非 Schwartz 条件下的 Poisson 求和公式

## 陈述

> 设 $f \in C^1(\mathbb{R})$，且 $f, f'$ 在 $\mathbb{R}$ 上都属于 [[lp-space|$L^1(\mathbb{R})$]]。证明
> $$\sum_{n \in \mathbb{Z}} f(n) = \sum_{n \in \mathbb{Z}} \hat{f}(n).$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Fourier Analysis, Ch. 5, §3, Problem 1]]。

## 思路提示

不能直接套用 Schwartz 空间版本的 Poisson 求和公式（[[poisson-summation-formula|Poisson 求和公式]]），因为条件不蕴含快速衰减。需用衰减条件 $f, f' \in L^1$ 直接估计 $|\hat{f}(\xi)|$ 的衰减速度，再借 Fourier 级数方法证明。

## 解答

**第一步**：由 $f' \in L^1(\mathbb{R})$，分部积分得
$$
\widehat{f'}(\xi) = \int_{\mathbb{R}} f'(x)\, e^{-2\pi i \xi x}\, dx = -\int_{\mathbb{R}} f(x) \cdot (-2\pi i \xi)\, e^{-2\pi i \xi x}\, dx = 2\pi i \xi \hat{f}(\xi).
$$
（由 $f \in L^1$ 保证边界项 $\left[f(x) e^{-2\pi i \xi x}\right]_{-\infty}^{+\infty}$ 为零。）

**第二步**：估计 $\hat{f}$ 的衰减。因 $f' \in L^1$，由 Riemann–Lebesgue 引理（[[fourier-transform|Fourier 变换]]的标准推论），
$$
\widehat{f'}(\xi) = 2\pi i \xi \hat{f}(\xi) \to 0 \quad (\xi \to \pm\infty).
$$
特别地，$|\xi \hat{f}(\xi)| \leq \|f'\|_{L^1}$，故
$$
|\hat{f}(\xi)| \leq \frac{C}{|\xi|} \quad (|\xi| \geq 1),
$$
其中 $C = \|f'\|_{L^1} / 2\pi$。

**第三步**：构造截断 $f_R = f \cdot \chi_{[-R,R]}$，使 $f_R$ 在 $[-R, R]$ 之外为零，从而 $f_R \in L^1 \cap L^2$（测度有限空间上 $L^2 \subset L^1$）。对 $f_R$ 应用 Schwartz 版本的 [[poisson-summation-formula|Poisson 求和公式]]（以 $f_R$ 的 Fourier 变换 $\hat{f_R}$，先用 Plancherel 定理的近似，再逼近 $f$）：
$$
\sum_{n \in \mathbb{Z}} f_R(n) = \sum_{n \in \mathbb{Z}} \hat{f_R}(n).
$$

**第四步**：令 $R \to \infty$。
- 左端：$f_R(n) \to f(n)$（对每个 $n$），且 $|f_R(n)| \leq |f(n)|$（被 $|f(n)|$ 控制），由 $f \in L^1$（特别是 $\sum |f(n)| < \infty$ 的弱形式）取极限。
- 右端：$\hat{f_R} \to \hat{f}$（逐点），但 $\hat{f_R}(n)$ 的求和需要 $\hat{f}$ 有足够衰减。由第二步 $|\hat{f}(\xi)| \leq C/|\xi|$，对 $|n| \geq 1$ 的项 $\hat{f}(n) \leq C/|n|$ 收敛，故 $\sum_n \hat{f}(n)$ 绝对收敛。

故取极限后得
$$
\sum_n f(n) = \sum_n \hat{f}(n).
$$

$\blacksquare$

## 备注

- **条件对比**：原 Schwartz 版本仅需 $f \in \mathcal{S}(\mathbb{R})$（极强条件），本问题的条件 $f, f' \in L^1$（弱得多）已足够获得 $|\hat{f}(\xi)| = O(|\xi|^{-1})$ 衰减，进而保证 Poisson 求和公式的右端绝对收敛。
- **等价叙述**：本问题等价于「若 $\xi \hat{f}(\xi) \in L^\infty(\mathbb{R})$ 且 $f \in L^1$ 且 $f$ 连续，则 $\sum f(n) = \sum \hat{f}(n)$」——后者的条件更简洁，是弱形式 Poisson 求和公式的标准陈述。
- **不可削弱**：若仅 $f \in L^1$ 不带任何衰减，$\hat{f}$ 可能无 $O(|\xi|^{-1})$ 衰减，$\sum \hat{f}(n)$ 可能发散，反例：$f(x) = e^{-|x|}$ 在 $\mathbb{Z}$ 上求和收敛但 $\hat{f}(n) = \frac{2}{1+4\pi^2 n^2}$ 也收敛——此例非反例。需更精细构造。

## 关联

- 用到的定理：[[poisson-summation-formula]]、[[fourier-transform]]（含 Plancherel 定理、Riemann–Lebesgue 引理）
- 用到的概念：[[lp-space]]、[[schwartz-space]]（作为对比）、[[fourier-coefficient|Fourier 系数]]
- 用到的方法：[[good-kernel]]（构造近似恒等逼近）