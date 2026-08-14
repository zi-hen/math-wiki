---
type: theorem
title: Euler 部分分式公式（由 Fourier 级数导出）
aliases: [Euler formulas, cotangent partial fractions, Euler 反射公式]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, special-functions, series]
strength: strong
strength_basis: 弱条件 + 强结论。条件：仅 $\alpha \notin \mathbb{Z}$（弱——无需可积性之外的正则性）；结论：由 $\cos(\alpha x)$ 的 Fourier 级数精确推出 $\cot$ 的部分分式展开、余割平方和与 Euler 反射公式（强——同一族经典恒等式的分析证明，与复分析路线互补）。
---

# Euler 部分分式公式（由 Fourier 级数导出）

> **工作空间**：圆群 $\mathbb{T}$（$[-\pi,\pi]$ 周期形式）；参数 $\alpha \in \mathbb{C} \setminus \mathbb{Z}$。

## What — 陈述

> **定理（Ch. 3, Ex. 3, p.113–114）**。设 $\alpha$ 为不等于整数的复数。
> (i) $\cos(\alpha x)$（$2\pi$-周期）的 Fourier 级数为
> $$
> \cos(\alpha x) = \frac{\sin(\pi\alpha)}{\pi}\left[\frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty \frac{(-1)^n \cos(nx)}{\alpha^2 - n^2}\right];
> $$
> (ii) 在 $x = \pi$ 处取值得
> $$
> \sum_{n=1}^\infty \frac{1}{n^2 - \alpha^2} = \frac{1}{2\alpha^2} - \frac{\pi}{2\alpha\tan(\pi\alpha)}, \qquad
> \cot u = \frac{1}{u} + 2\sum_{n=1}^\infty \frac{u}{u^2 - n^2\pi^2} \quad (u \in \mathbb{C}\setminus\pi\mathbb{Z});
> $$
> (iii) 在 $x = 0$ 处取值得
> $$
> \frac{\alpha\pi}{\sin(\alpha\pi)} = 1 + 2\alpha^2\sum_{n=1}^\infty \frac{(-1)^{n-1}}{n^2 - \alpha^2};
> $$
> (iv) 对 $0 < \alpha < 1$，
> $$
> \int_0^\infty \frac{t^{\alpha-1}}{1+t}\,dt = \frac{\pi}{\sin(\alpha\pi)}.
> $$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Exercise 3, p.113–114]]。

## Why — 动机与证明

### 动机

把初等函数 $\cos(\alpha x)$ 展开为 Fourier 级数后，在特殊点取值——级数在这些点化为「系数求和」——即得到一串经典恒等式。这是「Fourier 级数 = 函数在频率域的精确分解」的样板：**同一对象，两种表示（函数值 vs 系数和），恒等即公式**。

### 证明思路

1. 计算 $\cos(\alpha x)$ 的 Fourier 系数（含参 $\alpha$ 的积分，用和差化积）；
2. 在连续点 $x = \pi$ 与 $x = 0$ 处代入级数等式；
3. (iv) 用几何级数展开 $1/(1+t)$，化归为 (iii) 的系数和。

### 详细证明

**Claim 1（Fourier 系数）**。$\cos(\alpha x)$ 在 $[-\pi,\pi]$ 上的 Fourier 系数为
$$
a_0 = \frac{2\sin(\pi\alpha)}{\pi\alpha}, \qquad a_n = \frac{2\alpha\sin(\pi\alpha)}{\pi}\cdot\frac{(-1)^n}{\alpha^2 - n^2} \quad (n \ge 1).
$$

*证明.* $a_0 = \frac{1}{\pi}\int_{-\pi}^\pi\cos(\alpha x)\,dx = \frac{2\sin(\pi\alpha)}{\pi\alpha}$。对 $n \ge 1$，由 $2\cos(\alpha x)\cos(nx) = \cos((\alpha+n)x) + \cos((\alpha-n)x)$，
$$
\int_{-\pi}^\pi\cos(\alpha x)\cos(nx)\,dx = \left[\frac{\sin((\alpha+n)x)}{\alpha+n} + \frac{\sin((\alpha-n)x)}{\alpha-n}\right]_{-\pi}^{\pi}.
$$
在端点，$\sin((\alpha \pm n)\pi) = \sin(\alpha\pi)\cos(n\pi) = (-1)^n\sin(\alpha\pi)$（因 $\sin(n\pi) = 0$），故
$$
\int_{-\pi}^\pi = 2(-1)^n\sin(\alpha\pi)\left(\frac{1}{\alpha+n}+\frac{1}{\alpha-n}\right) = \frac{4\alpha(-1)^n\sin(\alpha\pi)}{\alpha^2-n^2},
$$
除以 $\pi$ 得 $a_n$。$\blacksquare$

**（i）级数表示**。$\cos(\alpha x)$ 光滑，Fourier 级数逐点收敛到它自己；代入 Claim 1 即得。$\blacksquare$

