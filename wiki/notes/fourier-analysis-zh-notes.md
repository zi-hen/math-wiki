---
type: note
title: 傅里叶分析笔记（参考 Stein–Shakarchi）
aliases: [傅里叶分析讲义, fourier-analysis-zh-notes, 五场景骨架]
created: 2026-08-12
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: mature
tags: [fourier-analysis, survey, compactness-axis, schwartz-space, poisson-summation]
authors: [人类, AI]
---
# 傅里叶分析笔记（参考 Stein–Shakarchi）

> **创建者**：人类（撰写 LaTeX 讲义原稿）+ AI（整理为 wiki 笔记、补充引用、嵌入链接）
> **状态**：mature（2026-08-12）
> **原始 LaTeX 源**：[raw/inbox/fourier-analysis-notes-2026-08-12.tex](../../raw/inbox/fourier-analysis-notes-2026-08-12.tex)（2250 行，含全部定理、证明与原始图示）

## 主题与背景

Stein & Shakarchi《Fourier Analysis: An Introduction》(2003) 通过五个不同背景引入傅里叶分析——圆群 [[fourier-series|$\mathbb{T}$]]、实直线 [[fourier-transform|$\mathbb{R}$]]、Euclid 空间 $\mathbb{R}^d$、有限循环群 $\mathbb{Z}(N)$ 与有限阿贝尔群 [[character|$G$]]。全书先在圆群上建立级数理论（第一至四章），再过渡到实直线上的积分理论（第五至六章），然后引入高维情形（第六章），最终抵达有限群上的纯代数理论（第七章）。

本笔记对全书做综合性总结，由两编组成：

- **第一编·傅里叶分析理论**：五个场景、好核与求和法、唯一性、双射性、Poisson 求和与补充工具、双重跃迁。
- **第二编·应用**：等周不等式、数论中的 Fourier 观点、PDE（Dirichlet 问题、热方程、波动方程）。

## 观察主轴：群的紧性

贯穿全讲义的一条观察主轴是**群的紧性**——该说法由 AI 提供，在 Stein 原书中并未抽象出来。从书中的处理自然能发现两条平行的处理路线：

- **紧群**（[[fourier-series|$\mathbb{T}$]]、$\mathbb{Z}(N)$、有限阿贝尔群 $G$）：正交关系以 Kronecker 记号 $\delta_{\lambda\mu}$ 表达，频率集为离散群，反演为级数 $\sum \hat{f}(\lambda)\,e_\lambda$，Parseval 为求和 $\|f\|_2^2 = \sum |\hat{f}(\lambda)|^2$。
- **非紧群**（[[fourier-transform|$\mathbb{R}$]]、$\mathbb{R}^d$）：正交性退化为 Dirac 分布 $\delta(\xi-\eta)$，频率集为连续群，反演为积分 $\int \hat{f}(\xi)\,e_\xi\,d\xi$，Parseval 为积分 $\|f\|_2^2 = \int |\hat{f}(\xi)|^2\,d\xi$。

两类之间的桥梁是 [[poisson-summation-formula|Poisson 求和公式]] $\sum_n f(n) = \sum_n \hat{f}(n)$，将 $\mathbb{R}$ 上的函数经 $\mathbb{Z}$-周期化映射到 $\mathbb{T}$。

