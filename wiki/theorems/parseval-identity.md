---
type: theorem
title: Parseval 恒等式
aliases: [Parseval identity, Parseval's identity]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, L2-theory]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 为圆上（Riemann）可积（弱——仅需可积，不要求光滑）；结论：函数均方范数的平方恰等于 Fourier 系数序列 $\ell^2$ 范数的平方（强——$L^2$ 与 $\ell^2$ 之间的精确等距关系），且 Fourier 部分和在均方意义下收敛。Bessel 不等式是其必要方向；由均方收敛定理（正交系完备性）取等。等价叙述：Riesz–Fischer 定理保证 $f \mapsto \{\hat f(n)\}$ 为 $L^2 \to \ell^2$ 的等距双射。
---

# Parseval 恒等式

## What — 陈述

> **工作空间**：本恒等式在多个工作空间成立——圆群 $\mathbb{T}$（本节主述形式）、实数线 $\mathbb{R}$（[[plancherel-theorem|Plancherel 形式]]）、有限阿贝尔群 $G$（[[finite-abelian-group]]，Ch. 7 Theorem 2.8 形式）；以下以圆群为例叙述，其余形式见「推广 / 变体」。
>
> **定理（Stein, Ch. 3, Theorem 1.3）**。设 $f$ 为圆上的（Riemann）可积函数，Fourier 系数
> $$
> \hat{f}(n) = \frac{1}{2\pi}\int_0^{2\pi} f(\theta)\,e^{-in\theta}\,d\theta, \qquad n \in \mathbb{Z},
> $$
> （等价地，取 $[0,1]$ 周期形式 $\hat{f}(n) = \int_0^1 f(\theta)\,e^{-2\pi i n\theta}\,d\theta$）。则
>
> (i) **均方收敛**：
> $$
> \frac{1}{2\pi}\int_0^{2\pi}\bigl|f(\theta) - S_N(f)(\theta)\bigr|^2\,d\theta \longrightarrow 0 \qquad (N \to \infty),
> $$
> 其中 $S_N(f) = \sum_{|n|\le N}\hat f(n)\,e^{in\theta}$；
>
> (ii) **Parseval 恒等式**：
> $$
> \sum_{n \in \mathbb{Z}} |\hat{f}(n)|^2 = \frac{1}{2\pi}\int_0^{2\pi}|f(\theta)|^2\,d\theta.
> $$

**关于平方可积的注记**。Stein 的假设是「圆上可积」（Riemann 意义），并未单独列出平方可积性：Riemann 可积函数必有界，故 $|f|^2$ 亦为 Riemann 可积，Parseval 右端自动有限。用 [[lp-space|$L^2$]] 空间（Lebesgue 视角）表述时，假设 $f \in$ [[lp-space|$L^2$]]$([0,2\pi])$ 正是使范数 $\left(\frac{1}{2\pi}\int|f|^2\right)^{1/2}$ 有限的前提；在可积（有界）函数类上两种表述一致（见「等价叙述」）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Theorem 1.3]]。

## Why — 动机与证明

### 动机

Parseval 恒等式把函数（$f$）与其 Fourier 系数（$\{\hat f(n)\}$）在 $L^2$ 与 $\ell^2$ 之间建立了精确的等距关系：函数空间中的能量（均方范数的平方）恰等于系数序列空间中的能量（$\ell^2$ 范数的平方）。这是 Fourier 分析理论建构的基石，也是均方收敛（正交基完备性）的系数语言表达。

### 证明思路

与 Stein 原书一致，证明分三步：

1. **正交性 ⇒ Bessel 不等式**：由 $f - S_N(f) \perp S_N(f)$（Pythagoras 恒等式）得 $\sum_{|n|\le N}|\hat f(n)|^2 \le \|f\|^2$；
2. **均方收敛**（定理 (i)，即 [[mean-square-convergence|均方收敛定理]]）：化归为连续函数（Fejér / Weierstrass 一致逼近）与可积函数（[[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]] 的 $L^1$ 逼近 + 有界性提升），再由 [[orthogonal-best-approximation|最优逼近引理]] 得到 $S_N(f) \to f$；
3. **令 $N \to \infty$**：在 Pythagoras 恒等式中取极限，即得 Parseval 等式。

### 详细证明

