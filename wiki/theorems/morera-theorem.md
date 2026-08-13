---
type: theorem
title: Morera 定理
aliases: [Morera's theorem]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, cauchy-theorem]
strength: standard
strength_basis: 条件：$f$ 连续 + $\int_T f = 0$ 对所有三角 $T \subset D$（弱——比 Cauchy 定理弱）；结论：$f$ 全纯（强——恢复全纯性）。Morera 定理是 Cauchy 定理的逆命题。
---
# Morera 定理

> **工作空间**：$\mathbb{C}$ 的开集 $\Omega$，圆盘 $D \subset \Omega$。

## What — 陈述

### Theorem 5.1（Stein, p.72）

> 设 $f$ 是开圆盘 $D$ 中的连续函数。若对 $D$ 中任何三角 $T$ 都有
> $$\int_T f(z)\,dz = 0,$$
> 则 $f$ 在 $D$ 上全纯。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, Theorem 5.1, p.72]]。

### 推论：Weierstrass 一致收敛定理（Theorem 5.2, p.72）

> 若 $\{f_n\}$ 是 $\Omega$ 上全纯函数序列，在 $\Omega$ 的每个紧子集上一致收敛到 $f$，则 $f$ 在 $\Omega$ 上全纯。

证明：$f$ 作为一致极限连续，且 $\int_T f = \lim \int_T f_n = 0$。由 Morera 定理，$f$ 全纯。

## Why — 动机与证明

### 动机

Morera 定理是 [[cauchy-theorem|Cauchy 定理]]的逆命题：

- **Cauchy 定理**：$f$ 全纯 $\Rightarrow$ $\int_T f = 0$ 对所有三角 $T$；
- **Morera 定理**：$f$ 连续 + $\int_T f = 0$ 对所有三角 $\Rightarrow$ $f$ 全纯。

Morera 定理的核心价值在于：
1. **构造全纯函数**：可用 Morera 定理证明特定级数或积分定义的全纯性（如 Weierstrass 收敛定理、参数积分 $f(z) = \int_0^1 F(z, s)\,ds$ 的全纯性，Stein Theorem 5.4, p.75）。
2. **Cauchy 定理的「逆向」验证**：将 Cauchy 定理「积分为零 $\Leftrightarrow$ 全纯」的两端闭合。

### 证明思路

1. **构造原函数 $F$**：对 $z \in D$，取 $z_0 \in D$，定义 $F(z) = \int_{[z_0, z]} f(\zeta)\,d\zeta$（沿任意路径积分）。由 $\int_T f = 0$（三角闭曲线积分为零），积分与路径无关，故 $F$ 良定义。
2. **$F$ 在 $D$ 上连续可微**：$\frac{F(z + h) - F(z)}{h} - f(z) = \int_0^1 [f(z + th) - f(z)]\,dt \to 0$（$h \to 0$，$f$ 连续）。故 $F'(z) = f(z)$。
3. **$f$ 全纯**：$F$ 是 $D$ 上的可微函数（事实上无穷可微），其导数 $f$ 自动全纯（因 $F$ 在局部可积分为解析函数——更准确，$F$ 在小圆盘上有原函数，且 $F$ 本身有原函数 $G$ 使得 $G'' = F$ 等——具体地说，$F$ 满足 Cauchy-Riemann 方程自动）。

### 详细证明

#### 证明动机

关键观察：若 $f$ 在三角闭曲线上积分为零，则路径积分与路径无关，可定义 $f$ 的「原函数」$F$。一旦 $F$ 可微且 $F' = f$，问题化为证明「$f$ 是某可微函数的导数 $\Rightarrow$ $f$ 全纯」。

实际上更简单的论证：因 $f$ 连续，且 $\int_T f = 0$，由 Goursat 思路可证明 $f$ 满足 Cauchy-Riemann 方程。

#### 详细证明

**第一阶段：构造原函数**。

设 $z_0 \in D$ 为任意固定点。对任意 $z \in D$，定义
$$
F(z) = \int_{\gamma_z} f(\zeta)\,d\zeta,
$$
其中 $\gamma_z$ 为从 $z_0$ 到 $z$ 的任意分段光滑路径。

**Claim 1**（$F$ 与路径无关）. 设 $\gamma_0, \gamma_1$ 为 $D$ 中两条从 $z_0$ 到 $z$ 的分段光滑路径。则 $\int_{\gamma_0} f = \int_{\gamma_1} f$.

*证明.* 设 $\Gamma$ 为 $\gamma_0$ 与 $\gamma_1^-$（反向 $\gamma_1$）组成的闭曲线。将 $\Gamma$ 内部三角剖分，每个三角 $T_k$ 满足 $\int_{T_k} f = 0$。由积分的线性性，$\int_\Gamma f = \sum \int_{T_k} f = 0$，故 $\int_{\gamma_0} f - \int_{\gamma_1} f = 0$。 $\blacksquare$

