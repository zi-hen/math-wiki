---
type: concept
title: $\ell^p$ 空间
aliases: [ellp space, lp 序列空间, little-lp space]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, real-analysis]
strength: standard
strength_basis: 弱条件 + 标准结论。条件：序列 $\{a_n\}$ 满足 $\sum |a_n|^p < \infty$（弱——仅要求级数收敛）；结论：完备赋范空间（$\ell^2$ 为 Hilbert 空间），是 Fourier 系数、离散 Fourier 分析的标准框架。与 $L^p$ 空间指称不同——$L^p$ 定义于测度空间上的函数，$\ell^p$ 定义于可数指标集上的序列。
---
# $\ell^p$ 空间

> **工作空间**：$\mathbb{Z}$（双无限序列）或 $\mathbb{N}$（单无限序列）。本书主要使用 $\ell^p(\mathbb{Z})$（Fourier 系数所在）。

## 与 $L^p$ 空间的区分

$\ell^p$（小写 l）与 $L^p$（大写 L）是两个**指称不同**的 Banach 空间，不可混用：

| 空间 | 元素 | 范数 | 适用对象 |
|------|------|------|----------|
| $L^p(X, \mu)$ | 测度空间 $(X, \mu)$ 上的可测函数 | $\|f\|_{L^p} = \left(\int_X \lvert f\rvert^p\,d\mu\right)^{1/p}$ | 连续函数空间 |
| $\ell^p(I)$ | 可数指标集 $I$ 上的序列 $\{a_n\}_{n \in I}$ | $\|(a_n)\|_{\ell^p} = \left(\sum_{n \in I} \lvert a_n\rvert^p\right)^{1/p}$ | 离散指标 |

详见 [[lp-space|$L^p$ 空间]]。

在 Fourier 分析中两者通过 Fourier 系数自然关联：

- $f \in L^2(\mathbb{T}) \Rightarrow \{\hat{f}(n)\}_{n \in \mathbb{Z}} \in \ell^2(\mathbb{Z})$
- $f \in L^2(\mathbb{R}) \Rightarrow \hat{f} \in L^2(\mathbb{R})$（频域仍是函数空间）
- $f \in L^p(\mathbb{T}) \Rightarrow \{\hat{f}(n)\}_{n \in \mathbb{Z}} \in \ell^q(\mathbb{Z})$，$\frac{1}{p} + \frac{1}{q} = 1$（Hausdorff–Young 不等式）

## 定义

设 $1 \leq p < \infty$。$\ell^p(\mathbb{Z})$ 是满足下式之**复值**序列 $(a_n)_{n \in \mathbb{Z}}$ 的集合：

$$
\|a\|_{\ell^p} = \left(\sum_{n \in \mathbb{Z}} |a_n|^p\right)^{1/p} < \infty.
$$

特例：

- $\ell^1$：绝对可和序列，$\|a\|_1 = \sum_n |a_n|$。Fourier 系数若属 $\ell^1$ 则 Fourier 级数绝对一致收敛到原函数。
- $\ell^2$：平方可和序列，构成 Hilbert 空间，内积 $(a, b) = \sum_n a_n \overline{b_n}$。Riesz–Fischer 定理：每个 $\ell^2$ 序列恰对应唯一的 $L^2(\mathbb{T})$ 等价类。
- $\ell^\infty$：有界序列，$\|a\|_\infty = \sup_n |a_n|$。

**Stein 约定**：范数记为 $\|a\|_{\ell^p}$ 或简写 $\|a\|_p$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3 §1]]。

## 动机与背景

$\ell^p$ 在 Fourier 分析中的角色有两层：

