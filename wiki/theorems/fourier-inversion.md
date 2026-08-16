---
type: theorem
title: Fourier 反演定理
aliases: [Fourier inversion formula, Fourier inversion theorem]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, schwartz]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f \in \mathcal{S}(\mathbb{R})$（较强——要求 Schwartz 速降光滑）；结论：$f(x) = \int \hat{f}(\xi) e^{2\pi i x \xi} d\xi$（强——精确恒等，恢复原函数）。 Stein 仅在 Schwartz 类证；推广到 $L^2$ 由 Plancherel 自然得到。是 Fourier 变换成为自同构而非单边算子的关键。
---

# Fourier 反演定理

> **工作空间**：实直线 $\mathbb{R}$。Stein 在 Ch. 5, Theorem 1.9 给出 $\mathcal{S}$ 形式；$\mathbb{R}^d$ 推广见 Ch. 6, Theorem 2.4。

## What — 陈述

> 设 $f \in$ [[schwartz-space|Schwartz 空间]] $\mathcal{S}(\mathbb{R})$（Schwartz 空间），则
> $$
> f(x) = \int_{\mathbb{R}} \hat{f}(\xi)\, e^{2\pi i x \xi}\, d\xi, \qquad x \in \mathbb{R}.
> $$
> 即 Schwartz 函数的 Fourier 变换**可逆**，且逆变换的核恰为共轭指数 $e^{2\pi i x \xi}$（Stein 约定）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Theorem 1.9]]。

## Why — 动机与证明

### 动机

Fourier 变换的逆问题是 Fourier 分析的基本问题：给定 $\hat{f}$，能否恢复 $f$？在 Schwartz 类上答案是精确等式。Stein 选择 Schwartz 框架是为绕过 [[lp-space|$L^1$]]（逆问题因 $\hat{f} \notin L^1$ 一般不可行）与测度论完备化（[[lp-space|$L^2$]] 延拓所需）。

### 证明思路

Stein 的证明思路极为巧妙，**完全在 Schwartz 框架内**，且**严格不依赖反演公式本身**：

1. **第一步（Theorem 1.4）**：用 ODE 方法直接验证 Gauss 函数 Fourier 变换的恒等点 $\widehat{e^{-\pi x^2}}(\xi) = e^{-\pi \xi^2}$（等价于 Gauss 函数 Fourier 反演——但对 Gauss 而言可由 ODE 独立证）。
2. **第二步（Corollary 1.5）**：用 Proposition 1.2 的缩放性质 + Theorem 1.4 得 $\widehat{K_\delta}(\xi) = e^{-\pi\delta\xi^2}$（$K_\delta$ 是 Gauss 缩放）。
3. **第三步（Theorem 1.6 + Corollary 1.7）**：验证 $\{K_\delta\}$ 是好核族，故 $f * K_\delta \to f$ 一致。
4. **第四步**：对**已知** $K_\delta$ 的反演恒等式（由 Theorem 1.4 + 缩放直接给出，无需 Theorem 1.9）展开 $f * K_\delta$，交换积分次序，再用极限。

### 详细证明

**预备：Gauss 自伴引理**。

**Claim 1**（Gauss 函数 Fourier 变换的恒等点，Stein Theorem 1.4）. 设 $f(x) = e^{-\pi x^2}$（Gauss 函数，Stein 约定）。则 $\hat{f}(\xi) = e^{-\pi \xi^2} = f(\xi)$。

