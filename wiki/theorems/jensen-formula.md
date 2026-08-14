---
type: theorem
title: Jensen 公式
aliases: [Jensen's formula]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, entire-functions, order-of-growth]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 在包含闭圆盘 $\bar{D}_R$ 的开集上全纯，$f(0) \neq 0$（弱）；结论：$\log |f(0)| = \sum \log(R/|z_k|) + \frac{1}{2\pi} \int \log |f(Re^{i\theta})|\,d\theta$（强——精确恒等，连接零点与对数平均值）。
---
# Jensen 公式

> **工作空间**：$\mathbb{C}$ 中以 $0$ 为中心、$R$ 为半径的闭圆盘 $\bar{D}_R$。

## What — 陈述

### Theorem 1.1（Stein, p.154）

> 设 $\Omega$ 为包含闭圆盘 $\bar{D}_R$ 的开集，$f$ 在 $\Omega$ 上全纯，$f(0) \neq 0$，且 $f$ 在圆周 $C_R = \{|z| = R\}$ 上无零点。若 $z_1, \ldots, z_N$ 为 $f$ 在圆盘 $D_R$ 内的零点（按重数），则
> $$\log |f(0)| = \sum_{k=1}^{N} \log \frac{|z_k|}{R} + \frac{1}{2\pi} \int_0^{2\pi} \log |f(Re^{i\theta})|\,d\theta.$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 5, Theorem 1.1, p.154]]。

### 等价形式

Jensen 公式常写作
$$
\sum_{k=1}^N \log\frac{R}{|z_k|} = \frac{1}{2\pi} \int_0^{2\pi} \log |f(Re^{i\theta})|\,d\theta - \log |f(0)|.
$$

### 推论（Lemma 1.2, p.156）

设 $z_1, \ldots, z_N$ 为 $f$ 在 $D_R$ 内的零点，则
$$
\int_0^R \frac{n(r)}{r}\,dr = \sum_{k=1}^N \log\frac{R}{|z_k|},
$$
其中 $n(r) = \#\{k : |z_k| \leq r\}$ 为零点计数函数。

## Why — 动机与证明

### 动机

Jensen 公式是整函数理论的「第一基本公式」，将**零点分布**与**函数增长的平均值**精确联系：

1. **零点-增长对偶**：左边（零点对数和）= 右边（对数均值 - $\log|f(0)|$）。增长快 $\Leftrightarrow$ 零点稀疏。
2. **Hadamard 因子分解**：Jensen 公式是 Hadamard 定理（增长阶 $\rho$ 控制零点密度）的核心工具。
3. **Nevanlinna 理论**：Jensen 公式是值分布理论（Nevanlinna theory）的起点——后者将零点替换为 $f - a$ 的零点（$a \in \mathbb{C}$）。

### 证明思路

1. **构造无零点的辅助函数**：因 $D_R$ 单连通，$g(z) = \log f(z)$ 在 $D_R$ 上有单值全纯分支（Stein Theorem 6.2, p.119）——这里用 $\log$ 主分支。
2. **Cauchy 积分公式**：对 $g$ 应用 Cauchy 公式：
   $$g(0) = \frac{1}{2\pi i} \int_{C_R} \frac{g(\zeta)}{\zeta}\,d\zeta = \frac{1}{2\pi} \int_0^{2\pi} g(Re^{i\theta})\,d\theta.$$
3. **取实部**：$\log|f(0)| = \operatorname{Re} g(0) = \frac{1}{2\pi} \int_0^{2\pi} \operatorname{Re} g(Re^{i\theta})\,d\theta = \frac{1}{2\pi} \int_0^{2\pi} \log |f(Re^{i\theta})|\,d\theta$.
4. **减去零点贡献**：因 $\log f(z)$ 在 $z_k$ 处有 $\log$ 奇点（$f$ 的 $n_k$ 阶零点对应 $\log f$ 的 $n_k$ 阶零点，对应 $\log(f(z)/(z-z_k)^{n_k})$ 的解析性），用
   $$h(z) = \frac{f(z)}{\prod_k (1 - z/z_k)^{n_k}}$$
   其中 $h(0) = f(0)$（零点项抵消），$h$ 在 $D_R$ 上无零点。

