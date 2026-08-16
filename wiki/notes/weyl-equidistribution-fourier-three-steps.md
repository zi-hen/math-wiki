---
type: note
title: Weyl 等分布判据的 Fourier 生成法：从三步核心到 $L^1$ 边界
aliases: [Weyl 判据的 Fourier 视角, equidistribution Fourier perspective]
created: 2026-08-16
updated: 2026-08-16
sources: [steinFourierAnalysisIntroduction2003a]
status: draft
tags: [number-theory, fourier-analysis, equidistribution, methodology]
authors: [AI]
---

# Weyl 等分布判据的 Fourier 生成法：从三步核心到 $L^1$ 边界

> **笔记性质**：本笔记把 [[weyl-equidistribution|Weyl 等分布定理]] 证明中的 **Weyl 判据**（Claim 1）重铸为一个 Fourier 视角下的**生成路径**——先由**三步核心**（基函数正交 → 线性子空间稠密 → Darboux 上下和夹逼）从三角多项式推到 Riemann 可积函数，再沿两个方向推广到边界：分段连续函数（§2，朴素 ε-room 思路可挽救）与 $L^1$ 可积函数（§3，朴素 ε-room 失效，须切换到抽象 ε-room）。事实性主张以 `wiki/` 与 `raw/` 中的实体页/源页为依据；本笔记专注**组织性论述**与**方法论反思**。
> **状态**：draft（2026-08-16）· 作者：AI

---

## 引子

[[weyl-equidistribution|Weyl 等分布定理]]（Stein Ch. 4, Theorem 2.1）的 Fourier 证明分两大阶段：

1. **Weyl 判据**（Claim 1）：$\{\xi_n\}$ 在 $[0, 1)$ 均匀分布 **当且仅当** 对所有 $k \neq 0$，$\frac{1}{N}\sum e^{2\pi i k \xi_n} \to 0$（$N \to \infty$）；
2. **指数和估计**（Claim 2）：对 $\xi_n = \langle n\gamma\rangle$（$\gamma \notin \mathbb{Q}$），由 [[geometric-series-bounding|几何级数估计]] 得 $\frac{1}{N}\sum e^{2\pi i k n \gamma} = O(1/N) \to 0$。

合并两 Claim 即得定理。**Claim 2 是纯代数**（几何级数求和），难处全在 **Claim 1**：把"Fourier 系数消失"等价于"区间计数比例收敛"。本笔记要问的是——Claim 1 的四步递推（三角多项式 → 连续函数 → 阶梯函数 → Riemann 可积）能否**由 Fourier 视角一句话生成**？

答案是肯定的——但生成路径**不止三步**：

- **§1 三步核心**（基函数正交 → 线性子空间稠密 → Darboux 上下和夹逼）把 Step 1–3 合并：从 $\mathcal{T}_K$ 推到 $R(\mathbb{T})$，恰好把 Stein 原文四步压缩为三步；
- **§2 推广一**（分段连续函数，朴素 ε-room）把 $R(\mathbb{T})$ 推到 $PC(\mathbb{T})$，**不改变论证范式**，只把 $\varepsilon$ 预算在每个跳跃邻域单独分配；
- **§3 推广二**（$L^1$ 可积函数，抽象 ε-room）突破 Riemann 边界，**切换论证范式**——从"分划 + 上下确界"切换到"褶积 + 控制函数"。

这三层一同构成 Weyl 判据 (⇐) 方向的**完整生成路径**。

---

## §1 三步核心：从三角多项式到 Riemann 可积函数

### Step 1 — 基函数：三角多项式是「已知」的对象

**目标**：在最简函数类 $\mathcal{T}_K = \left\{\sum_{|n| \le K} c_n e^{2\pi i n x}\right\}$ 上验证 Weyl 判据 $(*)$。

**为什么先做这一步**：

- $\mathcal{T}_K$ 是 $\mathbb{T}$ 上的**有限维代数**；
- 其元素是 Fourier 模式 $e_n(x) = e^{2\pi i n x}$ 的**线性组合**——$e_n$ 恰是 Weyl 判据中检验的对象；
- 对每个 $e_n$（$n \neq 0$）判据 $(*)$ **显然成立**：由 [[geometric-series-bounding|几何级数估计]]，$\left|\frac{1}{N}\sum_{m=1}^N e^{2\pi i n \xi_m}\right| = O(1/N) \to 0$；对 $e_0 \equiv 1$，平均是 1。

**由有限线性组合的可交换性**：
$$
\frac{1}{N}\sum_{m=1}^N P(\xi_m) \xrightarrow{N\to\infty} \sum_{|n|\le K} c_n \cdot \delta_{n,0} = c_0 = \int_0^1 P(x)\,dx,
$$
其中 $\delta_{n,0}$ 来自"$\frac{1}{N}\sum e^{2\pi i n \xi_m} \to \int_0^1 e^{2\pi i n x}\,dx = [n=0]$"。

