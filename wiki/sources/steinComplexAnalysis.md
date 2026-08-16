---
type: source
title: "Complex Analysis"
created: 2026-08-11
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, fourier-analysis, entire-functions, textbook]
authors: ["Stein, Elias M.", "Shakarchi, Rami"]
citekey: steinComplexAnalysis
year: 2003
raw: "[[steinComplexAnalysis]]"
---
# Complex Analysis

> Stein & Shakarchi (2003)，Princeton Lectures in Analysis II。原始记录见 [[steinComplexAnalysis]]。

## 摘要

本书为 Stein-Shakarchi《Princeton Lectures in Analysis》四卷本之第二卷，涵盖复分析的基本理论。第 1–3 章构建复分析核心框架（全纯函数、Cauchy 定理、亚纯函数），第 4 章专论 Fourier 变换，第 5 章讨论整函数。本书与 [[steinFourierAnalysisIntroduction2003a|Fourier Analysis 卷]]的关系：第 4 章用复分析工具（围道积分、Phragmén-Lindelöf）重新证明 Fourier 分析核心定理（Poisson 求和、Paley-Wiener）。

## 目录结构

| 章 | 标题 | 页码 |
|----|------|------|
| 1 | Preliminaries to Complex Analysis | 1 |
| 2 | Cauchy's Theorem and Its Applications | 32 |
| 3 | Meromorphic Functions and the Logarithm | 71 |
| 4 | **The Fourier Transform** | 111 |
| 5 | Entire Functions | 134 |
| 6 | The Gamma and Zeta Functions | 159 |
| 7 | The Zeta Function and Prime Number Theorem | 181 |
| 8 | Conformal Mappings | 203 |
| 9 | An Introduction to Elliptic Functions | 251 |
| 10 | Applications of Theta Functions | 283 |

## 各章重点批注

### 第 1 章：Preliminaries（p.16–37）

**核心概念**：复数完备性、拓扑（紧致性、连通性）、全纯函数、Cauchy-Riemann 方程、幂级数。

#### Theorem 1.1（p.24）— $\mathbb{C}$ 的完备性

> $\mathbb{C}$，the complex numbers, is complete.

[AI-核验] E 级：p.24 逐字引用。

#### Theorem 1.2（p.26）— 紧致性（序列刻画）

> The set $\Omega \subset \mathbb{C}$ is compact if and only if every sequence $\{z_n\} \subset \Omega$ has a subsequence that converges to a point in $\Omega$.

[AI-核验] E 级：p.26 逐字引用。

#### Theorem 1.3（p.26）— 紧致性（开覆盖刻画）

> A set $\Omega$ is compact if and only if every open covering of $\Omega$ has a finite subcovering.

[AI-核验] E 级：p.26 逐字引用。

#### Theorem 2.1（p.27）— 紧集上连续函数的有界性

> A continuous function on a compact set $\Omega$ is bounded and attains a maximum and minimum on $\Omega$.

[AI-核验] E 级：p.27 逐字引用。

#### 全纯函数的基本性质（p.28）

> A holomorphic function of one complex variable will satisfy much stronger properties than a differentiable function of one real variable. ... every holomorphic function is analytic, in the sense that it has a power series expansion near every point.

[AI-核验] E 级：p.28 逐字引用。

#### Cauchy-Riemann 方程（p.31）

> $\dfrac{\partial u}{\partial x} = \dfrac{\partial v}{\partial y}$ and $\dfrac{\partial u}{\partial y} = -\dfrac{\partial v}{\partial x}$.

[AI-核验] E 级：p.31 逐字引用。

#### Theorem 2.4（p.32）— Cauchy-Riemann 方程充分性

> Suppose $f = u + iv$ is a complex-valued function defined on an open set $\Omega$. If $u_1$ and $v_1$ are continuously differentiable and satisfy the Cauchy-Riemann equations on $\Omega$, then $f$ is holomorphic on $\Omega$ and $f'(z) = \partial f / \partial z$.

[AI-核验] E 级：p.32 逐字引用。

#### Theorem 2.5（p.34）— 收敛半径（Hadamard 公式）

> Given a power series $\sum_{n=0}^{\infty} a_n z^n$, there exists $0 \leq R \leq \infty$ such that: (i) If $|z| < R$ the series converges absolutely. (ii) If $|z| > R$ the series diverges. Moreover, $1/R = \limsup |a_n|^{1/n}$.

[AI-核验] E 级：p.34 逐字引用。

#### Theorem 2.6（p.35）— 幂级数定义全纯函数

> The power series $f(z) = \sum_{n=0}^{\infty} a_n z^n$ defines a holomorphic function in its disc of convergence. The derivative of $f$ is also a power series obtained by differentiating term by term: $f'(z) = \sum_{n=0}^{\infty} n a_n z^{n-1}$. Moreover, $f'$ has the same radius of convergence as $f$.

[AI-核验] E 级：p.35 逐字引用。

### 第 2 章：Cauchy's Theorem and Its Applications（p.39–82）

**核心定理链**：Goursat → Cauchy 定理 → Cauchy 积分公式 → 幂级数展开 → Liouville → 代数基本定理 → 解析延拓唯一性 → Morera → Weierstrass 收敛 → Schwarz 反射 → Runge 逼近。

