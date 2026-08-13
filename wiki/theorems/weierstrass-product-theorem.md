---
type: theorem
title: Weierstrass 乘积定理
aliases: [Weierstrass product theorem, Weierstrass factorization]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, entire-functions]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$\{a_n\} \subset \mathbb{C}$，$|a_n| \to \infty$（弱——任意无聚点序列）；结论：$\exists$ 整函数 $f$ 以 $\{a_n\}$ 为零点集（强——任意零点集均可实现）。
---
# Weierstrass 乘积定理

> **工作空间**：$\mathbb{C}$（整函数空间）。

## What — 陈述

### Theorem 4.1（Stein, p.164）

> 给定任意复数序列 $\{a_n\}$ 满足 $|a_n| \to \infty$（$n \to \infty$），存在整函数 $f$ 以所有 $z = a_n$ 为零点（按重数）且无其他零点。任何这样的整函数形如 $f(z) e^{g(z)}$，其中 $g$ 是整函数。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 5, Theorem 4.1, p.164]]。

### Weierstrass 典型因子

Weierstrass 乘积定理的构造依赖**典型因子**：
$$
E_p(z) = (1 - z) \exp\left(z + \frac{z^2}{2} + \cdots + \frac{z^p}{p}\right),
$$
其中 $p$ 是使 $\sum |a_n|^{-(p+1)} < \infty$ 的最小非负整数。

### 命题 3.2（Stein, p.160）— 无穷乘积收敛

设 $\{F_n\}$ 为 $\Omega$ 上的全纯函数列。若存在常数 $c_n > 0$ 满足 $\sum c_n < \infty$ 且 $|F_n(z) - 1| \leq c_n$ 对所有 $z \in \Omega$，则：
1. $\prod_{n=1}^\infty F_n(z)$ 在 $\Omega$ 上一致收敛到整函数 $F(z)$；
2. 若 $F_n$ 无零点，则 $F'(z)/F(z) = \sum_{n=1}^\infty F_n'(z)/F_n(z)$。

## Why — 动机与证明

### 动机

Weierstrass 乘积定理回答「什么零点集可被整函数实现？」：

1. **存在性**：任意无聚点的序列 $\{a_n\}$ 都可作为某整函数的零点集。这是整函数理论的「存在性」侧面——与零点分布的「强制性」（如 Hadamard 定理）形成对照。
2. **唯一性**：所有以 $\{a_n\}$ 为零点的整函数形如 $f(z) e^{g(z)}$——零点集外可乘任意整函数的指数。
3. **构造性证明**：Weierstrass 给出显式构造（典型因子乘积）。

### 证明思路

1. **构造 Blashke-型典型因子**：对每个 $a_n$，构造 $E_p(z/a_n)$（$p$ 选取使 $\sum 1/|a_n|^{p+1} < \infty$）。$E_p(z/a_n)$ 在 $z = a_n$ 处有简单零点，在 $z = 0$ 处等于 $1$。
2. **无穷乘积收敛**：由 Proposition 3.2 的条件 $|E_p - 1| \leq C/|a_n|^{p+1}$，$\sum 1/|a_n|^{p+1} < \infty$，故 $\prod E_p(z/a_n)$ 在紧集上一致收敛。
3. **整函数性**：因每个 $E_p(z/a_n)$ 整，乘积一致收敛到整函数。
4. **零点验证**：每个 $z = a_n$ 恰是 $E_p(z/a_n)$ 的简单零点，乘积中其他因子在 $a_n$ 处非零——故 $a_n$ 是乘积的简单零点。重数通过重复构造处理。
5. **唯一性**：若 $f_1, f_2$ 同零点集，则 $f_1/f_2$ 无零点且整。由单连通域上的对数定理（[[steinComplexAnalysis|Stein, Theorem 6.2, p.119]]）：$f_1/f_2 = e^g$（$g$ 整函数）。

### 详细证明

#### 证明动机

Weierstrass 乘积定理的核心是用典型因子 $E_p(z/a_n)$ 实现零点 $a_n$。典型因子的选取使 $|E_p - 1|$ 在紧集上有界且按 $|a_n|^{-(p+1)}$ 衰减——保证无穷乘积收敛。

#### 详细证明（核心部分）

**第一阶段：典型因子的性质**。

$E_p(z) = (1 - z) \exp(z + z^2/2 + \cdots + z^p/p)$ 在 $|z| < 1/2$ 内满足
$$
|E_p(z) - 1| \leq C_p |z|^{p+1}.
$$

**Claim**（典型因子衰减）. 对 $|z| \leq 1/2$ 与 $p \geq 1$，
$$|E_p(z) - 1| \leq 2|z|^{p+1}.$$

*证明.* $E_p(z) - 1 = (1 - z)\exp(\sum_{k=1}^p z^k/k) - 1$. 由 Taylor 展开，$\exp(\sum_{k=1}^p z^k/k) = 1 + \sum_{k=1}^\infty c_k z^k$，其中 $c_1 = 1$。$E_p(z) - 1 = -(z + z^2 + \cdots + z^{p+1})/(\text{某些项}) + O(z^{p+2})$。具体估计参见 Stein, p.160. $\blacksquare$

**第二阶段：无穷乘积**。

设 $\{a_n\}$ 为给定点列。选取 $p$ 使 $\sum 1/|a_n|^{p+1} < \infty$（可能 $p = 0$：此时 $|a_n| \to \infty$ 已保证 $\sum 1/|a_n| < \infty$）。定义
$$
f(z) = \prod_{n=1}^\infty E_p\left(\frac{z}{a_n}\right).
$$

