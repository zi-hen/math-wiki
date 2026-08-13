---
type: concept
title: 全纯函数
aliases: [holomorphic function, analytic function]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, holomorphic]
strength: standard
strength_basis: 条件：$f$ 在 $\Omega$ 上定义（弱）；结论：无穷可微 + 局部幂级数展开 + 解析延拓唯一性（强）。全纯函数自动具备实变量可微函数所不具备的刚性。
---
# 全纯函数

> **工作空间**：复平面 $\mathbb{C}$ 的开子集 $\Omega$。

## What — 定义与基本事实

### 定义

设 $\Omega \subset \mathbb{C}$ 为开集，$f : \Omega \to \mathbb{C}$ 为复值函数。称 $f$ 在 $z_0 \in \Omega$ 处**全纯**（holomorphic），若极限
$$
f'(z_0) = \lim_{h \to 0} \frac{f(z_0 + h) - f(z_0)}{h}
$$
存在。称 $f$ 在 $\Omega$ 上全纯，若 $f$ 在 $\Omega$ 的每一点全纯。

等价定义（Stein, p.28）：$f$ 在 $z_0$ 全纯当且仅当存在复数 $a$ 与函数 $\psi$（$\lim_{h \to 0} \psi(h) = 0$）使得
$$
f(z_0 + h) - f(z_0) - ah = h \psi(h).
$$
此时 $a = f'(z_0)$，且 $f$ 在 $z_0$ 处连续。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 1, §2, p.28–29]]。

### Cauchy-Riemann 方程

写 $f = u + iv$（$u, v$ 为实值函数）。$f$ 在 $\Omega$ 上全纯当且仅当 $u, v \in C^1(\Omega)$ 且满足
$$
\frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \qquad \frac{\partial u}{\partial y} = -\frac{\partial v}{\partial x}.
$$
此时 $f'(z) = \partial f / \partial z = \frac{\partial f}{\partial x}$（[[steinComplexAnalysis|Stein, p.31–32]]）。

### 基本性质

1. **无穷可微性**：全纯函数自动无穷次复可微（[[cauchy-integral-formula|Cauchy 积分公式]]的推论）。
2.3. **解析性**：全纯函数在每点附近有幂级数展开，故「全纯」与「解析」同义（详见 [[schwartz-space]] 中 Schwartz 空间的速降性类比）。 **解析延拓唯一性**：若两个全纯函数在某非空开集上相等，则在整个连通区域上相等（恒等定理，[[steinComplexAnalysis|Stein, p.71, Theorem 4.8]]）。
4. **代数封闭性**：全纯函数的和、积、商（分母非零点处）、复合仍为全纯。

### 典型例子

1. **多项式**：$P(z) = a_n z^n + \cdots + a_0$ 在 $\mathbb{C}$ 上全纯（整函数）。
2. **指数函数**：$e^z = \sum_{n=0}^{\infty} z^n/n!$ 整函数，且 $(e^z)' = e^z$（[[steinComplexAnalysis|Stein, p.33]]）。
3. **三角函数**：$\cos z, \sin z$ 由幂级数定义，整函数。
4. **$\frac{1}{z}$**：在 $\mathbb{C} \setminus \{0\}$ 上全纯；在 $0$ 处有极点（Ch. 3）。
5. **$\log z$**：在单连通域上选取适当分支后全纯（[[steinComplexAnalysis|Stein, Ch. 3, §6]]）。

### 反例：$f(z) = \overline{z}$

$f(z) = \overline{z}$ 在 $\mathbb{C}$ 上连续，但不全纯。计算
$$
\frac{f(z_0 + h) - f(z_0)}{h} = \frac{\overline{h}}{h}
$$
当 $h$ 沿实轴趋于 $0$ 时趋于 $1$，沿虚轴趋于 $0$——极限不存在（[[steinComplexAnalysis|Stein, p.28, Example 3]]）。

## Why — 动机与直观