| 群 $G$ | 紧性 | 指数函数 | 频率集 | 正交性形式 | 反演 | Parseval 形式 |
|--------|------|----------|--------|------------|------|---------------|
| $\mathbb{T}$ | 紧 | $e_n(\theta) = e^{2\pi i n\theta}$ | $\mathbb{Z}$（离散） | Kronecker $\delta_{nm}$ | 级数 $\sum \hat{f}(n)\,e^{2\pi i n\theta}$ | $\sum \lvert\hat{f}(n)\rvert^2$ |
| $\mathbb{R}$ | 非紧 | $e_\xi(x) = e^{2\pi i \xi x}$ | $\mathbb{R}$（连续） | Dirac $\delta(\xi-\eta)$ | 积分 $\int \hat{f}(\xi)\,e^{2\pi i \xi x}\,d\xi$ | $\int \lvert\hat{f}(\xi)\rvert^2\,d\xi$ |
| $\mathbb{R}^d$ | 非紧 | $e_\xi(x) = e^{2\pi i x\cdot\xi}$ | $\mathbb{R}^d$ | Dirac $\delta(\xi-\eta)$ | 积分 $\int \hat{f}(\xi)\,e^{2\pi i x\cdot\xi}\,d\xi$ | $\int \lvert\hat{f}(\xi)\rvert^2\,d\xi$ |
| $\mathbb{Z}(N)$ | 紧（有限） | $e_\ell(k) = e^{2\pi i \ell k/N}$ | $\mathbb{Z}(N)$ | Kronecker $\delta_{\ell m}$（有限和） | 有限和 | 有限和 |
| 有限阿贝尔群 $G$ | 紧（有限） | 特征标 $e: G\to S^1$（[[character]]） | $\hat G$（有限） | Kronecker $\delta_{e,e'}$（有限和） | 有限和 | 有限和 |

---

## 第一编·傅里叶分析理论

### 第一章：五个场景——紧与非紧的观察主轴

#### §1.1 圆群 $\mathbb{T}$（紧）

傅里叶级数的物理动机来自弦振动与热传导。分离变量法引入基本振荡模式 $e_n(\theta) = e^{2\pi i n\theta}$，$n \in \mathbb{Z}$。详见 [[fourier-series]]。

**Fourier 系数定义**（Ch. 1）：$\hat{f}(n) = \int_0^1 f(\theta)\,e^{-2\pi i n\theta}\,d\theta$。

**正交关系**：$\int_0^1 e^{2\pi i n\theta}\,\overline{e^{2\pi i m\theta}}\,d\theta = \delta_{n,m}$。

**Bessel 不等式**：$\sum_{n \in \mathbb{Z}} |\hat{f}(n)|^2 \leq \|f\|_{L^2}^2$。

**反演问题**：部分和 $S_N(f) = f * D_N$（$D_N$ 为 Dirichlet 核）。$C^2$ 函数 Fourier 系数满足 $|\hat{f}(n)| = O(1/|n|^2)$（Ch. 2 Corollary 2.4），从而级数绝对一致收敛。一般连续函数的部分和可能发散（du Bois-Reymond 反例），补救方法是 Cesàro 或 Abel 求和。

#### §1.2 实直线 $\mathbb{R}$（非紧）

紧性的丧失导致两个变化：反演由级数变为积分，正交性由 Kronecker delta 退化为 Dirac delta 分布。

试图计算 $\int_{-\infty}^\infty e^{2\pi i(\xi-\eta)x}\,dx$：在 Riemann 意义下不收敛，在分布意义下为 $\delta(\xi-\eta)$。这意味着 $\mathbb{R}$ 上指数函数不再是 Hilbert 空间 $L^2(\mathbb{R})$ 中的向量。

**Fourier 变换定义**（Ch. 5 Theorem 1.1）：$f$ 满足中速递降条件（$|f(x)| \leq A/(1+x^2)$），则 $\hat{f}(\xi) = \int_{-\infty}^\infty f(x)\,e^{-2\pi i \xi x}\,dx$。

**Schwartz 空间**（详见 [[schwartz-space]]）的引入是非紧群上 Fourier 分析的必需品。常数函数 $f(x) = 1$ 在 $\mathbb{T}$ 上可积，但在 $\mathbb{R}$ 上 $\int 1\,dx = \infty$。Schwartz 空间通过要求无穷远处极速衰减，人为替代紧性。

**Fourier 变换的封闭性**（Ch. 5 Theorem 1.3）：若 $f \in \mathcal{S}(\mathbb{R})$，则 $\hat{f} \in \mathcal{S}(\mathbb{R})$。证明依赖 $\widehat{f'} = 2\pi i\xi \hat{f}$ 与 $\widehat{-2\pi i xf} = \hat{f}'$ 两条规则。

**乘法公式**（Ch. 5 Proposition 1.8）：$\int f(x)\,\hat{g}(x)\,dx = \int \hat{f}(\xi)\,g(\xi)\,d\xi$。这是 $\mathbb{R}$ 上正交性的「弱形式」，通过 Fubini 定理（积分交换）间接建立。

**Fourier 反演公式**（Ch. 5 Theorem 1.9）：$f(x) = \int \hat{f}(\xi)\,e^{2\pi i \xi x}\,d\xi$（$f \in \mathcal{S}(\mathbb{R})$）。

证明思路：引入高斯衰减因子 $e^{-\pi\delta\xi^2}$（$\delta > 0$）使积分绝对收敛，交换次序后得卷积 $I_\delta(x) = (f * K_\delta)(x)$，$K_\delta$ 是高斯好核。由 [[good-kernel|好核]]逼近性质，$\lim_{\delta \to 0}(f*K_\delta)(x) = f(x)$。

**Plancherel 定理**（Ch. 5 Theorem 1.12）：$\int |f|^2 = \int |\hat{f}|^2$。证明：令 $\tilde{f}(x) = \overline{f(-x)}$，$\hat{\tilde{f}} = \overline{\hat{f}}$，$h = f * \tilde{f}$，$\hat{h} = |\hat{f}|^2$。在反演公式中令 $x = 0$ 即得。

注意此证明的逻辑：Plancherel 等式是反演公式和卷积定理的**直接推论**，完全绕开了正交性。这与圆群上的逻辑形成鲜明对照——在 $\mathbb{T}$ 上，Plancherel（Parseval）是正交性与完备性的推论。

#### §1.3 $\mathbb{R}^d$（非紧）

$\mathbb{R}^d$ 上 Fourier 变换继承了 $\mathbb{R}$ 上的一切分析困难，但引入新的几何对称性——旋转。若 $R \in SO(d)$，则 $\widehat{f \circ R}(\xi) = \hat{f}(R\xi)$。径向函数的 Fourier 变换导出 Bessel 函数核：在 $\mathbb{R}^2$ 中为零阶 Bessel $J_0$（Hankel 变换），在 $\mathbb{R}^3$ 中为半整数阶 $J_{1/2}$（可化为初等函数）。

Stein 在 Ch. 6 中利用球面平均求解 $\mathbb{R}^3$ 上的波动方程（Kirchhoff 公式，Theorem 3.6），揭示 Huygens 原理：三维空间中波的传播只依赖球面边界上的值。

#### §1.4 $\mathbb{Z}(N)$（有限紧）

$\mathbb{Z}(N) = \mathbb{Z}/N\mathbb{Z}$ 是 $N$ 阶循环群。**既紧又离散**：有限性保证紧性，离散拓扑保证每个子集既开又闭。

离散 Fourier 变换：$\hat{f}(\ell) = \frac{1}{N}\sum_{k=0}^{N-1} f(k)\,e^{-2\pi i \ell k/N}$。

正交关系、反演、Parseval 均为精确有限和等式。指数函数 $\{e_\ell\}$ 构成 $\mathbb{C}^N$ 的一组正交基——「紧性保证分析运算自动成立」的极端体现。

#### §1.5 有限阿贝尔群 $G$：特征标的正式定义

至此抵达 Stein 正式引入「特征标」一词的位置（Ch. 7 §2.2, p. 230）。详见 [[character]]。

**特征标定义**：$G$ 是有限阿贝尔群，特征标是群同态 $e: G \to S^1$，满足 $e(ab) = e(a)e(b)$。$G$ 上所有特征标的集合 $\hat G$ 在逐点乘法下构成对偶群。

**Ch. 7 Lemma 2.4**：若 $e$ 非平凡，$\sum_{a \in G} e(a) = 0$。证明：取 $b$ 使 $e(b) \neq 1$，$a \mapsto ba$ 是 $G$ 的置换，故 $e(b)\sum e(a) = \sum e(ba) = \sum e(a)$，得 $\sum e(a) = 0$。

**正交关系**（Ch. 7 Theorem 2.3）：$(e, e') = \delta_{e,e'}$（在 $G$ 的归一化内积下）。

**Fourier 反演**（Ch. 7 Theorem 2.7）：$f(a) = \sum_{e \in \hat G} \hat{f}(e)\,e(a)$。**Parseval 等式**：$\|f\|^2 = \sum_e |\hat{f}(e)|^2$。

---

### 第二章：好核、求和法与古典框架

详见 [[good-kernel]]。

**好核三条件**（Ch. 2 §1）：归一化 $\int K_N = 1$、集中性 $\int_{\delta \leq |\theta| \leq 1/2} |K_N| \to 0$、一致可积性 $\int |K_N| \leq C$。

**好核定理**（Ch. 2 Theorem 1.2）：若 $\{K_N\}$ 是好核族，$f$ 在 $\theta_0$ 处连续，则 $\lim (f * K_N)(\theta_0) = f(\theta_0)$。

**Dirichlet 核**：$D_N(\theta) = \frac{\sin((N+\tfrac12)2\pi\theta)}{\sin(\pi\theta)}$，$\|D_N\|_{L^1} \sim \log N$——不满足条件 (iii)，不是好核。

**Fejér 核**：$F_N(\theta) = \frac{1}{N}\left(\frac{\sin(N\pi\theta)}{\sin(\pi\theta)}\right)^2$，非负、$L^1$ 范数有界——是好核。

**Fejér 定理**（Ch. 2 Theorem 5.2）：$\sigma_N(f) = \frac{1}{N}\sum_{k=0}^{N-1} S_k(f)$，连续函数 $f$ 上 $\sigma_N(f) \to f$ 一致收敛。

**Parseval 等式**（Ch. 3 Theorem 1.2）：$\sum |\hat{f}(n)|^2 = \|f\|_{L^2}^2$。证明依赖 Fejér 定理与 $L^2$ 收敛。

**Cesàro 求和**（频域三角形窗口）vs **Abel 求和**（频域指数衰减 $r^{|n|}$）。Poisson 核 $P_r(\theta) = \frac{1-r^2}{1-2r\cos(2\pi\theta)+r^2}$ 是好核且非负，$f * P_r$ 给出单位圆盘上 Dirichlet 问题的解。

---

### 第三章：唯一性定理

**唯一性定理**（Ch. 2 Theorem 2.1）：若 $f$ 在 $\mathbb{T}$ 上可积且 $\hat{f}(n) = 0$ 对所有 $n$，则 $f(\theta_0) = 0$ 在每个连续点 $\theta_0$ 处。

**证明一：尖峰构造**。取引理中的尖峰多项式 $p_k(\theta) = [\varepsilon + \cos(2\pi\theta)]^k$。在 $\theta = 0$ 附近 $p_k > 1$，故 $p_k(0) \to \infty$；对 $|\theta| \geq \delta$，$|p_k(\theta)| \to 0$ 一致。因 $\hat{f}(n) = 0$，$\int f(\theta)\,p_k(\theta)\,d\theta = 0$，但分区域估计给出 $\int f\,p_k \to \infty$，矛盾。

**证明二：Fejér 核法**（Ch. 2 Corollary 5.3）。$\sigma_N(f) = 0$ 对所有 $N$，由 Fejér 定理得 $f(\theta_0) = 0$。

**与幂级数唯一性的类比**：两者均「系数为零则函数为零」，但依赖结构不同——幂级数依赖解析性，Fourier 级数依赖正交性与逼近。

**Weierstrass 三角逼近**（Ch. 2 Corollary 5.4）：$\mathbb{T}$ 上任意连续函数可被三角多项式一致逼近。证明：$\sigma_N(f) = \sum (1-|n|/N)\hat{f}(n)\,e^{2\pi i n\theta}$，由 Fejér 定理一致收敛到 $f$。

唯一性是逼近的「弱形式」（积分意义），逼近是唯一性的「强形式」（一致范数）。

**唯一性定理的应用**：

1. 绝对收敛级数等于原函数（Ch. 2 Corollary 2.3）
2. Dirichlet 问题解的唯一性（Ch. 2 Theorem 5.7(iii)）
3. [[poisson-summation-formula|Poisson 求和公式]]的证明——验证 $F_1, F_2$ Fourier 系数相同，由唯一性得相等
4. Radon 变换的唯一性（Ch. 6 Corollary 5.3）——Fourier slice theorem
5. 有限群上的唯一性（Ch. 7）——特征标构成正交基

---

### 第四章：双射性——从单射到满射

**单射性的失效**（Ch. 3 Example 2）：在 Riemann 可积函数空间 $\mathcal{R}$ 上，$f, g$ 仅在有限点不同的两个函数有相同 Fourier 系数（点态定义的 Riemann 积分不「看见」有限点上的值）。

**满射的失效**（Ch. 3 Remark 2）：存在 $\{a_n\} \in$ [[ellp-space|$\ell^2$]] 使得不存在 Riemann 可积 $F$ 满足 $\hat{F}(n) = a_n$。例：$a_k = 1/k$（$k \geq 1$），对应 $-\log|\theta|$ 类的发散。

**修复路径**：

- 限制到连续函数 $C(\mathbb{T})$——单射恢复，但 $L^2$ 范数下不完备
- 取 $L^2$ 等价类——Riesz-Fischer 定理恢复双射

**Riesz-Fischer 定理**：在 $L^2(\mathbb{T})$ 中 Fourier 变换是双射，且 $\|f\|_{L^2}^2 = \sum |\hat{f}(n)|^2$。

**$\mathcal{S}$ 上的双射性**（Ch. 5 Corollary 1.10）：$\mathcal{F}: \mathcal{S}(\mathbb{R}) \to \mathcal{S}(\mathbb{R})$ 是双射（详见 [[schwartz-space]]）。

**单射/满射/双射对照表**：

| 场景 | 空间 | 单射？ | 满射？ | 双射？ | 失效原因 |
|------|------|--------|--------|--------|----------|
| 有限群 $G$ | 所有函数（有限维） | 是 | 是 | **是** | — |
| 圆群，连续函数 | $C(\mathbb{T})$ | 是 | 否 | 否 | 非所有 $\ell^2$（[[ellp-space]]）序列对应连续函数 |
| 圆群，Riemann 可积 | $\mathcal{R}$ | 否 | 否 | 否 | 点态值不可见；空间不完备 |
| 圆群，$L^2$ | $L^2(\mathbb{T})$ | 是 | 是 | **是** | —（Riesz-Fischer） |
| $\mathbb{R}$，Schwartz | $\mathcal{S}(\mathbb{R})$ | 是 | 是 | **是** | —（Cor 1.10） |
| $\mathbb{R}$，$L^2$ | $L^2(\mathbb{R})$ | 是 | 是 | **是** | —（Plancherel 扩张） |

---

### 第五章：Poisson 求和与补充工具

#### §5.1 Poisson 求和公式（详见 [[poisson-summation-formula]]）

对 $f \in \mathcal{S}(\mathbb{R})$，
$$
\sum_{n \in \mathbb{Z}} f(n) = \sum_{n \in \mathbb{Z}} \hat{f}(n).
$$

**群论诠释**：$G = \mathbb{R}$，$H = \mathbb{Z}$，商群 $G/H = \mathbb{R}/\mathbb{Z} \cong \mathbb{T}$。左端 $\sum_n f(x+n)$ 是沿 $H$ 的周期化（下推到 $G/H$），右端是 $\hat{f}$ 限制到 $H^\perp = \mathbb{Z} \cong \widehat{G/H}$ 后用 Fourier 级数重构。**主对偶关系** $\widehat{G/H} \cong H^\perp$。

**直接应用**：

- **theta 函数方程**（Ch. 5 Theorem 3.2）：$\vartheta(s) = \sum_n e^{-\pi n^2 s}$ 满足 $\vartheta(s) = s^{-1/2}\vartheta(1/s)$。证明：对 $f(x) = e^{-\pi s x^2}$ 用 PSF，由 $\hat{f}(\xi) = s^{-1/2}e^{-\pi \xi^2/s}$。
- **圆上热核是直线上热核的周期化**（Ch. 5 Theorem 3.3）：$\mathcal{H}_t^{\mathbb{T}}(x) = \sum_n \mathcal{H}_t(x+n)$，$\mathcal{H}_t(x) = (4\pi t)^{-1/2}e^{-x^2/(4t)}$。
- **Poisson 核的对应**（Ch. 5 Theorem 3.5）：$P_r(x) = \sum_n P_y(x+n)$，其中 $r = e^{-2\pi y}$。

#### §5.2 Riemann 局部化原理（详见 [[riemann-localization]]）

详见 [[riemann-localization]]。要点：部分和 $S_N(f)(\theta_0)$ 的收敛行为只取决于 $f$ 在 $\theta_0$ 任意小邻域内的性态。证明依赖 $f$ 在 $\theta_0$ 可微时的衰减估计与 Riemann–Lebesgue 引理。

**与 Dirichlet 核非好核性质的对比**：$D_N$ 的 $L^1$ 范数 $\sim \log N$ 发散，导致 Fourier $S$ 部分和对一般连续函数可能发散。但可微性在 $\theta_0$ 局部「压制」了 Dirichlet 核的奇异性：$f(\theta_0-t) - f(\theta_0)$ 在 $t=0$ 附近提供额外的 $t$ 因子。

#### §5.3 Hermite 函数：Fourier 变换的特征函数

详见 [[good-kernel]]（Hermite 算子作为谱理论入口）。

**定义**（Ch. 5 Problem 7）：$h_k(x) = (-1)^k e^{x^2/2}\frac{d^k}{dx^k} e^{-x^2}$。重标定 $h_k^*(x) = h_k((2\pi)^{1/2}x)$ 与 Stein Fourier 约定相容。

**特征方程**（Ch. 5 Problem 7）：$\widehat{h_k^*}(\xi) = (-i)^k h_k^*(\xi)$。Hermite 函数构成 $L^2(\mathbb{R})$ 的正交基，特征值 $(-i)^k$ 遍历 $\{1, -i, -1, i\}$。

证明依赖生成函数 $\sum h_k^*(x) t^k/k! = e^{-\pi x^2 + 2(2\pi)^{1/2}tx - t^2}$。Fourier 变换后比较两端的生成函数，得 $\widehat{h_k^*} = (-i)^k h_k^*$。

**Hermite 算子** $L = -d^2/dx^2 + 4\pi^2 x^2$：$L h_k^* = (4\pi k + 2\pi) h_k^*$。升降算子 $A = d/dx + 2\pi x$ 满足 $A^\dagger A = L - 2\pi$。

**与不确定性原理的联系**：Heisenberg 不确定性原理（Ch. 5 Theorem 4.1）的极值函数为高斯函数 $Ae^{-Bx^2}$，恰为 $h_0^*$（特征值 $1$）——**不确定性原理的极值函数恰为 Fourier 变换的不动点**。

#### §5.4 Shannon 采样定理

详见 [[good-kernel]] 与 [[riemann-localization]] 的联系。

**Shannon 采样定理**（Ch. 5 Exercise 20）：若 $\text{supp}(\hat{f}) \subseteq [-1/2, 1/2]$，则 $f(x) = \sum_n f(n)\,K(x-n)$，其中 $K(y) = \frac{\sin\pi y}{\pi y}$。**离散 Plancherel**：$\int |f(x)|^2\,dx = \sum |f(n)|^2$。

**过采样**（Ex. 20(b)）：$\lambda > 1$，$f(x) = \sum_n \frac{1}{\lambda} f(n/\lambda) K_\lambda(x - n/\lambda)$，$K_\lambda(y) = O(1/y^2)$（比 $K(y) = O(1/y)$ 收敛更快）。

**与 Poisson 求和的关系**：采样定理是 Poisson 求和公式的逆问题。PSF 由 $f$ 在 $\mathbb{Z}$ 上的值重构**周期化** $\sum_n f(x+n)$；采样定理在 $\hat{f}$ 带限条件下重构 $f$ 本身。

---

### 第六章：双重跃迁——离散性与紧性

#### §6.1 Tao "epsilon 余量" 极限论证

陶哲轩《Give yourself an epsilon of room》阐述：当面对无限、非紧、奇点或不可逆情形时，直接操作往往非法。须引入正则化参数、截断边界或衰减因子，在严格收敛的函数空间中完成代数操作，再通过极限收回结果。

**硬分析 vs 软分析**：硬分析以有限、定量、带显式界估计为特征；软分析以无限、定性、存在性为特征。

**Tao 方法论在 Fourier 分析中的四种体现**：

| 体现 | 服务的跃迁 | 正则化方式 | 扩张目标 |
|------|------------|------------|----------|
| Schwartz 空间 $\mathcal{S}$ | 紧性跃迁（$\mathbb{T} \to \mathbb{R}$） | 无穷远处多项式衰减 | $L^2(\mathbb{R})$（稠密扩张） |
| 高斯衰减因子 $e^{-\pi\delta\xi^2}$ | $\mathbb{R}$ 上反演证明 | 频率域的衰减参数 $\delta > 0$ | 反演公式（$\delta \to 0$） |
| 分部积分 $\lvert a_N(n)\rvert \leq c/\lvert n\rvert^2$ | 离散性跃迁 | 级数尾部的多项式控制 | $C^2(\mathbb{T})$ 反演 |
| 好核（Fejér、Poisson、Gauss） | 离散性跃迁 + $\mathbb{T}$ 上点态收敛 | 频域硬截断处的光滑过渡 | $C(\mathbb{T})$（一致收敛） |

#### §6.2 两个维度的跃迁

**离散性跃迁 $\mathbb{Z}(N) \to \mathbb{T}$**：保留紧性，改变离散性。有限和变为无穷级数，需衰减估计保证尾部可略。频谱由 $N$ 个离散频率变为可数无穷个，仍为 Kronecker $\delta$。**所需工具仅是好核与衰减估计，无需 Schwartz 空间或分布**。

**紧性跃迁 $\mathbb{T} \to \mathbb{R}$**：破坏正交基语言。三重变化：级数→积分、离散对偶→连续对偶、Kronecker $\delta$→Dirac 分布。**必须引入 Schwartz 空间以替代紧性**。

两条跃迁正交：保持其一而变化另一，分析困难完全不同。

#### §6.3 正交性的拓扑根源

**紧群的离散对偶与非紧群的连续对偶**（Pontryagin 对偶）：$G$ 紧 $\Leftrightarrow$ $\hat G$ 离散；$G$ 离散 $\Leftrightarrow$ $\hat G$ 紧。

具体地：

- $\mathbb{T}$ 紧 $\Rightarrow$ $\hat{\mathbb{T}} \cong \mathbb{Z}$ 离散
- $\mathbb{R}$ 非紧连续 $\Rightarrow$ $\hat{\mathbb{R}} \cong \mathbb{R}$ 连续
- $\mathbb{Z}$ 离散非紧 $\Rightarrow$ $\hat{\mathbb{Z}} \cong \mathbb{T}$ 紧
- $\mathbb{Z}(N)$ 有限（既紧又离散）$\Rightarrow$ 自对偶
- 有限阿贝尔群 $G$ $\Rightarrow$ $\hat G$ 有限，$|\hat G| = |G|$

**逻辑链倒置**：

- **紧群**（$\mathbb{T}$、有限阿贝尔群）：正交性 → Bessel → 好核 → Parseval（求和）。正交性是起点，Parseval 是终点。
- **非紧群**（$\mathbb{R}$）：$\mathcal{S}$ → 乘法公式 → 反演 → Plancherel → 广义正交性（分布 $\delta$）。反演与 Plancherel 是起点，正交性是终点且只在分布意义下成立。

---

## 第二编·应用

### 第七章：等周不等式

**等周不等式**（Ch. 4 Theorem 1.1, Hurwitz 1901）：设 $\Gamma$ 是 $\mathbb{R}^2$ 中长度为 $L$ 的简单闭曲线，所围面积 $A$ 满足 $A \leq L^2/(4\pi)$，等号成立当且仅当 $\Gamma$ 是圆周。

**Hurwitz 证明（三步翻译）**：

1. **几何 → 函数**：以弧长 $s \in [0, 2\pi]$ 为参数化 $\gamma(s) = (x(s), y(s))$，弧长条件 $x'^2 + y'^2 = 1$；面积 $A = \frac{1}{2}|\int(xy' - yx')\,ds|$（Green 公式）。
2. **函数 → 系数**：Parseval 恒等式将弧长条件翻译为频域 $\sum n^2(|a_n|^2 + |b_n|^2) = 1$；面积翻译为 $\pi|\sum n(a_n \overline{b_n} - b_n \overline{a_n})|$。
3. **系数 → 代数不等式**：由 $|a\overline{b} - b\overline{a}| \leq |a|^2 + |b|^2$（AM-GM）与 $|n| \leq n^2$，得 $A \leq \pi \sum n^2(|a_n|^2 + |b_n|^2) = \pi$。

**等号条件**：仅 $n = 0, \pm 1$ 系数可能非零，$|a_1| = |b_1| = 1/2$，相位差 $\pi/2$——恰为圆周。

**与变分法的对比**：变分法给出必要条件（曲率为常数），但需额外论证存在性、二阶变分、唯一性；Hurwitz 证明完全化约为代数不等式，不涉及微分方程。

**遗留问题**（Stein 在 p. 105 标注）：

- (i) "$\Gamma$ 所围区域"的定义——Jordan 曲线定理（拓扑学）
- (ii) "面积"与 Green 公式的一致性——测度论
- (iii) 可求长曲线的推广——几何测度论

---

### 第八章：数论中的 Fourier 观点

#### §8.1 Weyl 等分布定理

**等分布**：序列 $\{\xi_n\}_{n=1}^\infty$ 在 $[0, 1)$ 等分布，若 $\lim \frac{1}{N}\#\{1 \leq n \leq N : \xi_n \in (a,b)\} = b-a$。

**Weyl 判别法**（Ch. 4 Theorem 2.3）：序列等分布当且仅当对所有 $k \neq 0$，$\lim \frac{1}{N}\sum_n e^{2\pi i k \xi_n} = 0$。

证明：对 $k \neq 0$，$\sum_n e^{2\pi i k \xi_n} = e^{2\pi i k \gamma} \cdot \frac{1 - e^{2\pi i k N\gamma}}{1 - e^{2\pi i k \gamma}}$（$\gamma$ 无理时 $e^{2\pi i k\gamma} \neq 1$）；由线性性对三角多项式成立；由 [[good-kernel|Fejér 定理]]对连续函数成立；最后由连续函数逼近指示函数。

#### §8.2 Dirichlet 定理（详见 [[dirichlet-theorem-on-primes]]）

**Dirichlet 特征标**（Ch. 8）：模 $q$ 的 Dirichlet 特征标 $\chi$ 是 $\mathbb{Z}^*(q)$（有限阿贝尔群）上特征标的扩展。满足完全乘性 $\chi(mn) = \chi(m)\chi(n)$。

**同余类指示函数的特征标展开**（Ch. 8 Lemma 2.2）：$\delta_\ell(n) = \frac{1}{\varphi(q)} \sum_\chi \overline{\chi(\ell)}\,\chi(n)$。

**证明 Fourier 部分**：$\sum_{p \equiv \ell \pmod q} \frac{1}{p^s} = \frac{1}{\varphi(q)}\sum_p \frac{1}{p^s} + \frac{1}{\varphi(q)}\sum_{\chi \neq \chi_0} \overline{\chi(\ell)} \sum_p \frac{\chi(p)}{p^s}$（主项 + 非平凡项）。主项当 $s \to 1^+$ 发散（Euler 定理），故只需证非平凡项有界。

#### §8.3 Dirichlet $L$-函数与 $L(1, \chi) \neq 0$

**Euler 乘积**（Ch. 8 Theorem 2.4）：$L(s, \chi) = \prod_p \frac{1}{1 - \chi(p)/p^s}$。乘性来自特征标的群同态性——这是 Fourier 方法留给解析数论的接口。

取对数：$\log L(s, \chi) = \sum_p \frac{\chi(p)}{p^s} + O(1)$（$s \to 1^+$）。故非平凡项有界 $\Leftrightarrow$ $L(1, \chi) \neq 0$。

**$L(1, \chi) \neq 0$** 的证明分两种情形：

- **复特征标**（$\chi \neq \overline{\chi}$）：$\prod_\chi L(s, \chi) \geq 1$（Ch. 8 Lemma 3.8）。若 $L(1, \chi) = 0$，则 $L(1, \overline{\chi}) = \overline{L(1, \chi)} = 0$，乘积至少两个零因子。平凡特征标的 $L$-函数 $L(s, \chi_0)$ 在 $s = 1$ 处至多有 $O(1/|s-1|)$ 的极点，无法抵消两个零点，矛盾。
- **实特征标**（$\chi = \overline{\chi}$）：用**双曲线求和法**。定义 $S_N = \sum_{m, n} \chi(m)\chi(n)/\sqrt{m^2+n^2}$（$m^2+n^2 \leq N^2$）。下界 $S_N \geq c\log N$（Ch. 8 Prop 3.13(i)）；渐近 $S_N = 2\sqrt{N}\,L(1, \chi) + O(1)$（Prop 3.13(ii)）。若 $L(1, \chi) = 0$ 则 $S_N = O(1)$，与 $S_N \to \infty$ 矛盾。

#### §8.4 Poisson 求和、theta 函数与 zeta 函数方程

**theta 函数的函数方程**（Ch. 5 Theorem 3.2）：$\vartheta(t) = t^{-1/2}\vartheta(1/t)$。由 [[poisson-summation-formula|PSF]] 对 $f(x) = e^{-\pi t x^2}$ 应用即得。

**zeta 函数的函数方程**（Ch. 5 Theorem 3.3）：$\xi(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s)$ 满足 $\xi(s) = \xi(1-s)$。由 Mellin 变换与 theta 方程推出。

---

### 第九章：偏微分方程

#### §9.1 Dirichlet 问题与唯一性

**Poisson 积分公式**（Ch. 5 §2.2）：$u(x, y) = (f * P_y)(x)$，$P_y(x) = \frac{1}{\pi}\frac{y}{x^2+y^2}$。在 $\mathbb{R}^2_+$ 调和，$u \to f$（$y \to 0$ 在连续点处）。

频域中：$\hat{u}(\xi, y) = \hat{f}(\xi)\,e^{-2\pi|\xi|y}$——Laplace 方程在频域中对角化。

**唯一性的两种方法**：

- **平均值原理**（Ch. 5 Theorem 2.7）：调和函数 $u$ 在 $\mathbb{R}^2_+$ 上调和、衰减、边界值为零 $\Rightarrow u \equiv 0$。依赖平均值性质 $u(x_0) = $ 球面平均（极值原理）。
- **能量法**（Ch. 5 Theorem 2.3）：定义 $E(t) = \int |u|^2$，$\frac{dE}{dt} = -2\int |\partial_x u|^2 \leq 0$，$E(0) = 0 \Rightarrow u \equiv 0$。

**对比**：

| 维度 | 平均值原理 | 能量法 |
|------|-----------|--------|
| 方程类型 | 椭圆型（$\Delta u = 0$） | 抛物型（$\partial_t u = \Delta u$） |
| 物理直觉 | 平衡态温度不能高于周围平均 | 耗散系统能量递减 |
| 数学内容 | $\Delta u = 0 \Rightarrow u = $ 球面平均 | $\int u \Delta u = -\int \lvert\nabla u\rvert^2 \leq 0$ |
| 适用 | 椭圆型 | 抛物型与双曲型（波动方程能量守恒） |

#### §9.2 热扩散方程与好核

**$\mathbb{R}$ 上的热核**（Ch. 5 §2.1）：$H_t(x) = (4\pi t)^{-1/2}e^{-x^2/(4t)}$。$u(x, t) = (f * H_t)(x)$ 满足 $\partial_t u = \partial_x^2 u$，$u(x, 0) = f(x)$。

证明：频域中 $\partial_t \hat{u} = -4\pi^2 \xi^2 \hat{u}$，解 $\hat{u}(\xi, t) = \hat{f}(\xi)\,e^{-4\pi^2 \xi^2 t}$。$H_t$ 为 Gauss 函数，是好核。

**圆上的热核**（Ch. 4 §4）：$\mathcal{H}_t(x) = \sum_n e^{-4\pi^2 n^2 t}\,e^{2\pi i n x}$。

**[[poisson-summation-formula|PSF]] 将两者焊接**：$\mathcal{H}_t^{\mathbb{T}}(x) = \sum_n \mathcal{H}_t(x+n)$（Ch. 5 Theorem 3.3）。

**子从属原理**（Ch. 6 Exercise 8）：Poisson 核可表示为热核的加权积分 $P_y(x) = \int_0^\infty H_t(x)\,w(t, y)\,dt$，$w(t, y) = \frac{y}{(4\pi t^3)^{1/2}} e^{-y^2/(4t)}$。**平衡态是所有时刻扩散过程的加权平均**。

---

## 跨章节综合

### 紧/非紧观察主轴的统一性

五个场景表面上分散，但可用单一主轴理解——**群的紧性**。紧性决定：

1. **频谱结构**：紧群 → 离散对偶；非紧群 → 连续对偶
2. **正交性**：紧群 → Kronecker $\delta$；非紧群 → Dirac $\delta$（分布）
3. **Parseval 形式**：紧群 → 求和；非紧群 → 积分
4. **所需工具**：紧群 → 好核（Fejér、Poisson、Gauss）；非紧群 → Schwartz 空间 + Plancherel 扩张

**Schwartz 空间是「人工施加的紧性」**：在非紧群上通过要求无穷远处极速衰减，替代紧群上的自动有界性。

### 紧群 vs 非紧群的逻辑倒置

- **紧群**（自下而上）：正交性（直接计算）→ Bessel（正交投影）→ 好核逼近（Fejér）→ Parseval（求和）
- **非紧群**（自上而下）：Schwartz 空间 → 乘法公式（Fubini）→ 反演（高斯好核逼近）→ Plancherel（反演 + 卷积）→ 广义正交性（分布 $\delta$）

### Fourier 方法的核心机制：翻译

所有应用都可归结为「翻译」机制：

- **物理 → 数学**：分离变量 → 频率作为分离常数
- **几何 → 函数**：弧长参数化（等周不等式）
- **算术 → 分析**：同余类 → 特征标展开（Dirichlet 定理）
- **积分 → 求和**：PSF 的反向应用（theta 函数方程）
- **演化 → 平衡**：子从属原理（热核 → Poisson 核）

每一步翻译都将问题的非线性结构线性化，使后续推理可化约为代数不等式或标准定理。

### Tao "epsilon 余量" 的服务对象

四种典型工具——$\mathcal{S}$ 空间、高斯衰减因子 $e^{-\pi\delta\xi^2}$、分部积分 $O(1/n^2)$、好核——在 Tao 框架下统一，但服务的跃迁不同：

- $\mathcal{S}$ 与高斯衰减因子 → 紧性跃迁（$\mathbb{T} \to \mathbb{R}$）
- 分部积分与好核 → 离散性跃迁（$\mathbb{Z}(N) \to \mathbb{T}$）与 $\mathbb{T}$ 上点态收敛

---

## 待澄清与下一步

- [ ] Hermite 函数谱分解（$\mathcal{F}^4 = \text{Id}$，$h_k^*$ 给出特征空间）的完整证明与物理诠释
- [ ] Heisenberg 不确定性原理（Ch. 5 Theorem 4.1）的极值函数与 Hermite 函数 $h_0^*$ 的关系
- [ ] Paley-Wiener 定理与 Hermite 函数在「频率域紧支 ↔ 物理空间整函数」对偶中的角色
- [ ] 紧群与非紧群的 Pontryagin 对偶理论——本笔记 §6.3 仅给出梗概，完整论述需参考 Rudin《Fourier Analysis on Groups》或 Hewitt–Ross
- [ ] 实特征标情形 $L(1, \chi) \neq 0$ 的双曲线求和法细节——本笔记仅给出梗概
- [ ] 等周不等式遗留问题（i）(ii)(iii) 的完整处理——需 Jordan 曲线定理、Green 公式的严格化、几何测度论

## 关联

- 涉及的 wiki 实体：
  - 概念：[[fourier-series]]、[[fourier-transform]]、[[schwartz-space]]、[[lp-space]]、[[good-kernel]]、[[character]]
  - 定理：[[poisson-summation-formula]]、[[riemann-localization]]、[[dirichlet-theorem-on-primes]]、[[paley-wiener-theorem]]、[[phragmen-lindelof-theorem]]
  - 引理：[[modulus-of-complex-exponential]]、[[multiplicativity-of-modulus]]、[[integer-periodicity-of-exponential]]、[[cauchy-schwarz-inequality]]
- 引用源：[[steinFourierAnalysisIntroduction2003a]]
- 原始资料：[raw/inbox/fourier-analysis-notes-2026-08-12.tex](../../raw/inbox/fourier-analysis-notes-2026-08-12.tex)