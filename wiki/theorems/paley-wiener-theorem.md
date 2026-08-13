---
type: theorem
title: Paley-Wiener 定理
aliases: [Paley-Wiener theorem, Theorem 3.1, Theorem 3.3]
created: 2026-08-11
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, fourier-analysis, paley-wiener]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f \in L^2(\mathbb{R})$ 且 $\operatorname{supp}(\hat{f}) \subset [-M, M]$（弱——仅需 $L^2$ 与紧支集，不要求光滑性）；结论：$f$ 可延拓为整函数且 $|f(z)| \leq A e^{2\pi M|\operatorname{Im}(z)|}$（强——解析延拓至全平面 $\mathbb{C}$ 并给出精确的指数型增长控制）。此定理建立了频率空间紧支集性与物理空间解析延拓性之间的等价关系，其逆向证明依赖 [[phragmen-lindelof-theorem|Phragmén-Lindelöf 定理]]。
---
# Paley-Wiener 定理

> **工作空间**：实直线 $\mathbb{R}$（Fourier 变换）；复平面 $\mathbb{C}$（整函数延拓）；带域 $\{z \in \mathbb{C} : |\operatorname{Im}(z)| < a\}$（正向定理的全纯延拓）。

## 定理的逻辑定位

在 Stein《Complex Analysis》第 4 章 §3 中，Paley-Wiener 定理由两个方向的定理组成：

```
§1: 类 F 的定义（速降函数空间）
    ↓
§2: Fourier 变换是 F 上的自同构
    ↓
§3, Theorem 3.1: Paley-Wiener 正向（全纯延拓 + 中速下降 ⇒ F̂ 紧支集）  ← 本页
    ↓
§3, Theorem 3.4: [[phragmen-lindelof-theorem|Phragmén-Lindelöf 定理]]（扇形上的最大模原理推广）
    ↓
§3, Theorem 3.3: Paley-Wiener 逆向（F̂ 紧支集 ⇒ 全纯延拓为指数型整函数）  ← 本页
```

Theorem 3.3 的证明依赖 [[phragmen-lindelof-theorem|Phragmén-Lindelöf 定理]]（Theorem 3.4）作为关键工具。

## What — 定理陈述

### Theorem 3.1（Paley-Wiener 正向）

> 设 $f \in \mathcal{F}$（[[schwartz-space|Schwartz 空间]]）。若 $f$ 可延拓为带域 $\{z \in \mathbb{C} : |\operatorname{Im}(z)| < a\}$（某 $a > 0$）上的全纯函数，且满足中速下降条件
>
> $$|f(x + iy)| \leq C_N (1+|x|)^{-N} e^{2\pi M |y|}, \qquad \forall\, N \geq 0,\ |y| < a,$$
>
> 则 $\operatorname{supp}(\hat{f}) \subset [-M, M]$。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis, Ch. 4, §3, Theorem 3.1]]。

### Theorem 3.3（Paley-Wiener 逆向）

> 设 $f \in L^2(\mathbb{R})$（[[lp-space|$L^2$ 空间]]）。若 $\operatorname{supp}(\hat{f}) \subset [-M, M]$，则 $f$ 可延拓为 $\mathbb{C}$ 上的整函数，且满足
>
> $$|f(z)| \leq A\, e^{2\pi M |\operatorname{Im}(z)|}, \qquad \forall\, z \in \mathbb{C}.$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis, Ch. 4, §3, Theorem 3.3]]。

### 等价关系的实质

Paley-Wiener 定理建立了以下等价：

$$\operatorname{supp}(\hat{f}) \subset [-M, M] \quad \Longleftrightarrow \quad f \text{ 可延拓为指数型 } 2\pi M \text{ 的整函数}$$

即**频率空间的紧支集性等价于物理空间的解析延拓性**。这是 Fourier 分析与复分析之间最深刻的联系之一。

### 条件分析

| 定理 | 条件 | 结论 | 条件强度 |
|------|------|------|---------|
| Theorem 3.1（正向） | $f \in \mathcal{S}$ + 带域全纯 + 中速下降 | $\operatorname{supp}(\hat{f}) \subset [-M,M]$ | 强（需 Schwartz + 全纯延拓） |
| Theorem 3.3（逆向） | $f \in L^2(\mathbb{R})$ + $\operatorname{supp}(\hat{f}) \subset [-M,M]$ | 整函数延拓 + 指数型增长 | 弱（仅需 $L^2$ + 紧支集） |

