---
type: theorem
title: Rouché 定理
aliases: [Rouché's theorem]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, argument-principle]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f, g$ 在 $C$ 内全纯且 $|f| > |g|$ 在 $C$ 上（弱——仅需边界控制）；结论：$f$ 与 $f + g$ 在 $C$ 内有相同零点数（强——小扰动不改变零点个数）。
---
# Rouché 定理

> **工作空间**：$\mathbb{C}$ 中包含圆盘 $D$ 的开集 $\Omega$。

## What — 陈述

### Theorem 4.3（Stein, p.110）

> 设 $f$ 与 $g$ 在包含圆 $C$ 及其内部的某开集上全纯。若 $|f(z)| > |g(z)|$ 对所有 $z \in C$，则 $f$ 与 $f + g$ 在 $C$ 内有相同数目的零点（按重数计算）。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Theorem 4.3, p.110]]。

### 等价形式

Rouché 定理常表述为：$|f - g| < |f| + |g|$ 在 $C$ 上，则 $f$ 与 $g$ 在 $C$ 内零点个数相同。

## Why — 动机与证明

### 动机

Rouché 定理是「连续性版本」的零点计数定理：

1. **稳定性**：若 $|f - g| < |f|$，$f$ 与 $g$ 的零点个数相同。这提供了零点个数的「连续性」。
2. **代数基本定理的另类证明**：取 $f(z) = z^n$（$|z| = R$ 上 $|f| = R^n$），$g(z) = a_{n-1} z^{n-1} + \cdots + a_0$（$|g| \leq |a_{n-1}| R^{n-1} + \cdots + |a_0|$）。当 $R$ 充分大时 $|g| < |f|$，由 Rouché 定理 $z^n + g$ 与 $z^n$ 零点个数相同，即 $n$ 个零点。
3. **小扰动不变性**：物理学中「参数微扰」常保持系统本质特征，Rouché 定理是其数学表达。

### 证明思路

1. **构造辅助函数 $h = (f + g)/f$**：在 $C$ 上 $|f + g| \geq |f| - |g| > 0$，故 $h$ 在 $C$ 上无零点。
2. **$h$ 在 $C$ 内零点 = $f + g$ 的零点**（$h = 0 \Leftrightarrow f + g = 0$）。
3. **$h - 1 = g/f$**：在 $C$ 上 $|g/f| < 1$，故 $|h - 1| < 1$。$h$ 绕 $C$ 一周时，$h - 1$ 不绕 $0$，故 $\Delta_C \arg h = \Delta_C \arg(h - 1 + 1)$。
4. **辐角原理**：$\frac{1}{2\pi i} \int_C h'/h\,dz = Z_{h, C}$（$h$ 在 $C$ 内的零点数）；但 $|h - 1| < 1$ 蕴含 $h$ 不绕 $0$（即 $\Delta_C \arg h = 0$），故 $Z_{h, C} = 0$——这等价于 $f + g$ 在 $C$ 内的零点数 $= f$ 在 $C$ 内的零点数。

### 详细证明

#### 证明动机

Rouché 定理的关键观察是：在 $|g| < |f|$ 的边界控制下，$f + g$ 与 $f$ 的辐角变化相同——因此零点个数相同。这本质上是「形变」论证：$t \mapsto f + tg$（$t \in [0, 1]$）连续形变从 $f$ 到 $f + g$，途中不经过零点（因 $|f + tg| \geq |f| - t|g| > 0$）。

#### 详细证明

**第一阶段：构造同伦**。

设 $H(z, t) = f(z) + t g(z)$，$t \in [0, 1]$。在 $C$ 上，
$$
|H(z, t)| \geq |f(z)| - t|g(z)| > |f(z)| - |g(z)| \geq 0.
$$

故 $H(\cdot, t)$ 在 $C$ 上无零点（对所有 $t \in [0, 1]$）。由 [[argument-principle|辐角原理]]连续性，$Z(f + g, C) = Z(H(\cdot, 1), C) = Z(H(\cdot, 0), C) = Z(f, C)$。

**第二阶段：更形式化的辐角论证**。

