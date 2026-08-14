---
type: concept
title: Schwartz 空间
aliases: [Schwartz space, rapidly decreasing functions, test functions]
created: 2026-08-11
updated: 2026-08-11
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, real-analysis]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f \in C^\infty$ 且所有导数速降（强——要求无穷阶光滑与多项式衰减）；结论：Fourier 变换的自同构（强——$\mathcal{F}: \mathcal{S} \to \mathcal{S}$ 为连续双射）。Schwartz 空间是 Fourier 分析的核心函数类，连接光滑性与衰减性，是分布理论的基础。
---
# Schwartz 空间

> **工作空间**：$\mathbb{R}^d$（亦可定义于 $\mathbb{R}^n$ 或局部紧阿贝尔群）。Stein 在 Ch.5 §1 中严格定义。

## 定义

$\mathcal{S}(\mathbb{R}^d)$（Schwartz 空间）由所有满足下述条件的 $C^\infty$ 函数 $f: \mathbb{R}^d \to \mathbb{C}$ 构成：

$$
\sup_{x \in \mathbb{R}^d} |x^\alpha \partial^\beta f(x)| < \infty, \qquad \forall \alpha, \beta \in \mathbb{N}^d.
$$

其中 $\alpha$、$\beta$ 为多重指标。

直观解释：$f$ 与其所有导数**比多项式衰减得快**（rapid decrease）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5 §1.2, p. 132]]。

## 动机与背景

Schwartz 空间为 Fourier 变换提供理想的封闭函数类：

1. **Fourier 变换自身封闭**：若 $f \in \mathcal{S}$，则 $\hat{f} \in \mathcal{S}$（详见 [[fourier-transform]]）。
2. **Fourier 反演成立**：若 $f \in \mathcal{S}$，则 $f(x) = \int \hat{f}(\xi) e^{2\pi i \xi\cdot x} d\xi$。
3. **基本运算封闭**：平移、伸缩、卷积、微分、乘法均将 $\mathcal{S}$ 映为 $\mathcal{S}$。

## 性质

- **拓扑向量空间**：$\mathcal{S}$ 上可定义一族半范数 $\|f\|_{\alpha,\beta} = \sup_x |x^\alpha \partial^\beta f(x)|$ 构成 Fréchet 空间。
- **稠密性**：$\mathcal{S}$ 在 $L^p(\mathbb{R}^d)$ 中稠密（$1 \leq p < \infty$）。
- **包含关系**：$C_c^\infty(\mathbb{R}^d) \subsetneq \mathcal{S}(\mathbb{R}^d) \subsetneq L^p(\mathbb{R}^d)$（$1 \leq p < \infty$）。
- **包含 $C_c^\infty$**：紧支撑光滑函数类是 $\mathcal{S}$ 的稠密子集。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5 §1.2–§1.3]]。

### 详细证明（基本性质与 Fourier 变换自同构）

以下逐条证明 [[fourier-inversion|Fourier 反演]]与 [[plancherel-theorem|Plancherel]]所依赖的 $\mathcal{S}$ 的关键性质, 全部仅依赖 $\mathcal{S}$ 定义与 [[fourier-transform|Fourier 变换]]的基本代数性质 (平移 / 伸缩 / 乘 $x$ / 微分对偶, 见 [concepts/fourier-transform.md](../concepts/fourier-transform.md) §「详细证明」), **不依赖 Fourier 反演本身**.

**Claim 1**（Fourier 变换将 $\mathcal{S}$ 映为 $\mathcal{S}$, Stein Theorem 1.3）. 若 $f \in \mathcal{S}(\mathbb R^d)$, 则 $\hat f \in \mathcal{S}(\mathbb R^d)$.

*证明.* 只需验证 $\hat f$ 满足 Schwartz 条件: 对任意 $\alpha, \beta \in \mathbb N^d$, $\sup_\xi |\xi^\alpha \partial^\beta_\xi \hat f(\xi)| < \infty$.

**关键代数公式**: 由 [[fourier-transform|Fourier 变换]]乘 $x$/微分对偶（Claim 5 in [fourier-transform.md](../concepts/fourier-transform.md)）:
- $\widehat{x_j f}(\xi) = \frac{i}{2\pi} \partial_{\xi_j} \hat f(\xi)$（**乘 $x_j$ ⇒ 求 $\xi_j$ 导数**, 除以 $2\pi i$）
- $\widehat{\partial_{x_j} f}(\xi) = 2\pi i \xi_j \hat f(\xi)$（**$\partial_{x_j}$ ⇒ 乘 $\xi_j$**, 乘以 $2\pi i$）

