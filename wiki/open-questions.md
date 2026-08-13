# Open Questions — 矛盾与未决

> 记录 wiki 中的矛盾、被新源取代的陈旧主张、待核验问题。
> LLM 在 lint 时更新；摄取时若发现矛盾也记入。

格式：
```
### [YYYY-MM-DD] <问题标题>
- **状态**：open | investigating | resolved
- **涉及页面**：[[<page>]]、[[<page>]]
- **描述**：……
- **建议下一步**：……
```

---

## 记号冲突

> 记录同一符号在不同页面表示不同对象、或同一对象存在两种写法的情形（依据 docs/NOTATION.md「收录原则」）。**只登记、不擅自裁决**；候选方案经用户裁决后统一全库。

### [2026-08-13] 圆群上 $\hat f(n)$ 归一化三套约定混用（含基函数 $e^{in\theta}$ 与 $e^{2\pi i n\theta}$）

- **状态**：resolved
- **涉及页面**：[[fourier-coefficient]]、[[fourier-series]]、[[parseval-identity]]、[[fourier-inversion]]、[[fejer-theorem]]、[[riemann-localization]]、[[riemann-lebesgue-lemma]]、[[isoperimetric-inequality]]、[[good-kernel]]、[[weierstrass-approximation-trig]]
- **描述**：同一符号 $\hat f(n)$ 在 wiki 中对应至少三种互不相同的定义：
  1. **圆群 $[-\pi,\pi]$ 基**：$\hat f(n)=\frac{1}{2\pi}\int_{-\pi}^{\pi} f(\theta)e^{-in\theta}\,d\theta$，级数 $f\sim\sum\hat f(n)e^{in\theta}$——[[fourier-coefficient]]（定义）、[[fejer-theorem]]（$S_N(f)(\theta)=\sum_{|n|\le N}\hat f(n)e^{in\theta}$）、[[riemann-localization]]（$S_N$ 与 $D_N(t)=\sum_{|n|\le N}e^{int}$）、[[weierstrass-approximation-trig]]、[[isoperimetric-inequality]]（$x(t)=\sum a_ne^{int}$）、[[good-kernel]]（$D_N=\sum_{|n|\le N}e^{inx}$、$P_r=\sum r^{|n|}e^{in\theta}$）。
  2. **$\mathbb{T}$ 上基 $e^{2\pi i n\theta}$**：[[parseval-identity]]（$S_N(f)(\theta)=\sum_{|n|\le N}\hat f(n)e^{2\pi i n\theta}$）、[[fourier-inversion]]（圆群版 $f(\theta)=\sum\hat f(n)e^{2\pi i n\theta}$）——与 1 同称「圆群」，但基与归一化不同（Parseval 相应为 $\frac{1}{2\pi}\sum|\hat f(n)|^2=\int|f|^2$ 对 1，$\sum|\hat f(n)|^2=\int|f|^2$ 对 2）。
  3. **$[0,1]$ 归一化基**：$\hat f(n)=\int_0^1 f(x)e^{-2\pi i n x}\,dx$，级数 $\sum\hat f(n)e^{2\pi i nx}$——[[fourier-series]]（主约定）、[[poisson-summation-formula]]。
  4. **无归一化 $[0,2\pi]$**：[[riemann-lebesgue-lemma]] 第 29 行 $\hat f(n)=\int_0^{2\pi} f(\theta)e^{-in\theta}\,d\theta$（既非 1（差 $1/(2\pi)$ 因子）也非 3（差变量替换），且与该页 Bessel 不等式 $\sum|\hat f(n)|^2\le\|f\|_2^2$ 不相容——归一化缺失时应为 $\sum|\hat f(n)|^2\le 2\pi\|f\|_2^2$）。
