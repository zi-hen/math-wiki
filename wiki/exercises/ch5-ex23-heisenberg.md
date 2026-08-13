---
type: exercise
title: Ch.5 Exercise 23: Heisenberg 不确定性原理的 Hermite 算子法
 aliases: [Ch.5 Ex.23, Heisenberg Hermite 算子]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, quantum-mechanics, Ch.5]
chapter: Ch.5
number: Ex.23
---

# Ch.5 Exercise 23：Heisenberg 不确定性原理的 Hermite 算子法

## 陈述

> 定义 Hermite 算子 $L = -d^2/dx^2 + x^2$，湮灭算子 $A = d/dx + x \cdot$，产生算子 $A^* = -d/dx + x \cdot$，内积 $(f, g) = \int f \bar g$。
> (a) 证明 Heisenberg 不确定性原理蕴含 $L \geq I$。
> (b) 证明 $A^*A = L - I$，并由此推出 Heisenberg 不确定性原理。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 5, Exercise 23, p.186]]。

## 思路提示

(a) 由 Heisenberg 与 Plancherel 直接做两次分部积分。(b) 直接计算 $(d/dx + x)(-d/dx + x)$ 与 $L - I$。

## 解答

**(a) Heisenberg ⇒ $L \geq I$**

由 Heisenberg 不确定性原理（[[heisenberg-uncertainty-principle]] 叙述 1）：
$$
\int |f'|^2 \cdot \int x^2 |f|^2 \geq \frac{1}{4} \left(\int |f|^2\right)^2, \quad f \in \mathcal{S}.
$$

由 [[plancherel-theorem|Plancherel]]，$\int |f'|^2 = \int (2\pi\xi)^2 |\hat f|^2 = 4\pi^2 \int \xi^2 |\hat f|^2$。

代入即得：
$$
\int (4\pi^2 \xi^2 + x^2)|\psi(x)|^2 dx \cdot \int |\psi|^2 dx \geq \frac{1}{4} \cdot 4\pi^2 \left(\int |\psi|^2\right)^2.
$$
整理得 $(L\psi, \psi) \geq (\psi, \psi)$，即 $L \geq I$。

**(b) 算子分解 $A^*A = L - I$**

直接计算：
$$
A^* A f = \left(-\frac{d}{dx} + x\right)\left(\frac{d}{dx} + x\right) f = -f'' + (-x \cdot x) f + \text{...}
$$

具体地，对 $C^\infty$ 函数：
$$
A^* A f = \left(-\frac{d}{dx} + x\right)(f' + x f) = -f'' - x f + f' + x f' + x f = -f'' + x^2 f - f = L f - f.
$$

故 $A^*A = L - I$。

由 $\langle A^*A f, f\rangle = \langle A f, A f\rangle = \|Af\|^2 \geq 0$，故 $(L f, f) = \|A f\|^2 + (f, f) \geq (f, f)$，即 $L \geq I$。

**反向重证 Heisenberg**：取 $A_t = d/dx + t x \cdot$，$A_t^* = -d/dx + t x \cdot$。$(A_t^* A_t f, f) \geq 0$ 视为 $t$ 的二次多项式 $\geq 0$，判别式 $\le 0$ 给出 Heisenberg。$\blacksquare$

## 关联

- 概念：[[schwartz-space|Schwartz 空间]]（$\mathcal{S}$）
- 定理：[[heisenberg-uncertainty-principle]]
- 方法：[[multiplication-formula-trick]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 5 Exercise 23）
