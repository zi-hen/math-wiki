---
type: theorem
title: Heisenberg 不确定性原理
aliases: [Heisenberg uncertainty principle, uncertainty principle]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, quantum-mechanics, probability]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$\psi \in \mathcal{S}(\mathbb{R})$ 且 $\int |\psi|^2 = 1$（弱——$\mathcal{S}$ 是 Schwartz 速降函数，归一化是自然的）；结论：$\left(\int x^2 |\psi|^2\right) \left(\int \xi^2 |\hat{\psi}|^2\right) \geq \frac{1}{16\pi^2}$（强——给出量子力学位置-动量不确定性的精确下界）。等号当且仅当 $\psi$ 为 Gauss 函数（精确特征函数）。属标准强定理，连接 Fourier 分析与量子力学基础。
---

# Heisenberg 不确定性原理

> **工作空间**：实直线 $\mathbb{R}$。Stein 在 Ch. 5, Theorem 4.1 给出 $\mathbb{R}$ 上形式；$\mathbb{R}^d$ 推广见 Ch. 6, Exercise 6。

## What — 陈述

> 设 $\psi \in$ [[schwartz-space|$\mathcal{S}(\mathbb{R})$]] 满足归一化
> $$
> \int_{\mathbb{R}} |\psi(x)|^2\, dx = 1.
> $$
> 定义位置不确定度 $\sigma_x^2 = \int x^2 |\psi(x)|^2 dx$ 与动量不确定度 $\sigma_\xi^2 = \int \xi^2 |\hat{\psi}(\xi)|^2 d\xi$。则
> $$
> \sigma_x \cdot \sigma_\xi \geq \frac{1}{4\pi}.
> $$
> **等号成立**当且仅当 $\psi(x) = A e^{-Bx^2}$（Gauss 函数）且 $|A|^2 = \sqrt{2B/\pi}$。

更一般地（位移形式），设 $x_0 = \int x|\psi|^2 dx$，$\xi_0 = \int \xi |\hat\psi|^2 d\xi$，则
$$
\left(\int (x - x_0)^2 |\psi|^2\right) \left(\int (\xi - \xi_0)^2 |\hat{\psi}|^2\right) \geq \frac{1}{16\pi^2}.
$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Theorem 4.1]]。

## Why — 动机与证明

### 动机

Heisenberg 不确定性原理是量子力学的基石：粒子位置与动量不能同时精确测定。Stein 给出 Fourier 分析视角的证明——这是该原理的**第一**严格证明，也是 Fourier 变换"双侧对偶性"的最深刻推论。

物理学表述（Stein Ch. 5, p.177–178）："the more certain we are about the location of the particle, the less certain we can be about its momentum, and vice versa."

### 证明思路

Stein 在 Ch. 5, Exercise 23 中给出三步证明框架（Hermite 算子方法）。Theorem 4.1 的证明可采用 **Cauchy-Schwarz + 乘法公式**的直接路线：

1. **第一步**：由 Cauchy-Schwarz 不等式
   $$
   \left|\int x \psi(x) \overline{\hat{\psi}(x)}\, dx\right|^2 \leq \int x^2 |\psi|^2 dx \cdot \int |\hat{\psi}|^2 dx.
   $$