**这一步的实质**：Weyl 判据 $(*)$ 对三角多项式等价于**最基本的 Fourier 正交性**
$$
\int_0^1 e^{2\pi i n x}\,dx = [n=0],
$$
后者由 [[integer-periodicity-of-exponential|复指数整数周期性]]（$e^{2\pi i n} = 1$）与积分周期化得到。整个 Claim 1 后续推广只是把这一正交性**外推**到越来越大的函数类。

> **对应**：[[weyl-equidistribution|Weyl 等分布定理]] 页 Claim 1 证明中"三角多项式"段。

### Step 2 — 线性性：从基函数到代数生成的逼近类

**目标**：把 Step 1 的结论**沿线性子空间扩张**到 $C(\mathbb{T})$。

**核心机制**（两种角色）：

1. **代数角色**：$\mathcal{T}_K \subset C(\mathbb{T})$ 是子代数；任何由子代数**代数生成**（含有限线性组合与乘法闭包）的函数类继承 $\frac{1}{N}\sum \to \int$ 的性质；
2. **逼近角色**：由 [[weierstrass-approximation-trig|Weierstrass 三角多项式逼近定理]]（Stein Ch. 4 Corollary 5.4），$C(\mathbb{T})$ 是 $\mathcal{T} := \bigcup_K \mathcal{T}_K$ 的**一致闭包**——$\frac{1}{N}\sum f \to \int f$ 是 $f$ 关于 $\mathcal{T}$ 的"一致连续泛函"（在 $\mathcal{T}$ 上定义、可线性延拓到闭包）。

**逐项验证**：对 $f \in C(\mathbb{T})$ 与 $\varepsilon > 0$，取 $P \in \mathcal{T}_K$ 使 $\|f - P\|_\infty < \varepsilon$。由三角不等式
$$
\left|\frac{1}{N}\sum f(\xi_m) - \int f\right| \le \underbrace{\frac{1}{N}\sum |f-P|(\xi_m)}_{\le\,\varepsilon} + \underbrace{\left|\frac{1}{N}\sum P(\xi_m) - \int P\right|}_{\text{Step 1, 选 } N \text{ 大}} + \underbrace{\left|\int (P - f)\right|}_{\le\,\varepsilon}.
$$
合计 $< 3\varepsilon$；由 $\varepsilon$ 任意即得 $\frac{1}{N}\sum f(\xi_m) \to \int f$。

**Stein 原文中的"阶梯函数"段**：$\chi_{(a,b)}$ 是 Riemann 可积的（边界至多两个跳跃点），由连续函数上下夹逼即可——**仍属 Step 2 范畴**，故本笔记与原文的"四步"合并为"三步"。

> **对应**：原文"连续函数"与"阶梯函数"两段；母机为 [[fejer-theorem|Fejér 定理]]（Step 2 中 Weierstrass 定理的"母机"）。

### Step 3 — Darboux 上下和：从连续函数到任意 Riemann 可积函数

**目标**：把 Step 2 的结论从 $C(\mathbb{T})$ 推到 $R(\mathbb{T})$（Riemann 可积函数）。

**Darboux 上下和定义**（Stein Ch. 1, §3）：设 $P = \{0 = x_0 < x_1 < \cdots < x_k = 1\}$ 为 $\mathbb{T}$ 的分划，$f$ 在 $\mathbb{T}$ 上有界。令
$$
M_i = \sup_{x \in [x_{i-1}, x_i]} f(x), \quad m_i = \inf_{x \in [x_{i-1}, x_i]} f(x),
$$
$$
U(f, P) := \sum_{i=1}^{k} M_i (x_i - x_{i-1}), \quad L(f, P) := \sum_{i=1}^{k} m_i (x_i - x_{i-1}).
$$
显然 $L(f, P) \le U(f, P)$，且对任何更细的分划 $P' \supset P$，
$$
L(f, P) \le L(f, P') \le U(f, P') \le U(f, P) \quad\text{（细化单调性）}.
$$

**Riemann 可积的 Darboux 等价刻画**：$f \in R(\mathbb{T})$ **当且仅当**
$$
\overline{\int_0^1} f := \inf_P U(f, P) \;=\; \underline{\int_0^1} f := \sup_P L(f, P),
$$
共同值定义为 $\int_0^1 f$。等价地：$\forall\, \varepsilon > 0$，存在分划 $P$ 使 $U(f, P) - L(f, P) < \varepsilon$。

