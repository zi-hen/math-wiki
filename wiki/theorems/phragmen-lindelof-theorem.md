---
type: theorem
title: Phragmén-Lindelöf 定理（扇形版本）
aliases: [Phragmén-Lindelöf theorem, Theorem 3.4]
created: 2026-08-11
updated: 2026-08-11
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, phragmen-lindelof, maximum-modulus-principle]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$F$ 在扇形内全纯 + 指数增长 $|F(z)| \leq Ce^{c|z|}$（弱——允许指数增长，不要求有界）；结论：$|F(z)| \leq 1$ 在整个扇形内成立（强——从边界控制推出内部控制）。此定理将最大模原理从有界区域推广到无界区域，是证明 [[paley-wiener-theorem|Paley-Wiener 逆向定理]]（Theorem 3.3）的关键工具。
---
# Phragmén-Lindelöf 定理（扇形版本）

> **工作空间**：扇形 $S = \{z \in \mathbb{C} : -\pi/4 < \arg z < \pi/4\}$。

## 定理的逻辑定位

在 Stein《Complex Analysis》第 4 章 §3 中，本定理（Theorem 3.4）的逻辑定位如下：

```
§1: 类 F 的定义（速降函数空间）
    ↓
§2: Fourier 变换是 F 上的自同构
    ↓
§3, Theorem 3.1: Paley-Wiener 正向（全纯延拓 + 中速下降 ⇒ F̂ 紧支集）
    ↓
§3, Theorem 3.4: Phragmén-Lindelöf 定理（扇形上的最大模原理推广）  ← 本页
    ↓
§3, Theorem 3.3: Paley-Wiener 逆向（F̂ 紧支集 ⇒ 全纯延拓为指数型整函数，由 Thm 3.4 证明）
```

Theorem 3.4 是证明 Theorem 3.3 的工具。在 Theorem 3.4 的证明中构造的辅助函数 $F_\varepsilon$ 的快速下降是证明的核心机制。

## What — 定理陈述

### Theorem 3.4（Phragmén-Lindelöf 定理，扇形版本）

> 设 $F$ 为扇形 $S = \{z \in \mathbb{C} : -\pi/4 < \arg z < \pi/4\}$ 内的全纯函数，在闭包 $\bar{S}$ 上连续。假设：
> 1. $|F(z)| \leq 1$ 在扇形边界 $\partial S$ 上；
> 2. 存在常数 $C, c > 0$ 使得 $|F(z)| \leq C e^{c|z|}$ 对所有 $z \in S$ 成立。
>
> 则 $|F(z)| \leq 1$ 对所有 $z \in S$ 成立。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Complex Analysis, Ch. 4, §3, Theorem 3.4, p.143]]。

### 条件分析

| 条件 | 强度 | 说明 |
|------|------|------|
| $F$ 在 $S$ 内全纯，在 $\bar{S}$ 上连续 | 标准 | 全纯函数的基本正则性要求 |
| $\|F\| \leq 1$ 在 $\partial S$ 上 | 边界控制 | 与有界区域最大模原理的假设相同 |
| $\|F(z)\| \leq Ce^{c\|z\|}$ | 增长限制 | **关键附加条件**——排除超指数增长函数 |

## Why — 动机与证明思路

### 动机：最大模原理的局限

最大模原理断言：有界区域上的全纯函数在边界上取到最大模。但无界区域上此结论一般不成立。

**反例**：$F(z) = e^{z^2}$ 在扇形 $S = \{|\arg z| < \pi/4\}$ 的边界上模为 $1$，但在内部（实轴上）无界增长。

Phragmén-Lindelöf 定理的核心思想：**若附加增长条件**（$|F(z)| \leq Ce^{c|z|}$），则最大模原理仍然成立。增长条件排除了 $e^{z^2}$ 这样的超指数增长函数。

### 证明的核心构造：辅助函数 $F_\varepsilon$

证明关键在于构造辅助函数

$$
F_\varepsilon(z) = F(z)\, e^{-\varepsilon z^{3/2}}, \qquad \varepsilon > 0.
$$

