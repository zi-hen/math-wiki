---
type: concept
title: Hermite 算子
aliases: [Hermite operator, quantum harmonic oscillator, $L = -d^2/dx^2 + x^2$]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, quantum-mechanics, harmonic-oscillator, schwartz-space]
strength: standard
strength_basis: 条件：$f \in \mathcal{S}(\mathbb{R})$（弱——Schwartz 空间，对 Fourier 变换封闭）；结论：算子 $L = -d^2/dx^2 + x^2 \ge I$（强——半正定算子下界）+ Hermite 函数 $h_k$ 为 $L$ 的特征函数、特征值 $(2k+1)$（标准——量子力学谐振子的算子类比，连接 Fourier 分析与谱理论）。
---

# Hermite 算子

> **工作空间**：$\mathbb{R}$，算子定义域为 [[schwartz-space|Schwartz 空间]] $\mathcal{S}(\mathbb{R})$。

## What — 定义与基本事实

### 定义（Stein, Ch. 5, Exercise 23, p.186）

设 $f \in \mathcal{S}(\mathbb{R})$。**Hermite 算子**作用于 $f$ 由下式给出：
$$
L(f)(x) := -\frac{d^2 f}{dx^2}(x) + x^2 f(x), \quad x \in \mathbb{R}.
$$

有时称为量子力学谐振子的算子（quantum analogue of the harmonic oscillator）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 5, Exercise 23, p.186]]。

### 湮灭算子与产生算子

定义
$$
A f = \frac{df}{dx} + x f \quad (\text{湮灭算子}), \qquad A^* f = -\frac{df}{dx} + x f \quad (\text{产生算子}).
$$

$A, A^*$ 互为形式伴随（formal adjoint）：对 $f, g \in \mathcal{S}$，
$$
(A f, g) = (f, A^* g), \quad \text{其中} \quad (f, g) = \int_{-\infty}^{\infty} f(x) \overline{g(x)}\,dx.
$$

直接计算
$$
A^* A f = \left(-\frac{d}{dx} + x\right)\left(\frac{d}{dx} + x\right) f = -f'' - x f + f' + x f' + x f = -f'' + x^2 f - f = L f - f.
$$

故 $L = A^* A + I$。

### Claim 1（$L \ge I$）

设 $\langle f, g\rangle := (f, g)$ 为 $\mathcal{S}$ 上的标准 $L^2$ 内积。则
$$
\langle L f, f\rangle = \langle A^* A f, f\rangle + \langle f, f\rangle = \langle A f, A f\rangle + \langle f, f\rangle = \|A f\|^2 + \|f\|^2 \ge \|f\|^2 = \langle I f, f\rangle.
$$

故 $L \ge I$（作为自伴算子的下界），等号当且仅当 $A f = 0$ $\Leftrightarrow$ $f' + x f = 0$ $\Leftrightarrow$ $f(x) = c e^{-x^2/2}$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein, Ch. 5, Ex. 23]]。

### Hermite 函数 $h_k$

Hermite 函数（normalized）定义为
$$
h_k(x) = \frac{1}{(2^k k! \sqrt{\pi})^{1/2}} \cdot (-1)^k e^{x^2/2} \frac{d^k}{dx^k} e^{-x^2}, \quad k = 0, 1, 2, \ldots
$$

或等价地（Stein 风格）$h_k^*(x) = (2^{1/2}\pi^{1/4}\sqrt{k!})^{-1} \cdot h_k$ 等归一化形式。

Hermite 函数构成 $L^2(\mathbb{R})$（见 [[lp-space|$L^p$ 空间]]）的标准正交基。

### Claim 2（$h_k$ 是 $L$ 的特征函数）

$$
L h_k = (2k + 1) h_k.
$$

特征值 $(2k + 1) = 1, 3, 5, \ldots$ 为算子 $L$ 在 $\mathcal{S}$ 上的离散谱。

### Claim 3（$h_k$ 是 Fourier 变换的特征函数）

$$
\widehat{h_k^*}(\xi) = (-i)^k h_k^*(\xi),
$$

