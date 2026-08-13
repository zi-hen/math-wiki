---
type: theorem
title: Runge 逼近定理
aliases: [Runge's theorem, Runge approximation]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, approximation]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 在 $K$ 的某邻域全纯（弱——$f$ 仅需在 $K$ 附近给定）；结论：$f$ 在 $K$ 上可被极点位于 $K^c$ 的有理函数一致逼近（强——逼近函数的奇点可控）。若 $K^c$ 连通，则可被多项式一致逼近。
---
# Runge 逼近定理

> **工作空间**：复平面 $\mathbb{C}$ 的紧子集 $K$，$K^c$ 为其补集。

## What — 陈述

### Theorem 5.7（Stein, p.80）

> 设 $K \subset \mathbb{C}$ 为紧集，$f$ 在 $K$ 的某邻域上全纯。则：
> 1. $f$ 在 $K$ 上可被极点位于 $K^c$ 中的有理函数一致逼近。
> 2. 若 $K^c$ 连通，则 $f$ 在 $K$ 上可被多项式一致逼近。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, Theorem 5.7, p.80]]。

### 推论

- 当 $K \subset \mathbb{C}$ 紧且 $K^c$ 连通（如 $K \subset D$ 圆盘）时，$K$ 上的全纯函数可被多项式逼近——这是 Weierstrass 定理（实连续函数被多项式逼近）的全纯类比。
- 当 $K$ 不连通（如 $K$ 是两个不相交闭圆盘的并）时，全纯函数只能被有理函数（带极点）逼近，不能保证多项式逼近。

## Why — 动机与证明

### 动机

Runge 定理是多项式逼近理论的全纯推广：

1. **实分析对比**：Weierstrass 定理断言 $[0,1]$ 上连续函数可被多项式一致逼近。Runge 推广至复平面紧集上的全纯函数。
2. **拓扑约束**：逼近是否可用多项式取决于 $K^c$ 的连通性——这是深刻的拓扑现象。
3. **有理函数逼近**：允许极点在 $K^c$ 中提供更大灵活性。

### 证明思路

1. **关键引理（Lemma 5.8, p.80）**：存在有限条线段 $\gamma_1, \ldots, \gamma_N \subset \Omega - K$（$\Omega$ 为 $f$ 的全纯定义域），使得对所有 $z \in K$，
   $$f(z) = \sum_{n=1}^N \frac{1}{2\pi i} \int_{\gamma_n} \frac{f(\zeta)}{\zeta - z}\,d\zeta.$$
   即 $f$ 可用「围道积分」表示，每个围道在 $\Omega - K$ 中。
2. **Lemma 5.9（线段逼近）**：对每条线段 $\gamma_n$，$\int_{\gamma_n} \frac{f(\zeta)}{\zeta - z}\,d\zeta$ 可被极点在 $\gamma_n$ 上的有理函数一致逼近。
3. **Lemma 5.10（多项式逼近 $1/(z-z_0)$）**：若 $K^c$ 连通且 $z_0 \notin K$，则 $1/(z - z_0)$ 在 $K$ 上可被多项式一致逼近。

由三个引理，Runge 定理直接推出。

### 详细证明

#### 证明动机

Runge 定理证明的关键在于将 $f$ 表示为「围道积分和」+「每个积分被有理/多项式逼近」。这需要：
- 引理 5.8 用覆盖论证构造围道；
- 引理 5.9 用一致逼近处理每个围道；
- 引理 5.10 处理 $1/(z-z_0)$ 的多项式逼近。

#### 详细证明（核心部分）

**Lemma 5.8 的证明思路**：

取定 $\delta > 0$，构造网格 $\{|x + iy - (m\delta + in\delta)| < \delta/\sqrt{2}\}$。对每个 $z \in K$，存在网格中心 $z_0$ 使 $|z - z_0| < \delta/\sqrt{2}$，故 $f$ 在以 $z_0$ 为中心、半径 $\delta$ 的小圆盘内可由 Cauchy 积分表示：
$$f(z) = \frac{1}{2\pi i} \int_{|w - z_0| = \delta} \frac{f(w)}{w - z}\,dw.$$

将所有这些小圆周的边界连接起来组成「外部围道」，使用矩形 keyhole（与 [[cauchy-integral-formula]] 类似）化简。重复处理所有 $z \in K$。

**Lemma 5.9 的证明思路**：

设 $\gamma = [a, b]$ 为线段，$z \in K$。对 $\zeta \in \gamma$，$\zeta - z \neq 0$（因 $z \in K, \gamma \subset \Omega - K$）。将 $\gamma$ 等分为 $N$ 段，每段上用 $\zeta$ 的某个值（如中点）近似 $f(\zeta)/(\zeta - z)$。当 $N \to \infty$ 时，黎曼和逼近积分。

**Lemma 5.10 的证明思路**：