其中 $z^{3/2}$ 取主分支（在扇形 $\{|\arg z| < \pi/4\}$ 内良定义）。指数 $3/2$ 的选取满足 $1 < 3/2 < 2$，其中 $1$ 为增长条件 $|F(z)| \leq Ce^{c|z|}$ 的阶，$2 = \pi/(2\alpha)$（$\alpha = \pi/4$ 为扇形半角）为临界指数。$F_\varepsilon$ 在闭扇形 $\bar{S}$ 中**一致快速下降**（即当 $|z| \to \infty$ 时 $|F_\varepsilon(z)| \to 0$ 在 $\bar{S}$ 上一致成立），原因如下。

#### 关键几何事实：闭扇形中 $\operatorname{Re}(z^{3/2}) > 0$

设 $z = r e^{i\theta}$，$|\theta| \leq \pi/4$。则

$$
z^{3/2} = r^{3/2} e^{3i\theta/2}, \qquad \operatorname{Re}(z^{3/2}) = r^{3/2} \cos(3\theta/2).
$$

当 $|\theta| \leq \pi/4$ 时，$|3\theta/2| \leq 3\pi/8 < \pi/2$，故 $\cos(3\theta/2) \geq \cos(3\pi/8) > 0$。因此

$$
\operatorname{Re}(z^{3/2}) = r^{3/2} \cos(3\theta/2) \geq r^{3/2} \cos(3\pi/8) > 0 \quad (z \in \bar{S},\ r > 0).
$$

**注**：选取 $3/2$ 而非临界指数 $2$ 的关键优势在于 $\cos(3\pi/8) > 0$ 严格成立，而 $\cos(2 \cdot \pi/4) = \cos(\pi/2) = 0$。因此 $e^{-\varepsilon z^{3/2}}$ 在**闭扇形**上（含边界）一致衰减，而 $e^{-\varepsilon z^2}$ 仅在开扇形内部衰减，边界上模为 $1$。

#### $e^{-\varepsilon z^{3/2}}$ 的指数衰减

由上述事实，

$$
|e^{-\varepsilon z^{3/2}}| = e^{-\varepsilon \operatorname{Re}(z^{3/2})} = e^{-\varepsilon r^{3/2} \cos(3\theta/2)}.
$$

因 $\cos(3\theta/2) \geq \cos(3\pi/8) > 0$（$|\theta| \leq \pi/4$），当 $r = |z| \to \infty$ 时，

$$
|e^{-\varepsilon z^{3/2}}| \leq e^{-\varepsilon r^{3/2} \cos(3\pi/8)} \to 0 \quad \text{（一致指数衰减）}.
$$

#### $F_\varepsilon$ 的一致快速下降

$F$ 满足增长条件 $|F(z)| \leq Ce^{c|z|}$，而 $e^{-\varepsilon z^{3/2}}$ 以 $e^{-\varepsilon r^{3/2} \cos(3\theta/2)}$ 衰减。因 $r^{3/2}$ 增长远快于 $r$（$3/2 > 1$），指数衰减项 $e^{-\varepsilon r^{3/2} \cos(3\pi/8)}$ 压制指数增长项 $Ce^{cr}$，故

$$
|F_\varepsilon(z)| = |F(z)| \cdot |e^{-\varepsilon z^{3/2}}| \leq Ce^{cr} \cdot e^{-\varepsilon r^{3/2} \cos(3\pi/8)} \to 0 \quad (r \to \infty).
$$

此衰减在闭扇形 $\bar{S}$ 上**一致**成立（因 $\cos(3\theta/2) \geq \cos(3\pi/8) > 0$），即 $F_\varepsilon$ 在 $\bar{S}$ 中一致快速下降。

### 证明的三步结构

1. **$F_\varepsilon$ 在扇形边界上严格受控**：在边界 $\arg z = \pm\pi/4$ 处，$\operatorname{Re}(z^{3/2}) = r^{3/2}\cos(3\pi/8) > 0$，故 $|e^{-\varepsilon z^{3/2}}| = e^{-\varepsilon r^{3/2}\cos(3\pi/8)} < 1$（$r > 0$），从而 $|F_\varepsilon| < |F| \leq 1$。

2. **$F_\varepsilon$ 在有界扇形上适用最大模原理**：因 $F_\varepsilon \to 0$ **一致**（$|z| \to \infty$，在 $\bar{S}$ 上），取充分大的 $R$，在 $\bar{S} \cap \{|z| \leq R\}$（有界区域）上，$|F_\varepsilon|$ 的最大值在边界上取到。在扇形边界上 $|F_\varepsilon| \leq 1$；在弧 $|z| = R$ 上，$R$ 充分大时 $|F_\varepsilon| < 1$（一致衰减保证）。故 $|F_\varepsilon(z)| \leq 1$。

