# 傅里叶分析索引

> 傅里叶分析主题页面目录（主要源自 Stein《Fourier Analysis: An Introduction》）。由 [index.md](index.md) 分类索引进入。
> 解析数论页（[[dirichlet-theorem-on-primes]] 等）单列于 [[index-number-theory]]；跨域页（如 [[paley-wiener-theorem]]）归入 [[index-complex]]；微分方程页（[[wave-equation]]）单列于 [[index-pde]]。
> 方法（method）与笔记（note）不参与领域划分，保留在 [index.md](index.md)（如 [[euler-fourier-formulas]] 已在 index.md 方法区段）。

---

## 概念（Concepts）

- [[fourier-series]]：Fourier 级数——周期函数的频率分解（Stein 约定 $e^{2\pi i n x}$）。状态：`unverified`。
- [[fourier-transform]]：Fourier 变换——$\mathbb{R}^d$ 上函数的平面波分解（Stein 约定 $e^{-2\pi i\xi\cdot x}$）。状态：`unverified`。
- [[schwartz-space]]：Schwartz 空间——快速衰减光滑函数，Fourier 变换的封闭函数类。状态：`unverified`。
- [[lp-space]]：$L^p$ 空间——Fourier 分析的 Lebesgue 函数类基础（注意与 [[ellp-space]] 的区分）。状态：`unverified`。
- [[ellp-space]]：$\ell^p$ 空间——Fourier 系数的归宿，Riesz–Fischer 定理的标准框架。状态：`unverified`。
- [[good-kernel]]：好核——approximation to the identity，Fourier 级数收敛性研究的核心工具。状态：`unverified`。
- [[character]]：特征标——有限阿贝尔群到 $S^1$ 的群同态（Ch.7）。状态：`pending-verification`。
- [[finite-abelian-group]]：有限阿贝尔群——$\mathbb{Z}(N)$ 与更一般有限群的 Fourier 分析框架。状态：`unverified`。
- [[f_a-class]]：$\mathscr{F}_a$ 类——条带全纯 + 中速递降函数族（Ch.4 §2 的工作空间）。状态：`unverified`。
- [[fourier-coefficient]]：Fourier 系数——函数到频率分量的投影（圆群/$\mathbb{R}$ 两版）。状态：`unverified`。
- [[fourier-coefficient-holomorphic]]：全纯函数的 Fourier 系数（圆周情形，Ch.3 Thm 7.1）。状态：`unverified`。
- [[hermite-operator]]：Hermite 算子——$L = -d^2/dx^2 + x^2$（Ch.5 Ex.23）。状态：`unverified`。
- [[radial-function]]：径向函数——旋转不变的 $f(x) = f(|x|)$。状态：`unverified`。
- [[bessel-function]]：Bessel 函数——径向 Fourier 变换的显式核（$d=2$ 即 $J_0$）。状态：`unverified`。
- [[regular-measure]]：正则测度——局部紧空间上的测度正则性条件（Radon 测度基础）。状态：`unverified`。
- [[haar-measure]]：Haar 测度——局部紧群上的平移不变测度。状态：`unverified`。

## 定理（Theorems）

- [[poisson-summation-formula]]：Poisson 求和公式——$\sum f(n) = \sum \hat{f}(n)$。状态：`pending-verification`。
- [[parseval-identity]]：Parseval 恒等式——圆群上 $\|f\|_2^2 = \sum |\hat{f}(n)|^2$（Ch.3 Thm 1.3）。状态：`verified`。
- [[mean-square-convergence]]：均方收敛定理——Fourier 部分和在 $L^2$ 范数下收敛到 $f$（Ch.3 Thm 1.1）。状态：`verified`。
- [[plancherel-theorem]]：Plancherel 定理——$\|f\|_{L^2} = \|\hat{f}\|_{L^2}$（Ch.5 Thm 1.12）。状态：`unverified`。
- [[fourier-inversion]]：Fourier 反演——$f(x) = \int \hat{f}(\xi) e^{2\pi i x\xi} d\xi$（Ch.5 Thm 1.9）。状态：`unverified`。
- [[riemann-lebesgue-lemma]]：Riemann-Lebesgue 引理——$L^1$ 函数的 Fourier 系数趋于零。状态：`unverified`。
- [[fejer-theorem]]：Fejér 定理——Fourier 部分和的 Cesàro 平均一致收敛（Ch.4 Thm 5.2）。状态：`unverified`。
- [[weierstrass-approximation-trig]]：Weierstrass 三角多项式逼近（Ch.4 Cor 5.4）。状态：`unverified`。
- [[riemann-localization]]：Riemann 局部化原理——Fourier 级数收敛的局部性。状态：`pending-verification`。
- [[weyl-equidistribution]]：Weyl 等分布定理——$\gamma \notin \mathbb{Q}$ ⇒ 均匀分布（Ch.4 Thm 2.1）。状态：`unverified`。
- [[isoperimetric-inequality]]：等周不等式（Hurwitz 形式）——$A \leq \ell^2/(4\pi)$（Ch.4 Thm 1.1）。状态：`unverified`。
- [[bernstein-theorem]]：Bernstein 定理——Hölder 阶 $\alpha > 1/2$ 的 Fourier 级数绝对收敛。状态：`verified`。
- [[gibbs-phenomenon]]：Gibbs 现象——锯齿函数部分和在跳跃处过冲约 9%（Ch.3 Ex.20）。状态：`verified`。
- [[legendre-polynomials]]：Legendre 多项式——$[-1,1]$ 上的完备正交系（Ch.3 Ex.2）。状态：`verified`。
- [[hermite-functions]]：Hermite 函数——Fourier 变换与 Hermite 算子的完备特征函数系（Ch.5 Ex.7）。状态：`verified`。
- [[sampling-theorem]]：采样定理（Shannon-Nyquist）——带限信号由整数点采样精确重建（Ch.5 Ex.20）。状态：`unverified`。
- [[radon-transform]]：Radon 变换——沿超平面的积分变换与显式重建公式（Ch.6 §5）。状态：`unverified`。
- [[heisenberg-uncertainty-principle]]：Heisenberg 不确定性原理——$\sigma_x \sigma_\xi \geq 1/(4\pi)$（Ch.5 Thm 4.1）。状态：`unverified`。
- [[wirtinger-inequality]]：Wirtinger 不等式——$\int_0^T |f|^2 \le (T/2\pi)^2 \int_0^T |f'|^2$。状态：`unverified`。
- [[finite-abelian-decomposition]]：有限阿贝尔群结构定理——循环群直积分解与特征标自对偶（Ch.7 Pb.1–3）。状态：`verified`。

