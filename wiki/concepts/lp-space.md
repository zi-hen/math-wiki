---
type: concept
title: $L^p$ 空间
aliases: [Lp space, Lp 函数空间, Lebesgue space]
created: 2026-08-11
updated: 2026-08-12
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, real-analysis]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 可测且 $\int |f|^p < \infty$（弱——仅要求可积性，不要求光滑性或衰减性）；结论：完备赋范空间（$L^2$ 为 Hilbert 空间），是 Plancherel 定理、Parseval 等式、Riesz-Fischer 定理的自然框架。$L^2$ 空间是 Fourier 分析的基础——Fourier 变换在 $L^2$ 上为等距同构。
---
# $L^p$ 空间

> **工作空间**：$\mathbb{R}^d$（亦可定义于任意测度空间）。Stein 在 Ch. 2–Ch. 6 大量使用 $L^p$ 框架，但本书刻意避开测度论，仅在 Riemann 积分意义下使用 $L^1$、$L^2$。

## 与 $\ell^p$ 空间的区分

$L^p$ 与 $\ell^p$ 是两个**指称不同的 Banach 空间**：

- **$L^p$**（大写 L）定义于**测度空间**上的可测函数：$\|f\|_{L^p} = \left(\int |f|^p\,d\mu\right)^{1/p}$。
- **$\ell^p$**（小写 l）定义于**可数指标集**（$\mathbb{Z}$、$\mathbb{N}$）上的双无限或单无限序列：$\|(a_n)\|_{\ell^p} = \left(\sum_n |a_n|^p\right)^{1/p}$。

详见 [[ellp-space|$\ell^p$ 空间]]。在 Fourier 分析中两者通过 Fourier 系数自然关联：$f \in L^2(\mathbb{T}) \Leftrightarrow \hat{f} \in \ell^2(\mathbb{Z})$（Riesz–Fischer 定理，见下方「等价叙述」叙述 2）。

## 定义

设 $1 \leq p < \infty$。$L^p(\mathbb{R}^d)$ 是满足下式之**复值**可测函数 $f: \mathbb{R}^d \to \mathbb{C}$ 的等价类（依几乎处处相等）：

$$
\|f\|_{L^p} = \left(\int_{\mathbb{R}^d} |f(x)|^p\,dx\right)^{1/p} < \infty.
$$

特例：

- $L^1$：可积函数空间，$\|f\|_1 = \int |f|$。
- $L^2$：平方可积函数空间，构成 Hilbert 空间。
- $L^\infty$：本性有界函数空间，$\|f\|_\infty = \mathrm{ess\,sup}\,|f|$。

**Stein 约定**：范数记为 $\|f\|_{L^p}$ 或简写 $\|f\|_p$。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 2 §1.1, Ch. 3 §1]]。

## 动机与背景

$L^p$ 空间为 Fourier 分析提供自然的函数类。其结构性质（完备性、稠密性、对偶性）使 Fourier 变换成为有界算子。$L^2$ 在 Fourier 分析中地位特殊——它是 Fourier 变换成为等距同构的最小合适函数类。

## 性质

- **完备性**：$L^p$ 对 $1 \leq p \leq \infty$ 是 Banach 空间；$L^2$ 是 Hilbert 空间。
- **Hölder 不等式**：若 $f \in L^p$，$g \in L^q$，$\frac{1}{p} + \frac{1}{q} = 1$，则
$$
\int |fg| \leq \|f\|_p \|g\|_q.
$$
- **Parseval 等式**（$L^2$）：若 $f \in L^2(\mathbb{R}^d)$，则 $\|f\|_2 = \|\hat{f}\|_2$（Plancherel 定理）。
- **稠密性**：
  - $C_c^\infty(\mathbb{R}^d)$（紧支撑光滑函数）在 $L^p$ 中稠密（$1 \leq p < \infty$）。
  - Schwartz 空间 $\mathcal{S}(\mathbb{R}^d)$ 在 $L^p$ 中稠密（$1 \leq p < \infty$）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3 §1, Theorem 1.1（均方收敛）]]。

### 详细证明（$L^p$ 标准性质）

以下逐条证明 [[plancherel-theorem|Plancherel 证明二]]与 [[parseval-identity|Parseval]] 所必需的 $L^p$ 关键事实, 仅依赖 [[fourier-transform|Fourier 变换]]基本性质与测度论标准工具, **不依赖 Plancherel 本身**.

**Claim 1**（Hölder 不等式）. 对 $1 \leq p, q \leq \infty$, $\frac{1}{p} + \frac{1}{q} = 1$, $f \in L^p$, $g \in L^q$, 有
$$
\int |fg| \le \|f\|_p \|g\|_q.
$$