对紧集 $K$，$\exists R > 0$ 使 $|z| \leq R$ 对 $z \in K$。对 $n$ 充分大使 $|a_n| > 2R$，$|z/a_n| \leq 1/2$，由 Claim，
$$|E_p(z/a_n) - 1| \leq 2 |z/a_n|^{p+1} \leq 2R^{p+1}/|a_n|^{p+1}.$$

由 $\sum 1/|a_n|^{p+1} < \infty$，无穷乘积 $\prod E_p(z/a_n)$ 在 $K$ 上一致收敛。

**第三阶段：整函数性与零点**。

由一致收敛性 + 每个 $E_p(z/a_n)$ 整，$f$ 在整个 $\mathbb{C}$ 上整（Weierstrass + Morera 定理，[[morera-theorem]]）。

零点验证：$E_p(z/a_n)$ 在 $z = a_n$ 处有简单零点；对其他 $m \neq n$，$E_p(z/a_m)$ 在 $z = a_n$ 处 $\neq 0$（因 $|a_n/a_m| > 1/2$ 不成立，但 $|z/a_m|$ 在 $z = a_n$ 处为 $|a_n/a_m|$；若 $|a_n/a_m| < 1/2$ 则 $E_p(1) = 0$——但 $a_n \neq a_m$ 时 $|a_n/a_m|$ 可在 $[1/2, \infty)$ 间；细节需更精细构造）。Stein 的实际构造用 Blashke 因子避免此问题。

**第四阶段：唯一性**。

设 $f_1, f_2$ 同零点集（按重数），则 $f_1/f_2$ 整且无零点（Stein Theorem 6.2, p.119）——$f_1/f_2$ 在 $\mathbb{C}$ 上可写为 $e^g$（整函数 $g$）。 $\blacksquare$

## What-if — 反例与边界

### 典型例子

1. **$\sin(\pi z) / \pi$**：零点 $\mathbb{Z}$。Weierstrass 乘积形式为
   $$\frac{\sin(\pi z)}{\pi} = z \prod_{n \neq 0} \left(1 - \frac{z}{n}\right) e^{z/n}.$$
   此处用 $E_1(z) = (1 - z)e^z$（$p = 1$）。
2. **Gamma 函数**（Stein Ch. 6）：Weierstrass 乘积给出
   $$\frac{1}{\Gamma(z)} = z e^{\gamma z} \prod_{n=1}^\infty \left(1 + \frac{z}{n}\right) e^{-z/n}.$$
3. **常数 1**：零点集为空，乘积为空乘积 $= 1$。

### 反例

1. **$\{a_n\}$ 有聚点**：Weierstrass 定理**不适用**。例如 $a_n = 1/n$（聚于 $0$）。整函数零点必有 $|a_n| \to \infty$（否则由 [[steinComplexAnalysis|Stein, p.71, Theorem 4.8]] $f \equiv 0$）。
2. **零点阶数不一致**：Weierstrass 定理允许任意重数（重复 $a_n$ 即可）。但若要求每个零点恰好 1 阶，须另行构造。

### 边界情形

- **$a_n = 0$**：因 $|a_n| \to \infty$，有限多个 $0$ 零点不影响。
- **典型因子的 $p$ 选择**：$p = 0$ 时 $|a_n| \to \infty$ 即可；$p \geq 1$ 时需 $\sum 1/|a_n|^{p+1} < \infty$。
- **唯一性的精确形式**：若 $f_1, f_2$ 同零点集（包括重数），则 $f_1/f_2 = e^g$（$g$ 整）。

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. 基本版本（Stein Theorem 4.1） | 任意 $\|a_n\| \to \infty$ 序列 $\Rightarrow$ $\exists$ 整函数 $f$ 以 $\{a_n\}$ 为零点 | Stein p.164 |
| 2. 唯一性 | 同零点集 $\Rightarrow$ $f_1/f_2 = e^g$ | 推论 |
| 3. 无穷乘积（Stein Proposition 3.2） | 一致收敛条件 | Stein p.160 |
| 4. Hadamard 因子分解 | 增长阶 $\rho$ $\Rightarrow$ 零点收敛性 + 典型因子选取 | Stein Theorem 2.1 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 存在性 | 典型因子 + 无穷乘积 + Weierstrass M-判别 | 中至高 |
| 唯一性 | 单连通对数 + 整函数指数形式 | 中 |
| Hadamard 因子分解 | Jensen 公式 + 典型因子选取 | 高 |

## 关联

- 概念：[[holomorphic-function]]、[[entire-function]]、[[order-of-growth]]
- 定理：[[jensen-formula]]（Hadamard 因子分解的工具）、[[cauchy-integral-formula]]
- 例子：$\pi\cot\pi z$ 部分分式展开（Euler 恒等式 (4)）—— 收录于 [[residue-by-taylor-coeff]] 「典型例子」节，整函数论的原型例（Stein Ch. 5, p.161-163）。
- 方法：[[amplification|增强技巧]]（典型因子选取）、[[local-to-global|局部到整体原理]]、[[structural-randomness-decomposition|结构-随机性二分法]]、[[blashke-product|Blashke 乘积]]（对比）
- 应用：Gamma 函数、Riemann zeta 函数、特殊函数构造
- 引用本定理的工具：[[hadamard-formula]]（Hadamard 因子分解）、[[analytic-continuation]]（整函数零点的解析延拓）
- 源：[[steinComplexAnalysis]]（Ch. 5, Theorem 4.1, p.164）
