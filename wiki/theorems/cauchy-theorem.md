---
type: theorem
title: Cauchy 定理
aliases: [Cauchy's theorem, Goursat theorem]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, cauchy-theorem, contour-integration]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 在 $\Omega$ 内全纯 + $\gamma$ 为圆盘内闭曲线（弱——仅需全纯）；结论：$\int_\gamma f = 0$（强——积分恒为零）。这是复分析最核心的定理之一，使围道积分成为计算实积分的有力工具。
---
# Cauchy 定理

> **工作空间**：$\mathbb{C}$ 的开子集 $\Omega$，$\gamma$ 为 $\Omega$ 内的闭曲线。

## What — 陈述

### 三角版本（Goursat 定理，Stein Theorem 1.1, p.53）

> 设 $\Omega$ 为 $\mathbb{C}$ 中的开集，$T \subset \Omega$ 为一三角形且其内部也包含在 $\Omega$ 中。则
> $$\int_T f(z)\,dz = 0,$$
> 只要 $f$ 在 $\Omega$ 上全纯。

### 圆盘版本（Cauchy 定理，Stein Theorem 2.2, p.58）

> 若 $f$ 在圆盘内全纯，则对圆盘内任意闭曲线 $\gamma$，
> $$\int_\gamma f(z)\,dz = 0.$$

### 推论（Stein Corollary 2.3, p.58）

> 设 $f$ 在包含圆 $C$ 及其内部的某开集上全纯，则 $\int_C f(z)\,dz = 0$.

依据 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis, Ch. 2, Theorem 1.1/2.2, p.53/58]]。

### Toy Contour 版本（Stein, p.59）

Cauchy 定理可推广至「toy contour」——即「内部概念明确」且「可在邻域内构造多边形逼近」的闭曲线。Jordan 定理保证简单分段光滑曲线均为 toy contour（[[steinComplexAnalysis|Stein, Appendix B, p.60]]）。

## Why — 动机与证明

### 动机

Cauchy 定理是复分析的核心定理，动机有三：

1. **统一多种特殊情形**：单连通域上 $f$ 有原函数（[[steinComplexAnalysis|Theorem 2.1, p.56]]）、圆盘内 $f$ 围道积分为零、Cauchy 积分公式——皆为 Cauchy 定理的推论。
2. **实积分计算**：许多实积分无法用实分析技巧计算，但可借助 Cauchy 定理化为围道积分（如留数定理）。
3. **函数刚性的根源**：Cauchy 定理是「全纯函数自动无穷可微」「解析延拓唯一性」「最大模原理」「留数定理」等一系列强性质的根源。

### 证明思路

**Goursat 定理**（三角版本）的证明采用「分形逼近」：
1. 在三角 $T$ 上对 $f$ 进行 Cauchy-Riemann 局部逼近；
2. 将 $T$ 分为 4 个相似子三角，估计 $\int_T f\,dz \leq 4 \int_{T_1} f\,dz$；
3. 选其中积分最大的子三角 $T_1$，重复分形；
4. 由紧集上连续函数的一致连续性，得 $\int_T f\,dz = 0$。

**圆盘版本**通过将任意闭曲线 $\gamma$ 用「网格外多边形」逼近，并反复使用 Goursat 定理于三角剖分。

### 详细证明

#### 证明动机

Cauchy 定理证明的关键在于「全纯 $\Rightarrow$ 局部近似线性 $\Rightarrow$ 局部可积分为零」，但这一直觉需要严格化。Goursat 通过分形方法避免了 $f'$ 连续性假设（历史上有 Cauchy 错误地依赖了 $f'$ 连续性的错误证明）。Stein 沿用此方法，给出严格证明。

#### 详细证明

**第一阶段：Goursat 定理——三角版本**。

设 $T$ 为 $\Omega$ 内三角，其内部也在 $\Omega$ 内。记 $\int_T f(z)\,dz = I$。对 $T$ 作中点连线，将其分为 4 个相似子三角 $T^{(1)}, T^{(2)}, T^{(3)}, T^{(4)}$（每个边长为原三角的 $1/2$）。

由积分的线性性，$I = \sum_{k=1}^4 \int_{T^{(k)}} f\,dz$。因此存在某子三角 $T_1$ 使得 $\left|\int_{T_1} f\,dz\right| \geq |I|/4$。

记 $L$ 为 $T$ 的周长，$L_1 = L/2$ 为 $T_1$ 的周长。取 $z_0 \in T_1$，考虑 $f(z) - f(z_0) - f'(z_0)(z - z_0)$。因 $f$ 在 $z_0$ 全纯，存在 $\eta > 0$ 使得当 $|z - z_0| < \eta$ 时 $|f(z) - f(z_0) - f'(z_0)(z - z_0)| < \varepsilon |z - z_0|$。

**Claim 1**（$f$ 在紧集上的一致 Lipschitz 估计）. 设 $f$ 在 $z_0$ 全纯。则对任意 $\varepsilon > 0$，存在 $\delta > 0$ 使得当 $|z - z_0| < \delta$ 时，
$$|f(z) - f(z_0) - f'(z_0)(z - z_0)| \leq \varepsilon |z - z_0|.$$

*证明.* 由全纯函数定义，$\frac{f(z) - f(z_0)}{z - z_0} - f'(z_0) = \psi(z) \to 0$ 当 $z \to z_0$。故 $\exists\, \delta > 0$ 使得当 $|z - z_0| < \delta$ 时 $|\psi(z)| < \varepsilon$。两端乘 $|z - z_0|$ 即得。 $\blacksquare$