即 Fourier 变换将 $h_k^*$ 变为 $\pm 1, \pm i$ 倍的 $h_k^*$。

详见 [[ch5-pb9-hermite-eigenfunc|Ch.5 Pb.9]]。

> **依赖关系小结**: 本页证明内容为「$L = A^*A + I$ 的代数分解」（「湮灭算子与产生算子」节）与「Claim 1：$L \ge I$」。依赖链为「算子定义（$L$、$A$、$A^*$，定义域 [[schwartz-space|$\mathcal{S}(\mathbb{R})$]]）⇒ 直接计算 $A^*A = L - I$ ⇒ 形式伴随性 $(Af, g) = (f, A^*g)$（本页「湮灭算子与产生算子」节给出）与 $L^2$ 内积正性 $\|Af\|^2 \ge 0$（内积见 [[lp-space|$L^p$ 空间]]）⇒ $L \ge I$；等号情形依赖初等常微分方程 $f' + xf = 0$（分离变量，解 $f = ce^{-x^2/2}$）」。Claim 2、3 在本页为陈述（未给出证明），其证明分别依赖 Hermite 函数性质与 Fourier 变换特征函数结论（见 [[ch5-pb9-hermite-eigenfunc|Ch.5 Pb.9]]），不属本页证明的依赖链。本证明无定理级依赖，且未调用 [[heisenberg-uncertainty-principle|Heisenberg 原理]]（依赖方向为 Claim 1 ⇒ Heisenberg 算子形式，见 [[ch5-ex23-heisenberg|Ch.5 Ex.23]]，而非反之）；依赖图无环。

### 基本性质

1. **算子分解**：$L = A^* A + I$，其中 $A$（湮灭）、$A^*$（产生）互为形式伴随。
2. **下界**：$L \ge I$（自伴下界），等号仅在 Gauss 函数 $h_0(x) = \pi^{-1/4}e^{-x^2/2}$ 处。
3. **离散谱**：$L$ 在 $\mathcal{S}$ 上的特征值为 $\{2k+1 : k = 0, 1, 2, \ldots\}$，对应特征函数 $\{h_k\}_{k \ge 0}$。
4. **平移与缩放下的协变性**：$L$ 在 Fourier 变换下保持特征值结构（$\widehat{h_k} = \pm h_k$ 至多差一个相位），这是 Heisenberg 不确定性原理取等号的几何基础。
5. **对易关系**：$[A, A^*] = 2I$——这是 Heisenberg 对易关系的无穷维模拟。

### 典型例子

1. **$h_0(x) = \pi^{-1/4}e^{-x^2/2}$**（Gauss）：$L h_0 = h_0$（特征值 $1$），且 $\widehat{h_0}(\xi) = h_0(\xi)$——Fourier 自伴。
2. **$h_1(x) = \sqrt{2}\pi^{-1/4} x e^{-x^2/2}$**：$L h_1 = 3 h_1$（特征值 $3$），$\widehat{h_1}(\xi) = -i h_1(\xi)$。
3. **$h_2(x) = (2\sqrt{2})^{-1/2} \pi^{-1/4}(4x^2 - 2) e^{-x^2/2}$**：$L h_2 = 5 h_2$，$\widehat{h_2}(\xi) = -h_2(\xi)$。
4. **任意 $f \in \mathcal{S}$**：可写 $f = \sum_k c_k h_k$（Hermite 展开），$L f = \sum_k (2k+1) c_k h_k$。

## Why — 动机与直观

### 为什么引入 Hermite 算子？

Hermite 算子在三个方向上至关重要：

