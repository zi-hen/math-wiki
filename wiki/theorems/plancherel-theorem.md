---
type: theorem
title: Plancherel 定理
aliases: [Plancherel theorem, Plancherel's theorem]
created: 2026-08-12
updated: 2026-08-14
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, L2-theory, schwartz]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f \in \mathcal{S}(\mathbb{R})$（强——Schwartz 类，但 $\mathcal{S} \subset L^2$ 稠密使结论延拓）；结论：$\|f\|_{L^2(\mathbb{R})} = \|\hat{f}\|_{L^2(\mathbb{R})}$（强——Fourier 变换在 $L^2$ 上为等距同构）。Stein 在 Ch. 5, Theorem 1.12 仅证 Schwartz 类版本；$L^2$ 延拓需测度论（实分析卷内容）。Bessel 不等式方向：由 Parseval 圆群版本极限化得到。属标准强定理，Fourier 变换推广到 $L^2$ 的核心。
---

# Plancherel 定理

> **工作空间**：实直线 $\mathbb{R}$。Stein 在 Ch. 5, Theorem 1.12 给出 Schwartz 类版本；$\mathbb{R}^d$ 推广见 Ch. 6。

## What — 陈述

> 设 $f \in$ [[schwartz-space|]]$\mathcal{S}(\mathbb{R})$（Schwartz 空间），则其 Fourier 变换 $\hat{f}$ 满足
> $$
> \int_{\mathbb{R}} |\hat{f}(\xi)|^2\,d\xi = \int_{\mathbb{R}} |f(x)|^2\,dx.
> $$
> 即 $\mathcal{F}: \mathcal{S} \to \mathcal{S}$ 在 $\|\cdot\|_{L^2}$ 下为**等距同构**（[[lp-space|$L^2$]] 范数意义下）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Theorem 1.12]]。

## Why — 动机与证明

### 动机

Plancherel 定理是 [[parseval-identity|Parseval 恒等式]] 在 $\mathbb{R}$ 上的对应。它把 Fourier 变换从 $L^1$（仅 Schwarz 函数可微反演）扩展到 $L^2$（闭包扩张），是 Fourier 分析在 $L^2$ Hilbert 空间上得以自洽的关键。在 Hilbert 空间语言中，$\mathcal{F}: \mathcal{S} \hookrightarrow L^2$ 是等距映射，可延拓为 $L^2 \to L^2$ 的酉算子。

### 证明思路

Stein 的 Ch. 5 定理 1.12 证明完全在 Schwartz 框架内，一步到位：

- **Claim 1**：直接对 $\|\hat f\|_2^2 = \int \hat f(\xi)\overline{\hat f(\xi)}\,d\xi$ 展开 Fourier 变换定义、用 [[fubini-tonelli|Fubini 定理]]交换积分次序、再以 [[fourier-inversion|Fourier 反演]]（Theorem 1.9）回代，得 $\|\hat f\|_2^2 = \int \overline{f(x)} f(x)\,dx = \|f\|_2^2$。

此即 **Plancherel 恒等式**的核心。乘积公式（Proposition 1.8 / [[multiplication-formula-trick|乘法公式技巧]]）可由 Plancherel 的极化形式立即导出（用 $\hat g \in \mathcal{S}$ 替代 $g$），是 Plancherel 的推论而非前置。

**依赖链严格**为
$$
\text{Thm 1.6（好核族）} \Rightarrow \text{Cor 1.7（磨光）} \Rightarrow \text{Thm 1.9（反演）} \Rightarrow \text{Thm 1.12（Plancherel）} \Rightarrow \text{Prop 1.8（乘法公式）}
$$
其中 Theorem 1.6 / 1.9 与 Plancherel 本身**互不依赖**（反演定理由 Gauss 磨光独立证），故本证明**无循环论证**。

### 详细证明

**Claim 1**（极化前身：内积的 Fourier 对易，[[multiplication-formula-trick|乘法公式技巧]]）. 设 $f, g \in \mathcal{S}(\mathbb{R})$，则
$$
\int_{\mathbb{R}} f(x)\,\overline{g(x)}\,dx = \int_{\mathbb{R}} \hat{f}(\xi)\,\overline{\hat{g}(\xi)}\,d\xi. \tag{1}
$$

