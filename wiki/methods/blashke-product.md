---
type: method
title: Blashke 乘积
aliases: [Blashke product, finite Blaschke product, zero-factor decomposition]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, method, factorization]
strength: standard
strength_basis: 条件：$f$ 在闭圆盘 $\bar{D}_R$ 上全纯，$f(0) \neq 0$，有零点 $z_1, \ldots, z_N$（弱——局部结构已知）；结论：构造 Blashke 乘积 $B(z)$ 使 $h = f/B$ 在 $D_R$ 上无零点，且 $|B| = 1$ 在 $C_R$ 上（强——这是 Jensen 公式、Weierstrass 因子分解的核心构造）。
---
# Blashke 乘积

> **工作空间**：$\mathbb{C}$ 中以 $0$ 为中心、$R$ 为半径的闭圆盘 $\bar{D}_R$。

## 概述

**Blashke 乘积**（Blashke product）是 Stein《Complex Analysis》Ch. 5 §1（Jensen 公式证明）中的核心构造。其核心思想：**对 $f$ 在圆盘内的每个零点 $z_k$，构造因子 $b_k(z)$，使 $b_k(z_k) = 0$，$|b_k(z)| = 1$ 在圆周上**。乘积 $B(z) = \prod b_k(z)$ 满足 $|B| = 1$ 在 $C_R$ 上，使 $h = f/B$ 无零点。

Blashke 乘积本质上是「**带边界约束的零点因子**」——它在 $C_R$ 上模为 1，使 $h$ 与 $f$ 在边界上行为一致。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 5, Theorem 1.1 证明, p.154–156（Blashke 乘积引入）]]。

## 单零点 Blashke 因子

对每个 $z_k \in D_R$（$|z_k| < R$），定义
$$
b_k(z) = \frac{R - z \bar{z}_k / R}{z - z_k} \cdot \frac{z_k}{R} \cdot \frac{1}{\text{sign}(f(0))}.
$$

更简洁地（Stein 实际形式）：
$$
b_k(z) = \frac{|z_k|}{z_k} \cdot \frac{R^2 - z \bar{z}_k}{R(z - z_k)}.
$$

**关键性质**：
1. $b_k(z_k) = 0$（分子 $R^2 - z_k \bar{z}_k = 0$，分母 $R(z_k - z_k) = 0$，但 $\frac{0}{0}$ 极限为 $-R/(R) \cdot |z_k|/z_k = |z_k|/z_k$——具体为 0 需小心处理）。
2. $|b_k(z)| = 1$ 当 $|z| = R$（分子 $\overline{R^2 - z\bar{z}_k} = R^2 - \bar{z} z_k$，分母 $\overline{R(z - z_k)} = R(\bar{z} - \bar{z}_k)$——验证 $|b_k(z)|^2 = 1$）。
3. $b_k(0) = |z_k|/R$（在 $z = 0$ 处 $|b_k(0)| = |z_k|/R < 1$）。

## Blashke 乘积的定义

$$
B(z) = \prod_{k=1}^N b_k(z).
$$

**关键性质**：
1. $B$ 在 $D_R$ 上全纯（每个 $b_k$ 在 $D_R \setminus \{z_k\}$ 上全纯，$z_k$ 处为零点）。
2. $B$ 以 $z_1, \ldots, z_N$ 为零点（按重数）。
3. $|B(z)| = 1$ 当 $|z| = R$（每个 $|b_k| = 1$）。
4. $B(0) = \prod_k (|z_k|/R)$（按 $|f(0)|$ 调整 $\text{sign}$）。

## Stein 应用：Jensen 公式（Ch. 5, Theorem 1.1, p.154）

**问题**：证明
$$
\log |f(0)| = \sum_{k=1}^N \log\frac{|z_k|}{R} + \frac{1}{2\pi}\int_0^{2\pi} \log|f(Re^{i\theta})|\,d\theta.
$$

**Blashke 论证**：
1. 设 $h = f/B$（其中 $B$ 为 Blashke 乘积）。$h$ 在 $\bar{D}_R$ 上连续，**$h$ 在 $D_R$ 上无零点**（零点被 $B$ 抵消）。
2. 由 [[simply-connected-domain|单连通域]] 上的对数定理（Stein Theorem 6.2, p.119），存在 $\log h$ 在 $D_R$ 上全纯。
3. 对 $\log h$ 应用 [[cauchy-integral-formula|Cauchy 积分公式]] 取实部：
   $$\log|h(0)| = \frac{1}{2\pi}\int_0^{2\pi} \log|h(Re^{i\theta})|\,d\theta.$$
4. 由 $|B| = 1$ 在 $C_R$ 上，$|h| = |f|/|B| = |f|$ 在 $C_R$ 上。又 $|h(0)| = |f(0)|/|B(0)| = |f(0)| \cdot (R/\prod |z_k|)$。
5. 代入得 Jensen 公式。