## Why — 动机与证明思路

### 动机：频率与解析性的对偶

Fourier 变换将物理空间的微分算子对角化为频率空间的乘法算子。Paley-Wiener 定理揭示了更深层的对偶：**物理空间的解析性对应于频率空间的支集限制**。

直观理解：若 $\hat{f}$ 紧支于 $[-M,M]$，则

$$
f(z) = \int_{-M}^{M} \hat{f}(\xi)\, e^{2\pi i \xi z}\, d\xi.
$$

由于积分区域紧且有界，被积函数 $e^{2\pi i \xi z}$ 对每个 $z \in \mathbb{C}$ 整函数，故 $f(z)$ 可延拓为整函数。增长估计

$$
|f(z)| \leq \int_{-M}^{M} |\hat{f}(\xi)|\, e^{2\pi \xi \operatorname{Im}(z)}\, d\xi \leq \|\hat{f}\|_{L^1}\, e^{2\pi M |\operatorname{Im}(z)|}
$$

直接给出指数型 $2\pi M$ 的增长控制。

### 正向定理（Theorem 3.1）的证明思路

正向定理的证明基于**围道变形**（contour shifting）。对 $|\xi| > M$，将 Fourier 逆变换的积分路径从实轴平移到 $\operatorname{Im}(z) = \pm y_0$（带域内），利用 Cauchy 定理得到

$$
\hat{f}(\xi) = \int_{-\infty}^{\infty} f(x)\, e^{-2\pi i \xi x}\, dx = \int_{-\infty \pm iy_0}^{\infty \pm iy_0} f(z)\, e^{-2\pi i \xi z}\, dz.
$$

由中速下降条件 $|f(x+iy)| \leq C_N(1+|x|)^{-N} e^{2\pi M|y|}$，取 $N$ 充分大并令 $y_0 \to a$，可证 $\hat{f}(\xi) \to 0$。关键：$e^{2\pi M|y|}$ 的增长被 $e^{-2\pi |\xi||y|}$ 的衰减压制，当 $|\xi| > M$ 时净衰减为正。

### 逆向定理（Theorem 3.3）的证明思路

逆向定理的证明分为两步：

1. **整函数延拓**：由 $f \in L^2(\mathbb{R})$ 与 $\operatorname{supp}(\hat{f}) \subset [-M,M]$，利用 Plancherel 定理得 $\hat{f} \in L^2([-M,M]) \subset L^1([-M,M])$（因 $[-M,M]$ 测度有限）。从而积分 $f(z) = \int_{-M}^{M} \hat{f}(\xi) e^{2\pi i \xi z} d\xi$ 绝对收敛，定义整函数，且增长估计 $|f(z)| \leq \|\hat{f}\|_{L^1} e^{2\pi M|\operatorname{Im}(z)|}$ 直接成立。

2. **利用 Phragmén-Lindelöf 控制增长**：证明中需要更精细地控制全纯函数在无界区域（如上半平面）上的增长，以验证指数型 $2\pi M$ 的界是最优的。此时最大模原理不可直接应用于无界区域，[[phragmen-lindelof-theorem|Phragmén-Lindelöf 定理]]（Theorem 3.4）恰好提供了在无界区域上控制全纯函数的工具——只需验证指数增长条件即可。

### Remark（p.146）：与圆盘结果的类比

Stein 在 p.146 的 Remark 中指出 Paley-Wiener 定理与第 3 章定理 7.1 的类比：

| | 上半平面（Paley-Wiener） | 圆盘（Ch. 3, Theorem 7.1） |
|---|---|---|
| 全纯区域 | $\operatorname{Im}(z) > 0$ | $|z| < 1$ |
| 频率性质 | $\hat{f}(\xi) = 0$（$\xi < 0$） | $a_n = 0$（$n < 0$） |
| 物理对应 | 单侧频谱 $\Leftrightarrow$ 上半平面解析 | 单侧 Fourier 系数 $\Leftrightarrow$ 圆盘内解析 |

此类比揭示了 Paley-Wiener 理论的本质：**频率空间的单侧支集性等价于物理空间的解析延拓性**。上半平面与圆盘通过共形映射 $z \mapsto (z-i)/(z+i)$ 相互转换，故两种叙述本质等价。

### 详细证明