*证明.* 展开右端 $\overline{\hat{g}(\xi)}$（由 [[fourier-transform|Fourier 变换]]定义 $\hat{g}(\xi) = \int g(y)e^{-2\pi i\xi y}\,dy$ 取共轭，$g \in \mathcal{S} \subset L^1$ 保证积分绝对收敛）：
$$
\overline{\hat{g}(\xi)} = \overline{\int_{\mathbb{R}} g(y)\,e^{-2\pi i \xi y}\,dy} = \int_{\mathbb{R}} \overline{g(y)}\,e^{2\pi i \xi y}\,dy.
$$
代入右端：
$$
\int_{\mathbb{R}} \hat{f}(\xi)\,\overline{\hat{g}(\xi)}\,d\xi
= \int_{\mathbb{R}} \hat{f}(\xi)\Big(\int_{\mathbb{R}} \overline{g(y)}\,e^{2\pi i \xi y}\,dy\Big)d\xi. \tag{2}
$$

**交换积分次序**。由 [[fubini-tonelli|Fubini 定理]]（绝对可积），
$$
\iint_{\mathbb{R}^2} \bigl|\hat{f}(\xi)\,\overline{g(y)}\,e^{2\pi i \xi y}\bigr|\,dy\,d\xi
= \|\hat{f}\|_{L^1}\|g\|_{L^1} < \infty,
$$
其中 $\hat{f}, g \in \mathcal{S} \subset L^1$（Schwartz 类对 Fourier 变换封闭，Theorem 1.3；与 $g \in \mathcal{S} \subset L^1$）。交换后得
$$
\int_{\mathbb{R}} \overline{g(y)}\Big(\int_{\mathbb{R}} \hat{f}(\xi)\,e^{2\pi i \xi y}\,d\xi\Big)dy.
$$

**内层积分即 $f(y)$**：由 [[fourier-inversion|Fourier 反演定理]]（Stein Theorem 1.9，$f \in \mathcal{S}$ 时适用），
$$
f(y) = \int_{\mathbb{R}} \hat{f}(\xi)\,e^{2\pi i y \xi}\,d\xi, \qquad y \in \mathbb{R}.
$$

代回：
$$
\int_{\mathbb{R}} \hat{f}(\xi)\,\overline{\hat{g}(\xi)}\,d\xi
= \int_{\mathbb{R}} \overline{g(y)}\,f(y)\,dy
= \int_{\mathbb{R}} f(y)\,\overline{g(y)}\,dy,
$$
即式 (1)。$\blacksquare$

**Claim 2**（Plancherel 定理，Stein Theorem 1.12）. 设 $f \in \mathcal{S}(\mathbb{R})$，则
$$
\int_{\mathbb{R}} |\hat{f}(x)|^2\,dx = \int_{\mathbb{R}} |f(x)|^2\,dx.
$$

*证明.* 这是 Claim 1 取 $g = f$ 的特例：
$$
\|f\|_2^2 = \int f(x)\overline{f(x)}\,dx = \int \hat{f}(\xi)\overline{\hat{f}(\xi)}\,d\xi = \|\hat{f}\|_2^2.
$$
$\blacksquare$

**推论**（乘法公式，Stein Proposition 1.8）. 设 $f, g \in \mathcal{S}(\mathbb{R})$，则
$$
\int_{\mathbb{R}} f(x)\,\overline{\hat{g}(x)}\,dx = \int_{\mathbb{R}} \hat{f}(x)\,\overline{g(x)}\,dx. \tag{3}
$$

