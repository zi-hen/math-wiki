---
type: theorem
title: 留数定理
aliases: [residue theorem]
created: 2026-08-12
updated: 2026-08-13
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, residue, contour-integration]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 在 $\Omega \setminus \{z_1, \ldots, z_N\}$ 上全纯（弱——仅要求挖去有限点）；结论：$\int_\gamma f = 2\pi i \sum_k \text{res}_{z_k} f$（强——积分精确等于留数加权和）。这是围道积分计算的核心工具。
---
# 留数定理

> **工作空间**：$\mathbb{C}$ 中包含圆盘 $D$ 或 toy contour $\gamma$ 的开集 $\Omega$。

## What — 陈述

### Theorem 2.1（Stein, p.95）

> 设 $f$ 在包含圆 $C$ 及其内部的某开集上全纯，仅在圆内某点 $z_0$ 处有极点。则
> $$\int_C f(z)\,dz = 2\pi i \cdot \text{res}_{z_0} f.$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, Theorem 2.1, p.95]]。

### Corollary 2.2（Stein, p.96）

> 设 $f$ 在包含圆 $C$ 及其内部的某开集上全纯，仅在圆内 $z_1, \ldots, z_N$ 处有极点。则
> $$\int_C f(z)\,dz = 2\pi i \sum_{k=1}^{N} \text{res}_{z_k} f.$$

### Corollary 2.3（Stein, p.96）

> 设 $f$ 在包含 toy contour $\gamma$ 及其内部的某开集上全纯，仅在 $\gamma$ 内 $z_1, \ldots, z_N$ 处有极点。则
> $$\int_\gamma f(z)\,dz = 2\pi i \sum_{k=1}^{N} \text{res}_{z_k} f.$$

### 留数的计算（Theorem 1.4, p.95）

若 $f$ 在 $z_0$ 处有 $n$ 阶极点，则
$$
\text{res}_{z_0} f = \lim_{z \to z_0} \frac{1}{(n-1)!} \left(\frac{d}{dz}\right)^{n-1} [(z - z_0)^n f(z)].
$$

特别地，简单极点（$n = 1$）的留数为
$$
\text{res}_{z_0} f = \lim_{z \to z_0} (z - z_0) f(z).
$$

## Why — 动机与证明

### 动机

留数定理是围道积分计算的「终极工具」：

1. **实积分计算**：许多实积分（有理函数、三角函数）可化为围道积分，由留数求值。
2. **辐角原理的推论**：留数定理是 [[argument-principle|辐角原理]]的特例（$f'/f$ 的极点对应 $f$ 的零点和极点）。
3. **简化围道变形**：围道可任意变形（穿过极点时记录留数）——留数是「极点的积分贡献」。

### 证明思路

1. **小圆近似**：在每个极点 $z_k$ 处取充分小圆 $C_k$（不含其他极点），由 Cauchy 定理
   $$\int_C f = \int_{C_k} f + \int_{C \setminus C_k} f,$$
   其中 $C \setminus C_k$ 围成的区域无奇点。
2. **主部展开**：$f$ 在 $z_k$ 处有 Laurent 展开 $f(z) = \sum_{j=-n}^\infty a_j (z - z_k)^j$。积分 $\int_{C_k} (z - z_k)^j dz = 0$ 对 $j \neq -1$，$\int_{C_k} (z - z_k)^{-1} dz = 2\pi i$。
3. **求和**：故 $\int_{C_k} f = 2\pi i \cdot a_{-1} = 2\pi i \cdot \text{res}_{z_k} f$。合并所有极点得结论。

![[Excalidraw/residue-multipole.excalidraw|600]]

> **绘图指引**:在 Obsidian 中打开 Excalidraw/residue-multipole.excalidraw(如未创建请右键 → New Excalidraw Drawing,文件名用此)绘制 留数定理多孔围道。
> 文本公式请用 **fontFamily: 2**(系统字体),保证数学符号渲染。
> 可用组件库(打开 Excalidraw → 库面板):data-viz / software-architecture / system-design(已下载至 Excalidraw/Libraries/)。

