# NOTATION.md — Stein–Shakarchi 记号约定

本 wiki 统一采用 **Stein–Shakarchi** 记号。任何页面中的公式必须符合下列约定；若某源使用不同约定，摄取时须换算为本约定并注明「〔已换算为 Stein 约定〕」。

## 强制记号表

| 对象 | 约定 | 公式 |
|------|------|------|
| Fourier 变换 | $e^{2\pi i \xi x}$ | $\hat{f}(\xi)=\int_{-\infty}^{\infty} f(x)\,e^{-2\pi i \xi x}\,dx$ |
| 逆 Fourier 变换 | 对称 | $f(x)=\int_{-\infty}^{\infty}\hat{f}(\xi)\,e^{2\pi i \xi x}\,d\xi$ |
| Poisson 求和 | 无 $2\pi$ 因子 | $\displaystyle\sum_{n\in\mathbb{Z}} f(n)=\sum_{n\in\mathbb{Z}}\hat{f}(n)$ |
| 卷积 | 标准 | $(f*g)(x)=\int f(x-y)g(y)\,dy$ |
| 调和函数 | 平均值性质 | $u(x)=\frac{1}{|B|}\int_B u$ |
| $L^p$ 范数 | 标准 | $\|f\|_p=\bigl(\int|f|^p\bigr)^{1/p}$ |

## 补充约定

- 复共轭记作 $\overline{z}$；内积记作 $\langle f,g\rangle=\int f\overline{g}$。
- 区间指示函数记作 $\chi_I$（$\chi_{[a,b]}$、$\chi_{[-1/2,1/2]}$ 等，下标即区间）；**$\mathbf{1}$ 保留给数论常函数**（[[dirichlet-theorem-on-primes]] 中 Dirichlet 卷积 $\chi*\mathbf{1}$ 的 $\mathbf{1}$ 即常函数 $1$，已注明）；2026-08-13 已裁决统一，见「常用记号登记」A 与 `wiki/open-questions.md`。
- $\ell^p$ 范数记作 $\|a\|_{\ell^p}$，简写 $\|a\|_p$（`wiki/concepts/ellp-space.md`）；$\ell^2$ 内积 $(a,b)=\sum_n a_n\overline{b_n}$。
- 量子力学语境（Ch.5 Ex.23 / Pb.9）内积亦写作圆括号 $(f,g)=\int f\overline{g}$，与 $\langle f,g\rangle$ 等价（仅该语境）。
- $B_R$ 表示半径 $R$ 的球；$\partial B_R$ 其边界；$\sigma$ 表示球面测度。
- 求和/积分上下限优先写 $\in\mathbb{Z}$、$\in\mathbb{R}^d$ 等集合记法。
- 凡涉及多变量，默认空间为 $\mathbb{R}^d$。
- **圆群卷积的归一化**：$\mathbb{R}$ 上卷积无归一化（见强制表）；圆群 $\mathbb{T}$ 上 Stein 书中卷积定义带 $1/(2\pi)$ 因子（$(f*g)(x)=\frac{1}{2\pi}\int_{-\pi}^{\pi}f(y)g(x-y)\,dy$，Ch.2 p.61），好核单位质量条件相应为 $\frac{1}{2\pi}\int K_n=1$。圆群页写作无因子卷积式仅为逼近性质陈述，勿与带归一化定义混用。**（2026-08-13 用户裁决：平凡问题，不统一修改，以上下文明确为准；圆群 Fourier 系数归一化同理。）**

## 常用记号登记（按语境，默认登记）

> 依据「收录原则」默认收录的常用记号。除标注语境者外，均可全库通用；圆群两套基（$e^{in\theta}$ 与 $e^{2\pi i n\theta}$）的归一化差异经 2026-08-13 用户裁决为平凡问题，**不统一修改**，各页沿用现状并注明所用基与归一化。

### A. 采样与特征函数（信号处理语境）

| 记号 | 含义 | 语境 |
|------|------|------|
| $K(y)=\dfrac{\sin(\pi y)}{\pi y}$（$y=0$ 处取 $1$） | sinc 核 / 采样重建核 | [[sampling-theorem]]、[[ch5-ex20-sampling]]；区间 $[-a,a]$ 特征函数之 Fourier 变换写作 $\frac{\sin(2\pi a\xi)}{\pi\xi}$（[[fourier-transform]]、[[plancherel-theorem]]），同族 |
| $\chi_I$（$\chi_{[a,b]}$ 等） | 区间指示函数 | [[sampling-theorem]]、[[ch5-ex20-sampling]]、[[fourier-transform]]、[[riemann-lebesgue-lemma]]、[[weyl-equidistribution]] |

