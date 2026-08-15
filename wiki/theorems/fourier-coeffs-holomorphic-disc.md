---
type: theorem
title: 全纯函数的 Fourier 系数（圆盘情形，Theorem 7.1）
aliases: [Fourier coefficients of holomorphic functions on a disc, holomorphic Fourier Thm 7.1, 圆盘全纯 Fourier 系数公式]
description: 全纯函数在圆周上的 Fourier 系数：$n \ge 0$ 时等于幂级数系数 $a_n / r^n$，$n < 0$ 时必为零；连接 Fourier 级数与 Taylor 展开。
created: 2026-08-15
updated: 2026-08-15
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, fourier-series, holomorphic-functions]
strength: strong
strength_basis: 弱条件（$f$ 在 $D_R(z_0)$ 全纯——比整函数弱）；强结论（精确的 Fourier 系数公式 + $n < 0$ 全部消失，对系数的 Cauchy 型上界 $|a_n| \le \rho(r)/r^n$）。这是 Fourier 分析与复分析的桥梁定理，Stein 在 Ch.3 §7 中作为 Fourier 卷最后的总结性结果给出。
---

# 全纯函数的 Fourier 系数（圆盘情形，Theorem 7.1）

> **工作空间**：复平面 $\mathbb{C}$ 中以 $z_0$ 为中心、$R$ 为半径的圆盘 $D_R(z_0)$；圆周 $|z - z_0| = r$（$0 < r < R$）上的 Fourier 系数采用 **Stein 圆周约定**（$\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta}) e^{-in\theta}\,d\theta$，核 $e^{-in\theta}$，对应圆群 $\mathbb{T} = \mathbb{R}/2\pi\mathbb{Z}$ 上的 Fourier 级数展开）。
> 〔非 Stein 约定：圆周 Fourier 核 $e^{-in\theta}$（无 $2\pi$ 因子，圆群约定）；与 Book I 的 $\mathbb{R}$ Fourier 约定 $e^{-2\pi i\xi x}$ 不同——保留 Stein 原书 Ch. 3 Theorem 7.1 的圆周参数化形式〕

## What — 陈述

> **Theorem 7.1**（Stein & Shakarchi, Ch. 3, p.120–122）. 设 $f$ 在 $D_R(z_0)$ 上全纯。则 $f$ 在 $z_0$ 处有幂级数展开
> $$
> f(z) = \sum_{n=0}^{\infty} a_n (z - z_0)^n, \qquad |z - z_0| < R.
> $$
> 对 $0 < r < R$，$f$ 在圆周 $|z - z_0| = r$ 上的 Fourier 系数（核 $e^{-in\theta}$，$n \in \mathbb{Z}$）为
> $$
> \boxed{\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-in\theta}\,d\theta = \begin{cases} a_n\,r^{-n}, & n \ge 0, \\ 0, & n < 0. \end{cases}}
> $$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Theorem 7.1, p.120–122]]。

### 推论（Stein, p.121）

- **平均值性质（Corollary 7.2）**：取 $n = 0$ 情形，$\hat f(0) = a_0 = f(z_0)$，故
  $$
  f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta.
  $$
  详见 [[mean-value-property-holomorphic]]。

- **实部平均值性质（Corollary 7.3）**：取 $f$ 的实部 $u = \operatorname{Re}(f)$，
  $$
  u(z_0) = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\,d\theta.
  $$
  详见 [[holomorphic-impl-harmonic|全纯 ⇒ 实部虚部调和]]。

### 前提条件

- $f$ 在 $D_R(z_0)$ 上**全纯**——比 $C^1$ 强（自动蕴含无穷可微 + 幂级数展开），比整函数弱（允许边界外有奇点）。
- 半径 $0 < r < R$ 任意。

## Why — 动机与证明

### 动机

**核心观察**：限制在圆周上的全纯函数的 Fourier 系数在 $n < 0$ 时**自动为零**——这是全纯性的「频率刻画」。

直观看：把 $f(z_0 + re^{i\theta})$ 展为 $\theta$ 的 Fourier 级数 $\sum_n \hat f(n) e^{in\theta}$。由 $f$ 在圆盘内全纯，$f$ 在 $z_0$ 处有 Taylor 展开
$$
f(z_0 + re^{i\theta}) = \sum_{n=0}^{\infty} a_n r^n e^{in\theta},
$$
即 Fourier 展开中**只出现 $e^{in\theta}$ 的非负幂**（$n \ge 0$）——这是因为 $r e^{i\theta} = z - z_0$ 代入 Taylor 展开 $(z-z_0)^n = r^n e^{in\theta}$ 给出。负幂 $e^{-in\theta}$（$n > 0$）对应**外圆盘的反射**——全纯性禁止这种来自圆盘外的振荡。

