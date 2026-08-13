---
type: concept
title: 孤立奇点
aliases: [isolated singularity]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, singularities]
strength: standard
strength_basis: 条件：$f$ 在 $z_0$ 的去心邻域全纯（弱）；结论：奇点分为三类（可去/极点/本性），每类有精确判定准则。
---
# 孤立奇点

> **工作空间**：$\mathbb{C}$ 中以 $z_0$ 为中心的去心邻域 $D_r(z_0) \setminus \{z_0\}$。

## What — 定义与分类

### 定义

设 $f$ 在 $z_0$ 的某去心邻域 $D_r(z_0) \setminus \{z_0\}$ 上全纯，但在 $z_0$ 处无定义（无全纯延拓）。则 $z_0$ 称为 $f$ 的**孤立奇点**。

### 三类奇点（Stein, p.91）

按 $|f(z)|$ 当 $z \to z_0$ 时的行为分三类：

| 类型 | 定义 | 等价刻画 |
|------|------|---------|
| **可去奇点**（removable） | $f$ 在 $z_0$ 邻域有界 | $f$ 可全纯延拓至 $z_0$（Riemann 定理） |
| **极点**（pole） | $\|f(z)\| \to \infty$ 当 $z \to z_0$ | $1/f$ 在 $z_0$ 处有可去奇点（且 $1/f(z_0) = 0$） |
| **本性奇点**（essential） | 既非可去也非极点 | $f$ 在邻域取值稠密于 $\mathbb{C}$（Casorati-Weierstrass） |

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, p.91]]。

### 极点阶数

$f$ 在 $z_0$ 处有 $n$ 阶极点若局部
$$
f(z) = (z - z_0)^{-n} g(z), \quad g(z_0) \neq 0,\ g \text{ 全纯}.
$$
等价地，主部 Laurent 展开为
$$
f(z) = \frac{a_{-n}}{(z - z_0)^n} + \cdots + \frac{a_{-1}}{z - z_0} + G(z).
$$

### 零点阶数

类似地，$f$ 在 $z_0$ 处有 $n$ 阶零点若局部 $f(z) = (z - z_0)^n g(z)$，$g(z_0) \neq 0$。

## Why — 动机与直观

### 为什么研究孤立奇点？

孤立奇点是全纯函数的「边界现象」——全纯函数的内部行为由局部性质决定，但奇点处可能发生根本性变化。研究孤立奇点有三重意义：

1. **奇点消除（Riemann 定理）**：有界奇点可去——这使许多函数可全纯延拓（如 $\sin(z)/z$ 在 $z=0$）。
2. **极点判定**：$|f| \to \infty$ 当且仅当 $z_0$ 为极点。这提供了简单判定方法。
3. **本性奇点的混沌行为**：$f$ 在本性奇点邻域取值稠密于 $\mathbb{C}$（Casorati-Weierstrass），可逼近任何复数——这与极点、可去奇点的「可控行为」形成鲜明对比。

### 直观解释

孤立奇点像全纯函数内部的「小型爆炸」：
- **可去奇点**：「微扰」——补上值即可。
- **极点**：「有限阶爆破」——函数值趋于 $\infty$。
- **本性奇点**：「混沌」——函数值在邻域内任意振荡。

## What-if — 反例与边界

### 典型例子

| 函数 | 奇点 $z_0$ | 类型 |
|------|------------|------|
| $\frac{\sin z}{z}$ | $0$ | 可去（$\to 1$） |
| $1/z$ | $0$ | 1 阶极点 |
| $1/(z - 1)^n$ | $1$ | $n$ 阶极点 |
| $e^{1/z}$ | $0$ | 本性奇点 |
| $\sin(1/z)$ | $0$ | 本性奇点 |
| $\cos z / \sin z$ | $n\pi$ | 1 阶极点 |

### 反例

1. **$z_0$ 不是孤立奇点**：若 $f$ 在 $z_0$ 邻域内有无穷多奇点且聚于 $z_0$，则 $z_0$ 不是孤立奇点。例如 $f(z) = 1/\sin(1/z)$ 在 $z = 1/(n\pi)$ 处有极点（聚于 $0$）。$0$ 不是孤立奇点。
2. **本性奇点的非密度情形**：Picard 定理指出：若 $z_0$ 为本性奇点，则 $f$ 在邻域内**可取到 $\mathbb{C}$ 中所有值，至多一个例外**（所谓「大 Picard 定理」）。Casorati-Weierstrass 仅断言稠密性。

### 边界情形

- **$\infty$ 处奇点**：通过 $F(z) = f(1/z)$ 在 $0$ 处的行为分析。
- **可去奇点判定**：
  - 必要条件：$f$ 在 $z_0$ 邻域有界。
  - 充分条件：$\lim_{z \to z_0} (z - z_0) f(z) = 0$ 蕴含可去（Stein Theorem 3.1, p.103）。
- **本性奇点判定**：$\lim_{z \to z_0} f(z)$ 不存在（不论有限还是无穷）$\Leftrightarrow$ 本性。

### 等价叙述

| 叙述 | 形式 | 性质 |
|------|------|------|
| 1. Riemann 可去定理（Stein Theorem 3.1） | 有界孤立奇点可去 | E 级 |
| 2. 极点准则（Stein Corollary 3.2） | $\|f(z)\| \to \infty \Leftrightarrow$ 极点 | E 级 |
| 3. Casorati-Weierstrass（Stein Theorem 3.3） | 本性奇点 $\Rightarrow$ 值域稠密 | E 级 |
| 4. 大 Picard 定理 | 本性奇点可取所有值至多一个例外 | 高级（非 Stein） |

## 关联

- 概念：[[holomorphic-function]]、[[meromorphic-function]]
- 定理：[[residue-theorem]]、[[argument-principle]]、[[rouche-theorem]]
- 引理：[[removable-singularity-criterion]]
- 源：[[steinComplexAnalysis]]（Ch. 3, §3, p.103–106）