*证明.*由 [[fourier-transform|Fourier 变换]]定义, 设 $h(\xi) = \hat{f}(\xi) = \int_{\mathbb R} e^{-\pi x^2}\,e^{-2\pi i x\xi}\,dx$。对 $\xi$ 求导（在积分号下微分合法, 由 $|\partial_\xi e^{-\pi x^2} e^{-2\pi i x\xi}| = |2\pi i x| e^{-\pi x^2} \in L^1_x$ 对每个 $\xi$ 局部成立）:
$$
h'(\xi) = \int_{\mathbb R} e^{-\pi x^2}\,(-2\pi i x)\,e^{-2\pi i x\xi}\,dx = -2\pi i \int_{\mathbb R} x e^{-\pi x^2}\,e^{-2\pi i x\xi}\,dx.
$$
注意 $x e^{-\pi x^2} = -\frac{1}{2\pi}\frac{d}{dx}e^{-\pi x^2} = -\frac{1}{2\pi} f'(x)$, 故
$$
h'(\xi) = -2\pi i \cdot \left(-\frac{1}{2\pi}\right) \int_{\mathbb R} f'(x)\,e^{-2\pi i x\xi}\,dx = i\,\widehat{f'}(\xi).
$$
由 [[fourier-transform|Fourier 变换]]的微分性质（Proposition 1.2 推论）：$\widehat{f'}(\xi) = 2\pi i \xi \hat{f}(\xi) = 2\pi i \xi h(\xi)$。代入:
$$
h'(\xi) = i \cdot 2\pi i \xi h(\xi) = -2\pi \xi h(\xi).
$$
故 $h$ 满足常微分方程 $h'(\xi) = -2\pi \xi h(\xi)$, 一般解为 $h(\xi) = C e^{-\pi \xi^2}$。由初值 $h(0) = \int_{\mathbb R} e^{-\pi x^2}\,dx = 1$（Gauss 积分, Stein Proposition 1.2 推论; 此式独立于 Theorem 1.9, 因 $\int e^{-\pi x^2}dx = 1$ 是基本积分）得 $C = 1$。

故 $\hat{f}(\xi) = e^{-\pi\xi^2} = f(\xi)$。$\blacksquare$

> **注**: Theorem 1.4 给出的 $\widehat{e^{-\pi x^2}} = e^{-\pi\xi^2}$ **等价于** Gauss 函数的 Fourier 反演 $e^{-\pi x^2} = \int e^{-\pi\xi^2} e^{2\pi i x\xi} d\xi$（两边对 $\xi$ Fourier 变换等价），属于"已知显式函数的反演", 不构成对一般 $\mathcal S$ 函数反演公式的循环。

**主证明**（对 $f \in \mathcal{S}$）：

**第一阶段**: Gauss 磨光族构造. 由 Theorem 1.4 + Proposition 1.2(iii) 缩放性质（Corollary 1.5）, 对 $\delta > 0$ 定义 $K_\delta(x) = \delta^{-1/2} e^{-\pi x^2/\delta}$, 得
$$
\widehat{K_\delta}(\xi) = e^{-\pi\delta\xi^2}. \tag{*}
$$
由 [[good-kernel|好核性质]]（Theorem 1.6, 通过直接计算三条件验证: $\int K_\delta = 1$, $\int |K_\delta| = 1$, $\int_{|x|>\eta} |K_\delta| \to 0$）, $\{K_\delta\}_{\delta > 0}$ 是好核族; 由 Corollary 1.7, 对 $f \in \mathcal{S}$ 有 $g_\delta := f * K_\delta \to f$ 一致（$\delta \to 0$）。

**第二阶段**: $K_\delta$ 的 Fourier 反演（独立于 Theorem 1.9）. 由 Theorem 1.4 + 缩放, 对**显式 $K_\delta$ 函数**有
$$
K_\delta(x) = \int_{\mathbb R} e^{-\pi\delta\xi^2}\, e^{2\pi i x\xi}\, d\xi \qquad (x \in \mathbb R). \tag{**}
$$
此式是定理 1.4（Gauss 自伴, $\delta = 1$）+ Proposition 1.2(iii) 缩放 + Proposition 1.2(ii) 反射的复合, 对**显式 $K_\delta$ 函数**独立成立, 不需对一般 $\mathcal S$ 函数的 Fourier 反演公式。**这是反循环的关键**: Theorem 1.4 证明的 Gauss 自伴与一般 $\mathcal S$ 反演是**不同的命题**——前者是 ODE 验证的特例, 后者是 $\mathcal S$ 上的全局定理。

**第三阶段**: 展开 $g_\delta = f * K_\delta$ 并交换积分次序. 由卷积定义与 ($**$):
$$
g_\delta(x) = \int_{\mathbb R} f(y) K_\delta(x - y)\, dy
= \int_{\mathbb R} f(y) \Big(\int_{\mathbb R} e^{-\pi\delta\xi^2}\, e^{2\pi i (x-y)\xi}\, d\xi\Big) dy.
$$
交换积分次序（由 [[fubini-tonelli|Fubini 定理]]保证：$|f(y)|e^{-\pi\delta\xi^2}$ 在 $\mathbb R^2$ 上绝对可积, 因 $f \in \mathcal S \subset L^1$, $e^{-\pi\delta\xi^2} \in L^1$）:
$$
g_\delta(x) = \int_{\mathbb R} e^{-\pi\delta\xi^2}\, e^{2\pi i x\xi} \Big(\int_{\mathbb R} f(y) e^{-2\pi i y\xi}\, dy\Big) d\xi
= \int_{\mathbb R} e^{-\pi\delta\xi^2}\, e^{2\pi i x\xi}\, \hat f(\xi)\, d\xi. \tag{***}
$$

这里内层积分 $\int f(y) e^{-2\pi i y\xi} dy$ 正是 **$\hat f(\xi)$ 的 Fourier 变换定义**, 不依赖反演。

**第四阶段**: 取 $\delta \to 0$. 由 $g_\delta \to f$ 一致（第一阶段）, 我们只需证
$$
\lim_{\delta \to 0} \int_{\mathbb R} \hat f(\xi)\, e^{-\pi\delta\xi^2}\, e^{2\pi i x\xi}\, d\xi = \int_{\mathbb R} \hat f(\xi)\, e^{2\pi i x\xi}\, d\xi.
$$

**Claim 2**（极限控制）. 由 $f \in \mathcal S$ 的速降性, $\hat f \in \mathcal S \subset L^1$（$\mathcal S$ 对 Fourier 变换封闭 + Schwartz 函数可积）, 故 $\int |\hat f(\xi)|\, d\xi < \infty$。对每个 $\delta > 0$,
$$
\Big|\hat f(\xi)\, e^{-\pi\delta\xi^2}\Big| \le |\hat f(\xi)| \quad \text{且} \quad \hat f(\xi)\, e^{-\pi\delta\xi^2} \to \hat f(\xi) \quad (\delta \to 0).
$$
由 [[dominated-convergence|控制收敛定理]]（控制函数 $|\hat f(\xi)| \in L^1$）, 积分收敛到 $\int \hat f(\xi) e^{2\pi i x\xi} d\xi$。

**结论**. 由 $g_\delta(x) \to f(x)$（第一阶段）与 $g_\delta(x) \to \int \hat f(\xi) e^{2\pi i x\xi} d\xi$（第四阶段）,
$$
f(x) = \lim_{\delta \to 0} g_\delta(x) = \int_{\mathbb R} \hat f(\xi)\, e^{2\pi i x\xi}\, d\xi. \qquad\blacksquare
$$

> **依赖关系小结**: 本证明严格依 Stein 命题链 `Thm 1.4 (Gauss 自伴, ODE 证) ⇒ Prop 1.2 (缩放/反射) ⇒ Cor 1.5 ($\hat K_\delta$) ⇒ Thm 1.6 (好核三条件) ⇒ Cor 1.7 (磨光一致) ⇒ Thm 1.9 (Fourier 反演)`, 每步仅依赖前几步, 不调用 Theorem 1.9 自身。第二阶段的关键 ($**$) 是 **Theorem 1.4 对 $K_\delta$ 的特例**（ODE 已证 Gauss 自伴, 缩放直接给出 $K_\delta$ 自伴等价式）, 不构成对一般 $\mathcal S$ 函数反演的循环。第三阶段的内层积分是 **Fourier 变换定义**（非反演）, 不构成循环。

## 其他证明

> 本区段按 docs/PROOFS.md §6.5 记录与主证明不同的第二证法;主证明(§「详细证明」)保持不变。

#### 证明二:Poisson 核(Abel 求和)法

**来源与录入**。定理陈述依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 5, Theorem 1.9]]。本证法为经典 Poisson 核(Abel 求和)法,所用 Poisson 核与 Abel 因子 $e^{-2\pi t|\xi|}$ 为标准对象(Stein 亦于 Ch. 5 §2 半平面 Dirichlet 问题使用该核),但反演公式的该证法路线非 Stein 书内证明,属标准教材证法〔非书内证明,标准结果〕。录入日期:2026-08-13。

