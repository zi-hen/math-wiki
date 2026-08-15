---
type: lemma
title: Bessel 不等式（一般正交族版）
aliases: [Bessel inequality, Bessel's inequality, Bessel 不等式]
created: 2026-08-15
updated: 2026-08-15
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
description: 内积空间中任意标准正交族 $\{\varphi_n\}$ 对任意向量 $f$ 满足 $\sum_n |\langle f, \varphi_n\rangle|^2 \le \|f\|^2$。证明仅依赖内积代数与 Pythagoras 定理（纯线性代数），无需测度论或 Fourier 分析。取等当且仅当 $f \in \overline{\operatorname{span}}\{\varphi_n\}$。
tags: [fourier-analysis, l2-theory, linear-algebra]
---
# Bessel 不等式（一般正交族版）

> **工作空间**：内积空间 $H$（典型为 [[lp-space|$L^2(\mathbb{T})$]] / [[lp-space|$L^2(\mathbb{R}^d)$]] / [[ellp-space|$\ell^2(\mathbb{Z})$]]）。

## 陈述

> 设 $H$ 为内积空间（不必完备）。若 $\{\varphi_n\}_{n \in \mathbb{N}}$ 是 $H$ 中的**标准正交族**，即
> $$
> \langle \varphi_n, \varphi_m\rangle = \delta_{nm},
> $$
> 则对任意 $f \in H$，令 $a_n = \langle f, \varphi_n\rangle$，有
> $$
> \sum_{n \in \mathbb{N}} |a_n|^2 \;\le\; \|f\|^2.
> $$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 3, Theorem 1.2]]（Bessel 不等式圆群形式）。本引理是该结果的**线性代数抽象**——适用于任意内积空间中的标准正交族，不限于圆群或 Fourier 分析。

## 证明

设 $F \subset \mathbb{N}$ 为任意有限子集（取 $F = \{1, 2, \ldots, N\}$ 即可）。

**第 1 步：构造正交投影。** 由内积双线性，定义
$$
P_F f := \sum_{n \in F} a_n \varphi_n.
$$
$P_F f$ 是 $f$ 在 $\operatorname{span}\{\varphi_n : n \in F\}$ 上的**正交投影**——这一点在第 2 步验证。

**第 2 步：正交性。** 对任意 $m \in F$，
$$
\langle f - P_F f,\; \varphi_m\rangle = \langle f, \varphi_m\rangle - \sum_{n \in F} a_n \langle \varphi_n, \varphi_m\rangle = a_m - \sum_{n \in F} a_n \delta_{nm} = a_m - a_m = 0.
$$
故 $f - P_F f$ 正交于 $\{\varphi_n : n \in F\}$ 张成的整个子空间，特别地 $f - P_F f \perp P_F f$。

**第 3 步：Pythagoras 定理。** 正交向量范数平方相加：
$$
\|f\|^2 = \|\,(f - P_F f) + P_F f\,\|^2 = \|f - P_F f\|^2 + \|P_F f\|^2.
$$
其中 $\|P_F f\|^2$ 由标准正交性给出：
$$
\|P_F f\|^2 = \Bigl\langle \sum_{n \in F} a_n \varphi_n,\; \sum_{m \in F} a_m \varphi_m\Bigr\rangle = \sum_{n \in F} |a_n|^2.
$$
（仅当 $n = m$ 时 $\langle \varphi_n, \varphi_m\rangle = 1$，交叉项为零。）

**第 4 步：取下界。** 因 $\|f - P_F f\|^2 \ge 0$，得
$$
\|f\|^2 \;\ge\; \|P_F f\|^2 \;=\; \sum_{n \in F} |a_n|^2.
$$
对所有有限 $F$ 成立。取 $F \uparrow \mathbb{N}$（即 $|F| \to \infty$），由单调收敛定理（或非负项部分和的单调性）得
$$
\sum_{n \in \mathbb{N}} |a_n|^2 \;=\; \sup_{F \subset \mathbb{N}, |F|<\infty} \sum_{n \in F} |a_n|^2 \;\le\; \|f\|^2. \qquad\blacksquare
$$

> **依赖关系小结**。本证明仅依赖内积的代数公理（双线性、内积对自身给出范数平方）加 Pythagoras 定理（正交向量范数平方相加）。**无测度论、无 Fourier 分析、无特殊函数**——本质上是线性代数 / 内积空间的标准习题。依赖图无环。

