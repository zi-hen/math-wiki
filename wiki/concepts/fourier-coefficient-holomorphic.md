---
type: concept
title: 全纯函数的 Fourier 系数（圆周情形）
aliases: [Fourier coefficients of holomorphic functions, Thm 7.1 holomorphic Fourier]
created: 2026-08-13
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, fourier-series, holomorphic-functions]
strength: standard
strength_basis: 条件：$f$ 在 $D_R(z_0)$ 全纯（弱——仅圆盘内全纯，比整函数弱）；结论：Fourier 系数 $a_n = \frac{1}{2\pi r^n}\int_0^{2\pi}f(z_0+re^{i\theta})e^{-in\theta}\,d\theta$，对 $n<0$ 必有 $a_n = 0$，且 $|a_n| \le \rho(r)/r^n$（标准——Fourier 级数与幂级数的精确对应，连接调和分析与复分析）。
---

# 全纯函数的 Fourier 系数（圆周情形）

> **工作空间**：圆群约定 $\mathbb{T}$ 上的 Fourier 系数（Stein Ch. 3 §7，核 $e^{-in\theta}$；与 $\mathbb{R}$ 上的 Stein Fourier 约定 $e^{-2\pi i\xi x}$ 不同）；全纯函数定义于 $\mathbb{C}$ 中以 $z_0$ 为中心、$R$ 为半径的圆盘 $D_R(z_0)$。〔非 Stein 约定：此处 Fourier 核为 $e^{-in\theta}$（圆周情形），与 Book I/II 的 $e^{-2\pi i \xi x}$ 不同；保留 Stein 原书 Ch. 3 Thm 7.1 的圆周参数化形式〕

## What — 定义与基本事实

#### 定义

设 $f$ 在以 $z_0$ 为中心、$R$ 为半径的圆盘 $D_R(z_0)$ 上全纯。则 $f$ 在 $z_0$ 处有幂级数展开 $f(z) = \sum_{n=0}^{\infty} a_n (z - z_0)^n$（对 $|z - z_0| < R$）。对 $0 < r < R$，令 $z = z_0 + re^{i\theta}$，则
$$
f(z_0 + re^{i\theta}) = \sum_{n=0}^{\infty} a_n r^n e^{in\theta}.
$$
两边乘 $e^{-in\theta}$ 并对 $\theta \in [0, 2\pi]$ 积分，对 $n \ge 0$ 与 $n < 0$ 的 Fourier 系数分别得到
$$
a_n = \frac{1}{2\pi r^n}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-in\theta}\,d\theta, \quad n \ge 0, \qquad
0 = \frac{1}{2\pi r^n}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-in\theta}\,d\theta, \quad n < 0.
$$

#### Theorem 7.1（Stein, p.120–122）

> 设 $f$ 在 $D_R(z_0)$ 上全纯。对 $0 < r < R$，$f$ 的 Fourier 系数（在圆周 $|z - z_0| = r$ 上关于核 $e^{-in\theta}$ 展开）为
> $$
> a_n = \frac{1}{2\pi r^n}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-in\theta}\,d\theta, \quad n \ge 0,
> $$
> 当 $n < 0$ 时右侧积分等于 $0$。

#### Corollary 7.2（Stein, p.121）— 平均值性质

> 在同条件下，$f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta$。

#### 基本性质

1. **系数估计**：设 $\rho(r) = \max_{0 \le \theta \le 2\pi}|f(z_0 + re^{i\theta})|$，则
   $$
   |a_n| \le \frac{\rho(r)}{r^n}, \quad n \ge 0.
   $$
   这由 $|a_n| \le \frac{1}{2\pi r^n}\int_0^{2\pi}|f|\,|e^{-in\theta}|\,d\theta = \frac{1}{2\pi r^n}\int_0^{2\pi}|f|\,d\theta \le \frac{\rho(r)}{r^n}$。
2. **$n < 0$ 消失的原因**：$f$ 在圆盘内全纯 $\Rightarrow$ 幂级数展开系数 $a_n = 0$ 对 $n < 0$。Fourier 系数 $c_n = \frac{1}{2\pi r^n}\int f e^{-in\theta}\,d\theta$ 与 $a_n$ 的关系：$c_n = a_n$（$n \ge 0$），$c_n = 0$（$n < 0$）。这是「圆盘全纯 $\Rightarrow$ 负频率消失」的精确刻画。
3. **衰减条件**：若 $\rho(r)/r^n \to 0$ 当 $r \to R^-$，则由 $|a_n| \le \rho(r)/r^n$ 在 $r \to R^-$ 取极限得 $a_n = 0$。此条件等价于 $f$ 的展开在 $|z - z_0| = R$ 上可延拓（实际上意味着 $f$ 在 $D_R$ 内有比 $R$ 更大的收敛半径）。

#### 典型例子

1. **$f(z) = z^n$**（$z_0 = 0$，$R = \infty$）：$f(z) = z^n$ 即自身为单项幂级数 $\Rightarrow$ $a_n = 1$，其余 $a_k = 0$。Fourier 系数 $c_n = 1$、其余 $0$——直接验证。
2. **$f(z) = e^z$**（$z_0 = 0$，$R = \infty$）：$a_n = 1/n!$，$|a_n| \le 1/r^n \cdot e^r$——符合估计。
3. **$f(z) = (z - z_0)^n$ 沿 $z_0$**：$a_n = 1$，$|a_n| = 1 = (1/r^n) \cdot r^n$——边界情形 $\rho(r)/r^n = 1$。
4. **$f(z) = 1/(1 - (z-z_0)/a)$**（$|a| < R$，几何级数）：$a_n = 1/a^n$，$|a_n| \le \rho(r)/r^n$ 其中 $\rho(r) = 1/(1 - r/|a|)$。