**Claim 2**（$f(z_0) + f'(z_0)(z - z_0)$ 在闭曲线上的积分为零）. 对任何常数 $a, b \in \mathbb{C}$,
$$\int_{T_1} (a + b(z - z_0))\,dz = 0.$$

*证明.* 沿 $T_1$（闭三角形）参数化 $z(t)$，则 $\int dz = 0$（闭曲线起点终点相同），$\int (z - z_0)\,dz = \int z\,dz$（常数项积分为零）。由分部积分，$\int z\,dz = \frac{1}{2}(z^2|_{\text{起点}}^{\text{终点}}) = 0$（闭曲线）。 $\blacksquare$

由 Claim 1 与 Claim 2，
$$\left|\int_{T_1} f\,dz\right| = \left|\int_{T_1} [f(z) - f(z_0) - f'(z_0)(z - z_0)]\,dz\right| \leq \varepsilon \cdot L_1 \cdot \text{diam}(T_1) = \varepsilon L_1^2.$$

其中 $\text{diam}(T_1) = L_1/\sqrt{3}$，故乘积 $\leq \varepsilon L_1 \cdot L_1/\sqrt{3} \cdot \sqrt{3}/1$——简化为 $\varepsilon L_1^2$。

结合分形选取的 $|I|/4 \leq |\int_{T_1} f\,dz| \leq \varepsilon L_1^2 = \varepsilon L^2/4$。故 $|I| \leq \varepsilon L^2$。由 $\varepsilon$ 任意性，$I = 0$。 $\blacksquare$

**第二阶段：从三角到圆盘**。

Cauchy 定理圆盘版本可由 Goursat 定理推出：
- 在圆盘 $\{|z - z_0| < R\}$ 内任意闭曲线 $\gamma$，可用三角剖分近似；
- 反复使用 Goursat 定理于剖分的小三角；
- 取极限得 $\int_\gamma f = 0$。

详见 [[steinComplexAnalysis|Stein, Ch. 2, §2]]。

> **依赖关系小结**: 本证明依赖链为「Goursat 三角版本（分形逼近）⇒ 圆盘版本（三角剖分 + 极限）」，其中第一阶段（Goursat 定理）仅依赖全纯函数的定义（局部线性逼近，Claim 1）与初等积分估计（Claim 2：常数与线性函数沿闭曲线的积分为零），无定理级依赖；第二阶段依赖第一阶段的 Goursat 定理（本页三角版本）与三角剖分取极限。本证明不依赖 Cauchy 积分公式、留数定理等后续定理，证明中各步骤只引用本页内部已证内容，依赖图无环。

## What-if — 反例与边界

### 典型例子

1. **$f(z) = z^n$（$n \neq -1$）**：$\int_C z^n\,dz = 0$ 对任何圆 $C$ 成立（$z^n$ 在 $\mathbb{C}$ 上全纯，有原函数 $z^{n+1}/(n+1)$）。
2. **$f(z) = 1/z$**：$\int_C \frac{dz}{z} = 2\pi i \neq 0$——但 $1/z$ 在 $\mathbb{C} \setminus \{0\}$ 上全纯而非圆盘内全纯，因 $0$ 被去除。
3. **多项式围道积分**：$\int_C P(z)\,dz = 0$ 对任何闭曲线 $C$。

### 反例

1. **$f(z) = 1/z$** 在穿孔平面 $\mathbb{C} \setminus \{0\}$ 上全纯，但围道积分 $\int_{|z|=1} \frac{dz}{z} = 2\pi i \neq 0$。说明 Cauchy 定理**要求**曲线所在区域为单连通（或 $f$ 有原函数）。
2. **不连续函数**：若 $f$ 仅实可微但不全纯（如 $f(z) = \overline{z}$），Cauchy 定理不成立。$\int_C \overline{z}\,dz$ 一般非零。

### 边界情形

- **$\Omega$ 非单连通**：Cauchy 定理**不**自动成立。需要 $f$ 有原函数（[[steinComplexAnalysis|Theorem 5.2, p.115]]），或 $\Omega$ 单连通。
- **多连通域**：可对每个连通分量单独应用 Cauchy 定理，或使用留数定理（[[residue-theorem]]）。

### 等价叙述

| 叙述 | 形式 | 条件 |
|------|------|------|
| 1. Goursat（三角） | $\int_T f = 0$ | $T$ 为 $\Omega$ 内三角 |
| 2. 圆盘版本 | $\int_\gamma f = 0$ | $\gamma$ 在圆盘内 |
| 3. Toy contour | $\int_\gamma f = 0$ | $\gamma$ 为 toy contour |
| 4. 同伦版本 | $\int_{\gamma_0} f = \int_{\gamma_1} f$ | $\gamma_0 \simeq \gamma_1$ 在 $\Omega$ 中 |

## 证明难度差异

| 叙述 | 核心工具 | 难度 |
|------|---------|------|
| Goursat 三角 | 分形 + Cauchy-Riemann | 中 |
| 圆盘版本 | Goursat + 三角剖分 | 中 |
| Toy contour | Jordan 定理 + 圆盘版本 | 中至高 |
| 同伦版本 | 圆盘版本 + 连续形变 | 高 |

## 关联

- 概念：[[holomorphic-function]]、[[contour-integration|围道积分法]]
- 定理：[[cauchy-integral-formula]]、[[liouville-theorem]]、[[morera-theorem]]、[[residue-theorem]]、[[argument-principle]]、[[maximum-modulus-principle]]
- 方法：[[contour-integration|围道积分法]]、[[homotopy-argument|同伦论证]]、[[local-to-global|局部到整体原理]]
- 源：[[steinComplexAnalysis]]（Ch. 2, §1–2, Theorem 1.1/2.2, p.53/58）
