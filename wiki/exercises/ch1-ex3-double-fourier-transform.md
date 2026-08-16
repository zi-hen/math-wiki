---
type: exercise
title: 双重 Fourier 变换的反演
aliases: [Ch.1 Ex.3, Fourier 变换的四阶性]
created: 2026-08-12
updated: 2026-08-15
sources: [steinFourierAnalysisIntroduction2003a]
status: verified
tags: [fourier-analysis, Ch.1, schwartz-space]
chapter: Ch.1 §2
number: Ex.3
---
# Ch.1 §2 Ex.3：双重 Fourier 变换的反演

## 陈述

> 设 $f \in$ [[schwartz-space|Schwartz 空间]] $\mathcal{S}(\mathbb{R})$（Schwartz 空间）。证明
> $$\widehat{\hat{f}}(\xi) = f(-\xi), \qquad \xi \in \mathbb{R}.$$

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Fourier Analysis, Ch. 1, §2, Ex. 3]]。

> 〔出处注〕本页依据既有习题页记载引用 Ch.1 §2 Ex.3；源页摘录中同式 $\widehat{\hat f}(\xi) = f(-\xi)$ 亦见于 p.255 Ex.6（Ch.7 区域），两者是否同一习题待用户核验，已登记于 open-questions。

## 思路提示

两重视角：

1. **算子视角**：记 $\mathcal{F}$ 为 [[fourier-transform|Fourier 变换]] 算子（$\mathcal{S}(\mathbb{R}) \to \mathcal{S}(\mathbb{R})$），$R$ 为反射算子 $Rf(\xi) = f(-\xi)$。本题结论即算子恒等式 $\mathcal{F}^2 = R$，由此得 $\mathcal{F}^4 = \mathrm{Id}$ 与 $\mathcal{F}^{-1} = R\mathcal{F}$——Fourier 变换在 $\mathcal{S}(\mathbb{R})$ 上是**四阶**线性自同构。
2. **直接计算视角**：双重积分 $\iint f(y)e^{-2\pi i x(y+\xi)}dy\,dx$ **不是**绝对可积的（$|e^{-2\pi i xy}| = 1$ 在 $x$ 方向无衰减），不能直接交换积分次序。解法是引入 Gauss 阻尼因子 $e^{-\pi\epsilon x^2}$（$\epsilon > 0$）使被积函数绝对可积；交换后内层积分化为 Gauss 核 $\epsilon^{-1/2}e^{-\pi(y+\xi)^2/\epsilon}$；该核是好核，$\epsilon \to 0^+$ 时把 $f$ 拉向 $f(-\xi)$。

## 解答

**设定.** 由定义（Stein 约定，无 $(2\pi)^{-1}$ 归一化），
$$
(\mathcal{F}f)(\xi) = \hat f(\xi) = \int_{\mathbb{R}} f(x)\,e^{-2\pi i \xi x}\,dx, \qquad f \in \mathcal{S}(\mathbb{R}).
$$
需证 $(\mathcal{F}^2 f)(\xi) = \widehat{\hat f}(\xi) = f(-\xi)$。

**第一步（Gauss 阻尼使 Fubini 适用）.** 对 $\epsilon > 0$ 定义
$$
I_\epsilon(\xi) := \int_{\mathbb{R}} \hat f(x)\,e^{-2\pi i \xi x}\,e^{-\pi\epsilon x^2}\,dx.
$$

先固定 $\epsilon$ 交换积分次序。代入 $\hat f$ 的定义，乘积空间 $\mathbb{R}^2$ 上的被积函数为 $F_\epsilon(y, x) = f(y)\,e^{-2\pi i x y}\,e^{-2\pi i \xi x}\,e^{-\pi\epsilon x^2}$，其模为 $|F_\epsilon(y,x)| = |f(y)|\,e^{-\pi\epsilon x^2}$，且
$$
\int_{\mathbb{R}^2}|F_\epsilon(y,x)|\,dy\,dx = \|f\|_{L^1}\int_{\mathbb{R}} e^{-\pi\epsilon x^2}\,dx = \|f\|_{L^1}\,\epsilon^{-1/2} < \infty,
$$
其中末步用到 Gauss 积分 $\int_{\mathbb{R}}e^{-\pi\epsilon x^2}dx = \epsilon^{-1/2}$。因 $F_\epsilon \in L^1(\mathbb{R}^2)$，由 [[fubini-tonelli|Fubini 定理]]，
$$
I_\epsilon(\xi) = \int_{\mathbb{R}} f(y)\left(\int_{\mathbb{R}} e^{-2\pi i x(y+\xi)}\,e^{-\pi\epsilon x^2}\,dx\right)dy. \tag{1}
$$