#### 证明动机

Paley-Wiener 定理的两个方向分别用不同的方法：

- **正向定理（Theorem 3.1）**：从 $f$ 的全纯延拓与中速下降出发，证明 $\hat{f}$ 紧支于 $[-M, M]$。方法是将 Fourier 变换的积分路径从实轴平移到带域内（围道变形），利用 Cauchy 定理使围道间的贡献为零，再令平移量趋于带域边界 $a$，此时中速下降条件保证积分趋于零。

- **逆向定理（Theorem 3.3）**：从 $\hat{f}$ 紧支于 $[-M, M]$ 出发，证明 $f$ 可延拓为整函数。方法是用 Fourier 逆变换的积分表示 $f(z) = \int_{-M}^{M} \hat{f}(\xi) e^{2\pi i\xi z} d\xi$，此积分对一切 $z \in \mathbb{C}$ 绝对收敛，直接定义整函数并给出指数型增长界。

#### Theorem 3.1（正向）的详细证明

**目标**：设 $f \in$ [[schwartz-space|$\mathcal{S}(\mathbb{R})$]]，$f$ 在带域 $\{|\operatorname{Im}(z)| < a\}$ 上全纯，满足中速下降 $|f(x+iy)| \leq C_N (1+|x|)^{-N} e^{2\pi M|y|}$（$\forall\, N \geq 0$，$|y| < a$）。证明 $\hat{f}(\xi) = 0$ 对 $|\xi| > M$ 成立。

**第一阶段：围道变形**。

固定 $|\xi| > M$，先处理 $\xi > M$ 的情形（$\xi < -M$ 的情形对称处理，改为向上平移）。对 $0 < y_0 < a$，将 Fourier 变换的积分路径从实轴向下平移到 $\operatorname{Im}(z) = -y_0$。由 Fourier 变换定义，
$$
\hat{f}(\xi) = \int_{-\infty}^{\infty} f(x)\, e^{-2\pi i \xi x}\, dx.
$$

考虑矩形围道 $\Gamma_R$，顶点为 $(-R, 0)$, $(R, 0)$, $(R, -iy_0)$, $(-R, -iy_0)$。因 $f(z)\, e^{-2\pi i \xi z}$ 在 $\Gamma_R$ 及其内部全纯（由 $f$ 在带域 $\{|\operatorname{Im}(z)| < a\}$ 内全纯且 $y_0 < a$ 保证），由 Cauchy 定理（[[steinComplexAnalysis|Stein, Ch. 1, Theorem 2.1]]），
$$
\oint_{\Gamma_R} f(z)\, e^{-2\pi i \xi z}\, dz = 0.
$$

**Claim 1**（竖直边的贡献趋于零）. 当 $R \to \infty$ 时，围道 $\Gamma_R$ 的两条竖直边上的积分趋于零。

*证明.* 在右侧竖直边 $z = R - iy$（$0 \leq y \leq y_0$）上，由中速下降条件（$|\operatorname{Im}(R - iy)| = y \leq y_0 < a$），
$$
|f(R - iy)| \leq C_N (1+R)^{-N} e^{2\pi M y_0}.
$$
又因 $\xi > 0$ 且 $y \geq 0$，
$$
|e^{-2\pi i \xi (R - iy)}| = e^{-2\pi \xi y} \leq 1.
$$
故被积函数的模满足
$$
|f(R - iy)\, e^{-2\pi i \xi (R - iy)}| \leq C_N (1+R)^{-N} e^{2\pi M y_0}.
$$
取 $N \geq 2$，竖直边长度为 $y_0$，故右侧竖直边积分的模为
$$
\left|\int_0^{y_0} f(R - iy)\, e^{-2\pi i \xi (R - iy)}\, (-i)\, dy\right| \leq C_N (1+R)^{-N} e^{2\pi M y_0} \cdot y_0 \xrightarrow{R \to \infty} 0,
$$
其中 $|-i| = 1$。左侧竖直边 $z = -R - iy$ 的论证完全相同。$\blacksquare$

由 Claim 1，令 $R \to \infty$，Cauchy 定理给出围道变形公式
$$
\hat{f}(\xi) = \int_{-\infty}^{\infty} f(x)\, e^{-2\pi i \xi x}\, dx = \int_{-\infty - iy_0}^{\infty - iy_0} f(z)\, e^{-2\pi i \xi z}\, dz. \tag{1}
$$