### 详细证明

#### 证明动机

Jensen 公式的证明将「带零点的 $f$」分解为「零点因子 + 无零点的 $h$」。对 $h$ 应用单连通域上的对数存在性（Stein Theorem 6.2），再利用 Cauchy 公式取实部。

#### 详细证明

**第一阶段：分解 $f$ 为零点因子与无零点函数**。

设 $f$ 在 $D_R$ 内零点为 $z_1, \ldots, z_N$（按重数）。定义
$$
F(z) = f(z) \cdot \prod_{k=1}^N \frac{R - z \bar{z}_k/R}{z - z_k} \cdot \prod_{k=1}^N \frac{z_k}{R} \cdot \frac{1}{\text{sign}(f(0))},
$$
或更简单地（Stein 实际形式）：
$$
B(z) = \prod_{k=1}^N \frac{z}{z_k} \cdot \frac{z_k - z}{R - z \bar{z}_k/R} \cdot \frac{R}{z_k}.
$$

实际上 Stein 的证明用 Blashke 乘积的简化形式。

**第二阶段：应用单连通对数**。

设 $h = f/B$。$h$ 在 $D_R$ 上无零点（零点被 $B$ 抵消），且 $h$ 在 $D_R$ 上连续。由 [[steinComplexAnalysis|Stein, p.119, Theorem 6.2]]（单连通域上的对数分支），存在 $\log h$ 在 $D_R$ 上全纯。

**第三阶段：Cauchy 公式取实部**。

对 $\log h$ 在 $D_R$ 应用 Cauchy 公式：
$$
\log h(0) = \frac{1}{2\pi i} \int_{C_R} \frac{\log h(\zeta)}{\zeta}\,d\zeta = \frac{1}{2\pi} \int_0^{2\pi} \log h(Re^{i\theta})\,d\theta.
$$

取实部：
$$
\log |h(0)| = \log |f(0)| - \sum_{k=1}^N \log\frac{R}{|z_k|} = \frac{1}{2\pi} \int_0^{2\pi} \log |h(Re^{i\theta})|\,d\theta.
$$

由 $|h| = |f|/|B|$，且 $|B(Re^{i\theta})| = 1$（Blashke 乘积在 $C_R$ 上模为 $1$），故 $|h(Re^{i\theta})| = |f(Re^{i\theta})|$。代入得 Jensen 公式。 $\blacksquare$

> **依赖关系小结**: 本证明依赖链为「Blaschke 乘积 $B$（吸收零点、$|B| = 1$ 于 $C_R$，初等计算）⇒ 单连通域上的对数分支（Stein, Ch. 3, Theorem 6.2, p.119）⇒ $\log h$ 全纯 ⇒ [[cauchy-integral-formula|Cauchy 积分公式]]（取实部）⇒ Jensen 公式」。即「[[cauchy-theorem|Cauchy 定理]] ⇒ Cauchy 积分公式 ⇒ Jensen 公式」主线叠加单连通对数分支定理与 Blaschke 乘积的初等性质。本证明不依赖 Hadamard 因子分解、Nevanlinna 理论等后续内容，依赖图无环。

## 其他证明

> 主证明之外的另一标准证法，依 docs/PROOFS.md §6.5「多证明记录」规范录入；主证明（「详细证明」，Blaschke 乘积法）保持不变。

#### 证明二：调和函数法（孤立奇点分解）

**证明动机**。

