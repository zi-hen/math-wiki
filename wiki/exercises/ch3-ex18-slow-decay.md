---
type: exercise
title: Ch.3 Ex.18: Fourier 系数任意慢衰减
aliases: [Ch.3 Ex.18, slow-decay 构造]
created: 2026-08-12
updated: 2026-08-15
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.3, riemann-lebesgue]
chapter: Ch.3
number: Ex.18
---

# Ch.3 Ex.18：Fourier 系数可任意慢衰减

## 陈述

> 证明：给定任一收敛到 0 的非负实数序列 $\{\epsilon_n\}$，存在连续函数 $f: [0, 2\pi] \to \mathbb{R}$ 使 $|\hat f(n)| \geq \epsilon_n$ 对无穷多个 $n$ 成立。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 3, Exercise 18(e), p.111]]。

## 思路提示

两步构造：

1. **稀疏子列的合理性**：由 $\epsilon_n \to 0$，对每个 $k$ 可选指标 $n_k$ 使 $\epsilon_{n_k} \le 2^{-k}$，从而 $\sum_k \epsilon_{n_k} < \infty$。这一「抽出适当稀疏子列」的合法性须显式证明（Claim 1），不能凭直觉接受。
2. **用子列构造 $f$**：取 $f(\theta) = \sum_k 2\epsilon_{n_k}\cos(n_k\theta)$。系数 2 是必须的：$\cos(n\theta)$ 的 Fourier 系数为 $\frac{1}{2}(\delta_{m,n} + \delta_{m,-n})$，需要补偿因子使 $|\hat f(n_k)| = \epsilon_{n_k}$ 恰成立。

## 解答

**Claim 1**（稀疏子列的存在性）. 设 $\epsilon_n \ge 0$ 且 $\epsilon_n \to 0$。则存在严格递增的正整数列 $n_1 < n_2 < \cdots$，使 $\sum_{k\ge 1}\epsilon_{n_k} < \infty$。

*证明.* 因 $\epsilon_n \to 0$，对每个 $k \ge 1$ 存在 $N_k$ 使 $0 \le \epsilon_n \le 2^{-k}$ 对一切 $n \ge N_k$ 成立。递归定义指标：$n_1 = N_1$，$n_{k} = \max(n_{k-1}+1,\; N_k)$（$k \ge 2$）。则 $n_k$ 严格递增且 $n_k \ge N_k$，故 $0 \le \epsilon_{n_k} \le 2^{-k}$。于是
$$
\sum_{k=1}^{\infty}\epsilon_{n_k} \le \sum_{k=1}^{\infty}2^{-k} = 1 < \infty. \qquad\blacksquare
$$

> **构造合理性说明**：选择 $n_k$ 只要求「落在 $\epsilon_n \le 2^{-k}$ 的尾部」，并不要求 $\epsilon_{n_k}$ 是残余项的最小值；稀疏性（指标快速分散）来自递推条件 $n_k \ge n_{k-1} + 1$ 与尾部的单调要求，与衰减速率本身无关。这正是本题可对**任意**收敛到零的 $\{\epsilon_n\}$ 构造的原因——只需要「趋于零」这一性质，而不需要任何具体的收敛速率。

**构造.** 定义
$$
f(\theta) = \sum_{k=1}^{\infty} 2\epsilon_{n_k}\cos(n_k\theta), \qquad \theta \in \mathbb{R}.
$$

**Claim 2**（$f$ 连续且实值）. 上述级数在 $\mathbb{R}$ 上一致收敛，故 $f \in C(\mathbb{R})$；特别地 $f \in C([0, 2\pi])$，且 $f$ 取实值。

*证明.* 对一切 $\theta$ 有 $|2\epsilon_{n_k}\cos(n_k\theta)| \le 2\epsilon_{n_k}$，而由 Claim 1 得 $\sum_k 2\epsilon_{n_k} < \infty$。由 Weierstrass M-判别法，级数在 $\mathbb{R}$ 上一致收敛；一致收敛的连续函数项级数之和仍连续（[[absolute-convergence-test|绝对收敛检验]] 保证各项和的收敛性）。$f$ 实值因每项 $2\epsilon_{n_k}\cos(n_k\theta)$ 均为实值。$\blacksquare$