**动机**。主证明用 Gauss 核 $K_\delta$ 磨光,在频域乘以软化因子 $e^{-\pi\delta\xi^2}$(二次衰减)。本证明改用 Poisson 核 $P_t(y) = \frac{1}{\pi}\frac{t}{t^2 + y^2}$,其 Fourier 变换恰为 Abel 因子 $e^{-2\pi t|\xi|}$——频域软化因子由二次衰减换成指数衰减,把(可能仅条件收敛的)反演积分变成绝对可积,再令 $t \to 0$ 取回原积分。核心困难有二:其一,$P_t$ 不在 [[schwartz-space|Schwartz 类]](仅 $O(y^{-2})$ 衰减),不能直接套用 $\mathcal{S}$ 上的卷积定理与反演公式;其二,须证明卷积 $f * P_t$ 的 Fourier 表示。关键观察:$e^{-2\pi t|\xi|}$ 的逆 Fourier 变换可由两个单向指数积分**直接算出**且恰等于 $P_t$,于是 $f * P_t$ 的 Fourier 表示只需交换积分次序即得,完全避开 $L^1$ 反演定理。

**证明思路**。

1. **好核族**:验证 $\{P_t\}_{t>0}$ 是 $\mathbb{R}$ 上的好核族(单位质量、$L^1$ 有界、质量集中),故对 $f \in \mathcal{S}$ 有 $f * P_t \to f$ 一致。
2. **Fourier 变换**:计算 $\widehat{P_t}(\xi) = e^{-2\pi t|\xi|}$([[contour-integration|围道积分]] / [[residue-theorem|留数定理]]);逆方向 $P_t(x) = \int_{\mathbb R} e^{-2\pi t|\xi|}e^{2\pi i x\xi}d\xi$ 由单向指数积分直接算出。
3. **卷积的 Fourier 表示**:交换积分次序得 $f * P_t(x_0) = \int \hat f(\xi)\,e^{-2\pi t|\xi|}e^{2\pi i x_0\xi}d\xi$。
4. **Abel 极限**:$t \to 0$ 时左端 $\to f(x_0)$(好核逼近),右端由 [[dominated-convergence|控制收敛定理]] 趋于反演积分。

**详细证明**。

**Claim 1**(Poisson 核是好核族). 对 $t > 0$ 定义 $P_t(y) = \frac{1}{\pi}\frac{t}{t^2 + y^2}$($y \in \mathbb{R}$)。则 $\{P_t\}_{t>0}$ 是 $\mathbb{R}$ 上的好核族;特别地,对 $f \in \mathcal{S}(\mathbb{R})$,$f * P_t \to f$ 一致收敛($t \to 0$)。

*证明.* 逐条验证三条件。(i) 单位质量:由 $\arctan$ 的导数公式,
$$\int_{\mathbb{R}} P_t(y)\,dy = \frac{1}{\pi}\arctan\frac{y}{t}\,\Big|_{-\infty}^{\infty} = \frac{1}{\pi}\cdot\pi = 1.$$
(ii) $L^1$ 有界:$P_t \ge 0$,故 $\int_{\mathbb R}|P_t| = 1$。(iii) 质量集中:对 $\eta > 0$,当 $|y| \ge \eta$ 时 $t^2 + y^2 \ge y^2$,故
$$\int_{|y|\ge\eta} P_t(y)\,dy \le \frac{t}{\pi}\int_{|y|\ge\eta}\frac{dy}{y^2} = \frac{2t}{\pi\eta} \to 0 \quad (t \to 0).$$
由 [[good-kernel|好核]] 的 $\mathbb{R}^d$ 形式(叙述 2)与 [[approx-by-good-kernel|好核逼近]] 定理,对一致连续有界函数(如 $f \in \mathcal{S}$)有 $f * P_t \to f$ 一致收敛。$\blacksquare$

**Claim 2**(Poisson 核的 Fourier 变换). 对 $t > 0$ 与 $\xi \in \mathbb{R}$,
$$\widehat{P_t}(\xi) = e^{-2\pi t|\xi|}.$$

*证明.* 固定 $\xi > 0$。由定义 $\widehat{P_t}(\xi) = \frac{1}{\pi}\int_{\mathbb R}\frac{t}{t^2+y^2}e^{-2\pi i\xi y}dy$。记 $g(z) = \frac{t\,e^{-2\pi i\xi z}}{z^2 + t^2}$,其奇点为 $z = \pm it$。取围道 $\Gamma_R$ 为实轴线段 $[-R, R]$ 与下半平面半圆之并(取顺时针方向);$g$ 在下半平面的唯一奇点 $z = -it$ 为一阶极点,留数为
$$\operatorname{Res}(g, -it) = \lim_{z\to -it}(z + it)\,g(z) = \frac{t\,e^{-2\pi i\xi(-it)}}{-2it} = \frac{e^{-2\pi t\xi}}{-2i}.$$
由 [[residue-theorem|留数定理]](顺时针围道取负号),
$$\int_{\Gamma_R} g(z)\,dz = -2\pi i \cdot \operatorname{Res}(g, -it) = \pi e^{-2\pi t\xi}.$$
令 $R \to \infty$:在半圆 $z = Re^{i\theta}$($\theta \in (\pi, 2\pi)$)上,$|e^{-2\pi i\xi z}| = e^{2\pi\xi\,\text{Im}\,z} \le 1$,且 $|g(z)| \le \frac{t}{|z|^2 - t^2} = \frac{t}{R^2 - t^2}$;半圆积分的模不超过弧长 $\pi R$ 乘以上界,趋于零。故
$$\int_{\mathbb R}\frac{t}{t^2 + y^2}e^{-2\pi i\xi y}\,dy = \pi e^{-2\pi t\xi},$$
即 $\widehat{P_t}(\xi) = e^{-2\pi t|\xi|}$。对 $\xi < 0$,改取上半平面围道,极点 $z = it$ 处留数为 $\frac{e^{2\pi t\xi}}{2i}$,逆时针积分给出 $\pi e^{2\pi t\xi} = \pi e^{-2\pi t|\xi|}$,结论相同;$\xi = 0$ 时由单位质量即得 $\widehat{P_t}(0) = 1$。$\blacksquare$

