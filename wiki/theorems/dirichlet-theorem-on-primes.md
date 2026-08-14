---
type: theorem
title: Dirichlet 算术级数素数定理
aliases: [Dirichlet's theorem on primes in arithmetic progressions]
created: 2026-08-11
updated: 2026-08-11
sources: [chat-fourier-series-2026-08-11, steinFourierAnalysisIntroduction2003a]
status: pending-verification
tags: [number-theory, fourier-analysis]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$(\ell, q) = 1$（弱——$\ell$ 与 $q$ 互素，几乎所有等差数列均满足）；结论：等差数列 $\ell + kq$ 含无穷多素数（强——算术结论）。这是 Fourier 观点进入数论的标志性定理，结合 Dirichlet character 展开与 $L(1,\chi) \neq 0$。弱于 Chebotarev 密度定理（后者推广到任意 Galois 扩张）。
---
# Dirichlet 算术级数素数定理

> **工作空间**：有限阿贝尔群 $G = \mathbb{Z}^*(q)$（模 $q$ 的乘法群），其中 $q$ 为正整数。定理陈述与证明均在 $G$ 上的 Fourier 分析框架内进行。

## 陈述

> 设 $\ell, q$ 为正整数，$(\ell, q) = 1$（$\ell$ 与 $q$ 互素）。则等差数列
$$
\ell,\quad \ell + q,\quad \ell + 2q,\quad \ell + 3q,\quad \dots
$$
中含有无穷多个素数。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 8, Theorem 3.1]]。

## 前提条件

- $(\ell, q) = 1$。
- 关键的解析假设：$L(1, \chi) \neq 0$ 对所有非平凡 [[character|Dirichlet character]] $\chi$ 成立（Ch. 8, Theorem 3.12, Proposition 3.13）。

## 证明思路

### 第一步：指示函数的 Fourier 展开

定义同余类指示函数：
$$
\delta_\ell(n) = \begin{cases} 1, & n \equiv \ell \pmod{q}, \\ 0, & \text{otherwise}. \end{cases}
$$

Stein 在 Ch. 8, p. 254 写道：「We can **expand this function in a Fourier series** as follows」：
$$
\delta_\ell(n) = \sum_{e \in \hat{G}} \hat{\delta}_\ell(e)\,e(n),
$$
其中 $G = \mathbb{Z}^*(q)$（模 $q$ 的乘法群），$\hat{G}$ 为其对偶特征标群。

计算 Fourier 系数得（Lemma 2.2, p. 255）：
$$
\delta_\ell(m) = \frac{1}{\phi(q)}\sum_{\chi} \overline{\chi(\ell)}\,\chi(m),
$$
其中 $\chi$ 为扩展到 $\mathbb{Z}$ 上的 Dirichlet character。

### 第二步：素数求和的分解

由此得：
$$
\sum_{p \equiv \ell \pmod{q}} \frac{1}{p^s} = \frac{1}{\phi(q)}\sum_{\chi} \overline{\chi(\ell)} \sum_p \frac{\chi(p)}{p^s}.
$$

- **trivial character** 给出主项 $\frac{1}{\phi(q)}\sum_p 1/p^s$。
- **nontrivial characters** 的贡献必须被控制。

### 第三步：Euler 乘积激活

引入 Dirichlet $L$-函数：
$$
L(s, \chi) = \sum_{n=1}^\infty \frac{\chi(n)}{n^s}.
$$

由 Dirichlet character 的乘性 $\chi(nm) = \chi(n)\chi(m)$，可写为 Euler 乘积：
$$
L(s, \chi) = \prod_p \left(1 - \frac{\chi(p)}{p^s}\right)^{-1}.
$$

**关键步骤**：这一 Euler 乘积形式连接加法（等差数列）与乘法（素数分布）。

### 第四步：$L(1, \chi) \neq 0$ 的证明

证明的核心难点。Ch. 8, §3.3 分两种情形：