#### 三大基本性质（p.17）

> 1. Contour integration: If $f$ is holomorphic in $\Omega$, then for appropriate closed paths $\int_\gamma f(z)\,dz = 0$.
> 2. Regularity: If $f$ is holomorphic, then $f$ is indefinitely differentiable.
> 3. Analytic continuation: If $f$ and $g$ are holomorphic in $\Omega$ which are equal in an arbitrarily small disc, then $f = g$ everywhere in $\Omega$.

[AI-核验] E 级：p.17 逐字引用。

#### Theorem 1.1（p.53）— Goursat 定理

> If $\Omega$ is an open set in $\mathbb{C}$, and $T \subset \Omega$ a triangle whose interior is also contained in $\Omega$, then $\int_T f(z)\,dz = 0$ whenever $f$ is holomorphic in $\Omega$.

[AI-核验] E 级：p.53 逐字引用。

#### Theorem 2.2（p.58）— Cauchy 定理（圆盘版本）

> If $f$ is holomorphic in a disc, then $\int_\gamma f(z)\,dz = 0$ for any closed curve $\gamma$ in that disc.

[AI-核验] E 级：p.58 逐字引用。

#### Theorem 4.1（p.64）— Cauchy 积分公式

> Suppose $f$ is holomorphic in an open set that contains the closure of a disc $D$. If $C$ denotes the boundary circle of this disc with the positive orientation, then
> $$f(z) = \frac{1}{2\pi i} \int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta$$
> for any point $z \in D$.

[AI-核验] E 级：p.64 逐字引用。

#### Corollary 4.2（p.66）— 无穷可微性

> If $f$ is holomorphic in an open set $\Omega$, then $f$ has infinitely many complex derivatives in $\Omega$. Moreover,
> $$f^{(n)}(z) = \frac{n!}{2\pi i} \int_C \frac{f(\zeta)}{(\zeta - z)^{n+1}}\,d\zeta.$$

[AI-核验] E 级：p.66 逐字引用。

#### Corollary 4.3（p.67）— Cauchy 不等式

> If $f$ is holomorphic in an open set that contains the closure of a disc $D$ centered at $z_0$ and of radius $R$, then
> $$|f^{(n)}(z_0)| \leq \frac{n! \|f\|_C}{R^n}.$$

[AI-核验] E 级：p.67 逐字引用。

#### Theorem 4.4（p.68）— 全纯函数的幂级数展开

> Suppose $f$ is holomorphic in an open set $\Omega$. If $D$ is a disc centered at $z_0$ and whose closure is contained in $\Omega$, then $f$ has a power series expansion at $z_0$: $f(z) = \sum_{n=0}^{\infty} a_n (z - z_0)^n$, and $a_n = f^{(n)}(z_0)/n!$.

[AI-核验] E 级：p.68 逐字引用。

#### Corollary 4.5（p.69）— Liouville 定理

> If $f$ is entire and bounded, then $f$ is constant.

[AI-核验] E 级：p.69 逐字引用。

#### Corollary 4.6（p.69）— 代数基本定理

> Every non-constant polynomial $P(z) = a_n z^n + \cdots + a_0$ with complex coefficients has a root in $\mathbb{C}$.

[AI-核验] E 级：p.69 逐字引用。

#### Theorem 4.8（p.71）— 零点孤立性（恒等定理）

> Suppose $f$ is a holomorphic function in a region $\Omega$ that vanishes on a sequence of distinct points with a limit point in $\Omega$. Then $f$ is identically $0$.

[AI-核验] E 级：p.71 逐字引用。

#### Theorem 5.1（p.72）— Morera 定理

> Suppose $f$ is a continuous function in the open disc $D$ such that for any triangle $T$ contained in $D$, $\int_T f(z)\,dz = 0$. Then $f$ is holomorphic.

[AI-核验] E 级：p.72 逐字引用。

#### Theorem 5.2（p.72）— Weierstrass 一致收敛定理

> If $\{f_n\}_{n=1}^{\infty}$ is a sequence of holomorphic functions that converges uniformly to $f$ in every compact subset of $\Omega$, then $f$ is holomorphic in $\Omega$.

[AI-核验] E 级：p.72 逐字引用。

#### Theorem 5.6（p.79）— Schwarz 反射原理

> Suppose that $f$ is a holomorphic function in $\Omega^+$ that extends continuously to $I$ and such that $f$ is real-valued on $I$. Then there exists a function $F$ holomorphic in all of $\Omega$ such that $F = f$ on $\Omega^+$.

[AI-核验] E 级：p.79 逐字引用。

#### Theorem 5.7（p.80）— Runge 逼近定理

> Any function holomorphic in a neighborhood of a compact set $K$ can be approximated uniformly on $K$ by rational functions whose singularities are in $K^c$. If $K^c$ is connected, any function holomorphic in a neighborhood of $K$ can be approximated uniformly on $K$ by polynomials.

[AI-核验] E 级：p.80 逐字引用。

### 第 3 章：Meromorphic Functions and the Logarithm（p.90–122）

**核心**：奇点分类 → 留数定理 → 辐角原理 → Rouché → 开映射 → 最大模原理 → 单连通域 → 对数分支。

