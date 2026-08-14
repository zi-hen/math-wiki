---
type: theorem
title: Riemann 局部化原理
aliases: [Riemann localization principle, Riemann localization theorem]
created: 2026-08-11
updated: 2026-08-11
sources: [chat-fourier-series-2026-08-11, steinFourierAnalysisIntroduction2003a]
status: pending-verification
tags: [fourier-analysis, convergence]
strength: weak
strength_basis: 条件：$f, g$ 在 $\theta_0$ 邻域内相等（弱——局部假设）；结论：$S_N(f)(\theta_0) - S_N(g)(\theta_0) \to 0$（弱——仅给出局部化结论，反例性弱定理）。被 Kolmogorov 1923 推翻（连续函数 Fourier 级数可无处收敛），弱于 Carleson 1966 定理（$L^2$ Fourier 级数几乎处处收敛）。
---
# Riemann 局部化原理

> **工作空间**：圆群 $\mathbb{T} = [-\pi, \pi]$（Stein 在 Ch.3 给出本定理的圆群形式）。

## 陈述

> 设 $f, g$ 为圆群 $\mathbb{T} = [-\pi, \pi]$ 上的可积函数。若存在 $\theta_0$ 的开邻域 $I$ 使得 $f(\theta) = g(\theta)$（$\forall \theta \in I$），则
$$
S_N(f)(\theta_0) - S_N(g)(\theta_0) \to 0,\quad N \to \infty,
$$
其中 $S_N(f)$ 为 $f$ 的第 $N$ 个 Fourier 部分和：
$$
S_N(f)(\theta) = \sum_{|n| \leq N} \hat{f}(n)\,e^{in\theta}.
$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Theorem 2.2]]。

## 前提条件

- $f, g \in$ [[lp-space|$L^1(\mathbb{T})$]] （Riemann 可积）。
- 在 $\theta_0$ 的某邻域内 $f = g$。
- $\theta_0$ 处 $f$（或等价地 $g$）存在导数。

## 证明思路

设 $h = f - g$。则 $h$ 在 $\theta_0$ 的邻域内为零，从而 $h$ 在 $\theta_0$ 处可微且 $h'(\theta_0) = 0$。

由 Ch. 3, Theorem 2.1（若 $f$ 在 $\theta_0$ 可微，则 $S_N(f)(\theta_0) \to f(\theta_0)$），得 $S_N(h)(\theta_0) \to h(\theta_0) = 0$。

Theorem 2.1 的关键步骤：
$$
S_N(f)(\theta_0) - f(\theta_0) = \frac{1}{2\pi}\int_{-\pi}^{\pi} F(t)\cdot t\cdot D_N(t)\,dt,
$$
其中 $F(t) = \frac{f(\theta_0 - t) - f(\theta_0)}{t}$（$t \neq 0$），$F(0) = -f'(\theta_0)$，$D_N$ 为 Dirichlet 核。

由于 $tD_N(t) = \frac{t}{\sin(t/2)}\sin((N+1/2)t)$ 中 $\frac{t}{\sin(t/2)}$ 在 $[-\pi, \pi]$ 上有界，由 Riemann-Lebesgue 引理（Theorem 1.4），积分趋于零。

## 详细证明

### 证明动机

本定理的证明归结为一个关键观察：设 $h = f - g$，则 $h$ 在 $\theta_0$ 的某邻域内恒为零，从而 $h$ 在 $\theta_0$ 处**平凡可微**（$h'(\theta_0) = 0$）。因此问题化为：若 $h$ 在 $\theta_0$ 处可微，证明 $S_N(h)(\theta_0) \to h(\theta_0)$。这正是 Stein Ch. 3, Theorem 2.1 的结论。

证明 Theorem 2.1 的核心困难在于：Dirichlet 核 $D_N$ 的 [[lp-space|$L^1$]] 范数增长为 $O(\log N)$，故 $D_N$ **不是** [[good-kernel|好核]]，无法直接由好核理论得到收敛性。突破点在于：被积函数中 $h(\theta_0 - t) - h(\theta_0)$ 在 $t = 0$ 附近提供的 $t$ 因子抵消了 $D_N$ 的奇异性，使 Riemann-Lebesgue 引理得以应用。