主证明沿 [[blashke-product|Blaschke 乘积]] 路线：用边界上模为 $1$ 的零点因子 $B$ 吸收 $f$ 的全部零点，把 $f$ 化为无零点函数后取对数、用 Cauchy 公式取实部。本证法采取势论（Green 函数）视角：$\log|f|$ 在 $D_R$ 内除去零点处外是调和的，在每个零点 $z_k$ 处有对数奇点 $\log|z - z_k|$。把奇点显式分离——写 $\tilde f = f/\prod_k (z - z_k)$，对无零点的 $\tilde f$ 用调和函数的平均值性质——再对每个奇点项 $\log|z - z_k|$ 的圆周平均值作显式计算（结果为 $\log r$，一个初等积分）。两部分的贡献相加恰好给出 Jensen 公式。两法共享「单连通域上无零点全纯函数有对数分支」这一工具，但处理零点的机制不同：Blaschke 法在边界上归一化（$|B| = 1$），本法则把零点视为对数势，是势论 / 值分布理论的标准看法。

**证明思路**。

1. **分离奇点**——定义 $\tilde f(z) = f(z)/\prod_{k=1}^N (z - z_k)$；$\tilde f$ 在 $\Omega$ 上全纯、在 $\bar D_R$ 上无零点，且 $\tilde f(0) = f(0)/\prod_k(-z_k)$。
2. **调和性**——Claim 1：$\log|\tilde f|$ 在 $D_R$ 上调和（对数分支 + 全纯函数实部调和）。
3. **平均值性质**——对任意 $\max_k|z_k| < r < R$，对全纯函数 $\log \tilde f$ 用 Cauchy 积分公式并取实部，得 $\log|\tilde f(0)| = \frac{1}{2\pi}\int_0^{2\pi}\log|\tilde f(re^{i\theta})|\,d\theta$。
4. **化回 $f$ 与初等积分**——由 $\log|\tilde f(z)| = \log|f(z)| - \sum_k\log|z - z_k|$ 代入，再用 Claim 2（初等均值积分 $\frac{1}{2\pi}\int_0^{2\pi}\log|re^{i\theta} - z_k|d\theta = \log r$）。
5. **极限过渡**——Claim 3（积分对 $r$ 的连续性）保证可令 $r \to R^-$，整理得 Jensen 公式。

**详细证明**。

**Claim 1**（无零点全纯函数的对数之实部调和）. 设 $h$ 在 $D_R$ 上全纯且无零点，则 $u = \log|h|$ 在 $D_R$ 上调和。

*证明.* 因 $D_R$ 单连通（[[simply-connected-domain|单连通域]]），由 [[steinComplexAnalysis|Stein, Ch. 3, Theorem 6.2, p.119]]（单连通域上的对数分支），存在 $g$ 在 $D_R$ 上全纯使 $e^{g(z)} = h(z)$。于是 $u = \log|h| = \Re g$。写 $g = p + iq$（$p, q$ 实值光滑），由 Cauchy-Riemann 方程 $p_x = q_y$、$p_y = -q_x$，得 $p_{xx} + p_{yy} = q_{yx} - q_{xy} = 0$（混合偏导可交换）。故 $u = p$ 调和。$\blacksquare$

**第一阶段：分解与规范化。** 设 $z_1, \ldots, z_N$ 为 $f$ 在 $D_R$ 内的零点（按重数列出）。定义
$$\tilde f(z) = \frac{f(z)}{\prod_{k=1}^N (z - z_k)}.$$
对每个 $k$，$z_k$ 在列表中出现 $m_k$ 次当且仅当 $f$ 在 $z_k$ 处有 $m_k$ 阶零点（零点因子分解，Stein, Ch. 3, Theorem 1.1, p.92），故乘积中的因子恰好逐次消去 $f$ 在 $z_k$ 处的零点，$\tilde f$ 在 $z_k$ 处有可去奇点且取值非零；在其余点处，$\tilde f$ 是全纯函数的商且分母非零，故全纯。因此 $\tilde f$ 在 $\Omega$ 上全纯。因 $f$ 在 $D_R$ 内的零点恰为 $z_1, \ldots, z_N$（已全部消去）且 $f$ 在 $C_R$ 上无零点，$\tilde f$ 在 $\bar D_R$ 上无零点。又 $f(0) \neq 0$ 蕴含 $z_k \neq 0$，$\tilde f(0) = f(0)/\prod_{k=1}^N(-z_k) \neq 0$，故
$$\log|\tilde f(0)| = \log|f(0)| - \sum_{k=1}^N \log|z_k|.$$

