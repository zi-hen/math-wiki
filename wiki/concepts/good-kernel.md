---
type: concept
title: 好核
aliases: [good kernel, approximation to the identity, identity approximation]
created: 2026-08-11
updated: 2026-08-11
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, approximation]
strength: standard
strength_basis: 条件：三条件（单位质量、$L^1$ 有界、质量集中）；结论：好核族卷积逼近原函数。好核是 Fourier 级数收敛性研究的标准工具，Dirichlet 核不满足好核条件（$L^1$ 范数无界），Fejér 核、Poisson 核满足。不涉及深层结构，但是一系列收敛定理的共同框架。
---
# 好核

> **工作空间**：圆群 $\mathbb{T} = [-\pi, \pi]$ 或 $\mathbb{R}^d$。Stein 在 Ch.2 §5 与 Ch.4 §2 给出圆群定义。

## 定义

一族**核函数** $\{K_n\}_{n=1}^\infty$（参数 $n \to \infty$）称为**好核（good kernel）**，若满足：

- **(a) 单位质量**：$\frac{1}{2\pi}\int_{-\pi}^{\pi} K_n(x)\,dx = 1$（圆群形式）。
- **(b) $L^1$ 有界**：$\int_{-\pi}^{\pi} |K_n(x)|\,dx \leq M$（与 $n$ 无关的常数）。
- **(c) 质量集中**：$\forall \delta > 0$，

$$
\int_{\delta \leq |x| \leq \pi} |K_n(x)|\,dx \to 0, \quad n \to \infty.
$$

**Stein 定理**：若 $\{K_n\}$ 是好核，则对任意 $f \in L^1(\mathbb{T})$，
$$
(f * K_n)(x) \to f(x), \quad n \to \infty
$$
在 $f$ 的连续点处成立；若 $f$ 处处连续则一致收敛。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 2 §5, Theorem 4.1]]。

#### 详细证明（Stein Theorem 4.1）

以下证明[[fourier-inversion|Fourier 反演]]（Corollary 1.7）与 [[plancherel-theorem|Plancherel]]证明二（Claim 4）所依赖的好核逼近定理, 仅依赖好核定义三条件 (a)(b)(c) 与 Riemann 积分标准性质, **不依赖 Fourier 反演本身**.

**Claim 1**（好核逼近, Stein Theorem 4.1）. 设 $\{K_n\}$ 是 $\mathbb{T}$ 上的好核族（满足 (a) 单位质量, (b) $L^1$ 有界, (c) 质量集中）, $f \in C(\mathbb{T})$ 为连续函数. 则
$$
\sup_{x \in \mathbb{T}} |(f * K_n)(x) - f(x)| \to 0 \qquad (n \to \infty).
$$

*证明.* 由 (a) 单位质量, $f = f * 1 = \int_{\mathbb T} f(x - y) \cdot 1\,dy = \int f(x-y)\,dy$. 故
$$
(f * K_n)(x) - f(x) = \int_{\mathbb T} \big[f(x - y) - f(x)\big] K_n(y)\,dy.
$$
由三角不等式与 (b) $L^1$ 有界 $\int |K_n| \le M$:
$$
|(f * K_n)(x) - f(x)| \le \int_{\mathbb T} |f(x - y) - f(x)| \cdot |K_n(y)|\,dy \le M \sup_y |f(x - y) - f(x)|.
$$
因 $f \in C(\mathbb T)$ 一致连续, 故 $\omega_f(\delta) := \sup_{|y| \le \delta} \sup_x |f(x - y) - f(x)| \to 0$ ($\delta \to 0$).

将积分拆为 $|y| < \eta$ 与 $|y| \ge \eta$:
$$
|(f * K_n)(x) - f(x)| \le M\omega_f(\eta) + 2\|f\|_\infty \int_{|y| \ge \eta} |K_n(y)|\,dy.
$$
由 (c) 质量集中, 取 $\eta$ 固定, 选 $N$ 充分大使 $n \ge N$ 时 $\int_{|y| \ge \eta} |K_n(y)|\,dy < \varepsilon/M\|f\|_\infty$. 由 $\omega_f(\eta) \to 0$ ($\eta \to 0$), 选 $\eta$ 充分小使 $M \omega_f(\eta) < \varepsilon$. 故
$$
\sup_x |(f * K_n)(x) - f(x)| < 2\varepsilon \qquad (n \ge N).
$$
$\varepsilon$ 任意, 一致收敛成立. $\blacksquare$

> **附注**: 对 $f \in L^1(\mathbb T)$ 在连续点处成立 (Stein Theorem 4.1 的更强形式). Fourier 反演主证明中, 由 $f \in \mathcal{S} \subset C(\mathbb T) \cap L^1(\mathbb T)$, 一致收敛直接成立.

