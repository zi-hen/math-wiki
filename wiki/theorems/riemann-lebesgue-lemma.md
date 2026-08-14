---
type: theorem
title: Riemann–Lebesgue 引理
aliases: [Riemann-Lebesgue lemma]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [fourier-analysis, fourier-coefficients]
strength: standard
strength_basis: 条件：$f$ 在 $[0, 2\pi]$ 上（Riemann 或 Lebesgue）可积（弱——极宽松的函数类）；结论：Fourier 系数 $\hat{f}(n) \to 0$（$|n| \to \infty$）（中等——仅给出衰减，不给出速率）。这是任何 Fourier 系数研究的基础定理。可由 Bessel 不等式（取 $g = e^{in\theta}$）作为推论出现。属 "standard" 而非 "strong"，因其结论相对弱。
---

# Riemann–Lebesgue 引理

> **工作空间**：圆群 $\mathbb{T} = [0, 2\pi]$（周期 $2\pi$ 函数空间）。Stein 在 Ch. 3, Theorem 1.4 给定陈述。

## What — 陈述

> 设 $f$ 在 $[0, 2\pi]$ 上 Riemann（或 Lebesgue）可积，则其 [[fourier-coefficient|Fourier 系数]]满足
> $$
> \hat{f}(n) \to 0, \quad |n| \to \infty.
> $$

等价地，
$$
\int_0^{2\pi} f(\theta) \sin(n\theta)\,d\theta \to 0, \quad \int_0^{2\pi} f(\theta) \cos(n\theta)\,d\theta \to 0,
$$
因为 $\hat{f}(n) = \int_0^{2\pi} f(\theta)\,e^{-in\theta}\,d\theta$ 实部与虚部分别对应 $\cos / \sin$ 系数。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Theorem 1.4]]。

## Why — 动机与证明

### 动机

Riemann–Lebesgue 引理是 Fourier 分析的「零阶」事实——若 Fourier 系数不衰减至零，则不可能将可积函数分解为 Fourier 级数。该引理确认 Fourier 系数**至少有衰减**，但**不保证**任何具体速率（$O(1/n)$、$O(1/n^2)$ 等）。其标准速率（如 Lipschitz ⇒ $O(1/n)$）依赖于额外的光滑性假设。

### 证明思路

Stein 在 Ch. 3, Theorem 1.4 后附注："Since the terms of a converging series tend to 0, we deduce from Parseval's identity or Bessel's inequality the following result." 因此有两条证明路径：

1. **Bessel 不等式路径**：取测试函数 $g = e^{in\theta}$，由 Bessel 不等式 $\sum_n |\hat{f}(n)|^2 \leq \|f\|_2^2$。但此路径**仅适用 $f \in L^2$**——不适用于一般 Riemann 可积 $f$。
2. **直接逼近路径**（推荐）：用阶梯函数（step function）逼近 $f$，再处理阶梯函数的 Fourier 系数。

### 详细证明

**直接逼近法**（$f$ Riemann 可积情形，经典 Riemann 论证）：

**第一阶段**：约化为阶梯函数。
若 $f$ 为阶梯函数 $f = \sum_k a_k \chi_{I_k}$（$I_k$ 为互不相交区间），则 $\hat{f}(n) = \sum_k a_k \widehat{\chi_{I_k}}(n)$。由三角估计 $|\widehat{\chi_{[a,b]}}(n)| \leq \frac{2}{n}$ 得 $|\hat{f}(n)| \leq \frac{C}{|n|}$，故 $\hat{f}(n) \to 0$。

**Claim 1**（阶梯函数 Fourier 系数衰减）. 设 $f$ 为有限线性组合 $f = \sum_{|k| \leq N} c_k \chi_{[a_k, b_k]}$。则 $\hat{f}(n) = O(1/|n|)$（$|n| \to \infty$），从而 $\hat{f}(n) \to 0$。

*证明.* 由线性性，只需对 $f = \chi_{[a,b]}$ 证明。直接计算（$n \neq 0$，核 $e^{-in\theta}$ 是 Stein 圆群约定 — Fourier 级数版本，参 [[fourier-series]]）。
$$
\widehat{\chi_{[a,b]}}(n) = \int_a^b e^{-in\theta}\,d\theta = \frac{e^{-ina} - e^{-inb}}{in}.
$$
（写作 $e^{-ina}$:Stein 圆群约定，$e^{-inb}$:Stein 圆群约定，$e^{-ina}$:Stein 圆群约定）其模长 $|\widehat{\chi_{[a,b]}}(n)| \leq \frac{2}{|n|}$。$\blacksquare$

