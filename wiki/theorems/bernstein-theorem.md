---
type: theorem
title: Bernstein 定理（Hölder 条件与绝对收敛）
aliases: [Bernstein's theorem, Bernstein 定理, Hölder absolute convergence]
created: 2026-08-13
updated: 2026-08-13
revision_note: 更新 Claim 2 证明——补全 $h_p=\pi 2^{-p}$ 的相位论证，澄清左端乘子下界来源，并补全 Cauchy-Schwarz 块内项数。
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, convergence, regularity]
strength: strong
strength_basis: 弱条件 + 强结论。条件：$f$ 满足阶 $\alpha > 1/2$ 的 Hölder 条件（弱——仅需整体正则性，不要求可微）；结论：Fourier 系数绝对可和，级数绝对且一致收敛（强——远强于逐点收敛）。证明用二进频段分解（dyadic blocks）按块估计系数。
---

# Bernstein 定理（Hölder 条件与绝对收敛）



## What — 陈述

> **定理（Bernstein，Ch. 3 习题，p.110）**。设 $f$ 为圆上的函数，满足阶 $\alpha$ 的 Hölder 条件
> $$
> |f(\theta + h) - f(\theta)| \le K|h|^\alpha, \qquad 0 < \alpha \le 1.
> $$
> 若 $\alpha > 1/2$，则 $f$ 的 Fourier 系数绝对可和：
> $$
\sum_{n \in \mathbb{Z}} |\hat f(n)| < \infty.
$$
> 特别地，$f$ 的 Fourier 级数绝对收敛，从而一致收敛。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, 习题（Bernstein 定理）, p.110]]。

## Why — 动机与证明

### 动机

绝对收敛是 Fourier 级数最强的收敛性（蕴含一致收敛与逐点收敛）。Hölder 阶 $\alpha > 1/2$ 是「足够光滑」的门槛：系数衰减的 $L^2$ 能量（Parseval 视角）与 $\ell^1$ 可和性在此处达到临界平衡。定理的证明展示**二进频段分解**：把频率轴按块 $2^{p-1} < |n| \le 2^p$ 分拆，每块用 Cauchy-Schwarz 把「块内项数 × 块能量」化为几何级数——这是 [[integral-truncation|积分分拆]] 思想在频域的体现。

### 证明思路

$$
\sum_{n\in\mathbb{Z}}|\hat f(n)| = |\hat f(0)| + \sum_{p=1}^\infty \sum_{2^{p-1}<|n|\le 2^p}|\hat f(n)|.
$$
对每块：
1. **块能量**：由 Hölder 条件与 Parseval，均值差分 $f(\theta+h) - f(\theta)$ 的 $L^2$ 范数给出 $\sum_{\text{块}}|\hat f(n)|^2 \le C\,2^{-2\alpha p}$；
2. **块内系数和**：Cauchy-Schwarz，$\sum_{\text{块}}|\hat f(n)| \le (\text{项数})^{1/2}(\text{块能量})^{1/2} \le C' 2^{(1/2-\alpha)p}$；
3. **几何求和**：$2^{1/2-\alpha} < 1$（当且仅当 $\alpha > 1/2$），块和收敛。

### 详细证明

**Claim 1（均值差分的能量恒等式与上界）**。对 $h \neq 0$，
$$
\sum_{n\in\mathbb{Z}} |e^{inh} - 1|^2|\hat f(n)|^2 = \frac{1}{2\pi}\int_0^{2\pi}|f(\theta+h)-f(\theta)|^2\,d\theta \le K^2|h|^{2\alpha}.
$$

*证明.* 平移 $f(\theta+h)$ 的 Fourier 系数为 $e^{inh}\hat f(n)$（由 $f \mapsto f(\cdot+h)$ 与核 $e^{-in\theta}$ 的乘积），故 $f(\theta+h) - f(\theta)$ 的系数为 $(e^{inh}-1)\hat f(n)$。

由 [[parseval-identity|Parseval 恒等式]]，
$$
\frac{1}{2\pi}\int|f(\theta+h)-f(\theta)|^2\,d\theta = \sum_n |e^{inh}-1|^2|\hat f(n)|^2,
$$
再以 Hölder 条件控制积分。$\blacksquare$

**Claim 2（二进块能量估计）**. 对 $p \ge 1$，取 $h_p = \pi\,2^{-p}$，则
$$
\sum_{2^{p-1}<|n|\le 2^p} |\hat f(n)|^2 \le \frac{K^2}{2}\,h_p^{2\alpha} = \frac{K^2\pi^{2\alpha}}{2}\,2^{-2\alpha p}.
$$

