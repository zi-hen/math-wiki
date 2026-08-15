---
type: concept
title: 调和函数
aliases: [harmonic function, Laplacian-killing, Laplace 方程解]
description: 开集上满足 Laplace 方程 $\Delta u = 0$ 的二阶连续可微实值函数；二维调和函数与全纯函数实部等价。
created: 2026-08-15
updated: 2026-08-15
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, harmonic-functions, potential-theory]
strength: standard
strength_basis: 条件：$u \in C^2(\Omega)$ 实值（弱——仅二阶光滑即可定义）；结论：$\Delta u = 0$（标准 PDE）。调和函数是位势理论的核心对象；二维调和函数与全纯函数实部等价（局部反问题）。最大模原理、Dirichlet 问题、调和分析的根基。
---

# 调和函数

> **工作空间**：$\mathbb{R}^d$（$d \ge 2$，本节着重 $d = 2$）的开集 $\Omega \subset \mathbb{R}^d$；Laplace 算子 $\Delta = \sum_{j=1}^d \partial^2/\partial x_j^2$。

## What — 定义与基本事实

### 定义

设 $\Omega \subset \mathbb{R}^d$ 为开集，$u : \Omega \to \mathbb{R}$ 为实值函数。称 $u$ 在 $\Omega$ 上**调和**（harmonic），若 $u \in C^2(\Omega)$ 且满足 Laplace 方程
$$
\Delta u = 0 \qquad \text{在 } \Omega \text{ 上}.
$$
等价地，$u$ 在每点 $z_0 \in \Omega$ 处满足
$$
\sum_{j=1}^d \frac{\partial^2 u}{\partial x_j^2}(z_0) = 0.
$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, p.122 末段]]。

### 基本性质

1. **光滑性**：调和函数自动 $C^\infty$（由 [[cauchy-integral-formula|Cauchy 积分公式]]类推；二维情形由全纯函数实部取实部，或由 Poisson 公式类推）。
2. **平均值性质**：对 $\Omega$ 内每个圆盘 $\overline{D_r(z_0)} \subset \Omega$，
   $$
   u(z_0) = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta \quad (d = 2),
   $$
   更一般地 $d$ 维：$u(z_0) = \frac{1}{\omega_d r^{d-1}}\int_{|z - z_0| = r} u\,d\sigma$（球面平均 = 体积平均 = $u(z_0)$）。
3. **最大值原理**：连通开集上的非常数调和函数不能在内部取最大值（除非为常数）。详见 [[maximum-modulus-principle]]。
4. **局部反问题**（$d = 2$）：每个调和函数 $u$ 局部上是某全纯函数的实部——Stein Ch. 4 Thm 1.1（详见 [[holomorphic-impl-harmonic]]）。

### 等价刻画（$d = 2$）

对 $\Omega \subset \mathbb{C}$ 上的 $C^2$ 实值函数 $u$，下列条件**等价**：

- (i) $u$ 调和：$\Delta u = 0$；
- (ii) **圆周平均值性质**：对 $\Omega$ 内每个圆盘，$u(z_0) = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta$；
- (iii) **全纯函数实部**：存在全纯函数 $f$ 使 $u = \operatorname{Re}(f)$（**局部**；依赖 $\Omega$ 的单连通性给整体构造）。

(ii) $\Rightarrow$ (i)：极坐标下展开 $\Delta u = u_{rr} + r^{-1} u_r + r^{-2} u_{\theta\theta}$；对 (ii) 关于 $r$ 求导两次（链式法则 + Leibniz），得 $u_{rr} + r^{-1} u_r = 0$，从而 $\Delta u = 0$。

### 典型例子

