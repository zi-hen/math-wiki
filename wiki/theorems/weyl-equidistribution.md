---
type: theorem
title: Weyl 等分布定理
aliases: [Weyl equidistribution theorem, equidistribution theorem, Kronecker's theorem]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [number-theory, fourier-analysis, equidistribution]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$\gamma$ 为无理数（弱——一个假设）；结论：$\{n\gamma\}_{n \geq 1}$ 在 $[0, 1)$ 中均匀分布（强——意味着任意子区间均得等比例极限）。这是 Weyl 1916 给出的 Fourier 证明（指标函数 Fourier 展开），是将 Fourier 分析引入数论的标志性结论。等价叙述：Kronecker 定理、Lemma 2.2、Corollary 2.3。
---

# Weyl 等分布定理

> **工作空间**：实直线 $\mathbb{R}$（实数 $\gamma$ 上的小数部分轨道）。Stein 在 Ch. 4, Theorem 2.1 给出陈述；Kronecker 定理与 Weyl 判据见 Ch. 4, §1、§3。

## What — 陈述

> 设 $\gamma \in \mathbb{R}$ 为**无理数**。设 $\langle n\gamma \rangle$ 为 $n\gamma$ 的小数部分（$\langle x \rangle = x - \lfloor x \rfloor \in [0, 1)$）。则序列 $\{\langle \gamma \rangle, \langle 2\gamma \rangle, \langle 3\gamma \rangle, \ldots\}$ 是 $[0, 1)$ 上的**均匀分布**（equidistributed）：
> $$
> \forall\, (a, b) \subset [0, 1): \quad \lim_{N \to \infty} \frac{\#\{1 \leq n \leq N : \langle n\gamma \rangle \in (a, b)\}}{N} = b - a.
> $$

推论（**Kronecker 定理**）：若 $\gamma$ 无理，则 $\{\langle n\gamma\rangle\}$ 在 $[0, 1)$ 中**稠密**（dense）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 4, Theorem 2.1]]。

## Why — 动机与证明

### 动机

Weyl 等分布定理是 20 世纪解析数论的开端——它将数论问题（轨道结构）转化为 Fourier 分析问题（指数和估计）。该定理的 Fourier 证明（**Weyl 判据**）已成为现代数论的标准工具。

Kronecker 定理（1884）早已给出稠密性结论；Weyl（1916）将其加强为均匀分布，并给出 Fourier 分析证明。

### 证明思路

Weyl 判据是核心工具：

> 序列 $\{\xi_n\}$ 在 $[0, 1)$ 中均匀分布 **当且仅当** 对所有非零整数 $k$，
> $$
> \frac{1}{N} \sum_{n=1}^N e^{2\pi i k \xi_n} \to 0, \quad N \to \infty.
> $$

对 $\xi_n = \langle n\gamma\rangle$：
$$
\sum_{n=1}^N e^{2\pi i k \langle n\gamma \rangle} = \sum_{n=1}^N e^{2\pi i k n \gamma} = \frac{e^{2\pi i k \gamma}(1 - e^{2\pi i k N \gamma})}{1 - e^{2\pi i k \gamma}}.
$$

由 $\gamma$ 无理，$k\gamma \notin \mathbb{Z}$，故分母 $\neq 0$。分子有界，故
$$
\left|\sum_{n=1}^N e^{2\pi i k n \gamma}\right| \leq \frac{2}{|1 - e^{2\pi i k \gamma}|} = O(1).
$$

故 $|\frac{1}{N} \sum_{n=1}^N e^{2\pi i k n \gamma}| = O(1/N) \to 0$。满足 Weyl 判据。

### 详细证明

**第一阶段：Weyl 判据证明准备**。

**Claim 1**（Weyl 判据）. 序列 $\{\xi_n\}_{n \geq 1}$ 在 $[0, 1)$ 中均匀分布当且仅当对所有 $k \in \mathbb{Z} \setminus \{0\}$，
$$
\lim_{N \to \infty} \frac{1}{N} \sum_{n=1}^N e^{2\pi i k \xi_n} = 0. \tag{$*$}
 $$

