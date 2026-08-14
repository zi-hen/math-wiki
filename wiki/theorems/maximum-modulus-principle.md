---
type: theorem
title: 最大模原理
aliases: [maximum modulus principle]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, maximum-principle]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 非常数全纯于区域 $\Omega$（弱）；结论：$|f|$ 不能在 $\Omega$ 内部取最大值（强——除非 $f$ 为常数）。这是全纯函数刚性的标志性体现。
---
# 最大模原理

> **工作空间**：$\mathbb{C}$ 的区域 $\Omega$（连通开集）。

## What — 陈述

### Theorem 4.5（Stein, p.111）

> 若 $f$ 是区域 $\Omega$ 上的非常数全纯函数，则 $f$ 不能在 $\Omega$ 的内部取到最大值。

即：$\forall z_0 \in \Omega$，$\exists z \in \Omega$（任意接近 $z_0$）使得 $|f(z)| > |f(z_0)|$。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Theorem 4.5, p.111]]。

### Corollary 4.6（Stein, p.111）

> 设 $\Omega$ 为有界区域（有界闭包 $\bar{\Omega}$）。若 $f$ 在 $\Omega$ 上全纯，在 $\bar{\Omega}$ 上连续，则
> $$\sup_{z \in \Omega} |f(z)| \leq \sup_{z \in \bar{\Omega} - \Omega} |f(z)|.$$
> 即 $|f|$ 的最大值在边界上取到。

### Remark（Stein, p.112）

> $\Omega$ 有界（即 $\bar{\Omega}$ 紧）的条件是本质的。例：$\Omega = \{x > 0, y > 0\}$（第一象限），$F(z) = e^{-iz^2}$。$|F(z)| = 1$ 在两条边界线上（$z = x$ 或 $z = iy$），但 $F(z) = e^{r^2}$ 在 $z = r\sqrt{i} = re^{i\pi/4}$ 上无界。

## Why — 动机与证明

### 动机

最大模原理是 [[open-mapping-theorem|开映射定理]]的直接推论：

1. **全纯刚性的极致**：最大模原理表明全纯函数不能在内部取最大值（除非为常数）。这是「全纯 $\Rightarrow$ 解析 $\Rightarrow$ 局部为幂级数」链条的逻辑后果。
2. **调和函数类比**：调和函数有类似的极大值原理（Poisson 公式的推论）。最大模原理是调和极大值原理的复分析版本。
3. **应用**：常用于证明 Cauchy 不等式、Paley-Wiener 定理、Phragmén-Lindelöf 定理等。

### 证明思路

设 $|f|$ 在 $z_0 \in \Omega$ 处取最大值。若 $f'(z_0) \neq 0$，则 $f$ 在 $z_0$ 附近为开映射——存在 $z$ 接近 $z_0$ 使 $f(z)$ 接近 $w_0 + \epsilon$（任意方向），故 $|f(z)| > |w_0|$。矛盾。

若 $f'(z_0) = 0$，更精细分析：$f - f(z_0) = (z - z_0)^n g(z)$（$n \geq 1$，$g(z_0) \neq 0$），$g$ 在 $z_0$ 附近非零——可取 $(z - z_0) = re^{i\theta}/g(z_0)^{1/n}$，使 $f(z) - f(z_0) = r^n e^{in\theta}$。对 $n \geq 1$，可取 $\theta$ 使 $|f(z)| > |f(z_0)|$。

### 详细证明

#### 证明动机

最大模原理证明的核心是处理 $f'(z_0) = 0$ 情形。最干净的证明是利用 [[open-mapping-theorem|开映射定理]]：若 $f$ 非常数，$f$ 是开映射；若 $f(z_0)$ 是 $|f|$ 的最大值，则 $f$ 在 $z_0$ 附近不可能取 $|f(z_0)|$ 以外的值（否则 $\overline{B(w_0, |w_0|)} \subset f(U)$，但 $w_0 \in \partial \overline{B}$，与开性矛盾）。

#### 详细证明（基于开映射定理）

**第一阶段：开映射定理 $\Rightarrow$ 最大模原理**。

设 $f$ 非常数全纯于 $\Omega$。由 [[open-mapping-theorem|开映射定理]]，$f$ 是开映射。

假设 $|f|$ 在 $z_0 \in \Omega$ 处取最大值 $M = |f(z_0)|$。设 $U$ 为 $z_0$ 的小邻域（$U \subset \Omega$）。由开映射性，$f(U)$ 是 $\mathbb{C}$ 中的开集，特别地 $f(z_0) \in f(U)$，存在 $\epsilon > 0$ 使 $B(f(z_0), \epsilon) \subset f(U)$。