**第二阶段：估计平移后的积分**。

对 (1) 右端，令 $z = x - iy_0$（$x \in \mathbb{R}$），则 $dz = dx$，且
$$
e^{-2\pi i \xi z} = e^{-2\pi i \xi (x - iy_0)} = e^{-2\pi i \xi x} \cdot e^{-2\pi \xi y_0},
$$
其中最后一步用到 $-i \cdot (-iy_0) = -y_0$，故 $e^{-2\pi i \xi \cdot (-iy_0)} = e^{-2\pi \xi y_0}$。代入 (1) 得
$$
\hat{f}(\xi) = e^{-2\pi \xi y_0} \int_{-\infty}^{\infty} f(x - iy_0)\, e^{-2\pi i \xi x}\, dx. \tag{2}
$$

此处 $e^{-2\pi \xi y_0}$ 为衰减因子（$\xi > 0$，$y_0 > 0$）。由中速下降条件 $|f(x - iy_0)| \leq C_N (1+|x|)^{-N} e^{2\pi M y_0}$（因 $|\operatorname{Im}(x - iy_0)| = y_0 < a$），取 $N \geq 2$ 保证 $\int_{-\infty}^{\infty} (1+|x|)^{-N}\, dx$ 收敛，故 (2) 中的积分绝对收敛。对 (2) 取绝对值：
$$
|\hat{f}(\xi)| \leq e^{-2\pi \xi y_0} \cdot C_N e^{2\pi M y_0} \int_{-\infty}^{\infty} (1+|x|)^{-N}\, dx = C'_N\, e^{-2\pi(\xi - M) y_0}, \tag{3}
$$
其中 $C'_N = C_N \int_{-\infty}^{\infty} (1+|x|)^{-N}\, dx$ 为常数，依赖于 $N$ 但不依赖于 $y_0$。关键在于衰减因子 $e^{-2\pi \xi y_0}$ 与中速下降的增长因子 $e^{2\pi M y_0}$ 的组合为 $e^{-2\pi(\xi - M) y_0}$，当 $\xi > M$ 时净效应为衰减。

**第三阶段：令 $y_0 \to a$ 利用 $\xi > M$**。

不等式 (3) 对所有 $0 < y_0 < a$ 成立，且左端 $|\hat{f}(\xi)|$ 不依赖于 $y_0$。

**Claim 2**（$\hat{f}(\xi) = 0$ 对 $|\xi| > M$）. 对 $\xi > M$，因 $\xi - M > 0$，$e^{-2\pi(\xi - M) y_0}$ 随 $y_0$ 增大而严格递减趋于零。因 $f$ 可延拓为整函数（$a$ 可任意大），令 $y_0 \to +\infty$，(3) 右端 $C'_N\, e^{-2\pi(\xi - M) y_0} \to 0$，而左端 $|\hat{f}(\xi)|$ 为固定非负数，故 $|\hat{f}(\xi)| = 0$，即 $\hat{f}(\xi) = 0$。$\xi < -M$ 的情形向上平移（取 $z = x + iy_0$），论证完全对称：$e^{-2\pi i \xi z}$ 的模为 $e^{2\pi \xi y_0} = e^{-2\pi|\xi| y_0}$（因 $\xi < 0$，提供衰减），与中速下降的 $e^{2\pi M y_0}$ 组合得 $e^{-2\pi(|\xi| - M) y_0}$，因 $|\xi| > M$ 故净衰减为正，令 $y_0 \to +\infty$ 得 $\hat{f}(\xi) = 0$。$\blacksquare$

由 Claim 2，$\operatorname{supp}(\hat{f}) \subset [-M, M]$。$\blacksquare$

#### Theorem 3.3（逆向）的详细证明

**目标**：设 $f \in$ [[lp-space|$L^2(\mathbb{R})$]]，$\operatorname{supp}(\hat{f}) \subset [-M, M]$。证明 $f$ 可延拓为整函数且 $|f(z)| \leq A e^{2\pi M|\operatorname{Im}(z)|}$。

**第一阶段：$\hat{f} \in L^1([-M, M])$**。

由 Plancherel 定理（[[steinFourierAnalysisIntroduction2003a|Stein, Ch. 5, Theorem 1.12]]），$f \in L^2(\mathbb{R})$ 蕴含 $\hat{f} \in L^2(\mathbb{R})$。因 $\operatorname{supp}(\hat{f}) \subset [-M, M]$，有 $\hat{f} \in L^2([-M, M])$。