**Claim 3**(卷积的 Fourier 表示). 设 $f \in \mathcal{S}(\mathbb{R})$,$t > 0$,$x_0 \in \mathbb{R}$。则
$$(f * P_t)(x_0) = \int_{\mathbb{R}} \hat f(\xi)\,e^{-2\pi t|\xi|}\,e^{2\pi i x_0\xi}\,d\xi.$$

*证明.* 第一步,直接计算逆方向。把积分在 $\xi = 0$ 处分开,
$$\int_{\mathbb{R}} e^{-2\pi t|\xi|}e^{2\pi i x\xi}\,d\xi = \int_0^\infty e^{-(2\pi t - 2\pi i x)\xi}\,d\xi + \int_{-\infty}^0 e^{(2\pi t + 2\pi i x)\xi}\,d\xi.$$
右端两项的指数参数实部均为 $2\pi t > 0$,故为收敛的(绝对可积的)广义积分;对第二项作替换 $\xi \mapsto -\xi$ 后求值:
$$\frac{1}{2\pi(t - ix)} + \frac{1}{2\pi(t + ix)} = \frac{1}{\pi}\frac{t}{t^2 + x^2} = P_t(x).$$
第二步,代入卷积并交换积分。由卷积定义与第一步,
$$(f * P_t)(x_0) = \int_{\mathbb R} f(y)\,P_t(x_0 - y)\,dy = \int_{\mathbb R} f(y)\Big(\int_{\mathbb R} e^{-2\pi t|\xi|}e^{2\pi i(x_0 - y)\xi}\,d\xi\Big)dy.$$
交换积分次序由 [[fubini-tonelli|Fubini 定理]] 保证:被积函数绝对可积,因为
$$\iint_{\mathbb R^2}|f(y)|\,e^{-2\pi t|\xi|}\,dy\,d\xi = \|f\|_1 \cdot \frac{1}{\pi t} < \infty$$
($t > 0$ 固定,$f \in \mathcal{S} \subset L^1$,$\int_{\mathbb R}e^{-2\pi t|\xi|}d\xi = \frac{1}{\pi t}$)。交换后内层积分为 $\int_{\mathbb R}f(y)e^{-2\pi iy\xi}dy = \hat f(\xi)$(由 [[fourier-transform|Fourier 变换]] 定义),故
$$(f * P_t)(x_0) = \int_{\mathbb R} \hat f(\xi)\,e^{-2\pi t|\xi|}\,e^{2\pi ix_0\xi}\,d\xi. \qquad\blacksquare$$

**Claim 4**(Abel 极限). 对 $f \in \mathcal{S}(\mathbb{R})$ 与 $x_0 \in \mathbb{R}$,
$$\lim_{t\to 0}\int_{\mathbb R}\hat f(\xi)\,e^{-2\pi t|\xi|}\,e^{2\pi ix_0\xi}\,d\xi = \int_{\mathbb R}\hat f(\xi)\,e^{2\pi ix_0\xi}\,d\xi.$$

*证明.* 由 [[schwartz-space|Schwartz 类的 Fourier 封闭性]],$\hat f \in \mathcal{S} \subset L^1(\mathbb{R})$。当 $t \to 0$ 时,被积函数 $\hat f(\xi)e^{-2\pi t|\xi|}e^{2\pi ix_0\xi}$ 逐点收敛到 $\hat f(\xi)e^{2\pi ix_0\xi}$,且 $|e^{-2\pi t|\xi|}| \le 1$,故其模长被可积函数 $|\hat f(\xi)|$ 控制。由 [[dominated-convergence|控制收敛定理]],积分收敛。$\blacksquare$

**结论**。综合 Claims 1、3、4,对任意 $x_0 \in \mathbb{R}$,
$$f(x_0) = \lim_{t\to 0}(f * P_t)(x_0) = \lim_{t\to 0}\int_{\mathbb R}\hat f(\xi)\,e^{-2\pi t|\xi|}e^{2\pi ix_0\xi}\,d\xi = \int_{\mathbb R}\hat f(\xi)\,e^{2\pi ix_0\xi}\,d\xi.$$
此即反演公式。$\blacksquare$

**与主证明的比较**。主证明用 Gauss 核在 $\mathcal{S}$ 内完成磨光–反演–极限,全程不依赖 Lebesgue 测度论;本证明改用 Poisson 核与交换积分次序,额外使用一个标准积分(围道/指数积分)与 DCT。两者在 $\mathcal{S}$ 上互相独立,均不构成循环依赖;主证明的 Gauss 路径亦被 [[approx-by-good-kernel|Gauss 磨光]] 用于其他定理,本证明的 Abel 因子视角则与半平面调和方程(Stein Ch. 5 §2)共享同一核。

#### 证明三:复分析(围道积分)法

