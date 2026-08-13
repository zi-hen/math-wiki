---
type: source
title: "Fourier Analysis: An Introduction"
created: 2026-08-11
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, textbook]
authors: ["Stein, Elias M.", "Shakarchi, Rami"]
citekey: steinFourierAnalysisIntroduction2003a
year: 2003
raw: "[[steinFourierAnalysisIntroduction2003a]]"
---

# Fourier Analysis: An Introduction

> Stein & Shakarchi (2003)，Princeton Lectures in Analysis I。原始记录见 [[steinFourierAnalysisIntroduction2003a]]。

## 摘要

本书为 Stein-Shakarchi《Princeton Lectures in Analysis》四卷本之第一卷，分两部分：**Fourier 级数**（前四章）与 **Fourier 变换**（第五、六章）。作者刻意回避测度论与 Lebesgue 积分——Fourier 级数部分仅在 Riemann 可积函数框架下处理，Fourier 变换部分则主要在 **Schwartz 空间** $\mathcal{S}(\mathbb{R}^d)$ 试验函数框架内展开。虽则受限，仍可触及 Fourier 分析在 $\mathbb{R}^d$ 上的诸多基本事实，及其与偏微分方程（波动方程、热方程、Dirichlet 问题）、不等式（等周、不确定性原理）、数论（Dirichlet 定理、有限 Fourier 分析、$\mathbb{Z}(N)$ 的 FFT）等领域的联系。

本书亦论及**有限 Fourier 分析**（Finite Fourier analysis），即算术级数中素数无穷性的证明应用，并给出 **FFT 算法**复杂度分析（$O(N \log N)$）。

## 全书结构

| 编 | 章 | 标题 | 核心内容 |
|----|----|------|----------|
| **导论** | — | 概述 | 三个开放问题引入 Fourier 分析（Ch. 0, p.117）：等周、$\{n\gamma\}$ 分布、Weierstrass 风格处处无导数函数 |
| 第一编：Fourier 级数 | Ch. 1 | 振动弦与 d'Alembert 公式 | 波动方程、分离变量、纯音 |
| | Ch. 2 | $\mathbb{T}$ 上的 Fourier 分析基础 | Dirichlet 核、卷积性质、Cauchy-Schwarz、Parseval/复指数正交 |
| | Ch. 3 | 收敛性（一） | 均方收敛、Parseval、Riemann-Lebesgue、正则化 |
| | Ch. 4 | 收敛性（二） | Cesàro / Abel 求和、好核、热方程、Dirichlet 问题、Poisson 核 |
| | Ch. 5 | $\mathbb{R}$ 上的 Fourier 变换 | Schwartz 空间、Fourier 变换基本性质、反演、Plancherel、热方程半群 |
| | Ch. 6 | $\mathbb{R}^d$ 上的 Fourier 变换 | 多变量 Fourier、旋转对称、Bessel 函数、Radon 变换 |
| 第二编：Fourier 分析应用 | Ch. 7 | Fourier 分析与数论 | 有限阿贝尔群 Fourier、群 $\mathbb{Z}(N)$ 上的 DFT、Gauss 和、Weyl 不等式 |
| | Ch. 8 | Dirichlet 定理 | 算术级数中素数无穷性、特征标 Euler 乘积、$L$-函数 |
| | Ch. 9 | Fourier 分析在其他领域 | Hermite 函数与不确定性原理、采样定理、Radon 逆变换（CT 扫描） |

## 关键摘录

### 序言与综述（p.12–13、p.117）

- **序言，p.12**：「At this early stage it is not appropriate to introduce measure theory and Lebesgue integration. For this reason our treatment of Fourier series in the first four chapters is carried out in the context of Riemann integrable functions. ... our treatment of the Fourier transform in Chapters 5 and 6 is largely confined to the framework of test functions.」—— 注解：本卷采取最小依赖路径，先避开测度论。
- **序言，p.13**：「Finite Fourier analysis. This is an introductory subject par excellence, because limits and integrals are not explicitly present. Nevertheless, the subject has several striking applications, including the proof of the infinitude of primes in arithmetic progression.」—— 注解：算术级数中素数无穷性是离散 Fourier 分析的经典应用。
- **绪论，p.117**：「Three questions which will reappear throughout the book: (I) isoperimetric inequality, (II) $\{n\gamma\}$ equidistribution, (III) continuous nowhere-differentiable function.」—— 注解：本书以这三个开放问题作为组织主线，每个都被 Fourier 分析「重写」。

