---
type: theorem
title: Schwarz 反射原理
aliases: [Schwarz reflection principle]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, analytic-continuation]
strength: standard
strength_basis: 条件：$f$ 在 $\Omega^+$ 全纯 + 连续延拓至 $I$ + $f$ 在 $I$ 上取实值（弱——只需边界上部分信息）；结论：$f$ 可全纯延拓至整个 $\Omega$（强——从半平面延拓到全平面）。
---
# Schwarz 反射原理

> **工作空间**：$\mathbb{C}$ 中由实轴段 $I$ 分割的对称区域 $\Omega = \Omega^+ \cup I \cup \Omega^-$。

## What — 陈述

### 对称原理（Symmetry Principle, Stein Theorem 5.5, p.77）

> 设 $f^+$ 与 $f^-$ 分别在 $\Omega^+$ 与 $\Omega^-$ 上全纯，连续延拓至 $I$，且 $f^+(x) = f^-(x)$ 对所有 $x \in I$。则
> $$F(z) = \begin{cases} f^+(z), & z \in \Omega^+, \\ f^+(z) = f^-(z), & z \in I, \\ f^-(z), & z \in \Omega^- \end{cases}$$
> 在 $\Omega$ 上全纯。

### Schwarz 反射原理（Stein Theorem 5.6, p.79）

> 设 $f$ 在 $\Omega^+$ 上全纯，连续延拓至 $I$，且 $f$ 在 $I$ 上取实值。则存在 $F$ 在整个 $\Omega$ 上全纯，使得 $F = f$ 在 $\Omega^+$ 上。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, Theorem 5.5–5.6, p.77–79]]。

## Why — 动机与证明

### 动机

复分析的延拓问题：何时可将一个区域上的全纯函数延拓至更大的区域？Schwarz 反射原理回答了「实轴反射」这一典型情形。

1. **从半平面到全平面**：若 $f$ 在上半平面 $\Omega^+$ 全纯且在边界实轴段 $I$ 上取实值，则 $f$ 可反射延拓：$F(\bar{z}) = \overline{F(z)}$。
2. **共形映射构造**：Schwarz-Christoffel 公式（Stein, Ch. 8）依赖 Schwarz 反射原理将上半平面映射到多边形内部。
3. **调和函数理论**：Schwarz 反射原理是调和函数 Dirichlet 问题解的唯一性基础。

### 证明思路（Stein Theorem 5.6）

1. **定义 $F$ 在 $\Omega^-$ 上的延拓**：对 $z \in \Omega^-$，定义 $F(z) = \overline{f(\bar{z})}$。
2. **$F$ 在 $\Omega^-$ 上全纯**：由 $f$ 在 $\Omega^+$ 上全纯及 $\overline{\cdot}$ 的全纯性（在 $\bar{\Omega}^+$ 上）推出。
3. **$F$ 在 $I$ 上的行为**：$I \subset \mathbb{R}$ 上，$z = \bar{z}$，故 $F(z) = \overline{f(z)} = f(z)$（因 $f$ 在 $I$ 上取实值）。
4. **$F$ 在整个 $\Omega$ 上连续**：因 $f$ 连续延拓至 $I$。
5. **Morera 定理验证**：对 $\Omega$ 内任意三角 $T$，分两种情形：
   - $T$ 完全在 $\Omega^+$ 或 $\Omega^-$：由 $F$ 在该区域全纯，$\int_T F = 0$。
   - $T$ 与 $I$ 相交：可微扰 $T$ 至 $T'$ 使 $T'$ 完全在 $\Omega^+$ 或 $\Omega^-$（无 $I$），且 $\int_{T'} F \to \int_T F$。由前一种情形 $\int_{T'} F = 0$，故 $\int_T F = 0$。
6. **由 Morera 定理（[[morera-theorem]]），$F$ 在 $\Omega$ 上全纯**。

### 详细证明

#### 证明动机