**第二阶段**：由阶梯函数逼近任意 Riemann 可积函数。
对任意 $\varepsilon > 0$，存在阶梯函数 $f_\varepsilon$ 使 $\int |f - f_\varepsilon| < \varepsilon$。则
$$
|\hat{f}(n)| \leq |\hat{f}_\varepsilon(n)| + |\hat{f - f_\varepsilon}(n)| \leq |\hat{f}_\varepsilon(n)| + \int |f - f_\varepsilon| < |\hat{f}_\varepsilon(n)| + \varepsilon.
$$
由 Claim 1，$|\hat{f}_\varepsilon(n)| \to 0$（$|n| \to \infty$），故 $\limsup |\hat{f}(n)| \leq \varepsilon$。由 $\varepsilon$ 任意性，得 $\hat{f}(n) \to 0$。$\blacksquare$

**备注**：上述证明的第二阶段中用了 $|\hat{h}(n)| \leq \int |h(\theta)| d\theta$（对 $h = f - f_\varepsilon$）——这是因为 $|e^{-in\theta}| = 1$，故
$$
|\hat{h}(n)| = \left|\int h(\theta) e^{-in\theta} d\theta\right| \leq \int |h(\theta)|\,d\theta = \|h\|_{L^1}.
$$

> **依赖关系小结**: 本证明仅依赖基本定义与初等估计，无定理级依赖：Claim 1 对指示函数 $\chi_{[a,b]}$ 直接积分得 $|\hat\chi_{[a,b]}(n)| \le 2/|n|$（$O(1/|n|)$ 衰减），第二阶段用 $|\hat h(n)| \le \|h\|_{L^1}$（因 $|e^{-in\theta}| = 1$）与阶梯函数在 Riemann 可积函数中的稠密性把 $\to 0$ 传递到一般 $f$。依赖图无环。

## 其他证明

> 本区段按 docs/PROOFS.md §6.5 记录与主证明不同的第二证法;主证明(§「详细证明」)保持不变。本证明以更强定量结论 $O(1/|n|)$($f \in C^k$ 时 $O(|n|^{-k})$)证得同一极限结论 $\hat f(n) \to 0$。

#### 证明二:分部积分法(更强定量结论)

**来源与录入**。方法依据 [[integration-by-parts|分部积分法]] 的连续版(圆群上边界项由周期性消失,另见 [[fourier-coefficient|Fourier 系数]]);定理陈述依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Theorem 1.4]]。录入日期:2026-08-13。

**动机**。主证明从阶梯函数出发,对每个区间显式积出 $O(1/|n|)$,再用稠密性把 $\to 0$ 传递到一般 $f$。证明二反过来:先对 $C^1$ 函数用分部积分——核 $e^{-in\theta}$ 吸收因子 $in$,把 $f$ 的导数转移到核上——一步得到 $|\hat f(n)| \le \|f'\|_{L^1}/(2\pi|n|)$ 的**定量**衰减;对 $C^k$ 函数迭代 $k$ 次得 $O(|n|^{-k})$。一般 $L^1$ 情形再由 $C^1$ 函数稠密性(Claim 3)与三角不等式把 $\to 0$ 的结论保真下来。核心观察:分部积分把「光滑性 ⇒ 衰减速率」变成一步计算,而 $L^1$ 情形只是把「速率未知」的极限保持——两种机制不同:主证明用区间指示函数的显式积分,本证明用光滑函数的核导数结构。

**证明思路**。

1. **$C^1$ 定量**:分部积分($u = f$,$dv = e^{-in\theta}d\theta$;边界项由周期性消失),得 $\hat f(n) = \frac{1}{2\pi in}\int_0^{2\pi}f'(\theta)e^{-in\theta}d\theta$,故 $|\hat f(n)| \le \|f'\|_{L^1}/(2\pi|n|)$。
2. **$C^k$ 迭代**:重复 $k$ 次,得 $|\hat f(n)| \le \|f^{(k)}\|_{L^1}/(2\pi|n|^k)$。
3. **$L^1$ 传递**:光滑函数在 $L^1(\mathbb{T})$ 稠密;对 $f \in L^1$ 取 $g \in C^1$ 逼近,三角不等式 + 步骤 1 取上极限。
4. **结论**:$\hat f(n) \to 0$($|n| \to \infty$)。