*证明.* 由 [[schwartz-space|$\mathcal{S}$ 封闭性]]（Theorem 1.3）知 $\hat{g} \in \mathcal{S}$，故可在 Claim 1 中以 $\hat{g}$ 替换 $g$：
$$
\int f(x)\overline{\hat{g}(x)}\,dx = \int \hat{f}(\xi)\overline{\widehat{\hat{g}}(\xi)}\,d\xi.
$$
由 Fourier 反演 $\widehat{\hat{g}}(\xi) = g(-\xi)$，故右端 $= \int \hat{f}(\xi)\overline{g(-\xi)}\,d\xi$。反射变量替换 $\eta = -\xi$（实轴上积分保测）给出右端 $= \int \hat{f}(-\eta)\overline{g(\eta)}\,d\eta = \int \hat{f}(\xi)\overline{g(\xi)}\,d\xi$（因 $g$ 是积分变量，下标 $\eta, \xi$ 等价）。$\blacksquare$

> **依赖关系小结**：本证明依次调用 (i) [[fourier-inversion|Fourier 反演]]（Theorem 1.9），(ii) [[schwartz-space|$\mathcal{S}$ 封闭性]]（Theorem 1.3），(iii) [[fubini-tonelli|Fubini 定理]]。三者皆不依赖 Plancherel：Theorem 1.9 由 Gauss 磨光（Stein Theorem 1.6 ⇒ Cor 1.7）独立证；Theorem 1.3 是 Fourier 变换代数性质的基本结论；Fubini 是测度论基本工具。故主证明**无循环论证**。

## 其他证明

> 本区段按 docs/PROOFS.md §6.5 记录与主证明不同的第二证法；主证明（§「详细证明」）保持不变。

#### 证明二：自相关–卷积法（$\mathcal{S}$）+ Gauss 磨光 $L^2$ 延拓

**来源与录入**。定理陈述依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Theorem 1.12]]。本证法的 $\mathcal{S}$ 部分走「自相关–卷积 + 反演在原点取值」路线，未用主证明的乘法公式（Proposition 1.8），属标准教材技巧〔非书内证明，标准结果〕；$L^2$ 延拓部分用 Gauss 磨光 + 单调收敛，是 Stein 所述留待实分析卷的标准做法〔非书内证明，标准结果〕。录入日期：2026-08-13（修订：2026-08-14）。

**动机**。主证明的核心机制是 [[multiplication-formula-trick|乘法公式]] $\int f\bar g = \int \hat f\overline{\hat g}$ 与配对 $g = \hat f$。证明二换一个视角：把范数平方 $\|f\|_2^2$ 写成自相关卷积 $h = f * \tilde f$（其中 $\tilde f(x) = \overline{f(-x)}$）在原点之值，把 $\|\hat f\|_2^2$ 写成 $\hat h = |\hat f|^2$ 的 [[fourier-inversion|反演]] 积分在原点之值——两个范数恒等归结为同一次反演在 $x = 0$ 处取值，机制与乘法公式完全不同。核心困难在 $L^2$ 延拓：Fourier 变换尚未定义于一般 $L^2$ 函数。关键观察有二：(i) $\mathcal{S}$ 在 $L^2$ 稠密，等距恒等沿稠密子空间建立后可按 Cauchy 列完备化并定义 $L^2$ 意义下的 $\hat f$；(ii) Gauss 核 $K_\delta$ 的 Fourier 显式形式 $\hat K_\delta(\xi) = e^{-\pi\delta\xi^2}$ 给出 $L^2$ 收敛的单调控制——磨光后 $f * K_\delta$ 的范数恒等来自 $\mathcal{S}$ 部分，再取 $\delta \to 0$ 即完成延拓。

**证明思路**。