## Why — 动机与直观

### 为什么引入全纯函数的 Fourier 系数？

Fourier 级数原本是「在圆周上对函数正交展开」的实分析工具——在 $\theta \in [-\pi, \pi]$ 上写 $f(e^{i\theta}) = \sum_n c_n e^{in\theta}$。Stein Theorem 7.1 给出一个根本观察：**若 $f$ 在圆盘内全纯，则 Fourier 系数在 $n < 0$ 时必为零**，且 $c_n$ 等于幂级数展开系数 $a_n$。

这个观察有三重意义：

1. **Fourier 级数收敛的充分条件**：在全纯情形，负频率 Fourier 系数自动为零，意味着 Fourier 级数部分和 $S_N(f)(z_0 + re^{i\theta})$ 在圆周上一致收敛到 $f$（Dirichlet 核的「坏行为」被全纯性消除）。
2. **Fourier 系数与 Taylor 系数的等同**：此等同是复分析与调和分析的桥梁——全纯函数的实部与虚部调和（Corollary 7.3），故调和函数的 Fourier 系数有同样的结构。
3. **解析延拓的频率刻画**：若 $f$ 在圆盘外可延拓（半径 $> R$），则 $a_n$ 的衰减率刻画延拓的范围；反之 $\rho(r)/r^n \to 0$ 蕴含 $a_n = 0$。

### 直观解释

把 Fourier 系数 $c_n$ 看作「函数 $f$ 与 $e^{in\theta}$ 的相关性」。全纯条件排除「来自圆盘外的振荡」——所有振荡必来自圆盘内的幂级数展开，即 $\theta$ 依赖仅通过 $e^{i\theta}$ 的正幂出现。负幂 $e^{-in\theta}$（$n > 0$）对应「来自圆盘外的反射」，全纯性禁止这种反射——这给出 $c_n = 0$ 对 $n < 0$。

## What-if — 反例与边界

### 反例（条件不可削弱）

1. **$f$ 仅连续但非全纯**：Fourier 系数 $c_n$ 对 $n < 0$ 一般不为零。例如 $f(z_0 + re^{i\theta}) = e^{-i\theta}$ 在 $z = z_0 + r$ 处对应常数函数 $1/r$——其 Fourier 系数 $c_{-1} = 1/r \ne 0$，但函数不延拓到 $z_0$ 邻域外的全纯。
2. **$f$ 仅在圆周上定义**：若 $f$ 仅在 $|z - z_0| = r$ 上给定（不在圆盘内），则无 Fourier 系数结构保证。Fourier 系数可任意。
3. **$f$ 在圆盘外有极点**：若 $f$ 在 $D_R(z_0)$ 全纯但在 $|z - z_0| = R$ 边界外有奇点，则 Fourier 系数满足 $|a_n| \le \rho(r)/r^n$ 但 $\rho(r)/r^n \not\to 0$ 当 $r \to R^-$，此时 $a_n \ne 0$ 对某些 $n \ge 0$。

### 等价叙述

| 叙述 | 形式 | 适用 |
|------|------|------|
| 1. Stein Theorem 7.1（圆周 Fourier） | $a_n = \frac{1}{2\pi r^n}\int_0^{2\pi}f e^{-in\theta}\,d\theta$，$n < 0$ 为 $0$ | $D_R(z_0)$ 全纯 |
| 2. 幂级数展开 | $f(z) = \sum_{n\ge 0}a_n(z-z_0)^n$ | 同 |
| 3. 平均值性质（Cor 7.2） | $f(z_0) = \frac{1}{2\pi}\int_0^{2\pi}f(z_0+re^{i\theta})\,d\theta$ | $n = 0$ 情形 |
| 4. 调和版本（Cor 7.3） | $u(z_0) = \frac{1}{2\pi}\int_0^{2\pi}u(z_0+re^{i\theta})\,d\theta$，$u = \operatorname{Re}(f)$ | 同 |

### 推广 / 变体

- **$L^2$ 圆周 Fourier**：若 $f$ 在圆周上平方可积（[[lp-space|$L^p$ 空间]]框架），则 Fourier 系数 $c_n = \frac{1}{2\pi}\int f e^{-in\theta}\,d\theta$ 可任意（无全纯约束）。Parseval 恒等式 $\sum|c_n|^2 = \frac{1}{2\pi}\int|f|^2$ 给出 $L^2$ 框架。
- **$\mathbb{R}$ 上的 Fourier 反演**：$\mathbb{R}$ 上 Fourier 变换 $\hat f(\xi) = \int f(x)e^{-2\pi ix\xi}\,dx$ 无「负频率消失」——这是圆周 vs 直线的根本差异。Stein Ch. 3 Remark (p.146) 显式指出此对比：「here ... the Fourier transform vanishes when $\xi < 0$, and in the earlier case, the Fourier coefficients vanish when $n < 0$」（指 Thm 3.5 上半平面全纯 ↔ $\hat f$ 支集 $[0, \infty)$）。

## 相关习题

> 与定理强相关的 exercise/problem(替代证法、特例、反例、证明直接引用)必须在此填充**陈述**(不含证明);证明仅存在于习题/问题页。

- [[ch3-ex18-slow-decay|Ch.3 Ex.18]]：与 Fourier 级数缓衰减相关的练习

## 关联

- 概念：[[holomorphic-function]]、[[mean-value-property-holomorphic]]、[[fourier-coefficient]]、[[fourier-series]]
- 定理：[[cauchy-integral-formula]]（Cauchy 公式直接给出此结果）
- 引理：[[residue-by-taylor-coeff]]（Laurent 系数 $a_{-1}$ 与圆周 Fourier 系数的对应）
- 源：[[steinComplexAnalysis]]（Ch. 3, p.120–122）