*证明.* ($\Leftarrow$) 按 Weyl 标准论证分四步递推（注意：一般 Riemann 可积函数的 Fourier 级数并不点态收敛到自身，故不能直接写 $f = \sum c_k e^{2\pi i k \xi}$ 逐项求和）。

- **三角多项式**：若 $P = \sum_{|k|\le K} c_k e^{2\pi i k \xi}$，判据 $(*)$（$k \neq 0$）与 $k = 0$ 项（等于 $c_0$）给出
$$
\frac{1}{N}\sum_{n=1}^N P(\xi_n) \to \sum_k c_k\,\delta_{k,0} = c_0 = \int_0^1 P(\xi)\,d\xi.
$$
- **连续函数**：由 [[weierstrass-approximation-trig|Weierstrass 三角逼近定理]]，对 $\varepsilon > 0$ 取三角多项式 $P$ 使 $\|f - P\|_\infty < \varepsilon$。则
$$
\limsup_{N\to\infty}\left|\frac{1}{N}\sum_{n=1}^N f(\xi_n) - \int_0^1 f\right| \le \limsup_N \frac{1}{N}\sum_{n=1}^N |f-P|(\xi_n) + \limsup_N\left|\frac{1}{N}\sum_{n=1}^N P(\xi_n) - \int_0^1 P\right| + \left|\int_0^1 (P - f)\right| < 3\varepsilon,
$$
由 $\varepsilon$ 任意，$\frac{1}{N}\sum f(\xi_n) \to \int f$。
- **阶梯函数**：有限个区间指示函数的线性组合；区间指示函数 $\chi_{(a,b)}$ 由连续函数上下夹逼（例如以斜边长为 $\delta$ 的线性过渡连续化边界点），故其积分平均亦收敛，再由线性叠加得阶梯函数情形。
- **Riemann 可积函数**：$f$ 有界且 Riemann 可积，故存在阶梯函数 $f_- \le f \le f_+$ 使 $\int_0^1 (f_+ - f_-) < \varepsilon$（Riemann 可积性的上下和刻画）。由单调性
$$
\int_0^1 f_- = \lim_N \frac{1}{N}\sum_{n=1}^N f_-(\xi_n) \le \liminf_N \frac{1}{N}\sum_{n=1}^N f(\xi_n) \le \limsup_N \frac{1}{N}\sum_{n=1}^N f(\xi_n) \le \lim_N \frac{1}{N}\sum_{n=1}^N f_+(\xi_n) = \int_0^1 f_+,
$$
故 $\int f - \varepsilon \le \liminf_N \cdots \le \limsup_N \cdots \le \int f + \varepsilon$；由 $\varepsilon$ 任意，$\frac{1}{N}\sum f(\xi_n) \to \int f$。

特别地取 $f = \chi_{(a, b)}$（区间指示函数，Riemann 可积），由第四步得
$$
\frac{1}{N} \#\{\xi_n \in (a, b)\} \to b - a.
$$

($\Rightarrow$) 反方向：对 $e^{2\pi i k \xi}$（$k \neq 0$）应用正向证明得
$$
\frac{1}{N} \sum e^{2\pi i k \xi_n} \to \int_0^1 e^{2\pi i k \xi} d\xi = 0.
$$

$\blacksquare$

**第二阶段：应用 Weyl 判据到 $\xi_n = \langle n\gamma\rangle$**。

**Claim 2**（指数和估计）. 设 $\gamma$ 无理，$k \neq 0$。则
$$
\left|\frac{1}{N} \sum_{n=1}^N e^{2\pi i k \langle n\gamma \rangle}\right| \leq \frac{1}{N} \cdot \frac{2}{|1 - e^{2\pi i k \gamma}|} \to 0.
$$