1. **$\mathcal{S}$ 情形——自相关**：对 $f \in \mathcal{S}$ 定义 $\tilde f(x) = \overline{f(-x)}$ 与 $h = f * \tilde f$；计算得 $h(0) = \|f\|_2^2$、$\widehat{\tilde f} = \overline{\hat f}$、$\hat h = |\hat f|^2$。
2. **反演取 0 点**：由 [[fourier-inversion|Fourier 反演]] 于 $x = 0$ 取值，$\|f\|_2^2 = h(0) = \int_{\mathbb R}\hat h = \|\hat f\|_2^2$。
3. **$L^2$ 延拓——密度与定义**：$\mathcal{S}$ 在 $L^2$ 稠密；对 $f \in L^2$ 取 $f_n \in \mathcal{S}$，由 $\mathcal{S}$ 情形知 $\{\hat f_n\}$ 是 $L^2$-Cauchy 列，定义 $\hat f = \lim_n \hat f_n$（良定义）。
4. **Gauss 磨光**：$f * K_\delta \to f$ 于 $L^2$；且 $\|f * K_\delta\|_2 = \|\hat f\,e^{-\pi\delta\xi^2}\|_2$（经 $f_n * K_\delta \in \mathcal{S}$ 过渡）。
5. **单调收敛**：$e^{-2\pi\delta\xi^2} \nearrow 1$（$\delta \searrow 0$），由 [[dominated-convergence|单调/控制收敛]] $\|\hat f\,e^{-\pi\delta\xi^2}\|_2 \to \|\hat f\|_2$，取极限得恒等。

**详细证明**。

**第一阶段：$\mathcal{S}$ 情形（自相关–卷积法）。**

**Claim 1**（反射共轭与自相关卷积）. 设 $f \in \mathcal{S}(\mathbb{R})$，定义 $\tilde f(x) = \overline{f(-x)}$，$h = f * \tilde f$。则 $\tilde f, h \in \mathcal{S}(\mathbb{R})$，$h(0) = \|f\|_2^2$，$\widehat{\tilde f}(\xi) = \overline{\hat f(\xi)}$，且 $\hat h(\xi) = |\hat f(\xi)|^2$。

*证明.* 反射与复共轭保持 [[schwartz-space|Schwartz 类]]（$\mathcal{S}$ 对反射、平移、复共轭等基本运算封闭，见 [[schwartz-space]] 性质节），故 $\tilde f \in \mathcal{S}$；由 $\mathcal{S}$ 对卷积的封闭性（Stein Proposition 1.11(i)），$h \in \mathcal{S}$。

关于原点取值，由卷积定义与 $\tilde f$ 的定义，
$$
h(0) = \int_{\mathbb R} f(y)\,\tilde f(-y)\,dy = \int_{\mathbb R} f(y)\,\overline{f(y)}\,dy = \|f\|_2^2.
$$

关于 $\tilde f$ 的 Fourier 变换，作变量替换 $u = -y$：
$$
\widehat{\tilde f}(\xi)
= \int_{\mathbb R}\overline{f(-y)}\,e^{-2\pi i\xi y}\,dy
= \int_{\mathbb R}\overline{f(u)}\,e^{2\pi i\xi u}\,du
= \overline{\int_{\mathbb R} f(u)\,e^{-2\pi i\xi u}\,du}
= \overline{\hat f(\xi)}.
$$

最后，由 [[fourier-transform|Fourier 变换]]的卷积定理（$\widehat{f*g} = \hat f\,\hat g$；Stein Proposition 1.11(iii)，$f, \tilde f \in \mathcal{S} \subset L^1$，该恒等式在 $\mathcal{S}$ 上由 Fubini 直接验证）：
$$
\hat h(\xi) = \hat f(\xi)\,\widehat{\tilde f}(\xi) = \hat f(\xi)\,\overline{\hat f(\xi)} = |\hat f(\xi)|^2. \qquad\blacksquare
$$

**Claim 2**（$\mathcal{S}$ 情形的 Plancherel）. 对 $f \in \mathcal{S}(\mathbb{R})$，$\|f\|_2 = \|\hat f\|_2$。

*证明.* 由 Claim 1，$h = f * \tilde f \in \mathcal{S}$。对 $h$ 应用 [[fourier-inversion|Fourier 反演公式]]（$h \in \mathcal{S}$，Stein Theorem 1.9）并在 $x = 0$ 处取值：
$$
\|f\|_2^2 = h(0) = \int_{\mathbb R}\hat h(\xi)\,e^{2\pi i\cdot 0\cdot\xi}\,d\xi = \int_{\mathbb R}|\hat f(\xi)|^2\,d\xi = \|\hat f\|_2^2.
$$
开方得 $\|f\|_2 = \|\hat f\|_2$。$\blacksquare$