*证明.* 不妨设 $\|f\|_p, \|g\|_q > 0$. 由 Young 不等式 $ab \le \frac{a^p}{p} + \frac{b^q}{q}$（$a, b \ge 0$, 由指数函数凸性立得）, 取 $a = |f(x)|/\|f\|_p$, $b = |g(x)|/\|g\|_q$:
$$
\frac{|f(x)g(x)|}{\|f\|_p\|g\|_q} \le \frac{|f(x)|^p}{p\|f\|_p^p} + \frac{|g(x)|^q}{q\|g\|_q^q}.
$$
对 $x$ 积分: $\int \frac{|fg|}{\|f\|_p\|g\|_q}\,dx \le \frac{1}{p} + \frac{1}{q} = 1$. 故 $\int |fg| \le \|f\|_p\|g\|_q$. $\blacksquare$

**Claim 2**（$C_c^\infty$ 在 $L^p$ 中稠密, $1 \le p < \infty$）. 对任意 $f \in L^p(\mathbb R^d)$ 与 $\varepsilon > 0$, 存在 $\varphi \in C_c^\infty(\mathbb R^d)$ 使 $\|f - \varphi\|_{L^p} < \varepsilon$.

*证明.* **Step 1（特征函数逼近 $L^\infty$ 函数）**. 若 $f = \chi_E$（$E$ 有界可测）, 构造开集 $U \supset E$ 使 $|U \setminus E| < \delta$（**外正则**, 见 [[regular-measure|正则测度]]; $\delta$ 待选）, 由 Urysohn 引理得 $\varphi \in C_c^\infty$ 使 $\chi_E \le \varphi \le \chi_U$. 则
$$
\|f - \varphi\|_p^p \le \|\chi_U - \chi_E\|_p^p = |U \setminus E| < \delta.
$$

**Step 2（$L^p$ 函数由简单函数逼近）**. 由 Lebesgue 测度的 $\sigma$-有限性, $f = \sum_n c_n \chi_{E_n}$（简单函数极限, 对 $f \ge 0$）. 由三角不等式与简单函数逼近: 对任意 $\varepsilon > 0$, 存在有界可测集 $E$ 上取值的简单函数 $g = \sum_{k=1}^N c_k \chi_{E_k}$ 使 $\|f - g\|_p < \varepsilon/2$.

**Step 3（每个 $\chi_{E_k}$ 由 $C_c^\infty$ 逼近）**. 由 Step 1, 对每个 $k$ 选 $\varphi_k \in C_c^\infty$ 使 $\|\chi_{E_k} - \varphi_k\|_p < \varepsilon/(2N|c_k|)$, 取 $\varphi = \sum c_k \varphi_k \in C_c^\infty$. 由 [[lp-space|Claim 1 (Hölder 不等式)]]（用 $|c_k|$ 乘 $\chi_{E_k}$）:
$$
\|g - \varphi\|_p \le \sum |c_k| \|\chi_{E_k} - \varphi_k\|_p < \varepsilon/2.
$$
故 $\|f - \varphi\|_p \le \|f - g\|_p + \|g - \varphi\|_p < \varepsilon$. $\blacksquare$

**Claim 3**（$\mathcal{S}$ 在 $L^p$ 中稠密, $1 \le p < \infty$）. 对任意 $f \in L^p(\mathbb R^d)$ 与 $\varepsilon > 0$, 存在 $\varphi \in$ [[schwartz-space|$\mathcal{S}(\mathbb R^d)$]] 使 $\|f - \varphi\|_{L^p} < \varepsilon$.

*证明.* 由 Claim 2, 取 $\psi \in C_c^\infty$ 使 $\|f - \psi\|_p < \varepsilon/2$. 取截断 $\tilde\psi(x) = \psi(x) \chi_{|x| \le R}(x)$, 则 $\|\psi - \tilde\psi\|_p \to 0$（$R \to \infty$, 由 [[dominated-convergence|控制收敛]]）, 选 $R$ 充分大使 $\|\psi - \tilde\psi\|_p < \varepsilon/2$. **关键**: $\tilde\psi$ 仍 $C^\infty$ 但**不一定** 速降, 故需磨光. 取 Gauss 截断 $\tilde\psi_\delta = \tilde\psi \cdot e^{-\delta |x|^2}$（由 [[schwartz-space|$\mathcal S$ 性质]] Claim 2 (a) 乘法封闭, $\tilde\psi_\delta \in \mathcal S$）. 由 $|\tilde\psi_\delta(x) - \tilde\psi(x)| \le |\tilde\psi(x)| (1 - e^{-\delta|x|^2}) \le |\tilde\psi(x)|$, 由 [[dominated-convergence|控制收敛定理]]（$|\tilde\psi|$ 紧支集有界）, $\|\tilde\psi_\delta - \tilde\psi\|_p \to 0$（$\delta \to 0$）, 选 $\delta$ 充分小使 $\|\tilde\psi_\delta - \tilde\psi\|_p < \varepsilon/2$.