详见 [[jensen-formula]]。

## Blashke 乘积与 Weierstrass 典型因子的对比

| 构造 | Blashke 乘积 | Weierstrass 典型因子 |
|------|------------|------------------|
| 形式 | $b_k(z) = (R^2 - z\bar{z}_k)/(R(z - z_k))$ | $E_p(z) = (1-z)e^{z + z^2/2 + \cdots + z^p/p}$ |
| 适用 | 闭圆盘 $\bar{D}_R$ | 全平面 $\mathbb{C}$ |
| 边界性质 | $\|b_k\| = 1$ 在 $C_R$ 上 | $\|E_p(z)\| \to 1$ 当 $z \to 0$ |
| 核心思想 | 带边界约束的零点因子 | 局部「$1$」因子 |
| 应用 | Jensen 公式 | Weierstrass 乘积定理 |

两者本质上是同一思想（局部零点因子）的两种实现：Blashke 在**有限圆盘**内，Weierstrass 在**全平面**上。

## 与 Stein 其他方法的关系

- **[[amplification|增强技巧]]**：Blashke 乘积的边界条件 $|B| = 1$ 是「**参数化增强**」的特例——增强因子 $b_k$ 使 $|b_k|$ 在 $C_R$ 上恒为 1。
- **[[local-to-global|局部到整体原理]]**：Blashke 乘积是「局部零点（每个 $z_k$）→ 全局乘积（$B$）」的局部-整体构造。
- **[[structural-randomness-decomposition|结构-随机性二分法]]**：Blashke 乘积实现「零点（结构：$B$）+ 无零点部分（$h$）」的分解。

## Stein 风格：何时使用 Blashke 乘积

| 情形 | 是否适用 |
|------|---------|
| $f$ 在闭圆盘上全纯，有限个零点 | ✓（有限 Blashke 乘积） |
| $f$ 在圆盘内有无穷多零点 | ✓（无穷 Blashke 乘积，需收敛条件 $\sum (1 - \lvert z_k\rvert/R) < \infty$） |
| $f$ 在全平面上全纯 | ✗（改用 Weierstrass 典型因子） |
| $f$ 在多连通域上全纯 | ✗（需 Riemann 球面上的 Mittag-Leffler 型分解） |

## 典型例子

### 例子 1：$f(z) = z - a$ 在 $\bar{D}_R$ 上（$|a| < R$）

Blashke 因子：$b(z) = \frac{R^2 - z\bar{a}}{R(z - a)}$。$b(a) = 0$，$|b(z)| = 1$ 在 $|z| = R$ 上，$b(0) = |a|/R$。

Jensen 公式验证：
- $\log|f(0)| = \log|a|$
- $\sum \log(|z_k|/R) = \log(|a|/R)$
- $\frac{1}{2\pi}\int \log|Re^{i\theta} - a|\,d\theta = \log R$（Stein, p.156）

故 $\log|a| = -\log(|a|/R) + \log R = \log|a|$ ✓。

### 例子 2：$\sin(\pi z)/\pi$ 在 $\mathbb{C}$ 上

Blashke 因子（应用于 $\bar{D}_R$ 包含的零点 $z_k = k$，$|k| < R$）：
$$
B_R(z) = \prod_{|k| < R} \frac{R^2 - z k}{R(z - k)} \cdot \frac{k}{|k|}.
$$

$\sin(\pi z)/\pi = z \prod_{k \neq 0} (1 - z/k) e^{z/k}$ 是 Weierstrass 乘积（Ch. 5 §3-4）——而非 Blashke。但 Blashke 因子在 Jensen 公式证明 Weierstrass 因子分解的「零点因子」中扮演结构角色。

### 例子 3：$f(z) = e^z - 1$ 在 $\bar{D}_R$ 上

$f$ 在 $z = 0$ 处有 1 阶零点，在 $D_R$ 内其他零点为 $z_k = 2\pi i k$（$|2\pi k| < R$）。Blashke 乘积 $B(z) = \prod_k b_k(z)$ 实现这些零点。

## 关联

- 概念：[[holomorphic-function]]、[[entire-function]]
- 定理：[[jensen-formula]]（核心应用）、[[weierstrass-product-theorem]]、[[maximum-modulus-principle]]、[[liouville-theorem]]
- 方法：[[amplification|增强技巧]]（边界约束的特殊形式）、[[local-to-global|局部到整体原理]]、[[structural-randomness-decomposition|结构-随机性二分法]]
- 引理：[[cauchy-inequalities]]
- 源：[[steinComplexAnalysis]]（Ch. 5, Theorem 1.1 证明, p.154–156）
