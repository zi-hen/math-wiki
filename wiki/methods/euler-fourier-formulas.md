---
type: method
title: Euler 部分分式公式（Fourier 路线与 Poisson 路线）
aliases: [Euler partial fraction formulas, cotangent partial fractions, Euler reflection formula, 余割平方和求法]
description: 把初等三角函数展为 Fourier 级数在特殊点取值；或对有理函数用 Poisson 求和公式——两种互补方法推出 cotangent / 余割 / 反射公式等一族恒等式。
created: 2026-08-13
updated: 2026-08-15
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, special-functions, series]
strength: standard
strength_basis: 弱条件（仅 $\alpha\notin\mathbb Z$，光滑性 / Schwartz 衰减）；强结论（同时给出 cotangent 部分分式、csc² 求和、反射积分、Euler 反射公式的一族恒等式）。两种方法各自独立完整，互为补充，故列为 method（一种「由 Fourier 系数求和导出特殊函数恒等式」的论证模式，而非单一命题）。
---

# Euler 部分分式公式（Fourier 路线与 Poisson 路线）

> **工作空间**：圆群 $\mathbb{T} = [-\pi, \pi]$（Fourier 路线）与实直线 $\mathbb{R}$（Poisson 路线）。参数 $\alpha \in \mathbb{C} \setminus \mathbb{Z}$。

## 适用场景

需要同时建立一族「与 cotangent / 余割 / 反射积分有关的」恒等式时，本页提供两条独立路线：

- **Fourier 路线**（Ch. 3, Ex. 3, p.113–114）：把 $\cos(\alpha x)$ 展为 Fourier 级数，在端点 $x = 0$ 与 $x = \pi$ 取值；最后一步 (iv) 用几何级数展开 $1/(1+t)$ 处理积分。
- **Poisson 路线**（Ch. 5, Ex. 15, p.184）：对 $g(x) = 1/(x^2+\alpha^2)$（满足 Schwartz 条件）应用 [[poisson-summation-formula|Poisson 求和公式]]，得 $\sum_n 1/(n+\alpha)^2 = \pi^2/\sin^2(\pi\alpha)$；再积分得 $\sum_n 1/(n+\alpha) = \pi/\tan(\pi\alpha)$。

两条路线给出**同一族公式**——它们并不互相依赖，却殊途同归。这是「同一对象、两种表示」的教科书范例。

## 关键思想

**核心机制**：把一个初等函数 $f$ 在某点 $x_0$ 处用两种方式表示：

- **函数值** $f(x_0)$（直接代入）；
- **频率展开的系数求和** $\sum_n \hat f(n)\,e^{2\pi i n x_0}$（Fourier 路线：直接展成 Fourier 级数在 $x_0$ 取值；Poisson 路线：用 PSF 在 $x_0=0$ 处取 $\sum f(n) = \sum \hat f(n)$，再求 $\hat f$ 在整数点之值）。

二者相等即得到系数和的封闭公式。

> **适用范围**：求和式中各分项为 $1/((n+\alpha)^k)$ 之类的情形——它们在 $n$ 大时快速衰减，从而保证 Fourier / Poisson 两条路线所需的光滑性或 Schwartz 条件。

## 步骤

1. **选取母函数**：在 Fourier 路线取 $f(x) = \cos(\alpha x)$（$2\pi$-周期）；在 Poisson 路线取 $g(x) = 1/(x^2+\alpha^2)$。
2. **求 Fourier 系数（或 Fourier 变换）**：
   - Fourier 路线：$\cos(\alpha x)$ 在 $[-\pi,\pi]$ 上的 Fourier 系数用和差化积 + 端点三角函数值计算；
   - Poisson 路线：$g(x) = 1/(x^2+\alpha^2)$ 的 Fourier 变换用留数或已知公式 $\hat g(\xi) = (\pi/\alpha) e^{-2\pi \alpha |\xi|}$。
3. **在特殊点取值**：
   - Fourier 路线：在 $x = \pi$ 与 $x = 0$ 取值，得 (ii) $\cot$ 部分分式与 (iii) $\alpha\pi/\sin(\alpha\pi)$ 的级数；
   - Poisson 路线：在 $x = 0$ 处取 PSF 的两端，得 $\sum_n 1/(n+\alpha)^2$。
