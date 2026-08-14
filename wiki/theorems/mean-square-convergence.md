---
type: theorem
title: 均方收敛定理
aliases: [mean-square convergence, 平方收敛, 均方收敛, Ch.3 Theorem 1.1]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, L2-theory]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 为圆上（Riemann）可积函数（弱——仅需可积，不要求光滑）；结论：Fourier 部分和 $S_N(f)$ 在均方范数下收敛到 $f$（强——这是 $\{e^{in\theta}\}$ 构成完全正交系的精确表述，是 Parseval 恒等式、Riesz–Fischer 定理与整个 $L^2$ 理论的基石）。
---

# 均方收敛定理

> **工作空间**：圆群 $\mathbb{T}$（本节主述）；同一定理在实数线 $\mathbb{R}$（Fourier 变换的 $L^2$ 收敛，见 [[plancherel-theorem]]）与有限阿贝尔群（[[finite-abelian-group]]，Fourier 级数为有限和，收敛平凡）均有对应。

## What — 陈述

**均方收敛（定义）**。设 $f$ 为圆上的可积函数，Fourier 部分和
$$
S_N(f)(\theta) = \sum_{|n| \le N} \hat f(n)\,e^{in\theta}.
$$
称 $f$ 的 Fourier 级数在**均方意义**（平方平均意义）下收敛到 $f$，若
$$
\frac{1}{2\pi}\int_0^{2\pi}\bigl|f(\theta) - S_N(f)(\theta)\bigr|^2\,d\theta \longrightarrow 0 \qquad (N \to \infty),
$$
即 $S_N(f) \to f$ 依 [[lp-space|$L^2$]] 范数 $\|g\| = \left(\frac{1}{2\pi}\int_0^{2\pi}|g(\theta)|^2\,d\theta\right)^{1/2}$ 收敛。由于 $\{e^{in\theta}\}$ 关于此范数标准正交，均方收敛就是内积空间意义下的范数收敛。

> **定理（Stein, Ch. 3, Theorem 1.1）**。若 $f$ 为圆上的可积函数，则 $f$ 的 Fourier 级数在均方意义下收敛到 $f$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Theorem 1.1, p.87]]。

## Why — 动机与证明

### 动机

逐点收敛对 Fourier 级数是「局部」现象（Stein Ch. 3 §2，可微点处收敛），且对连续函数都可能在一点失败（Ch. 3 §3 构造的连续函数发散例子）。均方收敛是「整体」（global）的收敛概念，只要求误差的能量 $\int |f - S_N|^2$ 趋于零——这是正交展开在 [[lp-space|$L^2$]] 中自然的收敛意义，也是「$\{e^{in\theta}\}$ 构成正交基」这一事实的精确表述。

### 证明思路

证明分三步（详见 [[parseval-identity]] 的详细证明，二者同源）：

1. **最优逼近**：由 [[orthogonal-best-approximation|最优逼近引理]]（Ch. 3 Lemma 1.2），$S_N(f)$ 是 $f$ 在 $\{e_n\}_{|n|\le N}$ 张成子空间中的最佳逼近，故 $S_N(f)$ 的逼近误差不超过任何三角多项式的逼近误差；
2. **三角多项式稠密**：连续函数被三角多项式一致逼近（[[fejer-theorem]] / [[weierstrass-approximation-trig]]），可积（有界）函数被一致有界连续函数依 $L^1$ 平均逼近（[[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]]），再由有界性把 $L^1$ 逼近提升为 $L^2$ 逼近；
3. **结合**：$f$ 可被三角多项式依 $\|\cdot\|$ 任意逼近 ⟹ $S_N(f) \to f$。

### 详细证明

设 $f$ 圆上可积。**断言（三角多项式稠密）**：对任意 $\varepsilon > 0$ 存在三角多项式 $P$ 使 $\|f - P\| < \varepsilon$。