> **依赖关系小结**: 本证明依赖链为「好核定义三条件 (a) 单位质量 / (b) $L^1$ 有界 / (c) 质量集中（本页「定义」节）⇒ 卷积差分解 $f = f * 1$（条件 (a)）+ [[triangle-inequality-complex|三角不等式]] ⇒ 紧集上连续函数一致连续（Heine–Cantor，模 $\omega_f(\delta) \to 0$）⇒ 积分拆分 $M\omega_f(\eta) + 2\|f\|_\infty \int_{|y| \ge \eta} |K_n(y)|\,dy$ ⇒ (c) 质量集中消去远端质量 + (b) 提供均匀常数 $M$ + $\varepsilon$ 选取 ⇒ 一致收敛」。关键依赖方向：三条件逐层起作用——(a) 给出差分解的起点，(b) 使逐点差可被 $\omega_f$ 均匀控制，(c) 处理远离原点处的质量；中间步骤仅用积分线性/可加性与 $f$ 的一致连续性。不依赖 [[fejer-theorem|Fejér 定理]]、[[riemann-lebesgue-lemma|Riemann–Lebesgue 引理]] 或 [[fourier-inversion|Fourier 反演]]本身（本证明为后者提供前置，而非反向依赖）。依赖图无环。

## 动机与背景

好核是 Fourier 级数收敛性研究的核心工具。Dirichlet 核 $D_N$ 不是好核（$L^1$ 范数增长），故 Fourier 级数的点态收敛是精细问题；Fejér 核 $F_N$、Poisson 核 $P_r$、热核 $H_t$、Gauss 核 $K_\delta$ 均为好核，提供求和法与逼近工具。

## 性质

- **卷积逼近**：$(f * K_n)(x) = \int f(x-y) K_n(y)\,dy$（详见 [Claim 1](#详细证明stein-theorem-41)）。
- **收敛保证**：好核条件 (c) 排除质量从原点扩散。
- **与 Fourier 级数关系**：若 $K_n$ 的 [[fourier-coefficient|Fourier 系数]] $\hat{K}_n(k) \to 1$（$n \to \infty$，$\forall k$），则 $K_n$ 是好核（用 [fourier-coefficient|线性性]] + [dominated-convergence|控制收敛]]验证 $\int K_n = 1$ 等）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 2 §5, Theorem 4.1]]。

## 关联

- 概念：[[fourier-series]]（好核用于研究收敛性）。
- 应用：Dirichlet 核（**非**好核，[[dirichlet-kernel-l1-norm|其 $L^1$ 范数 $\to \infty$]]）、Fejér 核、Poisson 核、热核、Gauss 核。

## 典型反例 / 边界

- **Dirichlet 核 $D_N(x) = \sum_{|n| \leq N} e^{inx}$**：**非**好核，因 $\int |D_N| \geq c\log N$（$L^1$ 范数增长）。
- **Fejér 核 $F_N(x) = \frac{1}{N}\sum_{n=0}^{N-1} D_n(x)$**：好核。Cesàro 求和法的基础。
- **Poisson 核 $P_r(\theta) = \sum r^{|n|} e^{in\theta}$（$0 < r < 1$）**：好核。Abel 求和法的基础。
- **热核 $H_t(x) = \sum e^{-4\pi^2 n^2 t} e^{2\pi i nx}$（$t > 0$）**：好核。热方程解的 Fourier 展开。
- **Gauss 核 $K_\delta(x) = \frac{1}{\sqrt{2\pi}\delta} e^{-x^2/2\delta^2}$**：好核。Weierstrass 逼近定理的基础。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 2 §5, Ch. 4 §2]] 与 [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验）]]。

## 等价叙述

### 叙述 1（圆群形式，Stein Ch.2）

> $\{K_n\}$ 满足 (a)(b)(c) 三条件。

### 叙述 2（$\mathbb{R}^d$ 形式）

> 在 $\mathbb{R}^d$ 上，$\{K_\delta\}$（$\delta \to 0$）是好核若 (a) $\int K_\delta = 1$；(c) $\int_{|x| \geq \eta} |K_\delta| \to 0$（$\forall \eta > 0$）。

### 叙述 3（Fourier 系数刻画）

> $\{K_n\}$ 是好核当且仅当 $\hat{K}_n(k) \to 1$（$\forall k \in \mathbb{Z}$）。

**等价关系**：叙述 1 ≡ 叙述 2（一般化）；叙述 3 等价于 1（Stein Ch.4 隐含）。

## 证明难度差异

### 叙述 1（Stein Ch.2）的证明

- **方法**：直接验证三条件 + Riemann-Lebesgue 引理。
- **难度**：**低**——Stein Ch.2 Theorem 4.1 给出完整证明。
- **代价**：仅适用圆群上的 Riemann 框架。

### 叙述 3（Fourier 系数刻画）的证明

- **方法**：$\hat{K}_n(k) \to 1$ ⇒ 单位质量；$\hat{K}_n$ 单变量收敛 ⇒ $L^1$ 质量集中。
- **难度**：**中**——需 Fourier 系数与卷积的关系。
- **结论**：便于检查具体核是否为好核。

### 推广——Gauss 核的极限定理

- **方法**：研究 $K_\delta$ 作为 $\delta \to 0$ 的 Dirac delta 逼近族。
- **难度**：**高**——涉及分布理论。
- **结论**：Weierstrass 逼近定理、多项式逼近、磨光算子。

**总评**：本 wiki 覆盖叙述 1–3；叙述 4（分布层）属后续卷。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 2 §5]]
- [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验）]]