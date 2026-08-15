# 复分析索引

> 复分析主题页面目录（主要源自 Stein《Complex Analysis》）。由 [index.md](index.md) 分类索引进入。
> 跨域页（Fourier 变换与整函数接口，如 [[paley-wiener-theorem]]）依其 sources 归入本索引。

---

## 概念（Concepts）

- [[holomorphic-function]]：全纯函数——复平面上满足 Cauchy-Riemann 方程的可微函数（Ch.1 §2）。状态：`unverified`。
- [[power-series]]：幂级数——全纯函数的局部坐标表示（Ch.1 Thm 2.5/2.6）。状态：`unverified`。
- [[entire-function]]：整函数——在 $\mathbb{C}$ 上全纯的函数，受 Liouville 定理强约束。状态：`unverified`。
- [[meromorphic-function]]：亚纯函数——允许孤立极点的全纯函数推广。状态：`unverified`。
- [[isolated-singularity]]：孤立奇点——三类（可去/极点/本性）的精确判定。状态：`unverified`。
- [[poles-classification]]：极点分类——Ch.3 §1 三类孤立奇点分类与主部展开。状态：`unverified`。
- [[simply-connected-domain]]：单连通域——任何闭曲线可缩为点的开集。状态：`unverified`。
- [[order-of-growth]]：增长阶——整函数的复杂度指标，控制零点密度。状态：`unverified`。

## 定理（Theorems）

- [[cauchy-theorem]]：Cauchy 定理——全纯函数围道积分为零（Ch.2 Thm 1.1/2.2）。状态：`unverified`。
- [[cauchy-integral-formula]]：Cauchy 积分公式——边界值恢复内部值（Ch.2 Thm 4.1）。状态：`unverified`。
- [[liouville-theorem]]：Liouville 定理——有界整函数为常数（Ch.2 Cor 4.5）。状态：`unverified`。
- [[morera-theorem]]：Morera 定理——Cauchy 定理的逆命题（Ch.2 Thm 5.1）。状态：`unverified`。
- [[schwarz-reflection-principle]]：Schwarz 反射原理——实轴反射的全纯延拓（Ch.2 Thm 5.6）。状态：`unverified`。
- [[runge-theorem]]：Runge 逼近定理——全纯函数被有理/多项式逼近（Ch.2 Thm 5.7）。状态：`unverified`。
- [[residue-theorem]]：留数定理——围道积分等于留数加权和（Ch.3 Thm 2.1）。状态：`unverified`。
- [[argument-principle]]：辐角原理——零点-极点计数（Ch.3 Thm 4.1）。状态：`unverified`。
- [[rouche-theorem]]：Rouché 定理——小扰动保零点个数（Ch.3 Thm 4.3）。状态：`unverified`。
- [[open-mapping-theorem]]：开映射定理——非常数全纯函数保持开性（Ch.3 Thm 4.4）。状态：`unverified`。
- [[maximum-modulus-principle]]：最大模原理——非常数全纯函数不能在内部取最大值（Ch.3 Thm 4.5）。状态：`unverified`。
- [[jensen-formula]]：Jensen 公式——零点分布与对数平均值（Ch.5 Thm 1.1）。状态：`unverified`。
- [[weierstrass-product-theorem]]：Weierstrass 乘积定理——任意零点集可被整函数实现（Ch.5 Thm 4.1）。状态：`unverified`。
- [[phragmen-lindelof-theorem]]：Phragmén-Lindelöf 定理（扇形版本）——扇形区域上全纯函数的增长控制。状态：`unverified`。
- [[paley-wiener-theorem]]：Paley-Wiener 定理——Fourier 变换紧支集与整函数指数型的等价（Complex 卷 Ch.4 §3；跨域页）。状态：`unverified`。
- [[fourier-coeffs-holomorphic-disc]]：全纯函数的 Fourier 系数（圆盘情形，Theorem 7.1）——$n \ge 0$ 等于 Taylor 系数 $a_n r^{-n}$，$n < 0$ 必为零（Ch.3 p.120–122）。状态：`verified`。
- [[holomorphic-impl-harmonic]]：全纯函数的实部与虚部调和（Corollary 7.3）——Cauchy-Riemann ⇒ 调和 + 平均值性质（Ch.3 p.122）。状态：`verified`。

## 引理（Lemmas）

- [[modulus-of-complex-exponential]]：复指数的模——$|e^z| = e^{\operatorname{Re}(z)}$。状态：`verified`。
- [[multiplicativity-of-modulus]]：复数模的乘性——$|z_1 z_2| = |z_1| \cdot |z_2|$。状态：`verified`。
- [[integer-periodicity-of-exponential]]：复指数的整数周期性——$e^{2\pi i n} = 1$。状态：`verified`。
- [[triangle-inequality-complex]]：复数三角不等式——$|z + w| \leq |z| + |w|$（Ch.1 p.22）。状态：`verified`。
- [[cauchy-inequalities]]：Cauchy 不等式——导数上界 $|f^{(n)}(z_0)| \le n!M/r^n$。状态：`verified`。
- [[mean-value-property-holomorphic]]：全纯函数均值性质——$f(z_0) = \frac{1}{2\pi}\int_0^{2\pi} f(z_0 + re^{i\theta}) d\theta$。状态：`verified`。
- [[removable-singularity-criterion]]：可去奇点判据——有界 ⇒ 可去（Riemann 可去奇点定理）。状态：`verified`。
- [[hadamard-formula]]：Hadamard 公式——幂级数收敛半径 $\rho = 1/\limsup |a_n|^{1/n}$。状态：`verified`。
- [[residue-by-taylor-coeff]]：留数 = Laurent 展开的 $a_{-1}$ 系数（含高阶极点与商形式公式，Ch.3 p.94）。状态：`unverified`。

---

### 统计

| 类目 | 数量 |
|------|------|
| concepts | 8 |
| theorems | 17 |
| lemmas | 9 |
| **合计** | **34** |
