---
type: concept
title: 波动方程
description: 一维波动方程 Cauchy 初值问题与 d'Alembert 显式行波解（Ch.1 §3）
aliases: [wave equation, d'Alembert 公式, d'Alembert formula, 弦振动方程]
created: 2026-08-15
updated: 2026-08-15
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [pde, wave-equation]
strength: standard
strength_basis: 条件：波动方程 $\partial_t^2 u = c^2 \partial_x^2 u$，初值 $u(x,0) = f(x)$, $\partial_t u(x,0) = g(x)$（$f \in C^2$, $g \in C^1$，弱）；结论：显式解公式（d'Alembert，强——精确、全局、构造性）。Stein Ch.1 §3 用此公式求弦振动方程。
---

# 波动方程

> **工作空间**：$\mathbb{R}^2$（一维空间 + 时间，弦振动）。Stein 在 Ch.1 §3 引入。

## What — 定义与基本事实

### 定义

一维波动方程（弦振动方程）：
$$
\partial_t^2 u = c^2 \partial_x^2 u, \qquad (x, t) \in \mathbb{R} \times (0, \infty),
$$
其中 $c > 0$ 为波速。其 **Cauchy 初值问题**为：给定初值
$$
u(x, 0) = f(x), \qquad \partial_t u(x, 0) = g(x),
$$
求满足方程的解 $u$。（一般 $d$ 维波动方程 $\partial_t^2 u = c^2 \Delta u$ 属同族；本页按 Stein 卷只收录 $d = 1$ 的弦振动情形。）

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 1, §3, p.18–35]]。

### 基本性质

1. **行波分解（通解结构）**：$u(x,t) = F(x - ct) + G(x + ct)$——右行波 $F$ 以速度 $c$ 传播、左行波 $G$ 反向传播，波形不变。
2. **线性与叠加**：方程对 $u$ 线性，解的线性组合仍为解。Stein 的「三步骤程序」（简谐运动 / 驻波 → 分离变量 → 叠加）正是 Fourier 方法的雏形（[[separation-of-variables|分离变量法]]）。
3. **时间反演对称**：若 $u$ 是解，则 $u^-(x,t) = u(x,-t)$ 也是解（Stein p.28）。
4. **有限传播速度**：$u(x_0, t)$ 只依赖初值在区间 $[x_0 - ct, x_0 + ct]$（依赖区间 / 特征锥）上的取值。
5. **能量守恒**：对充分正则解，$\frac{1}{2}\int\big[(\partial_t u)^2 + c^2(\partial_x u)^2\big]dx$ 不随时间变化。

### 核心解公式：d'Alembert 公式（Ch.1 §3）

> 设 $f \in C^2$、$g \in C^1$，则一维波动方程 Cauchy 问题有显式解（d'Alembert 1747 提出）
> $$
> u(x, t) = \frac{1}{2}\big(f(x + ct) + f(x - ct)\big) + \frac{1}{2c} \int_{x - ct}^{x + ct} g(s)\,ds.
> $$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 1, §3, p.28]]。（原定理页「d'Alembert 公式」已并入本页本节。）

#### 动机

公式由两族行波 $f(x \pm ct)$ 与 $g$ 的积分平均组合而成：初位移 $f$ 拆成左右行波各一半；初速度 $g$ 在依赖区间 $[x-ct, x+ct]$ 上的积分平均（密度 $1/(2c)$）给出由「初速度冲量」贡献的位移。验证分两步：(1) 对公式直接求导代入方程，用链式法则得 $\partial_t^2 u = c^2 \partial_x^2 u$；(2) 在 $t = 0$ 代入得初值条件。

#### 详细证明

**第一阶段：验证满足波动方程。** 设 $u$ 如公式所示。由链式法则，
$$
\partial_t u = \frac{c}{2}\big(f'(x+ct) - f'(x-ct)\big) + \frac{1}{2}\big(g(x+ct) + g(x-ct)\big),
$$
$$
\partial_x u = \frac{1}{2}\big(f'(x+ct) + f'(x-ct)\big) + \frac{1}{2c}\big(g(x+ct) - g(x-ct)\big).
$$
再次求导（含参数上下限的积分对 $t$ 求导：$\partial_t\int_{x-ct}^{x+ct}g(s)\,ds = c[g(x+ct) + g(x-ct)]$，由微积分基本定理与链式法则）：
$$
\partial_t^2 u = \frac{c^2}{2}\big(f''(x+ct) + f''(x-ct)\big) + \frac{c}{2}\big(g'(x+ct) - g'(x-ct)\big) = c^2 \partial_x^2 u.
$$