3. **令 $\varepsilon \to 0$**：$F_\varepsilon(z) = F(z) e^{-\varepsilon z^{3/2}} \to F(z)$ 逐点收敛，故 $|F(z)| \leq 1$。

### 详细证明

#### 证明动机

最大模原理在有界区域上成立，但扇形 $S$ 是无界区域，无法直接应用。核心困难在于：当 $|z| \to \infty$ 时，$F$ 可能增长（虽受 $|F(z)| \leq Ce^{c|z|}$ 约束），使得有界区域上的最大模论证无法直接传递到无界情形。突破点在于构造辅助函数 $F_\varepsilon(z) = F(z) e^{-\varepsilon z^{3/2}}$，其中 $e^{-\varepsilon z^{3/2}}$ 的衰减速率 $e^{-\varepsilon r^{3/2}}$ 压制 $F$ 的增长 $e^{cr}$（因 $3/2 > 1$），使 $F_\varepsilon$ 在闭扇形 $\bar{S}$ 中一致快速下降。从而可在有界扇形 $\bar{S} \cap \{|z| \leq R\}$ 上应用最大模原理，再令 $\varepsilon \to 0$ 恢复 $F$。

#### 详细证明

**第一阶段：构造辅助函数 $F_\varepsilon$**。

设 $\varepsilon > 0$。定义
$$
F_\varepsilon(z) = F(z)\, e^{-\varepsilon z^{3/2}}, \qquad z \in \bar{S},
$$
其中 $z^{3/2}$ 取主分支（在扇形 $\{|\arg z| \leq \pi/4\}$ 内，$|\arg z| < \pi$，故主分支 $z^{3/2} = r^{3/2} e^{3i\theta/2}$ 良定义且全纯）。

因 $F$ 在 $S$ 内全纯、$e^{-\varepsilon z^{3/2}}$ 在 $S$ 内全纯（$z^{3/2}$ 在 $S$ 内全纯），故 $F_\varepsilon$ 在 $S$ 内全纯，在 $\bar{S}$ 上连续。

**第二阶段：$F_\varepsilon$ 在闭扇形上的一致快速下降**。

设 $z = re^{i\theta} \in \bar{S}$，即 $|\theta| \leq \pi/4$，$r \geq 0$。则
$$
z^{3/2} = r^{3/2}\, e^{3i\theta/2}, \qquad \operatorname{Re}(z^{3/2}) = r^{3/2} \cos(3\theta/2).
$$

**Claim 1**（$\operatorname{Re}(z^{3/2}) > 0$ 在闭扇形上成立）. 对所有 $z = re^{i\theta} \in \bar{S}$（$|\theta| \leq \pi/4$，$r > 0$），
$$
\operatorname{Re}(z^{3/2}) = r^{3/2} \cos(3\theta/2) \geq r^{3/2} \cos(3\pi/8) > 0.
$$

*证明.* 当 $|\theta| \leq \pi/4$ 时，$|3\theta/2| \leq 3\pi/8 < \pi/2$。因 $\cos$ 在 $[0, \pi/2)$ 上严格递减且为正，$\cos(3\theta/2) \geq \cos(3\pi/8) > 0$（其中 $\cos(3\pi/8) = \cos(67.5°) \approx 0.383$）。因此 $\operatorname{Re}(z^{3/2}) \geq r^{3/2} \cos(3\pi/8) > 0$。$\blacksquare$

由 Claim 1，
$$
|e^{-\varepsilon z^{3/2}}| = e^{-\varepsilon \operatorname{Re}(z^{3/2})} \leq e^{-\varepsilon r^{3/2} \cos(3\pi/8)}. \tag{1}
$$
结合增长条件 $|F(z)| \leq Ce^{c|z|} = Ce^{cr}$，
$$
|F_\varepsilon(z)| = |F(z)| \cdot |e^{-\varepsilon z^{3/2}}| \leq Ce^{cr} \cdot e^{-\varepsilon r^{3/2} \cos(3\pi/8)}. \tag{2}
$$