- **化归为连续函数**。由 [[integrable-l1-approximation-by-continuous|Ch. 2 Lemma 3.2]]，存在连续函数 $g_k$ 使 $\sup|g_k| \le B$ 且 $\int_0^{2\pi}|f - g_k| \to 0$。因 $f$ 可积故有界（设 $|f| \le B$），
$$
\|f - g_k\|^2 \le \frac{1}{2\pi}\int|f - g_k|\cdot(|f| + |g_k|) \le \frac{2B}{2\pi}\int_0^{2\pi}|f - g_k| \to 0.
$$
取 $k$ 使 $\|f - g_k\| < \varepsilon$。
- **连续函数的一致逼近**。对连续函数 $g_k$，由 Fejér 定理（[[fejer-theorem]]，Cesàro 平均一致收敛）与 Weierstrass 三角逼近定理（[[weierstrass-approximation-trig]]），存在三角多项式 $P$ 使 $\|g_k - P\|_\infty < \varepsilon$，从而
$$
\|g_k - P\| \le \|g_k - P\|_\infty < \varepsilon.
$$
- 由三角不等式，$\|f - P\| \le \|f - g_k\| + \|g_k - P\| < 2\varepsilon$。断言得证。

**收敛结论**。由最优逼近引理（Ch. 3 Lemma 1.2），$S_N(f)$ 是 $f$ 在有限维子空间中的最佳逼近，故
$$
\|f - S_N(f)\| \le \|f - P\| < 2\varepsilon
$$
对一切充分大的 $N$ 成立。$\varepsilon$ 任意，故 $\|f - S_N(f)\| \to 0$，即均方收敛。$\blacksquare$

## What-if — 反例、等价叙述与推广

### 均方收敛与逐点收敛的独立性（例子）

两种收敛概念**互不蕴含**。以下三个例子说明（前两个属 $\mathbb{T}$ 上的 Fourier 级数语境，第三个是一般 $L^2$ 序列的反例）。

**例 1（均方收敛成立、逐点收敛失败——Fourier 级数语境）**。Stein, Ch. 3, §3 构造的连续函数 $\theta \mapsto F(\theta)$，其 Fourier 级数在某一点发散。由均方收敛定理，$S_N(F) \to F$ 依 $\|\cdot\|$；但在该点 $\lim_N S_N(F)(\theta_0)$ 不存在。这说明**均方收敛不蕴含逐点收敛**，且对连续函数亦如此。

**例 2（逐点收敛成立、均方收敛失败——一般 $L^2$ 序列）**。在 $[0,1]$ 上取
$$
f_n(x) = \sqrt{n}\,\chi_{[0,1/n]}(x), \qquad n = 1, 2, \ldots
$$
逐点地，对每个 $x > 0$，$n$ 充分大时 $x > 1/n$，故 $f_n(x) = 0$，即 $f_n \to 0$ 逐点；但
$$
\|f_n\|_2^2 = \int_0^{1/n} n\,dx = 1,
$$
$f_n$ 不依 $L^2$ 范数收敛到 $0$。这说明**逐点收敛不蕴含均方收敛**。

**例 3（均方收敛成立、逐点处处不收敛——一般 $L^2$ 序列）**。设 $\{f_n\}$ 为 $[0,1]$ 上遍历二进区间（dyadic blocks）的指示函数序列：$f_1 = \chi_{[0,1/2]}$，$f_2 = \chi_{[1/2,1]}$，$f_3 = \chi_{[0,1/4]}$，$f_4 = \chi_{[1/4,1/2]}$，$\ldots$。则 $\|f_n\|_2^2 = 2^{-m} \to 0$（第 $2^m$ 到 $2^{m+1}-1$ 项宽度为 $2^{-m}$），即 $f_n \to 0$ 依 $L^2$；但对任意 $x \in [0,1]$，$f_n(x)$ 在 $0$ 与 $1$ 之间无限次振荡，逐点极限不存在。这从另一侧面说明均方收敛与逐点收敛无关。

**总结**：均方收敛是内积空间范数下的收敛，逐点收敛是点态极限——两者独立。对 Fourier 部分和，均方收敛由本定理保证，而逐点收敛需要额外条件（可微点处收敛，Ch. 3 Theorem 2.1；或更精细的 Carleson–Hunt 定理，超出本书范围）。

### 等价叙述