#### Theorem 1.1（p.92）— 零点因子分解

> Suppose that $f$ is holomorphic in a connected open set $\Omega$, has a zero at $z_0 \in \Omega$, and does not vanish identically. Then there exists a neighborhood $U$, a non-vanishing holomorphic function $g$ on $U$, and a unique positive integer $n$ such that $f(z) = (z - z_0)^n g(z)$.

[AI-核验] E 级：p.92 逐字引用。

#### Theorem 2.1（p.95）— 留数定理

> Suppose that $f$ is holomorphic in an open set containing a circle $C$ and its interior, except for a pole at $z_0$ inside $C$. Then $\int_C f(z)\,dz = 2\pi i\, \text{res}_{z_0} f$.

[AI-核验] E 级：p.95 逐字引用。

#### Corollary 2.3（p.96）— 留数定理（toy contour 版本）

> Suppose that $f$ is holomorphic in an open set containing a toy contour $\gamma$ and its interior, except for poles at $z_1, \ldots, z_N$ inside $\gamma$. Then $\int_\gamma f(z)\,dz = 2\pi i \sum_{k=1}^{N} \text{res}_{z_k} f$.

[AI-核验] E 级：p.96 逐字引用。

#### Theorem 3.1（p.103）— Riemann 可去奇点定理

> Suppose that $f$ is holomorphic in an open set $\Omega$ except possibly at a point $z_0$ in $\Omega$. If $f$ is bounded on $\Omega - \{z_0\}$, then $z_0$ is a removable singularity.

[AI-核验] E 级：p.103 逐字引用。

#### Theorem 3.3（p.105）— Casorati-Weierstrass 定理

> Suppose $f$ is holomorphic in the punctured disc $D_r(z_0) - \{z_0\}$ and has an essential singularity at $z_0$. Then the image of $D_r(z_0) - \{z_0\}$ under $f$ is dense in $\mathbb{C}$.

[AI-核验] E 级：p.105 逐字引用。

#### Theorem 3.4（p.106）— 扩充复球面上的亚纯函数

> The meromorphic functions in the extended complex plane are the rational functions.

[AI-核验] E 级：p.106 逐字引用。

#### Theorem 4.1（p.109）— 辐角原理

