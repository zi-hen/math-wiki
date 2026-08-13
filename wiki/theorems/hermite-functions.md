---
type: theorem
title: Hermite 函数（Fourier 变换与 Hermite 算子的完备特征函数系）
aliases: [Hermite functions, Hermite 函数, Hermite 特征函数]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, special-functions, quantum-mechanics]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 为 Schwartz 函数（弱——光滑速降）；结论：Hermite 函数 $\{h_k\}$ 构成 $L^2(\mathbb{R})$ 的完备正交系，同时是 Fourier 变换（特征值 $(-i)^k$）与 Hermite 算子 $L$（特征值 $2k+1$）的特征函数（强——一个系同时对角化两个算子，是 Heisenberg 原理的精确实现）。
---

# Hermite 函数（Fourier 变换与 Hermite 算子的完备特征函数系）

> **工作空间**：实数线 $\mathbb{R}$；内积 $\langle f,g\rangle = \int_{-\infty}^\infty f(x)\overline{g(x)}\,dx$；Fourier 变换取 Stein 约定 $\hat f(\xi) = \int f(x)e^{-2\pi i x\xi}\,dx$。

## What — 陈述

**定义（生成函数）**。Hermite 函数 $h_k$ 由生成恒等式
$$
\sum_{k=0}^\infty h_k(x)\,\frac{t^k}{k!} = e^{-(x^2/2 - 2tx + t^2)}
$$
给出。

> **定理（Ch. 5, Ex. 7, p.190）**。
> (i) **等价形式**：$h_k(x) = (-1)^k e^{x^2/2}\frac{d^k}{dx^k}e^{-x^2} = P_k(x)e^{-x^2/2}$，其中 $P_k$ 为 $k$ 次多项式；$h_k \in \mathcal{S}(\mathbb{R})$，$h_0 = e^{-x^2/2}$，$h_1 = 2xe^{-x^2/2}$；
> (ii) **完备性**：若 Schwartz 函数 $f$ 满足 $\langle f, h_k\rangle = 0$（$\forall k \ge 0$），则 $f = 0$；
> (iii) **Fourier 特征函数**：$h_k^* (x) = h_k((2\pi)^{1/2}x)$ 满足
> $$
> \widehat{h_k^*}(\xi) = (-i)^k h_k^*(\xi);
> $$
> (iv) **Hermite 算子特征函数**：$Lh_k = (2k+1)h_k$，其中 $L = -\frac{d^2}{dx^2} + x^2$；特别地 $\{h_k\}$ 相互正交；
> (v) **范数**：$\int_{-\infty}^\infty h_k(x)^2\,dx = \pi^{1/2}2^k k!$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Exercise 7, p.190]]。

## Why — 动机与证明

### 动机

[[hermite-operator|Hermite 算子]] $L = -d^2/dx^2 + x^2$ 是量子谐振子的哈密顿量。Hermite 函数是其完备特征函数系：$Lh_k = (2k+1)h_k$。更妙的是，同一个系（适当缩放后）也是 **Fourier 变换的特征函数**——特征值恰为 $(-i)^k$，即四次单位根 $\{1, -i, -1, i\}$，对应 $F^4 = I$（Ch. 5, Ex. 6）。这使 Hermite 系成为 $L^2(\mathbb{R})$ 上「同时对角化位置-动量算子族」的典范基。

### 证明思路

1. **等价形式**：生成函数配方 $e^{-(x^2/2-2tx+t^2)} = e^{x^2/2}e^{-(x-t)^2}$，用 Taylor 公式；
2. **L-特征值**：定义产生/湮灭算子 $A^* = -\frac{d}{dx} + x$，$A = \frac{d}{dx} + x$，验证 $A^*A = L - 1$ 且 $h_k = (A^*)^k h_0$、$Ah_0 = 0$；
3. **Fourier 特征值**：$e^{-\pi x^2}$ 是 Fourier 变换不动点，$F$ 共轭湮灭算子为 $i$ 倍的产生算子；
4. **完备性**：生成函数把正交条件化为 $f * e^{-x^2}$ 型卷积的消失，再以 Fourier 变换 / Weierstrass 型论证收尾。

