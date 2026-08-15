# Index — 内容目录

> wiki 的目录。每次 ingest / query / lint 后由 LLM 更新。
> 回答问题时，LLM 先读本文件定位相关页，再钻取。
> 实体页按领域分类于 [[index-fourier]] 与 [[index-complex]]（method 与 note 不参与划分，保留在本页）。

---

## 分类索引

| 领域 | 索引页 | 说明 |
|------|--------|------|
| 傅里叶分析 | [[index-fourier]] | Fourier 级数/变换、$L^p$/Schwartz/好核、有限阿贝尔群（Stein《Fourier Analysis》Ch.1–7） |
| 复分析 | [[index-complex]] | 全纯函数、Cauchy 定理与积分公式、留数理论、整函数与增长（Stein《Complex Analysis》Ch.1–5） |
| 解析数论 | [[index-number-theory]] | Dirichlet 定理、Euler 乘积与 $L(s,\chi)$（Stein《Fourier Analysis》Ch.8 数论应用） |
| 微分方程 | [[index-pde]] | 波动方程与 d'Alembert 显式解（Stein《Fourier Analysis》Ch.1 §3） |

概念、定理、引理、习题、问题页按上述四领域归类；跨领域基础引理与全部方法、笔记保留在本页。

## 通用引理（跨领域）

- [[cauchy-schwarz-inequality]]：Cauchy–Schwarz 不等式——$\left|\int f\bar{g}\right| \leq \|f\|_{L^2}\|g\|_{L^2}$。状态：`verified`。
- [[fubini-tonelli]]：Fubini-Tonelli 定理——重积分换序的充分条件（非负 / 绝对可积）。状态：`verified`。
- [[dominated-convergence]]：控制收敛定理——被可积函数控制的逐点收敛可交换极限与积分（**Stein 不使用**，以一致收敛替代）。状态：`verified`。
- [[absolute-convergence-test]]：绝对收敛检验——$\sum |a_n|$ 收敛 ⇒ $\sum a_n$ 收敛。状态：`verified`。
- [[rolle-mean-value-theorem]]：Rolle 中值定理——可微函数在两等值点间导数为零。状态：`verified`。

## 方法（Methods）

- [[contour-integration]]：围道积分法——三步骤框架（选取围道、应用定理、化简极限），含围道平移与 keyhole（多孔）变体（Paley-Wiener、Cauchy 积分公式、留数定理、辐角原理、Jensen 公式证明的核心）。状态：`verified`。
- [[analytic-continuation]]：解析延拓法——三类延拓技术（幂级数、Schwarz 反射、Paley-Wiener）。状态：`verified`。
- [[residue-calculus]]：留数计算法——三步计算（识别极点、计算留数、求和）。状态：`verified`。
- [[comparison-modulus]]：模的下界转化法——通过倒数将有界性转化为极点性（最大模原理、Phragmén-Lindelöf 定理证明的核心）。状态：`verified`。
- [[amplification]]：增强技巧（amplification）——通过构造带自由参数的辅助函数从弱估计导出强估计（Phragmén-Lindelöf 的 $F_\varepsilon$、Weierstrass 典型因子的核心）。状态：`verified`。
- [[local-to-global]]：局部到整体原理——局部信息通过连通性推广为全局结论（恒等定理、最大模原理、辐角原理的核心）。状态：`verified`。
- [[structural-randomness-decomposition]]：结构-随机性二分法——将对象分解为结构部分 + 随机部分分别分析（Cauchy 积分公式、留数定理、Phragmén-Lindelöf 的核心）。状态：`verified`。
- [[homotopy-argument]]：同伦论证——曲线同伦 → 积分相等（同伦版 Cauchy 定理、单连通域原函数存在、对数分支存在的核心）。状态：`verified`。
- [[blashke-product]]：Blashke 乘积——带边界约束的零点因子（$|b_k| = 1$ 在圆周上），是 Jensen 公式证明的核心构造。状态：`verified`。
- [[approx-by-good-kernel|近似核逼近]]（`approx-by-good-kernel`）：状态：`unverified`。
- [[separation-of-variables|分离变量法]]（`separation-of-variables`）：状态：`unverified`。
- [[cesaro-summation|Cesàro 求和法]]（`cesaro-summation`）：状态：`unverified`。
- [[symmetry-breaking|对称性破缺]]（`symmetry-breaking`）：状态：`unverified`。
- [[integral-truncation|积分截断]]（`integral-truncation`）：状态：`unverified`。
- [[integration-by-parts|分部积分法]]（`integration-by-parts`）：状态：`unverified`。
- [[differentiation-under-integral|对参数求导（积分号下求导）]]（`differentiation-under-integral`）：状态：`unverified`。
- [[fft|快速 Fourier 变换（FFT）]]（`fft`）：状态：`verified`。
- [[euler-fourier-formulas|Euler 部分分式公式（Fourier 路线与 Poisson 路线）]]（`euler-fourier-formulas`）：cot 展开、csc² 求和、Euler 反射公式的两条互补方法。状态：`verified`。