### B. 圆群 Fourier 基与系数（Ch.2–4 圆群语境）

| 记号 | 含义 | 语境 |
|------|------|------|
| $e^{int}$ / $e^{in\theta}$（$n\in\mathbb{Z}$，$t,\theta\in[0,2\pi]$ 或 $[-\pi,\pi]$） | $[0,2\pi]$ 圆群正交基 | [[isoperimetric-inequality]]（$x(t)=\sum a_ne^{int}$）、[[fejer-theorem]]、[[riemann-localization]]、[[weierstrass-approximation-trig]]、[[good-kernel]]（$P_r(\theta)=\sum r^{|n|}e^{in\theta}$） |
| $\hat f(n)=\dfrac{1}{2\pi}\int_{-\pi}^{\pi} f(\theta)e^{-in\theta}\,d\theta$ | 圆群 Fourier 系数 | [[fourier-coefficient]]（定义）——与 $[0,1]$ 基系数（见下）经 $x=\theta/(2\pi)$ 互换；归一化差异见 open-questions 冲突 |
| $e^{2\pi i n x}$（$x\in[0,1]$，Stein Ch.2 主约定） | $[0,1]$ 周期基 | [[fourier-series]]、[[parseval-identity]]、[[poisson-summation-formula]]；$\hat f(n)=\int_0^1 f(x)e^{-2\pi i nx}\,dx$ |
| $e^{2\pi i nt/T}$、$\hat f(n)=\dfrac{1}{T}\int_0^T f(t)e^{-2\pi i nt/T}\,dt$ | 一般周期 $T$ 的 Fourier 系数与级数 | [[wirtinger-inequality]]；$T=1$ 退化为 $[0,1]$ 基，$T=2\pi$ 时与 $e^{int}$ 仅差缩放 |

### C. Fourier 级数收敛性算子与核（Ch.2–4）

| 记号 | 含义 | 语境 |
|------|------|------|
| $S_N(f)(x)=\sum_{|n|\le N}\hat f(n)e^{2\pi i nx}$ | 第 $N$ 个 Fourier 部分和 | [[fourier-series]]、[[parseval-identity]]；圆群下写作 $S_N(f)(\theta)=\sum_{|n|\le N}\hat f(n)e^{in\theta}$（[[fejer-theorem]]、[[riemann-localization]]） |
| $\sigma_N(f)=\dfrac{1}{N}\sum_{k=0}^{N-1}S_k(f)$ | Cesàro 平均（**Stein 索引 $0$ 至 $N-1$**，非 $1/(N+1)$） | [[cesaro-summation]]、[[fejer-theorem]]；等效系数形式 $\sum_{|n|\le N-1}(1-|n|/N)\hat f(n)e^{in\theta}$（[[weierstrass-approximation-trig]]） |
| $D_N(x)=\sum_{|n|\le N}e^{2\pi i nx}$ | Dirichlet 核（**非好核**，$\|D_N\|_{L^1}\ge c\log N$） | [[fourier-series]]；圆群下 $D_N(t)=\sum_{|n|\le N}e^{int}=\dfrac{\sin((N+\tfrac12)t)}{\sin(t/2)}$（[[riemann-localization]]、[[good-kernel]]） |
| $F_N=\dfrac{1}{N}\sum_{k=0}^{N-1}D_k=\dfrac{1}{N}\dfrac{\sin^2(Nx/2)}{\sin^2(x/2)}$ | Fejér 核（好核，Dirichlet 核之 Cesàro 平均） | [[fejer-theorem]]、[[good-kernel]]、[[cesaro-summation]] |
| $P_r(\theta)=\sum_{n\in\mathbb{Z}}r^{|n|}e^{in\theta}=\dfrac{1-r^2}{1-2r\cos\theta+r^2}$（$0<r<1$） | Poisson 核（好核，Abel 求和） | [[good-kernel]] |
| $H_t(x)=\sum_{n}e^{-4\pi^2n^2t}e^{2\pi i nx}$；$\mathbb{R}$ 上 $H_t(x)=\frac{1}{(4\pi t)^{1/2}}e^{-x^2/4t}$ | 热核（$[0,1]$ 基 / $\mathbb{R}$） | [[good-kernel]]、[[poisson-summation-formula]] |
| $K_\delta(x)=\delta^{-1/2}e^{-\pi x^2/\delta}$（Stein 约定） | Gauss 核（好核；$\hat K_\delta(\xi)=e^{-\pi\delta\xi^2}$） | [[approx-by-good-kernel]]「特例:Gauss 磨光」节；用于 [[fourier-inversion]] 证明二（Poisson 核外替代）、[[plancherel-theorem]] 证明二 $L^2$ 延拓；**注**:此为 Stein 约定下的形式,**禁止**用 $\frac{1}{\sqrt{2\pi}\delta}e^{-x^2/2\delta^2}$（高斯约定）混入 |
| $f(x)\sim\sum\hat f(n)e^{2\pi i nx}$ | 记号 $\sim$：$f$ 的 **Fourier 级数**为右式（形式级数，不蕴含收敛） | [[fourier-series]]（定义）、[[parseval-identity]] |

