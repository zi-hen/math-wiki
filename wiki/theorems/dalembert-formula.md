---
type: theorem
title: d'Alembert 公式
description: 一维波动方程 Cauchy 初值问题的显式行波解公式
aliases: [d'Alembert formula, 行波法]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [pde, wave-equation]
strength: standard
strength_basis: 条件：波动方程 $\partial_t^2 u = c^2 \partial_x^2 u$ 初值 $u(x,0) = f(x)$, $\partial_t u(x,0) = g(x)$（弱）；结论：显式解 $u(x,t) = \frac{1}{2}(f(x+ct) + f(x-ct)) + \frac{1}{2c}\int_{x-ct}^{x+ct} g(s) ds$（强——精确公式）。Stein Ch. 1 §3 用此公式求弦振动方程。
---

# d'Alembert 公式

> **工作空间**：$\mathbb{R}^2$（一维空间 + 时间，弦振动）。Stein 在 Ch. 1 §3 给出。

## 陈述

> 在 **$\mathbb{R}$** 上，设 $f \in C^2$、$g \in C^1$，则波动方程 Cauchy 问题
> $$
> \partial_t^2 u = c^2 \partial_x^2 u, \qquad u(x, 0) = f(x), \quad \partial_t u(x, 0) = g(x)
> $$
> 有显式解（d'Alembert 1747 提出）
> $$
> u(x, t) = \frac{1}{2}\big(f(x + ct) + f(x - ct)\big) + \frac{1}{2c} \int_{x - ct}^{x + ct} g(s)\,ds.
> $$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 1, §3, p.28]]。

## 证明思路

公式由两族行波 $f(x \pm ct)$ 与 $g$ 的积分平均组合而成。验证分两步：(1) 对公式直接求导代入方程，利用链式法则可得 $\partial_t^2 u = c^2 \partial_x^2 u$；(2) 在 $t = 0$ 代入即得初值条件 $u(x,0) = f(x)$、$\partial_t u(x,0) = g(x)$。

## 详细证明

**第一阶段：验证满足波动方程。** 设 $u$ 如公式所示。由链式法则，
$$
\partial_t u = \frac{c}{2}\big(f'(x+ct) - f'(x-ct)\big) + \frac{1}{2}\big(g(x+ct) + g(x-ct)\big),
$$
$$
\partial_x u = \frac{1}{2}\big(f'(x+ct) + f'(x-ct)\big) + \frac{1}{2c}\big(g(x+ct) - g(x-ct)\big).
$$
再次求导（第二项对 $t$ 求导时 $g$ 的参数以速度 $c$ 移动）：
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

## 应用

- **解弦振动方程**（Stein Ch. 1）：展示物理上「行波」的几何直观。
- **弱解理论**：$f$ 仅连续可微、$g \in L^1$ 时公式仍良定义，故是经典弱解的范例（Stein p.35 提及）。
- **与 [[separation-of-variables]] 的对比**：同一问题两种解法，分别走「特征线（行波）/ 纯音叠加」路径。

## 关联

- 方法：[[separation-of-variables]]（对比）、[[contour-integration|围道平移（积分法变体）]]（特征线思想在高频短波极限的物理对应）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 1 §3）