### 第一章 振动弦（p.18–35）

- **p.18**：波动方程物理动机：「three steps: standing waves, separation of variables, linearity/superposition.」
- **p.25**：尺度变换「change of units」将一般波动方程化为 $u_{tt} = u_{xx}$。
- **p.28**：d'Alembert 公式与时间反演对称性 $u^-(x, t) = u(x, -t)$。
- **p.31**：Fourier 思想之实质：「any function is the linear combination (possibly infinite) of the most basic trigonometric functions $\sin mx$ and $\cos mx$.」—— 注解：这是 Fourier 分析的诞生。

### 第二章 基础（p.46–62、p.65–82）

- **p.46**：Fourier 级数部分和与 Dirichlet 核的卷积关系 $S_N(f) = (1/2\pi) \int D_N(x - y) f(y) dy$。
- **p.46–47**：Dirichlet 核**不**满足好核条件（$L^1$ 范数无界），故 Fourier 级数逐点收敛**微妙**。
- **p.61 卷积定义** $(f * g)(x) = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(y) g(x-y) dy$。
- **p.62 Proposition 3.1 卷积基本性质**：线性、交换律、结合律、连续性、$\widehat{f * g}(n) = \hat f(n) \hat g(n)$。
- **p.65 三好核条件**：(a) 单位质量，(b) $L^1$ 有界，(c) 质量集中。

### 第三章 收敛性（p.86–100）

- **p.87 Theorem 1.1 均方收敛**：$\|f - S_N(f)\|_2 \to 0$。
- **p.89 内积空间 + Pythagoras + Cauchy-Schwarz** 的标准建立。
- **p.92 Hilbert 空间定义**：完备内积空间。`Rd`、`Cd`、`l²(Z)` 例。
- **p.94 Lemma 1.2 最优逼近**：$S_N(f)$ 在 $\{e_n\}_{|n| \leq N}$ 张成子空间中最优。
- **p.97 Theorem 1.3 Parseval**：$\sum |\hat f(n)|^2 = \int |f|^2$。
- **p.97 Theorem 1.4 Riemann-Lebesgue**：$\hat f(n) \to 0$。
- **p.98 Lemma 1.5 内积 Parseval**：$\int F \bar G = \sum a_n \bar b_n$。
- **p.98 Theorem 2.1 可微处收敛**：若 $f$ 在 $\theta_0$ 可微，则 $S_N(f)(\theta_0) \to f(\theta_0)$。
- **p.100 Theorem 2.2 Riemann 局部化**：局部相等 ⇒ $S_N(f)(\theta_0) = S_N(g)(\theta_0) + o(1)$。

### 第四章 应用与好核（p.69–73、p.130–141）

- **p.69 Lemma 5.5 + Theorem 5.6 泊松核**：$P_r(\theta) = \sum r^{|n|} e^{in\theta} = \frac{1 - r^2}{1 - 2r\cos\theta + r^2}$，好核（$r \to 1$）。
- **p.70 Cesàro 算术平均**：$\sigma_N = (S_0 + S_1 + \cdots + S_{N-1})/N$。
- **p.70 Lemma 5.1 + Theorem 5.2 Fejér 定理**：Fejér 核 $F_N(x) = \frac{1}{N} \frac{\sin^2(Nx/2)}{\sin^2(x/2)}$ 是好核，连续函数 Fourier 级数 Cesàro 一致收敛到 $f$。
- **p.71 Corollary 5.3 / 5.4**：连续 Fourier 级数的 Cesàro 求和与 Weierstrass 三角多项式逼近。
- **p.73 Theorem 5.7 Poisson 积分（圆盘）**：$u(r, \theta) = (f * P_r)(\theta)$ 是调和方程的唯一解。
- **Chapter 4（p.117–141）三个应用**：
  - **问题 I（p.120 Theorem 1.1 等周不等式）**：圆是固定周长下面积最大者（Hurwitz 1901 证）。
  - **问题 II（p.125 Theorem 2.1 等分布）**：$\gamma \notin \mathbb{Q}$ ⇒ $\{\langle n\gamma\rangle\}$ 均匀分布（Weyl 1916）。
  - **问题 III（p.131 Theorem 3.1 处处无导数函数）**：$f_\alpha(x) = \sum 2^{-n\alpha} e^{i 2^n x}$（$\alpha < 1$）连续但处处不可微。