**详细证明**。

**Claim 1**($C^1$ 定量衰减). 设 $f \in C^1(\mathbb{T})$($2\pi$-周期的一次连续可微函数)。则对 $n \neq 0$,
$$|\hat f(n)| \le \frac{1}{2\pi|n|}\int_0^{2\pi}|f'(\theta)|\,d\theta.$$

*证明.* 由 [[fourier-coefficient|Fourier 系数]] 的定义与 [[integration-by-parts|分部积分法]](取 $u = f(\theta)$,$dv = e^{-in\theta}d\theta$,则 $du = f'(\theta)d\theta$,$v = e^{-in\theta}/(-in)$),
$$\hat f(n) = \frac{1}{2\pi}\int_0^{2\pi}f(\theta)e^{-in\theta}d\theta = \frac{1}{2\pi}\Big[\frac{f(\theta)e^{-in\theta}}{-in}\Big]_0^{2\pi} + \frac{1}{2\pi in}\int_0^{2\pi}f'(\theta)e^{-in\theta}d\theta.$$
边界项为零:由周期性 $f(2\pi) = f(0)$ 与 $e^{-2\pi in} = 1$,$f(2\pi)e^{-2\pi in} - f(0) = 0$。故
$$|\hat f(n)| = \Big|\frac{1}{2\pi in}\int_0^{2\pi}f'(\theta)e^{-in\theta}d\theta\Big| \le \frac{1}{2\pi|n|}\int_0^{2\pi}|f'(\theta)|\,d\theta,$$
末步由 $|e^{-in\theta}| = 1$ 与积分的三角不等式。$\blacksquare$

**Claim 2**($C^k$ 迭代). 设 $f \in C^k(\mathbb{T})$。则对 $n \neq 0$,
$$|\hat f(n)| \le \frac{1}{2\pi|n|^k}\int_0^{2\pi}|f^{(k)}(\theta)|\,d\theta.$$

*证明.* 对 Claim 1 的论证迭代 $k$ 次:第 $j$ 次分部积分把因子 $f^{(j-1)}$ 变为 $f^{(j)}$,核吸收因子 $(in)^{-1}$;每次的边界项 $\frac{1}{2\pi(in)^j}[f^{(j)}(\theta)e^{-in\theta}]_0^{2\pi}$ 由周期性消失($f \in C^k$ 保证 $f^{(j)}$ 亦为周期函数,且 $e^{-2\pi in} = 1$)。归纳得
$$\hat f(n) = \frac{1}{2\pi (in)^k}\int_0^{2\pi}f^{(k)}(\theta)\,e^{-in\theta}\,d\theta,$$
取模长并作三角不等式即得。$\blacksquare$

**Claim 3**($C^1$ 在 $L^1$ 中稠密). 对任意 $f \in L^1(\mathbb{T})$ 与 $\varepsilon > 0$,存在 $g \in C^1(\mathbb{T})$ 使 $\|f - g\|_{L^1} < \varepsilon$。

*证明.* 分两步。第一步,阶梯函数在 $L^1(\mathbb{T})$ 中稠密:对 $f$ 先作截断到有界函数(Riemann 可积情形直接由 Riemann 和给出;Lebesgue 意义下为简单函数逼近的标准事实),每条指示函数用区间之并近似,得阶梯函数 $s$ 使 $\|f - s\|_{L^1} < \varepsilon/2$。第二步,把 $s$ 光滑化为 $C^1$ 函数:对 $s$ 的每个跳变点 $x_*$(跳变高度 $h$),在区间 $[x_* - \delta, x_* + \delta]$ 上用过渡函数 $s(x_* - \delta) + h\,\phi\big((x - x_* + \delta)/(2\delta)\big)$ 替代,其中 $\phi(t) = 3t^2 - 2t^3$ 满足 $\phi(0) = 0$、$\phi(1) = 1$、$\phi'(0) = \phi'(1) = 0$;区间外保持 $s$ 不变。拼接处函数值与导数值连续衔接,故所得 $g \in C^1(\mathbb{T})$(端点 $0$、$2\pi$ 附近的跳变同样处理并周期拼接)。在跳变区间上 $|g - s| \le |h|$,故 $\|g - s\|_{L^1} \le 2\delta\sum_k |h_k|$(和式取遍全部跳变,有限),取 $\delta$ 足够小使 $\|s - g\|_{L^1} < \varepsilon/2$。三角不等式给出 $\|f - g\|_{L^1} < \varepsilon$。$\blacksquare$

**结论**。设 $f \in L^1(\mathbb{T})$。对任意 $\varepsilon > 0$,由 Claim 3 取 $g \in C^1(\mathbb{T})$ 使 $\|f - g\|_{L^1} < \varepsilon$。由 $|e^{-in\theta}| = 1$ 与积分的三角不等式,$|\hat f(n) - \hat g(n)| \le \frac{1}{2\pi}\int_0^{2\pi}|f - g| \le \varepsilon$,结合 Claim 1:
$$|\hat f(n)| \le |\hat g(n)| + |\hat f(n) - \hat g(n)| \le \frac{\|g'\|_{L^1}}{2\pi|n|} + \varepsilon.$$
对 $|n| \to \infty$ 取上极限,$\limsup_{|n|\to\infty}|\hat f(n)| \le \varepsilon$。由 $\varepsilon > 0$ 的任意性,$\hat f(n) \to 0$。$\blacksquare$

**备注(以更强定量证得同一结论)**。证明二沿途得到:对 $C^1$ 函数 $|\hat f(n)| = O(1/|n|)$,对 $C^k$ 函数 $|\hat f(n)| = O(|n|^{-k})$(Claim 2),均强于引理结论 $\hat f(n) \to 0$。更进一步,由主证明已建立的 $L^1$ 结论应用于 $f^{(k)} \in C(\mathbb{T}) \subset L^1(\mathbb{T})$,有 $\int_0^{2\pi}f^{(k)}(\theta)e^{-in\theta}d\theta \to 0$,代入 Claim 2 的公式得 $|\hat f(n)| = o(|n|^{-k})$——即 What-if 叙述 4 的 $o$-形式。这也是 [[integration-by-parts|分部积分法]] 页所述「$f \in C^k \Rightarrow \hat f(n) = o(|n|^{-k})$ 的连续版核心工具」的完整实现。

## What-if — 反例、等价叙述与推广

### 等价叙述

#### 叙述 1（Fourier 系数衰减至零）
> $f \in L^1(\mathbb{T})$ ⇒ $\hat{f}(n) \to 0$（$|n| \to \infty$）。

#### 叙述 2（正弦余弦形式）
> $f \in L^1(\mathbb{T})$ ⇒ $\int_0^{2\pi} f(\theta) \cos(n\theta) d\theta \to 0$，$\int_0^{2\pi} f(\theta) \sin(n\theta) d\theta \to 0$。

#### 叙述 3（Fourier 变换形式，Ch. 5 引申）
> $f \in$ [[lp-space|$L^1(\mathbb{R}^d)$]] ⇒ $\hat{f}(\xi) \to 0$（$|\xi| \to \infty$）。

#### 叙述 4（光滑性加强 ⇒ 速率）
> 若 $f \in C^k$（$k$ 阶连续可微），则 $\hat{f}(n) = o(1/|n|^k)$。

**等价关系**：叙述 1 = 叙述 2 = 叙述 3（欧拉公式 $e^{in\theta} = \cos n\theta + i \sin n\theta$）。叙述 4 是叙述 1 的精细化。

### 反例（条件不可削弱为"任何具体速率"）

1. **衰减速率不可改进**：存在 Riemann 可积函数 $f$ 使 $\hat{f}(n) = O(\log n / n)$——衰减任意慢，只要 $\to 0$ 即可（Ch.3 Exercise 18(e) 构造）。
2. **$f \notin L^1$ 则 Riemann–Lebesgue 不一定成立**：Dirac δ 函数（分布意义下的 $\delta$）$\hat{\delta}(n) = 1$，不衰减。但这不是传统可积函数。
3. **Lipschitz 函数衰减 $O(1/n)$ 是最佳的**：$f$ Lipschitz ⇒ $\hat{f}(n) = O(1/n)$（Ch.3 Exercise 15 + 16）；反例由 $\alpha$-Hölder 函数给出 $\hat{f}(n) = \Theta(1/n^\alpha)$。

### 推广 / 变体

- **加强版**（Ch.3 Exercise 13）：若 $f \in C^k$（$k$ 阶连续可微），则 $\hat{f}(n) = o(1/|n|^k)$（"$o$" 而非 "$O$"）。
- **Lipschitz 改善**：$f$ Lipschitz ⇒ $\hat{f}(n) = O(1/n)$（Ch.3 Exercise 16 综合 Lipschitz、Hölder、单调性三类条件）。
- **Fourier 变换版本**（Ch.5）：$f \in L^1(\mathbb{R})$ ⇒ $\hat{f}(\xi) \to 0$（$|\xi| \to \infty$），证明同思路。
- **Hölder 连续**：$|f(x+h) - f(x)| \leq C |h|^\alpha$ ⇒ $\hat{f}(n) = O(1/n^\alpha)$（Ch.3 Exercise 15）。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 叙述 1（$L^1$ 框架）| 阶梯函数逼近 | **低** | 仅用 Riemann 积分，无需测度论 |
| 叙述 3（$L^1(\mathbb{R})$）| 同一思想，$\mathbb{R}$ 上的对称化 | **低** | 类比 |
| 叙述 4（$C^k$ 改善）| 分部积分 | **中** | 积分核 $e^{-in\theta}$ 的导数结构 |
| 证明二（叙述 1）| 分部积分 + $C^1$ 稠密 | **低至中** | 需 $C^1$ 正则性与稠密论证；附带 $O(1/|n|)$（$C^k$ 时 $O(|n|^{-k})$）定量 |

## 相关习题

- [[ch3-ex18-slow-decay|Ch.3 Ex.18]]：任意慢衰减构造表明 $\hat f(n)\to 0$ 无正速率，说明引理结论的最优性

## 应用

- **Dirichlet 定理的 Fourier 框架**：Riemann–Lebesgue 给 Fourier 系数衰减的零阶保证，是 Ch.8 Dirichlet 定理解析路径的前提。
- **卷积与好核**（[[good-kernel]]）：证明好核 $K_n$ 的 Fourier 系数 $\hat{K}_n(k) \to 1$ 时使用。
- **Riemann 局部化**（[[riemann-localization|Riemann 局部化原理]]）：Theorem 2.2 的证明关键步骤是 $tD_N(t) \to 0$（Riemann–Lebesgue 推论）。
- **Gibbs 现象**：由 $9\%$ 过冲源自 Dirichlet 核的 $\int \sin t / t\, dt$（Riemann–Lebesgue 间接起作用）。

## 关联

- 定理：[[parseval-identity]]（通过 Bessel 不等式推出 $L^2$ 版本）、[[poisson-summation-formula]]（$\hat{f}$ 衰减条件）、[[mean-square-convergence|均方收敛]]（由 Parseval/Bessel 取系数趋于零）
- 引理：[[fourier-coefficient-decay|Fourier 系数衰减]]（正则性 ⟹ 衰减速率：$C^k$、Lipschitz、单调、Hölder 与 $\ell^2$ 可和）
- 概念：[[fourier-series]]、[[lp-space|$L^1$ 空间]]、[[ellp-space|$\ell^2$ 序列空间]]（系数的能量可和性）、[[character|特征标]]
- 方法：[[fubini-tonelli]]（积分与求和交换 —— 阶梯函数逼近）、[[integration-by-parts|Abel 求和（分部求和）]]（Abel 求和用于光滑性改善版：$f \in C^k \Rightarrow \hat f(n) = o(|n|^{-k})$）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, Theorem 1.4）

### 此证明新引入 / 补充的 method

- **Fubini-Tonelli**（[[fubini-tonelli]]）：阶梯函数逼近路径下，$\int |f| = \int \lim f_\varepsilon$ 的极限交换依赖 Fubini-Tonelli。
- **求和分部 / Abel 求和**（[[integration-by-parts|Abel 求和（分部求和）]]）：改进版 Riemann-Lebesgue（$f \in C^k \Rightarrow \hat f(n) = o(|n|^{-k)}$）核心工具——分部积分的离散类比。
- **连续分部积分**（[[integration-by-parts]]）：叙述 4（$C^k$ 改善）的连续版核心工具——把 $f$ 的导数转移到核 $e^{-in\theta}$ 上，与离散版 Abel 求和互补。

## Stein 写法备注

Riemann-Lebesgue 引理是 Fourier 分析的零阶事实，Stein 给出**经典**（直接逼近）与**Bessel 简证**两种路线——后者简洁但需 $f \in L^2$ 框架。**真正优雅的是**「$f$ 与 $\hat f$ 不能同时速衰」——这是后续 Heisenberg 不确定性原理的直观萌芽。
