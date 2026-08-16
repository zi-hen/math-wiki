---
type: method
title: 围道积分法
aliases: [contour integration, contour integral method, contour translation, contour shifting, keyhole contour, keyhole method, 围道平移法, keyhole 围道]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, method, contour-integration]
strength: standard
strength_basis: 条件：被积函数有合适极点分布 + 围道可显式构造（弱——技术性条件）；结论：实积分化为留数求和（强——精确求值工具）。
---
# 围道积分法

> **工作空间**：$\mathbb{C}$。

## 概述

围道积分法（contour integration）是复分析的核心技术。它通过将实积分 $\int_a^b f(x)\,dx$ 化为复平面上的围道积分 $\int_\gamma f(z)\,dz$，借助 [[cauchy-theorem|Cauchy 定理]]和 [[residue-theorem|留数定理]]精确求值。其「选取围道」步骤在不同情境下有多种具体构造，最常见的两种变体是**围道平移**（变体 1，2026-08-13 并入本页）与**keyhole 围道**（变体 2，含多孔圆围道/annular 形式，2026-08-13 并入本页），二者均可视为本三步骤框架的特例。

## 三步骤框架

### 第一步：选取围道

根据被积函数的奇点分布选取合适的围道 $\gamma$，使得：
1. $\gamma$ 包含实积分区段 $[a, b]$；
2. $\gamma$ 上的被积函数行为可精确估计（如沿半圆趋于零）；
3. $\gamma$ 包围的奇点容易识别。

### 第二步：应用 Cauchy 定理或留数定理

- 若 $f$ 在 $\gamma$ 内全纯：$\int_\gamma f = 0$（[[cauchy-theorem]]）。
- 若 $f$ 在 $\gamma$ 内有有限个极点：$\int_\gamma f = 2\pi i \sum \text{res}_{z_k} f$（[[residue-theorem]]）。

### 第三步：化简与极限

沿围道的弧形部分 $\to 0$（通常令半径 $R \to \infty$），保留实积分区段的贡献。

## 变体 1：围道平移（contour translation）

### 核心思想

**围道平移**（contour translation / contour shifting）是「选取围道」步骤中**移动边界**的一类构造：将 $\mathbb{R}$ 上的积分 $\int_{-\infty}^{\infty} f(x)\,dx$ 通过把围道从 $\operatorname{Im} z = 0$ 沿竖直方向平移至 $\operatorname{Im} z = c$，利用被积函数在带状区域内的全纯性保持积分值不变。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 4, §3, p.140–142]]（Paley-Wiener 正向定理证明）。

### 三步操作（变体 1）

1. **构造平移围道**：设 $f$ 在带状区域 $S_a = \{z : |\operatorname{Im}(z)| < a\}$ 内全纯。设 $\gamma_0$ 为沿 $\operatorname{Im} z = 0$（实轴）的围道，$\gamma_c$ 为沿 $\operatorname{Im} z = c$（$|c| < a$）的围道。
2. **填充矩形**：考虑 $\gamma_0$ 与 $\gamma_c$ 加上两侧的竖直线段围成的矩形 $R$。$f$ 在 $R$ 内（边界上）全纯。由 [[cauchy-theorem|Cauchy 定理]]（矩形版本，[[steinComplexAnalysis|Stein, p.66 Remark]]），
$$
\int_{\gamma_0} f - \int_{\gamma_c} f + \int_{\text{vertical sides}} f = 0.
$$
3. **估计竖直边贡献**：设 $|f(x + iy)| \leq M(x)$ 对所有 $y \in [-a, a]$，且 $\int_{-\infty}^{\infty} M(x)\,dx < \infty$。当矩形宽度（$|c|$）固定、长度（$R$）$\to \infty$ 时，竖直边长为 $|c|$，被积函数在 $x = \pm R$ 处因 $M(x)$ 的衰减而趋于零：
$$
\left|\int_{\text{vertical sides}} f\right| \leq 2|c| \cdot M(R) \to 0 \quad (R \to \infty).
$$
故 $\int_{\gamma_c} f = \int_{\gamma_0} f$。

![[Excalidraw/contour-shift.excalidraw|600]]