Schwarz 反射原理的动机是「复共轭反射」保持全纯性。关键观察：对 $z \in \Omega^-$，$\bar{z} \in \Omega^+$（对称区域性质），故 $f(\bar{z})$ 良定义。复合 $\overline{f(\bar{z})}$ 在 $\Omega^-$ 上全纯，因 $\bar{z} \mapsto f(\bar{z})$ 全纯，$w \mapsto \overline{w}$ 也全纯。

证明中用 Morera 定理替代直接验证 Cauchy-Riemann，是因为三角可被微扰避开 $I$——这是处理边界问题的标准技巧。

#### 详细证明

**第一阶段：定义 $F$**。

设 $\Omega = \Omega^+ \cup I \cup \Omega^-$（$\Omega^\pm$ 为 $I$ 两侧的开区域）。定义
$$
F(z) = \begin{cases} f(z), & z \in \Omega^+ \cup I, \\ \overline{f(\bar{z})}, & z \in \Omega^-. \end{cases}
$$

**第二阶段：$F$ 在 $\Omega^-$ 上全纯**。

对 $z_0 \in \Omega^-$，$\bar{z}_0 \in \Omega^+$。$f$ 在 $\bar{z}_0$ 全纯，故 $\exists\, \delta > 0$ 使 $f$ 在 $B(\bar{z}_0, \delta) \subset \Omega^+$ 上全纯。$F(z) = \overline{f(\bar{z})}$ 在 $B(z_0, \delta)$ 上有定义，且
$$
F'(z_0) = \lim_{h \to 0} \frac{F(z_0 + h) - F(z_0)}{h} = \lim_{h \to 0} \frac{\overline{f(\bar{z}_0 + \bar{h})} - \overline{f(\bar{z}_0)}}{h}.
$$

注意 $\overline{f(\bar{z}_0 + \bar{h})} - \overline{f(\bar{z}_0)} = \overline{f(\bar{z}_0 + \bar{h}) - f(\bar{z}_0)}$，而 $\bar{h}/h = e^{-2i\arg h}$。形式上
$$
F'(z_0) = \overline{\lim_{\bar{h} \to 0} \frac{f(\bar{z}_0 + \bar{h}) - f(\bar{z}_0)}{\bar{h}}} = \overline{f'(\bar{z}_0)}.
$$

更严格的论证：因 $z \mapsto \bar{z}$ 和 $w \mapsto \overline{w}$ 均全纯（在 $\Omega^+$ 与 $\mathbb{C}$ 上），复合保持全纯性。故 $F \in \mathcal{O}(\Omega^-)$。

**第三阶段：$F$ 在 $I$ 上行为一致**。

对 $x \in I$，$F(x) = f(x)$（直接定义）。由 $f(x) \in \mathbb{R}$，
$$
\lim_{z \to x, z \in \Omega^-} F(z) = \lim_{z \to x} \overline{f(\bar{z})} = \overline{f(x)} = f(x) = F(x).
$$

故 $F$ 在 $I$ 上连续。

**第四阶段：Morera 验证**。

由 [[morera-theorem|Morera 定理]]（Stein Theorem 5.1, p.72），只需验证 $F$ 连续 + $\int_T F = 0$ 对所有三角 $T \subset \Omega$。

设 $T \subset \Omega$ 为任意三角。情形 1：$T$ 完全在 $\Omega^+$ 或 $\Omega^-$——$F$ 在该区域全纯，$\int_T F = 0$。

情形 2：$T$ 与 $I$ 相交。将 $T$ 沿垂直于 $I$ 方向微扰至 $T'$，使 $T'$ 完全在 $\Omega^+$ 或 $\Omega^-$（$\Omega^\pm$ 开集保证可行）。由 $F$ 连续，$\int_{T'} F \to \int_T F$。由情形 1，$\int_{T'} F = 0$，故 $\int_T F = 0$。

由 Morera 定理，$F$ 在 $\Omega$ 上全纯。 $\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[cauchy-theorem|Cauchy 定理]] ⇒ [[morera-theorem|Morera 定理]] ⇒ Schwarz 反射原理」：第一阶段定义 $F$（$\Omega^-$ 上 $F(z) = \overline{f(\bar{z})}$）；第二阶段由复共轭复合保持全纯（初等）得 $F \in \mathcal{O}(\Omega^-)$；第三阶段由 $f$ 在 $I$ 上取实值且连续延拓得 $F$ 在 $I$ 上连续；第四阶段用 Morera 定理验证 $F$ 全纯（三角微扰避开 $I$ 的标准技巧）。本证明不依赖 Cauchy 积分公式、Runge 定理等后续定理，依赖图无环。