- **情形一（复特征标）**：通过 $\overline{L(s,\chi)} = L(s, \overline{\chi})$ 与 $L(s,\chi)L(s,\overline{\chi})$ 的乘积估计。
- **情形二（实特征标）**：通过**双曲线求和法**（hyperbolic sums）证明沿双曲线 $mn = k$ 的求和估计。

依据 [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验 D1–D6）]]。

## 详细证明

### 证明动机

Dirichlet 定理的证明将「等差数列中素数无穷多」这一算术问题转化为解析问题。核心洞察是：用[[finite-abelian-group|有限阿贝尔群]] $G = \mathbb{Z}^*(q)$ 上的 Fourier 分析将同余条件 $p \equiv \ell \pmod{q}$ 分解为特征标的线性组合，再用 $L$-函数的解析性质（特别是 $L(1, \chi) \neq 0$）控制各分量。证明的关键难点在最后一步：证明 $L(1, \chi) \neq 0$ 对所有非平凡特征标成立——这是整个论证的技术巅峰。

### 详细证明

**第一阶段：指示函数的 Fourier 展开**。

定义同余类指示函数：
$$
\delta_\ell(n) = \begin{cases} 1, & n \equiv \ell \pmod{q},\ (n, q) = 1, \\ 0, & \text{otherwise}. \end{cases}
$$

视 $\delta_\ell$ 为有限阿贝尔群 $G = \mathbb{Z}^*(q)$ 上的函数（仅在 $G$ 的元素上取值）。由有限阿贝尔群上的 Fourier 分析（[[steinFourierAnalysisIntroduction2003a|Stein, Ch. 7, §2]]），
$$
\delta_\ell(n) = \sum_{\chi \in \hat{G}} \hat{\delta}_\ell(\chi)\, \chi(n), \qquad n \in G,
$$
其中 $\hat{G}$ 为 $G$ 的对偶群（即所有 Dirichlet [[character|character]] 的集合），[[fourier-coefficient|Fourier 系数]]为
$$
\hat{\delta}_\ell(\chi) = \frac{1}{|G|} \sum_{m \in G} \delta_\ell(m)\, \overline{\chi(m)} = \frac{1}{\phi(q)} \overline{\chi(\ell)}.
$$

**Claim 1**（Fourier 系数的计算）. $\hat{\delta}_\ell(\chi) = \frac{1}{\phi(q)} \overline{\chi(\ell)}$。

*证明.* 由 Fourier 系数定义，
$$
\hat{\delta}_\ell(\chi) = \frac{1}{\phi(q)} \sum_{m \in \mathbb{Z}^*(q)} \delta_\ell(m)\, \overline{\chi(m)}.
$$
因 $\delta_\ell(m) = 1$ 当且仅当 $m = \ell$（在 $G$ 中），其余为零，故
$$
\hat{\delta}_\ell(\chi) = \frac{1}{\phi(q)} \overline{\chi(\ell)}.
$$
此为定义的直接代入。$\blacksquare$

将 $\chi$ 延拓到 $\mathbb{Z}$（令 $\chi(n) = 0$ 当 $(n, q) \neq 1$），对 $n \in \mathbb{Z}$ 有
$$
\delta_\ell(n) = \frac{1}{\phi(q)} \sum_{\chi} \overline{\chi(\ell)}\, \chi(n). \tag{1}
$$

**第二阶段：素数求和的分解**。

对 $\operatorname{Re}(s) > 1$，将 (1) 代入素数倒数和：
$$
\sum_{\substack{p \leq N \\ p \equiv \ell \pmod{q}}} \frac{1}{p^s} = \sum_{p \leq N} \frac{\delta_\ell(p)}{p^s} = \frac{1}{\phi(q)} \sum_{\chi} \overline{\chi(\ell)} \sum_{p \leq N} \frac{\chi(p)}{p^s}. \tag{2}
$$