### D. Hermite 算子与函数（量子力学语境，Ch.5 Ex.23 / Pb.9）

| 记号 | 含义 | 语境 |
|------|------|------|
| $L=-\dfrac{d^2}{dx^2}+x^2$ | Hermite 算子 | [[ch5-ex23-heisenberg]]、[[ch5-pb9-hermite-eigenfunc]]、[[heisenberg-uncertainty-principle]]；于 $\mathcal{S}$ 上 $L\ge I$ |
| $A=\dfrac{d}{dx}+x$（湮灭）、$A^*=-\dfrac{d}{dx}+x$（产生） | 升/降算子 | 同上；$A^*A=L-I$，$\langle A^*Af,f\rangle=\|Af\|^2\ge 0$ |
| $h_k(x)=(-1)^k e^{x^2/2}\dfrac{d^k}{dx^k}e^{-x^2}$ | Hermite 函数 | [[ch5-pb9-hermite-eigenfunc]]；$Lh_k=(2k+1)h_k$；$h_k^*(x)=h_k((2\pi)^{1/2}x)$ 满足 $\widehat{h_k^*}=(-i)^kh_k^*$ |

### E. 卷积对偶与其他

| 记号 | 含义 | 语境 |
|------|------|------|
| $\widehat{f*g}=\hat f\,\hat g$ | 卷积的 Fourier 对偶（圆群：$\widehat{f*g}(n)=\hat f(n)\hat g(n)$；$\mathbb{R}$：$\widehat{f*g}(\xi)=\hat f(\xi)\hat g(\xi)$） | [[fourier-series]]、[[fourier-transform]]、[[fourier-inversion]]、[[approx-by-good-kernel]] |
| $\widehat{f'}(\xi)=2\pi i\xi\,\hat f(\xi)$；圆群 $\widehat{f'}(n)=in\,\hat f(n)$ | 导数-乘 $\xi$ 对偶（Stein 核约定下 $2\pi i$ 出现在 $\mathbb{R}$ 版） | [[fourier-transform]]、[[fourier-coefficient]]、[[wirtinger-inequality]] |

### F. 算子与特殊记号

| 记号 | 含义 | 语境 |
|------|------|------|
| $\mathcal{F}$ | Fourier 变换算子（$\mathcal{F}f=\hat f$），$\mathcal{F}: L^2(\mathbb{R})\to L^2(\mathbb{R})$ 为酉算子 | [[plancherel-theorem]]、[[fourier-inversion]] 等多页 |
| $\chi$ | Dirichlet 特征标（[[dirichlet-theorem-on-primes]] 语境，$(\mathbb{Z}/q\mathbb{Z})^\times$ 上的乘法特征标；$\chi_0$ 平凡，$\bar\chi=\chi^{-1}$） | [[dirichlet-theorem-on-primes]]；**避免**与区间指示函数 $\chi_I$ 混淆（区间用 $\chi_I$，特征标用 $\chi$ 或 $\chi_{\bmod q}$） |
| $\mathcal{R}$、$R^*$ | Radon 变换与其对偶（$\mathcal{R}(f)(P)=\int_P f\,d\sigma$；$f=c_d(-\Delta)^{(d-1)/2}R^*R(f)$） | [[radon-transform]]（Stein Ch. 6 §5） |
| $\operatorname{Res}(f,z)$（Laurent 展开的 $a_{-1}$ 系数） | 留数 | [[residue-theorem]]、[[residue-by-taylor-coeff]]；常用 $\operatorname{Res}_{z=a}f$ 或 $\operatorname{Res}(f,a)$ |
| $\mathcal{S}(\mathbb{R}^d)$（**禁止** $\mathcal{S}_d$、$S$、$s$） | Schwartz 空间 | [[schwartz-space]]、所有 $\mathcal{S}$ 框架定理页；**禁止写法**见下表 |
| $O(\cdot)$、$\ll$、$o(\cdot)$ | 大 O、小 O、Landau 记号（标准渐近记号） | [[riemann-localization]]、[[paley-wiener-theorem]] 等估计章节；使用 Stein 风格「$\ll$」替代「$O$」（如 $f(x)\ll g(x)$ 等价 $f=O(g)$） |
| $\chi_I$（$\chi_{[a,b]}$ 等） | 区间指示函数 | 见 A 节；**注意**:与 Dirichlet 特征标 $\chi$ 区分（后者写作 $\chi$ 或 $\chi_{\bmod q}$） |

