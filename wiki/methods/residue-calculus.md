---
type: method
title: 留数计算法
aliases: [residue calculus]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, method, residue]
strength: standard
strength_basis: 条件：$f$ 在围道内有有限个极点（弱——技术性条件）；结论：围道积分化为有限和（强——精确求值工具）。
---
# 留数计算法

> **工作空间**：$\mathbb{C}$。

## 概述

留数计算法（residue calculus）利用 [[residue-theorem|留数定理]]将围道积分化为极点的留数之和。这是实积分计算、亚纯函数零点计数、辐角原理的核心工具。

## 留数的计算公式

设 $f$ 在 $z_0$ 处有 $n$ 阶极点。则
$$
\text{res}_{z_0} f = \lim_{z \to z_0} \frac{1}{(n-1)!} \left(\frac{d}{dz}\right)^{n-1} [(z - z_0)^n f(z)].
$$

特别地：
- **简单极点**（$n = 1$）：$\text{res}_{z_0} f = \lim_{z \to z_0} (z - z_0) f(z)$。
- **有理函数** $f = P/Q$，$Q(z_0) = 0$，$Q'(z_0) \neq 0$：$\text{res}_{z_0} f = P(z_0)/Q'(z_0)$。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Theorem 1.4, p.95]]。

## 三步计算法

### 第一步：识别极点

对 $f$ 在围道内的极点 $\{z_1, \ldots, z_N\}$，逐一确定阶数 $n_k$。

### 第二步：计算每个留数

按公式计算 $\text{res}_{z_k} f$。

### 第三步：求和

由 [[residue-theorem|留数定理]]，$\int_\gamma f = 2\pi i \sum_k \text{res}_{z_k} f$。

## 典型例子

### 例子 1：$f(z) = \frac{e^{iz}}{z^2 + 1}$ 在 $|z| = 2$ 上

- 极点：$z = \pm i$（均在 $|z| < 2$ 内，简单极点）。
- $z = i$ 留数：$\frac{e^{i \cdot i}}{(z+i)}|_{z=i} = \frac{e^{-1}}{2i}$。
- $z = -i$ 留数：$\frac{e^{-i}}{(z-i)}|_{z=-i} = \frac{e^{-1}}{-2i} = -\frac{e^{-1}}{2i}$。

注意 $f(z) = e^{iz}/((z-i)(z+i))$ 在 $z = -i$ 处：$\text{res} = e^{-i}/(-i - i) = e^{-i}/(-2i) = -e^{-i}/(2i) = i e^{-i}/2$。而 $i e^{-i} = i(\cos(-1) + i \sin(-1)) = i\cos 1 - i^2 \sin 1 = i\cos 1 + \sin 1$。故 $\text{res}_{z=-i} f = (\sin 1 + i\cos 1)/2$。

- $\int_{|z|=2} f = 2\pi i [e^{-1}/(2i) + (\sin 1 + i\cos 1)/2] = \pi e^{-1} + \pi i(\sin 1 + i\cos 1) = \pi(e^{-1} - \cos 1) + i\pi \sin 1$.

实部与虚部分别对应不同的实积分计算。

### 例子 2：辐角原理（Argument Principle）

$f'/f$ 在 $f$ 的零点/极点处有 1 阶极点，留数 $\pm$ 重数。故
$$
\frac{1}{2\pi i} \int_\gamma \frac{f'}{f} = Z - P.
$$

详见 [[argument-principle]]。

### 例子 3：$f(z) = \frac{1}{z(1-z^2)}$ 在 $|z| = 2$ 上

极点：$z = 0, \pm 1$，均为简单极点。围道 $|z| = 2$ 包含所有。
- $\text{res}_{z=0} f = -1$（部分分式）。
- $\text{res}_{z=1} f = -1/2$。
- $\text{res}_{z=-1} f = 1/2$。

总和 $= -1$，$\int_{|z|=2} f = -2\pi i$。

## 计算技巧

1. **有理函数的部分分式**：将 $f$ 分解为简单分式之和。
2. **Laurent 展开**：在极点邻域展开 Laurent 级数，$(z - z_0)^{-1}$ 项系数即留数。
3. **辐角原理应用**：当被积函数是 $f'/f$ 时，留数直接等于 $Z - P$。
4. **多值函数处理**：对 $\log, z^\alpha$ 等，需先固定分支。

## 关联

- 概念：[[holomorphic-function]]、[[isolated-singularity]]、[[meromorphic-function]]
- 定理：[[residue-theorem]]（核心）、[[argument-principle]]、[[rouche-theorem]]
- 方法：[[contour-integration|围道积分法]]、[[analytic-continuation|解析延拓法]]
- 应用：实积分计算、亚纯函数零点计数
- 源：[[steinComplexAnalysis]]（Ch. 3, §2, p.95–97）
