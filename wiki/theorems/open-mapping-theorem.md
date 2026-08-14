---
type: theorem
title: 开映射定理
aliases: [open mapping theorem]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, topology]
strength: standard
strength_basis: 条件：$f$ 在 $\Omega$ 上全纯且非常数（弱）；结论：$f$ 映射开集至开集（强——全纯函数保持开性）。
---
# 开映射定理

> **工作空间**：$\mathbb{C}$ 的开子集 $\Omega$（区域）。

## What — 陈述

### Theorem 4.4（Stein, p.111）

> 设 $f$ 是区域 $\Omega$ 上的非常数全纯函数。则 $f$ 是开映射——即对 $\Omega$ 中任何开集 $U$，$f(U)$ 是 $\mathbb{C}$ 中的开集。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Theorem 4.4, p.111]]。

## Why — 动机与证明

### 动机

开映射定理是 [[maximum-modulus-principle|最大模原理]]和 [[argument-principle|辐角原理]]的拓扑对应物：

1. **最大模原理的推论**：开映射定理蕴含最大模原理（若 $|f|$ 在 $z_0$ 处取最大值，则 $f$ 在 $z_0$ 邻域内为常数——否则 $f$ 邻域为开集）。
2. **几何直观**：全纯函数的局部行为类似于共形映射（$f'(z_0) \neq 0$ 时）。开映射定理即使在 $f'(z_0) = 0$ 时也成立（虽不共形）。
3. **Rouché 定理的推论**：Rouché 定理的核心思想（连续形变保零点个数）依赖开性。

### 证明思路

1. **化约为邻域开性**：只需证对 $z_0 \in \Omega$，$f$ 将 $z_0$ 的小邻域映射为开集（因 $f(\bigcup U_i) = \bigcup f(U_i)$）。
2. **设 $w_0 = f(z_0)$**。若 $f'(z_0) \neq 0$，$f$ 在 $z_0$ 处局部共形——$f(z) - w_0 \approx f'(z_0)(z - z_0)$，故 $f$ 局部为「旋转 + 缩放」（精确论证见下方第一阶段）。此情形下 $f$ 为开映射。
3. **难点：$f'(z_0) = 0$ 情形**。此时 $f(z) - w_0$ 在 $z_0$ 处有 $n$ 阶零点（$n \geq 1$），局部 $f(z) - w_0 = (z - z_0)^n g(z)$（$g(z_0) \neq 0$）。
4. **构造反证**：假设 $f(z_0)$ 不是 $f(U)$ 的内点，则存在 $w_n \to w_0$（$w_n \notin f(U)$）。由 $f(z_n) = w_n$（$z_n \in U$），取子列收敛 $z_n \to z^*$。由 $f(z^*) = w_0$ 及 $f$ 全纯，$z^* = z_0$（否则 $w_0$ 处 $f$ 局部为 $(z - z^*)^n g$，像的边界是 $w_0$）。但 $z_n \neq z_0$，$z_n \in U$，由局部表达式 $f(z) - w_0 = (z - z_0)^n g(z)$，$z_n - z_0$ 必绕 $z_0$——但 $U$ 是邻域，可取 $z_n$ 充分接近 $z_0$——矛盾。

### 详细证明

#### 证明动机

开映射定理证明的核心是处理 $f'(z_0) = 0$ 情形。关键观察：若 $f$ 在 $z_0$ 处有 $n$ 阶零点（$n \geq 1$），则 $f$ 局部像 $\{(z - z_0)^n g(z) : |z - z_0| < r\}$。此像的边界由「$|g|$ 沿 $|z - z_0| = r$」决定——但内部是开的（$g$ 非零且全纯，$(z - z_0)^n$ 在 $|z - z_0| < r$ 内取所有「模 $< r^n$」的值）。

#### 详细证明

**第一阶段：$f'(z_0) \neq 0$ 情形**。

$f$ 在 $z_0$ 处局部有反函数（解析反函数定理）：$f^{-1}$ 在 $w_0 = f(z_0)$ 的某邻域内全纯且连续。具体地，$f'(z_0) \neq 0$ 蕴含局部逆存在定理（局部双全纯），故 $f$ 局部为同胚，将邻域映射为邻域——开映射。

**第二阶段：$f'(z_0) = 0$ 情形**。