记 $\|g\| = \left(\frac{1}{2\pi}\int_0^{2\pi}|g(\theta)|^2\,d\theta\right)^{1/2}$，内积 $(g, h) = \frac{1}{2\pi}\int_0^{2\pi}g(\theta)\overline{h(\theta)}\,d\theta$，则 $\hat f(n) = (f, e_n)$。

**第一阶段：正交性 ⇒ Bessel 不等式。** 对 $|m|\le N$，
$$
(f - S_N(f),\; e_m) = \hat f(m) - \hat f(m) = 0,
$$
故 $f - S_N(f)$ 正交于 $\{e_m\}_{|m|\le N}$ 张成的子空间，特别地 $f - S_N(f) \perp S_N(f)$。Pythagoras 恒等式（正交向量范数平方相加）给出
$$
\|f\|^2 = \|f - S_N(f)\|^2 + \|S_N(f)\|^2 \ge \|S_N(f)\|^2 = \sum_{|n|\le N}|\hat f(n)|^2.
$$
（这是 [[orthogonal-best-approximation|最优逼近引理]] Ch. 3 Lemma 1.2 的同一论证：$S_N(f)$ 是 $f$ 在 $\{e_n\}_{|n|\le N}$ 张成子空间中的最佳逼近。）令 $N \to \infty$ 得 **Bessel 不等式**
$$
\sum_{n\in\mathbb{Z}}|\hat f(n)|^2 \le \|f\|^2.
$$

**第二阶段：均方收敛。** 断言 $\|f - S_N(f)\| \to 0$（即 [[mean-square-convergence|均方收敛定理]]，Ch. 3 Theorem 1.1）。由最优逼近引理，$S_N(f)$ 是 $f$ 在有限维子空间中的最佳逼近，故只需证明三角多项式在 $\|\cdot\|$ 下稠密。

- *连续函数情形*：设 $g$ 连续。由 Fejér 定理（[[fejer-theorem]]，Cesàro 平均一致收敛）与 Weierstrass 三角逼近定理（[[weierstrass-approximation-trig]]），存在三角多项式 $P_N$ 使 $\|g - P_N\|_\infty \to 0$，从而
$$
\|g - P_N\| \le \|g - P_N\|_\infty \to 0.
$$
- *一般可积函数情形*：由 [[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]]，存在连续函数 $g_k$ 使 $\sup|g_k| \le B$ 且 $\int_0^{2\pi}|f - g_k| \to 0$。因 $f$ 可积故有界（设 $|f| \le B$），
$$
\|f - g_k\|^2 \le \frac{1}{2\pi}\int|f - g_k|\cdot(|f| + |g_k|) \le \frac{2B}{2\pi}\int_0^{2\pi}|f - g_k| \to 0.
$$
- 综上，对给定 $\varepsilon > 0$ 取 $k$ 使 $\|f - g_k\| < \varepsilon$，再取三角多项式 $P_N$ 使 $\|g_k - P_N\| < \varepsilon$，三角不等式给出 $\|f - P_N\| < 2\varepsilon$。由最优逼近引理，$\|f - S_N(f)\| \le \|f - P_N\|$，故 $\|f - S_N(f)\| \to 0$。

**第三阶段：令 $N \to \infty$。** 在第一阶段的 Pythagoras 恒等式中取极限，并利用第二阶段 $\|f - S_N(f)\|^2 \to 0$：
$$
\|f\|^2 = \lim_{N\to\infty}\left(\|f - S_N(f)\|^2 + \sum_{|n|\le N}|\hat f(n)|^2\right) = \sum_{n\in\mathbb{Z}}|\hat f(n)|^2.
$$
即 Parseval 恒等式。$\blacksquare$

**依赖关系小结**。本证明的依赖链为「正交性 ⇒ Bessel 不等式 ⇒ 均方收敛 ⇒ 取极限」，其中均方收敛一步（叙述 (i)，即 [[mean-square-convergence|均方收敛定理]]）依次依赖：

1. **正交投影性质**（[[orthogonal-best-approximation|最优逼近引理]]，Ch. 3 Lemma 1.2）：$S_N(f)$ 是 $f$ 在 $\{e_n\}_{|n|\le N}$ 张成子空间中的最佳逼近，故「三角多项式稠密」足以推出 $\|f - S_N(f)\| \to 0$；
2. **三角多项式稠密（连续函数）**：[[fejer-theorem|Fejér 定理]]（Cesàro 平均一致收敛）与 [[weierstrass-approximation-trig|Weierstrass 三角逼近定理]]；
3. **三角多项式稠密（一般可积函数）**：[[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]] 的 $L^1$ 逼近 + 有界性提升。