1. **积分形式**：$\|f - S_N(f)\| \to 0$（范数收敛）。
2. **系数形式**：$\sum_{n\in\mathbb{Z}}|\hat f(n)|^2 = \|f\|^2$（Parseval 恒等式，见 [[parseval-identity]]）。
3. **抽象形式**：$\{e^{in\theta}\}_{n\in\mathbb{Z}}$ 构成 $L^2(\mathbb{T})$ 的**完全标准正交系**（正交基）——均方收敛即「完全性」（completeness）的精确含义。

**等价关系**：叙述 1 ⟺ 叙述 2，由正交分解（Pythagoras）
$$
\|f - S_N(f)\|^2 = \|f\|^2 - \sum_{|n|\le N}|\hat f(n)|^2
$$
立得：左端趋于零当且仅当右端趋于零。这正是 Stein 把均方收敛与 Parseval 合并为 Ch. 3 Theorem 1.3 (i)(ii) 的原因。

### 反例（条件不可削弱）

1. **$f$ 不可积（无界）时定理无意义**：$f(\theta) = \theta^{-1/2}$（$0 < \theta \le 2\pi$）在 $L^1$ 中但不在 $L^2$ 中（$\int_0^{2\pi}\theta^{-1}\,d\theta = \infty$），均方范数无穷，不满足定理假设——「圆上可积」蕴含平方可积（Riemann 可积必有界），假设不可削弱为 $L^1$。
2. **逐点收敛失败不能由均方收敛补救**：见「例 1」——均方收敛定理自身不保证任何点处的逐点收敛（Stein, Ch. 3, p. 98 明言）。

### 推广

- **Plancherel 定理**（[[plancherel-theorem]]）：$\mathbb{R}$ 上的对应，$\|f\|_2 = \|\hat f\|_2$。
- **有限阿贝尔群**（[[finite-abelian-group]]）：Fourier 级数为有限和，均方收敛平凡成立，正交性即 Parseval（Ch. 7 Theorem 2.8）。
- **Fejér 定理**（[[fejer-theorem]]）：Cesàro 平均给出更强的逐点 / 一致收敛结论——不同工具（好核）达成更强的收敛。
- **第二族完备正交系**：[[legendre-polynomials|Legendre 多项式]]（$[-1,1]$）与 [[hermite-functions|Hermite 函数]]（$\mathbb{R}$）是同一正交基框架在其它空间上的实例。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（积分）| 最优逼近 + Fejér + [[integrable-l1-approximation-by-continuous]]（Ch. 2 Lemma 3.2） | **中** | 需构造性逼近的三段化归 |
| 叙述 2（系数）| 正交分解 + 极限 | **中** | 等价于叙述 1 |
| 抽象（$L^2$ 完备化）| 测度论完备化 + 正交基理论 | **高** | 需 Lebesgue 积分 |

## 应用

- **Parseval 恒等式**（[[parseval-identity]]）：其证明的核心正是均方收敛（取 $N \to \infty$ 极限）。
- **Riemann-Lebesgue 引理**（[[riemann-lebesgue-lemma]]）：由 Parseval / Bessel 推出 Fourier 系数趋于零。
- **最佳逼近**（[[orthogonal-best-approximation]]）：$S_N(f)$ 在均方范数下最优。
- **Riesz–Fischer 定理**：$L^2$ 与 $\ell^2$ 的等距同构，依赖均方收敛与 $\ell^2$ 的完备性。

## 关联

- 定理：[[parseval-identity]]、[[plancherel-theorem]]（$\mathbb{R}$ 上的对应）、[[riemann-lebesgue-lemma]]、[[fejer-theorem]]、[[weierstrass-approximation-trig]]
- 概念：[[lp-space|$L^2$ 空间]]、[[ellp-space|$\ell^2$ 序列空间]]、[[fourier-coefficient|Fourier 系数]]、[[fourier-series]]、[[finite-abelian-group]]、[[good-kernel]]（Fejér 平均的构造工具）
- 方法：[[orthogonal-best-approximation]]、[[cesaro-summation]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Theorem 1.1 / Theorem 1.3）