**Claim 2**（$F_\varepsilon$ 的一致快速下降）. 对任意 $\varepsilon > 0$，
$$
|F_\varepsilon(z)| \to 0 \quad \text{当 } |z| \to \infty, \text{ 在 } \bar{S} \text{ 上一致成立}.
$$

*证明.* 由 (2)，$|F_\varepsilon(z)| \leq C \exp(cr - \varepsilon r^{3/2} \cos(3\pi/8))$。因 $3/2 > 1$，当 $r \to \infty$ 时 $r^{3/2}$ 增长远快于 $r$，故指数 $cr - \varepsilon r^{3/2} \cos(3\pi/8) \to -\infty$。具体地，存在 $R_0 > 0$ 使得 $r \geq R_0$ 时 $\varepsilon r^{3/2} \cos(3\pi/8) \geq 2cr$，从而 $cr - \varepsilon r^{3/2} \cos(3\pi/8) \leq -cr \to -\infty$。此估计中 $\cos(3\pi/8)$ 为正常数，不依赖 $\theta$，故衰减在 $\bar{S}$ 上一致成立。$\blacksquare$

**第三阶段：$F_\varepsilon$ 在扇形边界上严格受控**。

在边界 $\partial S$ 上，即 $\arg z = \pm\pi/4$。由假设 $|F(z)| \leq 1$ 在 $\partial S$ 上。由 Claim 1，$\operatorname{Re}(z^{3/2}) = r^{3/2}\cos(3\pi/8) > 0$（$r > 0$），故
$$
|F_\varepsilon(z)| = |F(z)| \cdot e^{-\varepsilon \operatorname{Re}(z^{3/2})} \leq 1 \cdot e^{-\varepsilon r^{3/2} \cos(3\pi/8)} < 1, \qquad z \in \partial S,\ r > 0. \tag{3}
$$
在 $z = 0$ 处，$|F_\varepsilon(0)| = |F(0)| \leq 1$（由连续性，边界值在原点也受控）。

**第四阶段：在有界扇形上应用最大模原理**。

由 Claim 2，取 $R > 0$ 充分大，使得 $|F_\varepsilon(z)| \leq 1$ 对所有 $z \in \bar{S} \cap \{|z| = R\}$ 成立。考虑有界闭区域
$$
\Omega_R = \bar{S} \cap \{|z| \leq R\}.
$$

$F_\varepsilon$ 在 $\Omega_R$ 的内部全纯，在 $\Omega_R$ 上连续。$\Omega_R$ 的边界由两部分组成：
- 扇形边界 $\partial S \cap \{|z| \leq R\}$：由 (3)，$|F_\varepsilon| \leq 1$；
- 弧 $\{|z| = R\} \cap \bar{S}$：由 $R$ 的选取，$|F_\varepsilon| \leq 1$。

由最大模原理（[[steinComplexAnalysis|Stein, Ch. 1, Theorem 4.2]]），$|F_\varepsilon|$ 在 $\Omega_R$ 上的最大值在边界上取到，故
$$
|F_\varepsilon(z)| \leq 1, \qquad \forall\, z \in \Omega_R. \tag{4}
$$

**第五阶段：令 $R \to \infty$（固定 $\varepsilon$）**。

对任意固定的 $z \in S$，取 $R > |z|$，则 $z \in \Omega_R$，由 (4) 得 $|F_\varepsilon(z)| \leq 1$。因 $R$ 可任意大，此不等式对所有 $z \in S$ 成立。

**第六阶段：令 $\varepsilon \to 0$**。

对任意 $z \in S$，$F_\varepsilon(z) = F(z)\, e^{-\varepsilon z^{3/2}}$。当 $\varepsilon \to 0^+$ 时，$e^{-\varepsilon z^{3/2}} \to 1$（逐点收敛），故 $F_\varepsilon(z) \to F(z)$。由第五阶段，$|F_\varepsilon(z)| \leq 1$ 对所有 $\varepsilon > 0$ 成立。令 $\varepsilon \to 0^+$，得
$$
|F(z)| = \lim_{\varepsilon \to 0^+} |F_\varepsilon(z)| \leq 1, \qquad \forall\, z \in S. \qquad \blacksquare
$$

### 反例 $F(z) = e^{z^2}$ 的详细分析

在扇形边界 $\arg z = \pm\pi/4$ 上：