**第二阶段：平均值性质。** 由 Claim 1，$\log|\tilde f|$ 在 $D_R$ 上调和，且（Claim 1 的证明中）$\log \tilde f$ 在 $D_R$ 上全纯。取 $r \in (\max_k|z_k|, R)$，对全纯函数 $\log \tilde f$ 在圆周 $C_r = \{|z| = r\}$ 上应用 [[cauchy-integral-formula|Cauchy 积分公式]]：
$$\log \tilde f(0) = \frac{1}{2\pi i}\int_{C_r}\frac{\log \tilde f(\zeta)}{\zeta}\,d\zeta = \frac{1}{2\pi}\int_0^{2\pi}\log \tilde f(re^{i\theta})\,d\theta.$$
取实部，得
$$\log|\tilde f(0)| = \frac{1}{2\pi}\int_0^{2\pi}\log|\tilde f(re^{i\theta})|\,d\theta.$$

**第三阶段：化回 $f$ 并分离奇点。** 在圆周 $|z| = r$ 上，$|\tilde f(z)| = |f(z)|/\prod_k|z - z_k|$，即
$$\log|\tilde f(z)| = \log|f(z)| - \sum_{k=1}^N \log|z - z_k|.$$
代入第二阶段的结果，得
$$\log|f(0)| - \sum_{k=1}^N \log|z_k| = \frac{1}{2\pi}\int_0^{2\pi}\log|f(re^{i\theta})|\,d\theta - \sum_{k=1}^N \frac{1}{2\pi}\int_0^{2\pi}\log|re^{i\theta} - z_k|\,d\theta.$$

**Claim 2**（初等均值积分）. 设 $|a| < r$。则
$$\frac{1}{2\pi}\int_0^{2\pi}\log|re^{i\theta} - a|\,d\theta = \log r.$$

*证明.* 由 $re^{i\theta} - a = re^{i\theta}(1 - (a/r)\exp(-i\theta))$ 得 $\log|re^{i\theta} - a| = \log r + \log|1 - (a/r)\exp(-i\theta)|$。作换元 $\theta \mapsto -\theta$（被积函数以 $2\pi$ 为周期），$\int_0^{2\pi}\log|1 - (a/r)\exp(-i\theta)|d\theta = \int_0^{2\pi}\log|1 - (a/r)e^{i\theta}|d\theta$。于是只需证 $b := a/r$（$|b| < 1$）满足 $\int_0^{2\pi}\log|1 - be^{i\theta}|d\theta = 0$。对 $|w| \le |b| < 1$，主分支 $\log(1 - w) = -\sum_{n=1}^{\infty} w^n/n$；因 $\sum_{n\ge 1}|b|^n/n \le \sum_{n\ge 1}|b|^n < \infty$（几何级数收敛），该级数在 $|w| \le |b|$ 上一致收敛（Weierstrass M 判别法），一致收敛的部分和可交换极限与积分，故
$$\int_0^{2\pi}\log(1 - be^{i\theta})\,d\theta = -\sum_{n=1}^{\infty}\frac{b^n}{n}\int_0^{2\pi}e^{in\theta}\,d\theta = 0,$$
其中 $\int_0^{2\pi}e^{in\theta}d\theta = [e^{in\theta}/(in)]_0^{2\pi} = 0$（$n \ge 1$）。取实部得 $\int_0^{2\pi}\log|1 - be^{i\theta}|d\theta = 0$。$\blacksquare$