**夹逼论证**：对 $f \in R(\mathbb{T})$ 与 $\varepsilon > 0$，取分划 $P$ 使 $U(f, P) - L(f, P) < \varepsilon$。在每个子区间 $[x_{i-1}, x_i]$ 上定义阶梯函数
$$
f_+(x) := M_i, \quad f_-(x) := m_i, \quad x \in [x_{i-1}, x_i),
$$
使得 $f_- \le f \le f_+$ 处处成立，且
$$
\int (f_+ - f) \le U(f, P) - L(f, P) < \varepsilon, \quad \int (f - f_-) \le U(f, P) - L(f, P) < \varepsilon.
$$
由 Step 2（$f_\pm$ 是阶梯函数 $\subset C(\mathbb{T})$ 的稠密子类），$\frac{1}{N}\sum f_\pm(\xi_m) \to \int f_\pm$。由夹逼
$$
\int f_- \le \liminf_N \frac{1}{N}\sum f(\xi_m) \le \limsup_N \frac{1}{N}\sum f(\xi_m) \le \int f_+,
$$
而 $\int f_\pm$ 与 $\int f$ 的差 $\le \varepsilon$。由 $\varepsilon$ 任意，$\frac{1}{N}\sum f(\xi_m) \to \int f$。

特别取 $f = \chi_{(a, b)}$（Riemann 可积，因为 Darboux 上、下和在边界处仅贡献至多 $2\delta$，可任意小），得
$$
\frac{1}{N}\#\{\xi_m \in (a, b)\} \to b - a,
$$
即**等分布的原始定义**。

> **Step 3 的本质**：依赖**Darboux 上下和夹逼**——把 Step 2 的极限性质**沿分划细化单调性传递**。这是 Riemann 积分论**最构造性**的工具：分划 $P$ 显式给出，$U(f, P) - L(f, P) < \varepsilon$ 是可计算的收敛判据，**不需要测度扩张**，仅依赖 $\mathbb{T}$ 的紧性。这与 Stein 整体坚持 Riemann 框架的精神一致。

### 三步核心总结

| 步骤 | 函数类扩张 | 工具 | 极限论证类型 |
|------|-----------|------|------------|
| **Step 1**（基函数） | $\mathcal{T}_K \to \mathcal{T}_K$ | 直接计算 + 几何级数 | **代数**（$e_n$ 的正交性） |
| **Step 2**（线性性） | $\mathcal{T}_K \to C(\mathbb{T})$ | Weierstrass 三角逼近 | **一致逼近 + 三角不等式** |
| **Step 3**（Darboux 上下和） | $C(\mathbb{T}) \to R(\mathbb{T})$ | Darboux 上下和刻画 | **上下和夹逼** |

三步对应三种**生成原则**：

1. **基函数正交性**（代数）→ Step 1；
2. **线性子空间稠密性**（逼近论）→ Step 2；
3. **Darboux 上下和夹逼**（Riemann 构造性积分论）→ Step 3。

注意：**三步**而非"四步"——Stein 原文把 Step 2 拆成"连续函数"与"阶梯函数"两段，但连续函数与阶梯函数在逼近论上属同一类（都是 Weierstrass 定理的推论或 Riemann 可积的特例），从 Fourier 视角可合并。

### 反方向：(⇒) 的 Fourier 解释

Weyl 判据 (⇒) 方向（等分布 ⟹ 指数和趋于 0）更直接：对 $f(\xi) = e^{2\pi i k \xi}$（$k \neq 0$）应用 Step 1——$e^{2\pi i k \xi}$ 本身就是基函数，故
$$
\frac{1}{N}\sum_{m=1}^N e^{2\pi i k \xi_n} \to \int_0^1 e^{2\pi i k x}\,dx = 0.
$$

这暴露了 Weyl 判据 (⇐)/(⇒) **不对称**的本质：

- **(⇐)** 是"密度扩张"——需要 §1 的三步生成法（甚至 §2、§3 的推广）；
- **(⇒)** 是"特例应用"——直接用 Step 1 的结论于 $e^{2\pi i k \xi}$。

这种不对称在 Fourier 分析中普遍存在——**正交展开理论总是"展开方向"困难，"系数方向"平凡**。

---

## §2 推广一：分段连续函数与「给 ε 一间房」

§1 的 Step 3 把 Weyl 判据 (⇐) 方向推到 $R(\mathbb{T})$。**自然的下一步**：能不能再扩张到更大的函数类？本节处理**分段连续函数**（piecewise-continuous）——$R(\mathbb{T})$ 的一个重要子类，且 Riemann 框架下**朴素 ε-room 仍适用**。

### 精确陈述

> 设 $f$ 在 $\mathbb{T}$ 上**分段连续**：存在有限个跳跃点 $x_1 < \cdots < x_J$ 使 $f$ 在每个连通分支上连续（$\mathbb{T}$ 上循环）。则
> $$
> \frac{1}{N}\sum_{m=1}^N f(\xi_m) \to \int_0^1 f(x)\,dx, \qquad N \to \infty.
> $$