设 $z_0$ 为 $f - w_0$ 的 $n$ 阶零点（$n \geq 1$）。局部 $f(z) - w_0 = (z - z_0)^n h(z)$，$h(z_0) \neq 0$ 全纯。设 $r > 0$ 充分小使 $h \neq 0$ 在 $|z - z_0| \leq r$ 上（$h$ 连续且 $h(z_0) \neq 0$）。

设 $U = B(z_0, r)$。要证 $f(U)$ 包含 $w_0$ 的某邻域。对 $\epsilon > 0$ 充分小，考虑 $w \in B(w_0, \epsilon)$。函数 $f(z) - w$ 在 $C = \{|z - z_0| = r\}$ 上满足
$$
|f(z) - w| \geq |f(z) - w_0| - |w - w_0| = |(z - z_0)^n h(z)| - \epsilon.
$$

在 $C$ 上 $|(z - z_0)^n h(z)| \geq r^n \min_C |h| > 0$。取 $\epsilon < r^n \min_C |h|$，则 $|f(z) - w| > 0$ 在 $C$ 上。

由 [[argument-principle|辐角原理]]，$\frac{1}{2\pi i} \int_C (f - w)'/(f - w) = Z(f - w, U)$。当 $\epsilon$ 充分小时，连续性给出 $Z(f - w, U) = Z(f - w_0, U) = n$（因 $f - w_0$ 在 $U$ 内有 $n$ 阶零点）。特别地，$f - w$ 在 $U$ 内至少有一个零点，即 $\exists z \in U$ 使 $f(z) = w$。

故 $B(w_0, r^n \min_C |h|) \subset f(U)$——$f(U)$ 包含 $w_0$ 的邻域，$f$ 在 $z_0$ 附近为开映射。 $\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[cauchy-theorem|Cauchy 定理]] ⇒ [[residue-theorem|留数定理]] ⇒ [[argument-principle|辐角原理]] ⇒ 开映射定理」，分两个阶段：第一阶段（$f'(z_0) \neq 0$）用解析反函数定理（局部双全纯，初等）；第二阶段（$f'(z_0) = 0$）用零点阶数分解（幂级数展开）+ 辐角原理的零点计数连续性（$Z(f - w, U) = Z(f - w_0, U) = n$）。本证明不使用最大模原理，也不依赖 Rouché 定理（后者为「其他证明」区段证明二所用），依赖图无环。

## 其他证明

> 主证明之外的另一标准证法，依 docs/PROOFS.md §6.5「多证明记录」规范录入；主证明（「详细证明」，辐角原理连续性变体）保持不变。

#### 证明二：局部幂级数分解 + Rouché 定理法

**证明动机**。

主证明在 $f'(z_0) = 0$ 的情形下，直接对计数积分 $\frac{1}{2\pi i}\int_C\frac{(f-w)'}{f-w}\,dz$ 作连续性分析。本证法把「$f(z) = w$ 的解数在 $w$ 变动下不变」这一事实委托给 [[rouche-theorem|Rouché 定理]]：由 [[power-series|幂级数展开]]，$f(z) - w_0$ 在 $z_0$ 处有形如 $(z - z_0)^n h(z)$ 的分解（$h(z_0) \neq 0$，$n \ge 1$）；固定小圆周 $C$ 后，$f(z) - w = (z - z_0)^n h(z) + (w_0 - w)$ 是「主部」$(z - z_0)^n h(z)$ 的常数扰动，而 Rouché 定理保证：当 $|w - w_0|$ 小于 $C$ 上 $|(z - z_0)^n h(z)|$ 的最小值时，扰动不改变零点个数——恰为 $n$（主部在 $B(z_0, r)$ 内恰有 $n$ 个零点）。于是 $f(B(z_0, r))$ 包含 $w_0$ 的一个开邻域。这是 Stein 书中的证法（书内以 Rouché 定理证明开映射定理；本页「详细证明」为辐角原理连续性变体，两者互为替代）。

**证明思路**。