### 详细证明

**第一阶段：归约**。

令 $h = f - g$。由假设，存在 $\delta > 0$ 使得 $h(\theta) = 0$ 对所有 $|\theta - \theta_0| < \delta$ 成立。特别地，$h(\theta_0) = 0$，且 $h$ 在 $\theta_0$ 处可微，导数 $h'(\theta_0) = 0$。由 Fourier 部分和的线性性，
$$
S_N(f)(\theta_0) - S_N(g)(\theta_0) = S_N(h)(\theta_0).
$$
因此只需证明 $S_N(h)(\theta_0) \to 0$。

**第二阶段：Dirichlet 核表示**。

回忆 Dirichlet 核的定义（[[steinFourierAnalysisIntroduction2003a|Stein, Ch. 3, §1]]）：
$$
D_N(t) = \sum_{|n| \leq N} e^{int} = \frac{\sin((N + 1/2)t)}{\sin(t/2)}, \qquad t \neq 0.
$$
Fourier 部分和可表为卷积形式：
$$
S_N(h)(\theta_0) = \frac{1}{2\pi} \int_{-\pi}^{\pi} h(\theta_0 - t)\, D_N(t)\, dt. \tag{1}
$$
又由 $\frac{1}{2\pi} \int_{-\pi}^{\pi} D_N(t)\, dt = 1$（此为定义的直接代入：$\frac{1}{2\pi} \int_{-\pi}^{\pi} \sum_{|n| \leq N} e^{int}\, dt = \frac{1}{2\pi} \cdot 2\pi = 1$，因 $n \neq 0$ 时 $\int_{-\pi}^{\pi} e^{int}\, dt = 0$），有
$$
h(\theta_0) = \frac{1}{2\pi} \int_{-\pi}^{\pi} h(\theta_0)\, D_N(t)\, dt. \tag{2}
$$
由 (1) 减 (2)，
$$
S_N(h)(\theta_0) - h(\theta_0) = \frac{1}{2\pi} \int_{-\pi}^{\pi} [h(\theta_0 - t) - h(\theta_0)]\, D_N(t)\, dt. \tag{3}
$$

**第三阶段：引入辅助函数 $F$**。

定义
$$
F(t) = \begin{cases} \dfrac{h(\theta_0 - t) - h(\theta_0)}{t}, & t \neq 0, \\[6pt] -h'(\theta_0), & t = 0. \end{cases}
$$
因 $h$ 在 $\theta_0$ 处可微，$F$ 在 $t = 0$ 处连续，且 $h(\theta_0 - t) - h(\theta_0) = t \cdot F(t)$。代入 (3) 得
$$
S_N(h)(\theta_0) - h(\theta_0) = \frac{1}{2\pi} \int_{-\pi}^{\pi} F(t) \cdot t \cdot D_N(t)\, dt. \tag{4}
$$

**第四阶段：分解 $t \cdot D_N(t)$**。

由 Dirichlet 核的显式表达式，
$$
t \cdot D_N(t) = \frac{t}{\sin(t/2)} \cdot \sin((N + 1/2)t). \tag{5}
$$
代入 (4)，
$$
S_N(h)(\theta_0) - h(\theta_0) = \frac{1}{2\pi} \int_{-\pi}^{\pi} F(t) \cdot \frac{t}{\sin(t/2)} \cdot \sin((N + 1/2)t)\, dt. \tag{6}
$$

**Claim 1**（$\frac{t}{\sin(t/2)}$ 的有界延拓）. 函数 $g(t) = \frac{t}{\sin(t/2)}$（$t \neq 0$）可延拓为 $[-\pi, \pi]$ 上的连续函数，延拓值为 $g(0) = 2$。特别地，存在常数 $B > 0$ 使得 $|g(t)| \leq B$ 对所有 $t \in [-\pi, \pi]$ 成立。

