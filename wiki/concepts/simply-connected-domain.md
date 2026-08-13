---
type: concept
title: 单连通域
aliases: [simply connected domain]
created: 2026-08-12
updated: 2026-08-12
sources: [steinComplexAnalysis]
status: unverified
tags: [complex-analysis, topology]
strength: standard
strength_basis: 条件：开集 $\Omega \subset \mathbb{C}$ + 同伦条件（弱——只要求开集拓扑）；结论：全纯函数有原函数 + 围道积分为零 + 单值对数存在（强——多个全纯理论的简化）。
---
# 单连通域

> **工作空间**：$\mathbb{C}$ 的开集 $\Omega$。

## What — 定义与基本事实

### 定义

$\mathbb{C}$ 中区域 $\Omega$ 称为**单连通**，若 $\Omega$ 中任意两条具有相同端点的曲线同伦（homotopic）——即可在 $\Omega$ 内连续形变互变。

等价定义（Stein, p.115）：$\Omega$ 中任何闭曲线都可连续缩为一点。

依据 [[steinComplexAnalysis|Stein & Shakarchi, Ch. 3, §5, p.115]]。

### 例子

| 区域 | 单连通？ | 说明 |
|------|---------|------|
| $\mathbb{C}$ | 是 | 平凡 |
| $D$（圆盘） | 是 | 任何闭曲线可缩 |
| $\mathbb{C} \setminus \{0\}$（穿孔平面） | 否 | 绕 $0$ 的圆不可缩 |
| 带裂缝的平面 $\mathbb{C} \setminus (-\infty, 0]$ | 是 | 裂缝使区域「简单」 |
| $\mathbb{C} \setminus \{z_1, \ldots, z_n\}$ | 否 | 多连通（连通分支数 $n$） |
| 矩形的内部 | 是 | 同伦类平凡 |

### 单连通域上的全纯理论

设 $\Omega$ 单连通，$f \in \mathcal{O}(\Omega)$：

1. **原函数存在**（Stein Theorem 5.2, p.115）：存在 $F \in \mathcal{O}(\Omega)$ 使得 $F' = f$。
2. **闭曲线积分为零**（Corollary 5.3, p.116）：$\int_\gamma f = 0$ 对任何闭曲线 $\gamma \subset \Omega$。
3. **对数分支存在**（Theorem 6.1, p.117）：若 $1 \in \Omega$ 且 $0 \notin \Omega$，存在 $\log_\Omega(z)$ 在 $\Omega$ 上全纯使得 $e^{\log_\Omega(z)} = z$。
4. **幂分支存在**：$z^\alpha = e^{\alpha \log z}$ 在 $\Omega$ 上有单值全纯定义。

## Why — 动机与直观

### 为什么引入单连通域？

单连通域是全纯理论最「可控」的拓扑类型——所有闭曲线同伦类平凡。这使多个重要构造（原函数、对数分支、$n$ 次根）成为可能：

1. **原函数构造**：若 $\Omega$ 非单连通，$f(z) = 1/z$ 在 $\mathbb{C} \setminus \{0\}$ 上全纯但无原函数——绕 $0$ 的积分为 $2\pi i \neq 0$。单连通性消除此障碍。
2. **单值对数**：在单连通域上可定义 $\log z$（避免支割线）。这是定义 $z^\alpha$ 等多值函数的基础。
3. **简化围道积分**：所有闭曲线积分为零——Cauchy 定理的「绝对」版本。

### 直观解释

单连通域 $=$「无洞的开集」。这是 $\mathbb{C}$ 上最「简单」的拓扑类型。多连通域（如 $\mathbb{C} \setminus \{0\}$）有「洞」，导致多值函数与围道积分的非零。

## What-if — 反例与边界

### 等价叙述

| 叙述 | 形式 | 来源 |
|------|------|------|
| 1. 同伦定义 | 任意两条同端点曲线同伦 | Stein p.115 |
| 2. 闭曲线缩为点 | 任意闭曲线同伦于常数 | 等价 |
| 3. 基本群平凡 | $\pi_1(\Omega) = 0$ | 同伦定义的标准翻译 |
| 4. 复分析意义 | 全纯函数有原函数 | Stein Theorem 5.2 |

### 反例

1. **$\mathbb{C} \setminus \{0\}$**：穿孔平面不是单连通——绕 $0$ 的圆不可缩为点。
2. **环域 $\{1 < |z| < 2\}$**：不是单连通。
3. **有界多连通域**：如 $\{|z| < 2\} \setminus \{|z| < 1\}$——内孔使其非单连通。

### 边界情形

- **单点挖去**：$\mathbb{C} \setminus \{0\}$ —— 多连通（基本群 $\cong \mathbb{Z}$）。
- **$n$ 个挖去点**：$\mathbb{C} \setminus \{z_1, \ldots, z_n\}$ —— 多连通（基本群 $\cong$ 自由群，$n$ 个生成元）。
- **裂缝带**：$\mathbb{C} \setminus (-\infty, 0]$ —— 单连通（裂缝消除多值性）。
- **星形域**：从某点「可见」的全域 —— 单连通（任何闭曲线可通过直线缩为该点）。

## 关联

- 概念：[[holomorphic-function]]、[[contour-integration|围道积分法]]
- 定理：[[cauchy-theorem]]（单连通 $\Rightarrow$ 闭曲线积分为零）、[[runge-theorem]]（$K^c$ 连通与单连通性相关）
- 应用：单值对数分支（Stein Theorem 6.1, p.117）、幂函数 $z^\alpha$
- 源：[[steinComplexAnalysis]]（Ch. 3, §5–6, p.115–119）