由 Claim 2（取 $a = z_k$，注意 $r > \max_k|z_k|$），$\frac{1}{2\pi}\int_0^{2\pi}\log|re^{i\theta} - z_k|d\theta = \log r$ 对每个 $k$ 成立，第三阶段的等式化为
$$\log|f(0)| - \sum_{k=1}^N \log|z_k| = \frac{1}{2\pi}\int_0^{2\pi}\log|f(re^{i\theta})|\,d\theta - N\log r.$$

**第四阶段：极限过渡。**

**Claim 3**（积分在 $r \to R^-$ 时的连续性）. 设 $0 \le \rho < R$，$\Phi$ 在 $\bar D_R$ 上连续且在环形域 $\{z : \rho \le |z| \le R\}$ 上无零点，$a_1, \ldots, a_M \in D_R$ 满足 $\max_k|a_k| < \rho$。则
$$\lim_{r \to R^-}\frac{1}{2\pi}\int_0^{2\pi}\log|\Phi(re^{i\theta})|\,d\theta = \frac{1}{2\pi}\int_0^{2\pi}\log|\Phi(Re^{i\theta})|\,d\theta,$$
且对每个 $k$ 有 $\lim_{r\to R^-}\frac{1}{2\pi}\int_0^{2\pi}\log|re^{i\theta} - a_k|d\theta = \frac{1}{2\pi}\int_0^{2\pi}\log|Re^{i\theta} - a_k|d\theta$。

*证明.* 取 $r_0 \in (\rho, R)$。对 $(r, \theta) \in [r_0, R] \times [0, 2\pi]$，$re^{i\theta}$ 落在环形域 $\{r_0 \le |z| \le R\} \subset \{\rho \le |z| \le R\}$，故 $\Phi(re^{i\theta}) \neq 0$；又 $r \ge r_0 > \max_k|a_k|$，故 $re^{i\theta} \neq a_k$。于是 $\log|\Phi(re^{i\theta})|$ 与 $\log|re^{i\theta} - a_k|$ 在紧集 $[r_0, R] \times [0, 2\pi]$ 上连续（连续函数复合），从而一致连续；一致连续性保证相应积分作为 $r$ 的函数在 $[r_0, R]$ 上连续，故在 $R$ 处左连续。因 $r_0 \in (\rho, R)$ 任意，极限等式成立。$\blacksquare$

记 $r_* = \max\{|z_k| : 1 \le k \le N\}$（$N = 0$ 时约定 $r_* = 0$；因 $f$ 在 $C_R$ 上无零点，总有 $r_* < R$）。在第四阶段等式中令 $r \to R^-$：由 Claim 3 取 $\rho = (r_* + R)/2$——此时 $f$ 在 $\{\rho \le |z| \le R\}$ 上无零点（$f$ 的零点全在 $\{|z| \le r_*\}$ 内），且 $\max_k|z_k| = r_* < \rho$，故 $\Phi = f$ 与 $\Phi(z) = z - z_k$ 均满足 Claim 3 的条件——得
$$\log|f(0)| - \sum_{k=1}^N \log|z_k| = \frac{1}{2\pi}\int_0^{2\pi}\log|f(Re^{i\theta})|\,d\theta - N\log R,$$
其中对每个 $k$ 用了 Claim 2 在 $r = R$ 处的形式：$\frac{1}{2\pi}\int_0^{2\pi}\log|Re^{i\theta} - z_k|d\theta = \log R$（$|z_k| < R$）。移项，即得
$$\log|f(0)| = \sum_{k=1}^N \log\frac{|z_k|}{R} + \frac{1}{2\pi}\int_0^{2\pi}\log|f(Re^{i\theta})|\,d\theta,$$
这正是 Jensen 公式（Theorem 1.1, Stein, p.154）。$\blacksquare$

来源：〔非书内证明，标准结果〕——Stein 书中以 Blaschke 乘积证之（Ch. 5, Theorem 1.1 证明, p.154–156）；调和函数 / 势论证法为经典替代证法（如 Ahlfors, *Complex Analysis*, Green 函数处理）。依据：[[cauchy-integral-formula]]、[[simply-connected-domain]]、[[steinComplexAnalysis|Stein, Ch. 3, Theorem 6.2, p.119]]。录入日期：2026-08-13。

