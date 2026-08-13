---
type: lemma
title: 复数三角不等式
aliases: [triangle inequality for complex numbers]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, inequality]
---
# 复数三角不等式

> **工作空间**：$\mathbb{C}$。

## 陈述

对任意 $z, w \in \mathbb{C}$，
$$
|z + w| \leq |z| + |w|.
$$

此外，下述不等式成立：
$$
|\operatorname{Re}(z)| \leq |z|, \quad |\operatorname{Im}(z)| \leq |z|, \quad \bigl||z| - |w|\bigr| \leq |z - w|.
$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 1, p.22]]。

## 证明

**主不等式**：由 $|z+w|^2 = (z+w)\overline{(z+w)} = |z|^2 + z\bar{w} + \bar{z}w + |w|^2 = |z|^2 + 2\operatorname{Re}(z\bar{w}) + |w|^2 \leq |z|^2 + 2|z\bar{w}| + |w|^2 = |z|^2 + 2|z||w| + |w|^2 = (|z| + |w|)^2$。开方得 $|z + w| \leq |z| + |w|$。

**反向三角不等式**：由主不等式，$|z| = |(z - w) + w| \leq |z - w| + |w|$，故 $|z| - |w| \leq |z - w|$。对称地 $|w| - |z| \leq |z - w|$，故 $\bigl||z| - |w|\bigr| \leq |z - w|$。

**实部虚部估计**：$\operatorname{Re}(z) = \frac{z + \bar{z}}{2}$，故 $|\operatorname{Re}(z)| \leq \frac{|z| + |\bar{z}|}{2} = |z|$。$\operatorname{Im}(z)$ 同理。 $\blacksquare$

## 应用

- [[cauchy-inequalities]]（推导）
- [[maximum-modulus-principle]]（用于估计 $|f|$ 在边界上的控制）
- [[phragmen-lindelof-theorem]]（指数衰减估计）
- [[multiplicativity-of-modulus]]（乘性公式推导）