定义 $h = (f + g)/f = 1 + g/f$。由 $|g/f| < 1$ 在 $C$ 上，$h$ 在 $C$ 上满足 $|h - 1| < 1$，故 $h$ 不绕 $0$ 一圈（即 $\arg h$ 的总变化为 $0$）。由辐角原理（Stein Theorem 4.1），
$$
\frac{1}{2\pi i} \int_C \frac{h'(z)}{h(z)}\,dz = Z(h, C) = Z(f + g, C) - Z(f, C).
$$

因 $\arg h$ 的总变化为 $0$，左端 $= 0$（辐角原理的几何形式）。故 $Z(f + g, C) = Z(f, C)$。 $\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[cauchy-theorem|Cauchy 定理]] ⇒ [[residue-theorem|留数定理]] ⇒ [[argument-principle|辐角原理]] ⇒ Rouché 定理」，分两个阶段：第一阶段用同伦 $H(z, t) = f + tg$（$|H| \geq |f| - |g| > 0$ 于 $C$）与辐角原理的连续性，得零点个数沿同伦不变；第二阶段用辐角原理的几何形式（$|h - 1| < 1$ 蕴含 $\arg h$ 总变化为 $0$，左端计数积分为零）。本证明不依赖开映射定理、留数定理以外的后续定理，依赖图无环。

## 其他证明

> 主证明之外的另一标准证法，依 docs/PROOFS.md §6.5「多证明记录」规范录入；主证明（「详细证明」，同伦/形变证法）保持不变。

#### 证明二：辐角原理直接法（对数导数积分差）

**证明动机**。

