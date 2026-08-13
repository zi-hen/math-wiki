---
type: theorem
title: Wirtinger 不等式
description: 周期函数 $L^2$ 范数被导数 $L^2$ 范数控制的 Poincaré 型不等式，等号由基波达到，是等周不等式的核心工具
aliases: [Wirtinger inequality, Wirtinger 技巧]
created: 2026-08-12
updated: 2026-08-13
sources: [steinFourierAnalysisIntroduction2003a]
status: unverified
tags: [inequality, fourier-analysis, geometry]
strength: standard
strength_basis: 条件：$f$ 周期 $T$，$\int f = 0$，$C^1$（弱）；结论：$\int |f|^2 \leq (T/2\pi)^2 \int |f'|^2$，等号仅当 $f$ 为基波 $\sin(2\pi t/T), \cos(2\pi t/T)$。Stein Ch. 3 Ex.11 + Ch. 4 等周不等式的核心工具。
---

# Wirtinger 不等式

> **工作空间**：周期函数空间 $C^1([0, T])$ 或 $C^1(\mathbb{T})$。Stein 在 Ch. 3 Exercise 11 与 Ch. 4 §1 用此证等周。

## 陈述

> 在 **$\mathbb{T}$**（即 $T$-周期函数）上，设 $f \in C^1$ 且 $\int_0^T f = 0$，则
> $$
> \int_0^T |f(t)|^2\,dt \leq \left(\frac{T}{2\pi}\right)^2 \int_0^T |f'(t)|^2\,dt.
> $$
> 等号当且仅当 $f(t) = A\sin(2\pi t/T) + B\cos(2\pi t/T)$（基波）。

依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi, Ch. 3, Exercise 11(a)]]；证明工具为 [[parseval-identity|Parseval 恒等式]]。

## 等价叙述

**叙述 B（$T = 2\pi$ 圆群形式）**：若 $f \in C^1(\mathbb{T})$，$\int_{\mathbb{T}} f = 0$，则 $\int_{\mathbb{T}} |f|^2 \le \int_{\mathbb{T}} |f'|^2$，等号当且仅当 $f$ 为基波。

等价性（形式等价，时间放缩）：令 $g(\tau) = f(T\tau/(2\pi))$，则 $g$ 为 $2\pi$-周期。变量替换给出 $\int_0^{2\pi}|g|^2\,d\tau = (2\pi/T)\int_0^T |f|^2\,dt$ 与 $\int_0^{2\pi}|g'|^2\,d\tau = (T/2\pi)\int_0^T |f'|^2\,dt$，故 $\int|g|^2 \le \int|g'|^2$ 等价于 $\int_0^T |f|^2 \le (T/2\pi)^2 \int_0^T |f'|^2$。此即 Stein Ch. 3 Exercise 11(a) 的原始形式。

## 证明思路

由 [[parseval-identity|Parseval]] 立得：[[fourier-coefficient|Fourier 系数]] $a_n$ 与导数系数 $a_n \cdot (2\pi i n/T)$ 的模平方和分别给出 $\|f\|_2^2$ 与 $\|f'\|_2^2$；均值条件 $\int f = 0$ 给出 $a_0 = 0$，逐项比较后求和即得不等式。

1. **Fourier 展开**：$f(t) = \sum_{n\in\mathbb{Z}} a_n e^{2\pi i n t/T}$，其中 $a_0 = 0$（因 $\int f = 0$）。
2. **导数系数**：$f'$ 的第 $n$ 个 Fourier 系数为 $a_n \cdot (2\pi i n/T)$。
3. **逐项比较 + Parseval**：对 $n \neq 0$ 逐项比较模平方，求和得 $\|f\|_2^2 \le (T/2\pi)^2\|f'\|_2^2$。

## 详细证明

**第一阶段：Parseval 给出两端范数。** 由 [[parseval-identity|Parseval 恒等式]]，$\|f\|_2^2 = \sum_n |a_n|^2$；又 $f'$ 的 Fourier 系数为 $a_n \cdot 2\pi i n/T$，故
$$
\|f'\|_2^2 = \sum_{n\in\mathbb{Z}} \left(\frac{2\pi n}{T}\right)^2 |a_n|^2.
$$

**第二阶段：逐项比较。** $\int_0^T f = 0$ 给出 $a_0 = 0$。对 $n \neq 0$，$n^{-2} \le 1$，故
$$
|a_n|^2 = \left(\frac{T}{2\pi}\right)^2 n^{-2}\left(\frac{2\pi n}{T}\right)^2 |a_n|^2 \le \left(\frac{T}{2\pi}\right)^2 \left(\frac{2\pi n}{T}\right)^2 |a_n|^2.
$$
对 $n \neq 0$ 求和（此推导与 [[ch5-pb11-wirtinger|Ch.5 Pb.11(a)]] 的解答一致）：
$$
\|f\|_2^2 = \sum_{n\neq 0} |a_n|^2 \le \left(\frac{T}{2\pi}\right)^2 \sum_{n\neq 0}\left(\frac{2\pi n}{T}\right)^2 |a_n|^2 = \left(\frac{T}{2\pi}\right)^2 \|f'\|_2^2.
$$