1. **化约**——$f$ 是开映射当且仅当对每个 $z_0 \in \Omega$ 存在 $r > 0$ 使 $f(z_0)$ 是 $f(B(z_0, r))$ 的内点；由 $f(\bigcup_i U_i) = \bigcup_i f(U_i)$ 化约。
2. **局部分解**——$f(z) - w_0 = (z - z_0)^n h(z)$，其中 $h(z_0) \neq 0$，$n \ge 1$；取 $r$ 使 $h$ 在 $\bar B(z_0, r)$ 上无零点，记 $C = \{|z - z_0| = r\}$。
3. **Rouché 应用**——对 $|w - w_0| < r^n\min_C|h|$，$f - w$ 与 $(z - z_0)^n h$ 在 $B(z_0, r)$ 内零点数相同（主部 $F$ 与常数扰动 $G = w_0 - w$）。
4. **零点计数**——Claim 1：$(z - z_0)^n h$ 在 $B(z_0, r)$ 内恰有 $n$ 个零点（按重数）。故 $f(z) = w$ 在 $B(z_0, r)$ 内恰有 $n$ 个解（按重数），特别至少一个解。
5. **结论**——$B(w_0, \epsilon) \subset f(B(z_0, r))$，由化约得 $f$ 为开映射。

**详细证明**。

**第一阶段：化约到邻域。** 对开集 $U = \bigcup_i U_i$，$f(U) = \bigcup_i f(U_i)$，故 $f$ 把开集映为开集当且仅当对每个 $z_0 \in \Omega$ 存在 $r > 0$ 使 $f(z_0)$ 是 $f(B(z_0, r))$ 的内点。事实上，若局部结论成立，对任意开集 $U \subset \Omega$ 与 $w \in f(U)$，取 $z \in U$ 使 $f(z) = w$；局部结论给出 $r > 0$ 使 $w$ 是 $f(B(z, r))$ 的内点，再取 $r$ 更小使 $B(z, r) \subset U$，则 $w$ 是 $f(B(z, r)) \subset f(U)$ 的内点；$w$ 任意，故 $f(U)$ 开。

**第二阶段：局部幂级数分解。** 固定 $z_0 \in \Omega$，记 $w_0 = f(z_0)$。因 $f$ 非常数且 $f(z_0) = w_0$，由零点因子分解（Stein, Ch. 3, Theorem 1.1, p.92；幂级数展开见 [[power-series]]），存在整数 $n \ge 1$ 及 $z_0$ 某邻域上全纯的 $h$，$h(z_0) \neq 0$，使
$$f(z) - w_0 = (z - z_0)^n h(z).$$
因 $h$ 连续且 $h(z_0) \neq 0$，存在 $r_0 > 0$ 使 $h$ 在 $\bar B(z_0, r_0) \subset \Omega$ 上无零点。固定 $0 < r < r_0$，记 $C = \{|z - z_0| = r\}$；则 $m := r^n\min_{z \in C}|h(z)| > 0$（$|h|$ 连续于紧集 $C$ 且 $h \neq 0$ 于 $C$）。

**第三阶段：应用 Rouché 定理。** 对 $w \in \mathbb{C}$，写 $f(z) - w = F(z) + G(z)$，其中
$$F(z) = (z - z_0)^n h(z), \qquad G(z) = w_0 - w.$$
$F$ 与常数函数 $G$ 在包含 $C$ 及其内部的开集上全纯。在 $C$ 上，$|F(z)| = r^n|h(z)| \ge m$。取 $\epsilon = m/2$（小于 $m$ 的任一正数即可）：当 $|w - w_0| < \epsilon$ 时，$|G(z)| = |w - w_0| < m \le |F(z)|$ 于 $C$，即 $|F| > |G|$ 于 $C$（严格）。由 [[rouche-theorem|Rouché 定理]]，$F + G = f - w$ 与 $F$ 在 $B(z_0, r)$ 内零点个数相同。

**第四阶段：零点计数。**

**Claim 1**（乘积的零点）. 设 $h$ 在 $\bar B(z_0, r)$ 上全纯且无零点，$n \ge 1$。则 $(z - z_0)^n h(z)$ 在 $B(z_0, r)$ 内恰有 $n$ 个零点（按重数），全部在 $z_0$ 处。

*证明.* 由幂级数展开写 $h(z) = \sum_{m \ge 0} a_m(z - z_0)^m$（$a_0 = h(z_0) \neq 0$），则
$$(z - z_0)^n h(z) = \sum_{m \ge 0} a_m (z - z_0)^{m+n} = a_0(z - z_0)^n + a_1(z - z_0)^{n+1} + \cdots,$$
最低阶非零项为 $a_0(z - z_0)^n$（$a_0 \neq 0$），故 $z_0$ 是 $(z - z_0)^n h$ 的 $n$ 阶零点。若 $z \in B(z_0, r)$、$z \neq z_0$ 且 $(z - z_0)^n h(z) = 0$，则 $h(z) = 0$，与 $h$ 在 $\bar B(z_0, r)$ 上无零点矛盾。故除 $z_0$ 外无其他零点。$\blacksquare$

