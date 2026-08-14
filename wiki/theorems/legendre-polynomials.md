---
type: theorem
title: Legendre 多项式（$[-1,1]$ 上的完备正交系）
aliases: [Legendre polynomials, Legendre 多项式, Legendre expansion]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, orthogonal-basis, special-functions]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 为 $[-1,1]$ 上 Riemann 可积（弱）；结论：Legendre 多项式 $\{L_n\}$ 构成 $L^2([-1,1])$ 的完备正交系，Legendre 展开依均方收敛（强——$\{e^{inx}\}$ 之外第二族完备正交系，均方收敛框架的推广）。
---

# Legendre 多项式（$[-1,1]$ 上的完备正交系）

> **工作空间**：闭区间 $[-1,1]$（内积 $\langle f,g\rangle = \int_{-1}^1 f(x)\overline{g(x)}\,dx$）。

## What — 陈述

**定义（Rodrigues 公式）**。第 $n$ 个 **Legendre 多项式**
$$
L_n(x) = \frac{d^n}{dx^n}\bigl(x^2 - 1\bigr)^n, \qquad n = 0, 1, 2, \ldots
$$
为 $n$ 次多项式（$L_0 = 1$，$L_1 = 2x$，$L_2 = 12x^2 - 4$，$\ldots$）。

> **定理（Ch. 3, Ex. 2, p.110–113）**。
> (i) 正交性：$\langle L_n, x^m\rangle = 0$（$m < n$）；特别地 $\{L_n\}$ 是正交族；
> (ii) 范数：$\|L_n\|^2 = \dfrac{(n!)^2 2^{2n+1}}{2n+1}$；
> (iii) 唯一性：$n$ 次且正交于 $1, x, \ldots, x^{n-1}$ 的多项式必为 $L_n$ 的常数倍；
> (iv) 完备性：归一化 $\widetilde{L_n} = L_n/\|L_n\|$ 由 $\{1, x, x^2, \ldots\}$ 的 Gram-Schmidt 正交化得到；每个 $[-1,1]$ 上 Riemann 可积函数 $f$ 的 **Legendre 展开**
> $$
> \sum_{n=0}^\infty \langle f, \widetilde{L_n}\rangle\,\widetilde{L_n}
> $$
> 依均方范数收敛到 $f$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Exercise 2, p.110–113]]。

## Why — 动机与证明

### 动机

$\{e^{inx}\}$ 是圆群上的完备正交系；Legendre 多项式给出 $[-1,1]$ 上的第二族经典完备正交系，是正交基理论的一般框架（[[mean-square-convergence|均方收敛]]、Gram-Schmidt、Parseval）在非周期区间上的应用，也是特殊函数（Bessel、Hermite）家族的开端。

### 证明思路

1. **正交性**：对 $L_n = \frac{d^n}{dx^n}(x^2-1)^n$ 反复分部积分，边界项因 $(x^2-1)^k$ 在 $\pm 1$ 处为零而消失，导数全部转移到被积函数；
2. **范数**：用 (i) 取 $f = L_n$，化归为 $\int_{-1}^1(x^2-1)^n\,dx$ 的 Beta 型积分；
3. **唯一性**：正交条件给 $n$ 个线性方程，解空间一维；
4. **完备性**：由 Weierstrass 定理多项式稠密，Gram-Schmidt 过程保持张成空间。

### 详细证明

**Claim 1（分部积分恒等式）**。对 $[-1,1]$ 上 $n$ 次可微的 $f$，
$$
\int_{-1}^1 L_n(x)f(x)\,dx = (-1)^n\int_{-1}^1 (x^2-1)^n f^{(n)}(x)\,dx.
$$

*证明.* 分部积分一次：$\int L_n f = \left[L_n^{(n-1)}f\right]_{-1}^1 - \int L_n^{(n-1)}f'$。因 $L_n^{(k)} = \frac{d^{n+k}}{dx^{n+k}}(x^2-1)^n$ 且 $(x^2-1)^n$ 在 $x=\pm1$ 处有 $n$ 重零点，$L_n^{(k)}(\pm 1) = 0$ 对 $0 \le k \le n-1$，边界项为零。再分部积分 $n$ 次即得。$\blacksquare$

**正交性**。取 $f(x) = x^m$（$m < n$），则 $f^{(n)} = 0$，由 Claim 1 得 $\langle L_n, x^m\rangle = 0$。$\blacksquare$

**Claim 2（范数）**。$\|L_n\|^2 = \frac{(n!)^2 2^{2n+1}}{2n+1}$。

*证明.* 由 Claim 1 取 $f = L_n$，而 $L_n^{(n)} = \frac{d^{2n}}{dx^{2n}}(x^2-1)^n = (2n)!$（首项系数），
$$
\|L_n\|^2 = (-1)^n(2n)!\int_{-1}^1(x^2-1)^n\,dx = (2n)!\int_{-1}^1(1-x^2)^n\,dx.
$$
$\int_{-1}^1(1-x^2)^n\,dx = \frac{2^{2n+1}(n!)^2}{(2n+1)!}$（Beta 积分：换元 $x = \cos\theta$ 或归纳分部积分），代入即得 $\|L_n\|^2 = \frac{(n!)^2 2^{2n+1}}{2n+1}$。$\blacksquare$

**Claim 3（唯一性）**。若 $P$ 为 $n$ 次多项式且 $\langle P, x^m\rangle = 0$（$0 \le m \le n-1$），则 $P = c\,L_n$。