- **建议下一步**：候选方案：(a) 圆群统一为 1（Stein Ch.3–4 正文，$e^{in\theta}$ 配 $\frac{1}{2\pi}\int$）；(b) 圆群统一为 2（$e^{2\pi i n\theta}$ 配 $\int_0^1$，$[0,1]$ 归一化）；(c) 保留两套但显式标注语境（fourier-series 等价叙述区段已有此做法）。另须修正 4 的归一化缺失。用户裁决后统一全库。
- **解决**：用户裁决（2026-08-13）——平凡问题，**无需纠正**，只要上下文明确即可；傅里叶系数同理（含 4 的归一化缺失，不作修正）。各页沿用现状并注明所用基与归一化（见 docs/NOTATION.md「常用记号登记」B 节按基分类）。

### [2026-08-13] 区间特征函数两种写法 $\chi_I$ 与 $\mathbf{1}_I$

- **状态**：open
- **涉及页面**：[[sampling-theorem]]、[[ch5-ex20-sampling]]、[[fourier-transform]]、[[riemann-lebesgue-lemma]]、[[weyl-equidistribution]]、[[paley-wiener-theorem]]、[[ch5-problem-1-psf-without-schwartz]]
- **描述**：同一对象（区间指示函数）存在两种写法：$\chi_I$ / $\chi_{[a,b]}$ / $\chi_{[-1/2,1/2]}$（[[sampling-theorem]]、[[ch5-ex20-sampling]]、[[fourier-transform]]、[[riemann-lebesgue-lemma]]、[[weyl-equidistribution]]、[[plancherel-theorem]]）与 $\mathbf{1}_{[-M,M]}$（[[paley-wiener-theorem]]）、$\mathbf{1}_{[-R,R]}$（[[ch5-problem-1-psf-without-schwartz]]）。另注意数论语境 $\mathbf{1}$ 表示常函数 $1$（[[dirichlet-theorem-on-primes]] 中 Dirichlet 卷积 $\chi * \mathbf{1}$），与区间指示函数语义不同。
- **建议下一步**：候选方案：统一用 $\chi_I$（与采样定理、Riemann–Lebesgue 主流一致），将 [[paley-wiener-theorem]] 与 [[ch5-problem-1-psf-without-schwartz]] 的 $\mathbf{1}_{[-M,M]}$、$\mathbf{1}_{[-R,R]}$ 改为 $\chi_{[-M,M]}$、$\chi_{[-R,R]}$；数论语境 $\mathbf{1}$ 保留并注明「常数函数」。
- **解决**：按候选方案执行（2026-08-13）——区间指示函数全库统一为 $\chi_I$（[[paley-wiener-theorem]]、[[ch5-problem-1-psf-without-schwartz]]，另及 [[bump-function]]、[[fourier-coefficient-decay]]、[[mean-square-convergence]]、[[gibbs-phenomenon]] 中的区间指示 $\mathbf{1}_{[\cdot]}$）。数论常函数 $\mathbf{1}$（[[dirichlet-theorem-on-primes]] 中 $\chi*\mathbf{1}$）保留并注明「常数函数」；非区间集指示（如有限群 Dirac 核 $|G|\,\mathbf{1}_{\{1_G\}}$，[[finite-abelian-group]]、[[finite-abelian-decomposition]]）不在区间指示约定范围内，保留 $\mathbf{1}$。

### [2026-08-13] 圆群卷积的 $1/(2\pi)$ 归一化写法不一致

- **状态**：resolved
- **涉及页面**：[[good-kernel]]、[[fejer-theorem]]、[[fourier-series]]、[[steinFourierAnalysisIntroduction2003a]]
- **描述**：Stein 书中圆群卷积定义带 $1/(2\pi)$ 因子（$(f*g)(x)=\frac{1}{2\pi}\int_{-\pi}^{\pi}f(y)g(x-y)\,dy$，Ch.2 p.61；好核单位质量条件为 $\frac{1}{2\pi}\int K_n=1$），而 $\mathbb{R}$ 上卷积无归一化（docs/NOTATION.md 强制表）。wiki 中 [[good-kernel]] 单位质量条件写作 $\frac{1}{2\pi}\int K_n=1$（一致），但其卷积逼近式写作 $(f*K_n)(x)=\int f(x-y)K_n(y)\,dy$（无 $1/(2\pi)$）；[[fejer-theorem]] 的 $F_N$ 质量条件同样带 $1/(2\pi)$ 而 $S_N(f)=(f*D_N)$ 未写因子。同为圆群语境，带/不带 $1/(2\pi)$ 混用。
- **建议下一步**：候选方案：(a) 圆群页统一按 Stein 带 $1/(2\pi)$ 的卷积定义，好核条件与卷积式同时写因子；(b) 圆群页统一改用 $[0,1]$ 归一化基（则无因子）。用户裁决后统一全库。
- **解决**：用户裁决（2026-08-13）——平凡问题，**无需纠正**，只要上下文明确即可（docs/NOTATION.md「补充约定」已注明圆群卷积带 $1/(2\pi)$ 与 $\mathbb{R}$ 卷积无因子之分，各页以语境为准）。

