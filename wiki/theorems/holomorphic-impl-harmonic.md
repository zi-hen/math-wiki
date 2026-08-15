---
type: theorem
title: 全纯函数的实部与虚部调和（Corollary 7.3）
aliases: [holomorphic implies harmonic, Re(Im) of holomorphic is harmonic, Cor 7.3 harmonic, 调和实部虚部]
description: 全纯函数 $f = u + iv$ 的实部 $u$ 与虚部 $v$ 在定义域内调和（$\Delta u = \Delta v = 0$），并满足平均值性质。
created: 2026-08-15
updated: 2026-08-15
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, harmonic-functions, holomorphic-functions]
strength: strong
strength_basis: 弱条件（$f$ 在开集 $\Omega$ 全纯——$C^1$ 即可触发）；强结论（实部与虚部**同时**满足 Laplace 方程 + 平均值性质，且调和性质在边界外自动延伸）。这是「全纯 ⟹ 实部虚部调和」的经典结论，连接复分析与位势理论，是最大模原理、Dirichlet 问题、调和函数理论的核心桥梁。
---

# 全纯函数的实部与虚部调和（Corollary 7.3）

> **工作空间**：复平面 $\mathbb{C}$ 的开集 $\Omega$；调和方程 $\Delta u = 0$（$\Delta = \partial^2/\partial x^2 + \partial^2/\partial y^2$）。

## What — 陈述

> **Corollary 7.3**（Stein & Shakarchi, Ch. 3, p.122）. 设 $f$ 在开集 $\Omega \subset \mathbb{C}$ 上全纯。写 $f = u + iv$（$u, v$ 为实值函数，$\Omega$ 上的 $C^\infty$ 函数）。
>
> (i) **调和性**：$u$ 与 $v$ 在 $\Omega$ 上调和，即
> $$
> \Delta u = 0, \qquad \Delta v = 0 \qquad \text{在 } \Omega \text{ 上}.
> $$
>
> (ii) **平均值性质**：对任意 $z_0 \in \Omega$ 与 $0 < r < \operatorname{dist}(z_0, \partial\Omega)$，
> $$
> u(z_0) = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta, \qquad
> v(z_0) = \frac{1}{2\pi}\int_0^{2\pi} v(z_0 + re^{i\theta})\,d\theta.
> $$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Corollary 7.3, p.122]]。

### 前提条件

- $f$ 在开集 $\Omega$ 上全纯（自动 $C^\infty$——由 [[cauchy-integral-formula|Cauchy 积分公式]]）。
- (ii) 中半径 $r$ 须使圆盘 $\overline{D_r(z_0)} \subset \Omega$（即 $r < \operatorname{dist}(z_0, \partial\Omega)$）。

### 典型例子

1. **$f(z) = z^2$**：$u(x, y) = x^2 - y^2$（$\Delta u = 2 - 2 = 0$）；$v(x, y) = 2xy$（$\Delta v = 0$）。
2. **$f(z) = e^z$**：$u(x, y) = e^x \cos y$，$v(x, y) = e^x \sin y$——均调和（直接计算 $\Delta u = (e^x \cos y)''_{xx} + (e^x \cos y)''_{yy} = e^x \cos y - e^x \cos y = 0$）。
3. **$f(z) = 1/z$**（在 $\Omega = \mathbb{C}\setminus\{0\}$ 上全纯）：$u(x, y) = x/(x^2 + y^2)$，$v(x, y) = -y/(x^2 + y^2)$——均调和（在 $\Omega$ 上，$0$ 处除外）。
4. **$\log z$**（单连通分支）：$u = \log|z|$（调和），$v = \arg z$（局部调和）。

## Why — 动机与证明

### 动机

**核心洞察**：复分析中的 Cauchy-Riemann 方程
$$
\frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \qquad \frac{\partial u}{\partial{y}} = -\frac{\partial v}{\partial x}
$$
自动蕴含 $\Delta u = \Delta v = 0$。这是 Cauchy-Riemann 方程的**二阶推论**——一阶条件（Cauchy-Riemann）已编码大量刚性；二阶条件（调和）则自动满足。

意义三重：