**Claim 1**（阻尼 Gauss 核的 Fourier 变换）. 对 $t \in \mathbb{R}$、$\epsilon > 0$，
$$
\int_{\mathbb{R}} e^{-2\pi i x t}\,e^{-\pi\epsilon x^2}\,dx = \epsilon^{-1/2}\,e^{-\pi t^2/\epsilon}.
$$

*证明.* 作换元 $u = \sqrt{\epsilon}\,x$（$dx = \epsilon^{-1/2}du$），
$$
\int_{\mathbb{R}} e^{-2\pi i x t} e^{-\pi\epsilon x^2}\,dx = \epsilon^{-1/2}\int_{\mathbb{R}} e^{-2\pi i u\, t/\sqrt{\epsilon}}\,e^{-\pi u^2}\,du.
$$
对 Gauss 函数应用自伴性（[[fourier-transform|Fourier 变换]] 的基本事实：$\widehat{e^{-\pi u^2}}(\eta) = e^{-\pi\eta^2}$，即 Stein Ch.5 Thm 1.4 的 $d=1$ 情形），取 $\eta = t/\sqrt{\epsilon}$，末式等于 $\epsilon^{-1/2}e^{-\pi t^2/\epsilon}$。$\blacksquare$

由 (1) 与 Claim 1（取 $t = y + \xi$）：
$$
I_\epsilon(\xi) = \int_{\mathbb{R}} f(y)\,\epsilon^{-1/2}\,e^{-\pi (y+\xi)^2/\epsilon}\,dy. \tag{2}
$$

**第二步（好核极限）.** 记 $K_\epsilon(t) = \epsilon^{-1/2}e^{-\pi t^2/\epsilon}$（$\epsilon > 0$）。验证 $\{K_\epsilon\}$ 是 $\mathbb{R}$ 上的 [[good-kernel|好核]] 族（参数 $\epsilon \to 0^+$，见好核页「关于参数的灵活性」）：

- **(a) 单位质量**：$\int_{\mathbb{R}} K_\epsilon(t)\,dt = \int_{\mathbb{R}} e^{-\pi u^2}\,du = 1$（换元 $u = t/\sqrt{\epsilon}$）；
- **(b) $L^1$ 有界**：$K_\epsilon \ge 0$，故 $\int_{\mathbb{R}}|K_\epsilon(t)|\,dt = 1$；
- **(c) 质量集中**：对 $\delta > 0$，
$$
\int_{|t| \ge \delta} K_\epsilon(t)\,dt = 2\int_{\delta/\sqrt{\epsilon}}^{\infty} e^{-\pi u^2}\,du \longrightarrow 0 \qquad (\epsilon \to 0^+).
$$

**Claim 2**（好核逼近，$f \in \mathcal{S}(\mathbb{R})$ 情形）. 设 $f \in \mathcal{S}(\mathbb{R})$，则
$$
\int_{\mathbb{R}} f(y)\,K_\epsilon(y + \xi)\,dy \xrightarrow{\ \epsilon \to 0^+\ } f(-\xi).
$$

*证明.* 由 (a) 单位质量改写差：
$$
\int_{\mathbb{R}} f(y)K_\epsilon(y+\xi)\,dy - f(-\xi) = \int_{\mathbb{R}} \big[f(y) - f(-\xi)\big]\,K_\epsilon(y+\xi)\,dy.
$$
固定 $\eta > 0$，把积分按 $|y + \xi| < \eta$ 与 $|y + \xi| \ge \eta$ 拆为两项。第一项由 $f$ 在 $-\xi$ 处连续：取 $\eta$ 充分小使 $|f(y) - f(-\xi)| < \delta$ 当 $|y+\xi| < \eta$，再由 (b) 得该项绝对值 $\le \delta\cdot 1$。第二项绝对值 $\le 2\|f\|_\infty\int_{|t| \ge \eta}K_\epsilon(t)\,dt$（换元 $t = y + \xi$），由 (c) 在 $\epsilon \to 0^+$ 时趋于 $0$。故对任意 $\delta > 0$ 先取 $\eta$ 再取 $\epsilon$ 充分小，差的绝对值 $< 2\delta$，极限为零。$\blacksquare$

由 (2) 与 Claim 2：
$$
I_\epsilon(\xi) \longrightarrow f(-\xi) \qquad (\epsilon \to 0^+). \tag{3}
$$