## 笔记（Notes）

- [[notes/schwartz-space-as-fourier-anchor]]：Schwartz 空间在 Fourier 分析中的核心地位——四种角色的反思。状态：`draft`。
- [[notes/fourier-analysis-zh-notes]]：傅里叶分析笔记（参考 Stein–Shakarchi）——两编九章，五个场景、好核与求和法、唯一性、双射性、Poisson 求和、双重跃迁、等周不等式、数论与 PDE 应用。状态：`mature`。
- [[notes/fourier-three-questions-and-methodology]]：Fourier 卷三大问题与思想方法——等周/等分布/无处可微、遍历诠释、延迟平均与 lacunary 级数、衰减↔光滑对偶（纲领性高亮提炼）。状态：`draft`。
- [[notes/complex-analysis-rigidity-and-methods]]：复分析方法论——刚性、奇点刻画、表示公式与围道积分三定理同一思想（纲领性高亮提炼）。状态：`draft`。
- [[notes/finite-abelian-fourier-and-number-theory]]：有限阿贝尔群结构定理与 Fourier 观点在数论中的应用——读第七、八章时的真实思考记录；4 条支持 + 5 条怀疑，最终把"清晰"分成"翻译层清晰"与"难度层不清晰"两层。状态：`draft`。

## 人物（People）

_（暂无。）_

## 源（Sources）

- [[steinFourierAnalysisIntroduction2003a]]：Stein & Shakarchi《Fourier Analysis: An Introduction》(2003)，Fourier 级数与 Fourier 变换导论。状态：`unverified`。
- [[chat-fourier-series-2026-08-11]]：AI 对话笔记——围绕 Stein Fourier 卷的深度讨论（特征标、Poisson 求和、Dirichlet 定理、Hermite 函数等）。状态：`pending-verification`（30 条主张已核验 28 条，F2/F3 仍待核验）。
- [[steinComplexAnalysis]]：Stein & Shakarchi《Complex Analysis》(2003)，复分析与 Fourier 变换（含 Ch. 1–5 全部 PDF 批注）。状态：`unverified`。

---

### 统计

| 类目 | 数量 |
|------|------|
| topics | 0 |
| concepts | 26 |
| theorems | 38 |
| lemmas | 23 |
| exercises | 10 |
| problems | 5 |
| notes | 5 |
| methods | 18 |
| people | 0 |
| sources | 3 |
| **合计** | **128** |

按领域划分（不含 method/note/people/sources）：傅里叶分析 **58** 页（[[index-fourier]]）、复分析 **35** 页（[[index-complex]]）、解析数论 **3** 页（[[index-number-theory]]）、微分方程 **1** 页（[[index-pde]]）、通用引理 5 页（本页）。

## 项目治理（2026-08-12 更新）

- 项目身份与轻量地图：[AGENTS.md](../AGENTS.md)。
- 上下文加载策略与配置层级：[docs/CONTEXT.md](../docs/CONTEXT.md)。
- 稳定区/灰区/自由区分类：[docs/STABLE.md](../docs/STABLE.md)。
- 语义回归审计清单：[docs/REGRESSION.md](../docs/REGRESSION.md)。
- Trae 命令系统说明（触发词、五段式、autonomy 三级）：[docs/COMMANDS.md](../docs/COMMANDS.md)。
- 最近 lint 摘要：[`.lint-last.md`](.lint-last.md)（由 lint 脚本自动生成）。

Dataview 动态计数：


```dataview
TABLE type, status, updated
FROM "wiki"
WHERE type != null
SORT updated DESC
```
