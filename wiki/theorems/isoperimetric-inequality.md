---
type: theorem
title: 等周不等式（Hurwitz 形式）
aliases: [isoperimetric inequality, Hurwitz isoperimetric inequality]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [geometry, fourier-analysis, calculus-of-variations]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$\Gamma$ 为 $\mathbb{R}^2$ 中简单闭曲线，长度 $L$（弱——光滑性可放宽）；结论：所围面积 $A \leq L^2/(4\pi)$（强——最优常数）。等号当且仅当 $\Gamma$ 是圆。Hurwitz 1901 给出的 Fourier 分析证明是 Fourier 思想进入几何分析的开端。Euler 1753 早已猜出此结论。
---

# 等周不等式（Hurwitz 形式）

> **工作空间**：欧氏平面 $\mathbb{R}^2$。Stein 在 Ch. 4, Theorem 1.1 给出 Hurwitz 1901 的 Fourier 证明形式。

## What — 陈述

> 设 $\Gamma \subset \mathbb{R}^2$ 为一简单闭曲线，长度 $L$，所围区域面积为 $A$。则
> $$
> A \leq \frac{L^2}{4\pi},
> $$
> 且等号成立**当且仅当 $\Gamma$ 是圆**。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 4, Theorem 1.1]]。

## Why — 动机与证明

### 动机

等周问题是几何变分法的开端：在固定周长的曲线中，哪条曲线围出最大面积？自古希腊起被认为答案是圆，但严格证明迟至 19 世纪。**Hurwitz（1901）** 利用 Fourier 级数给出极其优雅的证明，将变分问题转化为 [[fourier-coefficient|Fourier 系数]]估计——这是 Fourier 分析思想进入几何分析的开端。

### 证明思路（Hurwitz 1901 / Stein Ch.4 §1）

Stein 采用 Hurwitz 1901 的 Fourier 证明，逻辑骨架如下：

1. **放缩**：将曲线整体放大 $\delta = 2\pi/L$ 倍，化为长度 $L = 2\pi$ 的情形（比值 $A/L^2$ 在放缩下不变），只需证 $A \le \pi$。
2. **弧长参数化**：$\gamma(s) = (x(s), y(s))$，$s \in [0, 2\pi]$，满足 $x'(s)^2 + y'(s)^2 = 1$（弧长参数）；平移坐标原点使 $\int_0^{2\pi} x\,ds = \int_0^{2\pi} y\,ds = 0$。
3. **面积公式**：由 Green 公式（Ch.4 Exercise 2, p.138），$A = \int_0^{2\pi} x(s)\,y'(s)\,ds$。
4. **关键恒等式**（Ch.4 Exercise 4, p.139）：
   $$
   2(\pi - A) = \int_0^{2\pi} \bigl[(x' + y)^2 + (y'^2 - y^2)\bigr]\,ds.
   $$
5. **非负性**：第一项为平方积分非负；第二项由 [[wirtinger-inequality|Wirtinger 不等式]]（$\int y = 0$ 时 $\int y^2 \le \int y'^2$）非负。故 $2(\pi - A) \ge 0$，即 $A \le \pi$。
6. **等号**：两个积分同时为零 ⟹ $x' = -y$ 且 $y$ 为基波 ⟹ $\gamma$ 是圆。

### 详细证明

**第一阶段：放缩到 $L = 2\pi$。** 对映射 $(x, y) \mapsto (\delta x, \delta y)$（Stein p.120-121），曲线长度放大 $\delta$ 倍、面积放大 $\delta^2$ 倍，故比值 $A/L^2$ 不变。取 $\delta = 2\pi/L$，新曲线长度恰为 $2\pi$；于是只需证明：长度为 $2\pi$ 的简单闭曲线满足 $A \le \pi$。

**第二阶段：弧长参数化与坐标平移。** 设 $\gamma(s) = (x(s), y(s))$（$0 \le s \le 2\pi$）为 $\Gamma$ 的 $C^1$ 参数化，$x, y$ 为 $2\pi$-周期函数，且
$$
x'(s)^2 + y'(s)^2 = 1, \qquad \int_0^{2\pi} x\,ds = \int_0^{2\pi} y\,ds = 0.
$$
（第二式由平移坐标原点实现——Stein Ch.4 Exercise 4 中「a change of coordinates will guarantee $\int_0^{2\pi} y(s)\,ds = 0$」。）此时长度恰为
$$
L = \int_0^{2\pi} \sqrt{x'^2 + y'^2}\,ds = \int_0^{2\pi} 1\,ds = 2\pi.
$$

**第三阶段：面积公式。** 由 Green 公式，取正向参数化时
$$
A = \frac{1}{2}\int_0^{2\pi} (x y' - y x')\,ds.
$$

