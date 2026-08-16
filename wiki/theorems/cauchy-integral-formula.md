---
type: theorem
title: Cauchy 积分公式
aliases: [Cauchy integral formula]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, cauchy-theorem, integral-representation]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 在 $\Omega$ 上全纯（弱——仅需全纯）；结论：$f$ 由其边界值通过 $\frac{1}{2\pi i}\int \frac{f(\zeta)}{\zeta - z}\,d\zeta$ 恢复（强——边界值唯一确定内部值）。
---
# Cauchy 积分公式

> **工作空间**：$\mathbb{C}$ 的开子集 $\Omega$，圆盘 $D \subset \Omega$。

## What — 陈述

### Theorem 4.1（Cauchy 积分公式，Stein p.64）

> 设 $f$ 在包含闭圆盘 $\bar{D}$ 的开集 $\Omega$ 上全纯。设 $C$ 为 $D$ 的边界圆周（正向）。则对任意 $z \in D$，
> $$f(z) = \frac{1}{2\pi i} \int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta.$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 2, Theorem 4.1, p.64]]。

### 高阶导数公式（Corollary 4.2, p.66）

> $$f^{(n)}(z) = \frac{n!}{2\pi i} \int_C \frac{f(\zeta)}{(\zeta - z)^{n+1}}\,d\zeta.$$

### Cauchy 不等式（Corollary 4.3, p.67）

> 若 $f$ 在以 $z_0$ 为中心、$R$ 为半径的闭圆盘 $\bar{D}$ 的某邻域全纯，则
> $$|f^{(n)}(z_0)| \leq \frac{n! \|f\|_C}{R^n},$$
> 其中 $\|f\|_C = \sup_{z \in C} |f(z)|$。

### 矩形的 Cauchy 积分公式（Stein, p.66 Remark）

> 若 $f$ 在包含正向矩形 $R$ 及其内部的某开集全纯，则
> $$f(z) = \frac{1}{2\pi i} \int_R \frac{f(\zeta)}{\zeta - z}\,d\zeta, \quad z \in \text{int}(R).$$

证明类比圆盘版本，用「矩形 keyhole」代替「圆形 keyhole」。

## Why — 动机与证明

### 动机

Cauchy 积分公式是复分析的核心「表示公式」——它将全纯函数 $f$ 在圆盘内的值完全由其在边界圆周上的值恢复。这有三重意义：

1. **全纯函数的刚性**：$f$ 在 $\Omega$ 内的值由其在任意「包围 $z$ 的闭曲线」上的值决定。这是解析延拓唯一性（[[steinComplexAnalysis|Theorem 4.8, p.71]]）的强形式。
2. **无穷可微性**：高阶导数公式直接给出 $f \in C^\infty(\Omega)$（不需要额外假设）。
3. **围道积分计算**：很多围道积分可通过 Cauchy 公式化为边界值的显式计算。

![[Excalidraw/keyhole.excalidraw|600]]

> **绘图指引**:在 Obsidian 中打开 Excalidraw/keyhole.excalidraw(如未创建请右键 → New Excalidraw Drawing,文件名用此)绘制 Cauchy 积分公式 keyhole 围道。
> 文本公式请用 **fontFamily: 2**(系统字体),保证数学符号渲染。
> 可用组件库(打开 Excalidraw → 库面板):data-viz / software-architecture / system-design(已下载至 Excalidraw/Libraries/)。

> **图 1**（keyhole 围道）:大圆 $C$ 与围绕 $z_0$ 的负向小圆 $C_\varepsilon$ 由走廊 $L_\varepsilon^\pm$ 连接;$\varepsilon \to 0$ 时小圆积分趋于 $2\pi i\, f(z_0)$,得 $f(z_0) = \frac{1}{2\pi i}\int_C \frac{f(\zeta)}{\zeta - z_0}\,d\zeta$。图内公式由 MathJax 渲染,浏览器预览见 `Excalidraw/keyhole-preview.html`。

### 证明思路

1. **构造 keyhole 围道**：在 $C$ 内挖去以 $z$ 为中心的小圆 $C_\varepsilon$，构造「钥匙孔」围道；
2. **应用 Cauchy 定理**：$f(\zeta)/(\zeta - z)$ 在钥匙孔围道上无奇点，由 Cauchy 定理积分为零；
3. **化简**：钥匙孔两侧的窄条贡献在 $\varepsilon \to 0$ 时趋于零；
4. **小圆贡献**：仅剩 $C$（正向）和 $C_\varepsilon$（负向）。$C_\varepsilon$ 上的积分在 $\varepsilon \to 0$ 时趋于 $2\pi i f(z)$。

