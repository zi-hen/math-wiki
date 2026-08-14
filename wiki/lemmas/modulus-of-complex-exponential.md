---
type: lemma
title: 复指数的模
aliases: [modulus of complex exponential, |e^z| = e^{Re(z)}]
created: 2026-08-11
updated: 2026-08-11
sources: [steinComplexAnalysis]
status: verified
tags: [complex-analysis, elementary]
---
# 复指数的模

> **工作空间**：复平面 $\mathbb{C}$。

## 陈述

> 对任意 $z \in \mathbb{C}$，
> $$|e^z| = e^{\operatorname{Re}(z)}.$$

依据 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis, Ch. 1, §1]]。

## 证明

设 $z = x + iy$，其中 $x = \operatorname{Re}(z)$，$y = \operatorname{Im}(z)$。由复指数的定义，
$$
e^z = e^{x+iy} = e^x \cdot e^{iy}.
$$
由 Euler 公式，$e^{iy} = \cos y + i\sin y$，故 $|e^{iy}| = \sqrt{\cos^2 y + \sin^2 y} = 1$。又因 $e^x > 0$（$x \in \mathbb{R}$），$|e^x| = e^x$。由复数模的乘性（[[multiplicativity-of-modulus|模的乘性]]），
$$
|e^z| = |e^x| \cdot |e^{iy}| = e^x \cdot 1 = e^{\operatorname{Re}(z)}.
$$
$\blacksquare$

> **依赖关系小结**：本证明依赖链为「复指数的定义（$e^z = e^x e^{iy}$）+ Euler 公式（$e^{iy}=\cos y+i\sin y$）与三角恒等式 $\cos^2 y + \sin^2 y = 1$ ⇒ $|e^{iy}|=1$ ⇒ [[multiplicativity-of-modulus|模的乘性]] ⇒ $|e^z| = e^{\operatorname{Re}(z)}$」。Euler 公式可视为复指数定义的一部分，[[multiplicativity-of-modulus|模的乘性]] 为独立初等引理（其对本页的引用位于「应用」区段，不构成证明依赖），无定理级依赖，本质自足。依赖图无环。

## 应用

- [[phragmen-lindelof-theorem]]：估计辅助函数 $|F_\varepsilon(z)| = |F(z)| \cdot |e^{-\varepsilon z^{3/2}}|$ 时，将 $|e^{-\varepsilon z^{3/2}}|$ 化为 $e^{-\varepsilon \operatorname{Re}(z^{3/2})}$。
- [[paley-wiener-theorem]]：在逆向定理证明中，估计 $|e^{2\pi i \xi z}| = e^{-2\pi \xi \operatorname{Im}(z)}$ 以获得指数型增长界。
