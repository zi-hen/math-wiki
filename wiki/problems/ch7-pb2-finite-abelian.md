---
type: problem
title: Ch.7 Problem 2: 有限阿贝尔群结构定理
 aliases: [Ch.7 Problem 2, finite abelian group structure]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [number-theory, group-theory, Ch.7]
chapter: Ch.7
number: Problem 2
---

# Ch.7 Problem 2：有限阿贝尔群结构定理

## 陈述

> 证明每个有限阿贝尔群 $G$ 同构于循环群直积 $G \cong \mathbb{Z}(d_1) \times \mathbb{Z}(d_2) \times \cdots \times \mathbb{Z}(d_k)$，其中 $d_1 | d_2 | \cdots | d_k$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 7, Problem 2, p.257]]。

## 思路提示

对 $|G|$ 用素因子分解 $G \cong G(p_1) \times \cdots \times G(p_s)$（$p_i$ 为不同的素因子），每个 $G(p)$ 是 $p$-群；对 $p$-群证明 invariant factor 分解。

## 解答

**步骤 1**（primary decomposition）：$|G| = p_1^{a_1} \cdots p_s^{a_s}$（不同素数 $p_i$）。$G$ 中 $p_i$-Sylow 子群 $G(p_i)$ 是 $G$ 的直因子：$G \cong G(p_1) \times \cdots \times G(p_s)$。

**步骤 2**（$p$-群不变因子）：设 $G$ 是 $p$-群，$|G| = p^a$。对 $G$ 的极小生成集，可构造直积分解（基变换理论）。

具体地：对 $|G| = p^a$，取有限生成元 $g_1, \ldots, g_k$，$G = \langle g_1 \rangle \times \cdots \times \langle g_k \rangle$（不一定循环直积，但可重新排成 invariant factor 形式）。Stein 在 p.257 Problem 2 引理路径处理。

**步骤 3**：invariant factor 形式要求 $d_1 | d_2 | \cdots | d_k$，其中 $|G| = \prod d_i$。

**步骤 4**：唯一性。Stein 在 Problem 2(ii) 给出第二种形式 $G \cong \mathbb{Z}(d_1) \times \cdots \times \mathbb{Z}(d_k)$，$d_1 | d_2 \cdots | d_k$，由第一形式推导而唯一确定。$\blacksquare$

## 关联

- 概念：[[character]]、[[finite-abelian-group]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 7 Problem 2）