4. **后处理（可选）**：
   - Fourier 路线：(iv) 用几何级数展开 $1/(1+t)$，把积分化为 $\sum_n (-1)^n/(n+\alpha)$；
   - Poisson 路线：对 $\alpha$ 求导或积分（$1/(n+\alpha)^2$ 对 $\alpha$ 求导即得 $1/(n+\alpha)$ 的形式），得 $\sum_n 1/(n+\alpha) = \pi/\tan(\pi\alpha)$。

## 陷阱

- **$\alpha \in \mathbb{Z}$ 时失效**：$\sin(\pi\alpha) = 0$，级数系数分母 $\alpha^2 - n^2 = 0$——公式退化。在 Poission 路线里 $\alpha \in \mathbb{Z}$ 时 $1/(x^2+\alpha^2)$ 在 $x = \pm\alpha$ 处有极点，PSF 不直接适用。
- **对称主值约定**：Poisson 路线给出的 $\sum_n 1/(n+\alpha)$ 取**对称主值**——奇数项 $n = 0, \pm 1, \pm 2, \ldots$ 两端对称截断后取极限。Fourier 路线的 $\sum_n 1/(\alpha^2 - n^2)$ 则对 $n \ge 1$ 单边求和。两种约定须区分（详见 [[residue-by-taylor-coeff|留数 = Taylor 系数]]）。
- **Poisson 路线 (b) 的积分范围**：$\int_0^\alpha \sum_n 1/(n+\beta)^2\,d\beta$ 须先验证绝对收敛以交换积分与求和——由 $\sum 1/(n+\beta)^2 \le C$ 一致有界保证（$|\beta| \le \alpha$ 在远离整数的紧集上）。

## 实例

- 在 [[poisson-summation-formula|Poisson 求和公式]] 的「相关习题」节：$\sum_n 1/(n+\alpha)^2 = \pi^2/\sin^2(\pi\alpha)$ 与 $\sum_n 1/(n+\alpha) = \pi/\tan(\pi\alpha)$ 列为 Ch.5 Ex.15 的标准结论——本方法在 Schwartz 函数上的典型应用。
- 在 [[residue-by-taylor-coeff|留数 = Taylor 系数]]「典型例子」节：$\pi \cot \pi z$ 的部分分式展开由 $1/(e^{2\pi i z}-1)$ 在整数点的留数得到——复分析路线（Book II）。

## 相关命题（已 wikilink）

以下恒等式均在本页两条路线中被证明或联系：

- **$\cot$ 部分分式**：$\pi\cot(\pi\alpha) = 1/\alpha + 2\alpha\sum_{n\ge1} 1/(\alpha^2 - n^2)$，$\alpha \notin \mathbb{Z}$（Fourier 路线 (ii)）。
- **余割公式**：$\alpha\pi/\sin(\alpha\pi) = 1 + 2\alpha^2\sum_{n\ge1} (-1)^{n-1}/(n^2-\alpha^2)$（Fourier 路线 (iii)）。
- **余割平方和**：$\sum_n 1/(n+\alpha)^2 = \pi^2/\sin^2(\pi\alpha)$（Poisson 路线 Ch.5 Ex.15(a)）。
- **余切求和**：$\sum_n 1/(n+\alpha) = \pi/\tan(\pi\alpha)$（Poisson 路线 Ch.5 Ex.15(b)，对称主值约定）。
- **Euler 反射积分**：$\int_0^\infty t^{\alpha-1}/(1+t)\,dt = \pi/\sin(\alpha\pi)$，$0 < \alpha < 1$（Fourier 路线 (iv)，由 (iii) + 几何级数展开得到）。
- **Euler 反射公式（Gamma 函数版）**：$\Gamma(\alpha)\Gamma(1-\alpha) = \pi/\sin(\pi\alpha)$——与上述同族的 Gamma 函数语言。

## 详细论证

### 路线 A（Fourier 路线，Ch. 3 Ex. 3）

> **动机**：$\cos(\alpha x)$ 是 $2\pi$-周期的光滑函数，其 Fourier 级数必然逐点收敛到自身。在特殊点 $x = 0$ 与 $x = \pi$ 取值，级数即化为「系数求和」的恒等式。这是「Fourier 级数 = 函数在频率域的精确分解」的样板：**同一对象，两种表示（函数值 vs 系数和），恒等即公式**。