**Claim 3**（$L^2([-M,M]) \subset L^1([-M,M])$）. 若 $g \in L^2([-M, M])$，则 $g \in L^1([-M, M])$。

*证明.* 由 [[cauchy-schwarz-inequality|Cauchy-Schwarz 不等式]]，
$$
\int_{-M}^{M} |g(\xi)|\, d\xi \leq \left(\int_{-M}^{M} |g(\xi)|^2\, d\xi\right)^{1/2} \left(\int_{-M}^{M} 1\, d\xi\right)^{1/2} = \|g\|_{L^2} \cdot \sqrt{2M} < \infty.
$$
此不等式成立因 $[-M, M]$ 测度有限。$\blacksquare$

由 Claim 3，$\hat{f} \in L^1([-M, M])$，故 $\|\hat{f}\|_{L^1} < \infty$。

**第二阶段：整函数延拓**。

由 Fourier 逆变换公式，对 $x \in \mathbb{R}$，
$$
f(x) = \int_{\mathbb{R}} \hat{f}(\xi)\, e^{2\pi i \xi x}\, d\xi = \int_{-M}^{M} \hat{f}(\xi)\, e^{2\pi i \xi x}\, d\xi,
$$
其中第二个等号用到 $\operatorname{supp}(\hat{f}) \subset [-M, M]$。定义整函数延拓：对 $z \in \mathbb{C}$，
$$
f(z) = \int_{-M}^{M} \hat{f}(\xi)\, e^{2\pi i \xi z}\, d\xi. \tag{4}
$$

**Claim 4**（$f(z)$ 为整函数）. 积分 (4) 定义 $\mathbb{C}$ 上的整函数。

*证明.* 对每个 $\xi \in [-M, M]$，$e^{2\pi i \xi z}$ 为 $z$ 的整函数。由 Claim 3，$\hat{f} \in L^1([-M, M])$，且 $|e^{2\pi i \xi z}| = e^{-2\pi \xi \operatorname{Im}(z)} \leq e^{2\pi M |\operatorname{Im}(z)|}$（一致有界，固定 $z$）。由 Weierstrass 判别法（被积函数关于 $z$ 的导数一致有界），积分 (4) 可在积分号下求导，故 $f(z)$ 全纯。此论证对任意 $z \in \mathbb{C}$ 成立，故 $f$ 为整函数。$\blacksquare$

**第三阶段：指数型增长界**。

由 (4)，对 $z \in \mathbb{C}$，
$$
|f(z)| = \left|\int_{-M}^{M} \hat{f}(\xi)\, e^{2\pi i \xi z}\, d\xi\right| \leq \int_{-M}^{M} |\hat{f}(\xi)| \cdot |e^{2\pi i \xi z}|\, d\xi.
$$
由 $|e^{2\pi i \xi z}| = e^{-2\pi \xi \operatorname{Im}(z)} \leq e^{2\pi |\xi| \cdot |\operatorname{Im}(z)|} \leq e^{2\pi M |\operatorname{Im}(z)|}$（因 $|\xi| \leq M$），
$$
|f(z)| \leq e^{2\pi M |\operatorname{Im}(z)|} \int_{-M}^{M} |\hat{f}(\xi)|\, d\xi = \|\hat{f}\|_{L^1}\, e^{2\pi M |\operatorname{Im}(z)|}.
$$
令 $A = \|\hat{f}\|_{L^1}$，得
$$
|f(z)| \leq A\, e^{2\pi M |\operatorname{Im}(z)|}, \qquad \forall\, z \in \mathbb{C}. \qquad \blacksquare
$$

## What-if — 反例与边界

### 典型例子

1. **例 1（sinc 函数）**：取 $f(x) = \frac{\sin(2\pi M x)}{\pi x}$。则 $\hat{f}(\xi) = \mathbf{1}_{[-M,M]}(\xi)$，$\operatorname{supp}(\hat{f}) = [-M,M]$。由 Theorem 3.3，$f$ 延拓为整函数 $f(z) = \frac{\sin(2\pi M z)}{\pi z}$，满足 $|f(z)| \leq C e^{2\pi M|\operatorname{Im}(z)|}$。此例中 $\hat{f}$ 恰为区间 $[-M,M]$ 的指示函数，支集达到临界值。