由三角不等式 $\|f - \tilde\psi_\delta\|_p \le \|f - \psi\|_p + \|\psi - \tilde\psi\|_p + \|\tilde\psi - \tilde\psi_\delta\|_p < 3\varepsilon/2 < 2\varepsilon$. 故 $\tilde\psi_\delta \in \mathcal{S}$ 给出所需逼近. $\blacksquare$

> **附注**: 上述全部证明仅依赖 $L^p$ 定义、Hölder 不等式、控制收敛定理与 [[fourier-transform|Fourier 变换]]基本代数, **不依赖 Plancherel 本身**. Plancherel 证明二的 Claim 4 用此稠密性 + [[good-kernel|好核逼近]]建立 $L^2$ 延拓.

## 关联

- 概念：[[schwartz-space]]（$\mathcal{S}(\mathbb{R}^d) \subset L^p$）。
- 概念：[[fourier-transform]]（定义于 $L^1$，扩展至 $L^2$）。
- 概念：[[ellp-space]]（序列空间 $\ell^p$——Fourier 系数的归宿）。
- 应用：Fourier 级数的 Parseval 等式（$L^2$ 框架）。

## 典型反例 / 边界

- $L^1$ 上 Fourier 变换未必连续至零点；但 $L^2$ 上 Fourier 变换为等距同构。
- 若 $f \in L^1$，则 $\hat{f}$ 一致连续；但 $\hat{f}$ 未必属于 $L^1$（典型反例：$f = \chi_{[-1,1]}$，$\hat{f}(\xi) = \sin(2\pi\xi)/(\pi\xi) \notin L^1$）。

## 等价叙述

### 叙述 1（Stein 框架，Riemann 意义）

> 在 Stein Ch. 2–Ch. 6 中，$L^p(\mathbb{R})$ 实指 Riemann 可积的 $p$ 次幂可积函数。**避免**使用测度论与 Lebesgue 积分。

### 叙述 2（Lebesgue 框架）

> 在测度论框架下，$L^p$ 是依几乎处处相等的等价类，需要 Lebesgue 积分理论。

**等价关系**：叙述 1 ⊂ 叙述 2。Stein 在 Ch. 2 §1.1 显式声明「为简单起见，我们不区分 $L^p$ 与相应 Riemann 可积函数类」——但 Ch. 3 §1.2 指出此类**不完备**，须 Lebesgue 积分完备化。

### 叙述 3（与 $\ell^p$ 的对偶）

> 通过 Fourier 系数建立对偶：若 $f \in L^2(\mathbb{T})$，则其 Fourier 系数 $\hat{f}(n) = \int_0^1 f(\theta)\,e^{-2\pi i n\theta}\,d\theta$ 构成序列 $\hat{f} \in \ell^2(\mathbb{Z})$。逆方向：每个 $\ell^2$ 序列恰对应唯一的 $L^2$ 等价类（Riesz–Fischer 定理）。

## 证明难度差异

### 叙述 1（Riemann 框架）的证明

- **方法**：直接使用 Riemann 积分性质。
- **难度**：**低**——Stein Ch. 3 Theorem 1.1（均方收敛）仅用正交性，不需测度论。
- **代价**：$L^2(\mathbb{R})$ 在此框架下**不完备**——Ch. 3 Example 2 显式给出反例。

### 叙述 2（Lebesgue 框架）的证明

- **方法**：补全 Riemann 框架的完备性。
- **难度**：**中**——需引入 Lebesgue 积分与完备化论证。
- **结论**：$L^2(\mathbb{R})$ 成为 Hilbert 空间，Fourier 变换延拓为等距同构（Plancherel）。

### 叙述 3（$L^2 \leftrightarrow \ell^2$）的证明

- **方法**：Fourier 系数映射 $f \mapsto \{\hat{f}(n)\}$ 在 $L^2$ 与 $\ell^2$ 间建立等距同构。
- **难度**：**低至中**——Stein Ch. 3 Theorem 1.2（Parseval）配合完备性即得。
- **结论**：Riesz–Fischer 定理保证映射为双射（参见「等价叙述」叙述 2）。

**总评**：本 wiki 覆盖 Stein 框架（叙述 1）；Lebesgue 化（叙述 2）是后续 Real Analysis 卷（Stein 系列第三卷）的内容；叙述 3 在 [[fourier-series]] 与 [[ellp-space]] 中有详细讨论。

## 来源

- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), 《Fourier Analysis: An Introduction》, Ch. 2–Ch. 6]]
- [[chat-fourier-series-2026-08-11|AI 对话笔记（已核验）]]
- 相关页面：[[ellp-space]]（序列空间 $\ell^p$）