### 为什么朴素 Darboux 论证不够精细

§1 Step 3 的 Darboux 论证**形式上能通过**（分段连续 $\Rightarrow$ $f$ 有界 $\Rightarrow f \in R(\mathbb{T})$），但效果粗糙：

- 它把**全部 $\varepsilon$ 一次性**给到 $U(f, P) - L(f, P)$；
- 每个跳跃点附近以整个区间长度贡献 $O(\delta)$；
- 最终 $\delta \to 0$ 时所有跳跃的总体代价是 $O(J \cdot \delta)$，**仍是 $\varepsilon$**——但**未利用**"**只有有限个跳跃**"这一额外结构。

### 「给 ε 一间房」——两阶段策略

**核心思想**（参 [[integral-splitting-how-to-choose]] §5 与 [[fourier-analysis-zh-notes]] §6.1）：把每个跳跃邻域**单独**分配一份 $\varepsilon$ 预算。

**第一阶段：分划与"跳越"邻域**

对 $f \in PC(\mathbb{T})$ 与目标 $\varepsilon > 0$，**预先把 $\varepsilon$ 拆为两份**：
- $\varepsilon_1 = \varepsilon/2$ 留给 **连续段内的逼近误差**（连续段上 $f$ 是真正的连续函数，由 Step 3 在每个连续段内 Darboux 上下一致逼近）；
- $\varepsilon_2 = \varepsilon/2$ 留给 **跳跃邻域的总贡献**——$J$ 个跳跃点每个分配 $\varepsilon/(2J)$ 预算。

构造分划 $P$ 使：
1. 每个跳跃点 $x_j$ 被**孤立**在宽度 $\delta_j$ 的小邻域 $(x_j - \delta_j, x_j + \delta_j)$ 内，$\delta_j$ 由 $\omega_f(x_j; \delta_j) \cdot 2\delta_j < \varepsilon/(2J)$ 确定（**给每个跳跃一间"房"**，每间房有固定 $\varepsilon$ 预算）；
2. 在跳跃邻域**之外**的部分（连续段），由 $f$ 的连续性取充分细分划使 Darboux 上下一致逼近误差 $< \varepsilon/2$。

**第二阶段：夹逼与极限回收**

按此分划 $P$ 构造阶梯函数 $f_\pm$（同 §1 Step 3）。注意：

- **连续段内**：$\frac{1}{N}\sum f_\pm \to \int_{\text{连续段}} f_\pm$（Step 3 的局部版本）；
- **跳跃邻域内**：$\frac{1}{N}\sum f_\pm$ 在该邻域贡献 $\le \omega_f \cdot \delta_j < \varepsilon/(2J)$（**房**的预算），其积分的差 $< \varepsilon/2$。

合计 $\frac{1}{N}\sum f \to \int f$，**且误差分布明确**：连续段贡献 $O(\varepsilon_1)$、跳跃邻域贡献 $O(\varepsilon_2)$。

### 与朴素 Darboux 的对比

| 思路 | $\varepsilon$ 分配 | 跳跃邻域的贡献 |
|------|-------------------|----------------|
| **朴素 Darboux**（§1 Step 3） | 一次性给 $U(f,P) - L(f,P) < \varepsilon$ | 被并入总 $\varepsilon$——未单独追踪 |
| **给 ε 一间房**（§2） | 预拆 $\varepsilon = \varepsilon_1 + \varepsilon_2$；每个跳跃点单独分配 $\varepsilon/(2J)$ | 显式 $O(\omega_f(x_j;\delta_j) \cdot \delta_j)$，可独立优化 |

**「给 ε 一间房」的优势**：

1. **可加性**：若 $f = \sum_{k=1}^K f_k$（$K$ 个分段连续函数的线性组合），总 $\varepsilon$ 预算可分摊为 $K$ 份 $\varepsilon/K$，每份独立处理——与 [[integral-truncation|积分截断]] 的"主项 + 余项"框架同源；
2. **可优化性**：若某跳跃点的振幅 $\omega_f(x_j)$ 较大，单独给该邻域增大 $\delta_j$（即"房间更大"）即可，避免**为单个大跳跃而全局加密分划**的浪费；
3. **与 [[ch1-ex3-double-fourier-transform|Ch.1 Ex.3]] 的对应**：双重 Fourier 反演中"先引入 $e^{-\pi\epsilon x^2}$ 提供房间"与此处"先给每个跳跃分配 $\varepsilon$ 预算"是同一范式的两个实例——扰动对象（$f_\epsilon$ 或 $f_\pm$）的"弱性质"在扰动消失时恢复原性质。

### 与 Dirichlet-Jordan 定理的关系

