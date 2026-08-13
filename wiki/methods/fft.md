---
type: method
title: 快速 Fourier 变换（FFT）
aliases: [fast Fourier transform, FFT, Cooley-Tukey]
created: 2026-08-13
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [number-theory, fourier-analysis, algorithm]
strength: standard
strength_basis: 条件：$N = \alpha^n$ 的有限 Fourier 变换（弱——只需 $N$ 为幂次）；结论：$O(N\log N)$ 次运算完成 $N$ 点 DFT（强——分治把朴素 $O(N^2)$ 降到近线性，是有限 Fourier 分析的算法基础）。
---

# 快速 Fourier 变换（FFT）

> **工作空间**：有限循环群 $\mathbb{Z}(N)$（$N = \alpha^n$，$\alpha \ge 2$ 整数）；$N$ 点离散 Fourier 变换（DFT）。

## 核心思想：分治（divide and conquer）

$N$ 点 DFT
$$
F(k) = \sum_{n=0}^{N-1} a_n\,\omega_N^{nk}, \qquad \omega_N = e^{-2\pi i/N},
$$
朴素计算需 $N^2$ 次乘法。FFT 的关键观察：**按下标奇偶分拆**，把 $N$ 点变换分解为两个 $N/2$ 点变换，旋转因子 $\omega_N^{k}$ 吸收奇部相移：

**定理（Stein, Ch. 7, Theorem 1.3, p.241；Ch. 7 Ex.9 推广）**。
- $N = 2^n$ 时，$F$ 的全部 $N$ 个值可用至多 $4N\log_2 N$ 次运算算出（$O(N\log N)$）；
- 推广到 $N = \alpha^n$（$\alpha$ 为整数 $> 1$），可用至多 $O(N\log N)$ 次运算（$\alpha = 3$ 时为 $6N\log_3 N$）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 7, Theorem 1.3, p.241; Exercise 9, p.255]]。

## 步骤（radix-2，$N = 2^n$）

1. **奇偶分拆**。令 $n = 2m$（偶）与 $n = 2m+1$（奇），利用 $\omega_N^2 = \omega_{N/2}$：
$$
F(k) = \underbrace{\sum_{m=0}^{N/2-1} a_{2m}\,\omega_{N/2}^{mk}}_{\text{偶部 } E(k)} + \omega_N^k\underbrace{\sum_{m=0}^{N/2-1} a_{2m+1}\,\omega_{N/2}^{mk}}_{\text{奇部 } O(k)}.
$$
2. **周期利用**。$E, O$ 以 $N/2$ 为周期（$\omega_{N/2}^{mk}$ 的 $k$ 周期性），故对 $0 \le k < N/2$：
$$
F(k) = E(k) + \omega_N^k O(k), \qquad F(k + N/2) = E(k) - \omega_N^k O(k).
$$
两个 $N/2$ 点变换 + $N$ 次复数乘加（旋转因子 $\omega_N^k$）。
3. **递归**。对 $E, O$ 重复此过程，直至 $N = 1$（$F = a_0$）。

**复杂度**：$T(N) = 2T(N/2) + O(N)$，解得 $T(N) = O(N\log N)$（每层 $O(N)$，$\log_2 N$ 层）。Stein 计入加减后的常数：$N = 2^n$ 时至多 $4N\log_2 N$。

**$\alpha^n$ 推广（radix-$\alpha$）**：按下标模 $\alpha$ 分成 $\alpha$ 个子序列，每层分解为 $\alpha$ 个 $N/\alpha$ 点变换 + $N$ 次旋转因子运算，层数 $\log_\alpha N$，复杂度仍 $O(N\log N)$（$\alpha = 3$ 时常数 $6$）。

## 陷阱

- **朴素实现是 $O(N^2)$**：直接双重求和不可行；FFT 的全部价值在于分治递归。
- **周期条件**：$N = \alpha^n$ 是基本情形（层数 $\log_\alpha N$ 为整数）；一般 $N$ 用补零 / 混合基。
- **旋转因子方向**：$\omega_N = e^{-2\pi i/N}$ 依赖 Stein 约定（$e^{-2\pi ink/N}$）；正向与逆向变换的 $\omega_N$ 互为共轭。

## 典型例子

- **多项式乘积**：两个 $N$ 次多项式相乘 = 系数卷积；三次 FFT（正变换 ×2 → 点乘 → 逆变换）化 $O(N^2)$ 为 $O(N\log N)$。
- **信号分析**：周期信号的频谱在 $O(N\log N)$ 内由采样点算出。
- **数论**：有限群 $\mathbb{Z}(N)$ 上的 Fourier 分析（[[finite-abelian-group]]）——FFT 使其在实用规模下可计算。

## 与已有 method 的关系

- **[[integral-truncation|积分分拆]] / 结构-随机性二分法**（[[structural-randomness-decomposition]]）：FFT 的奇偶分拆是「按频段分治」——偶/奇下标对应低频/高频子问题，是分解思想的算法实例。
- **[[finite-abelian-group]] 的 Fourier 分析**：FFT 是其计算实现；对偶群 $\widehat{\mathbb{Z}(N)} \cong \mathbb{Z}(N)$（[[finite-abelian-decomposition|结构定理]]）保证变换矩阵对称可递归。

## 关联

- 定理：[[finite-abelian-decomposition]]（$\widehat{\mathbb{Z}(N)}\cong\mathbb{Z}(N)$）、[[parseval-identity]]（$\mathbb{Z}(N)$ 版本，变换保能量）
- 概念：[[finite-abelian-group]]、[[fourier-coefficient|Fourier 系数]]
- 方法：[[structural-randomness-decomposition]]、[[integral-truncation|积分分拆]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 7, Theorem 1.3, p.241; Exercise 9, p.255）