**第三阶段：等号条件。** 等号当且仅当所有 $|n| \ge 2$ 的系数 $a_n = 0$，即 $f$ 仅含 $n = \pm 1$ 两项：
$$
f(t) = a_1 e^{2\pi i t/T} + a_{-1} e^{-2\pi i t/T} = A\sin(2\pi t/T) + B\cos(2\pi t/T).
$$
$\blacksquare$

## 其他证明

> 本区段按 docs/PROOFS.md §6.5 记录与主证明不同的第二证法;主证明(§「详细证明」)保持不变。

#### 证明二:变分法(瑞利商极小化)〔非书内证明,标准变分法/谱定理结果〕

**来源与录入**。定理陈述依据 [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 3, Exercise 11(a)]];本证法为经典变分法/谱理论路线(瑞利商 + Euler–Lagrange + 谱定理),非 Stein 书内证法,属标准泛函分析教材结果〔非书内证明,标准变分法/谱定理结果〕。录入日期:2026-08-13。

**动机**。主证明(Parseval)把不等式逐项化归为频谱系数的比较($n^{-2} \le 1$)。证明二从「不等式是某个量的下确界」这一变分观点出发:定义瑞利商 $R(f) = \int_0^{2\pi}|f'|^2/\int_0^{2\pi}|f|^2$(约束 $\int f = 0$),其下确界 $\lambda$ 正是算子 $-\frac{d^2}{d\theta^2}$(周期边界、均值零约束)的最小特征值。核心困难有二:其一,下确界是否被达到——需紧性,这是谱定理的标准结果;其二,Euler–Lagrange 论证给出的只是必要条件,须把满足该条件的候选函数族完整解出。关键观察:$-\frac{d^2}{d\theta^2}$ 的周期特征函数恰为 $\cos(n\theta)$、$\sin(n\theta)$,特征值 $n^2$——最小特征值 $1$ 与等号条件(基波)在同一计算中同时浮现,常数 $1$ 无需任何级数求和。

**证明思路**。

1. **化归**:复值函数按实部虚部拆解,瑞利商不小于两部分中较小者,只需对实值函数证明。
2. **变分必要条件**:设 $f \in C^2$ 达到下确界 $\lambda$,则对一切变分 $g \in C^1$(保持 $\int g = 0$),$\frac{d}{dt}R(f + tg)\big|_{t=0} = 0$,得 $\int f'g' = \lambda\int fg$。
3. **Euler–Lagrange 方程**:分部积分 + 基本引理,得 $-f'' = \lambda f$(周期边界)。
4. **特征值问题**:通解 $f(\theta) = A\cos(\sqrt\lambda\,\theta) + B\sin(\sqrt\lambda\,\theta)$;周期性 + 均值零 ⇒ $\lambda = n^2$($n \ge 1$)。
5. **谱定理(极小极大原理)**:$\lambda = \inf R$ 等于最小特征值 $1$;达到者恰为基波。

**详细证明**。

**Claim 1**(实值化归). 设 $f = u + iv \in C^1(\mathbb{T})$ 复值,$\int_0^{2\pi} f = 0$,$f \not\equiv 0$。则存在实值可容许函数 $w$($w \in C^1(\mathbb{T})$、$\int_0^{2\pi}w = 0$、$w \not\equiv 0$)使 $R(f) \ge R(w)$。因此只需对实值函数证明 $R \ge 1$。

*证明.* 由 $\int f = 0$ 得 $\int u = \int v = 0$。记 $A = \int|u'|^2$、$B = \int|v'|^2$、$C = \int u^2$、$D = \int v^2$。则 $R(f) = (A + B)/(C + D)$。若 $C, D > 0$,由加权平均不等式 $\frac{A+B}{C+D} \ge \min(\frac{A}{C}, \frac{B}{D})$(设 $\frac{A}{C} \le \frac{B}{D}$,则 $A(C+D) \le C(A+B)$),取 $w$ 为 $u$ 与 $v$ 中瑞利商较小者,则 $R(w) \le R(f)$。若 $C = 0$(即 $u \equiv 0$),取 $w = v$,则 $R(f) = R(v) = R(w)$;$D = 0$ 情形对称。故结论成立。$\blacksquare$