> **绘图指引**:在 Obsidian 中打开 Excalidraw/contour-shift.excalidraw(如未创建请右键 → New Excalidraw Drawing,文件名用此)绘制 围道平移。
> 文本公式请用 **fontFamily: 2**(系统字体),保证数学符号渲染。
> 可用组件库(打开 Excalidraw → 库面板):data-viz / software-architecture / system-design(已下载至 Excalidraw/Libraries/)。

> **图 1**（围道平移）:实轴路径 $\gamma_0$ 与水平线路径 $\gamma_c$（$\operatorname{Im} z = c$）加上两侧竖直边构成矩形;竖直边在 $R \to \infty$ 时贡献趋于零,故 $\int_{\gamma_0} f = \int_{\gamma_c} f$(Cauchy 定理)。图内公式由 MathJax 渲染,浏览器预览见 `Excalidraw/contour-shift-preview.html`。

### 应用：Paley-Wiener 正向定理（Stein Theorem 3.1, p.140）

> 若 $|\hat{f}(\xi)| \leq A e^{-2\pi a|\xi|}$，则 $f$ 可全纯延拓至带状区域 $S_b$（$0 < b < a$）。

**证明关键**：在证明中需展示 $f(z) = \int_{-\infty}^{\infty} \hat{f}(\xi) e^{2\pi i z \xi}\,d\xi$ 在 $\operatorname{Im} z = b$ 上收敛。利用 $|\hat{f}(\xi)| e^{-2\pi b|\xi|}$ 的指数衰减（$b < a$ 保证）。

围道平移：将 $\hat{f}(\xi) e^{2\pi i \xi z}$ 在 $z = x$ 处的积分围道从实轴平移至 $\operatorname{Im} z = b$。**关键**：对 $\xi > 0$（$z = x + ib$），$|e^{2\pi i z \xi}| = e^{-2\pi b \xi}$ 衰减；对 $\xi < 0$，$|e^{2\pi i z \xi}| = e^{+2\pi b \xi}$ 增长。故**对 $\xi > 0$ 平移向上，对 $\xi < 0$ 平移向下**（这是 Stein p.140 的具体方向选择）。

由两侧指数衰减 + Cauchy 定理，积分值不变——这给出 $f(z)$ 的全纯延拓。

### 典型例子（变体 1）

- **例子 1：Fourier 逆变换的全纯延拓**。$f \in \mathscr{F}_a$ 类（[[schwartz-space|Stein, p.132]]）$\Rightarrow$ $f$ 可全纯延拓至水平带 $S_b$（$b < a$），并保持 $f(z) = \int \hat{f}(\xi) e^{2\pi i z \xi}\,d\xi$。
- **例子 2：实积分计算**。$\int_{-\infty}^{\infty} \frac{e^{ax}}{1 + e^x}\,dx = \frac{\pi}{\sin(\pi a)}$（$0 < a < 1$）。围道：将实轴平移至 $\operatorname{Im} z = 2\pi$（利用 $e^{2\pi i z} = 1$ 周期性），矩形内 $f$ 简单极点的留数给出积分值。
- **例子 3：留数计算**。$f(z) = \frac{e^{iz}}{z^2 + a^2}$ 在实轴的积分可通过围道平移（上半平面半圆 + 矩形顶部）化简——见 [[residue-calculus|留数计算法]]。

## 变体 2：keyhole 围道（keyhole contour）

### 核心思想

**keyhole 围道**（keyhole contour）是「选取围道」步骤中**挖去奇点**的一类构造：在奇点处挖去一小圆（或矩形），用两条窄「走廊」（keyhole 的「钥孔」）将外边界 $C$ 与内边界 $C_\varepsilon$ 连接，组成一个绕开奇点的复合围道。其思想：将被积函数在奇点附近的行为隔离到内边界上，由 [[cauchy-theorem|Cauchy 定理]]（多连通版本）与 [[residue-theorem|留数定理]] 化简。当奇点有多个时即「多孔圆围道」（annular contour，2026-08-13 并入本页）——同一构造在「多个内边界」情形的推广。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, Theorem 4.1, p.64–65]]（Cauchy 积分公式证明）。

### 典型构造（圆形版本）

