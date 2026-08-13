---
type: concept
title: 整函数
aliases: [entire function]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, entire-functions]
strength: standard
strength_basis: 条件：在 $\mathbb{C}$ 上全纯（弱——无边界约束）；结论：具全局幂级数展开 + 受 Liouville 定理强约束。
---
# 整函数

> **工作空间**：复平面 $\mathbb{C}$。

## What — 定义与基本事实

### 定义

**整函数**（entire function）是在整个复平面 $\mathbb{C}$ 上全纯的函数。

等价刻画：整函数 $= \mathbb{C}$ 上的全纯函数 $=$ 整幂级数 $\sum_{n=0}^\infty a_n z^n$（对所有 $z \in \mathbb{C}$ 收敛）。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, p.69]]：若 $f$ 整，则 $f$ 有以 $0$ 为中心的幂级数展开 $f(z) = \sum a_n z^n$，在所有 $\mathbb{C}$ 上收敛。

### 基本性质

1. **整幂级数展开**：每个整函数 $f$ 有整幂级数 $f(z) = \sum_{n=0}^\infty a_n z^n$，在整个 $\mathbb{C}$ 上绝对收敛。
2. **Liouville 定理**：有界整函数为常数（[[liouville-theorem]]）。此约束极强——任何多项式阶增长（$|f(z)| \leq C(1+|z|)^n$）已蕴含 $f$ 为多项式。
3. **零点可任意**：任意无聚点序列 $\{a_n\}$（$|a_n| \to \infty$）均可作为某整函数的零点集（[[weierstrass-product-theorem|Weierstrass 乘积定理]]）。
4. **整函数的增长阶**：$\rho = \limsup_{r \to \infty} \frac{\log \log M(r)}{\log r}$，其中 $M(r) = \max_{|z|=r} |f(z)|$（[[order-of-growth]]）。

### 典型例子

| 整函数 | 增长阶 $\rho$ | 零点 | 备注 |
|--------|---------------|------|------|
| $e^z$ | $1$ | 无 | 整函数典范例 |
| $\cos z, \sin z$ | $1$ | $\pi/2 + n\pi$ 等 | 三角函数 |
| $\sin(\pi z) / \pi$ | $1$ | $\mathbb{Z}$ | Euler 乘积典范 |
| $p(z)$（多项式） | $0$ | 有限个 | Liouville 定理推论 |
| 常数 | $0$ | — | 平凡整函数 |
| $\cos(\sqrt{z})$ | $1/2$ | $\{((n+1/2)\pi)^2\}$ | 增长阶 $< 1$ 的非多项式例（Stein, p.159） |

## Why — 动机与直观

### 为什么研究整函数？

整函数是复分析的核心研究对象之一，原因有三：

1. **代数基本定理的复分析证明**：整函数理论是 [[liouville-theorem|Liouville 定理]] → 代数基本定理（[[steinComplexAnalysis|Stein, Corollary 4.6, p.69]]）的工具链。
2. **零点分布与函数增长的精确对应**：[Jensen 公式]([[jensen-formula]]) 给出 $\log |f(0)|$ 与圆盘内零点 $\{\log(R/|z_k|)\}$ 的精确恒等。增长阶 $\rho$ 控制零点密度（$\sum 1/|z_k|^s < \infty$ 当 $s > \rho$）。
3. **Weierstrass 乘积定理**：任意无聚点序列均可实现为某整函数的零点集——整函数理论提供了零点分布的「存在性」侧面。

### 直观解释

整函数在 $\mathbb{C}$ 上无奇点。Liouville 定理表明无奇点 + 有界 $\Rightarrow$ 常数——这是全纯函数刚性的极致体现。增长阶 $\rho$ 衡量整函数远离多项式（$\rho = 0$）或超越（$\rho > 0$）的程度。

## What-if — 反例与边界

### 等价叙述

| 叙述 | 形式 | 等价关系 |
|------|------|---------|
| 1. $\mathbb{C}$ 上全纯 | $f \in \mathcal{O}(\mathbb{C})$ | 原始 |
| 2. 整幂级数 | $\exists\, \{a_n\} \subset \mathbb{C}$ 使 $f(z) = \sum a_n z^n$ 在所有 $\mathbb{C}$ 上收敛 | 形式等价 |
| 3. 无奇点 | $f$ 在 $\mathbb{C} \cup \{\infty\}$ 的紧子集上全纯 | 等价（差 $\infty$ 处的行为） |

### 反例

1. **$1/z$**：在 $\mathbb{C} \setminus \{0\}$ 上全纯，但**非**整函数（$0$ 为极点）。
2. **$\log z$**：多值函数，不可能在 $\mathbb{C}$ 上单值全纯。
3. **$\tan z$**：在 $z = (n + 1/2)\pi$ 处有极点，非整函数。
4. **有界整函数为常数**（[[liouville-theorem|Liouville 定理]]的反向：任何非常数整函数必无界）。

### 边界情形

- **多项式**：增长阶 $\rho = 0$。由 Liouville 定理的高阶推广（若 $|f(z)| \leq C(1+|z|)^n$ 则 $f$ 为 $n$ 次多项式）。
- **指数函数型**：$\rho = 1$，如 $e^z, \cos z, \sin z$。
- **亚指数型**：$0 < \rho < 1$，如 $\cos(\sqrt{z})$（Stein, p.159）。

## 关联

- 概念：[[holomorphic-function]]、[[meromorphic-function]]、[[order-of-growth]]、[[power-series]]
- 定理：[[liouville-theorem]]、[[jensen-formula]]、[[weierstrass-product-theorem]]、[[paley-wiener-theorem]]（代数基本定理见 [[liouville-theorem]] 推论）
- 引用本概念的引理：[[hadamard-formula]]（Hadamard 三圆定理给出整函数零点分布）
- 源：[[steinComplexAnalysis]]（Ch. 2, p.69; Ch. 5, 全文）
