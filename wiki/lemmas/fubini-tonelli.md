---
type: lemma
title: Fubini-Tonelli 定理
aliases: [Fubini-Tonelli theorem, Fubini, Tonelli]
created: 2026-08-12
updated: 2026-08-15
sources: [steinFourierAnalysisIntroduction2003a, steinComplexAnalysis]
status: verified
tags: [analysis, measure-theory]
---

# Fubini-Tonelli 定理

> **工作空间**：测度空间 $(X, \mathcal{M}, \mu)$、$(Y, \mathcal{N}, \nu)$，乘积空间 $X \times Y$；数学分析版本中取 $X = \mathbb{R}^{d_1}$、$Y = \mathbb{R}^{d_2}$（Lebesgue 或 Riemann 测度）。

## 陈述（测度论版本）

设 $f: X \times Y \to \mathbb{C}$ 可测。

**(Tonelli)**：若 $f \geq 0$，则
$$
\int_{X \times Y} f\, d(\mu \otimes \nu) = \int_X \left( \int_Y f(x, y)\, d\nu(y) \right) d\mu(x) = \int_Y \left( \int_X f(x, y)\, d\mu(x) \right) d\nu(y).
$$
（$\int = \infty$ 时仍成立。）

**(Fubini)**：若 $f \in L^1(X \times Y)$（绝对可积），则
- $f(x, \cdot) \in L^1(Y)$ 对 a.e. $x$；
- $f(\cdot, y) \in L^1(X)$ 对 a.e. $y$；
- 两个累次积分均等于 $\int_{X \times Y} f\, d(\mu \otimes \nu)$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Fourier Analysis, 附录 p.308–309]]（分析版）与 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis]]（隐式使用）；测度论完整陈述见后续 Real Analysis 卷。原书刻意回避「Fubini」术语而只证「满足衰减条件的重积分可交换次序」（见 [[chat-fourier-series-2026-08-11|AI 对话笔记]] 核验），其内容即下方「数学分析版本」。

## 证明（简要）

1. **Tonelli**（非负情形）：先证对 $f = \chi_A$（$A \in \mathcal{M} \otimes \mathcal{N}$），由可测矩形张成。
2. **Fubini**（一般情形）：将 $f$ 拆为 $f = f^+ - f^-$。由 Tonelli 应用于 $|f|$ 给出 $|f| \in L^1$ ⇒ $f \in L^1$，且逐点绝对可积。

$\blacksquare$

## 数学分析版本（Stein 用法，一致语言）

> **一致性说明**：本 wiki 其余页面（[[poisson-summation-formula]]、[[ch1-ex3-double-fourier-transform]]、[[fourier-transform]] 等）引用「Fubini」时，一律指**下述分析版本**，不指测度论版本。术语约定：「重积分」= $\int_{X\times Y}$（或 $\iint$）；「累次积分」= $\int_X\int_Y$ 或 $\int_Y\int_X$；「绝对可积」统一写作 $f \in L^1$ 或 $\iint|f|<\infty$；测度论术语（乘积测度、几乎处处、可测）仅在本页「陈述」区段出现。

**版本 1（紧支集连续函数，Riemann 意义）**. 设 $f: \mathbb{R}^{d_1} \times \mathbb{R}^{d_2} \to \mathbb{C}$ 连续且紧支集，则
$$
\iint_{\mathbb{R}^{d_1+d_2}} f\,dx\,dy = \int_{\mathbb{R}^{d_1}}\left(\int_{\mathbb{R}^{d_2}} f(x,y)\,dy\right)dx = \int_{\mathbb{R}^{d_2}}\left(\int_{\mathbb{R}^{d_1}} f(x,y)\,dx\right)dy,
$$
三种积分均以 Riemann 意义良定义且相等。

**版本 2（非负 / 绝对可积，Lebesgue 意义）**. 设 $f$ 可测。
- 若 $f \ge 0$，则重积分与两种累次积分在 $[0, \infty]$ 中相等（Tonelli）；
- 若 $\iint_{\mathbb{R}^{d_1+d_2}}|f| < \infty$，则 $y \mapsto f(x,y)$ 对几乎处处 $x$ 可积、$x \mapsto f(x,y)$ 对几乎处处 $y$ 可积，且三个积分相等（Fubini）。

**版本 3（一致收敛 / 逐项积分，Stein 实际用法）**. 设 $K \subset \mathbb{R}^{d_2}$ 为测度有限的紧集，$F_j: K \to \mathbb{C}$ 可积（$j \ge 1$），且部分和 $S_N = \sum_{j=1}^{N}F_j$ 在 $K$ 上一致收敛（即 $\sup_{y\in K}|S_N(y) - S(y)| \to 0$，$N \to \infty$，其中 $S = \sum_{j=1}^{\infty}F_j$）。则 $S$ 在 $K$ 上可积，且
$$
\int_K \sum_{j=1}^{\infty} F_j(y)\,dy = \sum_{j=1}^{\infty}\int_K F_j(y)\,dy.
$$