分段连续函数的 Fourier 部分和**逐点收敛**到 $\frac{1}{2}(f(x_0+) + f(x_0-))$（**Dirichlet-Jordan 定理**：分段连续 ⇒ Fourier 部分和在连续点收敛到 $f$，在跳跃点收敛到左右极限的平均值）。本节 ε-room 思路**与 Dirichlet-Jordan 在精神上同源**：

- **Dirichlet-Jordan**：把 $f$ 分解为"主体（连续段上对称求和）"+ "跳跃部分（Gibbs 现象的极限行为）"，分段控制；
- **本节 §2**：把 $\varepsilon$ 分解为"连续段内逼近"+"跳跃邻域贡献"，分房控制。

两者都是"Fourier 论证 + 分段控制"的标准范式——前者控制**收敛值的跳跃行为**，后者控制**收敛速度的 ε 分布**。

---

## §3 推广二：$L^1$ 可积函数与朴素 ε-room 的失效

§2 解决了"分段连续"的推广，但 Weyl 判据 (⇐) 方向的**真正边界**在 $R(\mathbb{T})$ 之外——$L^1$ 函数类。本节分析朴素 ε-room 思路为何在此失效，并给出抽象化的挽救策略。

### 朴素 ε-room 思路的失效模式

设 $f \in L^1(\mathbb{T})$（无连续性、无 Riemann 可积性、可能无处连续）。我们沿用 §2 的两阶段策略：

1. **预拆 $\varepsilon = \varepsilon_1 + \varepsilon_2$**——**仍成立**（仅是数值预算的拆分）；
2. **构造分划 $P$ 隔离跳跃邻域**——**失效**：$f$ 没有离散的"跳跃点"概念，**没有有限集 $J = \{x_1, \ldots, x_J\}$** 可以被孤立——$L^1$ 函数的不连续性可能**无处不在**（如 $\chi_{\mathbb{Q}}$，或 Weierstrass 处处连续处处不可微函数）；
3. **Darboux 上和 / 下和构造**——**彻底失效**：$M_i = \sup_{[x_{i-1}, x_i]} f(x)$ 与 $m_i = \inf_{[x_{i-1}, x_i]} f(x)$ 对 $L^1$ 函数可能**无意义**（a.e. 定义的函数其上下确界可能未定义 / 无穷）。

**失败的核心**：朴素 ε-room **依赖"可数化"**——把 $\mathbb{T}$ 划分为有限个区间、每个区间分配一份 $\varepsilon$ 预算。这一可数化假设**本质上是 Riemann 框架的产物**（Riemann 积分只对有界函数、有限间断点函数有定义）。一旦离开 Riemann 框架进入 $L^1$，朴素 ε-room 就失去立足点。

### 三个层次的"边界"区分

| 层次 | 函数类 | 朴素 ε-room | 论证范式 |
|------|--------|-------------|----------|
| **§1**（三角多项式） | $\mathcal{T}_K$ | ✅ 适用 | 几何级数（Step 1） |
| **§1**（连续函数） | $C(\mathbb{T})$ | ✅ 适用 | Weierstrass 三角逼近（Step 2） |
| **§1**（Riemann 可积） | $R(\mathbb{T})$ | ✅ 适用 | Darboux 上下和（Step 3） |
| **§2**（分段连续） | $PC(\mathbb{T})$ | ✅ 适用（分房） | ε-room 在每个跳跃邻域独立分配 |
| **§3**（一般 $L^1$） | $L^1(\mathbb{T})$ | ❌ **失效** | 须切换到抽象 ε-room |

注意 §2 与 §3 的**关键区分**：§2 仍属 Riemann 框架（分段连续 $\Rightarrow f$ 有界 $\Rightarrow f \in R(\mathbb{T})$），朴素 ε-room 适用；§3 突破 Riemann 框架，朴素 ε-room **彻底失效**。

### 必须引入的新工具——"$\varepsilon$-room 的抽象化"

为处理 $L^1$ 函数，必须**从 Riemann 的"分划 + 上下确界"范式切换到 Lebesgue 的"可测集 + 控制函数"范式**：

1. **稠密性**：$C(\mathbb{T})$ 在 $L^1(\mathbb{T})$ 中稠密（[[integrable-l1-approximation-by-continuous|Lemma 3.2]]，Stein Ch. 2）——把一般 $L^1$ 函数**通过褶积逼近**化归为有界连续函数 $f_N = f * F_N$（$F_N$ 为 Fejér 核）；
2. **控制**：对 $f_N \to f$（$L^1$）取 $|f_N| \le \|f\|_1 \cdot \|F_N\|_\infty \le \|f\|_1$——**得到一致有界的连续函数逼近列**；
3. **极限交换**：把 [[dominated-convergence|控制收敛定理]]（Stein Complex Analysis 卷的工具）施加于 $f_N \to f$（a.e. 子列），恢复 $\int f_N \to \int f$；
4. **可加性回归**：把控制函数 $g = \|f\|_1$（常数）作为"**总 $\varepsilon$ 预算的容器**"——Fejér 核充当"阻尼函数"，$N \to \infty$ 是"扰动消失"。