**第二阶段：验证初值条件。** 取 $t = 0$：
$$
u(x, 0) = \frac{1}{2}\big(f(x) + f(x)\big) + \frac{1}{2c}\int_x^x g(s)\,ds = f(x),
$$
$$
\partial_t u(x, 0) = \frac{c}{2}\big(f'(x) - f'(x)\big) + \frac{1}{2}\big(g(x) + g(x)\big) = g(x).
$$

故公式给出 Cauchy 问题的解。$\blacksquare$

> **依赖关系小结**: 本证明仅依赖链式法则（对 $f(x \pm ct)$ 与含参数上下限的积分求导）与微积分基本定理（$\int_x^x g = 0$、$\partial_t\int_{x-ct}^{x+ct}g$ 的求导），无定理级依赖，本质自足。依赖图无环。

## Why — 动机与直观

### 为什么引入波动方程？

物理动机（弦振动）：位移 $u(x,t)$ 满足 Newton 第二定律与 Hooke 律的连续极限。Stein 在 Ch.1 以它作为 Fourier 分析的第一个舞台：波动方程的解可由**纯音叠加**（分离变量 + 叠加原理，Fourier 路线）或**行波**（d'Alembert 公式，特征线路线）两种互补视角得到，二者殊途同归。

### 直观解释

- **行波图像**：解是两列不变形的行波叠加（特征线 $x \pm ct$ 上的信息传播）。
- **纯音图像（Fourier）**：初值按 $\sin(mx)$、$\cos(mx)$ 分解，每个模态独立振动（驻波），叠加复原完整解——这是 [[separation-of-variables|分离变量法]] 的物理原型。

## What-if — 反例、边界与推广

### 反例（条件不可削弱）

1. **$f$ 不光滑时 d'Alembert 公式给出弱解而非经典解**：拨弦初值 $f$ 仅连续（不 $C^2$）时公式良定义，但 $u$ 不真正满足波动方程——Stein p.35 借此预告「弱解」与「分布」理论（详见 [[fourier-three-questions-and-methodology]]）。
2. **初值间断沿特征线传播**：$f$ 有跳跃时，$u$ 的间断沿特征线 $x \pm ct$ 传播（行波分解的直接推论），方程只在分布意义下成立。
3. **依赖区间外的初值无影响**：$u(x_0, t)$ 与 $[x_0 - ct, x_0 + ct]$ 之外的初值无关——有限传播速度使解局部化，这是与 Laplace（椭圆）方程的全局性本质区别。

### 推广 / 变体

- **高维波动方程 $\partial_t^2 u = c^2 \Delta u$（$\mathbb{R}^d$）**：行波法失效，需球面均值法（Euler–Poisson–Darboux）；$d$ 的奇偶性决定 Huygens 原理是否成立（$d \ge 3$ 奇维成立，偶维不成立）。
- **弱解理论**：$f$ 仅连续可微、$g \in L^1$ 时公式仍良定义，是经典弱解的范例（Stein p.35 提及）。
- **与热方程（抛物型）对比**：热方程解无限传播速度且随时间光滑化，波动方程保持间断——两类 Cauchy 问题的定性行为根本不同。

## 应用

- **解弦振动方程**（Stein Ch.1）：展示「行波」的物理直观。
- **弱解理论**：$f$ 仅连续可微、$g \in L^1$ 时公式仍良定义（Stein p.35）。
- **与 [[separation-of-variables]] 的对比**：同一问题两种解法——特征线（行波）与纯音叠加（Fourier）路径。

## 关联

- 方法：[[separation-of-variables]]（Fourier 路线，对比）
- 概念：[[fourier-series]]（纯音分解视角）
- 笔记：[[fourier-three-questions-and-methodology]]（弱解与分布预告）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 1 §3）