**本证明不依赖 [[fourier-inversion|Fourier 反演]] 或 [[plancherel-theorem|Plancherel 定理]]**：圆群上的 Parseval 恒等式（Ch. 3 Thm 1.3）独立于 $\mathbb{R}$ 上的 Fourier 反演链（Ch. 3 Thm 1.9 ⇒ Thm 1.12），二者是平行结论，Plancherel 定理以 Parseval 的思想在 $\mathbb{R}$ 上重述同一等距关系（见 [[plancherel-theorem]] 页的「依赖关系小结」）。故依赖图中无环：正交性 ⇐ 最优逼近 ⇐ 稠密性（Fejér / Weierstrass / $L^1$ 逼近），每一环均不回指 Parseval 本身。

**与纯 Hilbert 空间证明的差异（对照 Stein）**。抽象 $L^2$ 框架把「三角多项式稠密」当作 Lebesgue 理论的自然结果；Stein 的 Riemann 框架不引入测度论，故密度必须显式构造：连续函数用 Fejér / Weierstrass，一般可积函数用 [[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]] 的 $L^1$ 逼近 + 有界性提升。因此 Stein 的证明比抽象证明多出「构造性」一步，本 wiki 按 Stein 写法重排证明。

## What-if — 反例、等价叙述与推广

### 等价叙述

#### 叙述 1（Stein 原始，圆群形式）
> $f$ 圆上可积 ⇒ (i) 均方收敛（[[mean-square-convergence]]）与 (ii) $\|f\|^2 = \sum |\hat f(n)|^2$。

#### 叙述 2（内积 Parseval，Ch.3 Lemma 1.5）
> 若 $F, G$ 为圆上的可积函数，$F \sim \sum a_n e_n$，$G \sim \sum b_n e_n$，则
> $$
> \frac{1}{2\pi}\int_0^{2\pi} F(\theta)\,\overline{G(\theta)}\,d\theta = \sum_{n \in \mathbb{Z}} a_n \overline{b_n}.
> $$

#### 叙述 3（$L^2$ 形式，Lebesgue 视角）
> $f \in$ [[lp-space|$L^2$]]$([0,2\pi])$ 时 Parseval 恒等式成立；此时左端是 $f$ 的 $L^2$ 范数平方，右端是系数序列 $\{\hat f(n)\}$ 的 $\ell^2$ 范数平方。

#### 叙述 4（推广：Bessel 不等式，任意正交族）
> 若 $\{\varphi_n\}$ 是标准正交族，$a_n = \langle f, \varphi_n\rangle$，则 $\sum |a_n|^2 \le \|f\|^2$。Parseval 恒等式是 $\{\varphi_n\}$ **完全**（completeness，即正交基）的精确表达。

#### 叙述 5（Riesz–Fischer 推论）
> $\{a_n\} \in \ell^2(\mathbb{Z})$ 当且仅当存在唯一的 $f \in L^2(\mathbb{T})$ 使 $\hat{f}(n) = a_n$。

**等价关系**：叙述 1 ≡ 叙述 2（极化恒等式）；叙述 3 是叙述 1 的 Lebesgue 视角重述（Stein 的 Riemann 假设蕴含其平方可积部分）；叙述 5 是叙述 3 + $\ell^2$ 的完备性 + 反问题解的存在唯一性。

### 反例（条件不可削弱）

1. **$f \in L^1 \setminus L^2$ 时 Parseval 无意义**：$f(\theta) = \theta^{-1/2}$（$0 < \theta \le 2\pi$）。$f$ 为 Lebesgue 可积（$\int_0^{2\pi}\theta^{-1/2}\,d\theta = 2\sqrt{2\pi} < \infty$）但 $f \notin L^2$（$\int_0^{2\pi}|f|^2\,d\theta = \int_0^{2\pi}\theta^{-1}\,d\theta = \infty$），Parseval 右端发散。在 Stein 的框架中 $f$ 无界，故不满足「圆上可积」的假设——这正是假设（可积，从而有界）不可削弱为 $L^1$ 的原因。
2. **在 Stein 假设内无反例**：Riemann 可积函数必有界，$|f|^2$ 自动可积，故「圆上可积」⇒ 平方可积 ⇒ Parseval 恒成立。反例只可能出现在假设之外（如上述无界函数），或在非完全正交族的情形（此时 Bessel 不等式严格）。