**第二阶段：$L^2$ 延拓（Gauss 磨光 + 单调收敛）。**

**Claim 3**（密度与 $L^2$ 意义下的 Fourier 变换）. $\mathcal{S}(\mathbb{R})$ 在 $L^2(\mathbb{R})$ 中稠密（$C_c^\infty \subset \mathcal{S}$，而 $C_c^\infty$ 在 $L^2$ 中稠密，见 [[lp-space|$L^p$ 空间的稠密性]]）。对 $f \in L^2(\mathbb{R})$，取 $\mathcal{S} \ni f_n \to f$（于 $L^2$），则 $\{\hat f_n\}$ 是 $L^2$-Cauchy 列，其极限记为 $\hat f = \lim_n \hat f_n \in L^2$；该极限不依赖序列 $\{f_n\}$ 的选取。

*证明.* 对 $n, m \in \mathbb{N}$，由 Claim 2 应用于 $f_n - f_m \in \mathcal{S}$：
$$
\|\hat f_n - \hat f_m\|_2 = \|f_n - f_m\|_2 \to 0 \quad (n, m \to \infty),
$$
故 $\{\hat f_n\}$ 为 $L^2$-Cauchy 列；由 $L^2$ 的完备性（见 [[lp-space|$L^p$ 空间]] 性质），极限 $\hat f$ 存在。若 $\mathcal{S} \ni g_n \to f$ 为另一逼近序列，则 $f_n - g_n \in \mathcal{S}$ 且 $\|f_n - g_n\|_2 \to 0$，再次由 Claim 2 得 $\|\hat f_n - \hat g_n\|_2 \to 0$，故极限相同。$\blacksquare$

**Claim 4**（Gauss 磨光在 $L^2$ 中收敛）. 设 $K_\delta(x) = \delta^{-1/2}e^{-\pi x^2/\delta}$（$\delta > 0$），$f \in L^2(\mathbb{R})$。则 $\|f * K_\delta - f\|_2 \to 0$（$\delta \to 0$）。

*证明.* 先证卷积的 $L^2$ 压缩性：由 Minkowski 积分不等式与 $\int_{\mathbb R}|K_\delta| = 1$，
$$
\|f * K_\delta\|_2 = \Big\|\int_{\mathbb R}f(y)\,K_\delta(\cdot - y)\,dy\Big\|_2 \le \int_{\mathbb R}|K_\delta(y)|\,\|f(\cdot - y)\|_2\,dy = \|f\|_2,
$$
其中 $\|f(\cdot - y)\|_2 = \|f\|_2$（平移保范）。于是对任意 $g \in L^2$，$\|(f - g) * K_\delta\|_2 \le \|f - g\|_2$。

再取 $g \in C_c^\infty(\mathbb{R})$ 逼近 $f$：由 $C_c^\infty$ 在 $L^2$ 中稠密，对任意 $\varepsilon > 0$ 存在 $g$ 使 $\|f - g\|_2 < \varepsilon$。由三角不等式，
$$
\|f * K_\delta - f\|_2 \le \|(f - g) * K_\delta\|_2 + \|g * K_\delta - g\|_2 + \|g - f\|_2 \le \varepsilon + \|g * K_\delta - g\|_2 + \varepsilon.
$$

$g$ 一致连续且有界（$g \in C_c^\infty$），$\{K_\delta\}$ 是 [[good-kernel|好核族]]（Stein Theorem 1.6：Gauss 核，$\int K_\delta = 1$、$L^1$ 有界 $\int |K_\delta| \le M$、质量集中 $\int_{|x|>\eta}|K_\delta| \to 0$），故由 [[approx-by-good-kernel|好核逼近]]，$\sup_x|g * K_\delta(x) - g(x)| \to 0$；又 $g$ 与 $g * K_\delta$（$\delta$ 小时）的支集含于固定紧集，故 $\|g * K_\delta - g\|_2 \le \sqrt{|E|}\cdot\sup_x|g * K_\delta - g| \to 0$（$E$ 为支集并集，有限测度）。于是 $\limsup_{\delta\to 0}\|f * K_\delta - f\|_2 \le 2\varepsilon$，由 $\varepsilon$ 任意性得结论。$\blacksquare$

