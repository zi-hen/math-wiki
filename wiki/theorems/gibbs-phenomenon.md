---
type: theorem
title: Gibbs 现象（锯齿函数过冲）
aliases: [Gibbs phenomenon, Gibbs 现象, 过冲 9%]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, convergence, pointwise]
strength: standard
strength_basis: 条件：函数在一点有跳跃间断（弱——比可微弱得多）；结论：Fourier 部分和在跳跃附近过冲约 9%（强而反直觉——点态收敛在跳跃点附近并非单调趋近）。这是逐点收敛理论的核心现象，也是 [[mean-square-convergence|均方收敛]]（过冲在 $L^2$ 范数下消失）的反衬。
---

# Gibbs 现象（锯齿函数过冲）

> **工作空间**：圆群 $\mathbb{T}$。

## What — 陈述

**锯齿函数**。设 $f(x) = (\pi - x)/2$（$0 < x < 2\pi$），$f(0) = 0$，按周期 $2\pi$ 延拓到 $\mathbb{R}$。其 Fourier 级数为
$$
f(x) \sim \frac{1}{2i}\sum_{|n|\neq 0}\frac{e^{inx}}{n} = \sum_{n=1}^\infty \frac{\sin(nx)}{n},
$$
在原点有跳跃间断：$f(0^+) = \pi/2$，$f(0^-) = -\pi/2$，跳跃 $\pi$。

> **定理（Gibbs 现象，Ch. 3, Ex. 20, p.111）**。对部分和 $S_N(f)(x) = \sum_{n=1}^N\frac{\sin(nx)}{n}$，
> $$
> \lim_{N\to\infty}\left[\max_{0<x\le \pi/N} S_N(f)(x) - \frac{\pi}{2}\right] = \int_0^\pi \frac{\sin t}{t}\,dt - \frac{\pi}{2} \approx 0.2811,
> $$
> 即部分和在跳跃上方过冲约 $0.2811 \approx 8.95\% \cdot \pi$（跳跃的约 $9\%$）。负方向同理下冲 $9\%$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Exercise 20, p.111]]。

## Why — 动机与证明

### 动机

锯齿函数在原点有跳跃，其 Fourier 级数在每点收敛（可微点收敛到 $f$，跳跃点收敛到 $f(0^+)+f(0^-)/2 = 0$），但**收敛不是单调的**：部分和在跳跃附近越过极限值并过冲固定比例（约 $9\%$），随后振荡衰减回极限。这直观地说明「级数收敛」与「图形逼近」的差异，是 [[riemann-localization|Riemann 局部化]] 讨论的经典场景。

![[Excalidraw/gibbs-overshoot.excalidraw|600]]

> **绘图指引**:在 Obsidian 中打开 Excalidraw/gibbs-overshoot.excalidraw(如未创建请右键 → New Excalidraw Drawing,文件名用此)绘制 Gibbs 过冲。
> 文本公式请用 **fontFamily: 2**(系统字体),保证数学符号渲染。
> 可用组件库(打开 Excalidraw → 库面板):data-viz / software-architecture / system-design(已下载至 Excalidraw/Libraries/)。

> **图 1**（Gibbs 过冲）:方波在跳跃点 $x_0$ 的 Fourier 部分和 $S_N$ 出现约 $8.95\%$ 的过冲(≈ $1.0895$ 倍跳变),且 $N \to \infty$ 不消失——收敛但图形不逼近。图内公式由 MathJax 渲染,浏览器预览见 `Excalidraw/gibbs-overshoot-preview.html`。

### 证明思路

部分和 $S_N(f)(\pi/N)$ 是 $\int_0^\pi \sin t/t\,dt$ 的 Riemann 和；而极限值 $\pi/2 = \int_0^\infty \sin t/t\,dt$（Dirichlet 积分）。两者之差 $\int_\pi^\infty \sin t/t\,dt$（取负号）正是过冲量。在 $(0, \pi/N]$ 内 $S_N$ 单调上升，故最大值在端点 $x = \pi/N$ 附近取得。

### 详细证明

**Claim 1（部分和在 $x = \pi/N$ 处的极限）**。$\lim_{N\to\infty}S_N(f)(\pi/N) = \int_0^\pi \frac{\sin t}{t}\,dt$。

*证明.* 直接代入：
$$
S_N(f)\!\left(\frac{\pi}{N}\right) = \sum_{n=1}^N \frac{\sin(n\pi/N)}{n} = \sum_{n=1}^N \frac{\sin(n\pi/N)}{n\pi/N}\cdot\frac{\pi}{N}.
$$
右端是 $t \mapsto \sin t/t$ 在 $[0,\pi]$ 上步长 $\pi/N$ 的 Riemann 和（$t = 0$ 处取 $t\to 0$ 的极限值 $1$），故收敛到 $\int_0^\pi \sin t/t\,dt$。$\blacksquare$

**Claim 2（过冲量）**。$\int_0^\pi \frac{\sin t}{t}\,dt - \frac{\pi}{2} = -\int_\pi^\infty \frac{\sin t}{t}\,dt \approx 0.2811$。