1. **复分析 ↔ 位势理论**：每个全纯函数给出两个调和函数（实部、虚部）；反之，**局部**每个调和函数都是某个全纯函数的实部（局部反问题，依赖小圆盘拓扑）。
2. **二维调和分析的简化**：调和函数的平均值性质（Corollary 7.3(ii)）是调和分析的**最基本恒等式**，二维调和函数可由其圆周平均值完全刻画（Poisson 公式）。
3. **最大模原理与 Dirichlet 问题的准备**：$\Delta u = 0$ 加上边界值 ⇒ 调和函数唯一确定（最大值原理）——这是 [[maximum-modulus-principle]] 与 Poisson 核方法的根基。

### 证明思路

**关键步骤**：Cauchy-Riemann 方程 + 二阶求导对易性。

1. **Cauchy-Riemann**：$f$ 全纯 $\Rightarrow$ $u, v \in C^1(\Omega)$ 且
   $$
   u_x = v_y, \qquad u_y = -v_x.
   $$
2. **二阶求导**：因 $f$ 全纯 $\Rightarrow$ $f \in C^\infty$（由 [[cauchy-integral-formula|Cauchy 积分公式]]），$u, v \in C^\infty$。对 Cauchy-Riemann 第一式关于 $y$ 求导，第二式关于 $x$ 求导：
   $$
   u_{xy} = v_{yy}, \qquad u_{yx} = -v_{xx}.
   $$
3. **混合偏导对易**（$u \in C^\infty \Rightarrow u_{xy} = u_{yx}$）：
   $$
   u_{xy} = u_{yx} \;\Longrightarrow\; v_{yy} = -v_{xx} \;\Longrightarrow\; v_{xx} + v_{yy} = 0 \;\Longrightarrow\; \Delta v = 0.
   $$
4. **$u$ 的调和性**：类似地，对 Cauchy-Riemann 第一式关于 $x$ 求导，第二式关于 $y$ 求导：
   $$
   u_{xx} = v_{yx}, \qquad u_{yy} = -v_{xy}.
   $$
   因 $v_{yx} = v_{xy}$（$v \in C^\infty$），两式相加：$u_{xx} + u_{yy} = 0$，即 $\Delta u = 0$。
5. **平均值性质**：取 $f$ 全纯，应用 [[mean-value-property-holomorphic|全纯函数平均值性质]]得
   $$
   f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta.
   $$
   两端取实部（实部算子与积分可交换，由积分线性性保证）：
   $$
   u(z_0) = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta.
   $$
   $v$ 类似。$\blacksquare$

### 详细证明

**Claim 1**（$f$ 全纯 $\Rightarrow$ $u, v \in C^\infty$）. 设 $f$ 在开集 $\Omega$ 上全纯，则 $u, v \in C^\infty(\Omega)$。

*证明*. 由 [[cauchy-integral-formula|Cauchy 积分公式]]（Stein Theorem 4.1），$f$ 在 $\Omega$ 上无穷可微（自动结论——无需假定 $C^k$）；写 $f = u + iv$，$u, v$ 作为实部、虚部分别亦无穷可微。$\blacksquare$

**Claim 2**（$\Delta v = 0$）. 由 Cauchy-Riemann 方程 $u_x = v_y$ 与 $u_y = -v_x$，对前式关于 $y$ 求导、对后式关于 $x$ 求导：
$$
u_{xy} = v_{yy}, \qquad u_{yx} = -v_{xx}.
$$
由 Claim 1（$u \in C^\infty \Rightarrow u_{xy} = u_{yx}$），左端相等，故 $v_{yy} = -v_{xx}$，即 $\Delta v = v_{xx} + v_{yy} = 0$。$\blacksquare$

**Claim 3**（$\Delta u = 0$）. 类似地，对 Cauchy-Riemann 方程 $u_x = v_y$ 关于 $x$ 求导、$u_y = -v_x$ 关于 $y$ 求导：
$$
u_{xx} = v_{yx}, \qquad u_{yy} = -v_{xy}.
$$
由 $v \in C^\infty$（Claim 1）故 $v_{yx} = v_{xy}$，两式相加：$u_{xx} + u_{yy} = 0$，即 $\Delta u = 0$。$\blacksquare$