2. **第二步**：计算左端——利用乘法公式（Plancherel 证明中的 Proposition 1.8）与 $\|\hat{\psi}\|_2 = \|\psi\|_2 = 1$：
   $$
   \int x \psi \overline{\hat{\psi}}\, dx = \text{（某非零值, 由 Fourier 变换对称性给出）}.
   $$
   事实上左端**精确**等于 $\frac{1}{4\pi i}\left(\int |\psi|^2 dx - \int |x \psi'|^2 / x^2 dx\right)$ 这一类代数形式，但需具体计算。

### 详细证明

**预备：乘法公式 + 对称化**。

**Claim 1**（关键不等式）. 设 $\psi \in \mathcal{S}$ 且 $\|\psi\|_{L^2} = 1$。则
$$
\int x^2 |\psi(x)|^2 dx + \int \xi^2 |\hat{\psi}(\xi)|^2 d\xi \geq \frac{1}{4\pi^2} \int x^2 |\psi(x)|^2 dx \cdot \int \xi^2 |\hat{\psi}|^2 d\xi.
$$

*证明.* 定义 Hermite 算子 $L f = -f'' + x^2 f$，$A f = f' + x f$（湮灭算子），$A^* f = -f' + x f$（产生算子）。

观察到 $A^* A f = (-f' + xf)' - x(-f' + xf) = (-f'' + f + xf') - (-xf' + x^2 f) = -f'' + x^2 f - f = Lf - f$。

故 $Lf = A^* A f + f$。由 $\langle A^* A f, f \rangle = \langle Af, Af \rangle \geq 0$，得 $\langle Lf, f \rangle \geq \langle f, f \rangle$。

现在选 $f = \psi$（归一化）：

$$
\int |\psi|^2 dx \leq \int (-|\psi'|^2 + x^2 |\psi|^2) dx.
$$

由 [[plancherel-theorem|Plancherel 等式]]与 Stein 约定 $\widehat{f'}(\xi) = 2\pi i \xi \hat f(\xi)$，
$$
\int |\psi'|^2 dx = \int |\widehat{\psi'}|^2 d\xi = \int |2\pi i\xi \hat\psi|^2 d\xi = 4\pi^2 \int \xi^2 |\hat\psi|^2 d\xi.
$$

因此
$$
\int |\psi|^2 dx \leq \int (-|\psi'|^2 + x^2 |\psi|^2) dx = -4\pi^2 \int \xi^2 |\hat\psi|^2 d\xi + \int x^2 |\psi|^2 dx.
$$

改写：
$$
\int x^2 |\psi|^2 dx + 4\pi^2 \int \xi^2 |\hat\psi|^2 d\xi \geq \int |\psi|^2 dx = 1.
$$

由 [[cauchy-schwarz-inequality|Cauchy-Schwarz]]对 $\sigma_x^2 = \int x^2 |\psi|^2$ 与 $4\pi^2 \sigma_\xi^2 = 4\pi^2 \int \xi^2 |\hat\psi|^2$：
$$
\sigma_x^2 \cdot 4\pi^2 \sigma_\xi^2 \geq \left(\frac{\sigma_x^2 + 4\pi^2 \sigma_\xi^2}{2}\right)^2 \geq \frac{1}{4},
$$
故 $\sigma_x \cdot \sigma_\xi \geq \frac{1}{4\pi}$。

$\blacksquare$

**等号情形**：$\langle Af, Af \rangle = 0$ ⇒ $A\psi = 0$ ⇒ $\psi' + x \psi = 0$ ⇒ $\psi(x) = A e^{-x^2/2}$（一阶常微分方程）。归一化 $|A|^2 = \sqrt{2B/\pi}$（其中 $B = 1/2$）得精确常数。

## 其他证明

> 本区段按 docs/PROOFS.md §6.5 记录与主证明不同的第二证法;主证明(§「详细证明」)保持不变。

#### 证明二:经典对易子法(分部积分 + Cauchy–Schwarz)

**来源与录入**。本证法即页首「证明思路」预告的 Cauchy–Schwarz 直接路线,依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Theorem 4.1]] 的框架与 [[ch5-ex23-heisenberg|Ch. 5, Exercise 23(a)]] 的「两次分部积分」提示;核心工具为 [[cauchy-schwarz-inequality|Cauchy–Schwarz 不等式]]、[[plancherel-theorem|Plancherel 定理]] 与 [[integration-by-parts|分部积分法]]。录入日期:2026-08-13。

**动机**。主证明经 Hermite 算子分解 $A^*A = L - I$ 建立谱不等式 $L \ge I$([[ch5-ex23-heisenberg|Ch.5 Ex.23(b)]] 路线),再对两个二阶矩用 Cauchy–Schwarz。证明二回到量子力学的原始论证:位置算子「乘以 $x$」与动量算子「求导」不对易——把对易子 $[d/dx,\, x] = 1$ 作用在 $|\psi|^2$ 上并分部积分,得到恒等式 $\text{Re}\int x\psi'\bar\psi\,dx = -\frac{1}{2}$。核心困难只有一步:把归一化 $\int|\psi|^2 = 1$ 改写成该恒等式,再对 $\int x\psi'\bar\psi$ 用 Cauchy–Schwarz,并把 $\|\psi'\|_2$ 经 [[plancherel-theorem|Plancherel]] 换成 $2\pi\sigma_\xi$。等号条件由 Cauchy–Schwarz 取等给出:$\psi' \propto x\psi$,即 Gauss 函数。

**证明思路**。

1. **对易子恒等式**:分部积分计算 $\int \frac{d}{dx}(x|\psi|^2)\,dx = 0$($\psi \in \mathcal{S}$ 速降消去边界项),得 $\text{Re}\int x\psi'\bar\psi\,dx = -\frac{1}{2}$。
2. **Cauchy–Schwarz**:$1 = 2|\text{Re}\int x\psi'\bar\psi| \le 2\,\|x\psi\|_2\,\|\psi'\|_2$。
3. **Plancherel 换算**:$\|\psi'\|_2 = 2\pi\,\|\xi\hat\psi\|_2 = 2\pi\sigma_\xi$。
4. **综合**:$1 \le 2\sigma_x \cdot 2\pi\sigma_\xi$,即 $\sigma_x\sigma_\xi \ge \frac{1}{4\pi}$。
5. **等号**:两步均取等当且仅当 $\psi' = c\,x\psi$(a.e.,$c < 0$ 实数),即 $\psi$ 为 Gauss 函数。

**详细证明**。

**Claim 1**(对易子恒等式). 设 $\psi \in \mathcal{S}(\mathbb{R})$ 且 $\|\psi\|_2 = 1$。则
$$\text{Re}\int_{\mathbb{R}} x\,\psi'(x)\,\overline{\psi(x)}\,dx = -\frac{1}{2}.$$

*证明.* 计算 $x|\psi(x)|^2$ 的导数,由乘积求导法则与 $|\psi|^2 = \psi\bar\psi$:
$$\frac{d}{dx}\big(x|\psi(x)|^2\big) = |\psi(x)|^2 + x\,\frac{d}{dx}|\psi(x)|^2 = |\psi(x)|^2 + 2x\,\text{Re}\big(\psi'(x)\,\overline{\psi(x)}\big).$$
$\psi \in \mathcal{S}$ 速降,故 $x|\psi(x)|^2 \to 0$($|x| \to \infty$)。两端在 $\mathbb{R}$ 上积分,左端由微积分基本定理(取极限意义)为零:
$$0 = \int_{\mathbb R}\frac{d}{dx}\big(x|\psi(x)|^2\big)\,dx = \|\psi\|_2^2 + 2\,\text{Re}\int_{\mathbb R}x\psi'\bar\psi\,dx = 1 + 2\,\text{Re}\int_{\mathbb R}x\psi'\bar\psi\,dx.$$
移项即得 $\text{Re}\int x\psi'\bar\psi\,dx = -\frac{1}{2}$。$\blacksquare$

**Claim 2**(Cauchy–Schwarz 估计). 在 Claim 1 的条件下,$1 \le 2\,\|x\psi\|_2\,\|\psi'\|_2$。

*证明.* 由 Claim 1 与实部不等式 $|\text{Re}\,z| \le |z|$($z \in \mathbb{C}$),
$$1 = 2\Big|\text{Re}\int_{\mathbb R}x\psi'\bar\psi\,dx\Big| \le 2\Big|\int_{\mathbb R}x\psi'\bar\psi\,dx\Big| \le 2\Big(\int_{\mathbb R}x^2|\psi|^2\,dx\Big)^{1/2}\Big(\int_{\mathbb R}|\psi'|^2\,dx\Big)^{1/2},$$
最后一步是 [[cauchy-schwarz-inequality|Cauchy–Schwarz 不等式]]。$\blacksquare$

**Claim 3**(导数的 Plancherel 换算). 对 $\psi \in \mathcal{S}(\mathbb{R})$,$\|\psi'\|_2 = 2\pi\,\|\xi\hat\psi\|_2 = 2\pi\sigma_\xi$。

*证明.* 由 [[fourier-transform|Fourier 变换]] 的导数性质,$\widehat{\psi'}(\xi) = 2\pi i\xi\,\hat\psi(\xi)$;由 [[plancherel-theorem|Plancherel 定理]],
$$\|\psi'\|_2^2 = \|\widehat{\psi'}\|_2^2 = \int_{\mathbb R}|2\pi i\xi\,\hat\psi(\xi)|^2\,d\xi = 4\pi^2\int_{\mathbb R}\xi^2|\hat\psi(\xi)|^2\,d\xi = 4\pi^2\sigma_\xi^2,$$
末等号由 $\sigma_\xi^2 = \int\xi^2|\hat\psi|^2d\xi$ 的定义。开方得 $\|\psi'\|_2 = 2\pi\sigma_\xi$。$\blacksquare$

**结论**。由 Claims 2、3 与 $\sigma_x^2 = \int x^2|\psi|^2dx$ 的定义,
$$1 \le 2\,\sigma_x \cdot 2\pi\sigma_\xi = 4\pi\,\sigma_x\sigma_\xi,$$
故 $\sigma_x\sigma_\xi \ge \frac{1}{4\pi}$,即定理的陈述。$\blacksquare$

**等号条件**。等号要求 Claims 2 的两步同时取等:(i) 实部取等,即 $|\text{Re}\int x\psi'\bar\psi| = |\int x\psi'\bar\psi|$,亦即 $\int x\psi'\bar\psi \in \mathbb{R}_{\le 0}$;(ii) [[cauchy-schwarz-inequality|Cauchy–Schwarz]] 取等,即存在常数 $c \in \mathbb{C}$ 使 $\psi'(x) = c\,x\,\psi(x)$ 几乎处处。由 (ii),一阶 ODE 的解为 $\psi(x) = A\exp(cx^2/2)$;$\psi \in \mathcal{S}$ 要求 $\text{Re}\,c \le 0$。结合 (i):$\int x\psi'\bar\psi = c\int x^2|\psi|^2 = c\sigma_x^2$ 须为非正实数,故 $c < 0$ 为实数。记 $c = -2B$($B > 0$),则 $\psi(x) = Ae^{-Bx^2}$;归一化 $\int|\psi|^2 = 1$ 给出 $|A|^2 = \sqrt{2B/\pi}$。反之,Gauss 函数使 (i)(ii) 均取等,故等号恰为 Gauss 情形。$\blacksquare$

**备注**。位移形式(页首「更一般地」)可由中心形式化归:对一般 $x_0, \xi_0$,把中心形式应用于 $g(x) = e^{-2\pi i\xi_0 x}\psi(x + x_0)$,$g$ 满足 $\|g\|_2 = 1$、$\int x^2|g|^2 = \int(x - x_0)^2|\psi|^2$、$\int\xi^2|\hat g|^2 = \int(\xi - \xi_0)^2|\hat\psi|^2$(平移–调制),即得位移形式的估计。

**与主证明的比较**。主证明(Hermite 算子,Ch.5 Ex.23(b))给出谱形式 $L \ge I$ 与算子刻画;本证明直取对易子恒等式,工具更轻(仅分部积分 + Cauchy–Schwarz + Plancherel),代价是等号条件需两步取等的分析。两证法均不依赖显式谱展开,皆留在 Schwartz 框架内。

## What-if — 反例、等价叙述与推广

### 等价叙述

#### 叙述 1（Stein 原始，归一化形式）
> $\int |\psi|^2 = 1$ ⇒ $\sigma_x \sigma_\xi \geq 1/(4\pi)$。

#### 叙述 2（$\mathbb{R}^d$ 推广）
> $\psi \in \mathcal{S}(\mathbb{R}^d)$ 且 $\int |\psi|^2 = 1$ ⇒ $\sigma_x \sigma_\xi \geq d/(4\pi)$。

#### 叙述 3（乘法公式形式，Stein Exercise 23(a)）
> $L \geq I$（Hermite 算子在 $\mathcal{S}$ 上）——算子形式 Heisenberg。

#### 叙述 4（强形式，Stein Exercise 22）
> 若 $F$ 的"主要质量"集中于 $I_1$（位置）与 $I_2$（频率），$L_j = |I_j|$，则 $L_1 L_2 \geq 1/(2\pi)$——质量集中尺度。

**等价关系**：叙述 1 ⇒ 叙述 2（多变量）；叙述 1 ≡ 叙述 3（$A^* A$ 算子分解）；叙述 4 是叙述 1 的"质量版本"。

### 反例（条件不可削弱）

1. **Gauss 达到等号**：$\psi(x) = (2/\pi)^{1/4} e^{-x^2}$ 严格满足等号——这是 Heisenberg 原理的**唯一**极值函数。
2. **非 Gauss 函数给出严格不等号**：如 $\psi(x) = \frac{1}{\pi^{1/4}} e^{-x^2/2} \cdot x e^{-x^2/2}$（Hermite 函数 $h_1$）—— $\sigma_x \sigma_\xi$ 严格 $> 1/(4\pi)$。
3. **Schwartz 条件可削弱到 $L^2$**：叙述 1 的结论对 $\psi \in L^2$（归一化）仍成立，但需测度论（实分析卷内容）。Schwartz 类是 Stein 的简化。
4. **$\hat{\psi}$ 不属于 $L^2$ 时 Heisenberg 不成立**：若 $\psi \in L^2$ 但 $\hat{\psi} \notin L^2$（如 $\psi \notin $ Schwartz 但 $\in L^2$），$\sigma_\xi$ 无定义。

### 推广 / 变体

- **$\mathbb{R}^d$ 版本**：$\sigma_x \sigma_\xi \geq d/(4\pi)$（Ch.6 Exercise 6）。
- **窗 Fourier 变换**：Heisenberg 群上的对应版本。
- **Paley-Wiener 测不准**：紧支集信号不能同时时频局域化（信号处理）。
- **Berk-Nicholls 形式**：若 $f, \hat{f}$ 都不属于 $L^2$ 但都在 $L^1$，Heisenberg 仍有推广。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（Stein 原始）| Hermite 算子 + Cauchy-Schwarz | **中至高** | Schwarz 框架，无需测度论 |
| 叙述 2（$\mathbb{R}^d$）| 多变量 Cauchy-Schwarz | **高** | 多元积分 |
| 叙述 3（算子形式）| $A^*A \geq 0$ | **中** | 与叙述 1 等价 |
| 叙述 4（强形式）| 加权均值不等式 | **高** | 需精细质量集中定义 |
| 证明二（叙述 1）| 分部积分（对易子）+ Cauchy–Schwarz | **低至中** | 工具轻（分部积分 + Plancherel + CS）；等号需两步取等分析 |

## 相关习题

- [[ch5-ex23-heisenberg|Ch.5 Ex.23]]：Hermite 算子分解 $A^*A=L-I$ 给出 $L\ge I$ 与 Heisenberg 原理的替代证法
- [[ch6-ex6-heisenberg-rd|Ch.6 Ex.6]]：$\mathbb{R}^d$ 推广——逐分量应用 $\mathbb{R}$ 版再求和，常数 $d^2/16\pi^2$
- [[ch5-pb9-hermite-eigenfunc|Ch.5 Pb.9]]：Hermite 函数谱 $Lh_k=(2k+1)h_k$、$\widehat{h_k^*}=(-i)^k h_k^*$，算子法证明的谱工具
- **Ch.5 Ex.21（紧支集不相容）**：$f$ 与 $\hat f$ 不可能同时紧支集（除非 $f \equiv 0$）——「函数与其变换不能同时局部化」的极端形式（$f$ 紧支于 $[0,1/2]$ 时展开为三角多项式，其变换为整函数型）。
- **Ch.5 Ex.22（质量集中）**：若 $\int_I x^2|f|^2 \ge \frac12\int_{\mathbb{R}}x^2|f|^2$ 且对 $\hat f$ 同理（$I_1$、$I_2$ 含各自质量之半），则 $L_1 L_2 \ge \frac{1}{2\pi}$——质量集中区间长度乘积的下界。

## 应用

- **量子力学**：Heisenberg 原理（1927）。
- **信号处理**：时频不确定性（短时 Fourier 变换）。
- **Hermite 函数谱分解**：Heisenberg 群上的不可约表示。

## 关联

- 定理：[[plancherel-theorem]]（$\int \xi^2 |\hat\psi|^2 = \|\psi'\|_2^2$ 的关键工具）、[[parseval-identity]]（同等作用）
- 概念：[[schwartz-space|$\mathcal{S}$]]（定理适用域）、[[lp-space|$L^2$]]（一般化）、[[hermite-operator]]（算子形式 $L \ge I$ 与湮灭/产生算子分解）
- 引理：[[cauchy-schwarz-inequality]]（证明核心工具）
- 方法：[[multiplication-formula-trick]]（$A^*A \geq 0$ 形式化）、[[wirtinger-inequality]]（$\mathbb{R}^d$ 推广时可参）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5, Theorem 4.1；Ch. 5, Exercise 23）

### 此证明新引入 / 补充的 method

- **乘法公式技巧**（[[multiplication-formula-trick]]）：Plancherel 的核心工具应用——Schwartz 框架的酉扩张预备。
- **Wirtinger 不等式**（[[wirtinger-inequality]]）：$\mathbb{R}^d$ 推广的辅助不变量工具。

## Stein 写法备注

Heisenberg 在 Stein 框架下的证法分两步：(a) Cauchy-Schwarz + 乘法公式给 $\int x^2 |\psi|^2 \cdot \int \xi^2 |\hat\psi|^2 \geq \frac{1}{16\pi^2}$；(b) 算子方法（Exercise 23）通过 $A^*A = L - I$ 把 Heisenberg 转化为谱不等式 $L \geq I$。两者都避开显式算子谱展开，依赖 Schwarz 内积核心技巧。
