---
type: lemma
title: 留数 = Laurent 展开的 a₋₁ 系数
aliases: [residue equals a_{-1}, residue by Laurent coefficient]
created: 2026-08-13
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, residues, laurent-expansion]
---

# 留数 = Laurent 展开的 a₋₁ 系数

> **工作空间**：$\mathbb{C}$ 中以 $z_0$ 为中心的去心邻域 $D_r(z_0)\setminus\{z_0\}$（Laurent 展开的围道积分证明中参数化 $\zeta = z_0 + re^{i\theta}$ 在圆周上进行）。

## 陈述

设 $f$ 在 $z_0$ 处有孤立奇点。在 $z_0$ 的去心邻域内，$f$ 有 Laurent 展开
$$
f(z) = \sum_{k=-\infty}^{\infty} a_k (z - z_0)^k = \sum_{k=1}^{\infty}\frac{a_{-k}}{(z-z_0)^k} + \sum_{k=0}^{\infty}a_k(z-z_0)^k.
$$
则 $f$ 在 $z_0$ 处的**留数**等于 Laurent 展开中 $(z - z_0)^{-1}$ 的系数 $a_{-1}$：
$$
\operatorname{Res}(f, z_0) = a_{-1} = \frac{1}{2\pi i}\oint_C f(z)\,dz,
$$
其中 $C$ 是 $z_0$ 邻域内的任意圆周（正向）。

特别地，若 $z_0$ 是 $f$ 的 $n$ 阶极点，则
$$
\operatorname{Res}(f, z_0) = \frac{1}{(n-1)!}\lim_{z\to z_0}\frac{d^{n-1}}{dz^{n-1}}\bigl[(z-z_0)^n f(z)\bigr].
$$
若 $z_0$ 是**简单极点**（$n = 1$），则
$$
\operatorname{Res}(f, z_0) = \lim_{z\to z_0}(z-z_0)f(z).
$$
当 $f(z) = g(z)/h(z)$，$g$ 在 $z_0$ 全纯、$h$ 在 $z_0$ 有单零点（即 $h'(z_0)\ne 0$）时，
$$
\operatorname{Res}(f, z_0) = \frac{g(z_0)}{h'(z_0)}.
$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, p.94, Theorem 1.3 / Theorem 1.4]]。

## 证明

**第一部分（基本形式）**。设 $f$ 在 $z_0$ 处有孤立奇点，Laurent 展开为 $f(z) = \sum_{k\in\mathbb{Z}}a_k(z-z_0)^k$。沿 $z_0$ 邻域内的圆周 $C = \{z: |z - z_0| = r\}$（正向），由 [[cauchy-integral-formula|Cauchy 积分公式]]的 Laurent 推广（或直接逐项积分）：
$$
\oint_C f(z)\,dz = \oint_C \sum_{k\in\mathbb{Z}} a_k(z - z_0)^k\,dz = \sum_{k\in\mathbb{Z}} a_k \oint_C (z - z_0)^k\,dz.
$$
对 $k \ne -1$，参数化 $z = z_0 + re^{i\theta}$、$dz = ire^{i\theta}\,d\theta$，
$$
\oint_C (z - z_0)^k\,dz = \int_0^{2\pi} r^k e^{ik\theta} \cdot ire^{i\theta}\,d\theta = ir^{k+1}\int_0^{2\pi} e^{i(k+1)\theta}\,d\theta = 0,
$$
因 $k \ne -1$ 时 $k + 1 \ne 0$，故 $\int_0^{2\pi} e^{i(k+1)\theta}\,d\theta = 0$。对 $k = -1$（参数化积分的旋转因子 $e^{i\theta}$，由 $z = z_0 + re^{i\theta}$ 与 $dz = ire^{i\theta}\,d\theta$ 给出，非 Fourier 核），
$$
\oint_C (z - z_0)^{-1}\,dz = \int_0^{2\pi} r^{-1} e^{i\theta} \cdot ire^{i\theta}\,d\theta = ir\int_0^{2\pi} e^{2i\theta}\,d\theta.
$$

但更简洁的写法是 $z - z_0 = re^{i\theta}$，$dz = ire^{i\theta}\,d\theta$，则 $(z - z_0)^{-1}\,dz = \frac{ire^{i\theta}\,d\theta}{re^{i\theta}} = i\,d\theta$。直接积分得 $\int_0^{2\pi} i\,d\theta = 2\pi i$。