**来源与录入**。本证法为 Stein《Complex Analysis》(Book II)书内证明([[steinComplexAnalysis|Stein & Shakarchi (2003), Ch. 4, Theorem 2.2, p.134-137]]),与主证明、证明二(Book I 路线)相互独立;录入日期:2026-08-13;书内证明,不标「非书内」。

**工作空间声明**。本证明的工作空间**不同于**主证明的 [[schwartz-space|Schwartz 空间]] $\mathcal{S}(\mathbb{R})$：它在 Book II 定义的函数类
$$
\mathscr{F}_a = \big\{f : f \text{ 在条带 } S_a = \{z \in \mathbb{C} : |\operatorname{Im} z| < a\} \text{ 上全纯, 且 } |f(x+iy)| \le \frac{A}{1+x^2},\ \forall x \in \mathbb{R},\ |y| < a\big\}
$$
上成立($A > 0$ 为常数)。这是比 $\mathcal{S}$ **解析条件更强**(要求延拓到水平条带 $S_a$)、但**衰减更弱**(仅 $O(x^{-2})$ 而非速降)的一类函数。Fourier 变换仍取 Stein 约定 $\hat{f}(\xi) = \int_{\mathbb{R}} f(x)\,e^{-2\pi i x\xi}\,dx$(实直线 $\mathbb{R}$ 情形,非圆群)。

**动机**。Book II 在 p.133 为其三个证明(Theorem 2.1 的指数衰减、Theorem 2.2 的 Fourier 反演、Theorem 2.4 的 Poisson 求和)写下纲领句:

> The idea behind all three proofs is the same: contour integration. Thus the approach used will be different from that of the corresponding results in Book I.

意为:「这三个证明的思想都是一样的:围道积分。因此所用的途径将不同于 Book I 中相应结果的处理。」Book I(即 [[steinFourierAnalysisIntroduction2003a|Fourier Analysis 卷]])以[[good-kernel|好核]]磨光(证明一)或 Poisson 核 Abel 求和(证明二)在 Schwartz 框架内证反演;Book II 则把 Fourier 反演从「好核逼近」的路径替换为**解析延拓 + 围道平移**的路径:对 $f \in \mathscr{F}_a$,由 Ch.4 Theorem 2.1,$\hat f$ 指数衰减,半直线积分绝对收敛;而 $e^{-2\pi i z\xi}$ 在 $\operatorname{Im} z \ne 0$ 时的指数行为(p.132)使积分围道可在条带 $S_a$ 内上下平移。核心困难有二:其一,把频域半直线积分改写为 $\zeta$ 平面上对 $f(\zeta)/(\zeta-x)$ 的围道积分,依赖 Lemma 2.3 的初等指数积分与 [[fubini-tonelli|Fubini]] 交换;其二,恢复 $f(x)$ 本身,交给 [[residue-theorem|留数定理]]。此证法同时印证 p.131 的主题:全纯延拓 ↔ Fourier 变换的快速衰减(反向刻画由 [[paley-wiener-theorem|Paley-Wiener 定理]] 完成)。

**证明思路**。

1. **拆分频域积分**:按 $\xi$ 的符号把反演积分拆为两项,分别处理。
2. **围道平移**:对 $\xi > 0$ 把 $\hat f$ 的定义围道从实轴下移到 $L_1 = \{u - ib : u \in \mathbb{R}\}$,对 $\xi < 0$ 上移到 $L_2 = \{u + ib : u \in \mathbb{R}\}$;利用 $e^{-2\pi i z \xi}$ 的指数行为与 Fubini 交换,把半直线积分化为 $\frac{1}{2\pi i}\int_{L_1}\frac{f(\zeta)}{\zeta-x}d\zeta$(及 $L_2$ 上的带号形式)。
3. **留数定理**:对包围 $x$ 的矩形围道 $\gamma_R$(顶点 $\pm R \pm ib$)用留数定理,得 $\frac{1}{2\pi i}\int_{\gamma_R}\frac{f(\zeta)}{\zeta-x}d\zeta = f(x)$。
4. **取极限**:$R \to \infty$ 时竖直边积分消失,水平边趋向 $L_1$、$L_2$,拼出反演公式。

**详细证明**。

**第一阶段:对 $\xi > 0$ 的半直线积分作围道平移**。反演积分 $\int_{\mathbb{R}}\hat f(\xi)e^{2\pi i x\xi}d\xi$ 绝对收敛——其依据为 Ch.4 Theorem 2.1 的指数衰减 $|\hat f(\xi)| \le Be^{-2\pi b|\xi|}$(证明见下 Claim 2,取 $0 < b < a$)。故可拆为
$$
\int_{\mathbb{R}}\hat{f}(\xi)e^{2\pi i x\xi}\,d\xi = \int_{-\infty}^{0}\hat{f}(\xi)e^{2\pi i x\xi}\,d\xi + \int_{0}^{\infty}\hat{f}(\xi)e^{2\pi i x\xi}\,d\xi. \tag{1}
$$

**Claim 1**(Lemma 2.3:衰减指数的积分). 设 $A > 0$,$B \in \mathbb{R}$。则
$$
\int_0^\infty e^{-(A+iB)\xi}\,d\xi = \frac{1}{A+iB}.
$$

*证明.* 因 $A > 0$,故 $|e^{-(A+iB)\xi}| = e^{-A\xi}$,广义积分收敛。由定义,
$$\int_0^\infty e^{-(A+iB)\xi}\,d\xi = \lim_{R\to\infty}\int_0^R e^{-(A+iB)\xi}\,d\xi,$$
而 $\xi \mapsto -\frac{e^{-(A+iB)\xi}}{A+iB}$ 是 $\xi \mapsto e^{-(A+iB)\xi}$ 的一个原函数,故
$$\int_0^R e^{-(A+iB)\xi}\,d\xi = \left[-\frac{e^{-(A+iB)\xi}}{A+iB}\right]_{0}^{R} = \frac{1 - e^{-(A+iB)R}}{A+iB}.$$
由 $|e^{-(A+iB)R}| = e^{-AR} \to 0$($R \to \infty$)得极限 $\frac{1}{A+iB}$。$\blacksquare$