**Claim 2**(变分方程). 设实值 $f \in C^2(\mathbb{T})$ 满足 $\int_0^{2\pi} f = 0$、$f \not\equiv 0$,且 $R(f) = \lambda := \inf\{R(g)\}$(下确界被 $f$ 达到)。则对一切 $g \in C^1(\mathbb{T})$,
$$\int_0^{2\pi} f'\,g'\,d\theta = \lambda\int_0^{2\pi} f\,g\,d\theta.$$

*证明.* 先设 $\int_0^{2\pi} g = 0$。则对一切实数 $t$,$f + tg$ 仍可容许($\int(f + tg) = 0$)。记 $N(t) = \int_0^{2\pi}(f' + tg')^2\,d\theta$、$D(t) = \int_0^{2\pi}(f + tg)^2\,d\theta$。展开:$N(t) = N(0) + 2t\int f'g' + t^2\int(g')^2$,$D(t) = D(0) + 2t\int fg + t^2\int g^2$。因 $f$ 达到下确界,$R(f + tg) = N(t)/D(t) \ge \lambda = R(f)$(对 $|t|$ 充分小,$D(t) > 0$),且 $t \mapsto N(t)/D(t)$ 在 $t = 0$ 处可导,故
$$0 = \frac{d}{dt}\frac{N(t)}{D(t)}\Big|_{t=0} = \frac{N'(0)\,D(0) - N(0)\,D'(0)}{D(0)^2} = \frac{2}{D(0)}\Big(\int_0^{2\pi} f'g'\,d\theta - \lambda\int_0^{2\pi} fg\,d\theta\Big),$$
得 $\int f'g' = \lambda\int fg$。对一般 $g \in C^1$:由 $\int f = 0$ 与 $\int f' = 0$($f$ 周期),有 $\int f(g - m) = \int fg$、$\int f'(g - m)' = \int f'g'$,其中 $m = \frac{1}{2\pi}\int g$,而 $\int(g - m) = 0$,代入已证情形即得。$\blacksquare$

**Claim 3**(Euler–Lagrange 方程). 在 Claim 2 的条件下,$f'' + \lambda f = 0$(处处)。

*证明.* 由 [[integration-by-parts|分部积分]]($f'g$ 周期,边界项 $[f'g]_0^{2\pi} = 0$),
$$\int_0^{2\pi} f'g'\,d\theta = -\int_0^{2\pi} f''g\,d\theta.$$
代入 Claim 2 得 $\int_0^{2\pi}(f'' + \lambda f)\,g\,d\theta = 0$ 对一切 $g \in C^1(\mathbb{T})$。记 $\phi = f'' + \lambda f \in C^0(\mathbb{T})$。由变分法基本引理的标准证明,反设 $\phi$ 在某点 $\theta_0$ 处 $\phi(\theta_0) \neq 0$,不妨 $\phi(\theta_0) > 0$;由连续性,存在 $\delta > 0$ 使 $\phi > 0$ 于 $(\theta_0 - \delta, \theta_0 + \delta)$。对 $0 < \varepsilon < \delta$ 取非负试函数 $h_\varepsilon(\theta) = \big(1 - (\theta - \theta_0)^2/\varepsilon^2\big)_+^2 \in C^1(\mathbb{T})$(支撑于 $(\theta_0 - \varepsilon, \theta_0 + \varepsilon)$)。则 $\int_0^{2\pi}\phi\,h_\varepsilon \ge \min_{|\theta - \theta_0|\le\varepsilon}\phi(\theta)\cdot\int h_\varepsilon > 0$,与 $\int \phi g = 0$($\forall g \in C^1$)矛盾。故 $\phi \equiv 0$,即 $f'' + \lambda f = 0$。$\blacksquare$

**Claim 4**(特征值问题). $-f'' = \lambda f$ 在 $C^2(\mathbb{T})$、$\int_0^{2\pi} f = 0$、$f \not\equiv 0$ 下的全部解为:$\lambda = n^2$($n \in \mathbb{Z}_{\ge 1}$),$f(\theta) = A\cos(n\theta) + B\sin(n\theta)$($A, B$ 不全为零)。

*证明.* 二阶常系数线性 ODE $-f'' = \lambda f$ 的特征方程为 $r^2 + \lambda = 0$。若 $\lambda = 0$:通解 $f(\theta) = c_1\theta + c_2$;周期性迫使 $c_1 = 0$,则 $f$ 为常数,均值零给出 $f \equiv 0$,矛盾。若 $\lambda < 0$:通解 $f = c_1e^{\sqrt{-\lambda}\,\theta} + c_2e^{-\sqrt{-\lambda}\,\theta}$,周期性迫使 $c_1 = c_2 = 0$,矛盾。故 $\lambda > 0$,通解
$$f(\theta) = A\cos(\sqrt\lambda\,\theta) + B\sin(\sqrt\lambda\,\theta).$$
周期 $2\pi$ 要求 $\sqrt\lambda = n \in \mathbb{Z}$(对 $\cos$ 与 $\sin$ 均成立);均值零在 $n \ge 1$ 时自动成立,因为 $\int_0^{2\pi}\cos(n\theta)\,d\theta = \int_0^{2\pi}\sin(n\theta)\,d\theta = 0$;而 $n = 0$ 恰为 $\lambda = 0$ 情形,已排除。故 $\lambda = n^2$($n \ge 1$),解集如上。$\blacksquare$