**Claim 5**（磨光恒等与单调收敛）. 保持上述记号。则对每个 $\delta > 0$，$\|f * K_\delta\|_2 = \|\hat f\, e^{-\pi\delta\xi^2}\|_2$，且 $\lim_{\delta\to 0}\|\hat f\,e^{-\pi\delta\xi^2}\|_2 = \|\hat f\|_2$。

*证明.* 固定 $\delta > 0$。由 Claim 3 中序列 $f_n \in \mathcal{S}$，有 $f_n * K_\delta \in \mathcal{S}$（[[schwartz-space|Schwartz 类]]对卷积封闭，Stein Proposition 1.11(i)），且由卷积定理（Proposition 1.11(iii)）与 $\hat K_\delta(\xi) = e^{-\pi\delta\xi^2}$（Stein Corollary 1.5，[[approx-by-good-kernel|Gauss 磨光]]的 Fourier 显式形式），
$$
\widehat{f_n * K_\delta}(\xi) = \hat f_n(\xi)\,e^{-\pi\delta\xi^2}.
$$

对 $f_n * K_\delta \in \mathcal{S}$ 应用 Claim 2：
$$
\|f_n * K_\delta\|_2 = \|\hat f_n\,e^{-\pi\delta\xi^2}\|_2.
$$

令 $n \to \infty$：左端，由 Claim 4 的压缩性与 $f_n \to f$ 于 $L^2$，有 $\|f_n * K_\delta - f * K_\delta\|_2 \le \|f_n - f\|_2 \to 0$，故 $\|f_n * K_\delta\|_2 \to \|f * K_\delta\|_2$；右端，由 $\hat f_n \to \hat f$ 于 $L^2$（Claim 3）$|e^{-\pi\delta\xi^2}| \le 1$，$\|\hat f_n e^{-\pi\delta\xi^2} - \hat f e^{-\pi\delta\xi^2}\|_2 \le \|\hat f_n - \hat f\|_2 \to 0$。取极限得 $\|f * K_\delta\|_2 = \|\hat f e^{-\pi\delta\xi^2}\|_2$。

关于 $\delta \to 0$：对每个 $\xi \in \mathbb{R}$，$e^{-2\pi\delta\xi^2} \nearrow 1$（$\delta \searrow 0$），故 $|\hat f(\xi)|^2e^{-2\pi\delta\xi^2} \nearrow |\hat f(\xi)|^2$。由 [[dominated-convergence|单调收敛定理]]（或控制收敛，控制函数 $|\hat f|^2 \in L^1$），
$$
\lim_{\delta\to 0}\int_{\mathbb R}|\hat f(\xi)|^2\,e^{-2\pi\delta\xi^2}\,d\xi = \int_{\mathbb R}|\hat f(\xi)|^2\,d\xi.
$$
由于 $\|\hat f e^{-\pi\delta\xi^2}\|_2^2 = \int_{\mathbb R}|\hat f|^2e^{-2\pi\delta\xi^2}d\xi$，开方得 $\lim_{\delta\to 0}\|\hat f e^{-\pi\delta\xi^2}\|_2 = \|\hat f\|_2$。$\blacksquare$

**结论**. 对 $f \in L^2(\mathbb{R})$，由 Claims 4、5 与范数的连续性，
$$
\|f\|_2 = \lim_{\delta\to 0}\|f * K_\delta\|_2 = \lim_{\delta\to 0}\|\hat f\,e^{-\pi\delta\xi^2}\|_2 = \|\hat f\|_2.
$$
故 Plancherel 恒等对一切 $f \in L^2$ 成立；限制到 $\mathcal{S}$ 即得叙述 1。$\blacksquare$