$$
z^2 = r^2 e^{\pm i\pi/2} = \pm ir^2 \quad \text{（纯虚数）}, \qquad |e^{z^2}| = e^{\operatorname{Re}(z^2)} = e^0 = 1.
$$

但在实轴上（$\theta = 0$）：

$$
z^2 = r^2 > 0, \qquad |e^{z^2}| = e^{r^2} \to \infty \quad (r \to \infty).
$$

$e^{z^2}$ 的增长速率为 $e^{r^2}$，超过指数增长条件 $Ce^{cr}$（因 $r^2$ 增长远快于 $r$），因此不满足 Theorem 3.4 的假设。这解释了为什么指数增长条件是必要的。

### 在 Paley-Wiener 逆向定理证明中的应用

[[paley-wiener-theorem|Paley-Wiener 逆向定理]]（Theorem 3.3）要求从 $\operatorname{supp}(\hat{f}) \subset [-M, M]$ 推出 $f$ 的解析延拓。证明中需要控制全纯函数在无界区域（如上半平面）上的增长，此时直接应用最大模原理不可行。Phragmén-Lindelöf 定理恰好提供了在无界区域上控制全纯函数的工具——只需验证指数增长条件即可。

## What-if — 反例与边界

### 典型例子

1. **例 1（$F(z) = 1$）**：常数函数满足所有条件，$|F| \leq 1$ 平凡成立。增长条件 $|F| \leq 1 \leq Ce^{c|z|}$ 对任意 $C \geq 1$, $c > 0$ 满足。

2. **例 2（$F(z) = e^{iz}$）**：在扇形 $S$ 中，$|e^{iz}| = e^{-\operatorname{Im}(z)}$。在边界 $\arg z = \pm\pi/4$ 上，$|e^{iz}| = e^{-r\sin(\pi/4)} \leq 1$。指数增长条件 $|F| \leq e^{|z|}$ 满足。故 $|F| \leq 1$ 在 $S$ 内成立。

3. **例 3（$F_\varepsilon$ 的构造）**：对任意满足条件的 $F$，$F_\varepsilon(z) = F(z) e^{-\varepsilon z^{3/2}}$ 在 $\bar{S}$ 中一致快速下降。这不在原定理陈述中，而是证明中的关键构造。$F_\varepsilon$ 的作用是将无界区域上的问题转化为有界区域上的问题。

### 反例

1. **反例 1（$F(z) = e^{z^2}$，削弱增长条件）**：在边界上 $|F| = 1$，但在内部无界。增长速率 $e^{r^2}$ 超过 $Ce^{cr}$，不满足指数增长条件。此反例表明增长条件不可去掉。

2. **反例 2（扇形角度过大）**：若扇形半角 $\alpha > \pi/4$，则临界指数 $\pi/(2\alpha) < 2$。需选取 $\beta < \pi/(2\alpha)$ 使 $\operatorname{Re}(z^\beta) > 0$ 在闭扇形上成立。当 $\alpha$ 足够大时 $\beta = 3/2$ 不再满足此条件，$e^{-\varepsilon z^{3/2}}$ 在某些方向上**增长**而非衰减。一般需要更强的增长条件（如 $|F| \leq Ce^{c|z|^\rho}$，$\rho < \pi/(2\alpha)$）。

3. **反例 3（无增长条件）**：若去掉增长条件 $|F| \leq Ce^{c|z|}$，定理不成立。$e^{z^2}$ 即为反例：边界 $|F| = 1$，但内部无界。

### 边界情形

- **扇形角度恰为 $\pi/2$（半角 $\pi/4$）**：临界指数为 $2$。Stein 选取 $\beta = 3/2 < 2$（严格亚临界），使 $e^{-\varepsilon z^{3/2}}$ 在闭扇形上一致衰减（含边界，因 $\cos(3\pi/8) > 0$）。若取 $\beta = 2$（临界），则 $\cos(2\theta)$ 在边界处为零，$e^{-\varepsilon z^2}$ 在边界上模为 $1$（不衰减），证明仍可行但边界分析更精细。
- **$\varepsilon \to 0$ 的极限**：$F_\varepsilon \to F$ 逐点收敛，但 $F_\varepsilon$ 的快速下降性质在 $\varepsilon \to 0$ 时退化。证明中通过先固定 $\varepsilon > 0$ 应用最大模原理，再令 $\varepsilon \to 0$ 来处理此退化。