### 第五章 $\mathbb{R}$ 上的 Fourier 变换（p.132–178、p.183–185）

- **p.132 Schwartz 空间** $\mathcal{S}(\mathbb{R})$ 严格定义（多重指标速降）。
- **p.153 Proposition 1.2 Fourier 基本性质**：平移、伸缩、微分、乘法（共轭 2πiξ）的对偶。
- **p.154 Theorem 1.3 $\mathcal{F}: \mathcal{S} \to \mathcal{S}$ 自同构**。
- **p.155 Theorem 1.4 Gauss 自伴**：$f(x) = e^{-\pi x^2}$ 满足 $\hat f(\xi) = e^{-\pi \xi^2}$。
- **p.156 Corollary 1.5 + Theorem 1.6 Gauss 核是好核族**。
- **p.158 Theorem 1.9 Fourier 反演**：$f(x) = \int \hat f(\xi) e^{2\pi i x \xi} d\xi$（$f \in \mathcal{S}$）。
- **p.160 Theorem 1.12 Plancherel**：$\|\hat f\|_2 = \|f\|_2$（$f \in \mathcal{S}$）。
- **p.167 Lemma 2.4 / 2.5 Poisson 核（$\mathbb{R}$ 版）**：$P_y(x) = \pi^{-1} y/(x^2+y^2)$ 是好核。
- **p.168 Theorem 2.6 Poisson 积分（半平面）**：解 Dirichlet 问题。
- **p.172 Theorem 3.1 Poisson 求和公式**：$\sum_{n \in \mathbb{Z}} f(n) = \sum_{n \in \mathbb{Z}} \hat f(n)$。
- **p.173 Theorem 3.2 / 3.3 / 3.5**：theta 函数、热核、Poisson 核周期化（PSF 推论）。
- **p.175 Theorem 4.1 Heisenberg 不确定性原理**：$\sigma_x \sigma_\xi \geq 1/(4\pi)$（Gauss 等号）。
- **p.184 Exercise 20 采样定理**：带限信号由整数样点重建。

### 第六章 $\mathbb{R}^d$ 与 Radon 变换（p.193–234）

- **p.195 $\mathbb{R}^d$ 上轮换不变测度**。
- **p.197 $\mathbb{R}^d$ Schwartz 空间**。
- **p.198 Proposition 2.1 + Corollary 2.2 + 2.3**：$\mathbb{R}^d$ 上 Fourier 基本性质 + $\mathcal{S}$ 自同构 + 径向函数的 Fourier 变换仍径向。
- **p.198 Theorem 2.4 $\mathbb{R}^d$ Fourier 反演**。
- **p.214–215 径向 Fourier 公式**：$d=1, 3$ 用初等函数表达（Bessel 函数推广）。
- **p.217 X-射线变换 / Radon 变换定义**。
- **p.220 Proposition 5.1 + Lemma 5.2**：Radon 变换的 Fourier 切片定理（$\widehat{R(f)}(s, \gamma) = \hat f(s\gamma)$）。
- **p.222 Corollary 5.3 单射性 + Theorem 5.4 重建公式**：$\Delta R^* R = -8\pi^2$。
- **p.234 Problem 8 重构**：$f = c_d (-\Delta)^{(d-1)/2} R^* R(f)$。

### 第七—八章 数论与 $\mathbb{Z}(N)$（p.236–257）

- **p.236 $\mathbb{Z}(N)$ 的 $N$ 次单位根**。
- **p.240 Theorem 1.2 + 1.3 $\mathbb{Z}(N)$ 上 DFT**：完备正交基 + Parseval + $O(N \log N)$ FFT。
- **p.247–250 $\mathbb{Z}(N)$ 特征标**：$e: G \to S^1$ 群同态 + Lemma 2.4 + Theorem 2.5/2.7/2.8 完备性。
- **p.255 Exercise 6：$\hat{\hat f}(\xi) = f(-\xi)$**。
- **p.254–257 Dirichlet 定理**：特征标定义 + Lemma 2.2 系数 + Euler 乘积 + $L(1, \chi) \neq 0$。

## 高亮处理清单(2026-08-13)