设 $z_0 \in D$（开圆盘），$C$ 为 $D$ 的边界圆周（正向）。对充分小 $\varepsilon > 0$，设 $C_\varepsilon$ 为以 $z_0$ 为中心、半径 $\varepsilon$ 的圆周（**负向**，即顺时针）。在实轴方向上用两条窄矩形路径 $L_\varepsilon^\pm$ 连接 $C$ 与 $C_\varepsilon$：

$$
\Gamma_\varepsilon = C \cup L_\varepsilon^+ \cup C_\varepsilon^- \cup L_\varepsilon^-.
$$

$\Gamma_\varepsilon$ 的形状像「钥孔」（keyhole），由此得名。

### 三步操作（变体 2）

1. **构造围道**：如上构造 $\Gamma_\varepsilon$。需 $f(\zeta)/(\zeta - z)$ 在 $\Gamma_\varepsilon$ 内（除 $z_0$ 在 $C_\varepsilon$ 内）全纯。
2. **应用 Cauchy 定理**：由 [[cauchy-theorem|Cauchy 定理]]（多连通版本），
$$
\int_{\Gamma_\varepsilon} \frac{f(\zeta)}{\zeta - z}\,d\zeta = 0.
$$
3. **极限 $\varepsilon \to 0$**：走廊 $L_\varepsilon^\pm$ 的长度 $\to 0$，贡献 $\to 0$（一致连续性）；小圆 $C_\varepsilon$ 的负向积分在 $\varepsilon \to 0$ 时趋于 $2\pi i \cdot f(z)$（参数化计算）；外圆 $C$ 的积分保留——这就是 Cauchy 积分公式。

### 子变体：矩形版本（Stein, p.66 Remark）

若 $f$ 在包含正向矩形 $R$ 及其内部的某开集全纯，则
$$f(z) = \frac{1}{2\pi i} \int_R \frac{f(\zeta)}{\zeta - z}\,d\zeta.$$

证明：类比圆盘版本，用「矩形 keyhole」代替「圆形 keyhole」。

### 子变体：多个内边界（多孔圆围道，原 annular-contour）

对多个奇点 $z_1, \ldots, z_N$（零点、极点），在每个奇点处挖去小圆 $C_k$，用走廊网络连接成复合围道 $\Gamma$。由多连通 Cauchy 定理，
$$
\int_C f - \sum_k \int_{C_k} f = 0 \quad \Rightarrow \quad \int_C f = \sum_k \int_{C_k} f.
$$

每个小圆的贡献按留数计算，求和得 $\int_C f = 2\pi i \sum_k \text{res}_{z_k} f$——这是 [[residue-theorem|留数定理]]（Corollary 2.2 多极点版）、[[argument-principle|辐角原理]]、[[jensen-formula|Jensen 公式]] 证明中「多孔」情形的统一框架（详见下文「在定理证明中的应用」）。

### 子变体：楔形 keyhole（分支切割）

对 $\int_0^\infty$ 上的实积分（含 $\log z$ 或 $z^\alpha$ 等多值函数），沿支割线两侧构造「双层」围道挖去原点——这是计算 $\int_0^\infty x^{s-1}/(1+x)\,dx$（Beta 函数）等的标准技巧。

### 在定理证明中的应用（变体 2）