*证明.* 由 $e^{2\pi i k \langle n\gamma \rangle} = e^{2\pi i k n \gamma}$（小数部分 $\langle n\gamma \rangle = n\gamma - \lfloor n\gamma \rfloor$，$e^{2\pi i k \lfloor n\gamma \rfloor} = 1$）。

几何级数求和（$\gamma$ 无理保证 $k\gamma \notin \mathbb{Z}$ 故公比 $\neq 1$）：
$$
\sum_{n=1}^N e^{2\pi i k n \gamma} = e^{2\pi i k \gamma} \cdot \frac{1 - e^{2\pi i k N \gamma}}{1 - e^{2\pi i k \gamma}},
$$
取模：
$$
\left|\sum_{n=1}^N e^{2\pi i k n \gamma}\right| \leq \frac{2}{|1 - e^{2\pi i k \gamma}|}.
$$
此上界与 $N$ 无关，故除以 $N$ 后趋于零。$\blacksquare$

**主证明**：由 Claim 1 与 Claim 2，序列 $\{\langle n\gamma \rangle\}_{n \geq 1}$ 均匀分布。$\blacksquare$

**Kronecker 推论**：均匀分布 ⇒ 稠密（因为任何开区间 $(a, b)$ 在 $[0, 1)$ 中**非空**，极限概率为 $b - a > 0$ ⇒ 至少一个 $n$ 落入 $(a, b)$）。

> **依赖关系小结**: 本证明依赖链为「[[fourier-series|Fourier 级数]]（Claim 1：Riemann 可积函数 $f = \sum_k c_k e^{2\pi i k\xi}$，取 $f = \chi_{(a,b)}$ 得计数比例；反向对 $e^{2\pi i k\xi}$ 应用得判据的 (⇒)）⇒ [[geometric-series-bounding|几何级数估计]]（Claim 2：$\left|\sum_{n=1}^N e^{2\pi i k n\gamma}\right| \le 2/|1 - e^{2\pi i k\gamma}|$，与 $N$ 无关）⇒ Weyl 判据 ⇒ 等分布」。$\gamma$ 无理保证 $k\gamma \notin \mathbb{Z}$（公比 $\neq 1$）；Kronecker 推论（稠密）由等分布直接得出，属区段内推演。除 Fourier 级数与几何级数求和外无定理级依赖。依赖图无环。

## What-if — 反例、等价叙述与推广

### 等价叙述

#### 叙述 1（Weyl 等分布，Stein Ch.4 Thm 2.1）
> $\gamma \notin \mathbb{Q}$ ⇒ $\{\langle n\gamma\rangle\}$ 均匀分布。

#### 叙述 2（Kronecker 定理）
> $\gamma \notin \mathbb{Q}$ ⇒ $\{\langle n\gamma\rangle\}$ 在 $[0, 1)$ 中稠密。

#### 叙述 3（Lemma 2.2 / Corollary 2.3，$f$-平均）
> 若 $f$ 在 $[0, 1]$ 上 Riemann 可积且周期 $1$，则
> $$
> \frac{1}{N} \sum_{n=1}^N f(n\gamma) \to \int_0^1 f(x) dx.
> $$

#### 叙述 4（Weyl 判据，Exercise 7 反向）
> $\{\xi_n\}$ 均匀分布 $\Leftrightarrow$ $\forall k \neq 0, \frac{1}{N}\sum e^{2\pi i k \xi_n} \to 0$。

**等价关系**：叙述 1 ≡ 叙述 4（直接由 Weyl 判据）；叙述 3 是叙述 1 的函数推广；叙述 2 是叙述 1 的推论。Stein Ch.4 §1/§2/§3 给出这些等价形式。

### 反例（条件不可削弱）