---

### [2026-08-11] AI 对话笔记的待核验主张（chat-fourier-series-2026-08-11）

- **状态**：open
- **涉及页面**：`wiki/sources/chat-fourier-series-2026-08-11.md`
- **描述**：AI 对话笔记 `chat-fourier-series-2026-08-11.md` 中共提取 28 条数学主张（A1–F5），按 schema §1.2 须经 Stein《Fourier Analysis: An Introduction》原书逐条核验后方可升级 `status` 并作为其他页依据。完整清单见源页「待核验主张」区段。核心核查项：
  - A1–A4：傅里叶观点工作定义、五场景骨架、character 谱定理选择。
  - B1–B4：Poisson 求和公式的 Stein 原表述与对话中商群/Pontryagin 对偶诠释的边界。
  - C1–C6：Ch.6 旋转与 $\mathbb{R}^d$ 各命题与定理的精确位置。
  - D1–D6：Ch.7 §2.2 character 定义、Ch.8 指示函数展开、Euler 乘积、$L(1,\chi)\neq 0$。
  - E1–E5：古典四步框架的精确页码与证明路径。
  - F1–F5：三个遗漏项（Riemann 局部化、Hermite 函数谱分解、采样定理）。
- **建议下一步**：用户对照 Stein 原书 PDF 批注核验每条主张；在源页「待核验主张」区段勾选并标注核验结果（[已核验] / [部分核验] / [矛盾]）。核验一致后升源页 `status: pending-verification`；核验通过的主张可独立建为 wiki 实体页（character、Poisson summation、Riemann localization、Hermite 函数、Dirichlet 定理等候选）。

### [2026-08-11] lint | wikilink 错误已修复（character.md）

- **状态**：resolved
- **涉及页面**：`wiki/concepts/character.md`
- **描述**：lint 巡检发现 `character.md` 第 62 行 wikilink 错误——`[[dirichlet-theorem-on-primes-on-primes|Dirichlet 定理]]` 文件名重复「on-primes」。已修正为 `[[dirichlet-theorem-on-primes|Dirichlet 定理]]`。
- **建议下一步**：无需进一步操作；其他 6 个页面的 wikilink 经全量 grep 核验，均指向存在的目标，无悬空链接。

### [2026-08-11] schema-accept | 工作流优化正式生效

- **状态**：resolved
- **涉及页面**：`AGENTS.md`、`README.md`、`scratch/schema-evolution-proposals-2026-08-11.md`、`wiki/log.md`
- **描述**：用户原则上同意 schema 演化提案（自动 lint、个人笔记、AI 核验分级、强弱字段）。schema 修订于 2026-08-11 上午正式生效。
- **AGENTS.md 修订**：§0（raw/personal）、§3.1-§3.4（frontmatter 完整字段、强弱字段、status 流转、AI 核验分级）、§4.3.1-§4.3.3（人工 lint + 自动检测 + LLM 集成）。
- **README.md 修订**：目录结构（新增 raw/personal/ 与 scripts/）、§3.3.1-§3.3.2（lint 触发与流程）。
- **建议下一步**：执行阶段 1 的具体任务——为现有 6 个 wiki 页（3 概念 + 3 定理）补 `strength` 与 `space` 字段，使其符合新 schema。

### [2026-08-13] 实体治理审计 | fourier-series.md 内容被覆盖为整函数（与 entire-function.md 完全重复）