**Claim 1**（$\cos(\alpha x)$ 的 Fourier 系数）. $\cos(\alpha x)$ 在 $[-\pi,\pi]$ 上的 Fourier 系数为
$$
a_0 = \frac{2\sin(\pi\alpha)}{\pi\alpha}, \qquad a_n = \frac{2\alpha\sin(\pi\alpha)}{\pi}\cdot\frac{(-1)^n}{\alpha^2 - n^2} \quad (n \ge 1).
$$

*证明.* $a_0 = \frac{1}{\pi}\int_{-\pi}^\pi\cos(\alpha x)\,dx = \frac{2\sin(\pi\alpha)}{\pi\alpha}$。对 $n \ge 1$，由 $2\cos(\alpha x)\cos(nx) = \cos((\alpha+n)x) + \cos((\alpha-n)x)$，
$$
\int_{-\pi}^\pi\cos(\alpha x)\cos(nx)\,dx = \left[\frac{\sin((\alpha+n)x)}{\alpha+n} + \frac{\sin((\alpha-n)x)}{\alpha-n}\right]_{-\pi}^{\pi}.
$$
在端点，$\sin((\alpha \pm n)\pi) = \sin(\alpha\pi)\cos(n\pi) = (-1)^n\sin(\alpha\pi)$（因 $\sin(n\pi) = 0$），故
$$
\int_{-\pi}^\pi = 2(-1)^n\sin(\pi\alpha)\left(\frac{1}{\alpha+n}+\frac{1}{\alpha-n}\right) = \frac{4\alpha(-1)^n\sin(\pi\alpha)}{\alpha^2-n^2},
$$
除以 $\pi$ 得 $a_n$。$\blacksquare$

**（i）级数表示**. $\cos(\alpha x)$ 光滑，Fourier 级数逐点收敛到它自己；代入 Claim 1 即得
$$
\cos(\alpha x) = \frac{\sin(\pi\alpha)}{\pi}\left[\frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty \frac{(-1)^n \cos(nx)}{\alpha^2 - n^2}\right].
$$

**（ii）$x = \pi$ 处的取值**. $\cos(n\pi) = (-1)^n$，故 $(-1)^n \cos(n\pi) = 1$：
$$
\cos(\alpha\pi) = \frac{\sin(\pi\alpha)}{\pi}\left[\frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty\frac{1}{\alpha^2-n^2}\right].
$$
两边除以 $\sin(\pi\alpha)/\pi$ 并整理得
$$
\pi\cot(\pi\alpha) = \frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty\frac{1}{\alpha^2-n^2}, \qquad
\cot u = \frac{1}{u} + 2\sum_{n=1}^\infty\frac{u}{u^2-n^2\pi^2} \quad (u \in \mathbb{C}\setminus\pi\mathbb{Z}).
$$

**（iii）$x = 0$ 处的取值**. $\cos(n\cdot 0) = 1$：
$$
1 = \frac{\sin(\pi\alpha)}{\pi}\left[\frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty\frac{(-1)^n}{\alpha^2-n^2}\right]
\;\Longrightarrow\;
\frac{\alpha\pi}{\sin(\alpha\pi)} = 1 + 2\alpha^2\sum_{n=1}^\infty\frac{(-1)^{n-1}}{n^2-\alpha^2}.
$$

**（iv）反射积分**. 对 $0 < \alpha < 1$，换元 $t = 1/u$ 于 $\int_1^\infty$ 部分：
$$
\int_0^\infty\frac{t^{\alpha-1}}{1+t}\,dt
= \int_0^1\frac{t^{\alpha-1}}{1+t}\,dt + \int_0^1\frac{u^{-\alpha}}{1+u}\,du
= \sum_{k=0}^\infty(-1)^k\left(\frac{1}{k+\alpha} + \frac{1}{k+1-\alpha}\right),
$$
（几何级数 $1/(1+t) = \sum(-1)^k t^k$ 在 $[0,1]$ 上一致收敛，可逐项积分）。末式经指标代换 $k \mapsto -m-1$ 合并为 $\sum_{n\in\mathbb{Z}}\frac{(-1)^n}{n+\alpha}$，而由 (iii) 的部分分式
$$
\frac{\pi}{\sin(\alpha\pi)} = \sum_{n\in\mathbb{Z}}\frac{(-1)^n}{n+\alpha},
$$
即得结论。$\blacksquare$

