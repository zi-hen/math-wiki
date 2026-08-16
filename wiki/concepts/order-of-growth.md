---
type: concept
title: 增长阶
aliases: [order of growth, exponential type]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, entire-functions]
strength: standard
strength_basis: 条件：$f$ 整（弱）；结论：增长阶 $\rho$ 是衡量整函数指数增长的最优上界指标（强——Hadamard 因子分解与 Hadamard 三圆定理的基础）。
---
# 增长阶

> **工作空间**：$\mathbb{C}$（整函数空间）。

## What — 定义与基本事实

### Stein 定义的「增长阶」

Stein 在 Ch. 5 §2 中定义整函数 $f$ 的**增长阶**（order of growth）$\rho$ 为满足
$$
|f(z)| \leq A e^{|z|^\rho}
$$
对某常数 $A > 0$ 与所有 $|z|$ 足够大时成立的最小非负实数。

若不存在这样的 $\rho$（即 $f$ 增长超过任何 $e^{|z|^\rho}$），则 $\rho = \infty$。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 5, §2, p.156–157]]（在引入 Hadamard 三圆定理与 Theorem 2.1 时隐式采用此定义）。

**注**：此处采用 Stein 的「指数增长界最优常数」定义，与某些教材中的经典定义 $\rho = \limsup_{r \to \infty} \frac{\log\log M(r)}{\log r}$ 等价（$M(r) = \max_{|z|=r} |f(z)|$ 为最大模函数），但 Stein 在 Ch. 5 中**直接**采用前一种定义，并通过 Jensen 公式证明两者等价（Theorem 2.1）。

### 整函数的两种增长指标

Stein 在 Ch. 4 §1 中引入 $\mathcal{F}$ 类（[[schwartz-space|Schwartz 空间]] 的整函数对应）时，使用「moderate decrease」一词刻画 $|f(x)| \leq A/(1+x^2)$。对一般整函数，相应的「增长」概念即上述指数增长阶。

### 增长阶与零点分布（Theorem 2.1, p.157）

若整函数 $f$ 的增长阶 $\leq \rho$，则：
1. **零点密度**：$n(r) \leq C r^\rho$ 对某 $C > 0$ 与所有充分大的 $r$。
2. **零点收敛性**：若 $z_1, z_2, \ldots$ 为 $f$ 的非零零点，则对所有 $s > \rho$，$\sum_{k=1}^\infty 1/|z_k|^s < \infty$。

由 [[jensen-formula|Jensen 公式]] 推出此定理——这是 Jensen 公式与 Hadamard 因子分解之间的桥梁。

### 典型例子

| 整函数 | 增长阶 $\rho$ | 备注 |
|--------|---------------|------|
| 常数 $c$ | $0$ | $\rho = 0$ 对应「多项式阶」 |
| 多项式 $p(z)$ | $0$ | 由 Liouville 推广：多项式阶增长 $\Rightarrow$ 多项式 |
| $e^z$ | $1$ | 指数型：$\lvert e^z\rvert \leq e^{\lvert z\rvert}$，故 $\rho \leq 1$；又 $e^x$ 沿实轴增长 $\Rightarrow \rho \geq 1$ |
| $\cos z, \sin z$ | $1$ | $\lvert\sin z\rvert \leq e^{\lvert z\rvert}$ |
| $\sin(\pi z)/\pi$ | $1$ | 零点 $\mathbb{Z}$ |
| $\cos(\sqrt{z})$ | $1/2$ | Stein p.159 例：$\lvert\cos\sqrt{z}\rvert \leq e^{\lvert z\rvert^{1/2}}$ |
| $e^{e^z}$ | $\infty$ | 超指数增长 |

## Why — 动机与直观

### 为什么引入增长阶？

增长阶是整函数的「复杂度指标」：

1. **统一多种整函数**：从常数（$\rho = 0$）到 $e^{e^z}$（$\rho = \infty$），增长阶量化整函数的「超越度」。
2. **零点分布的精确控制**：Hadamard 定理（Theorem 2.1, p.157）显示零点密度 $n(r) \sim r^\rho$。增长阶 $\rho$ 同时控制零点密度与函数增长——这是深层的对偶关系。
3. **Weierstrass 因子分解**：增长阶决定了 Weierstrass 典型因子的级数（$p_n$）选取（Stein, p.161）。
4. **Fourier 分析的连接**：在 [[paley-wiener-theorem|Paley-Wiener 定理]]中，**指数型**整函数 $|f(z)| \leq A e^{2\pi M |z|}$ 对应 Fourier 变换支集 $\subset [-M, M]$——增长阶（$2\pi M$）直接控制 Fourier 支集半径。

### 直观解释

整函数的「复杂度」分三档：
- $\rho = 0$：**多项式级**——本质上是多项式（由 Liouville 定理的多项式推广）。
- $0 < \rho < \infty$：**指数型**（exponential type）——典型超越整函数，包括 $\cos, \sin, e^z$ 等。
- $\rho = \infty$：**超指数型**——如 $e^{e^z}$。

## What-if — 反例与边界

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. Stein 定义（Ch. 5） | $\rho = \inf\{\alpha : \|f(z)\| \leq A e^{\|z\|^\alpha}\}$ | Stein p.156 |
| 2. 经典最大模定义 | $\rho = \limsup \log\log M(r)/\log r$ | 等价（由 Jensen 公式推出） |
| 3. 系数量化 | $\|a_n\|^{1/n} \sim 1/n \cdot r^{-\rho}$ | Hadamard |
| 4. 零点密度 | $n(r) \leq C r^\rho$ | Hadamard Theorem 2.1 |
| 5. 指数型版本 | $\|f(z)\| \leq A e^{2\pi M \|z\|}$（Paley-Wiener） | Stein Ch. 4 |

### 反例

1. **$e^z$**：$\rho = 1$。无零点——Hadamard 定理 (ii) 给出空和 $\sum 1/|z_k|^s = 0 < \infty$ 对任意 $s > 1$。
2. **$\sin \pi z$**：$\rho = 1$，零点 $\mathbb{Z}$。Hadamard 给出 $\sum 1/|n|^s < \infty$ 当 $s > 1$——这与 Riemann zeta 函数 $\zeta(s)$ 的收敛性一致。
3. **$\cos(\sqrt{z})$**：$\rho = 1/2$，零点 $\{((n+1/2)\pi)^2\}$。Hadamard 给出 $\sum 1/z_n^s < \infty$ 当 $s > 1/2$。
4. **$e^{e^z}$**：$\rho = \infty$，无 Hadamard 定理适用——需用其他工具。

### 边界情形

- **$\rho = 0$（多项式）**：由 Liouville 定理的多项式推广：若 $|f(z)| \leq C(1+|z|)^n$，则 $f$ 为 $\leq n$ 次多项式。
- **$\rho = 1$（指数型）**：$|f(z)| \leq A e^{c|z|}$。Paley-Wiener 定理中 $|\hat{f}| \leq A e^{-2\pi a|\xi|}$ 的整函数延拓即为指数型。
- **$\rho = \infty$**：超指数增长，Hadamard 定理**不适用**。

## 关联

- 概念：[[entire-function]]、[[holomorphic-function]]、[[schwartz-space]]
- 定理：[[jensen-formula]]（核心）、[[weierstrass-product-theorem]]（因子分解）、[[liouville-theorem]]、[[paley-wiener-theorem]]
- 源：[[steinComplexAnalysis]]（Ch. 5, §2, p.156–157）