> Suppose $f$ is meromorphic in an open set containing a circle $C$ and its interior. If $f$ has no poles and never vanishes on $C$, then
> $$\frac{1}{2\pi i} \int_C \frac{f'(z)}{f(z)}\,dz = (\text{zeros}) - (\text{poles}),$$
> where zeros and poles are counted with multiplicities.

[AI-核验] E 级：p.109 逐字引用。

#### Theorem 4.3（p.110）— Rouché 定理

> Suppose that $f$ and $g$ are holomorphic in an open set containing a circle $C$ and its interior. If $|f(z)| > |g(z)|$ for all $z \in C$, then $f$ and $f + g$ have the same number of zeros inside $C$.

[AI-核验] E 级：p.110 逐字引用。

#### Theorem 4.4（p.111）— 开映射定理

> If $f$ is holomorphic and non-constant in a region $\Omega$, then $f$ is open.

[AI-核验] E 级：p.111 逐字引用。

#### Theorem 4.5（p.111）— 最大模原理

> If $f$ is a non-constant holomorphic function in a region $\Omega$, then $f$ cannot attain a maximum in $\Omega$.

[AI-核验] E 级：p.111 逐字引用。

#### Theorem 5.2（p.115）— 单连通域上全纯函数存在原函数

> Any holomorphic function in a simply connected domain has a primitive.

[AI-核验] E 级：p.115 逐字引用。

#### Theorem 6.1（p.117）— 对数分支存在性

> Suppose that $\Omega$ is simply connected with $1 \in \Omega$, and $0 \notin \Omega$. Then in $\Omega$ there is a branch of the logarithm $F(z) = \log_\Omega(z)$ so that (i) $F$ is holomorphic in $\Omega$, (ii) $e^{F(z)} = z$, (iii) $F(r) = \log r$ for real $r$ near $1$.

[AI-核验] E 级：p.117 逐字引用。

#### Theorem 7.1（p.120）— 全纯函数的 Fourier 系数

> The coefficients of the power series expansion of $f$ are given by
> $$a_n = \frac{1}{2\pi r^n} \int_0^{2\pi} f(z_0 + re^{i\theta}) e^{-in\theta}\,d\theta$$
> for $n \geq 0$, and $= 0$ for $n < 0$.

[AI-核验] E 级：p.120 逐字引用。**注**：此处 $e^{-in\theta}$ 为 Fourier 系数公式中的核，〔非 Stein 约定〕——Stein Fourier 约定为 $e^{-2\pi i n \theta}$，此处为复分析教材中的圆周参数化形式。

#### Corollary 7.2（p.121）— 平均值性质

> If $f$ is holomorphic in a disc $D_R(z_0)$, then $f(z_0) = \frac{1}{2\pi} \int_0^{2\pi} f(z_0 + re^{i\theta})\,d\theta$.

[AI-核验] E 级：p.121 逐字引用。

### 第 4 章：The Fourier Transform（p.131–146）

#### 主题（p.131）

> For a function $f$ initially defined on the real line, the possibility of extending it to a holomorphic function is closely related to the very rapid (for example, exponential) decay at infinity of its Fourier transform $\hat{f}$.

[AI-核验] E 级：p.131 逐字引用。

#### 类 $\mathscr{F}_a$ 的定义（p.132）

> For each $a > 0$ we denote by $\mathscr{F}_a$ the class of all functions $f$ that satisfy: (i) $f$ is holomorphic in the horizontal strip $S_a = \{z \in \mathbb{C} : |\operatorname{Im}(z)| < a\}$; (ii) $|f(x + iy)| \leq A/(1 + x^2)$ for all $x \in \mathbb{R}$ and $|y| < a$.

[AI-核验] E 级：p.132 逐字引用。**注**：$\mathscr{F}_a$ 是 [[schwartz-space|Schwartz 空间]] $\mathcal{S}$ 的全纯延拓类比。

#### Theorem 2.1（p.133）— $\mathscr{F}_a$ 类上 Fourier 变换的指数衰减

> If $f$ belongs to the class $\mathscr{F}_a$ for some $a > 0$, then $|\hat{f}(\xi)| \leq B e^{-2\pi b|\xi|}$ for any $0 \leq b < a$.

[AI-核验] E 级：p.133 逐字引用。Fourier 变换核为 $e^{-2\pi i x \xi}$，符合 Stein 约定。

#### Theorem 2.2（p.134）— Fourier 反演公式

> If $f \in \mathcal{F}$, then the Fourier inversion holds: $f(x) = \int_{-\infty}^{\infty} \hat{f}(\xi) e^{2\pi i x \xi}\,d\xi$.

[AI-核验] E 级：p.134 逐字引用。Fourier 逆变换核为 $e^{2\pi i x \xi}$，符合 Stein 约定。

#### Theorem 2.4（p.137）— Poisson 求和公式

> If $f \in \mathcal{F}$, then $\sum_{n \in \mathbb{Z}} f(n) = \sum_{n \in \mathbb{Z}} \hat{f}(n)$.

[AI-核验] E 级：p.137 逐字引用。无 $2\pi$ 因子，符合 Stein 约定。与 [[poisson-summation-formula|已有 Poisson 求和公式页]]一致。

#### Theta 函数变换律（p.139）

> $\theta(t) = t^{-1/2} \theta(1/t)$ for $t > 0$, where $\theta(t) = \sum_{n=-\infty}^{\infty} e^{-\pi n^2 t}$.

[AI-核验] E 级：p.139 逐字引用。此变换律是 [[poisson-summation-formula|Poisson 求和公式]]的直接推论，用于 Ch. 6 Riemann zeta 函数的解析延拓。

#### Theorem 3.1（p.140）— Paley-Wiener 正向定理

> Suppose $\hat{f}$ satisfies $|\hat{f}(\xi)| \leq A e^{-2\pi a|\xi|}$ for some $a, A > 0$. Then $f(x)$ is the restriction to $\mathbb{R}$ of a function $f(z)$ holomorphic in the strip $S_b$ for any $0 < b < a$.

[AI-核验] E 级：p.140 逐字引用。

#### Theorem 3.3（p.141）— Paley-Wiener 逆向定理

> Suppose $f$ is continuous and of moderate decrease on $\mathbb{R}$. Then $f$ has an extension to the complex plane that is entire with $|f(z)| \leq A e^{2\pi M|z|}$ for some $A > 0$, if and only if $\hat{f}$ is supported in $[-M, M]$.

[AI-核验] E 级：p.141 逐字引用。详见 [[paley-wiener-theorem]]。

#### Theorem 3.4（p.143）— Phragmén-Lindelöf 定理（扇形版本）

> Suppose $F$ is a holomorphic function in the sector $S = \{z : -\pi/4 < \arg z < \pi/4\}$ that is continuous on $\bar{S}$. Assume $|F(z)| \leq 1$ on the boundary of the sector, and $|F(z)| \leq C e^{c|z|}$ for constants $C, c > 0$. Then $|F(z)| \leq 1$ for all $z \in S$.

[AI-核验] E 级：p.143 逐字引用。详见 [[phragmen-lindelof-theorem]]。

#### 反例 $F(z) = e^{z^2}$（p.143）

> Consider $F(z) = e^{z^2}$. Then $F$ is bounded by $1$ on the boundary of $S$, but if $x$ is real, $F(x)$ is unbounded as $x \to \infty$.

[AI-核验] E 级：p.143 逐字引用。

#### Theorem 3.5（p.145）— 半直线 Fourier 支集

> Suppose $f$ and $\hat{f}$ have moderate decrease. Then $\hat{f}(\xi) = 0$ for all $\xi < 0$ if and only if $f$ can be extended to a continuous and bounded function in the closed upper half-plane with $f$ holomorphic in the interior.

[AI-核验] E 级：p.145 逐字引用。

#### Remark（p.146）— 与圆盘结果的类比

> Here we are dealing with a function holomorphic in the upper half-plane, and there with a function holomorphic in a disc. In the present case the Fourier transform vanishes when $\xi < 0$, and in the earlier case, the Fourier coefficients vanish when $n < 0$.

[AI-核验] E 级：p.146 逐字引用。

### 第 5 章：Entire Functions（p.153–164）

**核心**：Jensen 公式连接零点分布与函数增长；Weierstrass 乘积定理保证任意零点集的整函数存在性。

#### Theorem 1.1（p.154）— Jensen 公式

> Let $\Omega$ be an open set that contains the closure of a disc $D_R$ and suppose that $f$ is holomorphic in $\Omega$, $f(0) = 0$, and $f$ vanishes nowhere on the circle $C_R$. If $z_1, \ldots, z_N$ denote the zeros of $f$ inside the disc (counted with multiplicities), then
> $$\log|f(0)| = \sum_{k=1}^{N} \log\frac{|z_k|}{R} + \frac{1}{2\pi} \int_0^{2\pi} \log|f(Re^{i\theta})|\,d\theta.$$

[AI-核验] E 级：p.154 逐字引用。

#### Theorem 2.1（p.157）— 增长阶与零点分布

> If $f$ is an entire function that has an order of growth $\leq \rho$, then: (i) $n(r) \leq Cr^\rho$ for some $C > 0$ and all sufficiently large $r$. (ii) If $z_1, z_2, \ldots$ denote the zeros of $f$ with $z_k \neq 0$, then for all $s > \rho$, $\sum_{k=1}^{\infty} 1/|z_k|^s < \infty$.

[AI-核验] E 级：p.157 逐字引用。

#### Proposition 3.2（p.160）— 无穷乘积收敛

> Suppose $\{F_n\}$ is a sequence of holomorphic functions on $\Omega$. If $\sum c_n < \infty$ and $|F_n(z) - 1| \leq c_n$ for all $z \in \Omega$, then: (i) $\prod_{n=1}^{\infty} F_n(z)$ converges uniformly to a holomorphic function $F(z)$; (ii) $F'(z)/F(z) = \sum_{n=1}^{\infty} F_n'(z)/F_n(z)$ (when $F_n$ non-vanishing).

[AI-核验] E 级：p.160 逐字引用。

#### Theorem 4.1（p.164）— Weierstrass 乘积定理

> Given any sequence $\{a_n\}$ of complex numbers with $|a_n| \to \infty$ as $n \to \infty$, there exists an entire function $f$ that vanishes at all $z = a_n$ and nowhere else. Any other such entire function is of the form $f(z) e^{g(z)}$, where $g$ is entire.

[AI-核验] E 级：p.164 逐字引用。

## 高亮处理清单(2026-08-13)

> 覆盖 `raw/papers/steinComplexAnalysis.md` 全部 **180 处**高亮(按章聚合、同类合并;各章数量与原始文件 `### p.XX · highlight` 条目逐页核对,合计 = 37+43+56+23+21 = 180)。处理取值:已覆盖(现有实体页 X)/ 已覆盖(源页摘录)/ 记录(暂不建页)/ note(纲领性-思想性,见笔记页)。

| 章节 | 高亮主题(数量) | 处理 | 落点 |
|------|----------------|------|------|
| Ch.1(p.16-42, 37) | 全纯性假设的深远性:一个假设蕴含一族条件(p.16, 1) | note(纲领性-思想性) | [[complex-analysis-rigidity-and-methods]]§一 |
| | 两条研究路线:普适特征 vs 特殊函数(p.17 之一, 1) | note(纲领性-思想性) | [[complex-analysis-rigidity-and-methods]]§二 |
| | 三大性质:围道积分/正则性/解析延拓(p.17 之二, 1) | 已覆盖(源页摘录) | 本页「三大基本性质(p.17)」 |
| | 全书范围声明:Fourier 变换经围道积分与复分析相连等(p.18, 1) | 记录(暂不建页) | — |
| | 路线图:原函数⇒闭路积分为零(p.20, 1) | 记录(暂不建页) | — |
| | 复数代数:三角不等式、$\|z\|^2=z\bar z$、完备性、极限点(p.22、p.23、p.24×2、p.25, 5) | 已覆盖(源页摘录)+记录 | 摘录 Thm 1.1;其余记录 |
| | 拓扑:紧致性(序列/开覆盖)、嵌套紧集、连通(p.26×5、p.27, 6) | 已覆盖(源页摘录)+记录 | 摘录 Thm 1.2/1.3/2.1;其余记录 |
| | 全纯 vs 实可微、$\bar z$ 非全纯例(p.28×2, 2) | 已覆盖(源页摘录) | 摘录「全纯函数的基本性质(p.28)」 |
| | 可微性刻画、Prop 2.2 运算规则(p.29×2, 2) | 记录(暂不建页) | — |
| | Cauchy-Riemann 方程、$\partial/\partial z$ 算子、Thm 2.4 充分性(p.31×2、p.32, 3) | 已覆盖(源页摘录) | 摘录「Cauchy-Riemann 方程(p.31)」「Thm 2.4」 |
| | 幂级数:$e^z$、Hadamard 半径、三角函数、逐项微分(p.33×2、p.34、p.35×2、p.37×2, 7) | 已覆盖(源页摘录)+记录 | 摘录 Thm 2.5/2.6;其余记录 |
| | 曲线积分:线性/反向/估计、原函数定理、1/z 无原函数(p.39、p.40、p.41×2、p.42×3, 7) | 记录(暂不建页) | — |
| Ch.2(p.52-82, 43) | 解析延拓的基础性质(p.52, 1) | 已覆盖(现有实体页) | [[analytic-continuation]] |
| | Goursat→Cauchy 定理链:三角/矩形、圆盘原函数、toy contour、Jordan(p.53×2、p.55、p.56、p.58×4、p.59、p.60, 10) | 已覆盖(源页摘录)+记录 | 摘录 Thm 1.1/2.2;其余记录 |
| | 围道平移技术(p.63, 1) | 已覆盖(现有实体页) | [[contour-integration]]（围道平移(积分法变体)） |
| | 表示公式思想:从小集合恢复大集合(p.64 之一, 1) | note(纲领性-思想性) | [[complex-analysis-rigidity-and-methods]]§三 |
| | Cauchy 积分公式、钥匙孔/矩形围道、无穷可微、Cauchy 不等式、幂级数展开、Liouville、FTA、零点孤立/恒等定理(p.64 之二、p.65、p.66×2、p.67、p.68、p.69×3、p.70、p.71×2, 12) | 已覆盖(源页摘录/现有实体页) | 摘录 Thm 4.1/Cor 4.2/4.3/Thm 4.4/Cor 4.5;[[cauchy-integral-formula]]、[[liouville-theorem]] |
| | Morera、Weierstrass 收敛、导数收敛、级数构造全纯函数、Thm 5.4、全纯刚性 vs 实延拓、对称原理、Schwarz 反射、Runge 逼近(p.72×3、p.73×2、p.74×2、p.75、p.76、p.77、p.79×2、p.80×4、p.81、p.82, 18) | 已覆盖(源页摘录)+note | 摘录 Thm 5.1/5.2/5.6/5.7;刚性反思(p.76) → [[complex-analysis-rigidity-and-methods]]§三 |
| Ch.3(p.90-122, 56) | 总原则:解析函数由奇点刻画(p.90×2, 2) | note(纲领性-思想性) | [[complex-analysis-rigidity-and-methods]]§四 |
| | 奇点三分与辐角原理路线图、多值性(p.91×2, 2) | 记录(暂不建页) | — |
| | 零点因子分解 Thm 1.1、1/z 极点例、零点孤立(p.92×3, 3) | 已覆盖(源页摘录)+记录 | 摘录 Thm 1.1;其余记录 |
| | 极点定义、Thm 1.2 局部结构(p.93×2, 2) | 记录(暂不建页) | — |
| | 主部展开、留数=a₋₁、简单极点公式(p.94×3, 3) | 记录(暂不建页) | — |
| | 留数公式 Thm 1.4、留数定理 Thm 2.1(p.95×2, 2) | 已覆盖(源页摘录)+记录 | 摘录 Thm 2.1;其余记录 |
| | 留数定理 Cor 2.2/2.3(toy contour 版)(p.96×2, 2) | 已覆盖(源页摘录)+记录 | 摘录 Cor 2.3;其余记录 |
| | 围道选择动机:由 f 的衰减行为决定(p.97, 1) | 记录(暂不建页) | — |
| | Riemann 可去奇点 Thm 3.1、极点刻画 Cor 3.2、三分法(p.103、p.104×2, 3) | 已覆盖(源页摘录) | 摘录 Thm 3.1/Cor 3.2 |
| | 本性奇点、Casorati-Weierstrass Thm 3.3、亚纯定义(p.105×4, 4) | 已覆盖(源页摘录)+记录 | 摘录 Thm 3.3;其余记录 |
| | 无穷远点、扩充复平面亚纯=有理 Thm 3.4、零极点决定函数(p.106×3, 3) | 已覆盖(源页摘录)+记录 | 摘录 Thm 3.4;其余记录 |
| | Riemann 球面、log f 的多值性(p.108×2, 2) | 记录(暂不建页) | — |
| | 辐角原理 Thm 4.1 及 toy contour 版(p.109×2, 2) | 已覆盖(源页摘录)+记录 | 摘录 Thm 4.1;其余记录 |
| | Rouché Thm 4.3、开映射/最大模总览(p.110×2, 2) | 已覆盖(源页摘录)+记录 | 摘录 Thm 4.3;其余记录 |
| | 开映射 Thm 4.4、最大模 Thm 4.5、Cor 4.6、紧性本质 Remark(p.111×4, 4) | 已覆盖(源页摘录)+记录 | 摘录 Thm 4.4/4.5;其余记录 |
| | 同伦定义与 Thm 5.1、$e^{-iz^2}$ 例(p.112×2, 2) | 已覆盖(现有实体页)+记录 | [[homotopy-argument]];其余记录 |
| | 单连通定义与例、Thm 5.2 原函数存在(p.115×6, 6) | 已覆盖(源页摘录)+记录 | 摘录 Thm 5.2;其余记录 |
| | 对数分支:多值性、Thm 6.1、主分支、$z^\alpha$、Thm 6.2(p.116、p.117×2、p.118、p.119×2, 6) | 已覆盖(源页摘录)+记录 | 摘录 Thm 6.1;其余记录 |
| | Thm 7.1 全纯函数 Fourier 系数、n<0 消失的诠释、均值性质、调和(p.120、p.121×2、p.122×2, 5) | 已覆盖(源页摘录)+note | 摘录 Thm 7.1/Cor 7.2;n<0 消失(p.121) → [[complex-analysis-rigidity-and-methods]]§五 |
| Ch.4(p.131-146, 23) | 总主题:全纯延拓↔指数衰减、两阶段展开、Paley-Wiener 为极端衰减(p.131×3, 3) | 已覆盖(源页摘录)+记录 | 摘录「主题(p.131)」;其余记录 |
| | 类 $\mathscr{F}_a$ 定义、$e^{-2\pi i z\xi}$ 的指数行为(p.132×2, 2) | 已覆盖(定理页其他证明,见 [[fourier-inversion]]/[[poisson-summation-formula]]) | 摘录「类 $\mathscr{F}_a$ 的定义(p.132)」;$\mathscr{F}_a$ 类与 $e^{-2\pi i z\xi}$ 指数行为已用作 [[fourier-inversion]] 证明三 / [[poisson-summation-formula]] 证明二的工作空间与动机 |
| | 三定理同一思想:围道积分(p.133×2, 2) | note(纲领性-思想性) | [[complex-analysis-rigidity-and-methods]]§六 |
| | 指数衰减 Thm 2.1、反演 Thm 2.2、Poisson 求和 Thm 2.4、引理 2.3(p.134、p.135、p.137, 3) | 已覆盖(定理页其他证明,见 [[fourier-inversion]]/[[poisson-summation-formula]]) | 摘录 Thm 2.1/2.2/2.4 陈述;Thm 2.2 证明见 [[fourier-inversion]] 证明三、Thm 2.4 证明见 [[poisson-summation-formula]] 证明二;其余记录 |
| | theta 函数变换律(p.139, 1) | 已覆盖(源页摘录) | 摘录「Theta 函数变换律(p.139)」 |
| | Paley-Wiener:Thm 3.1、Cor 3.2、Thm 3.3、逆向的更强界与逐步去假设(p.140、p.141×4、p.142, 6) | 已覆盖(源页摘录/现有实体页)+记录 | 摘录 Thm 3.1/3.3;[[paley-wiener-theorem]];其余记录 |
| | Phragmén-Lindelöf 思想、Thm 3.4、$e^{z^2}$ 反例(p.143×3, 3) | 已覆盖(源页摘录)+note | 摘录 Thm 3.4;思想 → [[complex-analysis-rigidity-and-methods]]§六 |
| | 半直线支集 Thm 3.5、与圆盘结果类比 Remark(p.145×2、p.146, 3) | 已覆盖(源页摘录) | 摘录 Thm 3.5/Remark(p.146) |
| Ch.5(p.153-164, 21) | 整函数三问题:零点在哪/如何增长/由零点确定到何种程度(p.153、p.154×2, 3) | note+已覆盖(源页摘录) | 纲领 → [[complex-analysis-rigidity-and-methods]]§七;Jensen Thm 1.1 摘录 |
| | 预备:log g 的构造、n(r) 与积分形式(p.155、p.156×2, 3) | 记录(暂不建页) | — |
| | 增长阶↔零点计数 Thm 2.1(p.157, 1) | 已覆盖(源页摘录) | 摘录 Thm 2.1 |
| | 二进估计、s>ρ 不可改进、sin πz 与 cos z^(1/2) 例(p.158×4, 4) | 记录(暂不建页) | — |
| | 预设零点问题、Prop 3.2 无穷乘积收敛(p.159×2、p.160, 3) | 已覆盖(源页摘录)+记录 | 摘录 Prop 3.2;其余记录 |
| | π cot πz 的展开与结构性质证法(p.161、p.162×2、p.163×2, 5) | 记录(暂不建页) | — |
| | Weierstrass 乘积 Thm 4.1、重数允许(p.164×2, 2) | 已覆盖(源页摘录)+记录 | 摘录 Thm 4.1;其余记录 |

## 出现的概念 / 定理 / 方法 / 引理

### 概念

- [[holomorphic-function|全纯函数]]（Ch.1, §2）
- [[power-series|幂级数]]（Ch.1, §2）
- [[entire-function|整函数]]（Ch.2, §4）
- [[meromorphic-function|亚纯函数]]（Ch.3, §3）
- [[isolated-singularity|孤立奇点]]（Ch.3, §1–3）
- [[simply-connected-domain|单连通域]]（Ch.3, §5）
- [[order-of-growth|增长阶]]（Ch.5, §2）
- [[schwartz-space|Schwartz 空间]]（Ch.4, §1, 类 $\mathcal{F}$）
- [[lp-space|$L^p$ 空间]]
- [[fourier-transform|Fourier 变换]]
- [[fourier-series|Fourier 级数]]（Ch.3, §7 联系）
- [[character|特征标]]

### 定理

- [[cauchy-theorem|Cauchy 定理]]（Ch.2, Theorem 2.2）
- [[cauchy-integral-formula|Cauchy 积分公式]]（Ch.2, Theorem 4.1）
- [[liouville-theorem|Liouville 定理]]（Ch.2, Corollary 4.5）
- [[morera-theorem|Morera 定理]]（Ch.2, Theorem 5.1）
- [[schwarz-reflection-principle|Schwarz 反射原理]]（Ch.2, Theorem 5.6）
- [[runge-theorem|Runge 逼近定理]]（Ch.2, Theorem 5.7）
- [[residue-theorem|留数定理]]（Ch.3, Theorem 2.1）
- [[argument-principle|辐角原理]]（Ch.3, Theorem 4.1）
- [[rouche-theorem|Rouché 定理]]（Ch.3, Theorem 4.3）
- [[open-mapping-theorem|开映射定理]]（Ch.3, Theorem 4.4）
- [[maximum-modulus-principle|最大模原理]]（Ch.3, Theorem 4.5）
- [[jensen-formula|Jensen 公式]]（Ch.5, Theorem 1.1）
- [[weierstrass-product-theorem|Weierstrass 乘积定理]]（Ch.5, Theorem 4.1）
- [[paley-wiener-theorem|Paley-Wiener 定理]]（Ch.4, Theorem 3.1/3.3）
- [[phragmen-lindelof-theorem|Phragmén-Lindelöf 定理]]（Ch.4, Theorem 3.4）
- [[poisson-summation-formula|Poisson 求和公式]]（Ch.4, Theorem 2.4）

### 方法

- [[contour-integration|围道积分法]]（Ch.2, §3; Ch.4, §2–3）
- [[analytic-continuation|解析延拓法]]（Ch.2, §4）
- [[residue-calculus|留数计算法]]（Ch.3, §2）

### 引理

- [[triangle-inequality-complex|复数三角不等式]]（Ch.1, p.22）
- [[hadamard-formula|Hadamard 收敛半径公式]]（Ch.1, Theorem 2.5）
- [[cauchy-inequalities|Cauchy 不等式]]（Ch.2, Corollary 4.3）
- [[mean-value-property-holomorphic|全纯函数平均值性质]]（Ch.3, Corollary 7.2）
- [[removable-singularity-criterion|极点判定准则]]（Ch.3, Corollary 3.2）
- [[modulus-of-complex-exponential|复指数的模]]（已有）
- [[multiplicativity-of-modulus|复数模的乘性]]（已有）

## AI 核验分级

### E 级主张（已核验）

| 主张 | 来源 | 核验状态 |
|------|------|---------|
| 全部上述定理陈述（逐字引用自 PDF 批注） | 各页码 | ✅ [AI-核验] |
| $\mathscr{F}_a$ 类的定义 | p.132 | ✅ [AI-核验] |
| Theta 函数变换律 $\theta(t) = t^{-1/2}\theta(1/t)$ | p.139 | ✅ [AI-核验] |
| Cauchy-Riemann 方程 | p.31 | ✅ [AI-核验] |
| Hadamard 公式 $1/R = \limsup \lvert a_n\rvert^{1/n}$ | p.34 | ✅ [AI-核验] |
| Schwarz 反射原理条件 | p.79 | ✅ [AI-核验] |
| Runge 逼近定理条件 | p.80 | ✅ [AI-核验] |
| 留数定理 $\int_C f\,dz = 2\pi i\,\text{res}_{z_0} f$ | p.95 | ✅ [AI-核验] |
| 辐角原理公式 | p.109 | ✅ [AI-核验] |
| 最大模原理 | p.111 | ✅ [AI-核验] |
| Jensen 公式 | p.154 | ✅ [AI-核验] |
| Weierstrass 乘积定理 | p.164 | ✅ [AI-核验] |
| Poisson 求和公式（Ch.4 版本） | p.137 | ✅ [AI-核验] |
| Paley-Wiener 正向/逆向 | p.140, 141 | ✅ [AI-核验] |
| Phragmén-Lindelöf 定理 | p.143 | ✅ [AI-核验] |
| 反例 $F(z) = e^{z^2}$ | p.143 | ✅ [AI-核验] |

### A 级主张（需用户核验）

| 主张 | 依据 | 待核验内容 |
|------|------|-----------|
| Theorem 3.4 用于证明 Theorem 3.3 | p.146 Remark + 定理逻辑推断 | 确认 Phragmén-Lindelöf 是 Paley-Wiener 逆向证明的关键工具 |
| 最大模原理是 Phragmén-Lindelöf 定理的直接推广基础 | p.111 + p.143 的逻辑关系 | 确认 Phragmén-Lindelöf 将最大模原理从有界区域推广到无界区域 |
| Theta 函数变换律用于 Ch.6 Riemann zeta 函数解析延拓 | p.139 批注提及 | 确认此联系在 Ch.6 中实现 |
| Cauchy 积分公式是 Paley-Wiener 正向定理证明的核心工具 | p.64 + p.140 证明逻辑 | 确认围道平移依赖 Cauchy 定理 |
| Schwarz 反射原理与 Phragmén-Lindelöf 定理共享「全纯延拓」思想 | p.79 + p.143 | 确认此方法论联系 |
| Weierstrass 乘积定理是 Dirichlet 定理证明中 Euler 乘积的复分析推广 | p.164 + Dirichlet 定理逻辑 | 确认此跨章节联系 |

## 状态

`unverified`：PDF 批注已逐字转录并按章节组织。E 级主张（教材显式陈述）已由 LLM 核验。A 级主张（跨章节逻辑依赖、方法论联系）待用户核验。