**第二阶段：$F$ 可微且 $F' = f$**。

固定 $z \in D$，取充分小 $h$ 使 $z + h \in D$。则
$$
F(z + h) - F(z) = \int_{[z, z+h]} f(\zeta)\,d\zeta,
$$
其中 $[z, z+h]$ 为直线段。参数化 $\zeta = z + th$（$t \in [0,1]$），
$$
F(z + h) - F(z) = \int_0^1 f(z + th) \cdot h\,dt.
$$

故
$$
\frac{F(z + h) - F(z)}{h} - f(z) = \int_0^1 [f(z + th) - f(z)]\,dt.
$$

因 $f$ 连续，当 $h \to 0$ 时 $f(z + th) \to f(z)$ 一致（$t \in [0,1]$ 紧），故右端 $\to 0$。得 $F'(z) = f(z)$。

**第三阶段：$f$ 全纯**。

$F$ 是 $D$ 上的实可微函数（其导数 $f$ 连续）。由 [[cauchy-theorem|Cauchy 定理]]：若 $G$ 在 $D$ 上有原函数，则 $G$ 在 $D$ 上全纯。我们已知 $F$ 是 $f$ 的原函数，但 $F$ 本身**不直接**满足 Cauchy-Riemann 方程。

更直接的论证：$F$ 在小圆盘内有原函数 $G$（因 $F$ 路径积分与路径无关），由 Cauchy 定理 $F$ 在该小圆盘内全纯（$F$ 是某全纯函数 $G$ 的导数）。由 [[holomorphic-function|全纯函数自动无穷可微]]（这是 [[lp-space|$L^1$ 空间]] 上 Fourier 分析的对偶性质：原函数存在 $\Rightarrow$ 无穷光滑），$F \in C^\infty(D)$。特别地，$f = F' \in C^1(D)$，且 $f$ 满足 Cauchy-Riemann 方程（这是全纯函数的标准刻画）。

由 [[steinComplexAnalysis|Stein, p.32, Theorem 2.4]]：$f \in C^1$ 且满足 Cauchy-Riemann $\Rightarrow$ $f$ 全纯。 $\blacksquare$

## What-if — 反例与边界

### 典型例子

1. **Weierstrass 一致收敛**：$e^z = \sum_{n=0}^\infty z^n/n!$——部分和 $S_N(z)$ 均为多项式（全纯），在紧集上一致收敛到 $e^z$。由 Weierstrass 定理 + Morera，$e^z$ 全纯。
2. **参数积分**：$f(z) = \int_0^1 F(z, s)\,ds$，若 $F$ 满足 (i) 对每个 $s$, $F(\cdot, s)$ 全纯；(ii) $F$ 联合连续——则 $f$ 全纯（Stein Theorem 5.4, p.75）。

### 反例

1. **去掉连续性**：若 $f$ 仅 Lebesgue 可积且 $\int_T f = 0$ 对所有三角 $T$，不能推出 $f$ 全纯（须额外假设 $f \in C^0$）。
2. **$f(z) = \overline{z}$**：连续但 $\int_T \overline{z}\,dz \neq 0$ 对某些三角 $T$。Morera 条件不满足。

### 边界情形

- **$D$ 非圆盘**：Morera 定理可推广至任意开凸集（甚至单连通开集）。Stein 表述限制为圆盘以简化证明。
- **$f \in L^1$ 推广**：将 $f$ 连续性减弱为 $L^1_{loc}$ + Morera 积分条件，结论仍成立（这是 Vitali 收敛定理的核心）。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 基本版本（Stein Theorem 5.1） | 连续 + $\int_T f = 0 \Rightarrow$ 全纯 | 开圆盘 |
| 2. Weierstrass 一致收敛 | 全纯函数的一致极限全纯 | 任意 $\Omega$ |
| 3. 参数积分（Stein Theorem 5.4） | $f(z) = \int F(z, s)\,ds$ 全纯 | 联合连续 |
| 4. 高阶导数一致收敛 | 高阶导数一致收敛（Stein Theorem 5.3, p.73） | 任意 $\Omega$ |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 基本版本（圆盘） | 原函数 + Cauchy-Riemann | 中 |
| Weierstrass 一致收敛 | Morera + 一致收敛 | 低 |
| 参数积分 | Morera + Fubini | 中 |

## 关联

- 概念：[[holomorphic-function]]、[[contour-integration|围道积分法]]
- 定理：[[cauchy-theorem]]（前置）、[[cauchy-integral-formula]]、[[schwarz-reflection-principle]]
- 方法：[[amplification|增强技巧]]（参数化全纯）、[[local-to-global|局部到整体原理]]
- 应用：Weierstrass 收敛定理（Stein Theorem 5.2, p.72）、参数积分定理（Stein Theorem 5.4）
- 源：[[steinComplexAnalysis]]（Ch. 2, Theorem 5.1, p.72）