- **Cauchy 积分公式（Theorem 4.1, p.64）**：$$f(z) = \frac{1}{2\pi i} \int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta.$$ keyhole 围道是此定理的标准证明工具（详见 [[cauchy-integral-formula]] 的「详细证明」区段）。矩形版本见 [[cauchy-integral-formula]] 的 p.66 Remark。
- **留数定理（Theorem 2.1, p.95）**：在每个极点 $z_k$ 周围挖去小圆，由多孔 keyhole 围道（多个小圆 + 走廊网络）应用 Cauchy 定理——这给出 $\int_C f = 2\pi i \sum \text{res}_{z_k} f$。例子：$\int_{|z|=2} \frac{dz}{z(z-1)(z+1)}$——围道包含三个极点 $z = 0, 1, -1$，挖去三个小圆 + 走廊组成多孔围道，$\int_{|z|=2} f = 2\pi i\left[\text{res}_0 + \text{res}_1 + \text{res}_{-1}\right]$（详见 [[residue-theorem]] 与 [[residue-calculus]]）。
- **辐角原理（Theorem 4.1, p.109）**：设 $f$ 在圆 $C$ 内亚纯。在 $f$ 的每个零点 $z_k^0$ 与极点 $z_j^\infty$ 处挖去小圆 $C_k, \tilde{C}_j$，用走廊连接。复合围道 $\Gamma$ 围成的多连通区域无奇点。由 Cauchy 定理，
$$
\int_C \frac{f'}{f} - \sum_k \int_{C_k} \frac{f'}{f} - \sum_j \int_{\tilde{C}_j} \frac{f'}{f} = 0.
$$
每个小圆的贡献为 $2\pi i \cdot (\pm \text{重数})$，求和得 $Z - P$。
- **Jensen 公式（Theorem 1.1, p.154）**：证明中构造「Blashke 乘积」 $B(z)$ 使 $h = f/B$ 在圆盘 $D_R$ 上无零点。由 [[simply-connected-domain|单连通域]] 上的对数分支（Stein Theorem 6.2, p.119），$h = e^g$（$g$ 全纯）。对 $\log h$ 应用 Cauchy 公式取实部。关键步骤：$|B(Re^{i\theta})| = 1$（Blashke 因子在边界上模为 1）——这是**多孔圆围道的简化形式**（走廊退化为 0）。
- **Schwarz-Christoffel 公式（Stein Ch. 8, p.226–229）**：将上半平面映射到多边形——在每个多边形顶点处挖去小圆，关键估计仍依赖 keyhole 围道结构。

## 典型例子

### 例子 1：$\int_{-\infty}^{\infty} \frac{dx}{1+x^2}$

取上半圆围道 $\gamma_R$（实轴 $[-R, R]$ + 半圆 $|z| = R$ 上半平面）。

$f(z) = 1/(1+z^2)$ 在 $\gamma_R$ 内有极点 $z = i$。由留数定理：
$$
\int_{\gamma_R} f = 2\pi i \cdot \text{res}_{z=i} f = 2\pi i \cdot \frac{1}{2i} = \pi.
$$

当 $R \to \infty$：半圆上 $|f| \leq 1/(R^2 - 1)$，长度 $\pi R$，故半圆积分 $\to 0$。实轴积分 $\to \int_{-\infty}^{\infty} \frac{dx}{1+x^2}$。

故 $\int_{-\infty}^{\infty} \frac{dx}{1+x^2} = \pi$。

### 例子 2：$\int_0^{2\pi} \frac{d\theta}{2 + \cos\theta}$

取 $|z| = 1$ 围道，$z = e^{i\theta}$，$dz = iz\,d\theta$。$\cos\theta = (z + z^{-1})/2$。

$$
f(z) = \frac{1}{2 + (z + z^{-1})/2} \cdot \frac{dz}{iz} = \frac{4}{z^2 + 4z + 1} \cdot \frac{dz}{iz}.
$$

$f$ 在 $|z| < 1$ 内有简单极点 $z = -2 + \sqrt{3}$（验证 $|z| < 1$）。留数计算：
$$
\text{res}_{z = -2+\sqrt{3}} \frac{4}{i z(z^2 + 4z + 1)} = \frac{4}{i z \cdot 2(z + 2 - \sqrt{3})} \bigg|_{z=-2+\sqrt{3}} = \frac{2}{i(-2+\sqrt{3})\sqrt{3}}.
$$

故 $\int = 2\pi i \cdot \text{res} = \frac{2\pi}{\sqrt{3}}$。

### 例子 3：Fourier 系数的对偶形式

$\int_0^{2\pi} f(\theta) e^{-in\theta}\,d\theta$（Stein Ch.3 Theorem 7.1, p.120）——此为围道积分的纯虚指数形式。详见 [[holomorphic-function]] 的 Cauchy-Riemann 方程区段。

### 例子 4：Laurent 系数（变体 2）

$\oint f(z)\,dz = 2\pi i \cdot a_{-1}$（沿 $C$）——$a_{-1}$ 是 $f$ 在圆环内的 Laurent 系数。多孔 keyhole 围道将「多个极点处的留数」合并为「外边界上的留数」（详见 [[residue-calculus]]）。

## 陷阱

- **竖直边衰减必须验证**（变体 1）：围道平移时若不满足 $M(x) \in L^1$ 或平移方向选错（$\xi > 0$ 与 $\xi < 0$ 方向相反），竖直边贡献不消失，积分值会改变。
- **走廊贡献需随 $\varepsilon \to 0$ 消失**（变体 2）：若被积函数在走廊端点无界（如奇点落在走廊上），keyhole 构造失效；走廊须避开奇点，且依赖一致连续性估计。
- **分支切割必须成对**（变体 2）：楔形 keyhole 沿支割线两侧的积分方向相反，方向弄反会得到 $2\int$ 而非正确值。
- **不适用**：被积函数没有可精确估计的衰减行为时（如多项式增长的整函数），弧形部分不趋于零，围道积分法失效。

## 应用场景

1. **无穷积分**：$\int_{-\infty}^{\infty} f(x)\,dx$，上半圆围道 + Jordan 引理。
2. **三角积分**：$\int_0^{2\pi} f(\sin\theta, \cos\theta)\,d\theta$，单位圆围道。
3. **有理函数积分**：$\int_{-\infty}^{\infty} R(x)\,dx$，上半圆或下半圆围道。
4. **含 $e^{ix}$ 的积分**：$\int_{-\infty}^{\infty} f(x) e^{iax}\,dx$，Jordan 引理控制半圆。
5. **Paley-Wiener 正向定理**（变体 1）：$f$ 从 $\mathbb{R}$ 延拓至带状区域。
6. **Fourier 逆变换的全纯延拓**（变体 1）：$\mathcal{F}$ 类函数的全纯延拓。
7. **实积分计算**（变体 1/2）：含 $e^{ax}$、$e^{i a x}$ 等因子用平移控制指数行为；含 $\log z$、$z^\alpha$ 等多值函数用分支切割。
8. **Phragmén-Lindelöf 定理**（[[phragmen-lindelof-theorem]]）：将扇形边界控制传递至内部控制——本质上是沿圆弧围道的「平移」。
9. **Fourier 反演的水平线移位**（[[shift-of-line|shift-of-line 引理]]）：$\mathscr{F}_a$ 类下 $\hat f$ 的水平线表示与指数衰减——把 Fourier 变换的定义围道在条带 $S_a$ 内上下平移 $b$ 个单位，积分值不变。
9. **Cauchy 积分公式 / 留数定理 / 辐角原理 / Jensen 公式**（变体 2 多孔形式）：见「在定理证明中的应用」。

## 与其他技巧的对比

- **与 [[residue-calculus|留数计算法]]**：留数计算法依赖 keyhole 围道的应用（留数公式层面）；围道积分法是总体框架，留数计算法是其中「应用定理」步骤的具体化。
- **与 [[comparison-modulus|模的下界转化]]**：估计围道上 $|f|$ 的衰减，常与围道平移联合使用（竖直边贡献消失依赖模估计）。
- **与 [[amplification|增强技巧]]**：围道平移是「参数化增强」在积分路径上的特例——参数 $\varepsilon$ 控制围道从 $\mathbb{R}$ 到 $\mathbb{R} + i\varepsilon$ 的移动；keyhole 围道宽度 $\varepsilon$ 的极限过程本质上是参数化增强——$\varepsilon \to 0$ 时内边界贡献趋于留数。

## 关联

- 概念：[[holomorphic-function]]、[[isolated-singularity]]、[[meromorphic-function]]、[[simply-connected-domain]]、[[schwartz-space]]、[[fourier-coefficient|Fourier 系数]]
- 定理：[[cauchy-theorem]]（核心）、[[cauchy-integral-formula]]、[[residue-theorem]]、[[argument-principle]]、[[jensen-formula]]、[[paley-wiener-theorem]]、[[phragmen-lindelof-theorem]]
- 方法：[[residue-calculus|留数计算法]]、[[comparison-modulus|模的下界转化]]、[[amplification|增强技巧]]、[[analytic-continuation|解析延拓法]]
- 源：[[steinComplexAnalysis]]（Ch. 2, §3, Theorem 4.1, p.64–65; Ch. 3, §2, p.95–96; Ch. 3, §4–5, p.109–115; Ch. 4, §2–3, p.131–142; Ch. 5, §1, p.154; Ch. 8, p.226–229）