## What-if — 反例与边界

### 典型例子

1. **$f(z) = z - a$（$|a| < R$）**：$\log|f(0)| = \log |a|$。$\sum \log(R/|z_k|) = \log(R/|a|)$。$\frac{1}{2\pi} \int \log|Re^{i\theta} - a|\,d\theta = \log R$（Stein, p.156 例）。Jensen 给出 $\log|a| = -\log(R/|a|) + \log R = \log|a|$ ✓。
2. **$f(z) = e^z$**：无零点（$z_k$ 无）。Jensen 给出 $\log|f(0)| = 0 = 0 + \frac{1}{2\pi}\int \log|f(Re^{i\theta})|\,d\theta$。由调和性，$\int \log|e^{Re^{i\theta}}|\,d\theta = R \int \cos\theta\,d\theta = 0$ ✓。
3. **$f(z) = \sin z$**：零点 $z = n\pi$。在 $|z| < R$ 内有 $\pm 1, \pm 2, \ldots, \pm N$ 个零点。Jensen 公式给出对数增长率与零点密度的关系。

### 反例

1. **$f$ 在 $C_R$ 上有零点**：Jensen 公式**不直接适用**。须先用小扰动避开零点。
2. **$f$ 非全纯**：若 $f$ 在 $\Omega$ 内有非孤立奇点，Jensen 公式不适用。
3. **$f(0) = 0$**：公式中 $\log|f(0)| = -\infty$，需修改——实际上若 $f(0) = 0$（$n$ 阶），则 Jensen 公式变为
   $$\log |f'(0)/n!| = \sum_{k \neq 0} \log\frac{R}{|z_k|} + \frac{1}{2\pi} \int \log |f(Re^{i\theta})|\,d\theta - \log R.$$

### 边界情形

- **$f(0) = 0$**：将 $f(0) = 0$ 视为 0 阶零点（贡献 $-\infty$），或直接处理 $f(z)/z^n$。
- **$R \to \infty$**：对整函数 $f$，令 $R \to \infty$，Jensen 公式给出对数增长与零点密度的渐近关系——这是 Hadamard 定理的核心工具。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 基本版本（Stein Theorem 1.1） | $\log\|f(0)\| = \sum \log(R/\|z_k\|) + \frac{1}{2\pi}\int \log\|f\|$ | $f(0) \neq 0$ |
| 2. 零点积分形式（Lemma 1.2） | $\int n(r)/r\,dr = \sum \log(R/\|z_k\|)$ | 推论 |
| 3. 整函数推广 | $f$ 整 + $\|f(0)\| = 1$ 时类似 | Hadamard |
| 4. Poisson-Jensen 公式 | 圆周外点 $z$ 的推广 | 加权平均 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 基本版本 | Blashke 乘积 + 单连通对数 + Cauchy | 中 |
| 零点积分形式 | 交换积分与求和 | 低 |
| Poisson-Jensen | Poisson 公式变种 | 中至高 |
| 证明二（调和函数法） | 孤立奇点分解 + 调和平均值 + 初等均值积分 | 中 |

## 关联

- 概念：[[holomorphic-function]]、[[entire-function]]、[[order-of-growth]]
- 定理：[[cauchy-integral-formula]]（前置）、[[weierstrass-product-theorem]]（Hadamard 因子分解的来源）
- 方法：[[contour-integration|keyhole 围道（多孔形式）]]（多孔形式：Blashke 乘积的引入）、[[comparison-modulus]]、[[blashke-product|Blashke 乘积]]（核心构造）、[[homotopy-argument|同伦论证]]（$\log h$ 良定义性）、[[structural-randomness-decomposition|结构-随机性二分法]]
- 应用：Hadamard 定理（增长阶控制零点）、Nevanlinna 理论
- 源：[[steinComplexAnalysis]]（Ch. 5, Theorem 1.1, p.154）