> **图 1**（多孔围道）:大圆 $C$ 内三个极点 $z = -1, 0, 1$,各挖去小圆 $C_k$ 并用走廊连接;由 Cauchy 定理 $\int_C f = \sum_k \int_{C_k} f = 2\pi i \sum_k \operatorname{Res}(f, z_k)$。图内公式由 MathJax 渲染,浏览器预览见 `Excalidraw/residue-multipole-preview.html`。

### 详细证明

#### 证明动机

留数定理证明的关键在于将围道积分「局部化」为每个极点处小圆上的积分。每个极点贡献 $2\pi i$ 乘以留数，非极点处的围道积分由 Cauchy 定理消去。Laurent 展开中只有 $(z - z_k)^{-1}$ 项对积分有非零贡献——这定义了留数。

#### 详细证明

**第一阶段：约化为单极点情形**。

设 $f$ 在 $C$ 内 $z_1, \ldots, z_N$ 处有极点。在每个 $z_k$ 处取充分小圆 $C_k$（$C_k$ 不含 $z_j$（$j \neq k$），且 $C_k$ 全在 $C$ 内）。设 $\gamma$ 为由 $C$ 与所有 $C_k$ 负向组成的复合围道。则 $f$ 在 $\gamma$ 围成的多连通区域内全纯（挖去所有 $z_k$），由 [[cauchy-theorem|Cauchy 定理]]（多连通版本），
$$
\int_\gamma f = 0 \quad \Rightarrow \quad \int_C f = \sum_{k=1}^N \int_{C_k} f.
$$

**第二阶段：单极点留数**。

设 $z_0$ 为 $f$ 的 $n$ 阶极点。在 $z_0$ 邻域，$f$ 有 Laurent 展开
$$
f(z) = \sum_{j=-n}^{\infty} a_j (z - z_0)^j.
$$

取 $C_\varepsilon$ 为以 $z_0$ 为中心、半径 $\varepsilon$ 的小圆（正向）。则
$$
\int_{C_\varepsilon} f(z)\,dz = \sum_{j=-n}^{\infty} a_j \int_{C_\varepsilon} (z - z_0)^j\,dz.
$$

由直接计算：
- $\int_{C_\varepsilon} (z - z_0)^j\,dz = 0$ 当 $j \neq -1$（参数化 $z = z_0 + \varepsilon e^{i\theta}$，$dz = i\varepsilon e^{i\theta} d\theta$，$\int_0^{2\pi} e^{ij\theta} d\theta = 0$ 当 $j \neq 0$；$j = -1$ 给出 $\int_0^{2\pi} d\theta = 2\pi$）。
- $\int_{C_\varepsilon} (z - z_0)^{-1}\,dz = 2\pi i$.

故 $\int_{C_\varepsilon} f = 2\pi i \cdot a_{-1} = 2\pi i \cdot \text{res}_{z_0} f$。

**Claim**（留数的等价公式）. 若 $f$ 在 $z_0$ 处有 $n$ 阶极点，则
$$
\text{res}_{z_0} f = \lim_{z \to z_0} \frac{1}{(n-1)!} \left(\frac{d}{dz}\right)^{n-1} [(z - z_0)^n f(z)].
$$

*证明.* $(z - z_0)^n f(z)$ 在 $z_0$ 处全纯（$f$ 的极点被 $(z-z_0)^n$ 抵消）。其 Taylor 展开为
$$
(z - z_0)^n f(z) = \sum_{j=-n}^{\infty} a_j (z - z_0)^{j+n} = \sum_{m=0}^{\infty} a_{m-n} (z - z_0)^m.
$$

故 $\frac{1}{(n-1)!} \left(\frac{d}{dz}\right)^{n-1} [(z - z_0)^n f(z)] \big|_{z=z_0} = a_{-1} = \text{res}_{z_0} f$。 $\blacksquare$

**第三阶段：合并**。