**Claim 2**(带限移位:$\hat f$ 的水平线表示与指数衰减). 设 $f \in \mathscr{F}_a$,$0 \le b < a$。则对 $\xi > 0$ 有
$$
\hat{f}(\xi) = \int_{-\infty}^{\infty} f(u - ib)\,e^{-2\pi i (u-ib)\xi}\,du, \tag{2}
$$
对 $\xi < 0$ 有 $\hat{f}(\xi) = \int_{-\infty}^{\infty} f(u + ib)\,e^{-2\pi i (u+ib)\xi}\,du$。进而存在 $B > 0$ 使
$$
|\hat{f}(\xi)| \le B\,e^{-2\pi b|\xi|} \qquad (\xi \in \mathbb{R}). \tag{3}
$$

*证明.* 先证移位公式。固定 $\xi > 0$。函数 $z \mapsto f(z)e^{-2\pi i z\xi}$ 在 $S_a$ 内全纯:指数因子 $z \mapsto e^{-2\pi i z\xi}$ 为整函数,$f$ 在 $S_a$ 全纯([[holomorphic-function|全纯函数]]之积)。取以实轴线段 $[-R,R]$ 与 $L_1$ 上线段 $\{u - ib : -R \le u \le R\}$ 为水平边、两条竖直线段为竖直边的矩形围道;由 [[cauchy-theorem|Cauchy 定理]](Ch.2 Theorem 2.2 的矩形版本),该围道上的积分为零。在竖直边 $z = \pm R + iy$($y \in [-b, 0]$)上,$|f(z)| \le A/(1+R^2)$,且由 $y \le 0$、$\xi > 0$ 得 $|e^{-2\pi i z\xi}| = e^{2\pi \xi y} \le 1$,故每段竖直边积分之模不超过 $\frac{bA}{1+R^2} \to 0$($R \to \infty$)。这是[[contour-integration|围道平移]]的标准论证。取极限得
$$\int_{-\infty}^{\infty} f(u)\,e^{-2\pi i u\xi}\,du = \int_{-\infty}^{\infty} f(u - ib)\,e^{-2\pi i (u-ib)\xi}\,du,$$
左端恰为 $\hat f(\xi)$(Fourier 变换的定义),此即 (2)。$\xi < 0$ 时改取实轴与 $L_2$ 之间的矩形,竖直边估计中 $y \in [0,b]$、$\xi < 0$ 仍给出 $e^{2\pi \xi y} \le 1$,结论对称。

再证 (3)。对 $\xi > 0$,由 (2) 与 $\mathscr{F}_a$ 的衰减条件,
$$|\hat{f}(\xi)| \le \int_{-\infty}^{\infty}|f(u-ib)|\,|e^{-2\pi i (u-ib)\xi}|\,du = e^{-2\pi b\xi}\int_{-\infty}^{\infty}|f(u-ib)|\,du \le e^{-2\pi b\xi}\int_{-\infty}^{\infty}\frac{A}{1+u^2}\,du = \pi A\,e^{-2\pi b\xi}.$$
对 $\xi < 0$ 用 $+ib$ 的移位公式得 $|\hat f(\xi)| \le \pi A\,e^{2\pi b\xi} = \pi A\,e^{-2\pi b|\xi|}$;$\xi = 0$ 时 $|\hat f(0)| \le \int|f| \le \pi A$ 平凡。取 $B = \pi A$ 即得 (3)。$\blacksquare$

现在计算 $\xi > 0$ 的半直线积分。由 (2),
$$\int_0^\infty \hat{f}(\xi)\,e^{2\pi i x\xi}\,d\xi = \int_0^\infty\!\!\int_{-\infty}^{\infty} f(u-ib)\,e^{-2\pi i (u-ib-x)\xi}\,du\,d\xi.$$
交换积分次序由 [[fubini-tonelli|Fubini 定理]] 保证:被积函数绝对可积,因为
$$\int_0^\infty\!\!\int_{-\infty}^{\infty}\big|f(u-ib)\,e^{-2\pi i (u-ib-x)\xi}\big|\,du\,d\xi = \int_{-\infty}^{\infty}|f(u-ib)|\,du \cdot \int_0^\infty e^{-2\pi b\xi}\,d\xi \le \pi A\cdot\frac{1}{2\pi b} < \infty,$$
其中用到 $|e^{-2\pi i (u-ib-x)\xi}| = e^{-2\pi b\xi}$。交换后对内的 $\xi$-积分应用 Claim 1(取 $A = 2\pi b > 0$、$B = 2\pi(u-x)$):
$$\int_{-\infty}^{\infty} f(u-ib)\int_0^\infty e^{-2\pi i (u - ib - x)\xi}\,d\xi\,du = \int_{-\infty}^{\infty} f(u-ib)\,\frac{1}{2\pi b + 2\pi i(u-x)}\,du.$$
由 $2\pi b + 2\pi i(u-x) = 2\pi i(u - ib - x)$ 及换元 $\zeta = u - ib$($L_1$ 自左至右),
$$
\int_0^\infty \hat{f}(\xi)\,e^{2\pi i x\xi}\,d\xi = \frac{1}{2\pi i}\int_{L_1}\frac{f(\zeta)}{\zeta - x}\,d\zeta. \tag{4}
$$

**第二阶段:对 $\xi < 0$ 的半直线积分作围道平移**。对 $\xi < 0$ 的移位公式作换元 $\xi \mapsto -\xi$ 并重复第一阶段的计算(此时内层积分为 $\int_0^\infty e^{2\pi i (u+ib-x)\xi}\,d\xi$),得
$$
\int_{-\infty}^0 \hat{f}(\xi)\,e^{2\pi i x\xi}\,d\xi = -\frac{1}{2\pi i}\int_{L_2}\frac{f(\zeta)}{\zeta - x}\,d\zeta, \tag{5}
$$
其中 $L_2 = \{u + ib : u \in \mathbb{R}\}$,方向亦为自左至右。