> **依赖关系小结**. 本路线依赖链为「[[fourier-coefficient|Fourier 系数]]的含参计算（Claim 1，和差化积 + 端点三角函数值 $\sin((\alpha\pm n)\pi) = (-1)^n\sin(\alpha\pi)$）⇒ [[fourier-series|Fourier 级数]]逐点收敛（$\cos(\alpha x)$ 光滑，级数收敛到自身）⇒ 端点取值 (ii)(iii) ⇒ 部分分式合并 (iv)」。步骤 (iv) 另用几何级数展开 $1/(1+t)$（$[0,1]$ 上一致收敛，可逐项积分）并把积分拆为 $\int_0^1 + \int_1^\infty$。除 Fourier 系数定义与级数逐点收敛基本事实外无定理级依赖（不依赖复分析留数路线）。依赖图无环。

### 路线 B（Poisson 路线，Ch. 5 Ex. 15, p.184）

> **动机**：Stein 在 Ch.5 §3 末尾（p.172）显式给出此路线：「**It turns out that the operation of periodization is important in a number of questions, even when the Poisson summation formula does not apply.** We give an example by considering the elementary function $f(x) = 1/x$, $x \ne 0$. The result is that $\sum_{n\ne 0} 1/(x+n)$, when summed symmetrically, gives the partial fraction decomposition of the cotangent function. In fact this sum equals $\pi \cot \pi x$, when $x$ is not an integer. **Similarly with $f(x) = 1/x^2$, we get $\sum 1/(x+n)^2 = \pi^2/(\sin \pi x)^2$, whenever $x \notin \mathbb{Z}$.**」Ch.5 Ex.15(a) 把这一策略用 PSF 形式精确化。

**Claim 2**（位移 Poisson 核的 Fourier 变换）. 设 $\beta > 0$、$\alpha \in \mathbb{R}$。函数
$$
f_\beta(x) = \frac{1}{(x+\alpha)^2 + \beta^2}
$$
属于 $\mathcal{S}(\mathbb{R})$（对任意 $\beta > 0$，$C^\infty$ 且所有导数多项式衰减）。其 Fourier 变换（Stein 约定）为
$$
\hat{f_\beta}(\xi) = \int_{-\infty}^\infty \frac{e^{-2\pi i \xi x}}{(x+\alpha)^2 + \beta^2}\,dx = \frac{\pi}{\beta}\, e^{-2\pi\beta|\xi|}\, e^{2\pi i \alpha \xi}.
$$

*证明*. 因 $f_\beta \in L^1(\mathbb{R})$，变换良定义。作变量替换 $y = x + \alpha$（故 $\xi$ 不变）：
$$
\hat{f_\beta}(\xi) = e^{2\pi i \alpha \xi} \int_{-\infty}^\infty \frac{e^{-2\pi i \xi y}}{y^2 + \beta^2}\,dy = e^{2\pi i \alpha \xi} \cdot \frac{\pi}{\beta}\,e^{-2\pi\beta|\xi|},
$$
其中末步是围道积分（在 $z = \pm\beta i$ 处的留数计算，见 [[residue-calculus|留数计算法]]与 [[residue-by-taylor-coeff|留数 = Taylor 系数]]）。$\blacksquare$

**(a) 余割平方和**. 对 $f_\beta \in \mathcal{S}(\mathbb{R})$ 应用 [[poisson-summation-formula|Poisson 求和公式]]：
$$
\sum_{n\in\mathbb{Z}} f_\beta(n) = \sum_{n\in\mathbb{Z}} \hat{f_\beta}(n).
$$

**左端**：$\sum_{n\in\mathbb{Z}} 1/((n+\alpha)^2 + \beta^2)$。

**右端**：由 Claim 2 等于
$$
\sum_{n\in\mathbb{Z}} \frac{\pi}{\beta}\,e^{-2\pi\beta|n|}\, e^{2\pi i\alpha n} = \frac{\pi}{\beta}\left(1 + 2\sum_{n=1}^\infty e^{-2\pi\beta n}\cos(2\pi\alpha n)\right).
$$
此即**几何级数的 Poisson 核**——具体化简为
$$
\frac{\pi}{\beta}\cdot\frac{\sinh(2\pi\beta)}{\cosh(2\pi\beta) - \cos(2\pi\alpha)}.
$$

故对任意 $\beta > 0$（**正则化参数**），
$$
\sum_{n\in\mathbb{Z}} \frac{1}{(n+\alpha)^2 + \beta^2} = \frac{\pi}{\beta}\cdot\frac{\sinh(2\pi\beta)}{\cosh(2\pi\beta) - \cos(2\pi\alpha)}. \tag{*}
$$