**与主证明的比较**. 主证明在 $\mathcal{S}$ 内用 [[multiplication-formula-trick|乘法公式]]一步到位，不做 $L^2$ 延拓；本证明的 $\mathcal{S}$ 部分改用自相关–卷积与反演取 0 点（机制不同），$L^2$ 部分显式给出磨光–单调收敛的延拓路径，并在过程中构造性地定义了 $L^2$ 意义下的 Fourier 变换（即 What-if 叙述 2 的构造版本）。两证法的 $\mathcal{S}$ 部分互相独立，均以 [[fourier-inversion|Fourier 反演]]（Theorem 1.9）为核心工具，且 [[fourier-inversion]] 的证明（见主证明）不依赖 Plancherel，故两证法均**无循环论证**。

## What-if — 反例、等价叙述与推广

### 等价叙述

#### 叙述 1（Stein 原始，$\mathcal{S}$ 形式）
> $f \in \mathcal{S}(\mathbb{R})$ ⇒ $\|f\|_{L^2} = \|\hat{f}\|_{L^2}$（Ch.5 Theorem 1.12）。

#### 叙述 2（$L^2$ 延拓）
> 设 $f \in L^2(\mathbb{R})$，存在 $L^2$ 序列 $f_n \in \mathcal{S}$ 使 $f_n \to f$。若 $\hat{f}_n$ 在 $L^2$ 中亦收敛到某 $\hat{f}$，则 $\|f\|_{L^2} = \|\hat{f}\|_{L^2}$。

#### 叙述 3（酉算子）
> $\mathcal{F}: L^2(\mathbb{R}) \to L^2(\mathbb{R})$ 是酉算子（unitary operator）——双射且保持内积。

#### 叙述 4（$\mathbb{R}^d$ 推广）
> $f \in \mathcal{S}(\mathbb{R}^d)$ ⇒ $\int_{\mathbb{R}^d} |\hat{f}(\xi)|^2 d\xi = \int_{\mathbb{R}^d} |f(x)|^2 dx$。

**等价关系**：叙述 1 ⇒ 叙述 2（连续延拓）；叙述 2 ⇒ 叙述 3（边界扩张唯一性）；叙述 3 ⇒ 叙述 4（积方法）。Stein Fourier 卷仅显式证叙述 1 与 4；叙述 2、3 属实分析卷（Stein & Shakarchi 第三卷）。

### 反例（条件不可削弱）

1. **$\mathcal{S}$ 条件可弱化但不能完全消除**：若 $f \in L^1 \cap L^2$，Plancherel 仍成立（先在 $\mathcal{S}$ 建立，再扩张）；但若 $f \notin L^2$（如 $f = $ 常数），$\|f\|_2 = \infty$ 无意义。
2. **$\hat{f} \in L^2$ 不可推出 $f \in L^2$ 一般而言**：取 $f(x) = (1 + |x|)^{-1/2}$ —— 在 $\mathbb{R}$ 上 $f \in L^2$ 是临界，但 $\hat{f}$ 含分布项。
3. **在 $L^1$ 中 Plancherel 失效**：$f \in L^1$ 时 $\hat{f}$ 一般**不在** $L^2$ 中（如 $f = \chi_{[-1,1]}$，$\hat{f}(\xi) = \sin(2\pi\xi)/(\pi\xi)$，其 $|f|^2 \sim |\operatorname{sinc}|^2$ 不在 $L^2$ 上可积——实际 $|\operatorname{sinc}(x)|^2 \sim 1/x^2$ 不在 $L^2$ 上面积分。详细验证：$\int |\hat{f}(\xi)|^2 d\xi = \infty$，与 $\int |f|^2 = 2$ 不等）。

### 推广 / 变体