**Claim 4**（平均值性质）. 对 $f$ 应用 [[mean-value-property-holomorphic|全纯函数平均值性质]]（Stein Cor 7.2；或由 Theorem 7.1 在 $n = 0$ 情形直接读出）：
$$
f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta.
$$
实部算子 $\operatorname{Re}(\cdot)$ 与积分可交换（积分线性性）：
$$
u(z_0) = \operatorname{Re}[f(z_0)] = \operatorname{Re}\left[\frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta\right] = \frac{1}{2\pi}\int_0^{2\pi} \operatorname{Re}[f(z_0 + re^{i\theta})]\,d\theta = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta.
$$
$v$ 类似。$\blacksquare$

> **依赖关系小结**. 本证明依赖链为「$f$ 在 $\Omega$ 全纯 ⇒ [[cauchy-integral-formula|Cauchy 积分公式]] ⇒ $f \in C^\infty$ ⇒ Claim 1（$u, v \in C^\infty$）⇒ Cauchy-Riemann 方程（$u_x = v_y$, $u_y = -v_x$，由 [[holomorphic-function]] 全纯等价刻画）⇒ Claim 2 / Claim 3（$\Delta v = 0$ / $\Delta u = 0$，由混合偏导对易 + Cauchy-Riemann 求导）⇒ Claim 4（平均值性质，由 [[mean-value-property-holomorphic]] 复分析证明或 [[fourier-coeffs-holomorphic-disc|Theorem 7.1]] 在 $n = 0$ 情形直接读出）」。各 Claim 均前向依赖，未引用本页自身；除 Cauchy 积分公式 / Cauchy-Riemann / 混合偏导 Schwarz 定理外无更深依赖。依赖图无环。

## What-if — 反例、等价叙述与推广

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. **Corollary 7.3**（Stein, p.122） | $f$ 全纯 $\Rightarrow$ $u, v$ 调和 | Ch. 3 §7 |
| 2. **Cauchy-Riemann $\Rightarrow$ 调和** | $(u_x = v_y, u_y = -v_x, u \in C^2) \Rightarrow \Delta u = \Delta v = 0$ | 直接推导 |
| 3. **二维调和函数的局部存在性** | $\Omega$ 单连通 + $u$ 调和 $\Rightarrow$ $\exists$ 全纯 $f$ 使 $u = \operatorname{Re}(f)$（局部反问题）| Stein Ch. 4 |
| 4. **调和函数 ⇔ 全纯函数族实部** | 局部上，每个调和函数是某全纯函数的实部 | 同上 |

**等价关系**：叙述 1 ⇔ 2（直接推导）；叙述 3 / 4 是局部反方向——给定调和函数可构造全纯函数。

### 反例 / 边界（条件不可削弱）

1. **$f$ 仅 $C^1$ 但不全纯**：Cauchy-Riemann 不成立，$u, v$ 可能不调和。例如 $f(z) = \overline{z}$（$u = x$, $v = y$）连续但不全纯——$\Delta u = \Delta v = 0$ 在此例**意外**成立（巧合，因 $u, v$ 都是线性的）。但对 $f(z) = |z|^2$（$u = x^2 + y^2$, $\Delta u = 4 \ne 0$），$u$ 不调和——失败。
2. **$f$ 全纯但 $\Omega$ 非开集**（如 $\Omega$ 是闭圆盘边界上一点）：$f$ 在该点的 Cauchy-Riemann 关系不直接适用——平均值性质要求圆盘内闭包。
3. **$u$ 调和但非全纯实部**：例如 $u(x, y) = x$ 调和但局部无全纯原像 $f$ 使 $u = \operatorname{Re}(f)$（除非 $\Omega$ 单连通 + $u$ 的 Cauchy-Riemann 解 $v$ 单值）。复数**原像存在性**取决于 $\Omega$ 的拓扑。
4. **多复变量情形**（$\Omega \subset \mathbb{C}^d$，$d \ge 2$）：全纯函数的实部**仍**调和，但虚部满足更复杂的 Cauchy-Riemann 方程组——结论部分类似但细节不同。

### 推广 / 变体