现在取 $\beta \to 0^+$ 极限。两侧的奇异性分析：

- **左端**：$\sum_n 1/((n+\alpha)^2 + \beta^2) = 1/\beta^2 + \sum_{n\ne 0} 1/((n+\alpha)^2 + \beta^2)$。第一项 $\to 1/\beta^2$，第二项收敛至 $\sum_{n\ne 0} 1/(n+\alpha)^2$。
- **右端**：当 $\beta \to 0^+$ 时，
$$
\frac{\pi}{\beta}\cdot\frac{\sinh(2\pi\beta)}{\cosh(2\pi\beta) - \cos(2\pi\alpha)} \sim \frac{\pi}{\beta}\cdot\frac{2\pi\beta}{1 - \cos(2\pi\alpha)} = \frac{2\pi^2}{1 - \cos(2\pi\alpha)} = \frac{\pi^2}{\sin^2(\pi\alpha)},
$$
其中用到 $\sinh(2\pi\beta) \sim 2\pi\beta$、$\cosh(2\pi\beta) \sim 1 + 2\pi^2\beta^2$。

更精确地，对右端作 Laurent 展开于 $\beta = 0$：分子 $\sim 2\pi\beta$，分母 $\sim 2\pi^2\beta^2 + (1 - \cos(2\pi\alpha))$。当 $\beta \to 0^+$ 时，**主项**为 $\frac{1}{\beta^2}$（与左端 $n = 0$ 项匹配），**常数项**（即 $\beta^0$ 系数）给出 $\sum_{n\ne 0} 1/(n+\alpha)^2 = \frac{\pi^2}{\sin^2(\pi\alpha)}$（减去 $1/\beta^2$ 主项后取 $\beta \to 0^+$）。

合并即得
$$
\sum_{n\in\mathbb{Z}} \frac{1}{(n+\alpha)^2} = \frac{\pi^2}{\sin^2(\pi\alpha)}, \qquad \alpha \in \mathbb{R}\setminus\mathbb{Z}. \tag{A}
$$

**严格化说明**：上述 $\beta \to 0^+$ 极限须细心处理——左端对 $\beta$ 单调递减、右端亦然，两端均在 $\beta = 0$ 处有 $1/\beta^2$ 型奇异性；逐项减去 $n = 0$ 项后，剩余和一致收敛，交换极限与求和的合法性由 [[dominated-convergence|控制收敛定理]]保证（$|1/((n+\alpha)^2+\beta^2)| \le 1/(n+\alpha)^2$，在 $n\ne 0$ 上可积且被独立于 $\beta$ 的可积函数控制）。

**(b) 余切求和**. 由 Stein 原题提示「First prove it when $0 < \alpha < 1$. To do so, **integrate** the formula in (a)」：对 (A) 关于 $\alpha$ 在 $(0, \alpha)$ 上积分。

**左端**（逐项积分，由 $\sum_{n\ne 0} 1/(n+\beta)^2$ 在 $|\beta| \le \alpha < 1$ 上一致有界保证交换积分与求和的合法性）：
$$
\int_0^\alpha \sum_{n\in\mathbb{Z}} \frac{1}{(n+\beta)^2}\,d\beta = \sum_{n\in\mathbb{Z}} \left[-\frac{1}{n+\beta}\right]_{\beta=0}^{\beta=\alpha} = \sum_{n\in\mathbb{Z}} \left(\frac{1}{n} - \frac{1}{n+\alpha}\right).
$$

**右端**：$\int_0^\alpha \pi^2/\sin^2(\pi\beta)\,d\beta = -\pi\cot(\pi\alpha) + \lim_{\beta\to 0^+}\pi\cot(\pi\beta)$。

两侧在 $\beta \to 0^+$ 端均发散（$\pi\cot(\pi\beta) \sim 1/\beta$，$\sum_n 1/n$ 在对称主值下发散），但**发散项相互抵消**：

取对称主值约定 $\sum_{n\ne 0} 1/n = 0$（正负项配对消去），则
$$
\sum_{n\in\mathbb{Z}} \left(\frac{1}{n} - \frac{1}{n+\alpha}\right) = -\sum_{n\in\mathbb{Z}} \frac{1}{n+\alpha} \quad (\text{对称主值}).
$$