**（ii）$x = \pi$ 处的取值**。在 $x = \pi$ 处 $\cos(n\pi) = (-1)^n$：
$$
\cos(\alpha\pi) = \frac{\sin(\pi\alpha)}{\pi}\left[\frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty\frac{(-1)^n(-1)^n}{\alpha^2-n^2}\right]
= \frac{\sin(\pi\alpha)}{\pi}\left[\frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty\frac{1}{\alpha^2-n^2}\right].
$$
两边除以 $\sin(\pi\alpha)/\pi$ 并整理得 $\pi\cot(\pi\alpha) = \frac{1}{\alpha} + 2\alpha\sum_n\frac{1}{\alpha^2-n^2}$，即第一式；以 $u = \pi\alpha$ 代入得第二式。$\blacksquare$

**（iii）$x = 0$ 处的取值**。在 $x = 0$ 处 $\cos(nx) = 1$：
$$
1 = \frac{\sin(\pi\alpha)}{\pi}\left[\frac{1}{\alpha} + 2\alpha\sum_{n=1}^\infty\frac{(-1)^n}{\alpha^2-n^2}\right]
\;\Longrightarrow\;
\frac{\alpha\pi}{\sin(\alpha\pi)} = 1 + 2\alpha^2\sum_{n=1}^\infty\frac{(-1)^{n-1}}{n^2-\alpha^2}.
$$
（用 $\frac{1}{\alpha^2-n^2} = -\frac{1}{n^2-\alpha^2}$ 与 $(-1)^n$ 的符号整理。）$\blacksquare$

**（iv）反射积分**。对 $0 < \alpha < 1$，换元 $t = 1/u$ 于 $\int_1^\infty$ 部分：
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

> **依赖关系小结**: 本证明依赖链为「[[fourier-coefficient|Fourier 系数]] 的含参计算（Claim 1，和差化积 + 端点三角函数值 $\sin((\alpha\pm n)\pi) = (-1)^n\sin(\alpha\pi)$）⇒ [[fourier-series|Fourier 级数]] 逐点收敛（$\cos(\alpha x)$ 光滑，级数收敛到自身）⇒ 端点取值 (ii)(iii) ⇒ 部分分式合并 (iv)」。步骤 (iv) 另用几何级数展开 $1/(1+t)$（$[0,1]$ 上一致收敛，可逐项积分）并把积分拆为 $\int_0^1 + \int_1^\infty$。除 Fourier 系数定义与级数逐点收敛基本事实外无定理级依赖（不依赖复分析留数路线）。依赖图无环。

## What-if — 反例、等价叙述与推广

### 等价叙述

1. **cot 部分分式**：$\cot u = \frac{1}{u} + 2\sum_{n\ge1}\frac{u}{u^2-n^2\pi^2}$（等价于 (ii) 第一式）。
2. **余割公式**：$\frac{\pi}{\sin(\alpha\pi)} = \sum_{n\in\mathbb{Z}}\frac{(-1)^n}{n+\alpha}$（(iv) 的级数形式，与 (iii) 等价）。
3. **反射公式**：$\frac{\pi}{\sin(\alpha\pi)}$ 两侧的乘积形式 $\Gamma(\alpha)\Gamma(1-\alpha) = \frac{\pi}{\sin(\pi\alpha)}$（Gamma 函数的镜像公式，同族恒等式）。

### 反例 / 边界

- **$\alpha \in \mathbb{Z}$ 时失效**：$\sin(\pi\alpha) = 0$，级数系数分母 $\alpha^2 - n^2 = 0$——公式退化为平凡恒等式的极限（如 $\alpha = 0$ 时 $\cot u \sim 1/u$ 的展开第一项）。
- **与复分析路线的对照**：$\pi\cot\pi z$ 的部分分式也可由留数法获得（见 [[residue-by-taylor-coeff|留数 = Taylor 系数]] 的典型例子）——两条独立路线给出同一公式（多证法记录，见 [[poisson-summation-formula|Poisson 求和公式]] 的同类对照）。

### 推广

- **余割平方和**：对 (ii) 第一式求导，得 $\sum_n\frac{1}{(n^2-\alpha^2)^2}$ 等高阶恒等式；另由 [[poisson-summation-formula|Poisson 求和公式]]（Ch. 5, Ex. 15）得 $\sum_n\frac{1}{(n+\alpha)^2} = \frac{\pi^2}{\sin^2(\pi\alpha)}$ 与 $\sum_n\frac{1}{n+\alpha} = \frac{\pi}{\tan(\pi\alpha)}$——Poisson 路线与本题 Fourier 路线互补。

## 证明难度差异

| 陈述 | 方法 | 难度 |
|------|------|------|
| (i)–(iii) | 含参积分 + 端点取值 | **低** |
| (iv) | 几何级数 + 部分分式合并 | **中** |

## 关联

- 定理：[[poisson-summation-formula]]（另一路线的同族公式）、[[gibbs-phenomenon]]（锯齿函数的同级数求和）
- 引理：[[residue-by-taylor-coeff|留数 = Taylor 系数]]（复分析路线的 $\pi\cot\pi z$）、[[cauchy-schwarz-inequality]]
- 概念：[[fourier-series]]、[[fourier-coefficient|Fourier 系数]]
- 方法：[[integral-truncation|积分分拆]]（(iv) 中 $\int_0^1 + \int_1^\infty$ 的拆分）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Exercise 3, p.113–114）