1. **Fourier 系数的归宿**：若 $f \in L^p(\mathbb{T})$，则其 Fourier 系数构成序列 $\hat{f} \in \ell^{p'}(\mathbb{Z})$（$p'$ 为 $p$ 的共轭指标）。圆群上的 Fourier 分析本质上是 $\ell^p$ 序列理论。
2. **离散 Fourier 分析的对象**：有限群 $\mathbb{Z}(N)$ 上的函数空间是 $\ell^p(\mathbb{Z}/N\mathbb{Z})$；无限离散群 $\mathbb{Z}$ 上的函数空间是 $\ell^p(\mathbb{Z})$。

## 性质

- **完备性**：$\ell^p$ 对 $1 \leq p \leq \infty$ 是 Banach 空间；$\ell^2$ 是 Hilbert 空间。
- **Hölder 不等式**：若 $a \in \ell^p$，$b \in \ell^q$，$\frac{1}{p} + \frac{1}{q} = 1$，则
$$
\sum_n |a_n b_n| \leq \|a\|_p \|b\|_q.
$$
（详见 [Claim 1](#详细证明ellp-标准性质)。）
- **稠密性**：
  - 有限支撑序列 $c_{00}(\mathbb{Z})$ 在 $\ell^p$ 中稠密（$1 \leq p < \infty$，详见 [Claim 2](#详细证明ellp-标准性质)）。
  - $\mathbb{Z}$ 上的 Schwartz 序列 $s(\mathbb{Z}) = \{a \in \mathbb{C}^\mathbb{Z} : \sup_n |n|^k |a_n| < \infty \text{ 对所有 } k \geq 0\}$ 在 $\ell^p$ 中稠密（$1 \leq p < \infty$）。
- **Riesz–Fischer 定理**：映射 $f \in L^2(\mathbb{T}) \mapsto \{\hat{f}(n)\}_{n \in \mathbb{Z}} \in \ell^2(\mathbb{Z})$ 是等距同构。见 [[parseval-identity|Parseval 恒等式]]（两者等价, Ch. 3 Theorem 1.3）。
- **Hausdorff–Young 不等式**：若 $f \in L^p(\mathbb{T})$（$1 \leq p \leq 2$），则 $\hat{f} \in \ell^{p'}(\mathbb{Z})$，$\frac{1}{p} + \frac{1}{p'} = 1$（依赖 [[lp-space|Claim 1 (Hölder)]] + [[mean-square-convergence|均方收敛]] + 复插值）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3 §1.2（Parseval 与 Riesz-Fischer），Ch. 4 §1（Hausdorff-Young）]]。

### 详细证明（$\ell^p$ 标准性质）

以下逐条证明 [[parseval-identity|Parseval]] 与 [[mean-square-convergence|均方收敛]]所依赖的 $\ell^p$ 关键事实, 仅依赖非负项求和与初等不等式, **不依赖 Parseval 或 Fourier 反演本身**.

**Claim 1**（Hölder 不等式）. 对 $1 \le p, q \le \infty$, $\frac{1}{p} + \frac{1}{q} = 1$, $a \in \ell^p$, $b \in \ell^q$, 有
$$
\sum_n |a_n b_n| \le \|a\|_p \|b\|_q.
$$

*证明.* 不妨 $\|a\|_p, \|b\|_q > 0$. 由 Young 不等式 $uv \le u^p/p + v^q/q$（$u, v \ge 0$）, 取 $u = |a_n|/\|a\|_p$, $v = |b_n|/\|b\|_q$:
$$
\frac{|a_n b_n|}{\|a\|_p \|b\|_q} \le \frac{|a_n|^p}{p \|a\|_p^p} + \frac{|b_n|^q}{q \|b\|_q^q}.
$$
对 $n$ 求和: $\sum_n \frac{|a_n b_n|}{\|a\|_p \|b\|_q} \le \frac{1}{p} + \frac{1}{q} = 1$. 故 $\sum_n |a_n b_n| \le \|a\|_p \|b\|_q$. $\blacksquare$

**Claim 2**（$c_{00}$ 在 $\ell^p$ 中稠密, $1 \le p < \infty$）. 对任意 $a \in \ell^p$ 与 $\varepsilon > 0$, 存在 $b \in c_{00}(\mathbb Z)$（有限支撑序列）使 $\|a - b\|_{\ell^p} < \varepsilon$.

*证明.* 因 $a \in \ell^p$, $\sum |a_n|^p < \infty$. 取 $N$ 充分大使 $\sum_{|n| > N} |a_n|^p < \varepsilon^p$. 令 $b_n = a_n$ 对 $|n| \le N$, $b_n = 0$ 对 $|n| > N$. 则 $b \in c_{00}$ 且
$$
\|a - b\|_p^p = \sum_{|n| > N} |a_n|^p < \varepsilon^p. \qquad\blacksquare
$$

**Claim 3**（$\ell^2$ 内积与内积空间）. $\ell^2$ 在内积 $(a, b) = \sum_n a_n \overline{b_n}$ 下为 Hilbert 空间; Cauchy-Schwarz $|(\a, b)| \le \|a\|_2 \|b\|_2$ 由 Claim 1 取 $p = q = 2$ 立得.

> **附注**: 上述证明仅依赖非负项求和与 Young 不等式, **不依赖 Parseval 或 Fourier 反演**. 圆群 Parseval 与均方收敛依赖这些 $\ell^p$ 性质 + [[fourier-series|Fourier 级数]]基本性质（部分和 = Dirichlet 卷积）+ [[good-kernel|好核逼近]]建立 $\ell^2$ 上的等距性.

## 与 $L^p$ 的对偶关系

Fourier 系数映射 $f \mapsto \{\hat{f}(n)\}$ 是 $L^p(\mathbb{T})$ 与 $\ell^{p'}(\mathbb{Z})$ 之间的桥梁。常用形式：

| $f$ 所在 | $\hat{f}$ 所在 | 名称 |
|----------|----------------|------|
| $L^1(\mathbb{T})$ | $c_0(\mathbb{Z})$（趋于零的序列） | Riemann–Lebesgue 引理 |
| $L^2(\mathbb{T})$ | $\ell^2(\mathbb{Z})$ | Riesz–Fischer 定理 |
| $L^p(\mathbb{T})$（$1 < p < 2$） | $\ell^{p'}(\mathbb{Z})$ | Hausdorff–Young 不等式 |
| $L^\infty(\mathbb{T})$ | $\mathrm{BMO}(\mathbb{Z})$ | 非线性对偶 |

详见 [[fourier-series]] 中 Fourier 系数部分。

## 关联

- 概念：[[lp-space]]（函数空间 $L^p$——不可与 $\ell^p$ 混用）。
- 概念：[[fourier-series]]（圆群上 Fourier 分析的核心，$f \in L^p \Leftrightarrow \hat{f} \in \ell^{p'}$）。
- 概念：[[fourier-transform]]（实直线 Fourier 变换的频域仍在 $L^p$，序列空间不直接出现）。
- 概念：[[schwartz-space]]（连续版的 $\mathcal{S}$；离散版的 Schwartz 序列是 $s(\mathbb{Z}) \subset \ell^p$）。

## 典型反例 / 边界

- **$\ell^p \not\subset \ell^q$（$p < q$）**：序列 $a_n = 1/n^{1/p}$ 属于 $\ell^p$ 但不属于 $\ell^q$（$q > p$）；逆方向 $\ell^p \subset \ell^q$（$p > q$）。
- **绝对收敛 vs 平方收敛**：$\ell^1 \subsetneq \ell^2$——存在 $\ell^2$ 序列（如 $a_n = 1/n$）不绝对收敛。
- **Bessel 不等式**（Ch. 3）：对任意 $f \in L^2(\mathbb{T})$，$\sum_n |\hat{f}(n)|^2 \leq \|f\|_{L^2}^2$。严格不等式仅在 Fourier 级数不闭合时出现（如有限和截断 $S_N$）。

## 等价叙述

### 叙述 1（加权 $\ell^p$ 空间）

> 在某些应用中需引入权重：$\ell^p_w = \{a : \sum_n w_n |a_n|^p < \infty\}$。如 $\ell^p(h\mathbb{Z})$ 对应采样间隔为 $h$ 的离散信号空间。

### 叙述 2（有限维 $\ell^p_N$）

> $\mathbb{Z}(N)$ 上的函数空间是 $\ell^p(\mathbb{Z}/N\mathbb{Z})$（有限维）。有限维时所有 $\ell^p$ 范数等价（维数常数不同），但无穷维时不等价。

### 叙述 3（与 Banach 格的对偶）

> $\ell^p$ 是序列空间 $\ell^\infty$ 的对偶格之一。Banach 格理论中 $\ell^p$ 与 $L^p$ 的对偶结构对应。

## 证明难度差异

### 叙述 1（Riesz–Fischer）的证明

- **方法**：Bessel 不等式 + 完备化论证。
- **难度**：**低至中**——Stein Ch. 3 Theorem 1.2 仅依赖 Fejér 定理与 $L^2$ 收敛。
- **结论**：$L^2(\mathbb{T}) \cong \ell^2(\mathbb{Z})$ 为 Hilbert 同构。

### 叙述 2（Hausdorff–Young）的证明

- **方法**：Riesz–Thorin 插值定理（在 $L^1 \to \ell^\infty$ 与 $L^2 \to \ell^2$ 间插值）。
- **难度**：**高**——需测度论与插值理论，超出 Stein Fourier 卷范围。
- **结论**：$L^p \to \ell^{p'}$ 对 $1 \leq p \leq 2$ 成立。

**总评**：本 wiki 覆盖 Stein 框架（叙述 1）；叙述 2 在 Real Analysis 卷与调和分析专门著作中详述。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 3 §1（Parseval / Riesz-Fischer）]]
- [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验）]]
- 相关页面：[[lp-space]]（函数空间 $L^p$）