由第一阶段，$\int_C f = \sum_{k=1}^N 2\pi i \cdot \text{res}_{z_k} f$。 $\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[cauchy-theorem|Cauchy 定理]]（多连通版本）⇒ 留数定理」：第一阶段用 Cauchy 定理把大围道 $C$ 上的积分化为各极点 $z_k$ 处小圆 $C_k$ 上的积分之和（复合围道约化）；第二阶段对每个极点作 Laurent 展开，初等计算 $\int_{C_\varepsilon}(z - z_0)^j\,dz$（$j \neq -1$ 时为 $0$，$j = -1$ 时为 $2\pi i$）得单极点贡献 $2\pi i \cdot a_{-1}$；附带的留数公式 Claim 用 Taylor 展开验证。本证明不依赖辐角原理、Rouché 定理等后续定理，依赖图无环。

## What-if — 反例与边界

### 典型例子

1. **$\int_{-\infty}^{\infty} \frac{dx}{1 + x^2}$**：取上半圆围道，$f(z) = 1/(1+z^2)$ 在上半平面仅有 $z = i$ 处简单极点，留数 $= \frac{1}{2i}$。$\int = 2\pi i \cdot \frac{1}{2i} = \pi$。
2. **$\int_0^{2\pi} \frac{d\theta}{2 + \cos\theta}$**：取 $|z| = 1$ 围道，$z = e^{i\theta}$。化为 $f(z) = \frac{4i}{z^2 + 4z + 1}$ 的围道积分，在 $|z| < 1$ 内有简单极点 $z = -2 + \sqrt{3}$（不在单位圆内... 应选其他根）。最终 $\int = \frac{2\pi}{\sqrt{3}}$。
3. **$f(z) = 1/z$**：$\int_{|z|=1} \frac{dz}{z} = 2\pi i$（标准例）。

### 反例

1. **围道穿过极点**：若围道 $\gamma$ 本身穿过某极点，留数定理不直接适用。须先用小半圆绕开（计算「主值积分」）。
2. **本性奇点**：留数定理**仅适用**极点情形。本性奇点处无有限阶主部。
3. **围道不闭合**：留数定理要求闭围道。开围道积分需用其他方法（如柯西主值）。

### 边界情形

- **$\infty$ 处极点**：通过 $F(z) = f(1/z) \cdot (-1/z^2)$ 的留数计算。
- **多重围道**：若围道多次绕某点（如 $\gamma = 2C$，绕 $z_0$ 两圈），积分 $= 2 \cdot 2\pi i \cdot \text{res}_{z_0} f$。

### 等价叙述

| 叙述 | 形式 | 适用范围 |
|------|------|---------|
| 1. 单极点（Stein Theorem 2.1） | $\int_C f = 2\pi i \cdot \text{res}_{z_0} f$ | 单极点 |
| 2. 多极点（Stein Corollary 2.2） | $\int_C f = 2\pi i \sum \text{res}_{z_k} f$ | 多极点 |
| 3. Toy contour（Stein Corollary 2.3） | 同上 | Toy contour |
| 4. 辐角原理（Stein Theorem 4.1） | $\int f'/f = 2\pi i (Z - P)$ | $f$ 亚纯 |

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 单极点 | Laurent 展开 + 围道分解 | 中 |
| 多极点 | + 求和 | 中 |
| Toy contour | Jordan 定理 | 中至高 |
| 留数计算公式 | Taylor 展开 | 低 |

## 关联

- 概念：[[holomorphic-function]]、[[isolated-singularity]]、[[meromorphic-function]]
- 定理：[[cauchy-theorem]]（前置）、[[argument-principle]]（特例）、[[rouche-theorem]]
- 方法：[[contour-integration|围道积分法]]、[[residue-calculus|留数计算法]]、[[contour-integration|keyhole 围道（含多孔形式）]]、[[amplification|增强技巧]]、[[local-to-global|局部到整体原理]]、[[structural-randomness-decomposition|结构-随机性二分法]]
- 应用：实积分计算（无穷积分、三角积分）、辐角原理
- 引用本定理的引理：[[removable-singularity-criterion]]（可去奇点准则用于处理孤立极点）、[[residue-by-taylor-coeff]]（留数 $= a_{-1}$ 的 Laurent 展开刻画）
- 源：[[steinComplexAnalysis]]（Ch. 3, Theorem 2.1, p.95）