## 引理（Lemmas）

- [[dirichlet-kernel-l1-norm]]：Dirichlet 核的积分范数——$L_N \ge c\log N$，部分和范数无界的定量来源（Ch.3 Ex.2）。状态：`verified`。
- [[integrable-l1-approximation-by-continuous]]：有界可积函数由一致有界连续函数在 $L^1$ 中逼近——Parseval 与均方收敛证明的桥梁（Ch.2 Lemma 3.2）。状态：`verified`。
- [[fourier-coefficient-decay]]：Fourier 系数的衰减——$C^k$/Lipschitz/单调/Hölder ⟹ 衰减速率（Ch.3 Ex.17–18）。状态：`verified`。
- [[multiplication-formula-trick]]：乘法公式——$\int f\bar g = \int\hat f\,\overline{\hat g}$（Ch.5 Prop 1.8）。状态：`unverified`。
- [[orthogonal-best-approximation]]：正交最佳逼近——闭子空间上最佳逼近元为正交投影（Ch.3 Lemma 1.2）。状态：`unverified`。
- [[bessel-inequality]]：Bessel 不等式（一般正交族版）——$\sum |a_n|^2 \le \|f\|^2$，纯线性代数证明（Pythagoras 定理），取等当且仅当正交族完全。状态：`verified`。
- [[shift-of-line]]：Fourier 反演的水平线移位（围道平移）——$\mathscr{F}_a$ 类下 $\hat f$ 的水平线表示（Ch.4 eq.(1)）。状态：`unverified`。
- [[geometric-series-bounding]]：几何级数估计——上界与 $N$ 无关（Weyl 等分布判据关键）。状态：`unverified`。
- [[bump-function]]：bump 函数构造——$C^\infty$ 紧支集函数的显式构造（Ch.5 Ex.4）。状态：`verified`。

## 习题（Exercises）

- [[ch1-ex3-double-fourier-transform]]：双重 Fourier 变换的反演（Ch.1 Ex.3）。状态：`verified`。
- [[ch2-ex15-weierstrass]]：Weierstrass 三角多项式逼近（Ch.2 §5 Ex.15）。状态：`verified`。
- [[ch3-ex18-slow-decay]]：Fourier 系数任意慢衰减（Ch.3 Ex.18）。状态：`verified`。
- [[ch4-ex12-feynman]]：Feynman 微分法则（Ch.4 §5 Ex.12）。状态：`verified`。
- [[ch5-ex20-sampling]]：采样定理（Ch.5 Ex.20）。状态：`verified`。
- [[ch5-ex23-heisenberg]]：Heisenberg 不确定性原理的 Hermite 算子法（Ch.5 Ex.23）。状态：`verified`。
- [[ch6-ex6-heisenberg-rd]]：Heisenberg 不确定性原理在 $\mathbb{R}^d$（Ch.6 Ex.6）。状态：`verified`。
- [[ch7-ex5-circle-character]]：圆群特征标完整刻画（Ch.7 Ex.5）。状态：`verified`。
- [[ch7-ex8-finite-reconstruction]]：有限采样重建（三角多项式插值，Ch.7 Ex.8）。状态：`verified`。

## 问题（Problems）

- [[ch5-pb11-wirtinger]]：Wirtinger / Poincaré 不等式（Ch.5 Pb.11）。状态：`verified`。
- [[ch5-pb9-hermite-eigenfunc]]：Hermite 函数 Fourier 变换（Ch.5 Pb.9）。状态：`verified`。
- [[ch5-problem-1-psf-without-schwartz]]：非 Schwartz 条件下的 Poisson 求和公式（Ch.5 Pb.1）。状态：`verified`。
- [[ch7-pb2-finite-abelian]]：有限阿贝尔群结构定理（Ch.7 Pb.2）。状态：`verified`。

---

### 统计

| 类目 | 数量 |
|------|------|
| concepts | 16 |
| theorems | 20 |
| lemmas | 9 |
| exercises | 9 |
| problems | 4 |
| **合计** | **58** |