**第三阶段:矩形围道上的留数计算**。给定 $x \in \mathbb{R}$,取 $R > |x|$。设 $\gamma_R$ 为顶点 $\pm R \pm ib$ 的矩形围道,取逆时针方向。

**Claim 3**($f(\zeta)/(\zeta-x)$ 的简单极点). 对 $x \in \mathbb{R}$,函数 $\zeta \mapsto f(\zeta)/(\zeta-x)$ 在 $\zeta = x$ 有简单极点,留数为 $f(x)$。

*证明.* 因实轴含于条带 $S_a$,故 $x \in S_a$,$f$ 在 $x$ 附近全纯。由 [[holomorphic-function|全纯性]],$f$ 在 $x$ 处有幂级数展开 $f(\zeta) = f(x) + f'(x)(\zeta - x) + O((\zeta-x)^2)$,从而
$$\frac{f(\zeta)}{\zeta - x} = \frac{f(x)}{\zeta - x} + f'(x) + O(\zeta - x).$$
主部为 $\frac{f(x)}{\zeta-x}$:若 $f(x) \ne 0$,则 $\zeta = x$ 为简单极点;若 $f(x) = 0$,则为可去奇点。两种情形下留数均为 $f(x)$。按简单极点留数公式([[residue-theorem|留数定理]] 的标准推论),
$$\operatorname{Res}\left(\frac{f(\zeta)}{\zeta-x},\, x\right) = \lim_{\zeta\to x}(\zeta - x)\,\frac{f(\zeta)}{\zeta - x} = f(x). \qquad\blacksquare$$

由 Claim 3 与 [[residue-theorem|留数定理]](Ch.3 Corollary 2.3:围道内唯一奇点 $x$),
$$
f(x) = \frac{1}{2\pi i}\int_{\gamma_R}\frac{f(\zeta)}{\zeta - x}\,d\zeta. \tag{6}
$$

**第四阶段:取极限 $R \to \infty$**。

**Claim 4**(竖直边积分消失). 当 $R \to \infty$ 时,$\gamma_R$ 的两条竖直边上的积分趋于零。

*证明.* 在右边 $\zeta = R + iy$($y \in [-b,b]$)上,$|f(\zeta)| \le A/(1+R^2)$,且由 $R > |x|$ 得
$$|\zeta - x| = |R - x + iy| \ge R - x,$$
故被积函数模长不超过 $\frac{A}{(1+R^2)(R - x)}$;该边长为 $2b$,积分之模不超过 $\frac{2bA}{(1+R^2)(R - x)} \to 0$。左边 $\zeta = -R + iy$ 上 $|\zeta - x| \ge R + x$,估计相同。$\blacksquare$

由 (6) 与 Claim 4,并注意 $\gamma_R$ 的底边(在 $L_1$ 上)自左至右、顶边(在 $L_2$ 上)自右至左,
$$
f(x) = \lim_{R\to\infty}\frac{1}{2\pi i}\int_{\gamma_R}\frac{f(\zeta)}{\zeta-x}\,d\zeta = \frac{1}{2\pi i}\int_{L_1}\frac{f(\zeta)}{\zeta-x}\,d\zeta - \frac{1}{2\pi i}\int_{L_2}\frac{f(\zeta)}{\zeta-x}\,d\zeta.
$$
代入 (4) 与 (5),
$$
f(x) = \int_0^\infty \hat{f}(\xi)\,e^{2\pi i x\xi}\,d\xi + \int_{-\infty}^0 \hat{f}(\xi)\,e^{2\pi i x\xi}\,d\xi = \int_{-\infty}^{\infty}\hat{f}(\xi)\,e^{2\pi i x\xi}\,d\xi,
$$
此即 Fourier 反演公式。$\blacksquare$

## What-if — 反例、等价叙述与推广

### 等价叙述

#### 叙述 1（Stein 原始，$\mathcal{S}$ 形式）
> $f \in \mathcal{S}(\mathbb{R})$ ⇒ $f(x) = \int \hat{f}(\xi) e^{2\pi i x \xi} d\xi$（Ch.5 Theorem 1.9）。

#### 叙述 2（$\mathbb{R}^d$ 推广）
> $f \in \mathcal{S}(\mathbb{R}^d)$ ⇒ $f(x) = \int_{\mathbb{R}^d} \hat{f}(\xi) e^{2\pi i x \cdot \xi} d\xi$（Ch.6 Theorem 2.4）。

#### 叙述 3（[[lp-space|$L^2$]] 形式，由 Plancherel 推得）
> 若 $f, \hat{f} \in L^2(\mathbb{R})$，则 $f = \int \hat{f}(\xi) e^{2\pi i x \xi} d\xi$（a.e.）。

#### 叙述 4（圆群形式，Fourier 级数）
> 若 $f \in C(\mathbb{T})$ 且 $\hat{f} \in$ [[ellp-space|$\ell^1$]]，则 $f(\theta) = \sum_n \hat{f}(n) e^{2\pi i n \theta}$（一致收敛，Ch.2 Corollary 2.3）。

**等价关系**：叙述 1 ⇒ 叙述 2（积方法）；叙述 2 + Plancherel ⇒ 叙述 3（$L^2$ 延拓）；叙述 1 ⇒ 叙述 4（限制到圆群再 Fourier 级数化）。Stein Fourier 卷覆盖叙述 1、2、4。

### 反例（条件不可削弱）