- **平均值性质是调和的**刻画：对 $\Omega$ 上的 $C^2$ 函数 $u$，$u$ 调和 $\Leftrightarrow$ $u$ 在 $\Omega$ 内每个圆盘上满足平均值性质——这是调和分析的反问题。详见（未来条目）[[harmonic-function]]。
- **调和函数的反问题**：局部上，每个调和函数 $u$ 必是某全纯函数的实部（Stein Ch. 4 Thm 1.1）。这给出调和函数与全纯函数的一一对应（局部）。
- **Poisson 积分公式**：对圆盘上调和函数，$u(z_0 + re^{i\theta}) = \frac{1}{2\pi}\int_0^{2\pi} P_r(\theta - t)\,u(z_0 + e^{it})\,dt$，其中 $P_r$ 为 Poisson 核。详见 [[poisson-summation-formula|Poisson 求和]]「相关习题」节（[[sampling-theorem|采样定理]] Poisson 核版本）。
- **最大值原理**：调和函数 $u$ 在连通开集 $\Omega$ 内取最大值仅当常值。取 $u = |f|^2$ 或 $u = \log|f|$（$f$ 无零点）即得 [[maximum-modulus-principle]]。
- **Dirichlet 问题**：对圆盘上给定边界值的调和函数，Poisson 积分给出唯一解。Stein 在 [[paley-wiener-theorem|Paley-Wiener]] 中用围道积分给出此解。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 调和性（i） | Cauchy-Riemann + 混合偏导对易 | **低** | 仅适用单复变量 |
| 平均值（ii） | 由全函数 MVP（Theorem 7.1 或 Cor 7.2）取实部 | **低** | 复用全纯 MVP 结论 |
| 调和函数反问题 | 单连通域上 Cauchy-Riemann 解 + 单值化 | **中** | 单连通性假设 |
| 多复变量版 | 多变量 Cauchy-Riemann + Laplace 算子的低阶项 | **中** | 不在本卷范围 |

## 相关习题

> 与定理强相关的 exercise/problem（替代证法、特例、反例、证明直接引用）必须在此填充**陈述**（不含证明）；证明仅存在于习题/问题页。

- （未来条目）**Ch.3 Ex.7**（Stein Complex）：$u(x, y) = x^2 - y^2$, $v(x, y) = 2xy$ 调和的直接验证。
- （未来条目）**Ch.3 Ex.8**（Stein Complex）：极坐标下 Laplace 算子的形式与调和函数的角度无关性。

## 应用

- **最大值原理**：调和函数 $u$ 在内部不能取非平凡最大值——给出 [[maximum-modulus-principle]] 的核心工具。
- **Poisson 积分公式**：调和函数在圆盘内的值由边界值的 Poisson 积分给出——Poisson 核方法的根基。
- **Cauchy-Riemann 方程的二阶推论**：调和性质不仅是副产品，而是**与 Cauchy-Riemann 等价**（在局部反问题意义下）。
- **调和分析的二维特殊化**：二维调和函数有更多刚性（如共形映射、全纯函数的实部），与高维 ($d \ge 3$) 调和分析形成对比。
- **Dirichlet 问题**：给定边界值，找圆盘上的调和函数 $u$ 使 $\Delta u = 0$ 且 $u|_{\partial} = f$——由 Poisson 积分公式唯一确定。

## 关联

- 概念：[[holomorphic-function]]（Cauchy-Riemann 与全纯等价）、[[fourier-coeffs-holomorphic-disc|Theorem 7.1]]（负频率消失 + 平均值性质的来源）、[[mean-value-property-holomorphic]]（Corollary 7.2 的独立引理页）
- 定理：[[cauchy-integral-formula]]（$f \in C^\infty$ 的来源）、[[maximum-modulus-principle]]（调和 MVP 的核心应用）、[[schwarz-reflection-principle]]（调和函数在实轴的对称性）
- 引理：[[mean-value-property-holomorphic]]（Corollary 7.2）、[[fourier-coeffs-holomorphic-disc|Theorem 7.1]]（Corollary 7.3 的来源定理）
- 源：[[steinComplexAnalysis|Stein & Shakarchi (2003), 《Complex Analysis》, Ch. 3, Corollary 7.3, p.122]]