特别地，存在 $z \in U$ 使 $f(z) = f(z_0) + \epsilon/2$。则 $|f(z)| \geq |f(z_0)| + \epsilon/2 > |f(z_0)| = M$，矛盾（$M$ 是最大值）。

故 $|f|$ 不能在 $\Omega$ 内部取最大值。 $\blacksquare$

#### 直接证明（$f'(z_0) = 0$ 情形）

设 $|f(z_0)| = M$。写 $f(z) - f(z_0) = (z - z_0)^n g(z)$，$n \geq 1$，$g(z_0) \neq 0$。

因 $g$ 在 $z_0$ 邻域非零且连续，$g(z_0)^{1/n}$ 在 $z_0$ 邻域有连续选取。取 $z = z_0 + r \omega(z_0)$，其中 $\omega(z_0) = g(z_0)^{-1/n}$，$r > 0$ 充分小。则
$$
f(z) - f(z_0) = r^n g(z_0) \omega(z_0)^n + O(r^{n+1}) = r^n + O(r^{n+1}).
$$

故对充分小 $r$，$f(z) \approx f(z_0) + r^n$。特别地，$|f(z)| \geq |f(z_0)| + r^n - O(r^{n+1}) > |f(z_0)|$ 对 $r$ 充分小。 $\blacksquare$

> **依赖关系小结**: 本证明区段含两条独立路径。主证明（基于开映射定理）：依赖链为「[[open-mapping-theorem|开映射定理]] ⇒ 最大模原理」——由 $f$ 为开映射，$f(U)$ 含 $f(z_0)$ 的邻域，与 $|f|$ 的最大性矛盾（纯拓扑论证）。直接证明（$f'(z_0) = 0$ 情形）：依赖链为「局部幂级数展开（零点阶数分解 $f(z) - f(z_0) = (z-z_0)^n g(z)$，$g(z_0) \neq 0$）+ 连续 $n$ 次根的局部选取」⇒ $|f(z)| > |f(z_0)|$，本质自足、无定理级依赖。两条路径均不依赖最大模原理自身，也均不依赖平均值性质（后者为「其他证明」区段证明二所用）；依赖图无环（开映射定理的证明不使用最大模原理）。

## 其他证明

> 主证明之外的另一标准证法，依 docs/PROOFS.md §6.5「多证明记录」规范录入；主证明（「详细证明」，开映射定理法）保持不变。

#### 证明二：平均值性质法

**证明动机**。

主证明走「拓扑」路线：由 [[open-mapping-theorem|开映射定理]]，$f$ 把 $z_0$ 的邻域映为开集，而含 $f(z_0)$ 的开集不可能整个落在闭圆盘 $\overline{B(f(z_0), M)}$ 内。本证法走「积分平均」路线：由 [[mean-value-property-holomorphic|全纯函数平均值性质]]，$f(z_0)$ 恰好等于 $f$ 在任意小圆周 $C(z_0, r)$ 上的积分平均。若 $|f|$ 在 $z_0$ 处取到最大值 $M = |f(z_0)| > 0$，则这个平均的模，一方面不小于圆周上各点模的平均（三角不等式），另一方面不大于 $M$（最大值性），故两个不等式同时取等；而积分三角不等式取等时，圆周上每一点的值必须与平均值同向、且模处处达到 $M$——于是 $f$ 在圆周上恒等于 $f(z_0)$。半径 $r$ 任意，$f$ 在 $z_0$ 附近便为常值，再由连通性处处常值，与非常数假设矛盾。此法只依赖平均值性质与连通性，不依赖开映射定理。

**证明思路**。

1. **退化情形 $M = 0$**——若 $|f(z_0)| = 0$，由最大值性 $|f| \le 0$ 于 $\Omega$，$f \equiv 0$，矛盾；故设 $M > 0$。
2. **平均值性质**——取 $r_0 > 0$ 使 $\overline{B(z_0, r_0)} \subset \Omega$；对任意 $0 < r < r_0$，$f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta$。
3. **等号情形**——Claim 1（积分三角不等式取等的结构）与夹逼推出 $|f| \equiv M$ 且 $f \equiv f(z_0)$ 于 $C(z_0, r)$。
4. **局部常值**——$r \in (0, r_0)$ 任意，故 $f \equiv f(z_0)$ 于 $B(z_0, r_0)$。
5. **整体化**——非空闭开集论证（连通性）把局部常值推广到全 $\Omega$，与 $f$ 非常数矛盾。

**详细证明**。