## 等价叙述

### 叙述 1（扇形版本，Stein Theorem 3.4 原始）

> $F$ 在扇形 $\{|\arg z| < \pi/4\}$ 内全纯，边界 $|F| \leq 1$，增长 $|F| \leq Ce^{c|z|}$ $\Rightarrow$ 内部 $|F| \leq 1$。

### 叙述 2（上半平面版本）

> $F$ 在上半平面 $\mathbb{H} = \{\operatorname{Im} z > 0\}$ 内全纯，在实轴上 $|F| \leq 1$，增长 $|F(z)| \leq Ce^{c|z|}$ $\Rightarrow$ $\mathbb{H}$ 内 $|F| \leq 1$。

**等价关系**：叙述 1 与叙述 2 通过共形映射 $z \mapsto z^{1/2}$（将扇形映射到上半平面）相互推出。叙述 2 直接用于 [[paley-wiener-theorem|Paley-Wiener 定理]]的证明。

### 叙述 3（一般扇形角度）

> 设扇形角度为 $2\alpha$（$0 < \alpha < \pi/2$）。若 $|F| \leq 1$ 在边界上，且 $|F(z)| \leq Ce^{c|z|^{\pi/(2\alpha)}}$，则 $|F| \leq 1$ 在内部。当 $\alpha = \pi/4$ 时退化为叙述 1。

**注**：扇形越宽（$\alpha$ 越大），所需增长条件越严格（指数 $\pi/(2\alpha)$ 越小），因为需要更强的衰减来控制更宽区域上的增长。

## 证明难度差异

### 叙述 1（扇形 $\pi/2$ 版本）的证明

- **方法**：构造 $F_\varepsilon(z) = F(z) e^{-\varepsilon z^{3/2}}$（$1 < 3/2 < 2$）+ 最大模原理 + $\varepsilon \to 0$。
- **难度**：**中**——关键在于选取辅助指数 $\beta \in (1, 2)$ 使得 $\operatorname{Re}(z^\beta) > 0$ 在闭扇形上严格成立。Stein 取 $\beta = 3/2$。
- **关键**：$\operatorname{Re}(z^{3/2}) \geq r^{3/2}\cos(3\pi/8) > 0$ 在闭扇形 $\{|\arg z| \leq \pi/4\}$ 上成立，保证一致衰减。

### 叙述 2（上半平面版本）的证明

- **方法**：类似构造 $F_\varepsilon(z) = F(z) e^{i\varepsilon z}$ + 最大模原理 + $\varepsilon \to 0$。
- **难度**：**中**——$e^{i\varepsilon z}$ 在上半平面中 $|e^{i\varepsilon z}| = e^{-\varepsilon \operatorname{Im}(z)} \leq 1$。

### 叙述 3（一般角度版本）的证明

- **方法**：构造 $F_\varepsilon(z) = F(z) e^{-\varepsilon z^{\beta}}$（$\rho < \beta < \pi/(2\alpha)$，$\rho$ 为增长阶）+ 最大模原理。
- **难度**：**中至高**——需处理 $z^{\pi/(2\alpha)}$ 的多值性，要求选取适当的分支。

## 关联

- 概念：[[schwartz-space]]、[[fourier-transform]]、[[lp-space]]
- 定理：[[paley-wiener-theorem]]（本定理是证明 Paley-Wiener 逆向定理的关键工具）、[[poisson-summation-formula]]（同一框架下 Fourier 变换的核心应用）
- 方法：[[amplification]]（增强技巧）、[[structural-randomness-decomposition]]（结构-随机性二分法）、[[comparison-modulus]]（模的下界转化）、[[local-to-global]]（局部到整体原理）
- 源：[[steinComplexAnalysis]]（Ch. 4, §3, Theorem 3.4, p.143）
- 引用本定理的引理：[[modulus-of-complex-exponential]]（$|e^{-\varepsilon z^{3/2}}|$ 的估计）、[[multiplicativity-of-modulus]]（模乘性用于 $F_\varepsilon$ 分解）、[[triangle-inequality-complex]]（辅助函数估计）

## 来源

- [[steinComplexAnalysis|Stein & Shakarchi (2003), 《Complex Analysis》, Ch. 4, §3, Theorem 3.4, p.143]]