**第三步（取下阻尼极限）.** 另一方面，$|e^{-\pi\epsilon x^2}| \le 1$ 且 $|\hat f(x)e^{-2\pi i\xi x}| \le |\hat f(x)| \in L^1(\mathbb{R})$（因 $f \in \mathcal{S}(\mathbb{R})$ 蕴含 $\hat f \in \mathcal{S}(\mathbb{R}) \subset L^1(\mathbb{R})$），由 [[dominated-convergence|控制收敛定理]]，
$$
I_\epsilon(\xi) \longrightarrow \int_{\mathbb{R}} \hat f(x)\,e^{-2\pi i \xi x}\,dx = \widehat{\hat f}(\xi) \qquad (\epsilon \to 0^+). \tag{4}
$$

合并 (3) 与 (4) 得 $\widehat{\hat f}(\xi) = f(-\xi)$。$\blacksquare$

## 算子观点：Fourier 变换的四阶性

设 $Rf(\xi) = f(-\xi)$（反射算子）。本题结论 $(\mathcal{F}^2 f)(\xi) = f(-\xi)$ 即算子恒等式
$$
\mathcal{F}^2 = R.
$$

由此立即得到：

- **$\mathcal{F}^4 = \mathrm{Id}$**：因 $R^2 = \mathrm{Id}$，故 $\mathcal{F}^4 = R^2 = \mathrm{Id}$。Fourier 变换是 $\mathcal{S}(\mathbb{R})$ 上的**四阶**线性自同构。
- **逆变换 = 反射后变换**：$\mathcal{F}^{-1} = \mathcal{F}^3 = R\mathcal{F} = \mathcal{F}R$。事实上由逆变换公式 $\mathcal{F}^{-1}g(x) = \int_{\mathbb{R}}g(\xi)e^{2\pi i x\xi}d\xi = (\mathcal{F}g)(-x) = R\mathcal{F}g(x)$。因此反演公式 $f = \mathcal{F}^{-1}\hat f$ 与本题 $\mathcal{F}^2 = R$ 互为推论、彼此等价。
- **与反射算子交换**：$\mathcal{F}R = R\mathcal{F}$，即反射性质 $\widehat{f(-\cdot)}(\xi) = \hat f(-\xi)$（见 [[fourier-transform|Fourier 变换]] 页 Claim 4）。
- **谱结构**：把 $f$ 分解为偶部与奇部 $f_e = \tfrac12(f + Rf)$、$f_o = \tfrac12(f - Rf)$，则 $\mathcal{F}^2 f_e = f_e$、$\mathcal{F}^2 f_o = -f_o$，故 $\mathcal{F}$ 的特征值 $\subseteq \{1, -1, i, -i\}$。事实上四类特征空间分别由 [[hermite-functions|Hermite 函数]] $\psi_n$（$n \equiv 0, 1, 2, 3 \bmod 4$）张成，$\mathcal{F}\psi_n = (-i)^n\psi_n$（Ch.5 Ex.7 / Pb.9）。
- **信号处理诠释**：两次 Fourier 变换 = 时间反演（reflection）；四次 = 恒等。

## 备注

- **旧版解答的两处错误（已更正）**：(1) 旧稿称无阻尼双重积分「关于 $y$ 绝对可积」——不成立：$|f(y)e^{-2\pi i x(y+\xi)}| = |f(y)|$ 在 $x$ 方向无衰减，$\iint_{\mathbb{R}^2}|f(y)|\,dx\,dy = \infty$，Fubini 不适用；(2) 旧稿称正弦核 $\sin(2\pi Rt)/(\pi t)$ 是「好核」——不成立：其 $L^1$ 范数发散（[[dirichlet-kernel-l1-norm|Dirichlet 核问题]]），收敛性依赖 [[riemann-localization|Riemann 局部化]] 而非好核性质。本解答以 Gauss 核正则化取代，全程严格。
- **与反演公式的关系**：本解答的论证骨架（Gauss 阻尼 + 好核极限 + 取下极限）与 Stein Ch.5 反演定理（[[fourier-inversion|Fourier 反演]]，Thm 1.9）的证明核心同构——本题可视为反演公式证明的「热身」。
- **替代证法（反演公式路线）**：若已证反演公式 $f(x) = \int_{\mathbb{R}}\hat f(\xi)e^{2\pi i x\xi}d\xi$，取 $x = -\xi$ 即得 $\widehat{\hat f}(\xi) = f(-\xi)$。该路线一步完成但依赖反演公式；本解答不依赖之，自足。

## 关联

- 用到的概念：[[fourier-transform]]、[[schwartz-space]]、[[good-kernel]]、[[lp-space|L^p 空间]]
- 用到的引理：[[fubini-tonelli]]、[[dominated-convergence]]、[[dirichlet-kernel-l1-norm]]
- 用到的定理：[[fourier-inversion]]（替代证法）、[[hermite-functions]]（谱结构）
- 用到的方法：[[approx-by-good-kernel]]（好核逼近）
