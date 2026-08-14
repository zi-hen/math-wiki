---
type: theorem
title: 采样定理（Shannon-Nyquist）
aliases: [sampling theorem, Shannon-Nyquist theorem, Nyquist sampling]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [signal-processing, fourier-analysis]
strength: strong
strength_basis: 条件：$f \in \mathcal{S}(\mathbb{R})$（或更一般：$f \in L^2(\mathbb{R})$，$\hat f$ 紧支于 $[-1/2, 1/2]$）（弱条件——带限条件）；结论：$f(x) = \sum_{n \in \mathbb{Z}} f(n) K(x - n)$，其中 $K(y) = \sin(\pi y) / (\pi y)$（强结论——精确重建）。Stein Ch. 5 Exercise 20。
---

# 采样定理（Shannon-Nyquist）

> **工作空间**：实直线 $\mathbb{R}$。Stein 在 Ch. 5 Exercise 20 给出。

## What — 陈述

> 设 $f \in$ [[schwartz-space|$\mathcal{S}(\mathbb{R})$]] 使得 $\hat f$ 的支撑含于 $I = [-1/2, 1/2]$。则
> $$
> f(x) = \sum_{n \in \mathbb{Z}} f(n) K(x - n), \qquad K(y) = \frac{\sin(\pi y)}{\pi y}.
> $$
> **重建公式**：信号 $f$ 由其整数点的采样 $\{f(n)\}_{n \in \mathbb{Z}}$ 唯一确定。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 5, Exercise 20, p.184]]。

## Why — 动机与证明

### 动机

信号处理的核心定理："带限"信号可由其整数点采样完美重建。这是 Shannon 1949 给出的结论——其证明是 Fourier 分析的经典应用。

### 证明思路

证明分两个阶段：**周期化**与**反演**。

1. **周期化**：将 $\hat f$ 的整数平移叠加成 $1$-周期函数
$$
F(\xi) = \sum_{n \in \mathbb{Z}} \hat f(\xi + n),
$$
再用 Fourier 反演与 Poisson 求和的思想求出 $F$ 的 Fourier 系数，得到 $F(\xi) = \sum_n f(n) e^{-2\pi i n \xi}$；由带限假设，$F$ 在 $I = [-1/2, 1/2]$ 上与 $\hat f$ 重合。
2. **反演**：对恒等式 $\hat f(\xi) = \chi_I(\xi)\sum_n f(n) e^{-2\pi i n\xi}$ 作 Fourier 逆变换，交换求和与积分，计算 $\chi_I$ 的 Fourier 逆变换得到 sinc 核 $K$。

### 详细证明

**第一阶段：周期化。** 定义 $F(\xi) = \sum_{n\in\mathbb{Z}} \hat f(\xi + n)$。由 $f \in \mathcal{S}(\mathbb{R})$（[[schwartz-space|Schwartz 空间]]），$\hat f \in \mathcal{S}(\mathbb{R})$，级数在紧集上一致收敛，$F$ 良定义且为 $1$-周期连续函数。

**Claim 1**（$F$ 的 [[fourier-coefficient|Fourier 系数]]）. $F$ 的第 $m$ 个 Fourier 系数为
$$
c_m(F) = \int_0^1 F(\xi)\,e^{-2\pi i m\xi}\,d\xi = f(-m).
$$

*证明.* 代入 $F$ 的定义并逐项积分（由一致收敛可交换求和与积分）：
$$
c_m = \int_0^1 \sum_{n\in\mathbb{Z}} \hat f(\xi + n)\,e^{-2\pi i m \xi}\,d\xi = \sum_{n\in\mathbb{Z}} \int_n^{n+1} \hat f(t)\,e^{-2\pi i m (t - n)}\,dt.
$$
其中对 $t = \xi + n$ 换元，区间 $[0,1]$ 变为 $[n, n+1]$；因 $e^{2\pi i mn} = 1$（[[integer-periodicity-of-exponential|复指数的整数周期性]]），$e^{-2\pi i m(t-n)} = e^{-2\pi i mt}$。故
$$
c_m = \sum_{n\in\mathbb{Z}} \int_n^{n+1} \hat f(t)\,e^{-2\pi i m t}\,dt = \int_{\mathbb{R}} \hat f(t)\,e^{-2\pi i m t}\,dt = f(-m),
$$
末等号即 [[fourier-inversion|Fourier 反演]] $f(x) = \int \hat f(\xi) e^{2\pi i x\xi}\,d\xi$ 在 $x = -m$ 处的值。$\blacksquare$

于是 $F$ 的 Fourier 级数为 $F(\xi) = \sum_{m\in\mathbb{Z}} f(-m)\,e^{2\pi i m\xi}$；以 $n = -m$ 替换指标得
$$
F(\xi) = \sum_{n\in\mathbb{Z}} f(n)\,e^{-2\pi i n \xi}. \tag{1}
$$

另一方面，$\hat f$ 的支撑含于 $I$。对 $\xi \in I$ 与 $n \neq 0$，$\xi + n \notin I$，故 $\hat f(\xi + n) = 0$，从而 $F(\xi) = \hat f(\xi)$。结合 $(1)$，
$$
\hat f(\xi) = \chi_I(\xi) \sum_{n\in\mathbb{Z}} f(n)\,e^{-2\pi i n \xi}, \quad \xi \in \mathbb{R}. \tag{2}
$$

**第二阶段：反演与 sinc 核。** 对 $(2)$ 取 [[fourier-inversion|Fourier 逆变换]]：
$$
f(x) = \int_{\mathbb{R}} \hat f(\xi)\,e^{2\pi i x\xi}\,d\xi = \int_{-1/2}^{1/2} \sum_{n\in\mathbb{Z}} f(n)\,e^{2\pi i (x - n)\xi}\,d\xi.
$$