**Claim 1**（积分三角不等式取等的结构）. 设 $g: [0, 2\pi] \to \mathbb{C}$ 连续，且
$$\left|\int_0^{2\pi} g(\theta)\,d\theta\right| = \int_0^{2\pi} |g(\theta)|\,d\theta \neq 0,$$
则存在固定的 $\alpha \in \mathbb{R}$ 使 $g(\theta) = e^{i\alpha}|g(\theta)|$ 对一切 $\theta \in [0, 2\pi]$ 成立。

*证明.* 记 $I = \int_0^{2\pi} g(\theta)\,d\theta \neq 0$，取 $\alpha = \arg I$，则 $\exp(-i\alpha) I = |I|$。由假设 $|I| = \int_0^{2\pi}|g(\theta)|\,d\theta$，两边乘以 $\exp(-i\alpha)$ 后取实部，得
$$\int_0^{2\pi} \Re(\exp(-i\alpha) g(\theta))\,d\theta = \int_0^{2\pi} |g(\theta)|\,d\theta,$$
即 $\int_0^{2\pi}\left(|g(\theta)| - \Re(\exp(-i\alpha)g(\theta))\right)d\theta = 0$。被积函数连续且处处非负（因 $\Re(\exp(-i\alpha)g) \le |\exp(-i\alpha)g| = |g|$），故恒为零，即 $\Re(\exp(-i\alpha)g(\theta)) = |g(\theta)|$ 于一切 $\theta$。又 $|\Re w| \le |w|$ 取等当且仅当 $w$ 为非负实数，故 $\exp(-i\alpha)g(\theta) = |g(\theta)| \ge 0$，即 $g(\theta) = e^{i\alpha}|g(\theta)|$。$\blacksquare$

**第一阶段：退化情形。** 设 $M = |f(z_0)|$。若 $M = 0$，则因 $z_0$ 是 $|f|$ 的最大值点，$|f(z)| \le M = 0$ 对一切 $z \in \Omega$ 成立，故 $f \equiv 0$，与「$f$ 非常数」矛盾。以下设 $M > 0$。

**第二阶段：平均值性质。** 取 $r_0 > 0$ 使 $\overline{B(z_0, r_0)} \subset \Omega$。对任意 $0 < r < r_0$，由 [[mean-value-property-holomorphic|全纯函数平均值性质]]，$f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta$。两端取模，并依次用三角不等式与 $M$ 的最大性（$|f| \le M$ 于 $\Omega$，故于圆周 $C(z_0, r)$），得
$$M = \left|\frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta\right| \le \frac{1}{2\pi}\int_0^{2\pi}|f(z_0 + re^{i\theta})|\,d\theta \le M.$$
故链中两个不等号均为等号，特别
$$\left|\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta\right| = \int_0^{2\pi}|f(z_0 + re^{i\theta})|\,d\theta = 2\pi M.$$

**第三阶段：等号情形。** 对 $g(\theta) = f(z_0 + re^{i\theta})$ 应用 Claim 1。此处 $\int_0^{2\pi} g(\theta)\,d\theta = 2\pi f(z_0) \neq 0$（$M > 0$），故存在 $\alpha \in \mathbb{R}$ 使 $g(\theta) = e^{i\alpha}|g(\theta)|$ 对一切 $\theta$ 成立。另一方面，由 $\int_0^{2\pi}|g| = 2\pi M$ 与 $|g| \le M$，得 $\int_0^{2\pi}(M - |g(\theta)|)\,d\theta = 0$；被积函数连续非负，故 $|g| \equiv M$ 于圆周。于是 $g(\theta) \equiv e^{i\alpha}M$；再由平均值公式 $f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} g = e^{i\alpha}M$，得
$$f(z_0 + re^{i\theta}) = f(z_0) \quad \text{对一切 } \theta \in [0, 2\pi].$$

**第四阶段：局部常值。** 第三阶段对每个 $0 < r < r_0$ 成立，故 $f(z) = f(z_0)$ 对一切 $z \in B(z_0, r_0) \setminus \{z_0\}$ 成立；由 $f$ 在 $z_0$ 处连续，该等式在 $z_0$ 亦成立。故 $f \equiv f(z_0)$ 于圆盘 $B(z_0, r_0)$。

