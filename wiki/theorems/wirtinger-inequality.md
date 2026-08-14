---
type: theorem
title: Wirtinger 不等式
description: 周期函数 $L^2$ 范数被导数 $L^2$ 范数控制的 Poincaré 型不等式，等号由基波达到，是等周不等式的核心工具
aliases: [Wirtinger inequality, Wirtinger 技巧]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [inequality, fourier-analysis, geometry]
strength: standard
strength_basis: 条件：$f$ 周期 $T$，$\int f = 0$，$C^1$（弱）；结论：$\int |f|^2 \leq (T/2\pi)^2 \int |f'|^2$，等号仅当 $f$ 为基波 $\sin(2\pi t/T), \cos(2\pi t/T)$。Stein Ch. 3 Ex.11 + Ch. 4 等周不等式的核心工具。
---

# Wirtinger 不等式

> **工作空间**：周期函数空间 $C^1([0, T])$ 或 $C^1(\mathbb{T})$。Stein 在 Ch. 3 Exercise 11 与 Ch. 4 §1 用此证等周。

## 陈述

> 在 **$\mathbb{T}$**（即 $T$-周期函数）上，设 $f \in C^1$ 且 $\int_0^T f = 0$，则
> $$
> \int_0^T |f(t)|^2\,dt \leq \left(\frac{T}{2\pi}\right)^2 \int_0^T |f'(t)|^2\,dt.
> $$
> 等号当且仅当 $f(t) = A\sin(2\pi t/T) + B\cos(2\pi t/T)$（基波）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 3, Exercise 11(a)]]；证明工具为 [[parseval-identity|Parseval 恒等式]]。

## 等价叙述

**叙述 B（$T = 2\pi$ 圆群形式）**：若 $f \in C^1(\mathbb{T})$，$\int_{\mathbb{T}} f = 0$，则 $\int_{\mathbb{T}} |f|^2 \le \int_{\mathbb{T}} |f'|^2$，等号当且仅当 $f$ 为基波。

等价性（形式等价，时间放缩）：令 $g(\tau) = f(T\tau/(2\pi))$，则 $g$ 为 $2\pi$-周期。变量替换给出 $\int_0^{2\pi}|g|^2\,d\tau = (2\pi/T)\int_0^T |f|^2\,dt$ 与 $\int_0^{2\pi}|g'|^2\,d\tau = (T/2\pi)\int_0^T |f'|^2\,dt$，故 $\int|g|^2 \le \int|g'|^2$ 等价于 $\int_0^T |f|^2 \le (T/2\pi)^2 \int_0^T |f'|^2$。此即 Stein Ch. 3 Exercise 11(a) 的原始形式。

## 证明思路

由 [[parseval-identity|Parseval]] 立得：[[fourier-coefficient|Fourier 系数]] $a_n$ 与导数系数 $a_n \cdot (2\pi i n/T)$ 的模平方和分别给出 $\|f\|_2^2$ 与 $\|f'\|_2^2$；均值条件 $\int f = 0$ 给出 $a_0 = 0$，逐项比较后求和即得不等式。

1. **Fourier 展开**：$f(t) = \sum_{n\in\mathbb{Z}} a_n e^{2\pi i n t/T}$，其中 $a_0 = 0$（因 $\int f = 0$）。
2. **导数系数**：$f'$ 的第 $n$ 个 Fourier 系数为 $a_n \cdot (2\pi i n/T)$。
3. **逐项比较 + Parseval**：对 $n \neq 0$ 逐项比较模平方，求和得 $\|f\|_2^2 \le (T/2\pi)^2\|f'\|_2^2$。

## 详细证明

**第一阶段：Parseval 给出两端范数。** 
由 [[parseval-identity|Parseval 恒等式]]，$\|f\|_2^2 = \sum_n |a_n|^2$；又 $f'$ 的 Fourier 系数为 $a_n \cdot 2\pi i n/T$，故
$$
\|f'\|_2^2 = \sum_{n\in\mathbb{Z}} \left(\frac{2\pi n}{T}\right)^2 |a_n|^2.
$$

**第二阶段：逐项比较。** $\int_0^T f = 0$ 给出 $a_0 = 0$。对 $n \neq 0$，$n^{-2} \le 1$，故
$$
|a_n|^2 = \left(\frac{T}{2\pi}\right)^2 n^{-2}\left(\frac{2\pi n}{T}\right)^2 |a_n|^2 \le \left(\frac{T}{2\pi}\right)^2 \left(\frac{2\pi n}{T}\right)^2 |a_n|^2.
$$
对 $n \neq 0$ 求和（此推导与 [[ch5-pb11-wirtinger|Ch.5 Pb.11(a)]] 的解答一致）：
$$
\|f\|_2^2 = \sum_{n\neq 0} |a_n|^2 \le \left(\frac{T}{2\pi}\right)^2 \sum_{n\neq 0}\left(\frac{2\pi n}{T}\right)^2 |a_n|^2 = \left(\frac{T}{2\pi}\right)^2 \|f'\|_2^2.
$$

**第三阶段：等号条件。** 等号当且仅当所有 $|n| \ge 2$ 的系数 $a_n = 0$，即 $f$ 仅含 $n = \pm 1$ 两项：
$$
f(t) = a_1 e^{2\pi i t/T} + a_{-1} e^{-2\pi i t/T} = A\sin(2\pi t/T) + B\cos(2\pi t/T).
$$
$\blacksquare$

## 其他证明

> 本区段按 docs/PROOFS.md §6.5 记录与主证明不同的第二证法;主证明(§「详细证明」)保持不变。



## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 证明一（叙述 B，Parseval）| 频谱系数逐项比较 | **低** | 需 [[parseval-identity|Parseval 恒等式]] 与级数求和 |
| 证明二（叙述 B，变分法）| 瑞利商 + Euler–Lagrange + 谱定理 | **中至高** | 需谱定理/紧性标准结果；等号条件经特征函数刻画〔非书内证明，标准变分法/谱定理结果〕 |

## 应用

- **等周不等式**（[[isoperimetric-inequality]] 的 Hurwitz 证明）：对曲线 $(x(t), y(t))$ 的两个分量应用 Wirtinger + Cauchy-Schwarz。
- **与等周不等式的等价**（Ch. 4, Ex. 4）：弧长参数化下 $2(\pi - A) = \int[(x'+y)^2 + (y'^2 - y^2)]\,ds$，其中 $\int y = 0$ 时可化；反之由 Wirtinger 构造使括号项为零的曲线——两个不等式互为充要（等号条件对应圆周 / $A\sin t + B\cos t$）。
- **Poincaré 不等式**（高维版，Ch. 5 Problem 11）。
- **波动方程能量估计**。

## 关联

- 前置定理：[[parseval-identity]]（核心工具）
- 关联概念：[[lp-space|$L^2$ 空间]]（框架）、[[fourier-series]]（工具）
- 关联引理：[[cauchy-schwarz-inequality]]
- 应用定理：[[isoperimetric-inequality]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3 Ex.11、Ch. 4 §1）

## 相关习题

> **规则**：与定理**强相关**的 exercise/problem（特例、反例、证明直接引用）必须在此填充**陈述**（不含证明）；证明仅存在于习题/问题页。

- [[ch5-pb11-wirtinger|Ch.5 Pb.11]]：Wirtinger/Poincaré 不等式族（$\mathbb{R}$ 版）——(a) 周期 $T$ 情形（等号基波）；(b) 内积型估计；(c) 区间 $[a,b]$ 端点为零情形；(d) 等周不等式扩展（陈述不含证明，完整解答见习题页）。