*证明.* 对 $t \neq 0$，$g(t) = \frac{t}{\sin(t/2)}$。当 $t \to 0$ 时，由 Taylor 展开 $\sin(t/2) = t/2 + O(t^3)$，得
$$
\lim_{t \to 0} g(t) = \lim_{t \to 0} \frac{t}{t/2 + O(t^3)} = 2.
$$
定义 $g(0) = 2$，则 $g$ 在 $[-\pi, \pi]$ 上连续。由连续函数在紧集上有界，存在 $B > 0$ 使 $|g(t)| \leq B$。$\blacksquare$

**第五阶段：验证 Riemann-Lebesgue 引理的条件**。

记 $\Phi(t) = F(t) \cdot g(t)$，其中 $g(t) = \frac{t}{\sin(t/2)}$（含 $g(0) = 2$ 的延拓）。则 (6) 化为
$$
S_N(h)(\theta_0) - h(\theta_0) = \frac{1}{2\pi} \int_{-\pi}^{\pi} \Phi(t) \cdot \sin((N + 1/2)t)\, dt. \tag{7}
$$

**Claim 2**（$\Phi \in L^1([-\pi, \pi])$）. 函数 $\Phi(t) = F(t) \cdot g(t)$ 在 $[-\pi, \pi]$ 上绝对可积。

*证明.* $h \in$ [[lp-space|$L^1(\mathbb{T})$]]（假设），且 $h$ 在 $\theta_0$ 处可微。函数 $F(t)$ 在 $t \neq 0$ 处连续（因 $h$ 为 Riemann 可积从而连续 a.e.，且在 $\theta_0$ 附近 $h$ 连续），在 $t = 0$ 处连续（由可微性保证），故 $F \in L^1([-\pi, \pi])$。由 Claim 1，$g$ 在 $[-\pi, \pi]$ 上有界连续。$L^1$ 函数与有界函数的乘积仍属于 $L^1$，故 $\Phi = F \cdot g \in L^1([-\pi, \pi])$。$\blacksquare$

**第六阶段：应用 Riemann-Lebesgue 引理**。

由 Claim 2，$\Phi \in L^1([-\pi, \pi])$。注意 $\sin((N + 1/2)t) = \operatorname{Im}(e^{i(N+1/2)t})$。由 Riemann-Lebesgue 引理（[[steinFourierAnalysisIntroduction2003a|Stein, Ch. 3, Theorem 1.4]]），对任意 $\Phi \in L^1([-\pi, \pi])$，
$$
\int_{-\pi}^{\pi} \Phi(t)\, e^{i(N+1/2)t}\, dt \to 0 \quad (N \to \infty).
$$
取虚部得
$$
\int_{-\pi}^{\pi} \Phi(t)\, \sin((N+1/2)t)\, dt \to 0 \quad (N \to \infty).
$$
代入 (7)，得 $S_N(h)(\theta_0) - h(\theta_0) \to 0$，即 $S_N(h)(\theta_0) \to h(\theta_0) = 0$。

**第七阶段：结论**。

由第一阶段 $S_N(f)(\theta_0) - S_N(g)(\theta_0) = S_N(h)(\theta_0)$，结合 $S_N(h)(\theta_0) \to 0$，得
$$
S_N(f)(\theta_0) - S_N(g)(\theta_0) \to 0 \quad (N \to \infty). \qquad \blacksquare
$$

> **依赖关系小结**: 本证明依赖链为「Dirichlet 核的显式公式与卷积表示（第二阶段，直接代入定义；$\frac{1}{2\pi}\int D_N = 1$）⇒ [[fourier-coefficient|Fourier 系数]] 的线性性归约（第一阶段，$h = f - g$）⇒ $tD_N(t) = \frac{t}{\sin(t/2)}\sin((N+\frac12)t)$ 的分解（第四阶段，Claim 1 用 Taylor 展开证 $\frac{t}{\sin(t/2)}$ 有界延拓）⇒ $\Phi = F\cdot g \in L^1$（第五阶段，Claim 2）⇒ [[riemann-lebesgue-lemma|Riemann-Lebesgue 引理]]（第六阶段，Stein Ch. 3 Theorem 1.4，控制 $\sin((N+\frac12)t)$ 的振荡）⇒ 局部化结论」。除 Riemann-Lebesgue 引理外各阶段均为定义代入与初等估计（Stein 书中 Theorem 2.1 的论证在本页完整重述，未引用其他定理页）。依赖图无环。