**Claim 1**（面积即 $\int x y'\,ds$）. $A = \int_0^{2\pi} x(s)\,y'(s)\,ds$。

*证明.* 由 $x, y$ 的周期性，$\int_0^{2\pi} (xy)'\,ds = \int_0^{2\pi} (x'y + xy')\,ds = \bigl[x(s)y(s)\bigr]_0^{2\pi} = 0$，故 $\int x'y\,ds = -\int xy'\,ds$。代入 Green 公式：
$$
A = \frac{1}{2}\Bigl(\int_0^{2\pi} xy'\,ds - \int_0^{2\pi} yx'\,ds\Bigr) = \frac{1}{2}\Bigl(\int_0^{2\pi} xy'\,ds + \int_0^{2\pi} xy'\,ds\Bigr) = \int_0^{2\pi} x y'\,ds. \quad \blacksquare
$$
（此即 Stein Ch.4 Exercise 2(a), p.138：$\frac{1}{2}\int(xy' - yx')\,ds = \int xy'\,ds = -\int yx'\,ds$。）

**第四阶段：关键恒等式。** 由弧长参数化 $\int_0^{2\pi}(x'^2 + y'^2)\,ds = \int_0^{2\pi} 1\,ds = 2\pi$，结合 Claim 1 与 $\int x'y\,ds = -\int xy'\,ds$：
$$
\begin{aligned}
2(\pi - A) &= \int_0^{2\pi} (x'^2 + y'^2)\,ds - 2\int_0^{2\pi} x y'\,ds \\
&= \int_0^{2\pi} (x'^2 + y'^2)\,ds + 2\int_0^{2\pi} x' y\,ds \\
&= \int_0^{2\pi} \bigl[(x' + y)^2 + (y'^2 - y^2)\bigr]\,ds,
\end{aligned}
$$
其中最后一步由展开 $(x' + y)^2 = x'^2 + 2x'y + y^2$ 即得。此即 Stein Ch.4 Exercise 4(p.139) 给出的恒等式。

**第五阶段：非负性与结论。** 第一项 $\int_0^{2\pi} (x' + y)^2\,ds \ge 0$ 为平方积分。第二项：因 $\int_0^{2\pi} y\,ds = 0$，由 [[wirtinger-inequality|Wirtinger 不等式]]（$2\pi$-周期、均值为零、$C^1$ 的 $y$ 满足 $\int y^2\,ds \le \int y'^2\,ds$，Ch.3 Exercise 11(a)，见 Stein Ch.4 引用），
$$
\int_0^{2\pi} (y'^2 - y^2)\,ds \ge 0.
$$
故 $2(\pi - A) \ge 0$，即 $A \le \pi$。对一般曲线回代长度 $L$（第一阶段放缩）得
$$
A \le \pi = \frac{L^2}{4\pi}. \qquad \blacksquare
$$

**第六阶段：等号条件。** 等号 $A = \pi$ 当且仅当两个积分同时为零：
1. $\int_0^{2\pi} (x' + y)^2\,ds = 0$ ⟹ $x' = -y$ 逐点成立；
2. $\int_0^{2\pi} (y'^2 - y^2)\,ds = 0$，即 Wirtinger 取等 ⟹ $y(s) = a\cos s + b\sin s$（基波，见 [[wirtinger-inequality]] 等号条件）。

由 $x' = -y$ 积分得 $x(s) = -a\sin s + b\cos s + c$；又 $\int_0^{2\pi} x\,ds = 0$ 得 $c = 0$。弧长条件 $x'^2 + y'^2 = 1$ 给出 $a^2 + b^2 = 1$，故
$$
\gamma(s) = \bigl(b\cos s - a\sin s,\; a\cos s + b\sin s\bigr),
$$
这是半径为 $\sqrt{a^2 + b^2} = 1$ 的圆。回代放缩，$A = L^2/(4\pi)$ 当且仅当 $\Gamma$ 是圆。$\blacksquare$

> **依赖关系小结**：本证明依赖链为「微积分基本事实（放缩、弧长参数化、Green 公式、分部积分）⇒ 面积公式与关键恒等式 ⇒ [[wirtinger-inequality|Wirtinger 不等式]]（应用于均值零的 $2\pi$-周期函数 $y$）⇒ 非负性 $A \le \pi$ ⇒ 回代放缩 $A \le L^2/(4\pi)$」。核心定理级依赖仅 [[wirtinger-inequality|Wirtinger 不等式]]（第五、六阶段），其余为 Green 公式与初等积分估计；等号条件由 Wirtinger 取等（$y$ 为基波）与一阶微分方程 $x' = -y$ 联合给出，不再引入新依赖。本证明**不依赖** Parseval 恒等式或 Cauchy-Schwarz 不等式的显式调用（难度表中的「Parseval + Wirtinger」是对证法的方法学概括，详细证明实际仅用 Wirtinger）。依赖图无环：Wirtinger 不等式独立于本页建立。

## What-if — 反例、等价叙述与推广

### 等价叙述

#### 叙述 1（Hurwitz 1901 / Stein Ch.4）
> 简单闭曲线 $\Gamma \subset \mathbb{R}^2$，$A \leq L^2/(4\pi)$，等号当且仅当 $\Gamma$ 是圆。

#### 叙述 2（Schwarz 反射）
> Steiner 对称化亦可证等周不等式（Stein Ch.4 提及）。

#### 叙述 3（Wirtinger 不等式，[[wirtinger-inequality|Wirtinger 不等式]] 等价形式）
> 设 $f$ 为 $T$-周期 $C^1$ 函数，$\int_0^T f = 0$，则 $\int |f|^2 \leq (T/2\pi)^2 \int |f'|^2$，等号仅当 $f$ 为基波。等周不等式在弧长参数化下由 Wirtinger 不等式直接推出（见本页「详细证明」第五、六阶段）。

#### 叙述 4（$\mathbb{R}^d$ 推广，Bishop-Gromov）
> 高维等周不等式：固定 $(d-1)$-维表面积的区域中，球面所围 $d$-维体积最大——证明较难（Minkowski、内容式），非 Fourier 路线。

**等价关系**：叙述 1 ≡ 叙述 3（参数化后即 Wirtinger）；叙述 4 是叙述 1 的高维类比。

### 反例（条件不可削弱）

1. **简单闭曲线是关键**：若 $\Gamma$ 是自交曲线（不可缩），"面积"定义模糊——Stein 在 p.122 显式承认此弱点并指明问题："how is the region enclosed by $\Gamma$ defined? what is the geometric definition of the area of this region?"
2. **$\Gamma$ 不闭时不成立**：开曲线的"内面积"无定义——见 Schwarz 反射的扩张。
3. **矩形不达最优**：正方形 $a \times a$：$L = 4a$，$A = a^2$，故 $A / L^2 = 1/16 < 1/(4\pi) \approx 0.0796$，确实 $1/16 \approx 0.0625$。圆的 $A/L^2 = \pi r^2 / (2\pi r)^2 = 1/(4\pi)$。

### 推广 / 变体

- **Steiner 对称化**：通过对每条平行弦取中点得到新曲线，几何方法（Stein Ch.4 提及）。
- **测地线情形**：曲线在曲面上时，等周不等式依赖高斯曲率（参 do Carmo）。
- **高维**：Minkowski 内容式 + Brunn-Minkowski 不等式（极难）。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（Hurwitz Fourier）| Parseval + Wirtinger | **中** | 仅用 Fourier + Cauchy-Schwarz |
| 叙述 2（Schwarz 反射）| 反射迭代 | **中至高** | 几何，但需商群 |
| 叙述 3（Wirtinger）| Fourier 直接 | **低** | Ch.3 Exercise 11(a) |
| 叙述 4（高维）| Minkowski | **极高** | 完全不同的工具 |

## 相关习题

- [[ch5-pb11-wirtinger|Ch.5 Pb.11]]：Wirtinger/Poincaré 不等式族是 Hurwitz 等周证明的核心工具链；Problem 11(d) 即等周扩展

## 应用

- **几何**：等周问题；几何不等式（Bonnesen 不等式推广）。
- **物理**：肥皂泡问题的极值原理。
- **变分法**：极值曲线的存在性。

## 关联

- 定理：[[parseval-identity]]（Wirtinger 的推导基础）、[[wirtinger-inequality]]（Hurwitz 证法的核心工具）、[[heisenberg-uncertainty-principle]]（同一类"质量-动量"对偶）
- 概念：[[fourier-series]]（圆群的工具）、[[fourier-transform]]、[[lp-space|$L^2$ 空间]]
- 引理：[[cauchy-schwarz-inequality]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 4, Theorem 1.1；证明结构见 Exercise 2/4, p.138-139）

## Stein 写法备注

Hurwitz 1901 的 Fourier 证法是 Fourier 分析进入几何学的开创性工作——其本质是"曲线参数化后 Wirtinger 不等式 + Cauchy-Schwarz 巧妙结合"。Stein 在 Ch. 4 §1 不仅给出 Hurwitz 证法，还在 p.122 反思："how is the region enclosed by $\Gamma$ defined? what is the geometric definition of the area of this region?"——这一未解决问题最终由测度论（Stein Real Analysis 卷）补足。