1. **Heisenberg 不确定性原理的算子形式**（[[heisenberg-uncertainty-principle]] Theorem 4.1）：Stein 在 Ch. 5 Exercise 23 中给出 Heisenberg 原理的 Hermite 算子证法——证明 $L \ge I$（算子下界）等价于 Heisenberg 原理的经典陈述 $\sigma_x \sigma_\xi \ge 1/(4\pi)$。此证法绕开直接分析 $\int x^2 |f|^2 \int \xi^2 |\hat f|^2$，改用算子谱性质。
2. **Fourier 变换的特征空间**：Hermite 函数 $\{h_k\}$ 是 Fourier 变换的特征函数（特征值 $\pm 1, \pm i$）——这是 Fourier 变换在 $L^2(\mathbb{R})$ 上的全部谱信息。任意 $f \in \mathcal{S}$ 的 Fourier 变换可通过 Hermite 展开显式计算。
3. **量子力学谐振子的算子类比**：经典谐振子的 Hamilton 量为 $H = p^2/2m + m\omega^2 x^2/2$（动量 + 势能），量子化后算符对应 $L$。本征函数即谐振子波函数——是量子力学的基本构造。

### 直观解释

Hermite 算子 $L = -d^2/dx^2 + x^2$ 平衡「微分」（动能）与「乘法」（势能）——前者倾向于快速振荡（高频），后者倾向于集中于原点附近（$x = 0$ 附近 $x^2$ 最小）。Gauss 函数 $h_0$ 是这两者的最优平衡（$h_0'' = (x^2 - 1)h_0 \Rightarrow L h_0 = h_0$）——这正是 Heisenberg 不确定性原理取等的情形。

## What-if — 反例与边界

### 反例

1. **$f \notin \mathcal{S}$**：若 $f$ 非 Schwartz（如 $f \in L^2$ 但非光滑），$L f$ 可能无意义或不在 $L^2$。例如 $f(x) = 1/(1+x^2)^{1/2}$ 在 $L^2$ 内但 $x^2 f$ 在 $L^2$ 外——$L f$ 无定义。
2. **零函数平凡**：$L 0 = 0$ 不显示任何结构——$L \ge I$ 对 $f = 0$ 平凡成立。
3. **非 Hermite 函数作 $f$**：对 $f \in \mathcal{S}$ 一般写 $f = \sum c_k h_k$，$L f = \sum (2k+1) c_k h_k$——但 $L f$ 仍 $\in \mathcal{S}$（因 $L$ 自伴保持 Schwartz 类）。

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. Stein 定义（Ex. 23） | $L f = -f'' + x^2 f$ | p.186 |
| 2. 算子分解 | $L = A^* A + I$ | 直接计算 |
| 3. 量子谐振子 | $H = -\frac{d^2}{dx^2} + x^2$（$\hbar = m = \omega = 1$） | 量子力学类比 |
| 4. Hermite 多项式 | $H_k(x) = (-1)^k e^{x^2} \frac{d^k}{dx^k}e^{-x^2}$ | 经典定义 |

### 推广 / 变体

- **多维**：$L = -\Delta + |x|^2$ 在 $\mathbb{R}^d$ 上，特征函数为 $h_{k_1}(x_1) \cdots h_{k_d}(x_d)$ 张成的张量积。
- **带常数**：$L_\alpha = -d^2/dx^2 + \alpha^2 x^2$（$\alpha > 0$），通过尺度变换 $x \mapsto \alpha^{1/2} x$ 等价于 $L$。
- **Mehler 公式**：$e^{-t L}(f, g) = \int f(x) e^{-t L} g(y)\,dx\,dy$ 给出热核（Mehler kernel）。

## 相关习题

- [[ch5-ex23-heisenberg|Ch.5 Ex.23]]：Heisenberg 不确定性原理的 Hermite 算子法——详细证明 (a) Heisenberg $\Rightarrow$ $L \ge I$ 与 (b) $A^*A = L - I$。
- [[ch5-pb9-hermite-eigenfunc|Ch.5 Pb.9]]：Hermite 函数是 Fourier 变换的特征函数。

## 关联

- 概念：[[schwartz-space]]（算子定义域）
- 定理：[[heisenberg-uncertainty-principle]]（$L \ge I$ 等价形式）、[[plancherel-theorem]]（Hermite 函数正交基上的 Parseval）
- 引理：[[ch5-ex23-heisenberg]]（具体证法）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5, Exercise 23, p.186）