### 详细证明

**Claim 1（等价形式）**。$h_k(x) = (-1)^k e^{x^2/2}\frac{d^k}{dx^k}e^{-x^2}$。

*证明.* 生成函数中 $e^{-(x^2/2-2tx+t^2)} = e^{x^2/2}e^{-(x-t)^2}$。对 $t$ 的 Taylor 展开：$e^{x^2/2}e^{-(x-t)^2} = e^{x^2/2}\sum_k \frac{(-1)^k}{k!}\frac{d^k}{dt^k}e^{-(x-t)^2}\Big|_{t=0}t^k = e^{x^2/2}\sum_k \frac{(-1)^k}{k!}\left[\frac{d^k}{dx^k}e^{-x^2}\right]t^k$（因 $\frac{d}{dt}e^{-(x-t)^2} = \frac{d}{dx}e^{-(x-t)^2}$）。比较 $t^k/k!$ 系数即得。$\blacksquare$

**Claim 2（L-特征值）**。$Lh_k = (2k+1)h_k$。

*证明.* 令 $A = \frac{d}{dx} + x$，$A^* = -\frac{d}{dx} + x$。直接计算：
$$
A^*A = \left(-\frac{d}{dx}+x\right)\left(\frac{d}{dx}+x\right) = -\frac{d^2}{dx^2} + x^2 - 1 = L - 1,
$$
且 $Ah_0 = \left(\frac{d}{dx}+x\right)e^{-x^2/2} = 0$。由 $h_k = (A^*)^k h_0$（Claim 1 与此定义一致，可归纳验证），利用交换子 $[A, A^*] = AA^* - A^*A = 2$：
$$
Ah_k = A(A^*)^k h_0 = (A^*)^k Ah_0 + 2k(A^*)^{k-1}h_0 = 2k h_{k-1},
$$
故 $Lh_k = (A^*A + 1)h_k = A^*(2k h_{k-1}) + h_k = (2k+1)h_k$。$\blacksquare$

**正交性**。$L$ 在 [[lp-space|$L^2$]] 内积下对称（分部积分，边界项为零），不同特征值 $2k+1$ 的特征函数 $\{h_k\}$ 相互正交。$\blacksquare$

**Claim 3（Fourier 特征值）**。$\widehat{h_k^*}(\xi) = (-i)^k h_k^*(\xi)$。

*证明（纲要）*。缩放 $h_k^*(x) = h_k((2\pi)^{1/2}x)$ 后，湮灭算子变为 $\widetilde A = \frac{d}{dx} + 2\pi x$，且 $e^{-\pi x^2}$ 满足 $\widetilde A e^{-\pi x^2} = 0$、$\widehat{e^{-\pi x^2}} = e^{-\pi\xi^2}$。Fourier 变换共轭 $\widetilde A$：由 $\widehat{(xf)}(\xi) = \frac{i}{2\pi}\hat f'(\xi)$ 与 $\widehat{(f')}(\xi) = 2\pi i\xi\hat f(\xi)$，
$$
\widehat{(\widetilde A f)}(\xi) = i\left(-\frac{d}{d\xi} + 2\pi\xi\right)\hat f(\xi) = i\,\widetilde A^*\hat f(\xi).
$$
归纳地，$\widehat{(h_k^*)} = \widehat{(\widetilde A^*)^k e^{-\pi x^2}} = (-i)^k(\widetilde A^*)^k e^{-\pi\xi^2} = (-i)^k h_k^*$（直接检验 $k = 0$ 与 $k = 1$ 与公式一致）。$\blacksquare$

**Claim 4（完备性）**。$\langle f, h_k\rangle = 0$（$\forall k$）⟹ $f = 0$（$f \in \mathcal{S}$）。