右侧分为两部分：
- **平凡特征标** $\chi_0$（$\chi_0(n) = 1$ 当 $(n,q)=1$，否则 $0$）：贡献 $\frac{1}{\phi(q)} \sum_{p \nmid q} \frac{1}{p^s}$。
- **非平凡特征标** $\chi \neq \chi_0$：贡献 $\frac{1}{\phi(q)} \sum_{\chi \neq \chi_0} \overline{\chi(\ell)} \sum_p \frac{\chi(p)}{p^s}$。

由 Euler 的定理（$\sum_p 1/p^s \to \infty$ 当 $s \to 1^+$），平凡特征标的贡献在 $s \to 1^+$ 时发散。若能证明非平凡特征标的贡献在 $s \to 1^+$ 时保持有界，则 (2) 左端 $\to \infty$，从而等差数列中素数有无穷多个。

**第三阶段：Euler 乘积与 $L$-函数的联系**。

引入 Dirichlet $L$-函数：
$$
L(s, \chi) = \sum_{n=1}^{\infty} \frac{\chi(n)}{n^s}, \qquad \operatorname{Re}(s) > 1. \tag{3}
$$

**Claim 2**（Euler 乘积展开）. 对 $\operatorname{Re}(s) > 1$，
$$
L(s, \chi) = \prod_p \left(1 - \frac{\chi(p)}{p^s}\right)^{-1}.
$$

*证明.* 因 $\chi$ 为乘性函数（$\chi(nm) = \chi(n)\chi(m)$），且 $|\chi(p)/p^s| \leq p^{-\operatorname{Re}(s)} < 1$（$\operatorname{Re}(s) > 1$），由唯一分解定理 $n = p_1^{a_1} \cdots p_k^{a_k}$，
$$
\sum_{n=1}^{\infty} \frac{\chi(n)}{n^s} = \sum_{a_1, \dots, a_k \geq 0} \prod_{j=1}^{k} \frac{\chi(p_j)^{a_j}}{p_j^{a_j s}} = \prod_p \sum_{a=0}^{\infty} \frac{\chi(p)^a}{p^{as}} = \prod_p \frac{1}{1 - \chi(p)/p^s}.
$$
第二个等号由绝对收敛性（$\operatorname{Re}(s) > 1$ 时 $\sum |\chi(n)|/n^{\operatorname{Re}(s)} \leq \sum 1/n^{\operatorname{Re}(s)} < \infty$）保证 Fubini 定理可应用。$\blacksquare$

取对数导数（$\log L(s, \chi) = -\sum_p \log(1 - \chi(p)/p^s)$），由 Taylor 展开 $-\log(1-x) = \sum_{k=1}^{\infty} x^k/k$ 得
$$
\log L(s, \chi) = \sum_p \sum_{k=1}^{\infty} \frac{\chi(p)^k}{k\, p^{ks}}. \tag{4}
$$
特别地，$k = 1$ 项为 $\sum_p \chi(p)/p^s$，高阶项（$k \geq 2$）在 $s \to 1^+$ 时收敛（因 $\sum_p \sum_{k \geq 2} 1/(kp^{ks}) \leq \sum_p \sum_{k \geq 2} 1/p^{ks} \leq \sum_n 1/n^2 < \infty$）。

因此，
$$
\sum_p \frac{\chi(p)}{p^s} = \log L(s, \chi) + O(1), \qquad s \to 1^+. \tag{5}
$$

**第四阶段：$L(1, \chi) \neq 0$ 的证明**。

由 (5)，非平凡特征标的贡献 $\sum_p \chi(p)/p^s$ 在 $s \to 1^+$ 时有界当且仅当 $L(s, \chi)$ 在 $s \to 1^+$ 时有极限且极限非零，即 $L(1, \chi) \neq 0$。

**Claim 3**（$L(1, \chi) \neq 0$，复特征标情形）. 若 $\chi$ 为非实值特征标（即 $\chi \neq \bar{\chi}$），则 $L(1, \chi) \neq 0$。