## 深层含义

- **全局 vs 局部**：[[fourier-coefficient|Fourier 系数]] $\hat{f}(n)$ 是**全局**积分（依赖 $f$ 在整个圆上的值），但 Fourier 级数的点态收敛是**局部**现象——$\theta_0$ 处 $S_N(f)(\theta_0)$ 是否收敛到 $f(\theta_0)$，**完全取决于** $f$ 在 $\theta_0$ 附近的行为。
- **物理诠释**：对应波的**有限传播速度**——远处的扰动不会瞬间影响 $\theta_0$ 处的振动。
- 与 Ch. 6 中波动方程的 **Huygens 原理**形成呼应。

依据 [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验 F1）]]。

## 等价叙述

### 叙述 1（Riemann 局部化原理，Stein Ch.3）

> 在圆群 $\mathbb{T} = [-\pi, \pi]$ 上，若 $f = g$ 在 $\theta_0$ 的某邻域内，则 $S_N(f)(\theta_0) - S_N(g)(\theta_0) \to 0$（Ch.3, Theorem 2.2）。

### 叙述 2（双侧极限形式）

> 同叙述 1，但强调「$f$ 与 $g$ 在某邻域外可以任意不同」——即收敛行为完全由 $\theta_0$ 附近的函数决定。

### 叙述 3（分布意义形式）

> 在分布意义下，$S_N(f)(\theta_0) \to f(\theta_0)$ 当且仅当 $\theta_0$ 是 $f$ 的 Lebesgue 点。

**等价关系**：叙述 1 ⊂ 叙述 2 ⊂ 叙述 3（叙述 3 在 Lebesgue 框架内等价；Stein Ch.3 不涉及叙述 3）。

## 证明难度差异

### 叙述 1（Stein 原始）的证明

- **方法**：设 $h = f - g$，$h$ 在 $\theta_0$ 邻域内为零；应用 Ch.3 Theorem 2.1（$f$ 在 $\theta_0$ 可微则 $S_N(f)(\theta_0) \to f(\theta_0)$）+ Riemann-Lebesgue 引理处理 $tD_N(t)$。
- **难度**：**中**——需熟练 Dirichlet 核性质与 Riemann-Lebesgue 引理。
- **代价**：要求 $f$ 在 $\theta_0$ 处可微（局部可微性）。

### 叙述 3（分布意义形式）的证明

- **方法**：Lebesgue 点的判定 + Carleson 定理（$L^2$ Fourier 级数几乎处处收敛）。
- **难度**：**高**——需完整 Lebesgue 积分理论 + Carleson 1966 的复杂论证。
- **结论**：几乎处处收敛于 $f$。

**总评**：叙述 1 证明路径清晰但条件（可微）较强；叙述 3 条件（Lebesgue 点）较弱但依赖更强结论（Carleson 定理）。这是「强条件 + 弱结论」与「弱条件 + 强结论」的张力——后者难度远高于前者。

## 与 Dirichlet 核的关系

局部化原理依赖一个关键事实：$tD_N(t) = \frac{t}{\sin(t/2)}\cdot\sin((N+1/2)t)$。

- 当 $t$ 远离零时，$\frac{t}{\sin(t/2)}$ 有界，而 $\sin((N+1/2)t)$ 的振荡使积分趋于零（Riemann-Lebesgue）。
- 这解释了为何 Dirichlet 核**不是**[[good-kernel|好核]]：$D_N$ 本身的 [[lp-space|$L^1$]] 范数增长为 $O(\log N)$；而 $f(\theta_0 - t) - f(\theta_0)$ 在 $\theta_0$ 附近提供的 $t$ 因子抵消了 $D_N$ 的奇异性。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 3, Theorem 2.2]]