### Step 5 的两阶段抽象策略

**第一阶段：构造抽象"扰动对象"**

对 $f \in L^1(\mathbb{T})$ 与 $N \in \mathbb{N}$，定义
$$
f_N(\theta) := (f * F_N)(\theta) = \int_{-\pi}^{\pi} f(\theta - t) F_N(t)\,dt,
$$
其中 $F_N$ 为 [[good-kernel|好核]]（Fejér 核）。由 Lemma 3.2：

- $f_N \in C(\mathbb{T})$（**正则化**）；
- $\|f_N\|_\infty \le \|f\|_1$（**一致有界**——给"f_N 序列"分配**一份 $\varepsilon$ 预算**）；
- $\|f - f_N\|_{L^1} \to 0$（**抽象房间**：`$L^1$ 距离`充当 $\varepsilon$）。

**第二阶段：先固定 $N$，再令 $N \to \infty$ 回收**

对**每个固定 $N$**，$f_N \in C(\mathbb{T}) \subset R(\mathbb{T})$——可直接套用 §1 Step 3 的 Darboux 论证，得
$$
\frac{1}{M}\sum_{m=1}^M f_N(\xi_m) \xrightarrow{M\to\infty} \int_0^1 f_N(\theta)\,d\theta.
$$

现在**令 $N \to \infty$**——此时 $\int f_N \to \int f$（由 $\|f - f_N\|_{L^1} \to 0$），**但** $\frac{1}{M}\sum f_N(\xi_m) \to \int f_N$ 是关于 $M$ 的极限，**两层极限次序不能随意交换**——必须采用**三角不等式**策略：
$$
\left|\frac{1}{M}\sum f(\xi_m) - \int f\right| \le \underbrace{\frac{1}{M}\sum |f - f_N|(\xi_m)}_{\text{扰动项}} + \underbrace{\left|\frac{1}{M}\sum f_N(\xi_m) - \int f_N\right|}_{\text{固定 $N$ 下的 Weyl 论证}} + \underbrace{\left|\int f_N - \int f\right|}_{\text{$L^1$ 恢复项}}.
$$

- **扰动项**：$\le \|f - f_N\|_{L^1}$（**用 $L^1$ 距离**作为"房间"）；
- **固定 $N$ 下的 Weyl 论证**：取 $M \ge M(N, \varepsilon)$ 使其 $< \varepsilon$（§1 Step 3）——**但 $M(N, \varepsilon)$ 可能随 $N$ 增长**；
- **$L^1$ 恢复项**：$\le \|f - f_N\|_{L^1}$（**同上**）。

**两阶段策略的精髓**：先选 $N$ 充分大使 $\|f - f_N\|_{L^1} < \varepsilon/3$（**给 $\varepsilon$ 一间房**——即 Fejér 核"房间"），再选 $M \ge M(N, \varepsilon/3)$（**固定 $N$ 下 §1 Step 3 的 Darboux 论证**）。**两层极限的次序**：先 $N$（取大），后 $M$（再取大），**$N$ 在前提供"抽象房间"，$M$ 在后收回"Weyl 论证"**。

### 朴素 ε-room 与抽象 ε-room 的对照

| 维度 | 朴素 ε-room（§2） | 抽象 ε-room（§3） |
|------|-------------------|-------------------|
| **扰动对象** | 阶梯函数 $f_\pm$（由分划 $P$ 与 $M_i, m_i$ 构造） | 褶积 $f * F_N$（由 Fejér 核构造） |
| **扰动参数** | 分划宽度 $\delta$ | 褶积参数 $N$ |
| **扰动消失** | $\delta \to 0$（分划细化） | $N \to \infty$（$L^1$ 收敛） |
| **"房间"载体** | 每个跳跃邻域 | Fejér 核的支撑与衰减 |
| **工具** | Darboux 上下和 | [[integrable-l1-approximation-by-continuous|Lemma 3.2]] + [[dominated-convergence|DCT]] |
| **可处理的函数类** | $PC(\mathbb{T})$（分段连续） | $L^1(\mathbb{T})$（一般可积） |

**关键洞察**：从朴素 ε-room 到抽象 ε-room，**"分房"的载体从"区间分划"切换到"核的支撑与衰减"**——这是 Riemann 框架到 Lebesgue 框架切换的本质。两者共享"**先扰动提供房间，再令扰动消失回收**"的两阶段结构，但**房间的具体几何形态**截然不同。

### 与 Erdős-Turán 不等式的对偶