因 $K^c$ 连通，可构造连接 $z_0$ 与 $\infty$ 的连续路径 $\Gamma \subset K^c$（其中 $\infty$ 视为 $\hat{\mathbb{C}}$ 中的点）。参数化 $\Gamma$ 为 $\Gamma(t)$（$t \in [0, 1]$，$\Gamma(0) = z_0$，$\Gamma(1) = \infty$）。

对 $z \in K$，$|z/\Gamma(t)| < 1$ 对 $t$ 充分大；取 $T_0$ 使 $t > T_0$ 时 $|\Gamma(t)| > 2\|z\|$。

对 $t > T_0$ 部分的几何级数：
$$\frac{1}{z - \Gamma(t)} = -\frac{1}{\Gamma(t)} \cdot \frac{1}{1 - z/\Gamma(t)} = -\sum_{n=0}^\infty \frac{z^n}{\Gamma(t)^{n+1}},$$
其中 $|z/\Gamma(t)| < 1$ 保证收敛。

对 $t \leq T_0$ 部分，直接用 Weierstrass 逼近（$[0, T_0]$ 紧）处理。

由 $\Gamma$ 的适当选取，使级数一致收敛。 $\blacksquare$

## What-if — 反例与边界

### 典型例子

1. **$K = \{0\}$**：$K^c = \mathbb{C} \setminus \{0\}$ 连通。任何全纯函数 $f$ 在 $0$ 附近（即 $f \in \mathcal{O}(\mathbb{C})$）可被多项式在 $0$ 处逼近——这是 Taylor 展开。
2. **$K = \{|z| \leq 1\}$**：$K^c = \{|z| > 1\}$ 连通。$f \in \mathcal{O}(\{|z| < 1 + \varepsilon\})$ 在 $\{|z| \leq 1\}$ 上可被多项式逼近（Taylor 级数的部分和）。
3. **$K = \overline{D_1 \cup D_2}$**（两个不相交闭圆盘）：$K^c$ 不连通。$K$ 上全纯函数**未必**可被多项式逼近——需要允许极点在 $K^c$ 的有理函数。

### 反例

1. **$K^c$ 不连通时多项式逼近失效**：取 $K$ 为两个不相交闭圆盘的并，$f(z) = 1/(z - a)$ 其中 $a \in K^c$ 的有界连通分支。则 $f$ 在 $K$ 上全纯，但不能被多项式逼近（任何多项式在 $K^c$ 的无界分支上无极点，而 $1/(z-a)$ 在 $a$ 处有极点）——证明需用辐角原理。

   具体：设 $K = \{|z + 2| \leq 1\} \cup \{|z - 2| \leq 1\}$，$a = 0$（在 $K^c$ 的无界分支）。$f(z) = 1/z$ 在 $K$ 上全纯。若可被多项式 $p_n$ 一致逼近，则 $\int_{|z+2|=2} \frac{p_n(z)}{z}\,dz \to \int_{|z+2|=2} \frac{dz}{z} = 0$（$p_n$ 多项式，无 $z=0$ 处极点）；但右端 $\int_{|z+2|=2} \frac{dz}{z} = 2\pi i \neq 0$——矛盾。

2. **$f$ 仅在 $K$ 上连续但不解析**：Weierstrass 定理（实）允许，但 Runge 定理**不适用**——$f$ 须在 $K$ 的邻域全纯。

### 边界情形

- **$K = \mathbb{C}$**：Runge 定理不直接适用（$K$ 非紧）。但 Stein Corollary 4.7（每个多项式有 $n$ 个根）隐含了「多项式在 $\mathbb{C}$ 上稠密」的某种意义。
- **$K^c$ 连通但 $K$ 不连通**：仍可被多项式逼近（如 $K = \{|z| = 1\}$ 圆周——但 $K$ 应为紧集，连续圆周不算！实际应取 $K$ 为圆周的有限并）。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 基本版本（Stein Theorem 5.7） | $K^c$ 连通 $\Rightarrow$ 多项式逼近 | 一般 |
| 2. 有理函数版本 | $f$ 可被有理函数逼近 | $K$ 任意 |
| 3. Weierstrass（实） | $C[0,1] \subset \overline{\text{poly}}$ | $K = [0,1]$ |
| 4. Mergelyan 定理 | $K^c$ 连通 + $K$ 局部连通 $\Rightarrow$ 多项式逼近连续函数 | 推广 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 有理函数逼近 | Lemma 5.8/5.9 | 高 |
| 多项式逼近 | + Lemma 5.10（几何级数 + Weierstrass） | 高 |
| Mergelyan 推广 | 更精细的拓扑条件 | 极高 |

## 关联

- 概念：[[holomorphic-function]]、[[meromorphic-function]]
- 定理：[[cauchy-integral-formula]]（前置）、[[cauchy-theorem]]
- 方法：[[local-to-global|局部到整体原理]]、[[structural-randomness-decomposition|结构-随机性二分法]]、[[amplification|增强技巧]]
- 应用：连分式理论、数值分析中的有理逼近、Pade 逼近
- 源：[[steinComplexAnalysis]]（Ch. 2, Theorem 5.7, p.80）