*证明.* 设 $\chi$ 为复特征标（$\chi \neq \bar{\chi}$）。考虑乘积 $L(s, \chi)\, L(s, \bar{\chi})$。由 Euler 乘积（Claim 2），
$$
L(s, \chi)\, L(s, \bar{\chi}) = \prod_p \frac{1}{(1 - \chi(p)/p^s)(1 - \overline{\chi(p)}/p^s)}.
$$
对 $|p \nmid q$，$\chi(p) \in S^1$，设 $\chi(p) = e^{i\alpha_p}$，则
$$
(1 - \chi(p)/p^s)(1 - \overline{\chi(p)}/p^s) = 1 - \frac{2\cos\alpha_p}{p^s} + \frac{1}{p^{2s}} = (1 - p^{-s})^2 + \frac{2(1 - \cos\alpha_p)}{p^s} \geq (1 - p^{-s})^2.
$$
因此 $L(s,\chi) L(s,\bar{\chi}) \leq \prod_p (1 - p^{-s})^{-2} = \zeta(s)^2$（对 $\operatorname{Re}(s) > 1$）。

若 $L(1, \chi) = 0$，则 $L(s, \chi) L(s, \bar{\chi})$ 在 $s = 1$ 处至少有一阶零点。但由 Euler 乘积的保号性及与 $\zeta(s)^2$ 的比较，$L(s,\chi) L(s,\bar{\chi})$ 在 $s \to 1^+$ 时不可能趋于零（因其被 $\zeta(s)^2$ 控制，后者在 $s \to 1^+$ 时 $\to \infty$）。矛盾。故 $L(1, \chi) \neq 0$。$\blacksquare$

**Claim 4**（$L(1, \chi) \neq 0$，实特征标情形）. 若 $\chi$ 为实值非平凡特征标（$\chi = \bar{\chi}$，$\chi \neq \chi_0$），则 $L(1, \chi) \neq 0$。

*证明.* 此为证明的技术核心。Stein 在 Ch. 8, §3.3（Proposition 3.13）中使用**双曲线求和法**。

定义辅助函数
$$
\psi_1(s, \chi) = \sum_{n=1}^{\infty} \frac{\chi(n) \log n}{n^s} = -\frac{d}{ds} L(s, \chi), \qquad \operatorname{Re}(s) > 1.
$$

关键步骤：考虑 $\chi$ 为实特征标时的**二次型**
$$
Q(s) = \sum_{n=1}^{\infty} \frac{(\chi * \mathbf{1})(n)}{n^s} = \sum_{n=1}^{\infty} \frac{\sum_{d|n} \chi(d)}{n^s} = L(s, \chi)\, \zeta(s),
$$
其中 $\chi * \mathbf{1}$ 为 Dirichlet 卷积，$\mathbf{1}$ 为常函数（处处取值 $1$，与区间指示函数 $\chi_I$ 记号区分）。因 $\chi$ 为实特征标，$\sum_{d|n} \chi(d) \geq 0$（因 $\chi(d) \in \{-1, 0, 1\}$，且对完全平方数 $n = m^2$，$\sum_{d|n} \chi(d) \geq 1$）。

若 $L(1, \chi) = 0$，则 $Q(s) = L(s, \chi)\, \zeta(s)$ 在 $s = 1$ 处至少有一阶零点（$L$ 的零点消去 $\zeta$ 的极点）。但
$$
Q(s) = \sum_{n=1}^{\infty} \frac{\sum_{d|n} \chi(d)}{n^s} \geq \sum_{m=1}^{\infty} \frac{1}{m^{2s}} = \zeta(2s),
$$
因对 $n = m^2$，$\sum_{d|m^2} \chi(d) \geq \chi(1) = 1$。当 $s \to 1/2^+$ 时 $\zeta(2s) \to \infty$，故 $Q(s)$ 在 $s \to 1/2^+$ 时无界。而若 $L(1, \chi) = 0$ 使 $Q(s)$ 在 $s = 1$ 处解析延拓为零，则 $Q(s)$ 在 $\operatorname{Re}(s) > 1/2$ 上应有界（由 Euler 乘积的收敛性），矛盾。