1. **$\gamma$ 有理时均匀分布失效**：$\gamma = p/q$（最简分数）。序列 $\{\langle n p/q \rangle\}$ 仅取 $q$ 个值 $\{0, 1/q, \ldots, (q-1)/q\}$，各值被访问的比例为 $1/q + O(1/N)$（Ch. 4, Ex. 6），**不**均匀分布——但收敛到均匀分布的意义仍在（周期轨道的时间平均）。
2. **多项式增长 $n^2 \gamma$ 的等分布**：$\{\langle n^2 \gamma \rangle\}$ 当 $\gamma \notin \mathbb{Q}$ 时**仍**均匀分布（Weyl 判据对二次型有效，参 [[steinFourierAnalysisIntroduction2003a|Stein, Ch. 4, p.129]]）。
3. **无理测度的影响**：Liman 平均（$\lim \frac{1}{N} \sum_{n \leq N}$）若改为 Cesàro 平均或其他求和法，仍可证等分布。

### 推广 / 变体

- **Weyl 判据**对**任意**指数多项式 $P(n) = \alpha_d n^d + \cdots + \alpha_0$（$\alpha_d$ 无理）有效（Vaughan-Wooley 体系）。
- **测度论推广**：$T^n$（圆上无理旋转）的遍历性，由 Von Neumann 1932 给出——与本定理等价。
- **Erdős-Turán 不等式**：偏离均匀分布的误差可用 [[fourier-coefficient|Fourier 系数]]表达。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（Weyl 原始）| 几何级数 + Weyl 判据 | **低** | 仅指数和 |
| 叙述 3（$f$-平均）| Riemann 积分分解 + Claim 2 | **中** | 需 Fourier 级数收敛 |
| 叙述 4（Weyl 判据的逆向）| Lebesgue 积分 | **高** | 实分析卷 |

## 应用

- **数论**：Diophantine 逼近、不定方程、Goldbach 问题。
- **遍历理论**：圆的无理旋转是测度论遍历定理的标准反例（Von Neumann）。
- **概率**：随机序列的"伪随机性"。
- **采样算法**：低差异序列（van der Corput, Halton）的理论基石。

## 关联

- 定理：[[dirichlet-theorem-on-primes]]（数论 Fourier 应用的高阶延伸）、[[riemann-lebesgue-lemma]]
- 概念：[[fourier-series]]（指数和工具）、[[fourier-transform]]、[[character|特征标]]
- 方法：[[geometric-series-bounding]]（$\sum e^{2\pi i k n \gamma}$ 的部分和有界性是关键）、[[integral-truncation|积分分拆]]（有理轨道与无理估计的分拆）
- 习题：**Ch.4 Ex.7**（Weyl 判据的逆向：等分布 ⟹ 指数和 $N^{-1}\sum e^{2\pi i k \xi_n}\to 0$，用阶梯函数逼近 + [[riemann-lebesgue-lemma]]）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 4, Theorem 2.1；Kronecker 推论 p.124；Weyl 判据 Exercise 7）

### 此证明新引入 / 补充的 method

- **几何级数估计**（[[geometric-series-bounding]]）：证明 Claim 2 中 $\left|\sum_{n=1}^N e^{2\pi i k n \gamma}\right| \le 2/|1 - e^{2\pi i k \gamma}|$ 的核心 — 与 $N$ 无关，从而 $\frac{1}{N}\sum \to 0$。

## Stein 写法备注

Weyl 1916 的等分布定理（Fourier 证明）是 Weyl 判据的精彩示例——**将圆周运动 $\rho^n$ 的轨道结构问题完全化归为指数和估计**。核心 insight：把 Kronecker 1884 的稠密性提升为"均匀分布"，并指出 Fourier 系数消失是序列"均匀"性的充要条件。Stein 在 Ch. 4 §3 末尾"heuristic assertion"反复强调：「for every interval $(a, b) \subset [0, 1)$, $\lim_{N \to \infty} \frac{1}{N}\#\{1 \le n \le N : \xi_n \in (a, b)\} = b - a$」——这等价于所有 Fourier 系数 $\hat{\chi_{(a,b)}}(k) = 0$（$k \neq 0$）。
