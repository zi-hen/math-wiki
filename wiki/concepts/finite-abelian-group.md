---
type: concept
title: 有限阿贝尔群
aliases: [finite abelian group, Z(N)]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [number-theory, group-theory, finite-groups]
strength: standard
strength_basis: 条件：有限群 $G$（任一有限阿贝尔群均可分解为循环群直积）；结论：$G$ 字符构成标准正交基。这是 FFT / DFT 的代数基础，也是 Dirichlet 定理的特征标分解所必需。
---

# 有限阿贝尔群

> **工作空间**：抽象阿贝尔群 $G$，有限 $|G| < \infty$。Stein 在 Ch. 7 §2 引入，Ch. 8 推广至 $\mathbb{Z}^*(q)$。

## What — 定义与基本事实

### 定义

**有限阿贝尔群** $G$ 是元素有限且交换的群。常以加法（$\mathbb{Z}(N) = \{0, 1, \ldots, N-1\}$）或乘法（$\mathbb{Z}^*(q) = (\mathbb{Z}/q\mathbb{Z})^*$，Dirichlet 字符）形式给出。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 7 §2.2, p.247]]。

### 基本性质

1. **基本定理**：每个有限阿贝尔群 $G$ 同构于循环群直积 $G \cong \mathbb{Z}(d_1) \times \cdots \times \mathbb{Z}(d_k)$，其中 $d_1 | d_2 | \cdots | d_k$（Ch. 7 Problem 2）。
2. **$\mathbb{Z}(N)$ 上的字符**：每个字符形如 $e_k(n) = e^{2\pi i k n / N}$（$k = 0, 1, \ldots, N-1$）。
3. **正交基**：字符 $\{e_\xi\}_{\xi \in \hat{G}}$ 在 $V = \{f: G \to \mathbb{C}\}$ 中构成完备标准正交基（Ch. 7 Theorem 2.7）。
4. **Parseval**：$\frac{1}{|G|}\sum_{a \in G} |f(a)|^2 = \sum_{e \in \hat{G}} |\hat{f}(e)|^2$。

### 结构定理应用

- **$\mathbb{Z}(N)$**：与 $N$ 次单位根的群同构。
- **$\mathbb{Z}^*(q)$**（Dirichlet 字符的对象）：$\hat{f}(\chi) = \sum_{a \in (\mathbb{Z}/q)^*} f(a) \overline{\chi(a)}$ 用于算术级数中素数无穷性证明。

## Why — 动机与直观

### 为什么引入有限阿贝尔群？

数论与 Fourier 分析的会合点：Dirichlet 算术级数素数定理通过在 $\mathbb{Z}^*(q)$ 上展开 $f$ 为字符 $\chi$ 之和来研究素数分布；FFT 算法（$O(N\log N)$）依赖 $\mathbb{Z}(N)$ 上的字符分解。

## What-if — 等价叙述

### 等价叙述

1. **加法形式**：$G = \mathbb{Z}(N)$，$e_k(n) = e^{2\pi i k n/N}$。
2. **乘法形式**：$G = \mathbb{Z}^*(q)$，$\chi(a) = e^{2\pi i k a / \varphi(q)}$。
3. **直积分解**：$G \cong \mathbb{Z}(d_1) \times \cdots \times \mathbb{Z}(d_k)$，字符为各分量字符的乘积。

**等价关系**：三个叙述**iff**（基本定理的直接推论）。

## 相关习题

- [[ch7-pb2-finite-abelian|Ch.7 Pb.2]]：结构定理 $G\cong\mathbb{Z}(d_1)\times\cdots\times\mathbb{Z}(d_k)$ 即「基本性质 1」的证明来源
- **Ch.7 Ex.13（卷积定理与 Dirac 核）**：$(\widehat{f*g})(e) = \hat f(e)\hat g(e)$；Dirac 型核 $D(c) = \sum_{e\in\widehat{G}}e(c) = |G|\,\mathbf{1}_{\{1_G\}}(c)$ 使 $S_f = f*D = f$——有限群的「好核」结构
- **Ch.7 Pb.1（中国剩余定理）**：$(n,m)=1$ 时 $\mathbb{Z}(nm)\cong\mathbb{Z}(n)\times\mathbb{Z}(m)$——有限 Fourier 分析按素数因子分解的基础（见 [[finite-abelian-decomposition|有限阿贝尔群结构定理]]）

## 关联

- 概念：[[character]]、[[good-kernel]]（有限群 Dirac 核是连续好核的类比）
- 定理：[[dirichlet-theorem-on-primes]]（Ch. 8）、[[finite-abelian-decomposition]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 7、Ch. 8）