反复应用 $|\alpha|$ 次**第一个公式**（乘 $x^\alpha$ ⇒ 求 $\partial^\alpha_\xi$, 系数 $(i/2\pi)^{|\alpha|}$）+$|\beta|$ 次**第二个公式**的逆运算（$\partial^\beta_x \Rightarrow$ $\partial^\beta_\xi$ 除以 $(2\pi i)^{|\beta|}$ 后再乘 $\xi^\beta$）, 得
$$
\xi^\alpha \partial^\beta_\xi \hat f(\xi) = (2\pi i)^{|\alpha|} (-1)^{|\beta|} \widehat{x^\alpha \partial^\beta_x f}(\xi).
$$

右侧: $x^\alpha \partial^\beta_x f \in \mathcal{S}$（由 Claim 2 (a)(b)）, 故 $\widehat{x^\alpha \partial^\beta_x f}$ 是**有界连续函数**（因 $\mathcal{S} \subset$ [[lp-space|$L^1$]]（[[lp-space]] Claim 3 证）, Fourier 变换连续且 $|g(x)| \le \|g\|_{L^1}$）. 特别地
$$
|\xi^\alpha \partial^\beta_\xi \hat f(\xi)| \le (2\pi)^{|\alpha|+|\beta|} \|x^\alpha \partial^\beta_x f\|_{L^1} < \infty.
$$

由 $\alpha, \beta$ 任意, $\hat f \in \mathcal{S}$. $\blacksquare$

**Claim 2**（$\mathcal{S}$ 对基本运算封闭）. 下列运算将 $\mathcal{S}(\mathbb R^d)$ 映为 $\mathcal{S}(\mathbb R^d)$:

(a) **乘法**: $f \mapsto x^\alpha f$（$\alpha \in \mathbb N^d$）.
(b) **求导**: $f \mapsto \partial^\beta_x f$（$\beta \in \mathbb N^d$）.
(c) **平移**: $f \mapsto f(\cdot - a)$（$a \in \mathbb R^d$）.
(d) **伸缩**: $f \mapsto f(\lambda \cdot)$（$\lambda \in \mathbb R \setminus \{0\}$）.
(e) **卷积**: $f \mapsto f * g$（$g \in \mathcal{S}$）.
(f) **复共轭**: $f \mapsto \overline{f(-\cdot)}$（用于 Plancherel 证明中的自相关卷积）.

*证明.*

**(a) 乘法**: 若 $f \in \mathcal{S}$, $x^\alpha f$ 仍为 $C^\infty$, 且对任意 $\beta$, $\partial^\beta_x(x^\alpha f)$ 是 $x^\gamma \partial^\delta_x f$ 的有限线性组合（ Leibniz 公式）, 仍满足速降条件. 故 $x^\alpha f \in \mathcal{S}$.

**(b) 求导**: 类似, $\partial^\beta_x f \in C^\infty$, 且 $x^\alpha \partial^\gamma_x(\partial^\beta_x f) = x^\alpha \partial^{\beta+\gamma}_x f$ 由速降性得界. 故 $\partial^\beta_x f \in \mathcal{S}$.

**(c) 平移**: $f \in \mathcal{S}$ ⇒ $f(\cdot - a)$ 仍 $C^\infty$; 对任意 $\alpha, \beta$, $\sup_x |x^\alpha \partial^\beta_x f(x - a)| = \sup_y |(y+a)^\alpha \partial^\beta_y f(y)| < \infty$（$(y+a)^\alpha$ 是 $y^\alpha$ 的多项式, 与 $\partial^\beta_y f$ 的速降性相乘仍有界）. 故 $f(\cdot - a) \in \mathcal{S}$.

**(d) 伸缩**: $f(\lambda \cdot)$ 仍 $C^\infty$; $\sup_x |x^\alpha \partial^\beta_x f(\lambda x)| = |\lambda|^{-|\alpha|-|\beta|} \sup_x |(\lambda x)^\alpha \partial^\beta_y f(y)\big|_{y = \lambda x} = |\lambda|^{-|\alpha|-|\beta|} \sup_y |y^\alpha \partial^\beta_y f(y)| < \infty$（用链式法则 $\partial_x = \lambda \partial_y$, 故 $\partial^\beta_x f(\lambda x) = \lambda^{|\beta|} (\partial^\beta_y f)(\lambda x)$）. 故 $f(\lambda \cdot) \in \mathcal{S}$.

**(e) 卷积**: 由 Proposition 1.11(i) (Stein), 可直接验证: $f, g \in \mathcal{S}$ ⇒ $f * g \in C^\infty$（卷积光滑化）+ $\partial^\beta_x(f * g) = (\partial^\beta_x f) * g$（求导可移出卷积）+ $x^\alpha(f * g) = \sum_{\gamma \le \alpha} \binom{\alpha}{\gamma} (x^\gamma f) * (x^{\alpha - \gamma} g)$（Leibniz 公式分配到两个因子）. 由 $\mathcal{S}$ 对乘 $x$ 与求导封闭, 各项均速降, 故 $f * g \in \mathcal{S}$.