由第三阶段与 Claim 1，对每个 $w \in B(w_0, \epsilon)$，方程 $f(z) = w$ 在 $B(z_0, r)$ 内恰有 $n$ 个解（按重数）。

**第五阶段：满邻域与结论。** 对每个 $w \in B(w_0, \epsilon)$，方程 $f(z) = w$ 在 $B(z_0, r)$ 内至少有一个解，故 $B(w_0, \epsilon) \subset f(B(z_0, r))$，即 $w_0$ 是 $f(B(z_0, r))$ 的内点。由第一阶段，$f$ 把 $\Omega$ 的开子集映为开集，即 $f$ 是开映射。$\blacksquare$

来源：书内方法（[[steinComplexAnalysis|Stein, Ch. 3, Theorem 4.4 证明, p.111]]——Stein 以 Rouché 定理证明开映射定理；本页「详细证明」为辐角原理连续性变体）。依据：[[rouche-theorem]]、[[argument-principle]]、[[power-series]]。录入日期：2026-08-13。

## What-if — 反例与边界

### 典型例子

1. **$f(z) = z$**：开映射（恒等映射）。
2. **$f(z) = z^2$**：在 $0$ 处 $f'(0) = 0$，但 $f$ 仍为开映射——将 $\{|z| < r\}$ 映射为 $\{|w| < r^2\}$（开圆盘）。注意 $f$ 在 $0$ 处不共形（角乘以 2）。
3. **$f(z) = e^z$**：开映射——将带状区域 $\{|{\rm Im}(z)| < \pi\}$ 映射为 $\mathbb{C} \setminus (-\infty, 0]$。

### 反例

1. **$f$ 为常数**：$f(\Omega) = \{w_0\}$ 不是开集。开映射定理要求 $f$ 非常数。
2. **$f$ 仅实可微**：实可微函数不开映射（如 $f(x, y) = (x, 0)$，将平面压到实轴）。
3. **$f$ 在 $\Omega$ 上全纯但 $\Omega$ 不连通**：开映射定理**仍成立**（要求 $\Omega$ 为「区域」，即连通开集；但若 $\Omega$ 非连通，每个连通分量分别处理，仍有开性）。

### 边界情形

- **$f'(z_0) = 0$ 但 $f$ 仍开**：由证明第二阶段，$f$ 在 $z_0$ 处仍为开映射（局部像包含邻域）。
- **$f$ 非常数但像单点**：不可能——$f$ 非常数 $\Rightarrow f(\Omega)$ 非单点。
- **$f$ 单射**：单射全纯函数必为共形（$f' \neq 0$）——这是单射全纯函数的特殊性质（Monodromy 定理）。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 开映射（Stein Theorem 4.4） | $f$ 非常数全纯 $\Rightarrow$ $f$ 开 | 区域 $\Omega$ |
| 2. 最大模原理（Corollary 4.5） | $\|f\|$ 在 $\Omega$ 内不能取最大 | 推论 |
| 3. 单射全纯共形 | $f$ 单射全纯 $\Rightarrow$ $f' \neq 0$ | 推论 |
| 4. 解析反函数定理 | $f'(z_0) \neq 0 \Rightarrow f$ 局部双全纯 | 局部形式 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| $f'(z_0) \neq 0$ | 解析反函数 | 低 |
| $f'(z_0) = 0$ | 辐角原理 + 连续性 | 中 |
| 最大模原理 | 开映射推论 | 低 |
| 证明二（局部幂级数 + Rouché） | 幂级数分解 + Rouché 定理 | 中 |

## 关联

- 概念：[[holomorphic-function]]
- 定理：[[maximum-modulus-principle]]（推论）、[[argument-principle]]、[[cauchy-theorem]]
- 方法：[[local-to-global|局部到整体原理]]、[[comparison-modulus|模的下界转化]]、[[homotopy-argument|同伦论证]]
- 应用：单射全纯函数的共形性、共形映射
- 源：[[steinComplexAnalysis]]（Ch. 3, Theorem 4.4, p.111）