由此得 $\hat f(n) = 0$（$n < 0$）和 $\hat f(n) = a_n r^{-n}$（$n \ge 0$）。

### 证明思路

**关键步骤**：将 $f$ 的幂级数展开（z-域）与 Fourier 级数展开（$\theta$-域）联系起来。

1. **幂级数展开**：由 $f$ 在 $D_R(z_0)$ 上全纯，$f$ 有 Taylor 级数 $f(z) = \sum_{n=0}^{\infty} a_n(z-z_0)^n$（对 $|z - z_0| < R$ 一致收敛）。
2. **代入圆周**：置 $z = z_0 + re^{i\theta}$（$0 < r < R$），
   $$
   f(z_0 + re^{i\theta}) = \sum_{n=0}^{\infty} a_n r^n e^{in\theta}.
   $$
   右边已是 Fourier 级数形式（核 $e^{in\theta}$，系数 $a_n r^n$）。
3. **Fourier 系数提取**：两边乘 $e^{-im\theta}$ 并对 $\theta \in [0, 2\pi]$ 积分，由正交性 $\int_0^{2\pi} e^{i(n-m)\theta}\,d\theta = 2\pi \delta_{nm}$，得
   $$
   \hat f(m) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-im\theta}\,d\theta = a_m r^m \quad (m \ge 0).
   $$
   对 $m < 0$：因右端求和从 $n = 0$ 开始，$\int e^{i(n-m)\theta}\,d\theta$ 在 $n \ge 0$、$m < 0$ 时 $n - m \ge 1$，故积分为零——从而 $\hat f(m) = 0$。
4. **系数估计**（可选）：由 $|a_n| = |\hat f(n)| r^n \le \max_\theta |f(z_0 + re^{i\theta})|$，得 $|a_n| \le \rho(r)/r^n$（其中 $\rho(r) = \max_\theta |f(z_0 + re^{i\theta})|$）。

### 详细证明

**Claim 1**（幂级数展开的存在与一致收敛）. 设 $f$ 在 $D_R(z_0)$ 上全纯，则 $f$ 在 $z_0$ 处有 Taylor 展开
$$
f(z) = \sum_{n=0}^{\infty} a_n(z - z_0)^n,
$$
其中 $a_n = f^{(n)}(z_0)/n!$。对任意紧圆盘 $\overline{D_r(z_0)} \subset D_R(z_0)$（$r < R$），此级数**绝对一致收敛**。

*证明*. 由 $f$ 全纯，$f$ 在 $z_0$ 邻域可微。Stein Theorem 4.1（[[cauchy-integral-formula|Cauchy 积分公式]]）给出 $f$ 在 $z_0$ 邻域内无穷可微，故 $a_n = f^{(n)}(z_0)/n!$ 有定义。Stein Theorem 5.4（Ch. 1 §5）由 Cauchy 估计证明 Taylor 展开在 $\overline{D_r(z_0)}$ 上一致收敛（关键工具：[[cauchy-inequalities|Cauchy 不等式]] $|f^{(n)}(z_0)| \le n! M / r^n$）。$\blacksquare$

**Claim 2**（圆周 Fourier 系数公式）. 对 $0 < r < R$、$m \in \mathbb{Z}$，
$$
\hat f(m) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-im\theta}\,d\theta = \begin{cases} a_m r^m, & m \ge 0, \\ 0, & m < 0. \end{cases}
$$

*证明*. 由 Claim 1，
$$
f(z_0 + re^{i\theta}) = \sum_{n=0}^{\infty} a_n r^n e^{in\theta},
$$
级数在 $\theta \in [0, 2\pi]$ 上一致收敛（因 $r < R$）。两边乘 $e^{-im\theta}$ 并对 $\theta$ 积分，**逐项积分的合法性**由一致收敛保证：
$$
\int_0^{2\pi} f(z_0 + re^{i\theta})\,e^{-im\theta}\,d\theta = \sum_{n=0}^{\infty} a_n r^n \int_0^{2\pi} e^{i(n-m)\theta}\,d\theta.
$$
由正交性
$$
\int_0^{2\pi} e^{i(n-m)\theta}\,d\theta = \begin{cases} 2\pi, & n = m, \\ 0, & n \ne m, \end{cases}
$$
故
- 当 $m \ge 0$ 时，求和中 $n = m$ 项保留：右端 $= 2\pi a_m r^m$，故 $\hat f(m) = a_m r^m$；
- 当 $m < 0$ 时，所有 $n \ge 0$ 满足 $n - m \ge 1$，右端 $= 0$，故 $\hat f(m) = 0$。