1. **$\mathcal{S}$ 条件可削弱但不能完全消除**：若 $f \in L^1$ 但 $f \notin \mathcal{S}$（如 $f = \chi_{[-1,1]}$），$\hat{f}(\xi) = \sin(2\pi\xi)/(\pi\xi)$ 衰减仅 $O(1/\xi)$，$\hat{f} \notin L^1$，故**逐点反演公式**失效（$\int \hat{f}(\xi) e^{2\pi i x \xi} d\xi$ 不绝对收敛）。$L^2$ 意义下反演仍成立（由 Plancherel）。
2. **Schwartz 类严格大于最小函数类**：$f(x) = e^{-\alpha x^2}$（任意 $\alpha > 0$）仍属 $\mathcal{S}$，故反演成立；但若 $\alpha = 0$（常数函数）则 $f \notin L^1$，无意义。
3. **$\hat{f}$ 衰减过快时反演平凡**：若 $\hat{f} = 0$（除有限点），反演得 $f = 0$。

### 推广 / 变体

- **采样定理**（Ch.5 Exercise 20）：若 $\hat{f}$ 支撑于 $[-1/2, 1/2]$，则 $f(x) = \sum_{n \in \mathbb{Z}} f(n) \frac{\sin(\pi(x-n))}{\pi(x-n)}$——离散反演。
- **Paley-Wiener**：$\hat{f} \in C_c^\infty$ 等价 $f$ 可整函数延拓且指数型——给出紧支集 Fourier 变换的完整刻画（参 [[paley-wiener-theorem]]）。
- **$\hat{\hat{f}}(x) = f(-x)$**：连续两次 Fourier 反演得反射。
- **$\mathcal{F}^4 = I$**：四次 Fourier 变换恢复原函数。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（Stein 原始）| Gauss 磨光 + 极限 | **中至高** | Schwartz 框架，无测度论 |
| 叙述 2（$\mathbb{R}^d$）| 多元 Fubini | **高** | 多元积分可控 |
| 叙述 3（$L^2$）| Plancherel + 扩张 | **极高** | 实分析卷内容 |
| 叙述 4（圆群）| Fourier 级数 + 一致收敛 | **中** | Ch.2 Corollary 2.3 |
| 证明二（叙述 1）| Poisson 核（Abel 求和）+ DCT | **中** | 需标准积分（围道/指数积分）与 DCT；无测度论 |
| 证明三（叙述 1）| 留数定理 + 围道平移 | **中** | 条件改为 $\mathscr{F}_a$（条带全纯 + 中等衰减）；需复分析工具（[[residue-theorem]]（留数定理）、[[cauchy-theorem]]（Cauchy 定理））与 Fubini 交换 |

## 相关习题

- [[ch1-ex3-double-fourier-transform|Ch.1 Ex.3]]：$\hat{\hat f}(\xi)=f(-\xi)$ 是反演公式取 $x=-\xi$ 的直接推论，习题给出不经分布的初等证法
- **Ch.5 Ex.1（周期化-采样路线）**：$f$ 紧支于 $[-M,M]$、$\hat f$ 中等衰减时，反演公式可由三步得到——(a) 在 $[-L/2,L/2]$ 上把 $f$ 展开为 Fourier 级数（系数 $a_n(L) = \frac{1}{L}\hat f(n/L)$，即变换在格点采样）；(b) 令 $L \to \infty$，Fourier 级数和化为 Riemann 和 $\delta\sum_n\hat f(n\delta)e^{2\pi in\delta x}$（$\delta = 1/L$）；(c) Riemann 和收敛到积分 $\int\hat f(\xi)e^{2\pi ix\xi}\,d\xi$——反演公式的「周期化-采样-取极限」推导

## 应用

- **Poisson 求和公式**（[[poisson-summation-formula]]）：证明中需 Fourier 反演得 $\hat{f}$ 的 Fourier 变换。
- **采样定理**（Ch.5 Exercise 20）：离散反演。
- **Heisenberg 不确定性原理**（[[heisenberg-uncertainty-principle|Heisenberg]]）：证明需 Fourier 反演 + Cauchy-Schwarz。
- **PDE 求解**：热方程、波动方程基本解由 Fourier 反演得到。

## 关联

- 定理：[[plancherel-theorem]]（$\mathcal{F}$ 在 $L^2$ 上的酉扩张）、[[poisson-summation-formula]]
- 概念：[[fourier-transform]]、[[schwartz-space|Schwartz 空间]] $\mathcal{S}(\mathbb{R})$、[[good-kernel]]、[[character|特征标]]、[[fourier-coefficient|Fourier 系数]]、[[f_a-class|$\mathscr{F}_a$ 类]]（证明三工作空间）、[[shift-of-line|水平线移位引理]]（证明三 Claim 2 核心）
- 引理：[[cauchy-schwarz-inequality]]（控制极限的工具）
- 方法：[[approx-by-good-kernel|Gauss 磨光（好核逼近特例）]]（核心 Gauss 磨光构造 + 极限）、[[approx-by-good-kernel]]（$f * K_\delta$ 的好核性）、[[multiplication-formula-trick]]（Schwartz 框架支撑）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5, Theorem 1.9；Ch. 6, Theorem 2.4）

### 此证明新引入 / 补充的 method

- **Gauss 磨光**（[[approx-by-good-kernel|Gauss 磨光（好核逼近特例）]]）：本证明的核心路径 — $\hat f K_\delta = \hat f \cdot e^{-\pi \delta \xi^2}$ 的显式形式 + $\delta \to 0$ 极限。
- **好核逼近**（[[approx-by-good-kernel]]）：$K_\delta$ 是好核族（Ch. 5 Theorem 1.6）。
- **乘法公式技巧**（[[multiplication-formula-trick]]）：Fourier 反演与 Plancherel 互相支撑。

## Stein 写法备注

Fourier 反演在 Schwartz 框架下的证明路径：(a) Gauss 函数自伴（gauss 自伴，用 Cauchy 微分方程证）；(b) Gauss 磨光逼近；(c) 极限 + 速降性控制。**整个论证完全在 Schwartz 类内**——避开测度论、避开 $\mathcal{S}'$ 分布理论。Stein 选择「最小依赖路径」的决心由此可见。
