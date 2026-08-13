---
type: method
title: 分离变量法
 aliases: [separation of variables]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [pde, fourier-method]
strength: standard
strength_basis: 条件：线性 PDE + 齐次初边值条件（弱——标准假设）；结论：解被分解为特解族线性组合（强——化为线性代数问题）。Stein Ch. 1 §2 用此求弦振动、Ch. 4 §3 求热方程。
---

# 分离变量法

> **工作空间**：欧氏区域 $\Omega \subset \mathbb{R}^d$ 上线性 PDE。Stein 在 Ch. 1 §2、Ch. 4 §3 大量使用。

## 核心思想

设 $u(x, t) = X(x) T(t)$（分离变量），代入 PDE 后化为两个 ODE 的联立方程：
$$
\frac{T''(t)}{c^2 T(t)} = \frac{X''(x)}{X(x)} = -\lambda
$$

常数 $-\lambda$ 由边值条件限定。解空间是这些特解的线性组合。

## Stein 出现位置

- **Ch. 1 §2 p.21**：波动方程的分离变量（"standing waves"）——弦的初始形状可分解为 $\sum_n (A_n \cos nt + B_n \sin nt) \sin nx$。
- **Ch. 4 §3 Theorem 5.7**：圆盘上 Poisson 解 $u(r, \theta) = \sum_n a_n r^{|n|} e^{in\theta}$（调和方程的分离变量解）。

## 典型应用

- **弦振动方程**（Ch. 1）
- **热方程**（Ch. 4 §2）
- **调和方程**（Ch. 4 §5，圆盘 Poisson 核）

## 与已有 method 的关系

- **与 [[dalembert-formula]]**：同一 PDE 的两种解法——特征线 vs 纯音分解。
- **与 [[integral-truncation]]**：分离变量解的截断（仅取有限个频率）→ 截断误差控制。
- **与 [[local-to-global]]**：分离变量是局部解叠加为全局解的代表方法。

## 关联

- 方法：[[dalembert-formula]]、[[local-to-global]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 1 §2、Ch. 4 §3）