主证明从「形变」视角出发：用直线族 $f + tg$（$t \in [0, 1]$）把 $f$ 连续形变到 $f + g$，并断言形变过程中零点个数不变。本证法不做任何形变，改为「代数核算」：零点个数由 [[argument-principle|辐角原理]] 写成积分，两个计数之差正是两个对数导数积分之差；把被积函数之差改写为某个全纯函数（主对数分支）的精确微分后，沿闭曲线的积分必为零——于是 $f$ 与 $f + g$ 的零点数相等。关键观察是，$|g| < |f|$ 于 $C$ 蕴含 $1 + g/f$ 在 $C$ 上取值于右半平面，故主对数分支 $\log(1 + g/f)$ 可用，其导数为 $\frac{(g/f)'}{1 + g/f}$。与主证明（同伦 + 连续依赖）相比，此法直接给出同一事实的积分证明。

**证明思路**。

1. **积分表示**——由辐角原理，$Z(f, C) = \frac{1}{2\pi i}\int_C\frac{f'}{f}\,dz$，$Z(f+g, C) = \frac{1}{2\pi i}\int_C\frac{(f+g)'}{f+g}\,dz$。
2. **精确微分**——Claim 1：$\frac{(f+g)'}{f+g} - \frac{f'}{f} = \frac{d}{dz}\log(1 + g/f)$（代数恒等式）。
3. **主对数分支**——Claim 2：$1 + g/f$ 在 $C$ 上取值于 $\{\Re w \ge \delta\}$（$\delta > 0$），故 $\Phi = \log(1 + g/f)$（主分支）在 $C$ 的某邻域上全纯。
4. **积分为零**——Claim 3：全纯函数的导数沿闭曲线的积分为零。结合 2、3 得两计数积分之差为零，零点数相同。

**详细证明**。

**Claim 1**（对数导数差的精确微分形式）. 在 $f \neq 0$ 且 $f + g \neq 0$ 的区域上，
$$\frac{(f+g)'(z)}{f(z)+g(z)} - \frac{f'(z)}{f(z)} = \frac{d}{dz}\log\left(1 + \frac{g(z)}{f(z)}\right),$$
其中右端的对数取主分支（在其有定义的区域内）。

*证明.* 由商法则，$\left(\frac{g}{f}\right)' = \frac{g'f - gf'}{f^2}$；又 $1 + \frac{g}{f} = \frac{f+g}{f}$。故
$$\frac{d}{dz}\log\left(1 + \frac{g}{f}\right) = \frac{(g/f)'}{1 + g/f} = \frac{(g'f - gf')/f^2}{(f+g)/f} = \frac{g'f - gf'}{f(f+g)}.$$
另一方面，通分得
$$\frac{(f+g)'}{f+g} - \frac{f'}{f} = \frac{(f' + g')f - f'(f + g)}{f(f+g)} = \frac{g'f - gf'}{f(f+g)}.$$
两式右端相同，故左端相等。$\blacksquare$

**Claim 2**（主对数分支的全纯性）. 设 $f, g$ 在包含 $C$ 的开集上全纯，$|g| < |f|$ 于 $C$。则存在 $C$ 的邻域 $A$ 及 $A$ 上全纯的函数 $\Phi$，使 $e^{\Phi(z)} = 1 + g(z)/f(z)$ 于 $A$。

*证明.* $C$ 紧，连续函数 $|g/f|$ 在 $C$ 上达到最大值，由 $|g/f| < 1$ 于 $C$ 得存在 $\delta > 0$ 使 $|g(z)/f(z)| \le 1 - \delta$ 于 $C$。于是对 $z \in C$，$\Re(1 + g(z)/f(z)) \ge 1 - |g(z)/f(z)| \ge \delta > 0$，即 $1 + g/f$ 在 $C$ 上取值于右半平面 $\{\Re w \ge \delta\}$。由 $1 + g/f$ 连续且紧集上的连续函数一致连续，存在 $C$ 的邻域 $A$（可取为 $C$ 的环形邻域）使 $\Re(1 + g(z)/f(z)) \ge \delta/2$ 于 $A$。主对数分支 $\log$ 在 $\mathbb{C} \setminus (-\infty, 0]$ 上全纯，而右半平面 $\{\Re w > 0\}$ 含于其定义域，故 $\Phi(z) = \log(1 + g(z)/f(z))$ 在 $A$ 上全纯，且 $e^{\Phi} = 1 + g/f$。$\blacksquare$

**Claim 3**（精确微分的闭路积分）. 设 $\Phi$ 在 $C$ 的某邻域上全纯。则 $\int_C \Phi'(z)\,dz = 0$。

*证明.* 参数化 $C: z(\theta) = z_0 + re^{i\theta}$（$\theta \in [0, 2\pi]$）。由链式法则与微积分基本定理，
$$\int_C \Phi'(z)\,dz = \int_0^{2\pi}\Phi'(z(\theta))\,z'(\theta)\,d\theta = \int_0^{2\pi}\frac{d}{d\theta}\left[\Phi(z(\theta))\right]d\theta = \Phi(z(2\pi)) - \Phi(z(0)) = 0,$$
其中末等式由 $z(2\pi) = z(0)$（曲线闭合）与 $\Phi$ 的单值性。$\blacksquare$

**第一阶段：写出零点计数积分。** 由辐角原理（[[argument-principle]]，Stein, Ch. 3, Theorem 4.1, p.109），$f$ 与 $f + g$ 在 $C$ 内的零点数（按重数）分别为
$$Z(f, C) = \frac{1}{2\pi i}\int_C \frac{f'(z)}{f(z)}\,dz, \qquad Z(f+g, C) = \frac{1}{2\pi i}\int_C \frac{(f+g)'(z)}{f(z)+g(z)}\,dz.$$
适用条件满足：由 $|g| < |f|$ 于 $C$，得 $|f| > 0$ 且 $|f + g| \ge |f| - |g| > 0$ 于 $C$，故 $f$ 与 $f+g$ 在 $C$ 上均无零点。

**第二阶段：化为精确微分。** 由 Claim 2，存在 $C$ 的邻域 $A$ 上全纯的 $\Phi = \log(1 + g/f)$，且于 $A$ 上 $f \neq 0$（$\Phi$ 的定义要求 $g/f$ 有意义）与 $f + g \neq 0$（由 $\Re(1 + g/f) \ge \delta/2$ 蕴含 $1 + g/f \neq 0$，而 $f + g = f(1 + g/f)$）。由 Claim 1，于 $A$ 上
$$\frac{(f+g)'}{f+g} - \frac{f'}{f} = \Phi'.$$

**第三阶段：积分差为零。** 由 Claim 3，
$$\frac{1}{2\pi i}\int_C\frac{(f+g)'}{f+g}\,dz - \frac{1}{2\pi i}\int_C\frac{f'}{f}\,dz = \frac{1}{2\pi i}\int_C\Phi'(z)\,dz = 0.$$
代入第一阶段的表示，得 $Z(f+g, C) = Z(f, C)$，即 $f$ 与 $f + g$ 在 $C$ 内零点数相同（按重数）。$\blacksquare$

来源：〔非书内证明，标准结果〕——辐角原理的直接积分证法（本页主证明采用同伦/形变证法）。依据：[[argument-principle]]。录入日期：2026-08-13。

## What-if — 反例与边界

### 典型例子

1. **代数基本定理的另一证明**：$P(z) = z^n + a_{n-1}z^{n-1} + \cdots + a_0$，取 $f(z) = z^n$，$g(z) = a_{n-1}z^{n-1} + \cdots + a_0$。当 $|z| = R$ 充分大时 $|g| < |f|$，故 $P$ 与 $z^n$ 零点个数相同（$n$ 个）。
2. **小扰动稳定性**：$f(z) = z^2 - 2$，$g(z) = 0.1 z$（在 $|z| = 2$ 上 $|f| = 2 > |g| = 0.2$）。$f + g = z^2 + 0.1 z - 2$ 与 $f$ 零点个数相同（2 个）。
3. **零点消失情形**：若 $|g/f| < 1$ 不在所有 $C$ 上成立，零点个数可能变化。例如 $f(z) = z - 1$，$g(z) = -1 + 2z$。在 $|z| = 1$ 上 $|f| = |1 - z|$，$|g| = |2z - 1| = |2 - \bar{z}|$——条件可能不满足。

### 反例

1. **$|f| > |g|$ 在 $C$ 内某点不成立**：Rouché 定理**不适用**。例如 $f(z) = z^2$，$g(z) = -1$（在 $|z| = 1$ 上 $|f| = 1$，$|g| = 1$，条件 $|f| > |g|$ 不严格成立）。$f + g = z^2 - 1$ 在 $|z| = 1$ 内有 2 个零点；$f$ 在 $|z| = 1$ 上有 1 个零点（在 $z = 0$）。零点个数不同——但条件也不满足。
2. **$f, g$ 在 $C$ 内不全纯**：Rouché 定理要求 $f, g$ 在 $C$ 内全纯。
3. **极点的情形**：Rouché 定理的极点版本：若 $|f| > |g|$ 在 $C$ 上，则 $f$ 与 $f + g$ 在 $C$ 内极点个数相同（证明类似）。

### 边界情形

- **$|f| = |g|$**：条件**不严格成立**，Rouché 定理不保证。
- **$C$ 退化**：若 $C$ 不是简单闭曲线，需用 toy contour 版本。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 圆周版本（Stein Theorem 4.3） | $\|f\| > \|g\|$ on $C \Rightarrow$ $Z(f, C) = Z(f+g, C)$ | $C$ 圆周 |
| 2. Toy contour | 同上 | toy contour |
| 3. 极化形式 | $\|f\| > \|g\|$ on $C \Rightarrow$ $P(f, C) = P(f+g, C)$ | $f, g$ 亚纯 |
| 4. 实数同伦形式 | $H(z,t) = f + tg$ 无零点 | 同伦表述 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 基本版本 | 辐角原理 | 中 |
| 同伦版本 | 连续形变 | 低 |
| 极化形式 | $f'/f$ 处理 | 中 |
| 证明二（对数导数积分差） | 辐角原理 + 主对数分支精确微分 | 低至中 |

## 关联

- 概念：[[holomorphic-function]]、[[argument-principle|辐角原理]]
- 定理：[[argument-principle]]（核心工具）、[[residue-theorem]]、[[open-mapping-theorem]]
- 方法：[[homotopy-argument|同伦论证]]、[[local-to-global|局部到整体原理]]
- 应用：代数基本定理、稳定系统分析
- 源：[[steinComplexAnalysis]]（Ch. 3, Theorem 4.3, p.110）