- **$L^2$ 反演**：$\mathcal{F}^2 f = f(-\cdot)$（在 $L^2$ 上）；$\mathcal{F}^4 = I$。
- **Parseval 推广**：乘积公式 $\langle f, g \rangle_{L^2} = \langle \hat{f}, \hat{g} \rangle_{L^2}$（$f, g \in \mathcal{S}$，极化得）。
- **物理诠释**：保持「能量」（$\|f\|_2^2$ 是概率论中的 $L^2$ 范数平方）。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（Stein 原始）| [[fourier-inversion|Fourier 反演]] + [[fubini-tonelli|Fubini 交换]]（Claim 1 取 $g=f$） | **低至中** | 仅需 Schwartz 框架，回避测度论 |
| 叙述 2（$L^2$ 延拓）| 等距扩张 + 完备性 | **高** | 需测度论 |
| 叙述 3（酉算子）| Cauchy 列完备化 | **高** | 同上 |
| 叙述 4（$\mathbb{R}^d$）| 单变量情形迭代 + Fubini | **中至高** | 多元 Fubini 需测度论 |
| 证明二（叙述 1 与 2）| 自相关–卷积（$\mathcal{S}$）+ Gauss 磨光 $L^2$ 延拓 | **中至高** | 需卷积定理、$L^2$ 完备性与单调收敛；构造性定义 $\hat f$ |

## 应用

- **量子力学**：归一化波函数 $\psi \in L^2(\mathbb{R})$，$\hat{\psi}$ 是动量空间波函数。Plancherel 保证两个表示的能量相同。
- **信号处理**：Parseval/Plancherel 是 DFT/FFT 的能量守恒基础。
- **Hilbert 空间算子理论**：Fourier 变换作为酉算子是其应用核心。
- **不确定性原理**（[[heisenberg-uncertainty-principle|Heisenberg]]）：证明需 Plancherel 在 $L^2$ 上的延拓。

## 关联

- 定理：[[parseval-identity]]（圆群版本）、[[fourier-inversion]]（$\mathcal{S}$ 上的反演）、[[poisson-summation-formula]]（用 Plancherel 可证）
- 概念：[[schwartz-space|$\mathcal{S}(\mathbb{R})$]]、[[lp-space|$L^2(\mathbb{R})$]]、[[ellp-space|$\ell^2(\mathbb{Z})$]]、[[character|特征标]]、[[good-kernel]]
- 引理：[[cauchy-schwarz-inequality]]（核心工具）、[[fubini-tonelli|Fubini 定理]]（乘法公式证明核心）、[[multiplication-formula-trick]]（核心步骤）、[[dominated-convergence|单调/控制收敛]]（$L^2$ 延拓核心）
- 方法：[[approx-by-good-kernel|Gauss 磨光（好核逼近特例）]]（$L^2$ 延拓预备）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5, Theorem 1.12）

### 此证明新引入 / 补充的 method

- **乘法公式技巧**（[[multiplication-formula-trick]]）：Plancherel 证明的核心——Schwartz 框架下直接避开测度论。
- **Gauss 磨光**（[[approx-by-good-kernel|Gauss 磨光（好核逼近特例）]]）：将 Schwartz 类结果延拓至 $L^2$ 的预备工具。

## Stein 写法备注

Plancherel 定理在 Stein 框架下的证明路径：直接由 [[fourier-inversion|Fourier 反演]]（Theorem 1.9）+ [[fubini-tonelli|Fubini 交换]]推导 $\int \hat f \overline{\hat g} = \int f \bar g$，取 $g = f$ 即得 $\|f\|_2 = \|\hat f\|_2$。**整个 $\mathcal{S}$ 论证完全避开 Lebesgue 测度论的完备化讨论**，是 Stein Fourier 卷「最小依赖路径」的典范。

Stein 在 Ch. 5 的命题链为：
$$
\text{Thm 1.6（好核族）} \Rightarrow \text{Cor 1.7（磨光）} \Rightarrow \text{Thm 1.9（反演）} \Rightarrow \text{Thm 1.12（Plancherel）} \Rightarrow \text{Prop 1.8（乘法公式）}
$$
即 Plancherel 直接由反演 + Fubini 推出，Proposition 1.8（[[multiplication-formula-trick|乘法公式]]）则作为 Plancherel 的推论（用 $\hat g \in \mathcal{S}$ 替换 $g$，再配合 Fourier 反演 $\widehat{\hat g} = g(-\cdot)$）。

主证明严格遵守此链；证明二（自相关–卷积法）独立以反演定理为核心，机制与主证明不同但同样**不依赖** Plancherel。