**(f) 复共轭 + 反射**: $\overline{f(-x)}$ 仍 $C^\infty$; 对任意 $\alpha, \beta$, $\sup_x |x^\alpha \partial^\beta_x \overline{f(-x)}| = \sup_x |x^\alpha \overline{\partial^\beta_y f(y)\big|_{y = -x}}| = \sup_y |(-y)^\alpha \partial^\beta_y \overline{f(y)}| = \sup_y |y^\alpha \partial^\beta_y f(y)| < \infty$（最后等号由 $\overline{\cdot}$ 与 $(-y)^\alpha$ 皆不改变量级）. 故 $\overline{f(-\cdot)} \in \mathcal{S}$. $\blacksquare$

> **附注**: 上述全部证明仅依赖 $\mathcal{S}$ 的定义与 [[fourier-transform|Fourier 变换]]的代数性质 (Claim 1–6 in [concepts/fourier-transform.md](../concepts/fourier-transform.md)), **不依赖 Fourier 反演**. 因此是 [[fourier-inversion]] 与 [[plancherel-theorem]] 证明的合法前置, 无循环.

## 关联

- 概念：[[fourier-transform]]（在 $\mathcal{S}$ 上 Fourier 变换是自同构）。
- 概念：[[lp-space]]（$\mathcal{S} \subset L^2$）。
- 概念：[[bump-function|bump 函数]]（$C_c^\infty$ 的非平凡元，$\mathcal{S}$ 的紧支集子类）。
- 定理：[[poisson-summation-formula]]（条件 $f \in \mathcal{S}$）。
- 引理：[[absolute-convergence-test]]（Schwartz 类衰减 ⇒ Fourier 反演所需绝对收敛）。

## 典型反例 / 边界

- $e^{-x^2/2} \in \mathcal{S}$：经典 Schwartz函数（高斯）。
- $e^{-x^2} \in \mathcal{S}$：衰减快于多项式。
- $\frac{1}{(1+x^2)^n}$（$n$ 足够大）$\in \mathcal{S}$。
- **不属于 $\mathcal{S}$**：
 - $e^{-|x|}$（衰减不够快，$\partial^k f$ 在 $\infty$ 不衰减）。
 - $\sin(x)/x$（非光滑）。
 - 多项式本身（无衰减）。

## 等价叙述

### 叙述 1（多重指标定义，Stein Ch.5）

> $f \in \mathcal{S}(\mathbb{R}^d)$ 当且仅当 $\sup_x |x^\alpha \partial^\beta f(x)| < \infty$ 对所有 $\alpha, \beta \in \mathbb{N}^d$。

### 叙述 2（积分等价条件）

> $f \in \mathcal{S}$ 当且仅当 $\int |x^\alpha \partial^\beta f(x)| dx < \infty$ 对所有 $\alpha, \beta$。

### 叙述 3（形式幂级数等价）

> $f \in \mathcal{S}$ 当且仅当 $f$ 及其 Fourier 变换 $\hat{f}$ 均光滑且快速衰减。

**等价关系**：叙述 1 ≡ 叙述 2（$L^\infty$ vs $L^1$ 范数差异）；叙述 3 等价于 1（经 Fourier 变换 $\mathcal{S} \to \mathcal{S}$ 自同构）。

## 证明难度差异

### 叙述 1（Stein 原始）的证明

- **方法**：直接用多重指标定义，验证基本运算封闭性。
- **难度**：**低**——Stein Ch.5 §1.2 即给出定义与基本性质。
- **代价**：仅适用 $\mathbb{R}^d$。

### 叙述 3（$\mathcal{S}$ 自同构）的证明

- **方法**：利用 $\widehat{x^\alpha f}$ 与 $\widehat{\partial^\beta f}$ 的封闭公式，证明 Fourier 变换是 $\mathcal{S} \to \mathcal{S}$ 的自同构。
- **难度**：**中**——Stein Ch.5 Theorem 1.5。
- **结论**：$\mathcal{S}$ 是 Fourier 变换的封闭函数类。

### 推广——广义函数（distributions）

- **方法**：将 $\mathcal{S}$ 上的连续线性泛函定义为广义函数。
- **难度**：**高**——需引入拓扑对偶空间 $\mathcal{S}'$。
- **结论**：Fourier 变换扩展为 $\mathcal{S}' \to \mathcal{S}'$ 的自同构。

**总评**：本 wiki 覆盖叙述 1 与 3；广义函数（叙述 4）属 Stein 后续卷。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 5 §1.2]]
- [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验）]]