- **状态**：resolved
- **涉及页面**：[[fourier-series]]、[[entire-function]]
- **描述**：实体治理审计发现 `wiki/concepts/fourier-series.md` 的当前内容与 `wiki/concepts/entire-function.md` **逐字一致**（frontmatter title 均为「整函数」、aliases 均为 `[entire function]`，正文含等价叙述表、反例、关联区段亦相同），疑似一次编辑事故将整函数内容覆盖到 fourier-series 页。而 `index.md` 与 `log.md` 记载该页本应为「Fourier 级数」概念页（曾含方波、$\lvert\sin x\rvert$、Weierstrass 函数等典型例子，Kolmogorov 1923 / du Bois-Reymond 1873 / Carleson 1966 反例与 Gibbs 现象区段）。后果：真正「Fourier 级数」概念页缺失，而 index.md、fourier-coefficient、ellp-space、character、good-kernel、lp-space、fourier-transform、riemann-lebesgue-lemma、weyl-equidistribution 等 15+ 处 `[[fourier-series]]` 链接现全部指向整函数内容。两难：直接删除 fourier-series.md 会破坏上述链接；保留现状则「一页一实体」与索引语义双重违背。
- **解决**：git 仓库仅初始化提交、无历史可恢复，故按候选方案（b）执行——依据源页 `steinFourierAnalysisIntroduction2003a` 与笔记重建 `wiki/concepts/fourier-series.md` 为正确的 Fourier 级数概念页（Stein 约定定义、性质 8 条均 wikilink、关联与反例区段），`status: unverified`。15+ 引用按 basename 解析自动指向正确内容。lint 通过。

### [2026-08-13] 实体治理审计 | methods/wirtinger-inequality.md 实为定理，类型错位

- **状态**：resolved
- **涉及页面**：[[wirtinger-inequality]]、[[ch5-pb11-wirtinger]]、[[isoperimetric-inequality]]
- **描述**：`wiki/methods/wirtinger-inequality.md` 声明 `type: method`，但内容为完整不等式陈述（$\int_0^T |f|^2 \le (T/2\pi)^2 \int_0^T |f'|^2$，等号当且仅当基波）、证明思路（Parseval 直接推论）与典型应用——按 wiki 实体分类属**定理**（theorems/ 下经核实无 Wirtinger 相关页，故无跨页重复），存在实体类型错位。同时其陈述与 `wiki/problems/ch5-pb11-wirtinger.md`（Ch.5 Problem 11 习题页）内容重叠：后者证明同一不等式族并衔接等周不等式。两难：作为 method 页缺「步骤化技巧」叙事，作为定理页缺「详细证明」区段；且与 problems 页功能边界不清。
- **解决**：按候选方案（a）执行——迁移为 `theorems/wirtinger-inequality.md`（type: theorem，补等价叙述 + 证明思路 + 详细证明 + strength/strength_basis），新增「相关习题」区段引用 [[ch5-pb11-wirtinger]]，与 [[isoperimetric-inequality]] 互链。problems/ch5-pb11-wirtinger 保留为习题页。

### [2026-08-13] 实体治理审计 | sampling-theorem 定理页直接由习题升级，无独立定理来源

- **状态**：resolved
- **涉及页面**：[[sampling-theorem]]、[[ch5-ex20-sampling]]
- **描述**：`theorems/sampling-theorem.md` 的 frontmatter sources 为「Stein Ch. 5 Exercise 20」，陈述与证明思路（Poisson 求和 + $\chi_I$ 特征函数 + sinc 核）与 `exercises/ch5-ex20-sampling.md` 解答高度重合——即本定理页由习题页直接升级而来，无正文中独立定理陈述支撑（对比 heisenberg-uncertainty-principle 页有 Theorem 4.1 来源、仅借用 Ex.23 证法）。两难：Shannon-Nyquist 采样定理在文献中是公认独立定理，予以保留合理；但「习题升级为定理页」缺乏一致治理规则（是否允许、强度分级如何定、证明是否须与习题页解耦），且两页内容重复度高。
- **解决**：按候选方案（a）执行——保留 `theorems/sampling-theorem.md` 为主页面，重写**独立完整证明**（自 PSF 周期化 + 反演两阶段，含 Claim 1（$F$ 的 Fourier 系数 = $f(-m)$）与 Claim 2（求和与积分交换，控制收敛），与习题页解答解耦）；exercises 页留档题解（含 (b) Plancherel 型等式、(c) 更细采样）。同时修复 frontmatter `aliases` 前导空格与反例 $|\xi|$ 笔误。