2. **例 2（带限信号）**：信号处理中的带限信号 (band-limited signal) 即满足 $\operatorname{supp}(\hat{f}) \subset [-M,M]$ 的 $L^2$ 函数。Paley-Wiener 定理保证带限信号可延拓为整函数，Nyquist 采样定理的数学基础即在于此。

3. **例 3（纯频率分量）**：取 $f(x) = e^{2\pi i \xi_0 x}$（$|\xi_0| \leq M$）。形式上 $\hat{f}(\xi) = \delta(\xi - \xi_0)$（分布意义）。$f$ 延拓为 $f(z) = e^{2\pi i \xi_0 z}$，$|f(z)| = e^{-2\pi \xi_0 \operatorname{Im}(z)} \leq e^{2\pi M|\operatorname{Im}(z)|}$。此为 $L^2$ 框架的极限情形。

### 反例

1. **反例 1（Gaussian，$\hat{f}$ 非紧支）**：取 $f(x) = e^{-\pi x^2}$，$\hat{f}(\xi) = e^{-\pi \xi^2}$，$\operatorname{supp}(\hat{f}) = \mathbb{R}$（非紧）。$f$ 虽为整函数，但沿虚轴 $|f(iy)| = e^{\pi y^2}$，增长速率 $e^{\pi y^2}$ 超过任何 $e^{Cy}$，故不满足指数型增长条件。此例表明：$\hat{f}$ 非紧支时，$f$ 虽可能整函数延拓，但不满足指数型增长界。

2. **反例 2（Lorentzian，$\hat{f}$ 非紧支且 $f$ 非整）**：取 $f(x) = \frac{1}{1+x^2}$，$\hat{f}(\xi) = \pi e^{-2\pi|\xi|}$，$\operatorname{supp}(\hat{f}) = \mathbb{R}$（非紧）。$f$ 在 $z = \pm i$ 处有极点，不能延拓为整函数。此例确认：$\hat{f}$ 非紧支 $\Rightarrow$ $f$ 无整函数延拓（即使放宽指数型条件）。

3. **反例 3（削弱 $L^2$ 条件）**：若 $f \in L^1(\mathbb{R}) \setminus L^2(\mathbb{R})$ 且 $\operatorname{supp}(\hat{f}) \subset [-M,M]$，Theorem 3.3 的 $L^2$ 版本不直接适用。但 $\hat{f} \in L^\infty([-M,M]) \subset L^1([-M,M])$，故积分 $\int_{-M}^{M} \hat{f}(\xi) e^{2\pi i \xi z} d\xi$ 仍定义整函数。$L^2$ 条件可放宽为 $L^1$，但增长估计中的常数 $A$ 需相应调整。

### 边界情形

- **支集恰为 $[-M,M]$**：sinc 函数（例 1）的 $\hat{f} = \chi_{[-M,M]}$，支集恰好达到临界值 $M$。对应的整函数 $f(z) = \sin(2\pi M z)/(\pi z)$ 的指数型恰为 $2\pi M$，不可改进。
- **$M \to 0$ 的极限**：若 $\operatorname{supp}(\hat{f}) = \{0\}$（即 $M = 0$），则 $f$ 为常数（$L^2$ 意义下），整函数延拓为常数函数，指数型 $0$。
- **单向支集（Hardy 空间联系）**：若 $\operatorname{supp}(\hat{f}) \subset [0, \infty)$（非紧但单向），则 $f$ 可延拓为下半平面上的全纯函数（非整函数）。此为 Hardy 空间 $H^2$ 的 Paley-Wiener 刻画，与 p.146 Remark 的类比直接相关。

### 常见误解

**误解**：「Paley-Wiener 定理要求 $f$ 为 Schwartz 函数。」

**纠正**：Theorem 3.3（逆向）仅要求 $f \in L^2(\mathbb{R})$，不要求 Schwartz 条件。Schwartz 空间条件仅出现在 Theorem 3.1（正向）中，用于保证 Fourier 变换的良定义性与中速下降条件的表述。

## 等价叙述

### 叙述 1（$L^2$ 版本，Stein Theorem 3.3）

