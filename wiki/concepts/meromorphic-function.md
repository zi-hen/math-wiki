---
type: concept
title: 亚纯函数
aliases: [meromorphic function]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, meromorphic-functions]
strength: standard
strength_basis: 条件：$\Omega$ 中允许孤立极点（弱——比全纯函数弱）；结论：可写为 $f/g$（$g$ 全纯，$g \neq 0$ 局部），具备留数计算工具。
---
# 亚纯函数

> **工作空间**：$\mathbb{C}$ 的开子集 $\Omega$。

## What — 定义与基本事实

### 定义

设 $\Omega \subset \mathbb{C}$ 为开集。称 $f$ 在 $\Omega$ 上**亚纯**（meromorphic），若存在无聚点序列 $\{z_0, z_1, z_2, \ldots\} \subset \Omega$ 使得：
1. $f$ 在 $\Omega \setminus \{z_0, z_1, z_2, \ldots\}$ 上全纯；
2. $f$ 在每个 $z_k$ 处有极点（即 $1/f$ 在 $z_k$ 邻域全纯且 $1/f(z_k) = 0$）。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, §3, Definition, p.105]]。

### 奇点分类（孤立奇点）

设 $z_0$ 为 $f$ 的孤立奇点（即 $f$ 在 $z_0$ 的某去心邻域全纯）。三类奇点：

| 类型 | 定义 | 行为 |
|------|------|------|
| **可去奇点**（removable） | $f$ 在 $z_0$ 邻域有界 | $f$ 可全纯延拓至 $z_0$（[[steinComplexAnalysis|Stein, p.103, Theorem 3.1]]） |
| **极点**（pole） | $f(z) \to \infty$ 当 $z \to z_0$ | 局部 $f(z) = (z - z_0)^{-n} g(z)$（$g$ 全纯非零） |
| **本性奇点**（essential） | 既非可去也非极点 | $f$ 在邻域内取值稠密于 $\mathbb{C}$（[[steinComplexAnalysis|Stein, p.105, Theorem 3.3]]） |

### 基本性质

1. **零点与极点的对称**：$f$ 在 $z_0$ 有零点 $\Leftrightarrow$ $1/f$ 在 $z_0$ 有极点（阶数相同）。
2. **局部结构**（Theorem 1.1/1.2, p.92/93）：$f$ 在零点或极点附近可写为 $(z - z_0)^n g(z)$ 或 $(z - z_0)^{-n} g(z)$，其中 $g$ 非零全纯。
3. **主部展开**（Theorem 1.3, p.94）：$f$ 在极点 $z_0$ 处有 Laurent 展开
   $$f(z) = \frac{a_{-n}}{(z - z_0)^n} + \cdots + \frac{a_{-1}}{z - z_0} + G(z),$$
   其中 $G$ 在 $z_0$ 邻域全纯。
4. **扩充复球面版本**（Theorem 3.4, p.106）：扩充复球面上的亚纯函数恰为有理函数。

### 典型例子

| 函数 | 奇点 | 类型 |
|------|------|------|
| $1/z$ | $z = 0$ | 极点（阶 1） |
| $1/\sin z$ | $z = n\pi$ | 极点（阶 1） |
| $e^{1/z}$ | $z = 0$ | 本性奇点 |
| 多项式 | 无 | 全纯（无奇点） |
| $\cot z$ | $z = n\pi$ | 极点（阶 1） |

## Why — 动机与直观

### 为什么引入亚纯函数？

亚纯函数是「允许极点」的全纯函数，在三个方向上扩展理论：

1. **有理函数理论**：扩充复球面上的亚纯函数 = 有理函数（[[steinComplexAnalysis|Stein, p.106, Theorem 3.4]]）。这是代数与几何的桥梁。
2. **留数计算**：亚纯函数极点处的留数（[[residue-theorem]]）使许多实积分可精确计算。
3. **零点-极点对应**：零点与极点的对偶性（[[argument-principle|辐角原理]]）使两者的计数可统一处理。

### 直观解释

亚纯函数是「局部全纯 + 允许孤立极点」的函数。极点处函数值为 $\infty$——在 Riemann 球面上，$\infty$ 是良定义的点（Stein, p.106）。故亚纯函数可视为从 $\Omega$（带孤立点）到 Riemann 球面的全纯映射。

## What-if — 反例与边界

### 等价叙述

| 叙述 | 形式 | 性质 |
|------|------|------|
| 1. 局部商 | $f = g/h$（$g, h$ 全纯，$h \not\equiv 0$ 局部）| Stein, p.92 |
| 2. 极点集无聚点 | $\{z_k\}$ 在 $\Omega$ 中无聚点 | Stein Definition |
| 3. Riemann 球面映射 | $f : \Omega \to \hat{\mathbb{C}}$ 全纯 | 几何观点 |

### 反例

1. **$\sin(1/z)$**：在 $z = 0$ 处有本性奇点（Stein, p.105 提及）。$1/z$ 的本性奇点延拓。
2. **$e^z$**：无奇点（在 $\mathbb{C}$ 上整函数），不构成亚纯函数非平凡例。
3. **$f$ 在 $\Omega$ 上有本性奇点聚点**：若 $\Omega$ 中有无穷多本性奇点且有聚点，$f$ 不是亚纯函数（Stein 定义禁止）。例如 $f(z) = \sum_n e^{1/(z - z_n)}$，其中 $z_n \to 0$。

### 边界情形

- **可去奇点 vs 极点**：若 $f$ 在 $z_0$ 处有界，$z_0$ 是可去奇点（Riemann 定理，[[steinComplexAnalysis|Theorem 3.1, p.103]]）。
- **本性奇点判定**：若 $f(z_0)$ 处 $|f(z)| \not\to \infty$ 且非有界，则为本性奇点。
- **无穷远点**：$f$ 在 $\infty$ 处的行为通过 $F(z) = f(1/z)$ 在 $0$ 处的行为分析。

## 关联

- 概念：[[holomorphic-function]]、[[isolated-singularity]]、[[entire-function]]
- 定理：[[residue-theorem]]、[[argument-principle]]、[[rouche-theorem]]、[[weierstrass-product-theorem]]
- 引理：[[removable-singularity-criterion|极点判定准则]]
- 源：[[steinComplexAnalysis]]（Ch. 3, §1–3, p.90–106）