### [2026-08-13] 实体治理 | methods/annular-contour 并入 keyhole-contour

- **状态**：resolved
- **涉及页面**：[[keyhole-contour]]、[[contour-integration]]、[[contour-translation]]、[[residue-calculus]]
- **描述**：围道家族重复审计（用户反馈「围道积分的使用方法散落多个实体页」）。发现：`methods/keyhole-contour.md` 与 `methods/annular-contour.md` 是同一「挖去奇点 + 走廊」构造的单孔/多孔两种形式——违反「一页一实体」；且两者的「概述/三步操作」与 `contour-integration.md` 的三步骤框架（选取围道 → 应用定理 → 化简极限）高度重复。执行（保守合并，优先保留 slug）：保留 `keyhole-contour` 为主页面（被 8 处引用，多于 annular 的 6 处，且是标准术语），将 annular 特有内容（辐角原理多孔分解、Jensen 公式 Blashke 乘积引入、Phragmén-Lindelöf 有界扇形、Laurent 系数例子）并入 keyhole 的「变体（多个内边界）/Stein 应用」小节，删除 `annular-contour.md`，重写 5 处 wikilink（cauchy-integral-formula、residue-theorem、argument-principle、jensen-formula、structural-randomness-decomposition）+ index.md。`contour-integration` 保留为通用框架页、`keyhole-contour` 为具体构造页，未进一步合并（理由：contour-integration 被 8+ 页引用，吸收 keyhole 将造成大规模链接重写且使通用页膨胀）；`contour-translation`、`residue-calculus` 内容独特，保留不动。
- **建议下一步**：无需进一步操作；若用户希望「围道全部并入 contour-integration 一页」，可作为备选方案另行评估（本轮按最小链接重写原则未执行）。

### [2026-08-13] 实体治理 | method 认定：四个候选技巧的判定记录

- **状态**：open（记录判定，供复核）
- **涉及页面**：[[amplification]]、[[comparison-modulus]]
- **描述**：按「真假」决策树（有真假的命题 → lemma/theorem；无真假的可复用技巧 → method）与实体页最小原则，对上一轮审计登记的四个候选逐一判定：
  1. **分部积分 / 两次分部积分** → 新建 `methods/integration-by-parts.md`（≥2 页关键步骤：[[riemann-lebesgue-lemma]] 叙述 4 的 $C^k$ 改善、[[ch5-problem-1-psf-without-schwartz]] 第一步、[[ch5-ex23-heisenberg]] 两次分部积分、[[cauchy-theorem]] 证明；无既有 method 页）。
  2. **对参数求导（积分号下求导 / 参数化全纯）** → 新建 `methods/differentiation-under-integral.md`（≥2 页关键步骤：[[cauchy-integral-formula]] 高阶导数公式、[[paley-wiener-theorem]] Claim 4 整函数性、[[ch4-ex12-feynman]] Feynman 技巧；参数化全纯一面与 [[amplification]] 应用 3 交叉引用）。
  3. **乘 1 技巧（插入恒等因子）** → **不新建**（wiki 内无 ≥2 页将其作为关键步骤使用）；已在 amplification 的「登记说明」小节登记，待出现 ≥2 处使用再升级。
  4. **加权估计（增长×衰减乘积控制）** → **不新建**（已由 [[comparison-modulus]]「上下界的乘积」小节与 [[amplification]]「指数衰减增强」共同覆盖，一页一实体原则下不设重复页面）。
- **建议下一步**：复核上述判定；若认为 3/4 应独立成页，可重开本条目并给出具体使用处证据。