*证明.* 由 Dirichlet 积分 $\int_0^\infty \sin t/t\,dt = \pi/2$（见 [[ch4-ex12-feynman|Ch.4 Ex.12]] 的边界值 $I(0) = \pi/2$），
$$
\int_0^\pi \frac{\sin t}{t}\,dt - \frac{\pi}{2} = \int_0^\pi \frac{\sin t}{t}\,dt - \int_0^\infty \frac{\sin t}{t}\,dt = -\int_\pi^\infty \frac{\sin t}{t}\,dt.
$$
数值 $\int_\pi^\infty \sin t/t\,dt \approx -0.2811$（交错积分，逐项可估），故差约 $0.2811$。$\blacksquare$

**最大值位置**。$S_N(f)$ 在 $(0, \pi/N]$ 上单调上升（其导数 $\sum_{n=1}^N\cos(nx)$ 在 $(0, \pi/N]$ 内为正，或由部分和与原点的几何直观），故最大值在 $x = \pi/N$ 处取得；由 Claim 1–2 即得定理。$\blacksquare$

> **依赖关系小结**: 本证明依赖链为「Riemann 和（Claim 1：$S_N(\pi/N)$ 是 $t \mapsto \sin t/t$ 在 $[0,\pi]$ 上的 Riemann 和）⇒ Dirichlet 积分 $\int_0^\infty \sin t/t\,dt = \pi/2$（[[ch4-ex12-feynman|Ch.4 Ex.12]] 的边界值 $I(0)$）⇒ 过冲量 $\int_\pi^\infty \sin t/t\,dt$（Claim 2，交错积分逐项估计）⇒ 最大值位置（$S_N$ 在 $(0, \pi/N]$ 上单调，由导数符号或几何直观）⇒ 过冲公式」。除 Dirichlet 积分值（标准积分）与 Riemann 和、交错级数的初等事实外无定理级依赖。本证明不依赖本页自身。依赖图无环。

## What-if — 反例、等价叙述与推广

### 等价叙述

1. **过冲比例**：过冲 $0.2811$ 对跳跃 $\pi$ 之比 $= 0.0895 \approx 9\%$。
2. **下冲对称**：$x < 0$ 一侧部分和下冲同比例（由奇函数 $f(-x) = -f(x)$ 的对称性）。
3. **一般跳跃**：对任意带跳跃 $J$ 的间断，过冲为 $J \cdot 0.0895$（Riemann 局部化：跳跃附近的局部行为由锯齿函数主导）。

### 边界情形（现象的本质）

- **$9\%$ 与 $N$ 无关**：过冲比例不随 $N \to \infty$ 消失，只是过冲的位置 $x \approx \pi/N$ 趋近跳跃点——这就是「收敛但不逼近」的精确含义。
- **与 [[mean-square-convergence|均方收敛]] 相容**：过冲发生在宽度 $\sim 1/N$ 的邻域内，其 $L^2$ 能量 $\sim N \cdot (1/N)^2 \to 0$，故均方收敛仍成立（[[mean-square-convergence|均方收敛定理]] 不受影响）。
- **与 Cesàro 平均的对比**：[[cesaro-summation|Cesàro / Fejér 平均]] $\sigma_N$ 在连续点一致收敛，在跳跃点收敛到平均值——平均化消除了过冲（好核的效应，见 [[good-kernel]]）。

### 推广

- **方波**：$f = \chi_{(0,\pi)} - \chi_{(\pi,2\pi)}$ 的 Fourier 级数同样过冲 $9\%$，是 Gibbs 现象最常见的教材例子。
- **收敛性对照**：逐点收敛（可微点，[[fourier-series|Ch.3 Theorem 2.1]]）与绝对收敛（[[bernstein-theorem|Bernstein 定理]]）都不排除过冲——过冲是「部分和」特有的，绝对收敛的级数则无此现象。

## 证明难度差异

| 路线 | 方法 | 难度 |
|------|------|------|
| Riemann 和 + Dirichlet 积分 | 显式计算 $S_N(\pi/N)$ | **中** |
| 局部化论证 | 一般跳跃化归为锯齿 | **中高** |

## 相关习题

- [[ch4-ex12-feynman|Ch.4 Ex.12]]：$I(a) = \int_0^\infty e^{-at}\sin t/t\,dt$ 的边界值 $I(0) = \pi/2$ 即 Dirichlet 积分 $\int_0^\infty\sin t/t\,dt$——本定理 Claim 2 所用的标准积分
- [[ch3-ex18-slow-decay|Ch.3 Ex.18]]：锯齿函数的系数 $\hat f(n) \sim 1/n$ 是「衰减但不绝对可和」的例子（对应 [[bernstein-theorem|Bernstein 定理]] 的边界）

## 关联

- 定理：[[mean-square-convergence]]（过冲在 $L^2$ 中消失）、[[riemann-localization]]（局部化视角）、[[bernstein-theorem]]（绝对收敛无过冲）
- 引理：[[dirichlet-kernel-l1-norm|Dirichlet 核的 $L^1$ 范数]]（部分和范数无界的振荡结构）
- 概念：[[fourier-series]]、[[lp-space|$L^2$ 空间]]（过冲能量的框架）、[[good-kernel]]（Fejér 平均消除过冲）
- 方法：[[cesaro-summation]]（平均化 vs 部分和）、[[integral-truncation|积分分拆]]（$\int_0^\pi$ 与 $\int_\pi^\infty$ 的拆分）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Exercise 20, p.111）
