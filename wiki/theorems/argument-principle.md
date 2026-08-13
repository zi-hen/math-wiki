---
type: theorem
title: 辐角原理
aliases: [argument principle]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, residue, contour-integration]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 在圆周 $C$ 及其内部亚纯，且在 $C$ 上无极点、无零点（弱）；结论：$\frac{1}{2\pi i} \int_C f'/f = Z - P$（强——精确计数零点和极点之差）。
---
# 辐角原理


## What — 陈述

### Theorem 4.1（Stein, p.109）

> 设 $f$ 在包含圆 $C$ 及其内部的某开集上亚纯。若 $f$ 在 $C$ 上无极点也无零点，则
> $$\frac{1}{2\pi i} \int_C \frac{f'(z)}{f(z)}\,dz = (\text{圆内零点数}) - (\text{圆内极点数}),$$
> 其中零点和极点按重数计算。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Theorem 4.1, p.109]]。

### Corollary 4.2（Stein, p.109）

> 上述定理对 toy contour 同样成立。

### 几何解释

$\frac{1}{2\pi i} \int_C \frac{f'}{f}\,dz$ 是 $f$ 沿 $C$ 的**辐角变化量**除以 $2\pi$。当 $z$ 绕 $C$ 一圈，$f(z)$ 的辐角变化为 $2\pi (Z - P)$。

## Why — 动机与证明

### 动机

辐角原理是 [[residue-theorem|留数定理]]在 $f'/f$ 上的特例，但有其独立价值：

1. **零点-极点统一计数**：辐角原理同时计数零点和极点，且差值 $Z - P$ 给出「净零点数」。
2. **Rouché 定理**：辐角原理是 [[rouche-theorem|Rouché 定理]]证明的核心。
3. **代数基本定理**：整函数的零点计数可用辐角原理。
4. **稳定性**：辐角原理论证 $f$ 在小扰动下零点个数不变。

### 证明思路

1. **$f'/f$ 在零点/极点处有单极点**：若 $f(z) = (z - z_0)^n g(z)$（$g(z_0) \neq 0$ 全纯），则 $f'(z)/f(z) = n/(z - z_0) + g'(z)/g(z)$。$g'/g$ 在 $z_0$ 处全纯，故 $f'/f$ 在 $z_0$ 处有 1 阶极点，留数 $= n$。
2. **应用留数定理**：$\frac{1}{2\pi i} \int_C f'/f = \sum_k \text{res}_{z_k} f'/f = \sum_{\text{零}} n_k - \sum_{\text{极}} m_k = Z - P$。

### 详细证明

#### 详细证明

**第一阶段：$f'/f$ 的局部结构**。

设 $z_0$ 为 $f$ 的 $n$ 阶零点。局部 $f(z) = (z - z_0)^n g(z)$，$g(z_0) \neq 0$ 全纯。则
$$
\frac{f'(z)}{f(z)} = \frac{n(z - z_0)^{n-1} g(z) + (z - z_0)^n g'(z)}{(z - z_0)^n g(z)} = \frac{n}{z - z_0} + \frac{g'(z)}{g(z)}.
$$

$g'(z)/g(z)$ 在 $z_0$ 邻域全纯（$g(z_0) \neq 0$ 保证），故 $f'/f$ 在 $z_0$ 处有 1 阶极点，留数 $= n$。

类似地，若 $z_0$ 为 $f$ 的 $m$ 阶极点，则局部 $f(z) = (z - z_0)^{-m} h(z)$（$h(z_0) \neq 0$ 全纯），$f'/f$ 在 $z_0$ 处有 1 阶极点，留数 $= -m$。

**第二阶段：应用留数定理**。

$f$ 在 $C$ 内有有限个零点和极点（$f$ 亚纯），记零点为 $\{z_k^0\}$（重数 $n_k$），极点为 $\{z_j^\infty\}$（重数 $m_j$）。由留数定理（Stein Corollary 2.2），
$$
\frac{1}{2\pi i} \int_C \frac{f'(z)}{f(z)}\,dz = \sum_k \text{res}_{z_k^0} \frac{f'}{f} + \sum_j \text{res}_{z_j^\infty} \frac{f'}{f} = \sum_k n_k - \sum_j m_j = Z - P.
$$

$\blacksquare$

## What-if — 反例与边界

### 典型例子

1. **$f(z) = z^n$**：$\int_{|z|=1} \frac{nz^{n-1}}{z^n}\,dz = n \int_{|z|=1} \frac{dz}{z} = 2\pi i \cdot n$。故 $Z = n$（$0$ 处 $n$ 阶零点）。
2. **$f(z) = 1/(z-a)^m$（$|a| < 1$）**：$\int_{|z|=1} \frac{-m/(z-a)^{m+1}}{1/(z-a)^m}\,dz = -m \int_{|z|=1} \frac{dz}{z - a} = -2\pi i \cdot m$。故 $P = m$（$a$ 处 $m$ 阶极点）。
3. **代数基本定理**：对多项式 $P(z) = a_n z^n + \cdots + a_0$，由辐角原理 + $R \to \infty$ 得 $Z = n$。

### 反例

1. **$f$ 在 $C$ 上有零点或极点**：辐角原理**不直接适用**。须先用小扰动避开奇点。
2. **$f$ 非亚纯**：若 $f$ 在 $C$ 内有本性奇点（非孤立极点），$f'/f$ 在该处行为复杂。

### 边界情形

- **$C$ 上有零点**：实际应用中常先平移 $C$ 避开零点。
- **多重零点**：辐角原理自动处理——$n$ 阶零点贡献 $n$。

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. 圆周版本（Stein Theorem 4.1） | $\int_C f'/f = 2\pi i (Z - P)$ | Stein p.109 |
| 2. Toy contour 版本（Corollary 4.2） | 同上 | Stein p.109 |
| 3. 对数微分形式 | $\int_C d \log f = 2\pi i (Z - P)$ | 等价 |
| 4. 几何形式 | $\Delta_{\gamma} \arg f = 2\pi (Z - P)$ | 几何解释 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 圆周版本 | 局部结构 + 留数 | 中 |
| Toy contour | Jordan 定理 | 中至高 |
| 对数微分形式 | $d\log f = f'/f$ | 低 |

## 关联

- 概念：[[meromorphic-function]]、[[isolated-singularity]]
- 定理：[[residue-theorem]]（核心工具）、[[rouche-theorem]]（应用）、[[open-mapping-theorem]]（推论）
- 方法：[[contour-integration|keyhole 围道（多孔形式）]]（核心，多孔形式）、[[comparison-modulus]]、[[local-to-global|局部到整体原理]]、[[homotopy-argument|同伦论证]]
- 应用：零点计数、代数基本定理的另一种证明
- 引用本定理的引理：[[mean-value-property-holomorphic]]（零点-极点计数的局部形态）
- 源：[[steinComplexAnalysis]]（Ch. 3, Theorem 4.1, p.109）