因此 $L(1, \chi) \neq 0$。$\blacksquare$

**第五阶段：综合结论**。

由 (2) 与 (5)，
$$
\sum_{\substack{p \leq N \\ p \equiv \ell \pmod{q}}} \frac{1}{p^s} = \frac{1}{\phi(q)} \sum_p \frac{1}{p^s} + \frac{1}{\phi(q)} \sum_{\chi \neq \chi_0} \overline{\chi(\ell)} \left[\log L(s, \chi) + O(1)\right]. \tag{6}
$$
当 $s \to 1^+$ 时：
- 第一项 $\frac{1}{\phi(q)} \sum_p 1/p^s \to \infty$（Euler 定理）；
- 第二项中每个 $\log L(s, \chi)$ 有界（因 $L(1, \chi) \neq 0$，由 Claim 3 与 Claim 4，故 $\log L(s, \chi) \to \log L(1, \chi)$ 为有限值）。

因此 (6) 左端 $\to \infty$（$s \to 1^+$），这意味着
$$
\sum_{\substack{p \leq N \\ p \equiv \ell \pmod{q}}} \frac{1}{p} \to \infty \quad (N \to \infty).
$$
级数发散蕴含等差数列 $\ell, \ell + q, \ell + 2q, \dots$ 中含有无穷多个素数。$\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[finite-abelian-group|有限阿贝尔群]] 上的 Fourier 分析（Stein Ch. 7 §2：指示函数 $\delta_\ell$ 用 [[character|Dirichlet character]] 展开，Claim 1 得系数 $\hat\delta_\ell(\chi) = \overline{\chi(\ell)}/\phi(q)$）⇒ 素数求和分解（第二阶段）⇒ Euler 乘积（Claim 2：$\chi$ 的乘性 + 唯一分解定理 + 绝对收敛下 Fubini 交换）⇒ $\log L(s,\chi)$ 的对数展开（Taylor 展开 $-\log(1-x)$，第三阶段）⇒ $L(1,\chi) \neq 0$（Claim 3 复特征标：$L(s,\chi)L(s,\bar\chi)$ 与 $\zeta(s)^2$ 比较；Claim 4 实特征标：二次型 $Q(s) = L(s,\chi)\zeta(s)$ 与 $\zeta(2s)$ 下界比较，即 Stein Ch. 8 Proposition 3.13 的双曲线求和法）⇒ 主项发散（Euler 定理 $\sum_p 1/p^s \to \infty$）⇒ 结论」。各 Claim 均前向依赖，未引用本页自身。依赖图无环。

## 等价叙述

### 叙述 1（Stein Ch.8 Theorem 3.1）

> 设 $\ell, q$ 为正整数，$(\ell, q) = 1$，则等差数列 $\ell, \ell+q, \ell+2q, \dots$ 中有无穷多素数。

### 叙述 2（渐近形式）

> 进一步，在 $\ell \pmod{q}$ 同余类中，

$$
\sum_{\substack{p \leq N \\ p \equiv \ell \pmod{q}}} \frac{1}{p} = \frac{1}{\phi(q)} \log\log N + O(1).
$$

### 叙述 3（L-函数非零性形式）

> 等价地，所有非平凡 Dirichlet character $\chi$ 满足 $L(1, \chi) \neq 0$（其中 $L(s, \chi) = \sum_n \chi(n)/n^s$）。

**等价关系**：叙述 3 的 $L(1,\chi) \neq 0$ 是叙述 1 的核心工具；叙述 1 与 2 在 $L(1,\chi) \neq 0$ 加上 Dirichlet 级数的部分和估计后等价。