**Claim 3**（Fourier 系数）. 对 $m \in \mathbb{Z}$，
$$
\hat f(m) = \frac{1}{2\pi}\int_0^{2\pi} f(\theta)\,e^{-im\theta}\,d\theta =
\begin{cases}
\epsilon_{n_k}, & m = \pm n_k \text{ 对某个 } k, \\
0, & \text{否则}.
\end{cases}
$$

*证明.* 因级数在 $[0, 2\pi]$ 上一致收敛（Claim 2），可逐项积分：
$$
\hat f(m) = \sum_{k\ge 1} 2\epsilon_{n_k}\cdot\frac{1}{2\pi}\int_0^{2\pi}\cos(n_k\theta)\,e^{-im\theta}\,d\theta.
$$
由 $\cos(n\theta) = \tfrac12(e^{in\theta} + e^{-in\theta})$ 与正交性 $\frac{1}{2\pi}\int_0^{2\pi}e^{i\ell\theta}\,d\theta = \delta_{\ell,0}$（$\ell \in \mathbb{Z}$），
$$
\frac{1}{2\pi}\int_0^{2\pi}\cos(n_k\theta)\,e^{-im\theta}\,d\theta = \frac{1}{2}\big(\delta_{m, n_k} + \delta_{m, -n_k}\big).
$$
因 $n_k$ 两两不同且为正，集合 $\{\pm n_k\}_{k\ge1}$ 两两不相交，和式中至多一项贡献非零，其值为 $\epsilon_{n_k}$。$\blacksquare$

> **与旧版解答的对照**：旧稿步骤 4 写作 $|\hat f(m)| = \tfrac12\epsilon_{n_k} + \sum_{j \ne k}\epsilon_{n_j}\delta_{(\cdot)}$，暗示存在需要稀疏性抑制的「交叉项」——这是**错误的**：正交性使交叉项恒为零，无需任何稀疏性假设；系数 2 才是让 $|\hat f(n_k)| = \epsilon_{n_k}$ 的关键（若无因子 2，得 $\epsilon_{n_k}/2 < \epsilon_{n_k}$，构造失效）。

**结论.** 取 $m = n_k$（$k = 1, 2, \ldots$），由 Claim 3 得 $|\hat f(n_k)| = \epsilon_{n_k} \ge \epsilon_{n_k}$，对无穷多个 $n$ 成立。$\blacksquare$

## 备注

- **Riemann-Lebesgue 的最优性**：任何连续（乃至 $L^1$）函数的 Fourier 系数必趋于零（[[riemann-lebesgue-lemma]]），故 $\epsilon_n \to 0$ 是**必要条件**。本构造说明：对连续函数类，衰减速率**没有任何统一上界**——$\hat f(n)$ 可以任意慢地趋于 0。这与 [[fourier-coefficient-decay|Fourier 系数衰减]] 一族正向估计（$C^k$ / Lipschitz / 有界变差 ⇒ 具体速率）互为对偶：正则性给出速率，仅有连续性不给出任何速率。
- **与 Bernstein 定理的对照**：若 $f$ 满足 Hölder 阶 $\alpha > 1/2$，则 $\sum_n|\hat f(n)| < \infty$（[[bernstein-theorem]]）。本构造的系数绝对和 $\sum_n|\hat f(n)| = \sum_k \epsilon_{n_k} < \infty$ 亦有限，但中间大量指标系数为零——这与 Bernstein 定理不矛盾：后者要求的是逐点的 Hölder 正则性，而本构造的 $f$ 一般无此正则性（其 Fourier 系数为零的指标之间无结构约束）。
- **$n = 0$ 的情形**：$\hat f(0) = 0$（$\cos$ 在 $[0,2\pi]$ 上平均为零），故指标 $n_k$ 取正整数即可，无需处理 $m = 0$。

## 关联

- 用到的概念：[[fourier-coefficient]]、[[fourier-series]]
- 用到的定理：[[riemann-lebesgue-lemma]]（零阶衰减）、[[bernstein-theorem]]（Hölder $\alpha>1/2$ 绝对收敛——慢衰减的反方向）
- 用到的引理：[[fourier-coefficient-decay]]（(a)–(e) 的正向衰减族，本构造说明其最优性）、[[absolute-convergence-test]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3 Exercise 18）