## 取等条件

> $\displaystyle\sum_{n \in \mathbb{N}} |a_n|^2 = \|f\|^2$ **当且仅当** $f \in \overline{\operatorname{span}\{\varphi_n\}}$。

**证明（双方向）。**

($\Leftarrow$) 设 $f$ 属于 $\overline{\operatorname{span}\{\varphi_n\}}$——即存在序列 $f^{(k)} = \sum_{n \in F_k} b_n^{(k)} \varphi_n$（有限和）使 $\|f - f^{(k)}\| \to 0$。对每个 $f^{(k)}$：
$$
\|f^{(k)}\|^2 = \sum_{n \in F_k} |b_n^{(k)}|^2 \quad\text{（Pythagoras，标准正交）}.
$$
再由标准正交族上 [[fourier-coefficient|Fourier 系数]]的**唯一性**：对任意 $n$，$\langle f^{(k)}, \varphi_n\rangle \to \langle f, \varphi_n\rangle = a_n$。当 $k$ 充分大使 $n \in F_k$ 时，$b_n^{(k)} \to a_n$。由 Fatou 引理（或直接由范数连续性）：
$$
\sum_n |a_n|^2 \le \liminf_{k \to \infty} \sum_{n \in F_k} |b_n^{(k)}|^2 = \liminf_{k \to \infty} \|f^{(k)}\|^2 = \|f\|^2.
$$
但 Bessel 不等式给出反向 $\sum |a_n|^2 \le \|f\|^2$，故等号成立。

($\Rightarrow$) 设 $\sum |a_n|^2 = \|f\|^2$。回到证明第 3 步：
$$
\|f - P_F f\|^2 = \|f\|^2 - \|P_F f\|^2 = \|f\|^2 - \sum_{n \in F} |a_n|^2 \xrightarrow[|F| \to \infty]{} 0.
$$
故 $P_F f \to f$——而 $P_F f$ 始终是 $\{\varphi_n\}$ 的有限线性组合，故 $f \in \overline{\operatorname{span}\{\varphi_n\}}$。$\blacksquare$

> **Parseval 恒等式即此取等的特例**。对 Fourier 分析的标准正交基（如 $\{e^{in\theta}\}$ 在 $L^2(\mathbb{T})$），正交族的**完全性**（$\overline{\operatorname{span}\{\varphi_n\}} = H$）即 Parseval 等号对**所有** $f \in H$ 成立。故 Parseval 等价于「Fourier 基是完备正交族」（[[parseval-identity]] §叙述 4）。

## 与 Parseval 恒等式的关系

| | Bessel 不等式 | Parseval 恒等式 |
|---|---|---|
| **形式** | $\sum \|a_n\|^2 \le \|f\|^2$ | $\sum \|a_n\|^2 = \|f\|^2$ |
| **条件** | 任意标准正交族 | 标准正交族**完全**（构成基） |
| **证明所需** | Pythagoras（线性代数） | Bessel + 均方收敛（需稠密性论证） |
| **典型来源** | 内积空间公理 | Hilbert 空间的完备性 + 三角多项式稠密 |

Parseval 恒等式（[[parseval-identity]] §叙述 4）的精确含义即：**Parseval 是 Bessel 取等**；取等对所有 $f$ 成立当且仅当正交族完全。

## 应用

- [[parseval-identity]]：Bessel 不等式是 Parseval 恒等式「$\ge$ 方向」的纯线性代数论证，是 Parseval 证明第一阶段（[[parseval-identity]] §详细证明 第一阶段）的核心。
- [[orthogonal-best-approximation]]：正交最佳逼近引理给出了 $P_F f$ 的最优性，与本证明的 $P_F f$ 正交投影构造同源。
- [[riemann-lebesgue-lemma]]：取 $g = e^{in\theta}$ 应用 Bessel 不等式是 Riemann-Lebesgue 引理 $L^2$ 路径证明的核心。
- [[mean-square-convergence]]：Bessel 不等式与均方收敛衔接（$P_N f$ 收敛到 $f$），但均方收敛需附加稠密性论证（不能仅由 Bessel 推出）。
- [[finite-abelian-group|有限阿贝尔群]] / [[character]]：有限阿贝尔群上的 Parseval（Ch. 7 Thm 2.8）是 Bessel 取等，因有限和自动完全。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Fourier Analysis, Ch. 3, Theorem 1.2, p.97]]。