### 叙述 4（Chebotarev 密度定理）

> 对任意 Galois 扩张 $L/\mathbb{Q}$，素数在 $L$ 的 Frobenius 同构类中等分布。叙述 1 是叙述 4 在循环群情形下的特例。

## 证明难度差异

### 叙述 1 的证明（Stein Ch.8）

- **方法**：四步——指示函数 Fourier 展开 → Euler 乘积 → $L(1,\chi) \neq 0$（分实/复特征标两种情形） → 渐近估计。
- **难度**：**中至高**——前两步纯代数；第三步（$L(1,\chi) \neq 0$）是全书技术巅峰（Theorem 3.12 + Proposition 3.13）。
- **代价**：依赖 $L(1,\chi) \neq 0$ 的精细论证（实特征标的「双曲线求和法」）。

### 叙述 3（$L(1,\chi) \neq 0$）的证明

- **方法**：分两种情形——复特征标（用 $L \overline{L}$ 的乘积估计）与实特征标（用双曲线求和法）。
- **难度**：**高**——实特征标情形尤其困难。
- **本质**：此非零性是整个 Dirichlet 定理的核心难点；Fourier 框架提供结构但证明关键步骤依赖解析估计。

### 叙述 4（Chebotarev 密度定理）的证明

- **方法**：Galois 群上的 Fourier 分析 + L-函数非零性推广。
- **难度**：**极高**——需 Galois 理论、抽象代数、解析数论的统一。
- **结论**：远强于叙述 1 的算术级数版本。

**总评**：本 wiki 仅覆盖叙述 1 与 3；叙述 4（Chebotarev）是后续推广。叙述 1 的证明难度核心在于 $L(1,\chi) \neq 0$——这是 Fourier 观点在解析数论中的关键节点。

## 推广 / 变体

- **Dirichlet $L$-函数的非零区域**：进一步推广为 $L(s, \chi) \neq 0$ 在 $\mathrm{Re}(s) \geq 1$ 上成立。
- **素数定理**：Dirichlet 定理的渐近版本（PNT for AP）：$\sum_{p \leq N, p \equiv \ell \pmod{q}} 1/p \sim \frac{1}{\phi(q)}\log\log N$。

## 相关习题

- [[ch8-ex3-euler-product|Ch.8 Ex.3]]：$L(s,\chi)$ 的 Euler 乘积是定理证明中 $L(1,\chi)\ne 0$ 分析的核心工具
- [[ch8-pb1-dirichlet-alternative|Ch.8 Pb.1]]：以 $D_\ell(x)$ 显式渐近计算的替代证明，不经 $L(1,\chi)$ 零点分析

## 应用

- **解析数论的开端**：开启 Dirichlet character 与 $L$-函数理论。
- **素数在等差数列中的分布**。
- **代数数论中的 Chebotarev 密度定理**（更深层的推广）。

## Fourier 观点的体现

可概括为：

> **有限阿贝尔群 $\mathbb{Z}^*(q)$ 上的 Fourier 正交性把"同余类筛选"转化为字符和；$L(s, \chi)$ 的解析性质（特别是 $L(1,\chi) \neq 0$）决定算术结论。**

- 同余条件 $n \equiv \ell \pmod{q}$ 被写成群上的选择函数 $\delta_\ell(n)$；
- 选择函数用字符展开；
- 素数求和被分解为不同频率字符的贡献；
- 乘性激活 Euler 乘积；
- 解析性质给出非零性。

### 引用本定理的引理

- [[cauchy-schwarz-inequality]]：用于控制 Fourier 系数 $\hat{\delta}_\ell(e)$ 的内积结构。
- [[integer-periodicity-of-exponential]]：用于 $e(n) = e^{2\pi i n}$ 的周期化（dirichlet 核与 Fejér 核的对偶性）。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 8]]
- [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验 D 组）]]