**Claim 2**（求和与积分的交换）. $\displaystyle f(x) = \sum_{n\in\mathbb{Z}} f(n) \int_{-1/2}^{1/2} e^{2\pi i (x-n)\xi}\,d\xi.$

*证明.* 对每个固定的 $x$，$\sum_n |f(n)| \cdot \left|\int_{-1/2}^{1/2} e^{2\pi i(x-n)\xi}\,d\xi\right| \le \sum_n |f(n)| \cdot 1 < \infty$（$f \in \mathcal{S}$ 故 $\{f(n)\}$ 绝对可和）。由控制收敛（[[dominated-convergence|控制收敛定理]]），积分与求和可交换。$\blacksquare$

对 $y \in \mathbb{R}$ 计算特征函数的 Fourier 逆变换：
$$
\int_{-1/2}^{1/2} e^{2\pi i y\xi}\,d\xi = \frac{e^{2\pi i y/2} - e^{-2\pi i y/2}}{2\pi i y} = \frac{\sin(\pi y)}{\pi y},
$$
其中 $y = 0$ 处由连续性取值为 $1$（[[rolle-mean-value-theorem|均值定理]] 或直接计算均可）。记 $K(y) = \sin(\pi y)/(\pi y)$，则
$$
f(x) = \sum_{n\in\mathbb{Z}} f(n)\,K(x - n). \qquad \blacksquare
$$

> **依赖关系小结**: 本证明依赖链为「[[schwartz-space|Schwartz 空间]] ⇒ [[fourier-inversion|Fourier 反演]] ⇒ 采样定理（本页）」：Claim 1 由 Fourier 反演在 $x = -m$ 处的值求出周期化函数 $F$ 的系数 $c_m = f(-m)$，第二阶段再对频域恒等式 (2) 取 Fourier 逆变换并计算特征函数的逆变换得到 sinc 核 $K$。辅助依赖：[[fourier-coefficient|Fourier 系数]]（$c_m$ 的定义）、[[integer-periodicity-of-exponential|复指数的整数周期性]]（$e^{2\pi i mn} = 1$ 使换元后指数不变）、[[dominated-convergence|控制收敛定理]]（Claim 2 交换求和与积分）、[[rolle-mean-value-theorem|均值定理]]（$y = 0$ 处 $K$ 取值 $1$）。周期化阶段由带限假设与反演直接实现，未调用 [[poisson-summation-formula|Poisson 求和公式]] 本身。依赖图无环。

## What-if — 反例、等价叙述

### 等价叙述

1. **单边谱条件**：$\hat f$ 紧支于 $[-1/2, 1/2]$ 等价 $f$ 可由 $\{f(n)\}$ 重建。
2. **采样率 $1/T$**：若 $\hat f$ 紧支于 $[-T/2, T/2]$，则采样间距 $1/T$ 给出重建。

**等价关系**：两个版本**iff**（仅缩放）。

### 反例

1. **信号非带限**：若 $\hat f$ 有非零支撑于 $|\xi| > 1/2$，采样 $\{f(n)\}$ 不再确定 $f$——例如 $f(x) = \sin(2\pi x) \cdot \sin(\pi x)$，$\hat f$ 在 $|\xi| = 3/2$ 处非零；仅 $\{f(n)\}$ 不能区分 $f$ 与 $f + \sin(2\pi x)$。

## 相关习题

- [[ch5-ex20-sampling|Ch.5 Ex.20]]：习题给出采样定理完整证明（PSF + 特征函数 + sinc 核）；(a) 为 sinc 重建 $f(x)=\sum_n f(n)K(x-n)$（$K(y)=\sin\pi y/\pi y$）；(b) **过采样**（oversampling）：$f(x)=\sum_n\frac{1}{\lambda}f\!\left(\frac{n}{\lambda}\right)K_\lambda\!\left(x-\frac{n}{\lambda}\right)$，$K_\lambda(y)=\frac{\cos\pi y-\cos\pi\lambda y}{\pi^2(\lambda-1)y^2}=O(1/|y|^2)$（$\lambda>1$ 采样更密则级数收敛更快，$K_\lambda\to K$ 当 $\lambda\to1$）；(c) 能量公式 $\int|f|^2=\sum_n|f(n)|^2$（采样版本的 Parseval 恒等式）。
- [[ch7-ex8-finite-reconstruction|Ch.7 Ex.8]]：有限群 $\mathbb{Z}(N)$ 上的重建 $P(x)=\sum_{j}P(j/N)K(x-j/N)$——采样定理的离散类比（核 $K(x)=\frac{1}{N}\frac{e^{2\pi ix}(1-e^{2\pi iNx})}{1-e^{2\pi ix}}$）。

## 应用

- **信号处理**：A/D 转换、采样定理
- **信息论**：Nyquist 速率 $\geq 2B$（$B$ = 信号带宽）
- **插值理论**：sinc 插值

## 关联

- 定理：[[fourier-inversion]]、[[poisson-summation-formula]]
- 引理：[[fourier-coefficient-decay|Fourier 系数衰减]]（$\mathcal{S}$ 函数 ⇒ 系数任意快速衰减 ⇒ Claim 2 的 $\{f(n)\}$ 绝对可和）
- 概念：[[character|特征标]]（$e^{-2\pi i n \xi}$ 是 $\mathbb{R}/\mathbb{Z}$ 上的特征标）
- 方法：[[integral-truncation]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5 Exercise 20）