## What-if — 反例与边界

### 典型例子

1. **上半平面到全平面**：$f(z) = z^2$ 在 $\Omega^+ = \{z : \operatorname{Im} z > 0\}$ 上全纯，且 $f$ 在 $\mathbb{R}$ 上取实值（$x^2 \in \mathbb{R}$）。Schwarz 反射给出 $F(z) = z^2$（本身就是整函数）。
2. **$f(z) = \frac{1}{z}$**：在 $\mathbb{R}_+ = (0, \infty)$ 上取实值。$F(z) = 1/z$ 已为整函数（在 $\mathbb{C} \setminus \{0\}$ 上）。但 Schwarz 反射在 $0$ 处失败——$0$ 不在 $I$ 中。
3. **对数**：$\log z$ 在 $\mathbb{C} \setminus (-\infty, 0]$ 上有主分支（全纯），在 $(0, \infty)$ 上取实值。Schwarz 反射给出对实数轴的对称延拓，但穿孔线 $(-\infty, 0]$ 处仍为支割线。

### 反例

1. **去掉 $I$ 上取实值条件**：$f(z) = iz$ 在 $\Omega^+$ 上全纯，在 $I = \mathbb{R}$ 上连续延拓但 $f(I) = i\mathbb{R}$ 不取实值。Schwarz 反射给出 $F(z) = -iz$（不在 $\Omega$ 上全纯——Morera 验证失败）。
2. **不连续延拓**：若 $f$ 不能连续延拓至 $I$，Schwarz 反射不可直接应用。
3. **$I$ 非实轴段**：Schwarz 反射**只**适用实轴反射。对一般曲线 $C$，需先用共形映射将 $C$ 映为实轴。

### 边界情形

- **$\Omega$ 非对称**：若 $\Omega^+$ 与 $\Omega^-$ 不关于 $I$ 对称，则 Schwarz 反射不适用（$F$ 在 $\Omega^-$ 上无定义）。
- **$I$ 上的边界值**：$F$ 在 $I$ 上连续依赖于 $f$ 的连续延拓。若 $f$ 仅可测，则 Schwarz 反射需用 Fatou 定理的推广。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 对称原理（Stein Theorem 5.5） | $f^\pm$ 在 $\Omega^\pm$ 全纯，$f^+ = f^-$ 在 $I$ 上 | 一般对称延拓 |
| 2. Schwarz 反射（Stein Theorem 5.6） | $f$ 在 $\Omega^+$ 全纯，$f(I) \subset \mathbb{R}$ | 实轴反射 |
| 3. 圆周反射 | $f$ 在圆内全纯，$f(\partial D) \subset \partial D$ | Möbius 变换到实轴 |
| 4. 调和函数版本 | Dirichlet 解的唯一性 | 调和函数 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| Schwarz 反射 | Morera + 微扰 | 中 |
| 对称原理 | Cauchy-Riemann 直接验证 | 低 |
| 圆周反射 | Möbius 变换 + Schwarz | 中 |
| 调和函数版本 | Poisson 积分 + 反射 | 高 |

## 关联

- 概念：[[holomorphic-function]]、[[analytic-continuation|解析延拓法]]
- 定理：[[morera-theorem]]（前置）、[[cauchy-theorem]]、[[runge-theorem]]
- 方法：[[local-to-global|局部到整体原理]]（核心：边界值→整体延拓）、[[structural-randomness-decomposition|结构-随机性二分法]]、[[analytic-continuation|解析延拓法]]
- 应用：Schwarz-Christoffel 公式（Stein, Ch. 8）、调和函数 Dirichlet 问题
- 源：[[steinComplexAnalysis]]（Ch. 2, Theorem 5.5/5.6, p.77–79）