$\blacksquare$

**Claim 3**（系数估计）. 设 $\rho(r) = \max_{0 \le \theta \le 2\pi}|f(z_0 + re^{i\theta})|$，则
$$
|a_n| \le \frac{\rho(r)}{r^n}, \qquad n \ge 0.
$$

*证明*. 由 Claim 2，$|a_n| = |\hat f(n)|/r^n$。直接估计
$$
|\hat f(n)| = \left|\frac{1}{2\pi}\int_0^{2\pi} f e^{-in\theta}\,d\theta\right| \le \frac{1}{2\pi}\int_0^{2\pi} |f|\,|e^{-in\theta}|\,d\theta \le \rho(r),
$$
故 $|a_n| \le \rho(r)/r^n$。$\blacksquare$

> **依赖关系小结**. 本证明依赖链为「$f$ 在 $D_R(z_0)$ 全纯 ⇒ [[cauchy-integral-formula|Cauchy 积分公式]] ⇒ $f$ 无穷可微 ⇒ Claim 1（Taylor 展开在 $\overline{D_r(z_0)}$ 一致收敛，由 [[cauchy-inequalities|Cauchy 不等式]] 控制余项）⇒ Claim 2（圆周 Fourier 系数公式，逐项积分由一致收敛保证 + 三角正交性 $\int_0^{2\pi} e^{i(n-m)\theta}\,d\theta = 2\pi\delta_{nm}$）⇒ Claim 3（系数估计）⇒ 两个推论（平均值性质 Cor 7.2 与实部平均值 Cor 7.3）」。各 Claim 均前向依赖，未引用本页自身；除 Cauchy 积分公式 / Cauchy 不等式 / 全纯函数展开定理外无更深依赖（不依赖留数定理或更精细的工具）。依赖图无环。

## What-if — 反例、等价叙述与推广

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. **Theorem 7.1**（Stein, p.120–122） | $\hat f(n) = a_n r^{-n}$（$n \ge 0$）；$\hat f(n) = 0$（$n < 0$） | Ch. 3 §7 |
| 2. **Fourier 级数与 Taylor 系数等同** | $c_n = a_n/r^n$，$c_n = 0$（$n < 0$） | 同上（重述）|
| 3. **负频率消失** | $f$ 在圆盘内全纯 $\Rightarrow$ 圆周 Fourier 系数在 $n < 0$ 时为零 | 同上 |
| 4. **Theorem 3.5**（Book II, Ch. 4）类比 | $f$ 在上半平面全纯 $\Rightarrow$ $\hat f(\xi) = 0$（$\xi < 0$） | Ch. 4 Thm 3.5, p.145–146；详见 [[paley-wiener-theorem|Paley-Wiener]] 应用 |

**等价关系**：叙述 1 ≡ 2 ≡ 3（同一定理的不同重述）；叙述 4 是「负频率消失」在半平面情形的对应（Stein Ch. 4 Remark, p.146 显式指出此对比：「Here we are dealing with a function holomorphic in the upper half-plane, and there with a function holomorphic in a disc. In the present case the Fourier transform vanishes when $\xi < 0$, and in the earlier case, the Fourier coefficients vanish when $n < 0$」）。

### 反例 / 边界（条件不可削弱）

1. **$f$ 仅连续但非全纯**：Fourier 系数 $c_n$ 对 $n < 0$ 一般不为零。例如 $f(z_0 + re^{i\theta}) = e^{-i\theta}$ 对应 $f(z) = (z - z_0)/r$ 在 $z = z_0$ 附近不延拓为整函数——其 Fourier 系数 $c_{-1} = 1/r \ne 0$。
2. **$f$ 仅在圆周上定义**（不在圆盘内）：无 Fourier 系数结构保证，$c_n$ 可任意。
3. **$f$ 在圆盘外有极点**：例如 $f(z) = 1/(z - z_0 - R)$ 在 $|z - z_0| < R$ 内全纯，圆周 Fourier 系数 $c_n$ 一般非零（包括 $n < 0$ 的部分——但通过 $|z - z_0 - R| \ge R - r > 0$，仍可计算）。定理仅在 $f$ 在 $D_R$ **内**全纯时成立。
4. **$\alpha = 0$（$z_0 = 0$、$R = \infty$，整函数）**：定理对所有 $r > 0$ 成立——这是「整函数 Fourier 系数在 $n < 0$ 时为零」的特例。