*证明.* $\{1, x, \ldots, x^n\}$ 是 $n$ 次多项式空间 $\Pi_n$ 的基。$L_n \in \Pi_n$ 且由正交性满足 $n$ 个线性条件 $\langle L_n, x^m\rangle = 0$（$m < n$）；这些条件在 $\Pi_n$（维数 $n+1$）中给秩至少 $n$ 的线性方程组，解空间一维，故任何满足同样条件的 $P$ 都是 $L_n$ 的倍数。$\blacksquare$

**完备性与均方收敛**。令 $Q_n$ 为对 $\{1, x, x^2, \ldots\}$ 施行 Gram-Schmidt 正交化得到的正交系。由归纳法 $Q_n$ 是 $n$ 次多项式且正交于 $1,\ldots,x^{n-1}$，由 Claim 3，$Q_n = \widetilde{L_n}$（差一个单位模常数，取正即等）。

对 Riemann 可积 $f$：由 [[weierstrass-approximation-trig|Weierstrass 逼近]]（多项式在 $C[-1,1]$ 中稠密，从而在 [[lp-space|$L^2$]] 中稠密），对任意 $\varepsilon > 0$ 存在多项式 $P$ 使 $\|f - P\| < \varepsilon$；$P$ 落在 $\{\widetilde{L_0},\ldots,\widetilde{L_N}\}$ 张成的子空间中（$N$ 充分大），故 $f$ 到该子空间的距离 $\to 0$。由正交投影理论（[[orthogonal-best-approximation|最优逼近]]），Legendre 部分和 $f_N = \sum_{n\le N}\langle f,\widetilde{L_n}\rangle\widetilde{L_n}$ 是最佳逼近，$\|f - f_N\| \le \|f - P\| < \varepsilon$，故 $\|f - f_N\| \to 0$。$\blacksquare$

> **依赖关系小结**：本证明依赖链为「分部积分（边界项由 $(x^2-1)^n$ 在 $\pm 1$ 处的零点消失）⇒ Claim 1 ⇒ 正交性与范数（Beta 型积分）⇒ 唯一性（线性代数：$n$ 个线性条件 ⇒ 解空间一维）⇒ 完备性」。完备性一步的定理级依赖为 [[weierstrass-approximation-trig|Weierstrass 逼近]]（多项式在 $C[-1,1]$ 中稠密，从而在 $L^2$ 中稠密）与 [[orthogonal-best-approximation|正交最佳逼近]]（部分和 $f_N$ 是子空间上的最优投影）；Gram-Schmidt 正交化与 [[lp-space|$L^2$ 空间]] 为基本概念工具。本证明**不依赖** Parseval 恒等式、Fourier 反演或均方收敛定理本身（该页自建收敛论证）。依赖图无环。

## What-if — 反例、等价叙述与推广

### 等价叙述

1. **生成函数**：$\sum_n L_n(x)\frac{t^n}{n!} = \frac{1}{\sqrt{1-2xt+t^2}}$（Legendre 多项式的生成函数，等价于 Rodrigues 公式）。
2. **Gram-Schmidt**：$\{\widetilde{L_n}\}$ 是 $\{1, x, x^2, \ldots\}$ 的正交化（陈述 (iv) 即此）。
3. **微分方程**：$L_n$ 是 Sturm-Liouville 方程 $(1-x^2)y'' - 2xy' + n(n+1)y = 0$ 的多项式解（等价于 (i)–(iii)）。

### 反例 / 边界

- **非周期区间上的均方收敛**：Legendre 展开的均方收敛性不蕴含逐点收敛——对仅 Riemann 可积的 $f$，展开在端点可能不收敛（与 [[mean-square-convergence|圆群情形]] 一致：均方收敛与逐点无关）。
- **$L_n$ 无界端点行为**：$|L_n(\pm 1)| = n!\,2^n$（由 Rodrigues 公式），正交归一化后 $\widetilde{L_n}(\pm 1) = \sqrt{n+1/2}\cdot 2^{n/2}\cdot\ldots$ 在端点增长——端点处无点态控制。

### 推广

- **第二族完备正交系**：与 $\{e^{inx}\}$（[[mean-square-convergence|圆群]]）并列，说明「完备正交系」框架（均方收敛 + Parseval + 最优逼近）不依赖具体区间。
- **特殊函数族**：Legendre、Hermite（[[hermite-functions|Hermite 函数]]）、Bessel（[[bessel-function|Bessel 函数]]）是同一正交系理论的三个经典实例。

## 证明难度差异

| 陈述 | 方法 | 难度 |
|------|------|------|
| 正交性 / 范数 | 分部积分 + Beta 积分 | **中** |
| 唯一性 | 线性代数（解空间一维） | **低** |
| 完备性 | Weierstrass + Gram-Schmidt | **中** |

## 关联

- 定理：[[mean-square-convergence]]（框架来源）、[[parseval-identity]]（能量等式）、[[weierstrass-approximation-trig|Weierstrass 逼近]]
- 概念：[[lp-space|$L^2$ 空间]]、[[fourier-series]]
- 引理：[[orthogonal-best-approximation|正交最佳逼近]]、[[cauchy-schwarz-inequality]]
- 方法：[[separation-of-variables]]（Legendre 方程源于 Laplace 方程的分离变量）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Exercise 2, p.110–113）