### 详细证明

#### 证明动机

直接计算 $\int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta$ 看似困难。突破口在于：对于固定的 $z$，被积函数 $g(\zeta) = f(\zeta)/(\zeta - z)$ 在 $C$ 内仅 $\zeta = z$ 处有奇点。挖去以 $z$ 为中心、半径 $\varepsilon$ 的小圆 $C_\varepsilon$，构造绕开奇点的钥匙孔围道，则 $g$ 在此围道内全纯，由 Cauchy 定理积分为零。化简过程得到所求公式。

#### 详细证明

**第一阶段：构造 keyhole 围道**。

固定 $z \in D$。取 $\varepsilon > 0$ 充分小，使圆盘 $\{|w - z| < \varepsilon\}$ 包含在 $D$ 内。设 $C_\varepsilon$ 为以 $z$ 为中心、半径 $\varepsilon$ 的圆周（**取负向**，即顺时针）。构造围道 $\Gamma_\varepsilon$：

$$
\Gamma_\varepsilon = C \cup L_\varepsilon^+ \cup C_\varepsilon^- \cup L_\varepsilon^-,
$$

其中 $L_\varepsilon^\pm$ 为连接 $C$ 与 $C_\varepsilon$ 的两条窄矩形路径（在实轴方向），正向。

$f(\zeta)/(\zeta - z)$ 在 $\Gamma_\varepsilon$ 内全纯（除 $\zeta = z$ 在 $C_\varepsilon$ 外）。由 Cauchy 定理（[[cauchy-theorem]]），
$$
\int_{\Gamma_\varepsilon} \frac{f(\zeta)}{\zeta - z}\,d\zeta = 0.
$$

**第二阶段：化简窄条贡献**。

设 $f$ 在 $\bar{D}$ 上一致连续（紧集上的连续函数）。当 $\varepsilon \to 0$ 时，窄条 $L_\varepsilon^\pm$ 长度趋于零且被积函数有界，故
$$
\left|\int_{L_\varepsilon^\pm} \frac{f(\zeta)}{\zeta - z}\,d\zeta\right| \leq \|f\|_C \cdot |L_\varepsilon^\pm| \to 0.
$$

**第三阶段：化简 $C_\varepsilon$ 上的贡献**。

对 $\zeta \in C_\varepsilon$，参数化为 $\zeta = z + \varepsilon e^{i\theta}$（$\theta$ 从 $2\pi$ 到 $0$，因为负向）：
$$
\int_{C_\varepsilon^-} \frac{f(\zeta)}{\zeta - z}\,d\zeta = \int_{2\pi}^{0} \frac{f(z + \varepsilon e^{i\theta})}{\varepsilon e^{i\theta}} \cdot i\varepsilon e^{i\theta}\,d\theta = -i \int_{2\pi}^{0} f(z + \varepsilon e^{i\theta})\,d\theta = i \int_0^{2\pi} f(z + \varepsilon e^{i\theta})\,d\theta.
$$

当 $\varepsilon \to 0$ 时，$f(z + \varepsilon e^{i\theta}) \to f(z)$ 一致，故
$$
\lim_{\varepsilon \to 0} \int_{C_\varepsilon^-} \frac{f(\zeta)}{\zeta - z}\,d\zeta = 2\pi i \cdot f(z).
$$

**第四阶段：合并**。

由 $\int_{\Gamma_\varepsilon} = 0$，结合第二、第三阶段，$\varepsilon \to 0$ 时得
$$
\int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta + 2\pi i f(z) = 0.
$$
即
$$
f(z) = \frac{1}{2\pi i} \int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta. \quad \blacksquare
$$

### 高阶导数公式的证明

将 $f(z) = \frac{1}{2\pi i} \int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta$ 在积分号下对 $z$ 求 $n$ 阶导数（被积函数 $\frac{f(\zeta)}{(\zeta - z)^{n+1}}$ 在紧集上一致有界且光滑，可交换微分与积分）。 $\blacksquare$

### Cauchy 不等式的证明