**第五阶段：整体化与矛盾。** 记 $E = \{z \in \Omega : f(z) = f(z_0)\}$。$E$ 非空（$z_0 \in E$）。$E$ 在 $\Omega$ 中闭：由 $f$ 连续，$E = f^{-1}(\{f(z_0)\})$ 是单点闭集的原像。$E$ 在 $\Omega$ 中开：对任意 $\zeta \in E$，有 $|f(\zeta)| = |f(z_0)| = M$，即 $\zeta$ 也是 $|f|$ 的最大值点，故第二至第四阶段的论证在 $\zeta$ 处照样成立，给出 $r_\zeta > 0$ 使 $f \equiv f(z_0)$ 于 $B(\zeta, r_\zeta) \subset \Omega$，即 $B(\zeta, r_\zeta) \subset E$。因 $\Omega$ 连通，非空闭开集 $E$ 必等于 $\Omega$，故 $f$ 在 $\Omega$ 上恒等于常数 $f(z_0)$，与「$f$ 非常数」矛盾。$\blacksquare$

来源：〔非书内证明，标准结果〕——Stein 书中以开映射定理证明最大模原理（Ch. 3, Theorem 4.5, p.111）；平均值性质证法是经典替代证法。依据：[[mean-value-property-holomorphic|全纯函数平均值性质]]（Stein, Ch. 3, Corollary 7.2, p.121）。录入日期：2026-08-13。

## What-if — 反例与边界

### 典型例子

1. **$f(z) = z^n$ 在圆盘 $|z| < 1$**：$|f|$ 的最大值在 $|z| = 1$ 上取到（边界），不在内部取到。
2. **$f(z) = 1$**：常数，$|f| = 1$ 在内部处处取到（但这是平凡情形，最大模原理说「非常数不能」）。
3. **$f(z) = \cos z$**：在 $\mathbb{C}$ 上无界（沿虚轴增长），不取最大值。
4. **调和函数 $u(x, y) = \operatorname{Re}(z)$**：在带状区域上取最大值在边界上。

### 反例

1. **无界区域**：在无界区域上 $|f|$ 可在内部取最大值。例如 $f(z) = 1/(1 + z^2)$ 在 $\mathbb{C}$ 上无界，但若限制在某紧集内，最大值在边界取到。
2. **去掉连通性**：若 $\Omega$ 非连通，$|f|$ 可能在某连通分量内部取最大值（因最大值原理要求连通）。
3. **Stein Remark 反例**（p.112）：$F(z) = e^{-iz^2}$ 在第一象限（无界区域），$|F| = 1$ 在边界，但内部无界——说明 $\Omega$ 必须有界才能保证最大值在边界上。

### 边界情形

- **常数**：$f$ 常数时 $|f|$ 可在内部处处取最大值。
- **$\Omega$ 无界**：Corollary 4.6 **不适用**。例：$\Omega = \{z : \operatorname{Re}(z) > 0\}$，$f(z) = e^{-z^2}$ 在内部无界增长。
- **$|f|$ 的最小值**：最小模原理类似——若 $f \neq 0$，$|f|$ 在 $\Omega$ 内不能取最小值（除非为常数）。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 基本版本（Stein Theorem 4.5） | 非常数全纯 $\Rightarrow$ $\|f\|$ 不在内部取最大值 | 区域 $\Omega$ |
| 2. 有界版本（Corollary 4.6） | $\overline{\Omega}$ 紧 $\Rightarrow$ $\sup \|f\|$ 在边界上取到 | 有界 $\Omega$ |
| 3. 最小模 | $f \neq 0 \Rightarrow \|f\|$ 不在内部取最小值 | 同上 |
| 4. 调和版本 | $u$ 调和且非常数 $\Rightarrow$ $u$ 不在内部取极值 | 调和函数 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 基本版本（基于开映射） | 开映射定理 | 低 |
| 直接证明（$f' = 0$ 情形） | 零点阶数展开 | 中 |
| 最小模原理 | 在 $1/f$ 上应用最大模 | 低 |
| 调和版本 | 平均值性质 | 低 |
| 证明二（平均值性质法） | 平均值性质 + 积分三角不等式取等情形 | 低至中 |

## 关联

- 概念：[[holomorphic-function]]
- 定理：[[open-mapping-theorem]]（前置）、[[phragmen-lindelof-theorem]]（推广到无界区域）、[[liouville-theorem]]（特殊情形）
- 方法：[[local-to-global|局部到整体原理]]、[[structural-randomness-decomposition|结构-随机性二分法]]
- 应用：Cauchy 不等式、Paley-Wiener 定理、调和函数
- 引用本定理的引理：[[mean-value-property-holomorphic]]（均值性质的极值情形）、[[triangle-inequality-complex]]（最大模的代数基础）
- 源：[[steinComplexAnalysis]]（Ch. 3, Theorem 4.5, p.111）