**谱定理步骤(非书内标准结果)**。由谱定理/极小极大原理(标准泛函分析结果:自伴算子 $-\frac{d^2}{d\theta^2}$ 具周期边界与均值零约束,具紧预解式,其瑞利商下确界等于最小特征值),Claim 2 假设中的下确界 $\lambda$ 被某个光滑函数达到(存在性:极小化序列 + 紧嵌入 $H^1 \hookrightarrow L^2$ + 椭圆正则性,标准论证)。于是 Claims 2–4 的条件全部满足,$\lambda = \min\{n^2 : n \ge 1\} = 1$,且达到者属于 $n = 1$ 的特征空间 $\{\theta \mapsto A\cos\theta + B\sin\theta\}$。

**结论**。对任意可容许 $f$($C^1(\mathbb{T})$、$\int_0^{2\pi}f = 0$、$f \not\equiv 0$),由 Claim 1 可化为实值函数,且 $R(f) \ge \lambda = 1$,即
$$\int_0^{2\pi}|f'|^2\,d\theta \ge \int_0^{2\pi}|f|^2\,d\theta.$$
等号当且仅当 $R(f) = 1$,即 $f$ 属于 $n = 1$ 的特征空间:$f(\theta) = A\cos\theta + B\sin\theta$(基波)。对一般周期 $T$,按页首「等价叙述」的时间放缩 $g(\tau) = f(T\tau/(2\pi))$ 化归到 $2\pi$ 周期,得 $\int_0^T|f|^2 \le (T/2\pi)^2\int_0^T|f'|^2$,等号条件不变。$\blacksquare$

**与主证明的比较**。主证明(Parseval)把问题化为频谱系数的逐项比较,一步到常数 $1$;本证明(变分法)需要谱定理的存在性保证,但揭示了常数的几何来源(最小特征值)与等号函数(基波)的算子刻画。工具与代价:主证明用级数求和,本证明用微分方程 + 泛函分析标准结果。

## 证明难度差异

| 叙述 | 方法 | 难度 | 代价 |
|------|------|------|------|
| 证明一（叙述 B，Parseval）| 频谱系数逐项比较 | **低** | 需 [[parseval-identity|Parseval 恒等式]] 与级数求和 |
| 证明二（叙述 B，变分法）| 瑞利商 + Euler–Lagrange + 谱定理 | **中至高** | 需谱定理/紧性标准结果；等号条件经特征函数刻画〔非书内证明，标准变分法/谱定理结果〕 |

## 应用

- **等周不等式**（[[isoperimetric-inequality]] 的 Hurwitz 证明）：对曲线 $(x(t), y(t))$ 的两个分量应用 Wirtinger + Cauchy-Schwarz。
- **与等周不等式的等价**（Ch. 4, Ex. 4）：弧长参数化下 $2(\pi - A) = \int[(x'+y)^2 + (y'^2 - y^2)]\,ds$，其中 $\int y = 0$ 时可化；反之由 Wirtinger 构造使括号项为零的曲线——两个不等式互为充要（等号条件对应圆周 / $A\sin t + B\cos t$）。
- **Poincaré 不等式**（高维版，Ch. 5 Problem 11）。
- **波动方程能量估计**。

## 关联

- 前置定理：[[parseval-identity]]（核心工具）
- 关联概念：[[lp-space|$L^2$ 空间]]（框架）、[[fourier-series]]（工具）
- 关联引理：[[cauchy-schwarz-inequality]]
- 应用定理：[[isoperimetric-inequality]]
- 源：[[steinFourierAnalysisIntroduction2003a]]（Ch. 3 Ex.11、Ch. 4 §1）

## 相关习题

> **规则**：与定理**强相关**的 exercise/problem（特例、反例、证明直接引用）必须在此填充**陈述**（不含证明）；证明仅存在于习题/问题页。

- [[ch5-pb11-wirtinger|Ch.5 Pb.11]]：Wirtinger/Poincaré 不等式族（$\mathbb{R}$ 版）——(a) 周期 $T$ 情形（等号基波）；(b) 内积型估计；(c) 区间 $[a,b]$ 端点为零情形；(d) 等周不等式扩展（陈述不含证明，完整解答见习题页）。