### 为什么引入全纯函数？

复分析的核心对象。动机有三：

1. **围道积分的消失**：有原函数的全纯函数的围道积分为零（Cauchy 定理，[[cauchy-theorem]]）。这使大量实积分可严格计算。
2. **幂级数的自动性**：全纯函数自动具备幂级数展开（解析性）。这将「可微」与「解析」统一，与实分析中 $C^\infty \not\Rightarrow$ 解析形成对比。
3. **解析延拓的唯一性**：全纯函数在连通区域上由任意小邻域内的值完全决定。这使边界信息（如 Fourier 变换支集）可决定内部延拓（[[paley-wiener-theorem|Paley-Wiener 定理]]）。

### 直觉

实可微函数仅需考虑切线的斜率；全纯函数要求切空间的所有方向都「一致」——这迫使函数具有「刚性」，从而具备实可微函数所没有的强性质（无穷可微、解析延拓、零点孤立、最大模原理）。

## What-if — 反例与边界

### 等价叙述

| 叙述 | 形式 | 性质 |
|------|------|------|
| 1. 复可微（原始） | $f'(z_0) = \lim_{h \to 0} \frac{f(z_0+h) - f(z_0)}{h}$ | Stein Ch. 1, §2 |
| 2. Cauchy-Riemann 方程 | $\partial f / \partial \bar{z} = 0$ | 等价（$u, v \in C^1$） |
| 3. 解析（幂级数） | 局部 $\exists$ 幂级数展开 | 与全纯等价 |
| 4. Cauchy 积分 | $f(z) = \frac{1}{2\pi i}\int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta$ | 等价（依赖 [[cauchy-integral-formula]]） |

### 反例

1. **$f(z) = \overline{z}$**：连续但不全纯（Stein, p.28）。
2. **$f(z) = \operatorname{Re}(z)$**：实可微但不满足 Cauchy-Riemann 方程。
3. **$f(z) = |z|^2$**：实可微但仅在 $z = 0$ 全纯（$\overline{\partial} f = z$）。
4. **实变量函数**：如 $f(x) = e^{-1/x^2}$（$x > 0$），$f(0) = 0$ 是 $C^\infty$ 但**不解析**——不存在幂级数展开。这表明实 $C^\infty$ 不蕴含全纯。

### 边界情形

- **$f$ 在 $z_0$ 处的可去奇点**：若 $f$ 在 $z_0$ 的某去心邻域全纯且有界，则 $f$ 可全纯延拓至 $z_0$（[[steinComplexAnalysis|Stein, Ch. 3, Theorem 3.1, p.103]]）。
- **整函数**：$\Omega = \mathbb{C}$ 上的全纯函数称为整函数。若整函数有界，则为常数（[[liouville-theorem|Liouville 定理]]）。

## 关联

- 概念：[[power-series]]、[[entire-function]]、[[meromorphic-function]]、[[fourier-transform]]（Fourier 变换作用于 $\mathcal{S}$ 子类）、[[fourier-coefficient-holomorphic]]（圆周全纯 [[fourier-coefficient|Fourier 系数]]）、[[f_a-class|$\mathscr{F}_a$ 类]]（条带全纯函数族）、[[poles-classification]]（孤立奇点三分）
- 定理：[[cauchy-theorem]]、[[cauchy-integral-formula]]、[[liouville-theorem]]、[[morera-theorem]]、[[maximum-modulus-principle]]、[[paley-wiener-theorem]]
- 引理：[[modulus-of-complex-exponential]]、[[multiplicativity-of-modulus]]、[[residue-by-taylor-coeff]]（Laurent 系数与留数关系）
- 引用本概念的引理：[[mean-value-property-holomorphic]]（全纯函数的均值性质）、[[shift-of-line]]（$\mathscr{F}_a$ 类围道平移）
- 源：[[steinComplexAnalysis]]（Ch. 1, §2, p.28–37）