1. **常数函数**：$u = c$ 平凡调和。
2. **线性函数**：$u(x, y) = ax + by$（$\Delta u = 0$）。
3. **$\log|z|$**：在 $\mathbb{R}^2 \setminus \{0\}$ 上调和（径向情形 $\Delta u = r^{-1}(ru_r)_r = 0$ 解）。这是二维位势理论的基本核。
4. **$\operatorname{Re}(z^n)$**：$u(x, y) = \operatorname{Re}((x + iy)^n)$ 对每个 $n \ge 0$ 调和（因 $z^n$ 全纯）。
5. **多变量调和多项式**：$\operatorname{Re}(z^m \bar z^n)$ 对 $m, n \ge 0$ 调和（不在全纯函数族内，但可由 $\log|z-z_0|$ 等基本解的微操作出）。

## Why — 动机与直观

### 为什么引入调和函数？

位势理论的核心对象。动机有三：

1. **物理来源**：调和函数刻画**稳态**物理场——无源无汇的稳态温度分布、稳态电势、不可压缩无旋流的速度势。Laplace 方程 $\Delta u = 0$ 即「流入 = 流出」的局部平衡。
2. **复分析桥梁**：二维调和函数与全纯函数实部等价——这使二维调和分析可「化归」为全纯函数分析，从而继承其刚性（无穷可微、解析延拓、零点孤立等）。
3. **平均值原理**：调和函数由其在球面上的平均值完全刻画（球面平均 = 中心值）。这是调和分析、Dirichlet 问题、概率论（Brown 运动的鞅刻画）的根基。

### 直觉

Laplace 算子 $\Delta$ 测度函数的「平均曲率」——$\Delta u = 0$ 表示 $u$ 在每点的值恰为该点邻域的平均值（无偏）。**最大值原理**是这一平均性质的极端推论：若非常数 $u$ 在某点严格高于所有邻域点的平均值，则违反平衡。

## What-if — 反例与边界

### 反例（条件不可削弱）

1. **$u \in C^1$ 但非 $C^2$**：调和方程要求 $C^2$——光滑性不足时无意义。$u(x, y) = \sqrt{|xy|}$ 连续但 $\Delta u$ 不存在。
2. **$\Delta u = 0$ 在 $\Omega$ 外处处成立但边界有奇点**：例如 $u(x, y) = \log|z|$ 在 $\mathbb{C}\setminus\{0\}$ 上调和，在 $0$ 处对数奇点。调和性是**内点**性质。
3. **多变量 ($d \ge 3$) 调和函数无全纯原像**：$d \ge 3$ 时 $\Delta u = 0$ 不等价于「$u$ 是全纯函数实部」——Cauchy-Riemann 方程无 4 个未知函数的实部解。
4. **复值函数的「调和」**：复值调和函数 $f = u + iv$ 调和 $\Leftrightarrow$ $u, v$ 均调和。即 $\Delta f = \Delta u + i\Delta v = 0$。

### 边界情形

- **Dirichlet 问题**：给定 $\Omega$ 的边界值 $f \in C(\partial\Omega)$，找 $\Omega$ 上调和函数 $u$ 使 $u|_{\partial\Omega} = f$。对圆盘、球等特殊区域由 Poisson 公式显式解出；一般区域的存在性依赖边界正则性。
- **上调和 / 下调和**：若 $\Delta u \ge 0$（$\le 0$），称 $u$ 上调和（下调和）——平均值性质弱化为不等式。这是调和函数的自然推广，在势理论和概率论中起重要作用（详见后续条目）。
- **调和多项式**：所有调和多项式 $u$ 满足 $\Delta u = 0$——它们是调和分析中的基本对象，完备正交系（如球面调和函数、Legendre 多项式等）。

## 关联

- 概念：[[holomorphic-function]]（二维调和函数的局部反问题）、[[power-series]]（调和函数 Fourier 级数展开）
- 定理：[[maximum-modulus-principle]]（调和函数的核心应用）、[[holomorphic-impl-harmonic]]（全纯 ⇒ 实部虚部调和）、[[fourier-coeffs-holomorphic-disc|Theorem 7.1]]（负频率消失）
- 引理：[[mean-value-property-holomorphic]]（全纯函数 MVP → 实部 MVP → 调和函数 MVP）
- 源：[[steinComplexAnalysis|Stein & Shakarchi (2003), 《Complex Analysis》, Ch. 3, p.122]]（调和函数引入）