> $f \in L^2(\mathbb{R})$，$\operatorname{supp}(\hat{f}) \subset [-M,M]$ $\Leftrightarrow$ $f$ 延拓为整函数，$|f(z)| \leq Ae^{2\pi M|\operatorname{Im}(z)|}$，且 $f|_\mathbb{R} \in L^2(\mathbb{R})$。

### 叙述 2（Schwartz 版本，Stein Theorem 3.1）

> $f \in \mathcal{S}(\mathbb{R})$，$f$ 在带域 $\{|\operatorname{Im}(z)| < a\}$ 上全纯且满足中速下降 $\Leftrightarrow$ $\operatorname{supp}(\hat{f}) \subset [-M,M]$。

**等价关系**：叙述 2 是叙述 1 在 Schwartz 框架下的强化版本——要求 $f \in \mathcal{S}$（强条件）但结论给出带域上的全纯延拓（比整函数弱）。两个叙述从不同方向刻画同一等价关系。

### 叙述 3（分布版本，Paley-Wiener-Schwartz 定理）

> 紧支集分布 $u \in \mathcal{E}'(\mathbb{R}^d)$ $\Leftrightarrow$ $\hat{u}$ 延拓为整函数且 $|\hat{u}(\zeta)| \leq C(1+|\zeta|)^N e^{2\pi M|\operatorname{Im}(\zeta)|}$（某 $N \geq 0$）。

**注**：此为 Paley-Wiener 定理的分布推广，将 $L^2$ 函数推广至紧支集分布，指数型增长推广至多项式乘以指数型增长。〔非 Stein 原表述，属于 Schwartz 分布理论。〕

## 证明难度差异

### 正向定理（Theorem 3.1）的证明

- **方法**：围道变形 + Cauchy 定理 + 中速下降估计。
- **难度**：**中**——核心技巧是将 Fourier 积分的围道从实轴平移到带域内，利用全纯性消除围道间的贡献。
- **关键**：中速下降条件 $|f(x+iy)| \leq C_N(1+|x|)^{-N} e^{2\pi M|y|}$ 保证围道平移后积分收敛。

### 逆向定理（Theorem 3.3）的证明

- **方法**：Plancherel 定理 + 积分表示 + [[phragmen-lindelof-theorem|Phragmén-Lindelöf 定理]]控制增长。
- **难度**：**高**——整函数延拓本身直接（积分表示），但精确的指数型增长控制需要 Phragmén-Lindelöf 定理在无界区域上应用最大模原理。
- **关键**：Phragmén-Lindelöf 定理将最大模原理从有界区域推广到无界区域，是处理无界区域上全纯函数增长的标准工具。

### 分布版本（Paley-Wiener-Schwartz）的证明

- **方法**：分布的 Fourier 变换 + 紧支集分布的结构定理。
- **难度**：**极高**——需要分布理论的基础设施（测试函数空间、分布的 Fourier 变换、紧支集分布的结构定理）。〔非 Stein 涵盖范围。〕

## 关联

- 概念：[[schwartz-space]]、[[fourier-transform]]、[[lp-space]]、[[fourier-coefficient|Fourier 系数]]、[[bump-function|bump 函数]]（紧支集 Schwartz 函数的具体例子）
- 定理：[[phragmen-lindelof-theorem]]（本定理是证明 Paley-Wiener 逆向定理的关键工具）、[[poisson-summation-formula]]（同一框架下 Fourier 变换的核心应用）
- 方法：[[contour-integration|围道平移（积分法变体）]]（围道平移）、[[differentiation-under-integral]]（积分号下求导）、[[amplification]]（增强技巧）、[[structural-randomness-decomposition]]（结构-随机性二分法）、[[local-to-global]]（局部到整体原理）
- 引理：[[shift-of-line|水平线移位引理]]（正向定理的核心工具——把实轴围道平移到下水平线）、[[f_a-class|$\mathscr{F}_a$ 类]]（条带全纯函数的联系）
- 源：[[steinComplexAnalysis]]（Ch. 4, §3, Theorem 3.4, p.143）
- 引用本定理的工具：[[modulus-of-complex-exponential]]（$|e^{2\pi i \xi z}|$ 的估计）、[[multiplicativity-of-modulus]]（指数型增长界的分解）、[[analytic-continuation]]（解析延拓的视角）

## 来源

- [[steinComplexAnalysis|Stein & Shakarchi (2003), 《Complex Analysis》, Ch. 4, §3, Theorem 3.1, Theorem 3.3; Remark, p.146]]