**Stein 备注**：此处的 $e^{i\theta}$ 与 $e^{-i\theta}$ 均出现在圆周参数化中（取决于 $z = z_0 + re^{i\theta}$ 与 $z = z_0 + re^{-i\theta}$ 的取向选择），均为圆周积分旋转因子，与 Fourier 核 $e^{-2\pi i\xi x}$（Stein Fourier 约定）不同。详见 Stein Ch. 3, p.94。
故 $\oint_C f(z)\,dz = 2\pi i \cdot a_{-1}$，即 $a_{-1} = \frac{1}{2\pi i}\oint_C f(z)\,dz = \operatorname{Res}(f, z_0)$。

**第二部分（高阶极点公式）**。设 $z_0$ 是 $f$ 的 $n$ 阶极点，则 $(z-z_0)^n f(z)$ 在 $z_0$ 邻域全纯，故有 Taylor 展开
$$
(z - z_0)^n f(z) = \sum_{k=0}^{\infty} b_k (z - z_0)^k, \quad b_k = \frac{f^{(k)}(z_0)}{k!}\text{ 在 }n\text{ 阶消去后}.
$$
由第一部分，$\operatorname{Res}(f, z_0)$ 恰是 $f$ 的 Laurent 展开 $a_{-1}$，而 $a_{-1} = b_{n-1}/(n-1)!$。故
$$
\operatorname{Res}(f, z_0) = \frac{b_{n-1}}{(n-1)!} = \frac{1}{(n-1)!}\lim_{z\to z_0}\frac{d^{n-1}}{dz^{n-1}}\bigl[(z-z_0)^n f(z)\bigr].
$$

**第三部分（商形式简单极点）**。设 $f = g/h$，$g$ 在 $z_0$ 全纯，$h(z_0) = 0$、$h'(z_0) \ne 0$。因 $h'(z_0) \ne 0$，$h$ 在 $z_0$ 有单零点，故 $z_0$ 是 $f = g/h$ 的简单极点。由第一部分（$n = 1$ 情形），
$$
\operatorname{Res}(f, z_0) = \lim_{z\to z_0}(z - z_0) \cdot \frac{g(z)}{h(z)}.
$$
由 L'Hôpital 法则（或直接 Taylor 展开 $h(z) = h'(z_0)(z-z_0) + O((z-z_0)^2)$），
$$
\lim_{z\to z_0}\frac{z - z_0}{h(z)} = \lim_{z\to z_0}\frac{1}{h'(z)} = \frac{1}{h'(z_0)}.
$$
故 $\operatorname{Res}(f, z_0) = g(z_0)/h'(z_0)$。 $\blacksquare$

## 应用

- [[residue-theorem]]（Ch. 3, Theorem 2.1）：留数定理的核心成分——每个极点处 $\operatorname{Res}(f, z_k) = a_{-1}^{(k)}$。
- [[poles-classification]]：极点处的主部展开系数确定留数。
- [[fourier-coefficient-holomorphic]]（Ch. 3, Theorem 7.1）：[[fourier-coefficient|Fourier 系数]]与幂级数系数的对应关系——本质上是 Laurent 系数 $a_n$（圆周情形）的应用。
## 典型例子

### 例 1: $\pi\cot\pi z$ 的留数（Stein Ch. 5, p.161–163）

$\pi\cot\pi z = \dfrac{e^{i\pi z}+e^{-i\pi z}}{e^{i\pi z}-e^{-i\pi z}}$ 在每个整数 $n\in\mathbb Z$ 有简单极点，且
$$
\operatorname{Res}_{z=n}\pi\cot\pi z = \lim_{z\to n}(z-n)\,\pi\cot\pi z = \frac{1}{2\pi i}\cdot 2\pi i = 1.
$$
直接读取 Laurent 系数 $a_{-1}(n) = 1$。对 $\cot$ 在 $\pm n$ 的对称性 $\cot(-\zeta)=-\cot\zeta$ 给出
$$
\pi\cot\pi z = \frac{1}{z} + \sum_{n=1}^{\infty}\frac{2z}{z^2-n^2}
$$
——这就是 Euler 部分分式恒等式 (4)（Stein Ch. 5, p.161-163）所证内容。本恒等式作为整函数论的标准例子，归 [[weierstrass-product-theorem]] 「关联」与 [[jensen-formula]] 应用区段讨论。
- [[poisson-summation-formula]]（证明二，Book II）：$1/(e^{2\pi i z} - 1)$ 在 $z = n$ 处的残部 $1/(2\pi i)$ 是围道积分的关键输入。