*证明.* 关键在两步：**左端消去乘子**靠 $|e^{inh_p}-1|^2$ 在块内的一致下界；**右端纳入 Claim 1**靠对全和的非负截取。

**第一步（选取 $h_p$ 使相位落在 $[π/2,π]$）。** 取 $h_p = \pi\,2^{-p}$。对块内 $n$，$2^{p-1}<|n|\le 2^p$，有
$$
\frac{\pi}{2} < |n h_p| \le \pi.
$$
记 $\theta = nh_p$，则
$$
|e^{i\theta}-1|^2 = 2-2\cos\theta = 4\sin^2(\theta/2).
$$
由 $|\theta|\in[\pi/2,\pi]$ 知 $|\theta/2|\in[\pi/4,\pi/2]$，而 $\sin$ 在该区间上的最小值为 $\sin(\pi/4) = \sqrt2/2$，故
$$
|e^{inh_p}-1|^2 \ge 4\cdot \tfrac12 = 2.
$$
特别地，$|e^{inh_p}-1|^2$ 在整个二进块内一致以 $2$ 为下界，**与 $|n|$ 的正负无关**（复指数模相等：对 $|z|=1$，$|z-1|^2 = |z|^2 - 2\operatorname{Re}(z) + 1 = 2 - 2\operatorname{Re}(z)$ 仅依赖 $\operatorname{Re}(z)$；$n$ 变号时 $\theta = nh_p$ 变号而 $\operatorname{Re}(e^{i\theta}) = \cos\theta$ 不变）。这就是左端不等式所需的"乘子均匀远离零点"。

**第二步（右端：代入 $h_p$ 后做非负截取）。** 在 Claim 1 中**特化** $h = h_p$（Claim 1 对一切 $h \neq 0$ 成立），得全和的界
$$
\sum_{n\in\mathbb{Z}}|e^{inh_p}-1|^2|\hat f(n)|^2 \le K^2 h_p^{2\alpha}.
$$
被求和的每一项都非负，故二进块上的子和不超过全和：
$$
\sum_{2^{p-1}<|n|\le 2^p}|e^{inh_p}-1|^2|\hat f(n)|^2 \le K^2 h_p^{2\alpha}.
$$

**第三步（合并两步）。** 在块上每项 $|e^{inh_p}-1|^2|\hat f(n)|^2 \ge 2\,|\hat f(n)|^2$（第一步），故
$$
2\sum_{2^{p-1}<|n|\le 2^p}|\hat f(n)|^2 \le \sum_{2^{p-1}<|n|\le 2^p}|e^{inh_p}-1|^2|\hat f(n)|^2 \le K^2 h_p^{2\alpha}.
$$
两端除以 $2$，得 Claim 2 的右端。$\blacksquare$

> **注**. 出现"乘 $2$ 再除 $2$"的来源是块的下界 $|e^{inh_p}-1|^2 \ge 2$——这恰好是 $\alpha$ 与 $1/2$ 的临界差距出现在频谱上的几何原因：在相位区间 $[\pi/2,\pi]$ 上，单位圆上的点 $e^{inh_p}$ 与 $1$ 至少相距 $\sqrt 2$。

**Claim 3（块内系数和）**. 存在常数 $C = K\pi^\alpha$ 使
$$
\sum_{2^{p-1}<|n|\le 2^p}|\hat f(n)| \le C\,2^{(1/2-\alpha)p}.
$$

*证明.* 块 $\{2^{p-1}<|n|\le 2^p\}$ 含 $2^p$ 个整数（正负各约 $2^{p-1}$），故
$$
\#\{n: 2^{p-1}<|n|\le 2^p\} = 2^p.
$$
由 Cauchy-Schwarz（详见 [[cauchy-schwarz-inequality]]）与 Claim 2，
$$
\sum_{2^{p-1}<|n|\le 2^p}|\hat f(n)|
\le \bigl(2^p\bigr)^{1/2}\Bigl(\frac{K^2\pi^{2\alpha}}{2}\,2^{-2\alpha p}\Bigr)^{1/2}
= \frac{K\pi^\alpha}{\sqrt 2}\,2^{p/2-\alpha p}.
$$
注意到 $\frac{K\pi^\alpha}{\sqrt 2}< K\pi^\alpha$，故可取 $C = K\pi^\alpha$（任何更大常数同样适用），并改用 $\le$ 给出更简洁的上界。$\blacksquare$

**收敛**。由 Claims 2–3 与 $\alpha > 1/2$：
$$
\sum_{n\in\mathbb{Z}}|\hat f(n)| \le |\hat f(0)| + C\sum_{p=1}^\infty 2^{(1/2-\alpha)p} < \infty,
$$
末项为公比 $2^{1/2-\alpha} < 1$ 的几何级数。故级数绝对收敛；由 [[absolute-convergence-test|Weierstrass M 判别法]]（$|\hat f(n)e^{in\theta}| \le |\hat f(n)|$），一致收敛。$\blacksquare$