*证明.* 由生成函数，
$$
0 = \sum_k \langle f, h_k\rangle\frac{t^k}{k!} = \int f(x)e^{-(x^2/2-2tx+t^2)}\,dx = e^{-t^2}\int f(x)e^{-x^2/2}e^{2tx}\,dx
$$
对一切 $t$ 成立，故 $\int [f(x)e^{-x^2/2}]\,e^{2tx}\,dx \equiv 0$。该卷积型恒等式（Ch. 5, Ex. 8）推出 $f(x)e^{-x^2/2} \equiv 0$：两边作 Fourier 变换，卷积 $\mapsto$ 乘积，由 $e^{-x^2/2}$ 的变换不消失，得 $f \equiv 0$。$\blacksquare$

**范数**。由生成函数平方并对 $x$ 积分：$\sum_{k,\ell}\frac{t^k s^\ell}{k!\,\ell!}\langle h_k, h_\ell\rangle = \int e^{-(x^2/2-2tx+t^2)}e^{-(x^2/2-2sx+s^2)}dx$，正交性使左端仅保留 $k = \ell$ 项；右端为 $e^{2ts}\cdot(\text{常数})$ 型的 Gauss 积分，比较 $t^ks^k$ 系数得 $\int h_k^2 = \pi^{1/2}2^k k!$。$\blacksquare$

## What-if — 反例、等价叙述与推广

### 等价叙述

1. **特征函数语言**：$\{h_k^*\}$ 是 $F$ 的特征系（特征值 $(-i)^k$），$\{h_k\}$ 是 $L$ 的特征系（特征值 $2k+1$）。
2. **$F^4 = I$**：$(-i)^k$ 是 $1$ 的四次根，故 $F^4 = I$（Ch. 5, Ex. 6）——Fourier 变换的四次幂为恒等。
3. **产生-湮灭**：$A^*h_k = h_{k+1}$（产生算子提升能级），$Ah_k = 2k h_{k-1}$（湮灭算子降低能级）——量子力学 ladder operator 结构。

### 反例 / 边界

- **归一化因子敏感**：$h_k$（非缩放）不是 $F$ 的特征函数——必须缩放为 $h_k^*$ 才得特征值 $(-i)^k$；缩放因子 $(2\pi)^{1/2}$ 来自 Stein 的 Fourier 核 $e^{-2\pi ix\xi}$。
- **$L^2$ 而非逐点**：完备性是 $L^2$ 意义（范数收敛），不保证逐点展开——与 [[mean-square-convergence|均方收敛]] 的情形一致。

### 推广

- **Heisenberg 原理**：$L \ge I$（即 $\langle Lf, f\rangle \ge \langle f,f\rangle$）与 $A_t^*A_t \ge 0$ 的二次型论证给出 [[heisenberg-uncertainty-principle|Heisenberg 不确定性原理]]（Ch. 5, Ex. 23, (a)(c)）。
- **$d$ 维**：Hermite 系推广到 $\mathbb{R}^d$（张量积），给出 $d$ 维 Heisenberg 原理（Ch. 6, Ex. 6）。

## 证明难度差异

| 陈述 | 方法 | 难度 |
|------|------|------|
| 等价形式 | 生成函数 + Taylor | **低** |
| $L$ 特征值 | 产生-湮灭算子 | **中** |
| $F$ 特征值 | 算子共轭 + 缩放 | **中高** |
| 完备性 | 生成函数 + 卷积恒等式 | **中高** |

## 关联

- 定理：[[heisenberg-uncertainty-principle]]（$L \ge I$ 与 $A_t^*A_t$ 论证）、[[mean-square-convergence]]（$L^2$ 完备正交系框架）
- 概念：[[hermite-operator]]（$L$ 算子）、[[lp-space|$L^2$ 空间]]、[[schwartz-space|Schwartz 空间]]、[[fourier-transform]]
- 引理：[[orthogonal-best-approximation|正交最佳逼近]]、[[cauchy-schwarz-inequality]]
- 方法：[[separation-of-variables]]（谐振子方程的分离变量解）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5, Exercise 7, p.190）