### 推广 / 变体

- **$\mathbb{R}$ 上 Fourier 变换的对应（Theorem 3.5）**：$f$ 在上半平面全纯 + 中速递降 $\Rightarrow$ $\hat f(\xi) = 0$（$\xi < 0$）。与 Theorem 7.1 在「负频率消失」上完全平行。
- **调和函数情形**：Corollary 7.3 表明 $u = \operatorname{Re}(f)$ 满足平均值性质——这是调和函数的特征性质之一。详见 [[holomorphic-impl-harmonic]] 与（未来条目）[[harmonic-function]]。
- **多变量圆盘 $D_R(z_0) \subset \mathbb{C}^d$**：极坐标展开为 $f(z_0 + r\omega) = \sum_n a_n(\omega) r^{|n|}$（$\omega \in S^{2d-1}$，$n$ 为多重指标）——Fourier 系数仍在「负多重指标」上消失。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| Theorem 7.1 | 幂级数代入 + 三角正交性 | **低** | 仅适用单复变量圆盘 |
| Theorem 3.5（半平面版） | 围道平移 + Fourier 衰减 | **中** | 须条带全纯 + 中速递降 |
| 高维版（$\mathbb{C}^d$） | 多重 Fourier + 多重指标 Taylor 展开 | **中** | 高维情形需球面调和分析 |

## 相关习题

> 与定理强相关的 exercise/problem（替代证法、特例、反例、证明直接引用）必须在此填充**陈述**（不含证明）；证明仅存在于习题/问题页。

- [[ch3-ex18-slow-decay|Ch.3 Ex.18]]：连续函数 Fourier 系数可任意慢衰减——与本题「全纯 ⇒ $c_n = 0$（$n < 0$）」形成对照。
- （未来条目）**Ch.3 Ex.7**（Stein Complex）：$f(z) = 1/(1-z)$ 在 $|z| < 1$ 内全纯，其 Fourier 系数在 $n < 0$ 时为零的直接验证。

## 应用

- **平均值性质**（Corollary 7.2）：$f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta$——全纯函数的核心刻画工具。详见 [[mean-value-property-holomorphic]]。
- **实部调和性**（Corollary 7.3）：$u = \operatorname{Re}(f)$ 调和——连接复分析与位势理论。详见 [[holomorphic-impl-harmonic]]。
- **最大模原理**：由 $u$ 调和 $\Rightarrow$ $u$ 在内部取最大值仅当常值，取 $u = \log|f|$（$f$ 无零点）或 $|f|$（$f$ 无零点时的 $\log|f|$ 取极限）——给出 |f| 在内部不能取最大值。详见 [[maximum-modulus-principle]]。
- **Cauchy 积分公式的 Fourier 表述**：Theorem 7.1 把 $f$ 在圆周上的 Fourier 系数等同于幂级数系数——这是 Fourier 分析与复分析的精确对应。
- **Paley-Wiener 定理**（半平面版）：Theorem 3.5 是 Theorem 7.1 的「$\mathbb{R}$ 上 Fourier 变换」对应。详见 [[paley-wiener-theorem]]。

## 关联

- 概念：[[holomorphic-function]]、[[fourier-coefficient-holomorphic]]（一般框架，本定理是其精确陈述）、[[power-series]]、[[fourier-coefficient|Fourier 系数]]（圆周版本）、[[fourier-series]]
- 定理：[[cauchy-integral-formula]]（Taylor 展开存在性的来源）、[[paley-wiener-theorem]]（Theorem 3.5 半平面对应）、[[maximum-modulus-principle]]（平均值性质的推论）、[[liouville-theorem|Liouville 定理]]（整函数版推论）、[[holomorphic-impl-harmonic]]（Corollary 7.3 的独立页）
- 引理：[[cauchy-inequalities]]（Taylor 系数估计）、[[residue-by-taylor-coeff]]（Laurent 系数 $a_{-1}$ 与圆周积分）、[[mean-value-property-holomorphic]]（Corollary 7.2 的独立引理页）
- 源：[[steinComplexAnalysis|Stein & Shakarchi (2003), 《Complex Analysis》, Ch. 3, §7, p.120–122]]