Erdős-Turán 不等式**定量**地刻画均匀分布的偏离量：
$$
\sup_{(a,b)} \left|\frac{\#\{\xi_m \in (a,b)\}}{N} - (b-a)\right| \le C \left(\frac{1}{H} + \sum_{0 < |h| \le H} \frac{|\hat f(h)|}{h}\right),
$$
其中 $\hat f$ 是 $f = \chi_{(a,b)}$ 的 Fourier 系数。该不等式的**证明思路**正是抽象 ε-room 的精细化：用 $H$ 个 Fourier 系数项充当"扰动参数"，每项 $\hat f(h)/h$ 贡献一份"小 $\varepsilon$"——**与本节 Fejér 核"扰动对象"完全同构**。

因此本节 §3 与 Erdős-Turán 不等式是"**等分布的定性收敛**"与"**等分布的定量逼近**"两个层次上的同一方法——具体内容参 [[weyl-equidistribution|Weyl 等分布定理]] 页的"反例 / 推广"节。

### 推广链路的边界

- **§1 → §2**：从 $C(\mathbb{T})$ 到 $PC(\mathbb{T})$——朴素 ε-room 的可数化假设仍然成立（有限个跳跃点）；
- **§2 → §3**：从 $PC(\mathbb{T})$ 到 $L^1(\mathbb{T})$——朴素 ε-room 的可数化假设**崩塌**，必须切换到抽象 ε-room；
- **§3 → Schwartz 空间**：从 $L^1(\mathbb{T})$ 到 $\mathcal{S}(\mathbb{R})$——更进一步需要 [[fourier-inversion|Fourier 反演]] 的逐点收敛工具——猜想性观察。

---

## §4 边界与失败模式

§2、§3 各自标注了"朴素 ε-room"的边界。本节统一整理**失败模式**与**反例**：

| 函数类 | §1 三步核心 | §2 朴素 ε-room | §3 抽象 ε-room |
|--------|-----------|---------------|---------------|
| $C(\mathbb{T})$（连续） | ✅ 适用 | ✅ 适用（无需分房） | ✅ 适用 |
| $R(\mathbb{T})$（Riemann 可积） | ✅ 适用 | ✅ 适用 | ✅ 适用 |
| $PC(\mathbb{T})$（分段连续） | ⚠️ 形式通过但不精细 | ✅ **适用**（分房） | ✅ 适用 |
| Weierstrass 函数 $W \in R(\mathbb{T})$ | ⚠️ 形式通过 | ❌ 朴素分房失败（每个区间都有"跳跃型行为"） | ✅ 适用 |
| $L^1(\mathbb{T})$（一般可积） | ❌ 失效 | ❌ **失效** | ✅ **适用**（抽象化挽救） |
| $\chi_{\mathbb{Q}}$（Dirichlet 函数） | ❌ 不在 $R(\mathbb{T})$ | ❌ 失效 | ⚠️ 适用（a.e. 极限意义下） |

**几个观察**：

1. **§1 三步核心是 §2、§3 的共同基础**——§1 的 Step 1–3 不依赖 ε-room 思路，而是 Fourier 视角下的"代数 + 逼近 + 积分"标准范式；
2. **§2 与 §3 的边界即 Riemann 框架与 Lebesgue 框架的边界**——朴素 ε-room 的"分划 + 上下确界"假设本质上是 Riemann 可积的有限/可数间断假设；
3. **§3 的抽象 ε-room 是 Weyl 判据 (⇐) 方向的"最大推广"**——结合 $\{\xi_n\}$ 均匀分布的假设，Weyl 判据 1 (⇐) 对所有 $f \in L^1(\mathbb{T})$ 成立。

---

## §5 与现有 wiki 的关联

**涉及的概念**：
- [[fourier-series|Fourier 级数]]、[[fourier-coefficient|Fourier 系数]]、[[character|特征标]]（§1 Step 1 的基函数）
- [[lp-space|$L^p$ 空间]]、[[good-kernel|好核]]（§3 抽象 ε-room 的工具）

**涉及的定理**：
- [[weyl-equidistribution|Weyl 等分布定理]]（核心定理，本笔记反思对象）
- [[weierstrass-approximation-trig|Weierstrass 三角多项式逼近定理]]、[[fejer-theorem|Fejér 定理]]（§1 Step 2 的母机）
- [[riemann-localization|Riemann 局部化]]（§2 Dirichlet-Jordan 推论的对偶）
- [[fourier-inversion|Fourier 反演]]（§3 → Schwartz 空间的扩展接口）

**涉及的引理**：
- [[geometric-series-bounding|几何级数估计]]（§1 Step 1 的部分和有界性）
- [[integer-periodicity-of-exponential|复指数整数周期性]]（§1 Step 1 中 $\int e^{2\pi i n x}\,dx = 0$ 的根）
- [[integrable-l1-approximation-by-continuous|有界可积函数由一致有界连续函数在 $L^1$ 中逼近（Lemma 3.2）]]（§3 中 $C(\mathbb{T})$ 在 $L^1$ 中稠密的核心工具）
- [[dominated-convergence|控制收敛定理]]（§3 中两层极限交换的工具）

**涉及的方法**：
- [[euler-fourier-formulas|Euler-Fourier 公式]]（"用 Fourier 视角展开任意函数"的方法论范式，与本笔记三步法同源）
- [[approx-by-good-kernel|近似核逼近]]（§3 Fejér 核褶积的具体实施）
- [[cesaro-summation|Cesàro 求和法]]（Weierstrass 三角逼近在 §1 Step 2 中的具体实现）
- [[integral-truncation|积分截断]]（§2 "主项 + 余项"框架同源）

**涉及的习题**：
- [[ch1-ex3-double-fourier-transform|Ch.1 Ex.3]]（双重 Fourier 反演中"先引入 $e^{-\pi\epsilon x^2}$ 提供房间"是 "give epsilon a room" 思路的样板）

**涉及的笔记**：
- [[integral-splitting-how-to-choose]]（§5 "epsilon of room" 两阶段极限框架）
- [[fourier-analysis-zh-notes]]（§6.1 epsilon of room 的笔记化记录）

**引用的源**：
- [[steinFourierAnalysisIntroduction2003a|Stein & Shakarchi (2003), Ch. 4 §3]]

---

## §6 反思与未决问题

1. **三步法是否仅在 Fourier 框架下成立？** 看起来是的——其他"由密度生成全空间"的范式（如 Stone-Weierstrass 用代数闭包）虽形态相似，但 Fourier 的优势在于**基函数就是判据检验的对象**（$e^{2\pi i k x}$）。这是 Fourier 分析独特的力量。

2. **三步法与 Fourier 反演定理的关系**：Fourier 反演（[[fourier-inversion]]）的证明是"基函数 $e^{-2\pi i \xi x}$（直接计算）→ Schwartz 逼近 → 反演公式"。这是与本笔记完全同构的"三步生成法"。可视为本笔记的**对偶视角**——$e^{2\pi i n x}$ 是离散字符，$e^{-2\pi i \xi x}$ 是连续字符。

3. **§3 中两层极限的次序依赖**：先 $N$（Fejér 褶积参数）后 $M$（序列长度）——若反向（即先 $M$ 后 $N$）会失败，因为对每个固定 $M$，$\frac{1}{M}\sum f_N(\xi_m)$ 对 $N$ 的依赖可能不一致（极限次序的实质性约束）。**猜想**：本笔记 §3 的次序与 [[ch1-ex3-double-fourier-transform|Ch.1 Ex.3]] 的"先 $\epsilon$ 后 $R$"次序同源——"先扰动后极限"是 ε-room 框架的硬性约定。**未独立核验**。

4. **ε-room 与 Erdős-Turán 不等式的对偶**：Erdős-Turán 用 Fourier 系数控制均匀分布的偏离量——[[fourier-coefficient|Fourier 系数]]项 $\hat f(k)$ 的有限和与"分房"思路有结构同构（每项 $k$ 贡献一份"小 $\varepsilon$"）。**猜想**：可用同一框架统一处理"等分布的定量逼近"与"分段连续函数的定性收敛"。**未独立核验**。

5. **若未来出现与本笔记主张矛盾之 verified 页**（如 Weierstrass 三角逼近不只由 Fejér 定理推出，或 Riemann 可积可有其他等价刻画），按笔记页约束以 `wiki/open-questions.md` 记录，不直接修改被引用页。

---

## 维护记录

| 日期 | 操作 | 维护者 |
|------|------|--------|
| 2026-08-16 | 初稿（Weyl 判据 Claim 1 的 Fourier 三步生成法反思） | AI |
| 2026-08-16 | 修订 §1 Step 3：测度论极限改为 Darboux 上下和思路 | AI |
| 2026-08-16 | 扩展 §2：分段连续函数与"give epsilon a room"分房思路 | AI |
| 2026-08-16 | 扩展 §3：$L^1$ 可积函数——朴素 ε-room 失效与抽象化挽救 | AI |
| 2026-08-16 | 重构：按"§1 三步核心 / §2 推广一 / §3 推广二 / §4 边界与失败模式 / §5 关联 / §6 反思"重组，明确朴素 ε-room 与抽象 ε-room 的边界 | AI |

---

**注**：本笔记为**方法论笔记**，唯一允许 AI 撰写原创内容的页面类型。所有事实性主张均以 `wiki/` 与 `raw/` 中已存在的实体页/源页为依据；本笔记专注**组织性论述**（三步生成法的结构、§1–§3 推广路径）与**反思性内容**（猜想、对偶视角）。如出现与 `verified` 页矛盾之处，须以 `wiki/open-questions.md` 跟踪。