> **依赖关系小结**: 本证明依赖链为「[[parseval-identity|Parseval 恒等式]]（平移系数的 $e^{inh}$ 乘子 + Hölder 条件）⇒ 均值差分能量界（Claim 1）⇒ 二进块能量估计（Claim 2：初等三角估计 $|e^{i\theta}-1|^2 = 4\sin^2(\theta/2) \geq 2$ 于 $|\theta| \in [\pi/2, \pi]$，叠加 Claim 1 的非负截取）⇒ 块内系数和（Claim 3：[[cauchy-schwarz-inequality|Cauchy-Schwarz 不等式]]）⇒ $\ell^1$ 可和（几何级数 + [[absolute-convergence-test|Weierstrass M 判别法]]）」。依赖均为基础工具（Parseval 恒等式、Cauchy-Schwarz、几何级数、M 判别法），无定理级复杂依赖，依赖图无环。

## What-if — 反例、等价叙述与推广

### 反例（门槛 $\alpha = 1/2$ 不可越过）

- **$\alpha \le 1/2$ 时结论失败**：构造 $f$ 使其系数在二进块 $2^{p-1}<|n|\le 2^p$ 上饱和于 Claim 2 的上界，即 $|\hat f(n)| \approx 2^{-(1/2+\alpha)p} \approx |n|^{-(1/2+\alpha)}$。这样的 $f$ 满足 Hölder 阶 $\alpha$（由对偶的衰减-正则性关系，见 [[fourier-coefficient-decay|Fourier 系数衰减]]），但
$$
\sum_{2^{p-1}<|n|\le 2^p}|\hat f(n)| \asymp 2^{(1/2-\alpha)p}
$$
对 $\alpha \le 1/2$ 不收敛。特别地 $\alpha = 1/2$ 时块和为常数，$\sum|\hat f(n)| = \infty$。
- **Hölder $\alpha$ 的系数只能保证 $O(|n|^{-\alpha})$**（[[fourier-coefficient-decay|Fourier 系数衰减]]）：$O(|n|^{-\alpha})$ 对 $\alpha \le 1$ 不可和，故「衰减阶」本身不足以推出绝对收敛——Bernstein 定理的关键在于 $L^2$ 能量的**二进块估计**，而非逐项界。

### 等价叙述

1. **系数语言**：$\sum_n|\hat f(n)| < \infty$（绝对可和）。
2. **收敛语言**：Fourier 级数一致收敛（由 M 判别法，等价于 1）。
3. **与逐点收敛的关系**：绝对收敛 ⟹ 一致收敛 ⟹ 逐点收敛；而 [[mean-square-convergence|均方收敛定理]] 只给 $L^2$ 收敛，不含逐点。

### 推广

- **经典结果**（Ch. 3 Ex. 18，见 [[fourier-coefficient-decay|Fourier 系数衰减]]）：$C^k$ ⟹ $\hat f(n) = o(|n|^{-k})$；Lipschitz / 单调 ⟹ $O(1/|n|)$；Hölder $\alpha$ ⟹ $O(|n|^{-\alpha})$。Bernstein 定理是其中唯一达到「$\ell^1$ 可和」的结果。
- **二进频段分解**（dyadic decomposition）本身是独立技术：把频率轴按块分拆，逐块用 Cauchy-Schwarz 再求和（此处亦见 [[integral-truncation|积分分拆]] 的频域版本）。

## 证明难度差异

| 叙述 | 方法 | 难度 |
|------|------|------|
| 系数语言 | 二进块 + Cauchy-Schwarz | **中** |
| 一致收敛 | 绝对收敛 + M 判别法 | **低**（继承） |

## 关联

- 定理：[[mean-square-convergence]]、[[parseval-identity]]（能量恒等式的来源）、[[riemann-lebesgue-lemma]]（系数衰减的起点）
- 概念：[[fourier-coefficient|Fourier 系数]]、[[fourier-series]]、[[lp-space|$L^2$ 空间]]（能量估计的框架）、[[ellp-space|$\ell^1$ 序列空间]]（绝对可和的归宿）
- 引理：[[fourier-coefficient-decay|Fourier 系数衰减]]（Hölder ⟹ $O(|n|^{-\alpha})$）、[[cauchy-schwarz-inequality]]
- 方法：[[integral-truncation|积分分拆]]（二进频段分解是其频域形式）
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3, p.110）