> 覆盖 `raw/papers/steinFourierAnalysisIntroduction2003a.md` 全部 **308 处**高亮(按章聚合、同类合并;各章数量与原始文件 `### p.XX · highlight` 条目逐页核对,合计 = 2+22+66+50+33+64+34+17+8+12 = 308)。处理取值:已覆盖(现有实体页 X)/ 已覆盖(源页摘录)/ 记录(暂不建页)/ note(纲领性-思想性,见笔记页)。

| 章节 | 高亮主题(数量) | 处理 | 落点 |
|------|----------------|------|------|
| 导论(p.12-13, 2) | 方法策略:避开测度论、限于 Riemann 可积与试验函数;有限 Fourier 分析的定位 | 已覆盖(源页摘录) | 本页「关键摘录·序言与综述(p.12-13)」 |
| Ch.1(p.18-44, 22) | 三步骤程序、简谐运动/驻波与分离变量动机(p.18、p.20、p.21×3, 5) | 已覆盖(源页摘录)+记录 | 摘录 p.18;其余记录 |
| | 尺度变换、行波/驻波两种路线、Fourier 思想的效力(p.25×3, 3) | 已覆盖(源页摘录)+记录 | 摘录 p.25;其余记录 |
| | d'Alembert 公式、时间反演、纯音叠加与 ODE 约化(p.28×3、p.29×2、p.31×2, 7) | 已覆盖(源页摘录)+记录 | 摘录 p.28;其余记录 |
| | 复指数表述与「任意函数=三角线性组合」的思想本质(p.33×2, 2) | 已覆盖(源页摘录) | 摘录 p.31「Fourier 思想之实质」 |
| | 广义解/弱解与分布:拨弦的 u 不真正满足方程(p.35, 1) | note(纲领性-思想性) | [[fourier-three-questions-and-methodology]]§六 |
| | 历史注记:弦振动方程求解史 1747–1807(p.40, 1) | note(纲领性-思想性) | [[fourier-three-questions-and-methodology]]§七 |
| | 复指数/极坐标 Laplacian 习题(p.41、p.42、p.44, 3) | 记录(暂不建页) | — |
| Ch.2(p.46-83, 66) | 部分和=卷积、Dirichlet 核非好核、Fejér/Abel 求和概览(p.46、p.47, 2) | 已覆盖(源页摘录) | 摘录「第二章」 |
| | 圆/周期函数/区间三种描述等价、Fourier 系数定义(p.50、p.51、p.52, 3) | 已覆盖(源页摘录)+记录 | 摘录 p.51;其余记录 |
| | 计算例:θ、n+α、Dirichlet 核、Poisson 核(p.53×2、p.54×2, 4) | 已覆盖(源页摘录)+记录 | 摘录 p.54;其余记录 |
| | 逐点收敛问题:Du Bois-Reymond 反例、Carleson、Cesàro/Abel/均方诸诠释(p.55×4、p.56×4, 8) | 已覆盖(源页摘录)+记录 | 摘录 p.98(可微点收敛/局部化);其余记录 |
| | 唯一性(系数全零⇒f=0)、峰值多项式技巧、绝对收敛 Cor 2.2/2.3(p.57、p.58×2、p.59×2, 5) | 记录(暂不建页) | — |
| | 光滑↔衰减、$\widehat{f'}(n)=in\,\hat f(n)$、C²⇒O(1/n²)(p.60×2, 2) | 已覆盖(源页摘录) | 摘录 p.60 |
| | 卷积定义/性质、加权平均诠释、$S_N = f * D_N$(p.61×2、p.62×2, 4) | 已覆盖(源页摘录) | 摘录 p.61-62 |
| | 连续函数逼近引理 Lemma 3.2(p.64, 1) | 记录(暂不建页) | — |
| | 好核定义、权重诠释、Dirac δ 极限、逼近恒等(p.65×3、p.66×2, 5) | 已覆盖(源页摘录)+现有实体页 | 摘录 p.65;[[good-kernel]] |
| | Dirichlet 核违反好核、抵消(cancellation)、收敛微妙(p.67、p.68×2, 3) | 已覆盖(源页摘录) | 摘录 p.46-47 |
| | Cesàro/Abel 求和、Fejér 定理、Weierstrass 逼近、Poisson 核、Dirichlet 问题(p.69、p.70×4、p.71×3、p.72、p.73×4、p.74, 14) | 已覆盖(源页摘录) | 摘录「第四章(p.69-74)」 |
| | 习题(p.76、p.77×3、p.78×3、p.79、p.80×3、p.81、p.82、p.83×2, 15) | 记录(暂不建页) | — |
| Ch.3(p.86-114, 50) | 全局(均方)/局部(逐点)两种视角、均方收敛定理(p.86、p.87×2, 3) | 已覆盖(源页摘录) | 摘录「第三章」 |
| | 内积/Hilbert 空间、l²(Z)、R 不完备、L² 完备化转折(p.89、p.90×2、p.91×2、p.92×2、p.93×2, 9) | 已覆盖(源页摘录)+note | 摘录 p.89-93;p.93 完备化评述 → [[fourier-three-questions-and-methodology]]§七 |
| | 正交性与系数=内积、最优逼近 Lemma 1.2 及几何诠释(p.94、p.95×2, 3) | 已覆盖(源页摘录) | 摘录「第三章」 |
| | Parseval、Riemann-Lebesgue、Bessel、内积 Parseval(p.97×5、p.98 之一, 6) | 已覆盖(现有实体页) | [[parseval-identity]]、[[riemann-lebesgue-lemma]] |
| | 可微点收敛、局部化原理、对称性破缺原则、连续函数发散例(p.98×3、p.99、p.100×2, 6) | 已覆盖(现有实体页)+记录 | [[riemann-localization]]、[[symmetry-breaking]];其余记录 |
| | 习题/问题(p.105×4、p.106×3、p.107×2、p.108×4、p.109×2、p.110×2、p.111×2、p.112、p.113×2、p.114, 23) | 记录(暂不建页) | — |
| Ch.4(p.117-145, 33) | 三大问题总述:等周/等分布/无处可微(p.117, 1) | note(纲领性-思想性) | [[fourier-three-questions-and-methodology]]§一 |
| | 等周定理、标度化归约(p.120×2、p.121, 3) | 已覆盖(现有实体页) | [[isoperimetric-inequality]] |
| | 等周证明后的未决问题反思(Hurwitz 1901)(p.122, 1) | note(纲领性-思想性) | [[fourier-three-questions-and-methodology]]§二 |
| | 等分布:有理/无理观察、Kronecker 稠密、定义与 Weyl 定理、特征函数改写、数论归约为分析(p.123、p.124×3、p.125×3、p.127, 8) | 已覆盖(现有实体页)+note | [[weyl-equidistribution]];「归约为分析」(p.125) → [[fourier-three-questions-and-methodology]]§三 |
| | 遍历诠释:时间平均=空间平均(p.128, 1) | note(纲领性-思想性) | [[fourier-three-questions-and-methodology]]§四 |
| | Weyl 判据与指数和估计(p.129×2, 2) | 已覆盖(现有实体页) | [[weyl-equidistribution]] |
| | 无处可微函数、lacunary 级数、延迟平均(p.131×3、p.133, 4) | 已覆盖(源页摘录)+note | 摘录 p.131(Thm 3.1);延迟平均/lacunary 方法论 → [[fourier-three-questions-and-methodology]]§五 |
| | 习题/问题(p.137、p.138、p.139×2、p.140×2、p.141、p.143、p.144×2、p.145×3, 13) | 记录(暂不建页) | — |
| Ch.5(p.146-190, 64) | 变换=系数的连续版本、反演公式启发、Schwartz 方法选择(p.146、p.147、p.148, 3) | 已覆盖(现有实体页)+note | [[fourier-transform]];方法选择(p.148) → [[fourier-three-questions-and-methodology]]§六 |
| | 中速递降类 M(R) 与积分性质(p.149×4、p.150, 5) | 记录(暂不建页) | — |
| | 对偶原则(衰减↔光滑)、Schwartz 定义、Gauss 例(p.151×2、p.152×2, 4) | 已覆盖(源页摘录)+note | 摘录 p.132;对偶原则(p.151) → [[fourier-three-questions-and-methodology]]§六 |
| | 变换定义、Prop 1.2 基本性质、微分/乘法对偶(p.153×2, 2) | 已覆盖(源页摘录) | 摘录「第五章(p.153)」 |
| | 主链:S→S、Gauss 自伴、好核族、卷积、反演、双射、Plancherel、扩展至 M(R)、Weierstrass 逼近(p.154×2、p.155、p.156×4、p.157×2、p.158、p.159×2、p.160、p.161×2, 15) | 已覆盖(源页摘录/现有实体页) | 摘录「第五章」;[[fourier-inversion]]、[[plancherel-theorem]] |
| | 热方程半群、唯一性、Poisson 核/积分、均值性质(p.163、p.164×2、p.165、p.167×2、p.168×2、p.169, 9) | 已覆盖(源页摘录) | 摘录「第五章(p.167-168)」 |
| | 周期化与 Poisson 求和、theta/热核/Poisson 周期化(p.170、p.171、p.172×2、p.173、p.174, 6) | 已覆盖(源页摘录/现有实体页) | 摘录「第五章」;[[poisson-summation-formula]] |
| | Heisenberg 不确定性原理:模糊表述与量子诠释、Planck 常数(p.175×2、p.176、p.177、p.178 之一, 5) | 已覆盖(现有实体页) | [[heisenberg-uncertainty-principle]] |
| | 习题/问题(p.178 之一、p.179×3、p.180×3、p.182、p.184×2、p.185、p.186、p.189×2、p.190, 15) | 已覆盖(现有实体页)+记录 | [[sampling-theorem]]、[[exercises/ch5-ex20-sampling]]、[[exercises/ch5-ex23-heisenberg]];其余记录 |
| Ch.6(p.194-234, 34) | 旋转/速降/积分不变量、球坐标、Schwartz(Rᵈ)、变换定义、基本性质、自同构、径向、反演/Plancherel(p.194、p.195、p.196、p.197×2、p.198×3、p.199×2, 10) | 已覆盖(源页摘录) | 摘录「第六章(p.195-199)」 |
| | 径向 Fourier 公式、Bessel 函数、奇偶维差异(p.214、p.215, 2) | 已覆盖(源页摘录)+现有实体页 | 摘录 p.214-215;[[bessel-function]]、[[radial-function]] |
| | X-ray/Radon 变换、自由度启发、切片定理、唯一性/重建、对偶变换、ΔR*R=−8π²f(p.217、p.218×2、p.220×3、p.221×2、p.222×2、p.223, 11) | 已覆盖(源页摘录)+现有实体页 | 摘录「第六章(p.217-223)」;[[radon-transform]] |
| | 习题/问题(p.225×2、p.226×2、p.228×2、p.229×2、p.230、p.234×2, 11) | 记录(暂不建页) | — |
| Ch.7(p.236-253, 17) | N 次单位根、Z/NZ↔Z(N)、正交基、DFT、FFT 复杂度(p.236、p.238、p.239×2、p.240×3、p.241, 8) | 已覆盖(源页摘录) | 摘录「第七—八章(p.236-241)」 |
| | 特征标、Ĝ 群、正交基、Parseval(p.247、p.248、p.249×3、p.250、p.252、p.253×2, 9) | 已覆盖(现有实体页/源页摘录) | [[character]]、[[finite-abelian-group]];摘录「第七—八章」 |
| Ch.8(p.254-257, 8) | 特征标/DFT 补充与习题:Z(N)、S¹/R 特征标、卷积的 Dirac 诠释、有限阿贝尔群结构定理(p.254、p.255×3、p.256×2、p.257×2, 8) | 已覆盖(现有实体页)+记录 | [[dirichlet-theorem-on-primes]]、[[character]];习题记录 |
| 附录(p.302-314, 12) | Riemann 可积性、测度 0、可积性准则(p.302×2、p.304×4, 6) | 记录(暂不建页) | — |
| | Fubini、变量替换、球坐标、极坐标(p.308、p.309、p.310×2、p.312、p.314, 6) | 记录(暂不建页) | — |

## 出现的概念 / 定理 / 方法（按章节分类）

### 基础概念
- [[fourier-series|Fourier 级数]] — Ch. 1–4 核心
- [[fourier-transform|Fourier 变换]] — Ch. 5–6 核心
- [[schwartz-space|Schwartz 空间 $\mathcal{S}$]] — Ch. 5 §1
- [[lp-space|$L^p$ 空间]] — Ch. 3 整体（实为 $L^1$, $L^2$）
- [[ellp-space|$\ell^p$ 空间]] — Ch. 2–3 Fourier 系数序列
- [[good-kernel|好核]] — Ch. 2 §5、Ch. 4 §2
- Fourier 系数（**〔待建〕**未建独立页）— 全书核心对象
- 径向函数（**〔待建〕**未建独立页）— Ch. 6
- 线分布（**〔待建〕**未建独立页）— Ch. 6 $\mathbb{R}^d$ 上的 Radon 变换
- Bessel 函数（**〔待建〕**未建独立页）— Ch. 6 径向 Fourier

### 定理
- [[poisson-summation-formula|Poisson 求和]] — Ch. 5 Thm 3.1
- [[parseval-identity|Parseval 恒等式]] — Ch. 3 Thm 1.3（**新建**）
- [[plancherel-theorem|Plancherel 定理]] — Ch. 5 Thm 1.12（**新建**）
- [[fourier-inversion|Fourier 反演]] — Ch. 5 Thm 1.9（**新建**）
- [[riemann-lebesgue-lemma|Riemann-Lebesgue 引理]] — Ch. 3 Thm 1.4（**新建**）
- [[heisenberg-uncertainty-principle|Heisenberg 不确定性原理]] — Ch. 5 Thm 4.1（**新建**）
- [[isoperimetric-inequality|等周不等式（Hurwitz）]] — Ch. 4 Thm 1.1（**新建**）
- [[weyl-equidistribution|Weyl 等分布定理]] — Ch. 4 Thm 2.1（**新建**）
- [[riemann-localization|Riemann 局部化原理]] — Ch. 3 Thm 2.2
- [[dirichlet-theorem-on-primes|Dirichlet 算术级数素数定理]] — Ch. 8
- [[character|特征标]]（用于 $\mathbb{Z}(N)$ / 抽象有限阿贝尔群）— Ch. 7–8
- Fejér 定理（**〔待建〕**未建独立页）— Ch. 4 Theorem 5.2
- Weierstrass 三角多项式逼近（**〔待建〕**未建独立页）— Ch. 4 Corollary 5.4
- 采样定理（**〔待建〕**未建独立页）— Ch. 5 Exercise 20
- Radon 变换（**〔待建〕**未建独立页）— Ch. 6 §5
- Laplacian 自伴性 / Hermite 算子（**〔待建〕**未建独立页）— Ch. 5 Exercise 23

### 引理
- [[cauchy-schwarz-inequality|Cauchy-Schwarz]] — Ch. 3 §1
- Cauchy 不等式 — Ch. 5（与复分析版重叠；Ch.5 §1 中作为基础工具）
- [[integer-periodicity-of-exponential|复指数整数周期性 $e^{2\pi i n} = 1$]] — Ch. 5

### 方法
- 好核逼近（**〔待建〕**未建独立页）— Ch. 2, Ch. 4, Ch. 5
- 分离变量法（**〔待建〕**未建独立页）— Ch. 1
- d'Alembert 公式（**〔待建〕**未建独立页）— Ch. 1
- 几何级数估计（**〔待建〕**未建独立页）— Weyl 判据证明中
- Cesàro 求和法（**〔待建〕**未建独立页）— Ch. 4
- Abel 求和法（**〔待建〕**未建独立页）— Ch. 4
- Wirtinger 不等式（**〔待建〕**未建独立页）— Ch. 3 Ex. 11（与等周同源）

## 与现有 wiki 的关系

- 本卷为 Stein-Shakarchi 系列 Fourier 分析分支的开端；后续摄取 Real Analysis 卷（测度论与 Lebesgue 积分）、Complex Analysis 卷后，将回填至本卷建立的概念页。
- 本次摄取**首次**全面覆盖本卷 Ch. 1–9，建立 7 个核心定理页（Parseval、Plancherel、Fourier 反演、Riemann-Lebesgue、Heisenberg、等周、Weyl 等分布）；这些定理在先前摄取中已在源页以摘录形式提及，但无独立实体页。
- 仍未建立实体页的若干定理（如 Fejér 定理、Weierstrass 逼近、Radon 变换、采样定理、Hermite 函数）将留待后续摄取 Real Analysis 卷时建立。
- 本卷中**所有显式陈述的定理**（E 级核验）已建立；抽象诠释（A 级，如群论诠释、Pontryagin 对偶的扩展）保留在原 AI 对话笔记中。

## 待办

- [ ] 核验 Fourier 级数与 Fourier 变换的 Stein 记号约定（$e^{-2\pi i\xi x}$）—— ✓ 已通过。
- [ ] 补充本书后续章节的具体页码与摘录—— ✓ 本次摄取完成 Ch. 1–9 全覆盖。
- [ ] 建立 Fejér 定理、Weierstrass 三角多项式逼近、Radon 变换、采样定理、Hermite 函数等未建实体页。
- [ ] 核验后由 `unverified` 升级为 `verified`。