相应地，右侧的 $\lim_{\beta\to 0^+} \pi\cot(\pi\beta)$ 在 Cauchy 主值意义下为零（左右 $\pm 1/(n\beta)$ 配对消去）——故
$$
-\sum_{n\in\mathbb{Z}} \frac{1}{n+\alpha} = -\pi\cot(\pi\alpha) \quad \Longrightarrow \quad \sum_{n\in\mathbb{Z}} \frac{1}{n+\alpha} = \pi\cot(\pi\alpha) = \frac{\pi}{\tan(\pi\alpha)}, \qquad \alpha \in \mathbb{R}\setminus\mathbb{Z}. \tag{B}
$$

最后代入 $\alpha = 1/2$ 验证：左端 $\sum_n 1/(n+1/2) = \cdots + 1/(-3/2) + 1/(-1/2) + 1/(1/2) + 1/(3/2) + \cdots = (-2/3 + 2/3) + (-2 + 2) + \cdots = 0$（对称求和），右端 $\pi/\tan(\pi/2) = 0$——一致。$\blacksquare$

> **依赖关系小结**. 本路线依赖链为「Schwartz 类的位移有理函数 $f_\beta(x) = 1/((x+\alpha)^2+\beta^2)$（$\beta > 0$ 为正则化参数）⇒ Claim 2 求 Fourier 变换（围道积分 / 留数，依赖 [[residue-calculus|留数计算法]]）⇒ [[poisson-summation-formula|PSF]] 在 $\mathcal{S}(\mathbb{R})$ 上严格成立（依赖 [[schwartz-space|Schwartz 空间]]（快速衰减）+ Fubini 交换 + 唯一性）⇒ $(*)$ 含 $\beta$ 的恒等式 ⇒ $\beta \to 0^+$ 极限（受 [[dominated-convergence|控制收敛]]保证交换求和与极限的合法性）⇒ (A) 余割平方和 ⇒ (B) 对 $\alpha$ 积分（逐项合法性由 $\sum 1/(n+\beta)^2$ 在紧集上一致有界保证；对称主值消去 $\sum 1/n$ 的发散）得余切求和」。**关键差异**：本路线仅在 $\alpha \in \mathbb{R}\setminus\mathbb{Z}$ 时成立（Fourier 路线可推广至 $\alpha \in \mathbb{C}\setminus\mathbb{Z}$）；但 Poisson 路线给出**更整齐**的 $1/(n+\alpha)^2$ 与 $1/(n+\alpha)$ 形式。

## 两条路线的对比

| 维度 | Fourier 路线（Ch.3 Ex.3） | Poisson 路线（Ch.5 Ex.15） |
|------|---------------------------|-----------------------------|
| **母函数** | $\cos(\alpha x)$（$2\pi$-周期，光滑） | $g(x) = 1/(x^2+\alpha^2) \in \mathcal{S}(\mathbb{R})$ |
| **系数计算** | Fourier 系数 $\hat f(n)$（圆群定义 + 积分变量替换） | Fourier 变换 $\hat g(\xi) = \frac{\pi}{\alpha}e^{-2\pi\alpha\lvert\xi\rvert}$（围道积分/留数） |
| **核心理论** | [[fourier-series]]（Fourier 级数）逐点收敛（光滑 ⟹ 自收敛）+ 端点取值 | [[poisson-summation-formula]]（PSF：Schwartz ⟹ 唯一性 + Fubini 交换）|
| **工作空间** | 圆群 $\mathbb{T} = [-\pi,\pi]$ | 实直线 $\mathbb{R}$ |
| **导出公式** | $\cot$ 部分分式 (ii)、$\alpha\pi/\sin(\alpha\pi)$ 的级数 (iii)、Euler 反射积分 (iv) | $\sum 1/(n+\alpha)^2 = \pi^2/\sin^2(\pi\alpha)$（a）、$\sum 1/(n+\alpha) = \pi/\tan(\pi\alpha)$（b） |
| **复分析依赖** | 否（仅用三角恒等式与几何级数） | 是（求 $\hat g$ 须围道积分/留数）|
| **参数范围** | $\alpha \in \mathbb{C}\setminus\mathbb{Z}$（**复参数**） | $\alpha > 0$（**实参数**），$\alpha \notin \mathbb{Z}$ |
| **证明难度** | (i)–(iii) **低**； (iv) **中** | (a) **低**（PSF 直接代入）； (b) **中**（逐项微分合法性 + 对称主值约定） |
| **代价** | 仅得到 $\sum 1/(n^2-\alpha^2)$ 型（圆群形式）；反射积分须 (iv) 额外处理 | 复参数 $\alpha$ 推广须附加论证；须解 PSF 条件（Schwartz） |