$|f^{(n)}(z_0)| = \left|\frac{n!}{2\pi i} \int_C \frac{f(\zeta)}{(\zeta - z_0)^{n+1}}\,d\zeta\right| \leq \frac{n!}{2\pi} \cdot \|f\|_C \cdot 2\pi R \cdot \frac{1}{R^{n+1}} = \frac{n! \|f\|_C}{R^n}.$ $\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[cauchy-theorem|Cauchy 定理]] ⇒ Cauchy 积分公式 ⇒ 高阶导数公式 ⇒ Cauchy 不等式」：第一阶段在 keyhole 围道上应用 Cauchy 定理（被积函数 $f(\zeta)/(\zeta - z)$ 绕开奇点后无奇点），第二阶段起用一致连续性消去窄条贡献并化简 $C_\varepsilon$ 上的积分；高阶导数公式与 Cauchy 不等式分别依赖前一步的积分表示，再叠加积分号下求导与模估计（均为基础分析）。本证明不依赖 Liouville 定理、留数定理等后续定理，依赖图无环。

## What-if — 反例与边界

### 典型例子

1. **$f(z) = z^n$**：$\frac{1}{2\pi i} \int_C \frac{\zeta^n}{\zeta - z}\,d\zeta = z^n$ 当 $|z| < R$（$C$ 为半径 $R$ 的圆）——这与 Laurent 展开一致。
2. **$f(z) = \frac{1}{z - a}$（$a \in D$）**：$\frac{1}{2\pi i}\int_C \frac{d\zeta}{(\zeta - a)(\zeta - z)} = \frac{1}{z - a}$（部分分式）——验证 Cauchy 公式。
3. **$f(z) = e^z$**：$\frac{1}{2\pi i}\int_{|z|=R} \frac{e^\zeta}{\zeta - z}\,d\zeta = e^z$——直接验证。

### 反例

1. **$f$ 非全纯**：Cauchy 公式**失败**。例如 $f(z) = \overline{z}$，$\int_C \frac{\overline{\zeta}}{\zeta - z}\,d\zeta$ 一般不等于 $\overline{z}$。
2. **$z$ 在 $C$ 上**：被积函数有奇点，公式不直接适用。须使用 Sokhotski-Plemelj 公式（主值意义下）。
3. **$z$ 在 $C$ 外**：被积函数 $f(\zeta)/(\zeta - z)$ 在 $C$ 内全纯，Cauchy 定理给出积分 $= 0$。

### 边界情形

- **$C$ 退化**：若 $\partial D$ 不是简单闭曲线，公式需修改。toy contour 版本的 Cauchy 公式（Stein, p.66 Remark）覆盖此类情形。
- **$f$ 仅在 $\bar{D}$ 的邻域全纯**：若 $f$ 仅在包含 $\bar{D}$ 的某开集全纯，Cauchy 公式仍成立。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 圆盘版本（Stein Theorem 4.1） | $f(z) = \frac{1}{2\pi i}\int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta$ | $z \in D$ |
| 2. 矩形版本（Stein Remark） | $f(z) = \frac{1}{2\pi i}\int_R \frac{f(\zeta)}{\zeta - z}\,d\zeta$ | $z \in \text{int}(R)$ |
| 3. Toy contour 版本 | 类比 2，toy contour | $z$ 在内部 |
| 4. 圆周外 | $\int_C \frac{f(\zeta)}{\zeta - z}\,d\zeta = 0$（$z$ 在 $C$ 外）| 由 Cauchy 定理直接 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 圆盘版本 | Keyhole + 极限 | 中 |
| 高阶导数公式 | 在积分号下求导 | 低（依赖圆盘版本） |
| Cauchy 不等式 | 直接估计 | 低 |
| 矩形版本 | 类比圆盘版本 | 中 |
| 任意 toy contour | Jordan 定理 + 矩形版本 | 中至高 |

## 关联

- 概念：[[holomorphic-function]]、[[contour-integration|围道积分法]]
- 定理：[[cauchy-theorem]]（前置）、[[liouville-theorem]]、[[argument-principle]]、[[maximum-modulus-principle]]、[[residue-theorem]]
- 引理：[[cauchy-inequalities]]（推论）、[[mean-value-property-holomorphic]]（推论）
- 方法：[[contour-integration|keyhole 围道（含多孔形式）]]、[[differentiation-under-integral|对参数求导（积分号下求导）]]、[[structural-randomness-decomposition|结构-随机性二分法]]
- 应用：[[paley-wiener-theorem]]（正定理证明的核心工具）
- 源：[[steinComplexAnalysis]]（Ch. 2, §4, Theorem 4.1, p.64–67）