## 禁止写法（lint 自动检测）

| 约定 | Stein 记号 | 禁止写法 |
|------|-----------|---------|
| Fourier 变换核 | $e^{-2\pi i\xi\cdot x}$ | $e^{-i\xi x}$、$e^{i\xi x}$（无 $2\pi$） |
| Fourier 系数 | $\hat{f}(\xi) = \int f(x)e^{-2\pi i\xi x}\,dx$ | $\frac{1}{2\pi}\int$、$\frac{1}{\sqrt{2\pi}}\int$ |
| Fourier 逆变换核 | $e^{+2\pi i\xi\cdot x}$ | $e^{+i\xi x}$、$e^{-i\xi x}$ |
| Poisson 求和公式 | $\sum f(n) = \sum \hat{f}(n)$（无 $2\pi$ 因子） | 含 $2\pi$ 因子的版本 |
| 卷积 | $(f*g)(x) = \int f(x-y)g(y)\,dy$ | $(f*g)(x) = \int f(y)g(x-y)\,dy$（无归一化） |
| $L^p$ 范数 | $\|f\|_{L^p}$ 或 $\|f\|_p$ | $\|f\|_p^p$（应写为 $\|f\|_p^p = \int\|f\|^p$） |
| Schwartz 空间 | $\mathcal{S}(\mathbb{R}^d)$ | $S(\mathbb{R}^d)$、$\mathcal{S}_d$ |
| Gauss 核 | $K_\delta(x)=\delta^{-1/2}e^{-\pi x^2/\delta}$（Stein 约定） | $\frac{1}{\sqrt{2\pi}\delta}e^{-x^2/2\delta^2}$（高斯约定）|
| Fourier 算子 | $\mathcal{F}$（$\mathcal{F}f=\hat f$） | $\hat f$（仅作符号，**禁止**以 $\hat F$、$\mathfrak F$ 替代算子语境）|
| $\mathscr{F}_a$ 类 | $\mathscr{F}_a$（手写花体 mathrsfs） | **禁止**用 $\mathcal{F}_a$（与 Fourier 算子 $\mathcal{F}$ 混淆）|
| 区间指示函数 vs 特征标 | $\chi_I$（区间）/$\chi$（Dirichlet 特征标） | 混用（语境须明确标注）|

## 收录原则(默认登记,冲突才检查)

- **默认收录**:摄取或写作中遇到本表未覆盖的新记号,若与本表及补充约定**无冲突**,直接登记入「补充约定」或新增表行,无须逐条审批。
- **冲突检查**:仅当出现冲突时才启动检查——(a) 同一对象存在两种写法;(b) 同一符号在不同页面表示不同对象。冲突登记到 `wiki/open-questions.md`,给出候选方案,由用户裁决后再统一全库。
- 登记新记号时须注明适用语境(如「仅复分析页」「仅数论页」),避免与既有记号发生隐式冲突。

## 一致性检验

- **lint 自动检测**：grep 全文，禁止出现「禁止写法」列中的字符串。
- **人工抽查**：LLM 在摄取新源时，检查被摄取源的记号是否与本表一致；不一致则显式标注「〔已换算为 Stein 约定〕」。
- **违反记录**：lint 检测到的违反项登记到 `wiki/open-questions.md`。