**版本 3 的证明**. 分三步。

**第一步（$S$ 的可积性）**. 由一致收敛，存在 $N_0$ 使 $\sup_K|S_N - S_{N_0}| \le 1$ 对一切 $N \ge N_0$ 成立；取 $N \to \infty$ 得 $\sup_K|S - S_{N_0}| \le 1$，故 $\|S\|_\infty \le \|S_{N_0}\|_\infty + 1 < \infty$。$K$ 测度有限，有界可测函数 $S$ 在 $K$ 上可积（[[lp-space|$L^1$]] 意义；Riemann 框架下，一致收敛的可积函数列之极限 Riemann 可积，是标准定理）。

**第二步（差的估计）**. 对任意 $N$，由三角不等式与积分保序性，
$$
\left|\int_K S_N\,dy - \int_K S\,dy\right| \le \int_K |S_N - S|\,dy \le |K|\cdot\sup_K|S_N - S| \longrightarrow 0 \qquad (N \to \infty),
$$
其中 $|K|$ 表示 $K$ 的测度。

**第三步（有限和取极限）**. 对固定 $N$，由有限和的积分线性性 $\int_K S_N\,dy = \sum_{j=1}^{N}\int_K F_j\,dy$。结合第二步，$\sum_{j=1}^{N}\int_K F_j\,dy \to \int_K S\,dy$，即级数 $\sum_j\int_K F_j\,dy$ 收敛且等于 $\int_K S\,dy$。$\blacksquare$

> **参数版（Stein 实际用法）**：若 $F_j(x,y)$ 还含参数 $x$，则对每个固定 $x$ 应用上述结果得逐项积分；若一致收敛关于 $x$ 也一致成立（$\sup_{x\in U}\sup_{y\in K}|S_N(x,y)-S(x,y)| \to 0$，$U$ 为紧集），则第二步对 $x$ 一致成立，从而 $\sum_j\int_K F_j(x,y)\,dy$ 关于 $x$ 一致收敛到 $\int_K S(x,y)\,dy$——这为「先逐项积分再对参数取极限」的次序交换提供依据（[[poisson-summation-formula|Poisson 求和]] 证明二 Claim 5(i)：M-判别法一致收敛 + 总质量估计）。

（[[poisson-summation-formula|Poisson 求和公式]] 证明二 Claim 5(i) 即用此版本；Stein 前四章限于 Riemann 积分，凡交换积分与求和均用此一致收敛版本替代测度论判据。）

**版本 4（Schwartz 试验函数，wiki 默认）**. 设 $f \in$ [[schwartz-space|Schwartz 空间]] $\mathcal{S}(\mathbb{R}^{d_1} \times \mathbb{R}^{d_2})$，则 $f$ 自动满足版本 2 的绝对可积条件，版本 2 无条件适用。wiki 各定理页在 $\mathcal{S}$ 框架下交换积分次序（乘法公式、Poisson 求和、双重 Fourier 变换反演）均引用此版本。

> **四个版本的关系**：版本 1 ⊂ 版本 2 ⊂ 版本 4（函数类递增）。版本 3 亦可由版本 2 的 Tonelli 部分推出（把 $\sum_j$ 视为对 $\mathbb{Z}_{\ge1}$ 上计数测度的积分，对非负函数应用 Tonelli）；但 Stein 前四章限于 Riemann 框架，乘积测度理论不在其工具内，故版本 3 需要上方「一致收敛」这一初等判据的直接证明（只依赖积分线性性、三角不等式与测度有限）。四个版本共用同一「重积分 / 级数可交换次序」的结论，区别只在函数类的正则性要求。

## 应用

- [[poisson-summation-formula|Poisson 求和公式]]：在 Claim 2（积分与求和可交换性）证明中使用 Fubini 控制交换。
- [[ch1-ex3-double-fourier-transform|双重 Fourier 变换的反演]]：Gauss 阻尼后 $F_\epsilon \in L^1(\mathbb{R}^2)$，Fubini 交换积分次序（版本 2/4）。
- [[fourier-transform|Fourier 变换]] 的卷积定理：$\iint |f(x-y)g(y)|\,dx\,dy = \|f\|_1\|g\|_1 < \infty$。
- **Chebyshev 不等式**、**Fubini 测度的密度**（测度论版本）
- **期望值与边际分布**：概率论核心

## 关联

- 概念：[[character|特征标]]
- 定理：[[poisson-summation-formula]]
- 习题：[[ch1-ex3-double-fourier-transform]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（附录 p.308–309）+ [[steinComplexAnalysis]] + [[chat-fourier-series-2026-08-11]]（分析版用法核验）