### 互补性

- **Fourier 路线的优势**：得到 $\alpha\pi/\sin(\alpha\pi)$ 的级数（即 csc 的部分分式展开）与 Euler 反射积分——这些 Poisson 路线**不直接给出**。
- **Poisson 路线的优势**：直接得到 $\sum 1/(n+\alpha)^2$（更对称的"平方和"形式）与 $\sum 1/(n+\alpha)$（余切求和），公式更整齐——Fourier 路线 (ii)(iii) 中需要 $n^2 - \alpha^2$ 与 $(-1)^{n-1}$ 修正项，形式更迂回。
- **本质一致**：两条路线都基于「同一对象、两种表示（时域 / 频域）」——只是**对象**不同（$\cos(\alpha x)$ vs $1/(x^2+\alpha^2)$）、**取特殊点**方式不同（$x = 0, \pi$ in $\mathbb{T}$ vs $x = 0$ in $\mathbb{R}$）。这印证了 Fourier 分析的核心理念：**频率信息完整刻画函数**。
- **与复分析路线的三足鼎立**：另由 [[residue-by-taylor-coeff|留数 = Taylor 系数]] 的留数计算（对 $\pi\cot\pi z$ 部分分式）：在整数点的留数 $\frac{1}{2\pi i}$ 直接给出 $\pi\cot\pi z = \frac{1}{z} + 2z\sum_n 1/(z^2-n^2)$——这是同一族公式的**第三条独立路线**。

## 反例 / 边界

- **$\alpha \in \mathbb{Z}$ 时全部失效**：$\sin(\pi\alpha) = 0$，$\cot(\pi\alpha)$ 无定义（奇点），$1/(n+\alpha)$ 在 $n = -\alpha$ 处有极点——所有公式退化。Fourier 路线此时 $\cos(\alpha x)$ 退化为纯三角函数（$\alpha = 0$ 时为 $1$，$\alpha \in \mathbb{Z}\setminus\{0\}$ 时为 $\cos(nx)$），系数求和为平凡。
- **$\alpha \notin \mathbb{R}$ 时的 PSF 路线**：Poisson 路线仅在 $\alpha > 0$（实数）下成立；$\alpha \in \mathbb{C}$ 时 $g(x) = 1/(x^2+\alpha^2)$ 不再在 $\mathbb{R}$ 上衰减充分快（除非 $\operatorname{Im}\alpha > 0$）。Fourier 路线则对 $\alpha \in \mathbb{C}\setminus\mathbb{Z}$ 均成立——这是 Fourier 路线的**优势**。

## 证明难度差异

| 路线 | 关键步骤 | 难度 |
|------|----------|------|
| Fourier (i)–(iii) | 含参积分 + 端点取值 | **低** |
| Fourier (iv) | 几何级数 + 部分分式合并 | **中** |
| Poisson (a) | PSF 直接代入 + $\hat g$ 显式计算 | **低** |
| Poisson (b) | 对称主值约定 + 逐项微分合法性 | **中** |

## 关联

- 方法：[[approx-by-good-kernel|近似核逼近]]（Fourier 路线的逐点收敛）、[[integration-by-parts|分部积分法]]（求 Fourier 系数时的端点估计）、[[residue-calculus|留数计算法]]（Poisson 路线求 $\hat g$ 的围道积分）、[[differentiation-under-integral|对参数求导]]（Poisson (b) 逐项微分）
- 定理：[[poisson-summation-formula|Poisson 求和公式]]（Poisson 路线的核心工具）、[[fourier-inversion|Fourier 反演]]（Fourier 路线光滑收敛的理论背景）、[[residue-by-taylor-coeff|留数 = Taylor 系数]]（复分析路线，给出 $\pi\cot\pi z$ 部分分式）
- 引理：[[residue-by-taylor-coeff|留数 = Taylor 系数]]（Poisson 路线 Claim 2 中 $\hat g$ 的围道积分）、[[multiplication-formula-trick|乘法公式技巧]]（PSF 证明中常用）
- 概念：[[fourier-series]]、[[fourier-coefficient]]、[[fourier-transform]]、[[schwartz-space]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3 Ex. 3 p.113–114；Ch. 5 §3 末尾动机；Ch. 5 Ex. 15, p.184）