### 推广 / 变体

- **Plancherel 定理**（[[plancherel-theorem]]）：Fourier 变换版本，$\|f\|_2 = \|\hat f\|_2$（$f \in$ [[schwartz-space|$\mathcal{S}(\mathbb{R})$]]）。本质上是 Parseval 在 $\mathbb{R}$ 上的对应。
- **有限阿贝尔群**（[[finite-abelian-group]]，Ch. 7 Theorem 2.8）：$\|f\|^2 = \sum_{e \in \hat G}|\hat f(e)|^2$，Fourier 级数为有限和，Parseval 化为正交基展开的有限版本。
- **Wirtinger 不等式**（[[wirtinger-inequality]]，Ch.3 Exercise 11(a)）：若 $f$ 是 $2\pi$-周期、$C^1$、$\int_0^{2\pi} f = 0$，则 $\int |f|^2 \le \int |f'|^2$，由 Parseval 立得（取 $\hat f(n)$ 衰减估计）。
- **等周不等式**（Hurwitz 证明，[[isoperimetric-inequality]]）：通过参数化 $\gamma(s) = (x(s), y(s))$ 应用 Parseval 得 $\int (x^2+y^2)\le \int ((x')^2+(y')^2)$。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（圆群）| Bessel + 均方收敛（Stein 三步） | **中** | 需 Fejér / 连续逼近的构造性步骤 |
| 叙述 2（内积）| 极化恒等式 | **中** | 等价于叙述 1 |
| 叙述 5（Riesz–Fischer）| 完备化 $L^2$ | **高** | 需测度论完备化 |

## 应用

- **Riesz–Fischer 定理**：Parseval + $\ell^2$ 完备性 ⇒ 任意 $\ell^2$ 序列恰对应唯一 $L^2$ 等价类。
- **能量守恒**（物理语义）：Parseval 表明 Fourier 系数保持「能量」。
- **最佳逼近**：取部分和 $S_N(f)$ 在 $L^2$ 范数下最优（Ch.3 Lemma 1.2，[[orthogonal-best-approximation]]）。
- **Fourier 系数衰减**：由 Parseval / Bessel，$\hat f(n) \to 0$（Riemann-Lebesgue，[[riemann-lebesgue-lemma]]）；$f \in C^k$ 时衰减 $O(|n|^{-k})$。

## 关联

- 定理：[[plancherel-theorem]]（Fourier 变换版本）、[[poisson-summation-formula]]（条件用 [[schwartz-space|Schwartz 类]]）、[[mean-square-convergence|均方收敛]]（证明核心）、[[riemann-lebesgue-lemma]]
- 概念：[[lp-space|$L^2$ 空间]]、[[ellp-space|$\ell^2$ 序列空间]]、[[character|特征标]]（Fourier 基 $\{e^{2\pi i n \theta}\}$ 本质上是圆群特征标）、[[fourier-coefficient|Fourier 系数]]
- 方法：[[orthogonal-best-approximation]]（最优逼近）、[[cesaro-summation]]（Fejér 平均，均方收敛的构造工具）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Theorem 1.3 / Lemma 1.5）

### 此证明新引入 / 补充的 method

- **正交最佳逼近**（[[orthogonal-best-approximation]]）：Ch. 3 Lemma 1.2「$S_N(f)$ 在 $\{e_n\}_{|n| \le N}$ 张成子空间中最优」是 Bessel 不等式与均方收敛衔接的核心。
- **Fejér / Cesàro 平均**（[[cesaro-summation]]）：均方收敛证明中「三角多项式稠密」的构造性来源。

## Stein 写法备注

Parseval 在 Hilbert 空间语言中是「$L^2 \leftrightarrow \ell^2$ 等距」的最简形式。Stein 选 Riemann 积分框架，不引入抽象 Hilbert 空间与测度论，因此均方收敛的证明必须显式构造三角多项式逼近（Fejér 定理 + [[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]]）；这一「构造性」风格是本 wiki 重排证明的根据，也是后续学习 [[dominated-convergence|控制收敛]] 时「一致收敛 ⟶ 换序」思想的先导。
