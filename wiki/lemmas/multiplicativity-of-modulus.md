---
type: lemma
title: 复数模的乘性
aliases: [multiplicativity of complex modulus, |z_1 z_2| = |z_1||z_2|]
created: 2026-08-11
updated: 2026-08-11
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, elementary]
---
# 复数模的乘性

> **工作空间**：复平面 $\mathbb{C}$。

## 陈述

> 对任意 $z_1, z_2 \in \mathbb{C}$，
> $$|z_1 z_2| = |z_1| \cdot |z_2|.$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis, Ch. 1, §1]]。

## 证明

设 $z_1 = r_1 e^{i\theta_1}$，$z_2 = r_2 e^{i\theta_2}$（极坐标表示），其中 $r_j = |z_j| \geq 0$。由复数乘法的极坐标规则，
$$
z_1 z_2 = r_1 r_2 \, e^{i(\theta_1 + \theta_2)}.
$$
取模得 $|z_1 z_2| = r_1 r_2 = |z_1| \cdot |z_2|$。

或者用代数方法：设 $z_1 = a+bi$，$z_2 = c+di$（$a,b,c,d \in \mathbb{R}$），则
$$
|z_1 z_2|^2 = |(ac-bd) + (ad+bc)i|^2 = (ac-bd)^2 + (ad+bc)^2.
$$
展开得 $(ac-bd)^2 + (ad+bc)^2 = a^2c^2 + b^2d^2 + a^2d^2 + b^2c^2 = (a^2+b^2)(c^2+d^2) = |z_1|^2 |z_2|^2$。因模非负，$|z_1 z_2| = |z_1| |z_2|$。$\blacksquare$

## 应用

- [[modulus-of-complex-exponential|复指数的模]]：$|e^z| = |e^x| \cdot |e^{iy}|$ 的推导中使用。
- [[phragmen-lindelof-theorem]]：$|F_\varepsilon(z)| = |F(z)| \cdot |e^{-\varepsilon z^{3/2}}|$ 的分解。
- [[paley-wiener-theorem]]：$|f(z)| \leq \int |\hat{f}(\xi)| \cdot |e^{2\pi i \xi z}|\, d\xi$ 的估计。
- 引用本引理的引理：[[triangle-inequality-complex]]（三角不等式用于复合估计的中间步骤）
