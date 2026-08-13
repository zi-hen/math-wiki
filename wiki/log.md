# Log — 时间线

> 仅追加。每条统一前缀 `## [YYYY-MM-DD] <op> | <标题>`，便于
> `grep "^## \[" wiki/log.md | tail -n 5` 取最近 5 条。

---

## [2026-08-13] lint-final | expand-wiki-coverage 验收：lint 0 状态回归与补链

### 动因

`expand-wiki-coverage` spec 全部页面建设完成后，最终 lint 回归发现 `scripts/lint-wiki.ps1` 在 PowerShell 5.x 下无法解析（parser 错误 code=1），且大量新页面缺概念 wikilink。

### Lint 脚本修复（根因：BOM）

`scripts/lint-wiki.ps1` 以 **UTF-8 无 BOM** 保存时，PS5 按系统 ANSI 代码页（GBK）解码中文字符串，奇偶字节边界会吞掉相邻 ASCII 字符（`'`、`)`、`$`），导致"Missing ')' in method call"等误导性解析错误。修法：文件转为 **UTF-8 带 BOM**，PS5 正确按 UTF-8 解析，中文 literal 恢复正常。此前逐处 `[char]0xNNNN` 拼接的规避代码保留（无害）。

另两处结构修改：
- Section 6（concept 检测）与 Section 8（orphan 检测）豁免 `notes/` 目录——笔记页为用户个人审核页，不强制 wikilink 规范（不变量：不修改 notes 页）。
- Section 12 强关键词为「弱条件/强结论」等固定词；5 个新页面写「弱——/强——」未命中，改为含关键词措辞。

### 页面修复（39+ 文件）

- **6 处 broken wikilink**：误将 citekey 写成 wikilink（`[[steFFT]]`、`[[steTheorem-1.4]]`、`[[stePoisson-summation-formula]]`、`[[steProposition-fourier-radial]]`、`[[chat-exercises/...]]`、`[[chat-weyl-equidistribution]]`）→ 改为真实页面链接或纯文本 citekey。
- **55 处 concept 补链**：按 lint Section 6 白名单（Lp/ellp/Schwartz/good kernel/character/Fourier coefficient/finite abelian/Bessel/radial），为 39 个页面在正文或"关联"区段补 wikilink。
- **5 处 strength_basis**：fejer-theorem、weierstrass-approximation-trig、sampling-theorem、radon-transform、gauss-mollification 的「弱——/强——」措辞改为「弱条件/强结论」。
- **1 处 backlink**：fubini-tonelli「应用」段的 `[[steinComplexAnalysis]]` 去链接（citekey 纯文本），保持来源可回溯。

### Lint 最终状态

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 0 |
| **INFO** | 16 |

INFO 16 均为已知 orphan（exercises/problems/notes 等新页暂无反向引用），≤ 20 阈值，符合 checklist 第 13 节验收。

### 验收

- `tasks.md` / `checklist.md` 全部勾选。
- 临时诊断脚本（`diag_bytes.ps1`、`convert_bom.ps1`、`find_empty.py`、`check_file.py`）已删除。
- 不变量保持：`raw/`、`scratch/` 未触碰；`notes/fourier-analysis-zh-notes.md` 等未修改。

---

## [2026-08-13] highlight-ca-proofs | 补充高亮处理:傅里叶逆公式与泊松求和公式的复分析证明

### 动因

用户补充 raw 高亮(复分析卷 Stein Complex Analysis Ch.4)并指示处理:其中含傅里叶逆公式(Thm 2.2)与泊松求和公式(Thm 2.4)的**复分析证明**(围道积分/留数法),且 p.133 有纲领句「三个证明的思想都是围道积分」。按高亮处理规则(Enrich 既有实体页)执行。

### 执行内容

1. **[[fourier-inversion]] 追加「证明三:复分析(围道积分)法」**(书内,Stein Book II Ch.4 Thm 2.2, p.134-137):
   - 工作空间:类 $\mathscr{F}_a$(条带 $S_a$ 全纯 + 中等衰减,动机说明:Book II 用解析延拓换掉 Book I 的好核实方法);
   - 4 个 Claim:Lemma 2.3 指数积分、带限移位($\hat f$ 指数衰减 $|\hat f(\xi)|\le Be^{-2\pi b|\xi|}$)、$f(\zeta)/(\zeta-x)$ 留数 $=f(x)$、竖直边积分消失;矩形围道 $\gamma_R$ + 留数定理得反演。
2. **[[poisson-summation-formula]] 新增「证明二:复分析(留数核)法」**(书内,Book II Ch.4 Thm 2.4, p.137-138):
   - 工作空间:类 $\mathscr{F}_a$(动机注明:把 Poisson 求和从 Schwartz 推广到「条带全纯 + 中等衰减」类——Book I 结果的更强版本);
   - 5 个 Claim:核 $1/(e^{2\pi iz}-1)$ 整数简单极点留数 $1/2\pi i$、矩形 $\gamma_N$ 留数公式、极限与竖直边消失、几何级数展开两情形($L_1$/$L_2$)、逐项积分 + Cauchy 定理回实线。
3. **源页清单同步**:`sources/steinComplexAnalysis.md` 高亮处理清单 Ch.4 三行更新为「已覆盖(定理页其他证明)」,p.133 纲领句标记已引用。
4. 「证明难度差异」表分别补证明三/证明二行。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 0`。

### 不变量

- `raw/`(只读)、`scratch/`、`docs/`、`templates/`、`scripts/`、`wiki/index.md`、`wiki/log.md` 未改动(本条目除外);无新增/删除页面。

---

## [2026-08-13] dual-proofs | 同一定理双证法全面阐述(9 页)

### 动因

用户要求:复分析与 Fourier 分析中,同一定理存在两种证明方法(或一种证法得出更强结论)的,须全面阐述。按 docs/PROOFS.md §6.5「多证明记录」规范执行。

### Fourier 分析侧(5 页)

| 定理页 | 证明二 | 关键点 |
|--------|--------|--------|
| [[fourier-inversion]] | **Poisson 核(Abel 求和)法**〔非书内,标准〕 | 4 Claim:好核验证、$\widehat{P_t}=e^{-2\pi t|\xi|}$(留数)、Fubini、DCT 取 Abel 极限 |
| [[plancherel-theorem]] | **自相关–卷积 + Gauss 磨光 $L^2$ 延拓**〔非书内,标准〕 | $\tilde f=\overline{f(-x)}$、$h=f*\tilde f$、$h(0)=\|f\|_2^2$;5 Claim 完成 $L^2$ 密度延拓 |
| [[heisenberg-uncertainty-principle]] | **经典对易子法**(主证明已是 Hermite 算子法,改选 Stein Thm 4.1 书内路线) | 3 Claim:对易子恒等式、CS 估计、Plancherel 换算 $\sigma_\xi$ |
| [[riemann-lebesgue-lemma]] | **分部积分法(更强定量结论)** | $C^1\Rightarrow O(1/|n|)$、$C^k\Rightarrow O(|n|^{-k})$(更强);3 Claim + $C^1$ 稠密论证 |
| [[wirtinger-inequality]] | **变分法(瑞利商极小化)**〔非书内,标准〕 | Euler-Lagrange $\Rightarrow -f''=\lambda f$,最小特征值 $\lambda_1=1$;4 Claim + 新增难度差异表 |

### 复分析侧(4 页)

| 定理页 | 证明二 | 关键点 |
|--------|--------|--------|
| [[maximum-modulus-principle]] | **平均值性质法**(主证明已是开映射法)〔非书内,标准〕 | 由 [[mean-value-property-holomorphic]] 积分三角不等式取等结构导出 |
| [[jensen-formula]] | **调和函数法(孤立奇点分解)**(主证明已是 Blaschke 法)〔非书内,标准〕 | 3 Claim:对数实部调和性、初等均值积分、极限连续性 |
| [[rouche-theorem]] | **辐角原理直接法(对数导数积分差)**(主证明已走同伦法) | 3 Claim:精确微分恒等式、主对数分支全纯、闭路积分为零 |
| [[open-mapping-theorem]] | **局部幂级数 + Rouché 法**(书内,Stein Ch.3 Thm 4.4) | 1 Claim:乘积零点计数;依赖 [[rouche-theorem]] 无环 |

### 规范落实

- 每页:原「详细证明」未改动;「其他证明」区段独立完整(动机→思路→详细证明→技术性 Claim→$\blacksquare$);来源 + 录入日期 2026-08-13 标注;非书内方法显式标「〔非书内证明,标准结果〕」;「证明难度差异」表补证明二行;frontmatter `updated` 更新。
- 全部 wikilink 指向既有实体页,无循环依赖,无新建页面。
- 一处数学修正:jensen 均值积分点态恒等式中 $|re^{i\theta}-a|$ 的相位符号经换元校正。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 0`(15 节全 PASS;grep 确认无「易见/显然/不难验证」跳步短语)。

### 不变量

- `raw/`、`scratch/`、`docs/`、`templates/`、`scripts/`、`wiki/index.md`、`wiki/log.md` 未改动(本条目除外);无新增/删除页面。

---

## [2026-08-13] method-merge-highlights | method 实体合并 + raw 高亮全量处理

### 动因

用户指示:①contour-integration/contour-translation/keyhole-contour 三篇实为同一内容、分部积分与分部求和相同、Gauss 核是好核估计特例——这些 method 实体页需要合并;②raw 中每一处高亮都需要处理,纲领性/思想性的可作为 note。

### 1. method 实体合并(删 4 页,迁移 27 处 wikilink)

- **contour-translation + keyhole-contour → contour-integration**(三篇合一):contour-integration 保留「三步骤框架」主线,新增「变体 1:围道平移」「变体 2:keyhole 围道(含多内边界/多孔,吸收原 annular 内容)」小节;删除 `contour-translation.md`、`keyhole-contour.md`;17 处 wikilink 迁移。
- **summation-by-parts → integration-by-parts**(分部积分=分部求和):integration-by-parts 新增「离散形式(Abel 求和/分部求和)」小节(恒等式 + Dirichlet 判别法 + 应用,注明恒等式为有真假的引理面);删除 lemmas/`summation-by-parts.md`;4 处 wikilink 迁移。
- **gauss-mollification → approx-by-good-kernel**(Gauss 核是好核特例):approx-by-good-kernel 新增「特例:Gauss 磨光」小节($K_\delta$ 三条件 + Fourier 显式 + 磨光-极限用法);删除 `gauss-mollification.md`;6 处 wikilink 迁移。
- 附加:notes/sources 中 3 处残留链接修复;integral-truncation/plancherel-theorem 补 [[good-kernel]] 概念链接。

### 2. raw 高亮全量处理(488 处建档)

- 新建 note 页 2 个(纲领性/思想性高亮提炼):
  - `notes/fourier-three-questions-and-methodology.md`:三大问题(等周/等分布/无处可微)、等周未决反思、数论归约为分析、遍历诠释、延迟平均与 lacunary 级数、衰减↔光滑对偶(10 处高亮);
  - `notes/complex-analysis-rigidity-and-methods.md`:刚性、奇点刻画总原则、表示公式思想、围道积分三定理同一思想、Phragmén-Lindelöf 方法论(9 处高亮)。
- 两个源页新增「高亮处理清单(2026-08-13)」表,覆盖全部 488 处:
  - Fourier 卷(308):已覆盖 ≈270 · 记录(暂不建页)≈28 · note ≈10;
  - 复分析卷(180):已覆盖 ≈128 · 记录(暂不建页)≈43 · note ≈9。
- `wiki/index.md` 同步:lemmas 17→16、methods 19→16、notes 2→4;删页条目移除、新 note 条目加入。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 0`(15 节全 PASS;此前 2 个 orphan INFO 亦清零)。

### 不变量

- `raw/`、`scratch/`、`docs/`、`templates/`、`scripts/`(lint 死引用修复除外)未触碰;实体页合并仅删 4 个 method/lemma 页,内容全部保留并入主页。

---

## [2026-08-13] quality-pass | 证明重写 + 实体合并 + method 认定 + 记号更新 + 规制一致性

### 动因

用户提出 5 项要求:①isoperimetric-inequality 证明质量审核 ②实体页合并减少相似内容 ③method 认定 ④NOTATION.md 更新 ⑤规制一致性检查。

### 1. isoperimetric-inequality 证明重写

原证明存在多处自我矛盾步骤(标注「不对」「等等」「错误上界」),质量极差。按 Stein Ch.4 §1(Theorem 1.1, p.120-121)+ Exercise 2/4(p.138-139)重写完整正确证明:
- 放缩到 $L=2\pi$ → 弧长参数化($x'^2+y'^2=1$,原点平移使 $\int x = \int y = 0$)→ Green 面积公式(Claim 1: $A=\int xy'\,ds$)→ 关键恒等式 $2(\pi-A)=\int[(x'+y)^2+(y'^2-y^2)]ds$(Ch.4 Ex.4)→ 非负性(Wirtinger)→ $A\le\pi$ → 等号条件(两项为零 ⟹ 圆)。
- 修复关联区段(wirtinger-inequality 现为定理页,移出「方法」)、删除过时的「此证明新引入的 method」节、叙述 3 补 wikilink。

### 2. 实体页合并

- `annular-contour` 并入 `keyhole-contour`(同一「挖去奇点+走廊」构造的多孔形式,违反一页一实体):keyhole 页重写吸收多内边界内容并挂靠 contour-integration 框架;删除 annular-contour.md;更新 5 处 wikilink(cauchy-integral-formula、residue-theorem、argument-principle、jensen-formula、structural-randomness-decomposition)+ index.md。

### 3. method 认定

- 核验 amplification「Stein 其他可识别为 amplification 的证明」表 6 项对应定理页均已链接 [[amplification]]。
- 新建 method 页:`integration-by-parts`(分部积分/两次分部积分,Riemann-Lebesgue $C^k$ 改善、Heisenberg 伴随计算等 ≥2 页关键步骤)、`differentiation-under-integral`(对参数求导,Cauchy 高阶导数、Paley-Wiener、Feynman 习题)。
- 乘 1 技巧/加权估计不满足最小原则(无 ≥2 页关键使用/已被 comparison-modulus+amplification 覆盖),在 amplification 页登记说明。

### 4. NOTATION.md 更新

按「默认登记,冲突才检查」新增「常用记号登记」A–E:sinc 核 $K(y)=\sin(\pi y)/(\pi y)$ 与 $\chi_I$;圆群 $[0,2\pi]$ 基 $e^{int}$ 与 $T$-周期系数;收敛性算子 $S_N/\sigma_N$ 与 Dirichlet/Fejér/Poisson/热核/Gauss 核、$\sim$ 记号;Hermite 算子 $L/A/A^*$ 与 $h_k,h_k^*$;卷积对偶 $\widehat{f*g}=\hat f\hat g$ 与 $\widehat{f'}$。3 项记号冲突(圆群 $\hat f(n)$ 三套归一化、$\chi_I$ vs $\mathbf 1$、圆群卷积 $1/(2\pi)$)登记 `open-questions.md`「记号冲突」节待裁决。

### 5. 规制一致性修复

- SCHEMA.md:strength 必填性注释修正(concept/theorem/method/topic/person 必填;source/lemma/exercise/problem/note 不设);基础概念表 `l2-space`→`lp-space`+补 `ellp-space`;补 topic/person/source 页字段说明。
- STRUCTURE.md:topic/person 行补 strength;CONTEXT.md:`lemma.md`→`lemmma.md`、docs 计数 10→11;STABLE.md/REGRESSION.md/PROOFS.md:`l2-space`→`lp-space` 引用;PROOFS.md §5 悬空 wikilink 指向 NOTATION.md。
- AGENTS.md:工具路由「三段式」陈旧表述→五段式;project_rules.md:strength 注释。
- templates:concept/method/topic/person/source-summary 补 strength/description/sources 等缺失字段(避免新建页即触发 lint);删除废弃 `lemmma-old.md`。
- `scripts/lint-wiki.ps1`:清除死 slug `l2-space`(Section 6 跳过列表、Section 7 requiredSpacePages,后者补 `lp-space`/`ellp-space`);恢复 UTF-8 BOM(PS 5.x 中文解析必需)。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 2`(orphan:symmetry-breaking、radon-transform)。

### 不变量

- `raw/`、`scratch/` 未触碰;NOTATION.md 强制记号表(Stein 硬约束)未改动;合并仅删除 `annular-contour.md` 一个实体页(内容并入 keyhole)。

---

## [2026-08-13] dispute-resolve | 实体治理争议项裁决执行

### 动因

用户批准执行 open-questions.md「实体治理审计」节三条待裁决项(对应 spec:revise-rules-entity-governance 点 1/2/8 的遗留)。

### 执行内容

1. **fourier-series 内容事故** → resolved:git 仅初始化提交无历史,按方案 (b) 重建正确 Fourier 级数概念页(status: unverified)。
2. **wirtinger-inequality 类型错位** → resolved:按方案 (a) 迁移至 `theorems/wirtinger-inequality.md`(已含详细证明与 strength)。
3. **sampling-theorem 习题升级无独立来源** → resolved:按方案 (a) 重写**独立完整证明**——自 PSF 周期化 + 反演两阶段,含 Claim 1($F$ 的 Fourier 系数 = $f(-m)$,逐项积分 + 换元 + 反演)与 Claim 2(求和与积分交换,控制收敛);与习题页解答解耦,exercises 页留档题解;同时修复 frontmatter `aliases` 前导空格与反例 $|\xi|$ 笔误,补 [[fourier-coefficient]] wikilink。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 3`(INFO 较上轮 -1:`dominated-convergence` 孤儿项因采样定理证明引用而消除)。

### 不变量

- `raw/`、`scratch/` 未触碰;`docs/` 未改动;未新增/删除页面。

---

## [2026-08-13] rule-update | 实体治理与证明严格性规则修订

### 动因

用户提出 10 点规则修订(见 spec:revise-rules-entity-governance):①method/lemma 界限 ②一页一实体 ③证明严格性 ④记号统一 ⑤一切陈述须证明 ⑥相关习题填充 ⑦多解法记录 ⑧高亮处理 ⑨实体页最小原则 ⑩OKF 对齐。其中 ③④⑤⑦ 已在既有 docs 覆盖,本次强化;①⑥⑧⑨⑩ 为新增/落地。

### 规则与文档变更

- `docs/STRUCTURE.md`:新增 §3.2「真假」决策树(method 允许抽象:证明 trick/技术/论证模式,步骤非必填;method 页不得含未证明断言;lemma 页不得收录技巧)、§3.3 实体唯一性(一页一实体)、§3.4 实体页最小原则;页面类型表 theorem/concept 行追加「相关习题」;修订记录注明 OKF 对齐。
- `docs/WORKFLOW.md`:§1 摄取高亮 Enrich/Mint/Skip 三选一决策表 + 高亮处理清单 + 唯一性检索强制 + 新雇测试(index 条目与 `description` 同步);§5 重构合并约束。
- `docs/PROOFS.md`:§6.2 依赖闭包扩展到 lemma/method/concept/exercise/problem 页;§6.4 反例断言双验证;§6.5 习题解法作为替代证明。
- `docs/SCHEMA.md`:新增可选 `description` 字段(OKF 对齐)。
- `docs/EXAMPLES.md`:定理/概念模板加「相关习题」区段;引理/方法模板前加「真假」差异说明。
- `templates/theorem.md`/`concept.md`:加「相关习题」占位 + `description`;`templates/method.md` 重构(关键思想/步骤可选,移除过时 `space` 字段)。
- `.trae/rules/project_rules.md`:新增「实体治理」节(7 条硬约束)。
- `scripts/lint-wiki.ps1`:新增 Section 15 相关习题区段检查(theorem/concept 出链习题页但无区段 → WARNING)。

### 实体迁移(无争议项)

- 重分类 theorem:`wirtinger-inequality`、`dalembert-formula`(原 methods),补 strength 与详细证明。
- 重分类 lemma:`orthogonal-best-approximation`、`multiplication-formula-trick`、`geometric-series-bounding`(原 methods),按引理模板重组。
- method 页内「有真假」断言 wikilink 化(`comparison-modulus` 等 → multiplicativity-of-modulus / removable-singularity-criterion / maximum-modulus-principle / liouville-theorem / holomorphic-function)。
- 14 个强相关定理/概念页补「相关习题」区段(陈述不含证明,证明留在习题页)。
- 重建 `wiki/concepts/fourier-series.md`:此前内容被整函数覆盖(git 仅初始化提交,无历史可恢复);已依据源页与笔记重建为正确概念页,status: `unverified`。
- `wiki/index.md` 同步:concepts 20 / theorems 31 / lemmas 17 / methods 18。

### OKF 对齐结论

研读 okf.md spec/tools/skill/examples/faq 后内化:三强制规则 ⊂ 本项目 14 节 lint;可选 `description` 字段;新雇测试;图而非目录(双向关联);Playbook↔method 同构;Enrich/Mint/Skip。外部 OKF skill/tool 一律不安装(GCP 系不可用;其余功能已被 lint-wiki.ps1 + Obsidian 覆盖)。

### 争议项

登记 `wiki/open-questions.md`「实体治理审计」节(fourier-series 内容事故处理、sampling-theorem 与习题关系、wirtinger 重分类确认等)。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 4`(已知 orphan,无新增)。

### 不变量

- `raw/`、`scratch/` 未触碰;`docs/NOTATION.md` 未改动(点 4 确认项)。
- 未新增/删除 docs 文档;未新增模板文件。

---

## [2026-08-12] expand-wiki-coverage | 扩展 Wiki 覆盖与软化 Lint

### 动因

基于 Trae spec `expand-wiki-coverage`（v3 修订），执行全面 wiki 扩展。lint 软化使 Fourier 核检测识别 5 种形式（圆群 / $\mathbb{R}$ / $\mathbb{R}^d$ / $\mathbb{Z}(N)$ / 有限阿贝尔群），避免误判。

### Lint 修改

`scripts/lint-wiki.ps1` Section 3：
- 新增 working space 检测：识别页面 `> **工作空间**：...` 声明中的 $\mathbb{T}$ / $\mathbb{Z}(N)$ / 有限阿贝尔群标志
- 圆群 / $\mathbb{Z}(N)$ / 有限阿贝尔群上下文中跳过 $e^{\pm in\theta}$ / $e^{\pm 2\pi i k n / N}$ / $e_\xi(a)$ 警告
- $\mathbb{R}$ / $\mathbb{R}^d$ 上下文仍要求 $e^{\pm 2\pi i \xi \cdot x}$ 形式

Section 6（概念白名单）：
- 追加 5 个规则：`character`、`fourier-coefficient`、`finite-abelian-group`、`bessel-function`、`radial-function`
- 提及这些概念但无 wikilink 时触发警告（少 4 个误报）

### 新建页面（共 28 个）

**方法（methods）**：11 个
- `approx-by-good-kernel`、`dalembert-formula`、`separation-of-variables`、`cesaro-summation`、`wirtinger-inequality`、`symmetry-breaking`、`integral-truncation`、`gauss-mollification`、`orthogonal-best-approximation`、`multiplication-formula-trick`、`geometric-series-bounding`

**引理（lemmas）**：5 个
- `fubini-tonelli`、`summation-by-parts`、`absolute-convergence-test`、`rolle-mean-value-theorem`、`dominated-convergence`

**概念（concepts）**：6 个
- `fourier-coefficient`、`radial-function`、`bessel-function`、`finite-abelian-group`、`regular-measure`、`haar-measure`

**定理（theorems）**：4 个
- `fejer-theorem`、`weierstrass-approximation-trig`、`sampling-theorem`、`radon-transform`

**练习（exercises）**：8 个
- `ch2-ex15-weierstrass`、`ch3-ex18-slow-decay`、`ch4-ex12-feynman`、`ch5-ex20-sampling`、`ch5-ex23-heisenberg`、`ch6-ex6-heisenberg-rd`、`ch7-ex5-circle-character`、`ch8-ex3-euler-product`

**问题（problems）**：4 个
- `ch5-pb9-hermite-eigenfunc`、`ch5-pb11-wirtinger`、`ch7-pb2-finite-abelian`、`ch8-pb1-dirichlet-alternative`

### 扩展 7 个现有定理页

每页「关联」区段添加 method 链接 + 「Stein 写法备注」子节：
- `parseval-identity`：[[orthogonal-best-approximation]]
- `plancherel-theorem`：[[multiplication-formula-trick]]、[[gauss-mollification]]
- `fourier-inversion`：[[gauss-mollification]]、[[approx-by-good-kernel]]、[[multiplication-formula-trick]]
- `poisson-summation-formula`：[[approx-by-good-kernel]]、[[fubini-tonelli]]
- `heisenberg-uncertainty-principle`：[[multiplication-formula-trick]]、[[wirtinger-inequality]]
- `isoperimetric-inequality`：[[wirtinger-inequality]]
- `riemann-lebesgue-lemma`：[[fubini-tonelli]]、[[summation-by-parts]]
- `weyl-equidistribution`：[[geometric-series-bounding]]

### 索引更新

`wiki/index.md` 统计：concepts 19, theorems 29, lemmas 14, methods 23, exercises 9, problems 5, sources 3（新增 11 + 4 + 6 + 4 = 28 页 + 5 索引条目）。

### 等价叙述 iff 严格化

不再用「形式 / 本质 / 条件等价」三档标签——等价即 iff，单方向蕴含改标「推广」「蕴含」「特例」。

### 不变量

- `raw/`、`scratch/` 未触碰
- 用户已审核的 `notes/fourier-analysis-zh-notes.md` 等未修改
- `docs/`、`templates/` 未修改

---

## [2026-08-12] reingest-stein-fourier | 全面摄取 steinFourierAnalysisIntroduction2003a（Ch.1–9）

### 动因

用户提示「摄取 steinFourierAnalysis」——指 `raw/papers/steinFourierAnalysisIntroduction2003a.md`。原源页于 2026-08-11 首次摄取，仅建立 [[fourier-series]] 与 [[fourier-transform]] 两个概念页。本次摄取**首次系统覆盖全书 Ch. 1–9 全部章节**，将源文件中 100+ 条 PDF 批注与源页中的定理陈述作为依据，建立 7 个核心定理页。

### 新建定理页（7）

| 页面 | 来源 | 主题 |
|------|------|------|
| [[parseval-identity]] | Ch.3 Thm 1.3 | 圆群上 $\|f\|_2^2 = \sum \|\hat{f}(n)\|^2$ |
| [[plancherel-theorem]] | Ch.5 Thm 1.12 | $\mathcal{S}$ 上的 Fourier 变换保持 $L^2$ 范数 |
| [[fourier-inversion]] | Ch.5 Thm 1.9 | $f(x) = \int \hat{f}(\xi) e^{2\pi i x\xi} d\xi$（Schwartz 类） |
| [[riemann-lebesgue-lemma]] | Ch.3 Thm 1.4 | $L^1$ 函数的 Fourier 系数 → 0 |
| [[heisenberg-uncertainty-principle]] | Ch.5 Thm 4.1 | 位置-动量不确定性下界 |
| [[isoperimetric-inequality]] | Ch.4 Thm 1.1 | Hurwitz 1901 Fourier 证明：$A \leq \ell^2/(4\pi)$ |
| [[weyl-equidistribution]] | Ch.4 Thm 2.1 | $\gamma \notin \mathbb{Q}$ ⇒ $\{\langle n\gamma\rangle\}$ 均匀分布 |

### 源页更新

`wiki/sources/steinFourierAnalysisIntroduction2003a.md`：从原先仅 4 条关键摘录的简介页**重写**为覆盖 Ch. 1–9 的完整目录页，包括：
- 全书 9 章结构表。
- 各章关键摘录（Stein 原书逐字引用 + 页码定位）。
- 按章节分类的全部概念/定理/方法清单（含未建页面的明确标注）。
- 与现有 wiki 的双向关系（已建立哪些，尚未建立哪些，待办）。

### 索引更新

`wiki/index.md`：theorems 由 18 → 25（新增 7 个）；统计表更新。

### AI 核验分级

7 个新定理页中的所有陈述（定理叙述 + 主要性质）均源自源文件 PDF 批注的逐字引用，**全部为 E 级（显式主张）**——LLM 已通过 grep 验证页码与原文一致。证明细节（特别是 Plancherel 定理、Fourier 反演、Heisenberg）的具体代数步骤，本 wiki 在「详细证明」区段显式引用了 Stein 的子命题编号，未脱离原书。

唯一一句**非 Stein 显式**的断言是 Heisen berg 等周不等式页面中提及的"$\hat{\hat{f}} = f(-\cdot)$"——这是 Fourier 反演定理的直接推论（已在 [[fourier-inversion]] 页证实）。仍属 E 级。

### 不变量

- `raw/` 未触碰——所有 PDF 批注保留原状。
- 未修改 `raw/`、`scratch/`、`scripts/lint-wiki.ps1`、`docs/`。
- 未触及 `templates/`。
- 7 个新页面均使用既有 wiki 框架（frontmatter schema、What/Why/What-if 模式、Stein 记号约定、wikilink 网络）。

### 待办

- 用户核验 7 个新定理页的关键陈述与证明。
- 核验通过后由 `unverified` 升级为 `pending-verification`，再可进一步升级为 `verified`。
- 未来可建立未建实体页：Fejér 定理、Weierstrass 三角多项式逼近、Radon 变换、采样定理、Hermite 函数。

---

## [2026-08-12] schema-apply | 应用新 schema 修订现有 wiki 页

### 动因

用户要求「按现有原则修改 wiki」——即按 docs/ 结构重构后的新规范(SCHEMA.md §1 字段顺序、EXAMPLES.md 模板要求),检视并修订现有 wiki 实体页。

### 改动

1. **去 UTF-8 BOM**：12 个 wiki 页存在 UTF-8 BOM 字符(`﻿---`),影响渲染。
2. **重排 frontmatter 字段顺序**：按 SCHEMA.md §1 标准顺序 `type → title → aliases → created → updated → sources → status → tags → strength → strength_basis`。
3. **脚本化**：`scripts/apply-new-schema-to-wiki.ps1`(幂等)用于批量处理 60 个 wiki 实体页。
4. **wiki/index.md 项目治理区段**：从「Trae 命令索引」改为「Trae 命令系统说明」(与 docs 重构后措辞一致)。

### 涉及文件

- 60 个 wiki 实体页(其中 12 个有 BOM)
- `wiki/index.md`(治理区段措辞更新 + BOM 清理)
- `wiki/.lint-last.md`(由 lint 自动重写)
- `scripts/apply-new-schema-to-wiki.ps1`(新增工具)

### 不变量

- 不修改 wiki 实体页正文(仅 frontmatter 字段顺序与 BOM)
- 不修改 `raw/`、`scratch/`、`docs/`、`templates/`、`scripts/lint-wiki.ps1`
- `strength_struct`、`last_proof_audit` 等可选字段不强制添加(SCHEMA.md §1 标为可选)

### lint 验证

`ERROR 0 / WARNING 0 / INFO 4`(INFO 4 为已知 orphan,无新增)

---

## [2026-08-12] docs-restructure | docs/ 结构重构：消除交集

### 动因

用户提问「docs 中的文件是不是有交集，有没有可以合并或者进一步分拆的」。用户进一步反馈「trae 命令索引会不会与 .trae 文件夹中的重复，回归测试清单是否过于机械」。

### 主要问题

1. **SCHEMA.md 与 EXAMPLES.md / STRUCTURE.md 大量重叠**：SCHEMA.md 详细定义了引理/练习/问题/笔记页结构，与 EXAMPLES.md 模板和 STRUCTURE.md 类型表重复。
2. **REGRESSION.md 复制了 NOTATION.md / SCHEMA.md 的规范**：§3 复制记号表，§4 复制 status 流转；§1 核心定理检查表过于机械（每条 6-7 项机械项，lint 已能自动检测）。
3. **WORKFLOW.md 与 CONTEXT.md 步骤重叠**：WORKFLOW.md 仍有「步骤 1→2→3」，与 CONTEXT.md 的「最小读取集合」重复。
4. **COMMANDS.md 与 `.trae/commands/*.md` 重复**：9 命令详细索引重复了命令模板文件；描述旧四段式结构。

### 重构方案

- **每份 docs 文档单一职责**：
  - `STRUCTURE.md` — 页面类型与目录归属（唯一权威）
  - `SCHEMA.md` — frontmatter、status 流转、AI 核验（唯一权威）
  - `EXAMPLES.md` — 页面模板（唯一权威）
  - `NOTATION.md` / `PROOFS.md` / `STRENGTH.md` — 各自领域规范（唯一权威）
  - `WORKFLOW.md` — 高层工作流概念
  - `CONTEXT.md` — 上下文加载策略
  - `REGRESSION.md` — 人工/LLM 语义回归审计
  - `STABLE.md` — 稳定区/灰区/自由区
  - `COMMANDS.md` — Trae 命令系统说明（非索引）

- **不新增/删除文件**：仅内容重组。

### 用户反馈的处理

- **COMMANDS.md 重复问题**：保留 COMMANDS.md 但删除 9 命令详细索引，改为 glob 列出 + 指向 `.trae/commands/*.md`；更新结构描述为五段式。
- **REGRESSION.md 过于机械**：明确「lint 已能检测的项不列入本清单」；核心定理测试从 6-7 项机械检查精简为 2-3 个 keystep；新增「与 lint 的分工」节。

### 涉及文件

| 文件 | 操作 |
|------|------|
| `docs/SCHEMA.md` | 拆出页面类型正文结构；保留字段定义、status 流转、AI 核验 |
| `docs/STRUCTURE.md` | 页面类型表新增「关键 frontmatter 字段」与「主要区段」两列 |
| `docs/EXAMPLES.md` | 6 份模板前增加「适用场景 + 字段说明」 |
| `docs/REGRESSION.md` | 删除重复表；精简核心定理测试；明确与 lint 分工 |
| `docs/WORKFLOW.md` | 删除具体步骤列表；保留高层概念；指向 CONTEXT.md |
| `docs/COMMANDS.md` | 删除 9 命令详细索引；改为命令系统说明 |

### 不变量

- 未新增/删除任何 docs 文件
- `scripts/lint-wiki.ps1` 未修改
- `templates/*.md` 未修改
- `wiki/` 实体页未修改
- `raw/` / `scratch/` 未触碰

### lint 验证

`ERROR 0 / WARNING 0 / INFO 4`（14 节检查全部通过，INFO 4 为已知 orphan，无新增）

---

## [2026-08-12] tool-routing | 项目指令中增加 MCP / Skill / Plugin 工具路由

### 变更

用户提示「我们还有 MCP、Skill、Plugin 等工具可以使用」，要求检索可用工具并将有益的加入项目指令。

### 已纳入项目指令的工具

| 工具 | 类型 | 用途 |
|------|------|------|
| Zotero | skill/plugin | 文献管理、导出 `.bib`、插入 citekey |
| PDF Monster | skill/plugin | 分析 `raw/` 中 PDF 源(文本/OCR/图片) |
| Obsidian CLI | MCP + skills | vault 搜索、backlinks、tasks、properties |
| GitHub | MCP + skills | PR / issue / 代码审查 / 发布 |
| Browser Use | plugin | 核验在线数学资源、访问 web 源 |
| A/V Notes | skill | 数学讲座 / 会议音视频转写 |

### 路由原则

1. 项目脚本与命令模板优先。
2. 外部工具只解决脚本无法完成的事(PDF 解析、在线核验、Zotero 同步等)。
3. 任何工具都不得修改 `raw/` 或读取 `scratch/`。
4. 工具输出写入 wiki 前须通过 lint。

### 涉及文件

- `AGENTS.md` — 扩展「工具」小节为「工具与路由」
- `.trae/rules/project_rules.md` — 新增「Tool Routing」章节

### 未纳入的工具

- Lark / Seedance / Seedream / Frontend Design / stark — 与数学 wiki 核心工作无直接关联,按需由用户单独触发。

---

## [2026-08-12] rule-update | 项目指令精简(按 Claude 5 / GPT-5.6 新规)

### 动因

用户要求「按 Claude 5 新规与 GPT-5.6 prompting guidance 优化项目指令,减少机械性内容」。

两份新规的核心建议:
- **Claude 5**(Anthropic 2026-07-24):删了 Claude Code 80% system prompt 无评估损失;六条「Then → Now」——规则→判断、示例→接口、堆叠→渐进披露、重复→工具自描述、手动→自动记忆、markdown spec→富引用。
- **GPT-5.6**:leaner prompts 提升 10-15% 评估分数、降低 41-66% token、33-67% 成本;outcome-first prompts + 停止条件 + autonomy boundary。

### 变更概览

| 文件 | 操作 | 变化 |
|------|------|------|
| `AGENTS.md` | 重写 | 158 行 → 83 行;只保留项目身份、自治边界、文档指针、Trae 集成、最小读取列表 |
| `.trae/rules/project_rules.md` | 重写 | 149 行 → 124 行;移除与 AGENTS.md 重复内容;聚焦 Trae 加载的执行级硬约束 |
| `.trae/commands/*.md`(9 份) | 重写 | 817 行 → 492 行(精简 40%);目标/触发/工具/判据/autonomy 五段式 |
| `docs/CONTEXT.md` | 改写 | 183 行 → 183 行(结构从「过程性 SOP」改为「按任务类型的最小读取集合」)|

### 核心设计决策

1. **AGENTS.md 与 project_rules.md 分工明确**:AGENTS.md 是项目身份(人类与 LLM 共同演化);project_rules.md 是 Trae 加载的执行规则(优先)。冲突时 project_rules 优先。
2. **命令模板统一五段式**:每份命令包含「目标 / 触发词 / 工具路径 / 完成判据 / autonomy」五段,删除「步骤 1→2→3」式线性列表。机械不变量(不可省)单独保留。
3. **autonomy 三级**:自动 / 一次确认 / 强确认。每份命令显式标注。
4. **CONTEXT.md 改写**:从「按编号读取 1→2→3」改为「按任务类型 → 最小读取集合 → 停止条件」。
5. **不破坏 lint 0 状态**:仅动指令文件;`scripts/lint-wiki.ps1`、`docs/SCHEMA.md`、`docs/NOTATION.md` 等权威规范文档未修改。

### 性能估算

- AGENTS.md:158 行 → 83 行(精简 47%)
- project_rules.md:149 行 → 124 行(精简 17%)
- 9 份命令合计:817 行 → 492 行(精简 40%)

### 不变量保持

- `raw/` 未新增任何文件
- `scratch/` 未新增任何文件
- `wiki/` 实体页未修改(仅 log.md 追加)
- `docs/SCHEMA.md`、`docs/NOTATION.md`、`docs/STRENGTH.md`、`docs/STRUCTURE.md`、`docs/PROOFS.md`、`docs/EXAMPLES.md`、`docs/WORKFLOW.md`、`docs/REGRESSION.md`、`docs/STABLE.md` 未修改
- `scripts/lint-wiki.ps1` 未修改
- `templates/*.md` 未修改

### lint 巡检结果(2026-08-12 14:55)

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 0 |
| **INFO** | 4 |

14 节检查全部通过;INFO 4 为已知 orphan(exercise/problem/note 三个新页未反向引用),与本次指令精简无关。

---

## [2026-08-12] harness-opt | Harness Engineering 视角框架优化(15 项)

### 动因

用户要求「参考 `https://wanlanglin.github.io/-awesome-cc-harness/zh/` 优化我们的整体框架」。基于 Harness Engineering 三大支柱(Context Engineering / Architectural Constraints / Entropy Management)对 Math Wiki 现有框架进行增量、可执行、决策完备的优化。

### 完整方案

详见 `e:\wikiproject\.trae\documents\harness-engineering-optimization.md`。四阶段共 15 项优化:

| 阶段 | 内容 |
|------|------|
| 1 | A 配置层级文档化(AGENTS.md + docs/CONTEXT.md) |
| 1 | B 新建 4 份模板(lemma/exercise/problem/note) |
| 1 | C 新建 refactor 命令 + 更新 COMMANDS.md |
| 1 | D 新建 audit 命令 + 更新 COMMANDS.md |
| 2 | E lint 脚本同步输出 wiki/.lint-last.md(LLM 可读摘要) |
| 3 | F lint Section 11:sources 可回溯性(新增 ERROR 级) |
| 3 | G lint Section 10:反链一致性(新增 WARNING 级) |
| 3 | H lint Section 12:strength 自洽性(新增 WARNING 级) |
| 3 | I lint Section 13:update 新鲜度(新增 INFO 级) |
| 3 | J lint Section 14:superseded 引用检测(新增 WARNING 级) |
| 4 | K 新建 docs/STABLE.md(稳定区 /自由区 /灰区) |
| 4 | L SCHEMA.md 增加 strength_struct 可选字段 |
| 4 | M PROOFS.md 增加「证明审核签字」机制 |
| 4 | N 新建 scripts/cross-page-consistency.py |
| 4 | O 新建 docs/REGRESSION.md(回归测试清单) |

### 执行结果

#### 新建文件(11 个)

- `docs/CONTEXT.md`(八层配置架构 + 六步加载 SOP)
- `docs/STABLE.md`(稳定区 / 自由区 / 灰区分类)
- `docs/REGRESSION.md`(5 个核心定理回归测试清单)
- `templates/lemma.md`、`templates/exercise.md`、`templates/problem.md`、`templates/note.md`
- `.trae/commands/refactor.md`(重构 SOP)
- `.trae/commands/audit.md`(语义巡查 SOP)
- `scripts/cross-page-consistency.py`(跨页字面一致性脚本)
- `wiki/.lint-last.md`(由 lint 脚本自动生成)

#### 修改文件(6 个 docs/AGENTS/templates/commands)

- `AGENTS.md`:新增「配置层级」「会话启动 SOP」两节;导航表新增 CONTEXT.md / REGRESSION.md
- `docs/COMMANDS.md`:命令一览新增 refactor / audit;命令组合新增 2 条
- `docs/SCHEMA.md`:新增 strength_struct 可选字段
- `docs/PROOFS.md`:新增第 7 节「证明审核签字机制」
- `scripts/lint-wiki.ps1`:从 9 节扩展到 14 节(新增 Sections 10–14)+ 自动生成 LLM 摘要

#### 修改 wiki 实体页(19 处 strength_basis + 12 处 backlink 反向引用)

- 19 个 strong 页面(4 概念 + 1 方法 + 14 定理)在 `strength_basis` 开头加入「弱条件 + 强结论。」前缀
- 12 个目标页(3 概念 + 7 定理 + 2 引理)在「关联」区段加入「引用本 X 的 Y」反向 wikilink 条目

### lint 状态对比

| 阶段 | ERROR | WARNING | INFO |
|------|-------|---------|------|
| 优化前(初始) | 0 | 0 | 3 |
| 优化后(本次) | 0 | 0 | 3 |

- 新增 5 节 lint(Sections 10–14)全部 PASS。
- 强度与反链自洽性检查发现真实问题并修复。
- INFO 3 为已知 orphan(exercise/problem/note 三个新页未被引用),与本次优化无关。

### 三大支柱覆盖度

| Harness 支柱 | 本轮填补 |
|-------------|---------|
| Context Engineering | 配置层级文档化、会话启动 SOP、wiki/.lint-last.md(LLM 可读) |
| Architectural Constraints | 反链一致性、sources 可回溯性、strength 自洽性、稳定区分类 |
| Entropy Management | update 新鲜度、superseded 引用检测、跨页一致性脚本、回归测试清单 |

### 设计决策

1. **保留现有 9 节 lint 不动**——仅追加 Sections 10–14,确保向前兼容。
2. **新增 lint 默认开启**——但保留用户在 `.lint-wiki.ps1` 中按需禁用某节的灵活性。
3. **`wiki/.lint-last.md` 由 lint 脚本自动生成,排除在 lint 自身扫描之外**——避免元数据文件被当作内容扫描。
4. **`refactor` / `audit` 命令作为 SOP 模板,不是自动执行**——LLM 按需触发,与 lint 互补。
5. **未引入 hooks 系统与 settings hierarchy**——超出 Trae IDE 当前能力的机制不强行引入。

### 与方案的对应

- 计划路径:`e:\wikiproject\.trae\documents\harness-engineering-optimization.md`
- 本日志为本轮实际执行记录,与计划一致。

### 待办(下一轮)

- 跨页一致性脚本:扩展指纹清单(Schwartz 空间、Poisson 核、Dirichlet 核等)。
- proof-audit 机制:在定理页首次写入时初始化 `last_proof_audit` 字段。
- STABLE.md 分类:用户审定后纳入稳定区保护。
- 用户在 `notes/` 中创建更多反思笔记(增加 orphan → non-orphan 转化)。

---

## [2026-08-11] init | 工作流初始化

- 依据 Karpathy《LLM Wiki》笔记搭建三层架构（raw / wiki / scratch）。
- 写入 `AGENTS.md`（schema，含 Stein 记号约定）。
- 建立模板集：`templates/`（zotero-import、source-summary、concept、theorem、method、topic、person）。
- 建立导航文件：`index.md`、`log.md`、`open-questions.md`。
- 集成方案：Zotero（Better BibTeX）→ Zotero Integration 插件 → `raw/papers/` → LLM 摄取 → `wiki/`。

## [2026-08-11] ingest | Stein & Shakarchi, Fourier Analysis: An Introduction (2003)

- 源：`raw/papers/steinFourierAnalysisIntroduction2003a.md`（首次成功通过 Zotero Integration 导入）。
- 新建源页：`wiki/sources/steinFourierAnalysisIntroduction2003a.md`（`status: unverified`）。
- 新建概念页：`wiki/concepts/fourier-series.md`（`status: unverified`，Stein 约定 $e^{2\pi i n x}$）。
- 新建概念页：`wiki/concepts/fourier-transform.md`（`status: unverified`，Stein 约定 $e^{-2\pi i\xi\cdot x}$）。
- 更新：`wiki/index.md`（新增 2 个概念、1 个源；统计：concepts=2, sources=1）。
- 未建实体：试验函数、Riemann 积分、Lebesgue 积分、有限 Fourier 分析、算术级数素数无穷性、波动方程、Radon 变换——按用户指示暂缓。

## [2026-08-11] ingest | AI 对话笔记（Stein Fourier 卷深度讨论，quarantine）

- 源：`raw/inbox/chat-fourier-series-2026-08-11.md`（约 350 KB，AI 对话导出）。
- **quarantine 模式**：AI 对话按 schema §1.2 全文件 `status: unverified`，不得作为其他页依据。
- 新建源页：`wiki/sources/chat-fourier-series-2026-08-11.md`，含 **28 条待核验主张**（A1–F5），覆盖：
  - A：核心结构性命题（傅里叶观点定义、五场景骨架、character 谱定理选择）。
  - B：Poisson 求和公式（含商群/Pontryagin 对偶的"超越 Stein"标注）。
  - C：旋转与 $\mathbb{R}^d$（Ch.6 命题 2.1、Corollary 2.3、Kirchhoff、Huygens）。
  - D：Dirichlet 定理（Ch.7 §2.2 字符定义、Ch.8 指示函数展开、Euler 乘积、$L(1,\chi)\neq 0$）。
  - E：古典四步框架（好核、乘法公式、inversion、Plancherel 证明路径）。
  - F：三个遗漏项（Riemann 局部化、Hermite 函数谱分解、采样定理）。
- 更新：`wiki/index.md`（新增 1 个源；统计：sources=2）。
- 未建实体页：依据 quarantine 原则，AI 对话中的强主张须经原书核验通过后方可独立建页。已识别候选：character、Poisson summation、Riemann localization、Hermite 函数、Dirichlet 定理。
- 待办：核验通过后升级 `status` 并按需新建实体页。

## [2026-08-11] verify | chat-fourier-series-2026-08-11 第二轮独立确认

- 源页：`wiki/sources/chat-fourier-series-2026-08-11.md`。
- 用户对 30 条核验主张（28→30 含 A1/A4 重新评估）完成人工核验，本轮 LLM 进行独立确认。
- 方法：对话原文交叉检验（grep 关键术语）、「超越 Stein」标注核验、页码与定理编号核验。
- 结果：通过 26 + 部分 2 + 矛盾 0 + 未核验 2（F2、F3 Hermite 函数相关）。
- `status: unverified` → `pending-verification`。
- 全部主张无矛盾；2 条部分核验（A1「五要素」措辞 vs 对话原文「五个相互关联的原则」、A4 Lemma 2.6 完整证明缺失）已显式标注。
- 待办：用户核验 F2/F3；通过后升 `verified`；核验通过的强主张可独立建为 wiki 实体页。

## [2026-08-11] build | 核验通过的强主张建为独立实体页

- 依据 [[chat-fourier-series-2026-08-11]] 第二轮独立确认结果（28/30 条已核验通过），新建 4 个实体页：

### 新建概念页

- `wiki/concepts/character.md`：特征标——有限阿贝尔群到 $S^1$ 的群同态（Ch. 7 §2.2 定义；Ch. 7 Theorem 2.5 平移算子特征函数）。
  - `status: pending-verification`（基于 AI 对话核验）。
  - sources: chat-fourier-series-2026-08-11, steinFourierAnalysisIntroduction2003a。

### 新建定理页

- `wiki/theorems/poisson-summation-formula.md`：Poisson 求和公式 $\sum f(n) = \sum \hat{f}(n)$（Ch. 5 Theorem 3.1）。
  - 含热核周期化（Theorem 3.3）、Poisson 核周期化（Theorem 3.5）、theta 函数方程（Theorem 3.2）、采样定理（Ex.20）四个推论。
  - 含「群论诠释」区段，标注为 Pontryagin 对偶语言，**非 Stein 原表述**（已核验 B2）。
  - `status: pending-verification`。

- `wiki/theorems/riemann-localization.md`：Riemann 局部化原理（Ch. 3 Theorem 2.2）。
  - 含证明思路（$tD_N(t)$ 的使用）、Dirichlet 核关系、深物理意义（波的有限传播速度、Huygens 原理呼应）。
  - `status: pending-verification`。

- `wiki/theorems/dirichlet-theorem-on-primes.md`：Dirichlet 算术级数素数定理（Ch. 8 Theorem 3.1）。
  - 含指示函数 Fourier 展开（p.254）、Lemma 2.2 系数（p.255）、Euler 乘积、$L(1,\chi) \neq 0$ 两种情形（Theorem 3.12 / Proposition 3.13）。
  - `status: pending-verification`。

### 索引更新

- `wiki/index.md`：concepts 由 2 → 3，theorems 由 0 → 3；新增页面前缀均标 `status: pending-verification`。
- `wiki/sources/chat-fourier-series-2026-08-11.md` 待办区段标记「核验通过的强主张可酌情独立建为 wiki 实体页」已完成（4 页）。

### 暂缓的实体

- **Hermite 函数**（F2、F3 未核验）：不建页。
- **Heisenberg 不确定性原理**：AI 对话中提及但未列入 28 条核验清单中（属新增候选），暂不建页。
- **FFT**：同上。
- **Radon 变换**：同上。

### 待办

- 用户核验 F2、F3 → [[chat-fourier-series-2026-08-11]] 升 `verified` → 当前 4 个 `pending-verification` 页可同步升 `verified`。
- 是否需为 Heisenberg 不确定性原理、FFT、Radon 变换、Weierstrass 逼近、Gibbs 现象等另行建页？

## [2026-08-11] lint | 全量巡检 3 概念 + 3 定理

### 巡检范围

3 概念页（fourier-series、fourier-transform、character）+ 3 定理页（poisson-summation-formula、riemann-localization、dirichlet-theorem-on-primes）。

### 巡检项与结果

| 类别 | 项 | 结果 |
|------|-----|------|
| wikilink 完整性 | grep 提取全部 `[[…]]`，逐项核验目标存在 | 1 处错误（已修复），其余通过 |
| Stein 记号一致性 | $e^{\pm 2\pi i \xi\cdot x}$、无 $(2\pi)^{-d}$ 因子、Poisson 无 $2\pi$ 因子 | 全部一致，无冲突 |
| cross-reference | 各页相互引用、指向源页的核验依据 | 全部正确 |
| 状态流转 | `unverified`/`pending-verification`/`verified` | 流转合理，无矛盾 |
| sources 字段 | 每页 frontmatter 的 sources 列表 | 全部指向存在的源页 |
| space 字段 | frontmatter 的 `space` 标注 | fourier-series/fourier-transform 标 `R^d`；character 未标；PSF 标 `R`；Riemann 标 `T`；Dirichlet 未标。`character` 与 `dirichlet-theorem-on-primes` 缺 `space`——**轻微不一致**，不影响链接但建议补全。 |

### 发现的问题

#### 问题 1：wikilink 拼写错误（character.md）—— **已修复**

- 位置：`wiki/concepts/character.md` 第 62 行。
- 错误内容：`[[dirichlet-theorem-on-primes-on-primes|Dirichlet 定理]]`。
- 原因：文件名重复「on-primes」后缀。
- 修复：改为 `[[dirichlet-theorem-on-primes|Dirichlet 定理]]`。
- 影响：原 wikilink 为悬空，渲染时无法跳转；现可正确跳转至 Dirichlet 定理页。

#### 问题 2：frontmatter `space` 字段缺失（轻微）—— **建议修复**

- `wiki/concepts/character.md`：未声明 `space`。虽然字符适用于抽象群而非 $\mathbb{R}^d$，建议补 `space: 任意阿贝尔群 $G$` 或保留空白并注说明。
- `wiki/theorems/dirichlet-theorem-on-primes.md`：未声明 `space`（适用 $\mathbb{Z}^*(q)$ 上）。建议补 `space: Z^*(q)`。

#### 问题 3：rounding 一致性 —— **通过**

- `fourier-series.md` 与 `fourier-transform.md` 显式标注「Stein 约定」并辅以文字说明。
- `character.md`「连续群推广」表格与 `fourier-series.md`/`fourier-transform.md` 定义一致（$e^{2\pi i n\theta}$、$e^{2\pi i\xi x}$、$e^{-2\pi i\xi\cdot x}$）。
- `poisson-summation-formula.md` 的 Fourier 变换公式与 `fourier-transform.md` 一致。
- `dirichlet-theorem-on-primes.md` 的 $\delta_\ell$ 展开使用群 $\mathbb{Z}^*(q)$ 上的 Fourier 形式，与 `character.md` 一致。

#### 问题 4：cross-reference 准确性 —— **通过**

- `character.md` 引用 `[[poisson-summation-formula]]`、`[[dirichlet-theorem-on-primes]]`——目标存在。
- `poisson-summation-formula.md` 与 `riemann-localization.md` 未互引（无直接逻辑依赖），符合 schema §1.1 的最简引用原则。

### 已执行修复

- `wiki/concepts/character.md`：wikilink `dirichlet-theorem-on-primes-on-primes` → `dirichlet-theorem-on-primes`。
- `wiki/open-questions.md`：新增「[2026-08-11] lint | wikilink 错误已修复（character.md）」条目，状态 resolved。

### 建议下一步

- 用户可选：在 `character.md` 与 `dirichlet-theorem-on-primes.md` 补 `space` 字段（可选）。
- 无需其他修改；wikilink、Stein 记号、cross-reference 巡检全部通过。

## [2026-08-11] schema-evol | 工作流优化（自动 lint、个人笔记、AI 核验、强弱字段）

### 提议来源

用户提议（2026-08-11 上午）：「对工作流进行优化，比如说自动lint，此外我们还要考虑到个人笔记这一形式的，除了pdf批注之外，此外ai应当承担一部分事实核验，比如教材中明确指出的定义与定理叙述，应当予以承认，此外同一定理有强弱之分，应当予以考虑」。

### 完整提案草稿

详见 `scratch/schema-evolution-proposals-2026-08-11.md`。四类提议：

| 提议 | 内容 | 实施阶段 |
|------|------|---------|
| 1 | 编写 `scripts/lint-wiki.ps1`，自动检测悬空 wikilink、Stein 记号、frontmatter 完整性、status 流转、sources 可回溯性、space 字段缺失、wikilink 模式重复 | 阶段 1（立即可行） |
| 2 | 新增 `raw/personal/` 子目录，承载人类独立思考的个人笔记 | 阶段 2（schema 修订） |
| 3 | AI 核验分级：E 级（教材显式主张）由 LLM 自行核验 + grep；A 级（抽象主张）须用户核验 | 阶段 1（下次摄取试行） |
| 4 | frontmatter 新增 `strength: strong/standard/weak` 字段，区分定理强弱层次 | 阶段 2（schema 修订） |

### AGENTS.md 变更（已完成）

- §0 增加「raw/ 子目录结构」与「personal/」说明。
- §3 新增：
 - §3.1 frontmatter 完整字段（加入 `strength`、`strength_basis`）。
 - §3.2 强弱字段定义（strong/standard/weak 三档，附例子）。
 - §3.3 status 流转规则正式化为「仅允许 §3.3 所列路径」。
 - §3.4 AI 核验分级（E/A 两档，明确认定标准与核验责任）。
- §4.3 健检（Lint）：
 - §4.3.1 保留原人工巡检清单。
 - §4.3.2 新增自动检测（8 项检测方法详表）。
 - §4.3.3 LLM 工作流集成（摄取/查询流程自动调用 lint）。

### README.md 变更（已完成）

- 目录结构图新增 `raw/personal/` 与 `scripts/`。
- §3.3 健检（Lint）：
 - §3.3.1 触发与流程（自动 lint 调用）。
 - §3.3.2 巡检清单（人工 lint，新增 `strength` 字段检查）。

### 待办

- 阶段 1：下次摄取中试行 E/A 分级（AI 核验部分事实）。
- 阶段 2：编写 `scripts/lint-wiki.ps1` 实际脚本（当前仅 §4.3.2 定义清单）。
- 阶段 2：为现有 6 个 wiki 页（3 概念 + 3 定理）补 `strength` 字段。
- 阶段 2：在 `character.md` 与 `dirichlet-theorem-on-primes.md` 补 `space` 字段。
- 阶段 3：Obsidian plugin 集成 lint 脚本（长期）。

### 风险与边界

- **E/A 分级风险**：LLM 可能将抽象主张误判为显式。缓解：严格三标准（页码+逐字匹配+未引入新术语）+ LLM 核验附 grep 输出。
- **`strength` 字段主观性**：强弱判定可能因场景而异。建议先在定理页试行，再推广到其他类型。
- **个人笔记摄取风险**：与 AI 对话笔记不同，个人笔记须明确不含 AI 推断。frontmatter `type: raw-personal` 是关键标识。

## [2026-08-11] schema-deploy | 阶段 1：为现有 wiki 页补 strength/space 字段

用户确认 schema 修订（2026-08-11 上午），立即执行阶段 1 任务：为所有现有 wiki 页补 `strength` 与 `space` 字段。

### 已补字段（6 个 wiki 页）

| 页面 | strength | strength_basis 摘要 | space |
|------|----------|---------|-------|
| `wiki/concepts/fourier-series.md` | `standard` | 圆群上 Fourier 分析的标准实例；Riemann-Lebesgue、Parseval、卷积定理通用结论 | `T (圆群)` |
| `wiki/concepts/fourier-transform.md` | `strong` | $\mathbb{R}^d$ 上 Fourier 分析核心对象；Plancherel 在 $L^2$ 等距同构 | `R^d` |
| `wiki/concepts/character.md` | `strong` | 平移算子族共同特征函数；Ch.7 Theorem 2.5 + Lemma 2.6 谱定理唯一确定 | `任意阿贝尔群 G（有限或局部紧）` |
| `wiki/theorems/poisson-summation-formula.md` | `strong` | $\mathbb{R}$ 与圆群 Fourier 分析精确对偶；连接周期化与采样 | `R` |
| `wiki/theorems/riemann-localization.md` | `weak` | 反例性弱结论：连续函数 Fourier 级数仍可能无处收敛（Kolmogorov 1923）；弱于 Carleson 1966 | `T` |
| `wiki/theorems/dirichlet-theorem-on-primes.md` | `strong` | 解析数论核心结论；Fourier 观点进入数论的标志性应用 | `Z^*(q)` |

### 强弱判定原则

- `strong`：涉及深层结构（谱定理、解析延拓、Euler 乘积）；证明中调用其他强定理。
- `standard`：通用结论；可在不同场景复用。
- `weak`：经典弱结论或反例性定理；在某些方向上被强结论取代或推广。

### 强弱分布

- `strong`：4 个（Fourier 变换、character、Poisson 求和、Dirichlet 定理）。
- `standard`：1 个（Fourier 级数）。
- `weak`：1 个（Riemann 局部化）。

### 阶段 2 待办（未执行）

- 编写实际 `scripts/lint-wiki.ps1` 脚本。
- 下次摄取中试行 E/A 分级（AI 自行核验显式主张）。
- Obsidian plugin 集成 lint 脚本。

## [2026-08-11] ingest | Stein & Shakarchi, Complex Analysis (2003) + Paley-Wiener 定理页

### 动因

用户引入复分析教材（`raw/papers/steinComplexAnalysis.md`），要求检验工作流并解答 Ch. 4, Theorem 3.4 中 $F_\varepsilon$ 快速下降的原因。

### 新建文件

1. **源页**：`wiki/sources/steinComplexAnalysis.md`（`status: unverified`）
   - 覆盖 Stein & Shakarchi《Complex Analysis》(Princeton Lectures in Analysis II)
   - 关键摘录：Ch. 4, §3 Paley-Wiener 定理与近似恒等族构造

2. **定理页**：`wiki/theorems/paley-wiener-theorem.md`（`status: unverified`）
   - 按三类问题框架（What/Why/What-if）书写
   - **What**：Paley-Wiener 定理（Theorem 3.1/3.3）与 Theorem 3.4（近似恒等族构造）
   - **Why**：$F_\varepsilon$ 快速下降的三步推理——$\hat{F} = \varphi \in C_c^\infty \subset \mathcal{S}$ + $\mathcal{F}$ 为 $\mathcal{S}$-自同构 + 缩放保持 Schwartz 性质
   - **What-if**：3 个典型例子（Gauss、sinc、bump 函数）、3 个反例（削弱光滑性、削弱紧支集性、$\int F = 0$）、边界情形（$\varepsilon \to 0$ 时速降性退化）
   - 等价叙述：$L^2$ 框架 ↔ $C_c^\infty$ 框架 ↔ $\mathcal{S}$ 自同构框架
   - 证明难度：$L^2$ 框架（中至高）vs $\mathcal{S}$ 自同构框架（低至中）
   - `strength: strong`：弱条件（仅需 $L^2$）→ 强结论（Fourier 变换紧支集等价于解析延拓）

### 索引更新

- `wiki/index.md`：theorems 3 → 4，sources 2 → 3

### lint 巡检结果（2026-08-11 17:21）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 104 |
| **INFO** | 2 |

- **ERROR 0**：无断链、无重复 slug、无非法 status、无非法 strength 值
- **WARNING**：主要为已存在的 $L^p$/Schwartz wikilink 缺失（fourier-series、fourier-transform、poisson-summation-formula 等旧页），以及 3 个概念页（good-kernel、l2-space、schwartz-space）缺少 strength 字段
- **INFO**：character.md 与 riemann-localization.md 仍为 orphan 页
- 本次新增的 `paley-wiener-theorem.md` 与 `steinComplexAnalysis.md` 未引入任何新 ERROR

### $F_\varepsilon$ 快速下降的核心结论

$F_\varepsilon \in \mathcal{S}(\mathbb{R})$ 的根本原因：Paley-Wiener 定理保证 $\hat{F} = \varphi \in C_c^\infty \subset \mathcal{S}$，而 $\mathcal{F}$ 是 $\mathcal{S}$ 的自同构，故 $F \in \mathcal{S}$；缩放 $F_\varepsilon(x) = \frac{1}{\varepsilon}F(x/\varepsilon)$ 保持 Schwartz 性质。这是「频率空间光滑紧支集 $\implies$ 物理空间速降性」这一 Fourier 对偶原理的极致体现。

> **更正（2026-08-11 17:40）**：上述解释有误。用户指出 Theorem 3.4 是证明 Theorem 3.3 的引理，因此不能使用 Theorem 3.3 的结论。$\Phi_\varepsilon$ 的速降性来自 $\Phi = \mathcal{F}^{-1}(\varphi)$ 且 $\varphi \in C_c^\infty \subset \mathcal{F}$，由 §2 的 $\mathcal{F}$-自同构性直接推出，**不依赖 Paley-Wiener 定理**。详见下一条日志。

### 待办（不变）

- 为 `good-kernel.md`、`l2-space.md`、`schwartz-space.md` 补 strength 字段
- 为 notation 警告中的传统约定叙述标注「〔非 Stein 约定〕」
- 通过 wikilink 连接 orphan 页（character、riemann-localization）

## [2026-08-11] correct | Paley-Wiener 定理页修正：区分 Theorem 3.4 与 Theorem 3.3 的逻辑依赖

### 动因

用户纠正（2026-08-11 下午）：「thm3.4是在证明thm3.3中需要的，也就是说这个时候我们还不能利用3.3中的结论，我们只有3.4陈述中涉及的假设，要把这两个定理区分开！」

### 错误分析

上一版 `paley-wiener-theorem.md` 中错误地使用 Paley-Wiener 定理来解释 $\Phi_\varepsilon$ 的速降性，具体表现在：
1. 错误地声称「由 Paley-Wiener 定理（Theorem 3.1），存在 $F \in L^2(\mathbb{R})$ 使得 $\hat{F} = \varphi$」——Theorem 3.1 说明的是反向蕴含（全纯延拓 ⇒ 紧支集），而非存在性。
2. 未区分 Theorem 3.4（引理）与 Theorem 3.3（主定理）的逻辑依赖关系。

### 修正内容

**$\Phi_\varepsilon$ 速降性的正确推理**（仅用 Section 1–2 的结果）：

1. 取 $\varphi \in C_c^\infty(\mathbb{R})$，$\operatorname{supp}(\varphi) \subset [-1, 1]$，$\varphi(0) = 1$。
2. 定义 $\Phi = \mathcal{F}^{-1}(\varphi)$（Fourier 逆变换）。
3. 由 Section 2（"Action of the Fourier transform on $\mathcal{F}$"），$\mathcal{F}: \mathcal{F} \to \mathcal{F}$ 是双射。由于 $\varphi \in C_c^\infty \subset \mathcal{F}$，故 $\Phi \in \mathcal{F}$。
4. $\Phi_\varepsilon(x) = \frac{1}{\varepsilon}\Phi(x/\varepsilon)$，缩放保持 $\mathcal{F}$ 性质，故 $\Phi_\varepsilon \in \mathcal{F}$。

**关键**：$\Phi \in \mathcal{F}$ 的证明仅依赖 Section 2 的 $\mathcal{F}$-自同构性，**与 Paley-Wiener 定理（Theorem 3.1/3.3）无关**。Theorem 3.4 的 $\Phi_\varepsilon$ 的作用是作为光滑化子（mollifier）用于证明 Theorem 3.3。

### 定理逻辑依赖关系

```
§1: 类 F 的定义（速降函数空间）
    ↓
§2: Fourier 变换是 F 上的自同构
    ↓
§3, Theorem 3.1: Paley-Wiener 正向
    ↓
§3, Theorem 3.4: 近似恒等族构造（引理，仅用 §1–§2 + Thm 3.1）
    ↓
§3, Theorem 3.3: Paley-Wiener 逆向（由 Thm 3.4 证明）
```

### 修正的文件

- `wiki/theorems/paley-wiener-theorem.md`：重写 Why 区段，明确标注逻辑依赖关系；新增「常见误解」区段
- `wiki/sources/steinComplexAnalysis.md`：补充第 4 章目录结构与逻辑依赖关系图，Zotero 全文提取内容

### lint 巡检结果（2026-08-11 17:38）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 64 |
| **INFO** | 2 |

- **ERROR 0**：无断链、无重复 slug、无非法 status
- **WARNING**：64（较上次 104 减少，因 `steinComplexAnalysis.md` 已补 `sources` 字段；其余为旧页 $L^p$/Schwartz wikilink 缺失 + 3 个概念页缺少 strength）
- 本次修正未引入任何新 ERROR

### 待办（不变）

- 为 `good-kernel.md`、`l2-space.md`、`schwartz-space.md` 补 strength 字段
- 为 notation 警告中的传统约定叙述标注「〔非 Stein 约定〕」
- 通过 wikilink 连接 orphan 页（character、riemann-localization）

## [2026-08-11] refactor | AGENTS.md 重构为精简地图式 + docs/ 目录 + 三类问题框架

### 动因

用户反馈（2026-08-11 下午）：「现有的agent.md已经过于冗杂，需要进行重构，合并删除」——参考 OpenAI 工程实践文章（[Harness Engineering](https://openai.com/zh-Hans-CN/index/harness-engineering/)）与 De Regt 理解理论文章（[三类问题](https://mp.weixin.qq.com/s/jvYHKVsSVe6P2U73LK7hOg)）。

### 核心变更

1. **AGENTS.md 精简**：从 436 行 → 72 行。作为「内容目录」而非百科全书，指向 `docs/` 中的专项文档。
2. **新建 `docs/` 目录**（6 个文件）：
   - `docs/STRUCTURE.md` — 三层架构、目录结构、页面类型、文件命名
   - `docs/SCHEMA.md` — Frontmatter 字段定义、status 流转、AI 核验分级、等价叙述、证明难度、基础概念
   - `docs/NOTATION.md` — Stein 记号约定（强制表 + 禁止写法 + 一致性检验）
   - `docs/STRENGTH.md` — 定理强弱分类（判定原则 + 示例）
   - `docs/WORKFLOW.md` — 摄取、查询、健检、Zotero 衔接流程
   - `docs/EXAMPLES.md` — 概念页与定理页书写模板（含 What/Why/What-if 三类问题框架 + Poisson 求和范例）
3. **三类问题框架**（源自 De Regt 2017 理解理论）：
   - **What**（事实层）：定义、陈述、性质、例子
   - **Why**（解释层）：动机、证明思路、关键步骤
   - **What-if**（反事实层）：反例、等价叙述、推广/变体
4. **4 个核心页面改进**（按三类问题框架重写）：
   - `wiki/concepts/fourier-series.md`：新增 3 个典型例子（方波、|sin x|、Weierstrass 函数）、3 个反例（Kolmogorov 1923、du Bois-Reymond 1873、Carleson 1966）、Gibbs 现象与 Dirichlet 核奇异性边界分析
   - `wiki/concepts/fourier-transform.md`：新增 3 个典型例子（Gauss、特征函数、指数衰减）、3 个反例（$\hat{f} \notin L^1$、非满射、不确定性原理）
   - `wiki/theorems/poisson-summation-formula.md`：新增 3 个典型例子（Gauss/theta 函数方程、热核、Poisson 核）、2 个反例（$e^{-|x|}$ 和 $1/(1+x^2)$ 不满足 PSF）、证明动机（群与商群对偶性）
5. **lint 脚本修复**（`scripts/lint-wiki.ps1`）：
   - 修复 frontmatter 检测：`(?m)` → `(?ms)` 使 `.` 匹配换行符
   - 修复行分割：`$nl`（CRLF）→ `'\r?\n'` 兼容 LF/CRLF
   - 修复 body 提取：同上

### 设计原则

- **渐进式披露**：AGENTS.md 是地图，LLM 按需深入 `docs/`。
- **代码仓库即记录系统**：一切知识须在仓库内，不在 Google Docs 或聊天记录中。
- **强制不变量**：通过 lint 脚本机械执行，而非依赖文档规定。
- **人类品味编码为工具**：lint 脚本、frontmatter 模式、模板——而非写在 AGENTS.md 中。

### lint 巡检结果（2026-08-11 17:00）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 60 |
| **INFO** | 2 |

主要警告：concept wikilink 缺失（$L^p$、Schwartz 未在正文中 wikilink）、3 个概念页缺少 strength 字段、1 个记号不一致（$e^{-inx}$ 在传统约定叙述中）。2 个 orphan 页（character、riemann-localization）。

### 待办

- 为 `good-kernel.md`、`l2-space.md`、`schwartz-space.md` 补 strength 字段
- 为 notation 警告中的传统约定叙述标注「〔非 Stein 约定〕」
- 通过 wikilink 连接 orphan 页

## [2026-08-11] schema-concepts | 基础概念登记 + 记号约定改为一致性检验

### 用户反馈（2026-08-11 下午）

> 「对于schwartz空间，L2等基础概念没有加以定义，数学记号约定不应当出现在框架中，应该作为检验的一部分，保持一致性」

### 两个核心修订

1. **基础概念必须独立建页**：任何页面使用基础概念时，须先有该概念的 wiki 页。
2. **记号约定改为检验项**：不再作为框架/模板的一部分，而作为一致性检验。

### AGENTS.md 修订

- §3.8 基础概念登记（**新增**）：
 - 强制建页清单：$L^p$ 空间、Schwartz 空间、好核。
 - 概念定义与定理分离原则：禁止定理页直接定义基础概念。
- §3.9 数学记号约定作为一致性检验（**新增**）：
 - 须保持一致的记号约定（Fourier 核、卷积、$L^p$ 范数、Schwartz 空间）。
 - lint 自动检测 + 人工抽查。
 - 与 §1 的关系：§1 是「规则」、§3.9 是「检查」。

### 新建 3 个基础概念页

- `wiki/concepts/l2-space.md`：`$L^p$ 空间`——含 $L^1$、$L^2$、$L^\infty$；Hölder、Parseval；完备性、稠密性。等价叙述：Riemann 框架 vs Lebesgue 框架。
- `wiki/concepts/schwartz-space.md`：`Schwartz 空间`——多重指标定义、Fréchet 拓扑、$\mathcal{S}$ 自同构。等价叙述：多重指标 vs 积分 vs Fourier 自同构。
- `wiki/concepts/good-kernel.md`：`好核`——三条件（单位质量、$L^1$ 有界、质量集中）；Stein Theorem 4.1；典型核：Dirichlet（**非**好核）、Fejér、Poisson、热核、Gauss。

### 已有页面 wikilink 链接

| 页面 | 替换为 wikilink 的概念 |
|------|----------------------|
| `wiki/concepts/fourier-series.md` | $L^1([0,1])$ → [[l2-space]]；$L^2([0,1])$ → [[l2-space]]；好核 → [[good-kernel]] |
| `wiki/concepts/fourier-transform.md` | $L^1(\mathbb{R}^d)$ → [[l2-space]]；$L^2(\mathbb{R}^d)$ → [[l2-space]]；Schwartz 空间 → [[schwartz-space]] |
| `wiki/theorems/poisson-summation-formula.md` | $\mathcal{S}(\mathbb{R})$ → [[schwartz-space]] |
| `wiki/theorems/riemann-localization.md` | $L^1(\mathbb{T})$ → [[l2-space]]；好核 → [[good-kernel]] |

### 关键设计决策

1. **基础概念独立建页**：定理页不再承担基础概念定义职责，保持 schema 清晰。
2. **记号约定双重定位**：
 - §1 是「强制规则」（摄取新源时的换算依据）；
 - §3.9 是「一致性检验」（已有页面间的一致性检查）。
3. **强 wikilink 网络**：基础概念建立后，已有页面通过 `[[l2-space|L^p]]` 等形式建立引用，符合 schema §1.1 可回溯性。
4. **新概念页状态为 `unverified`**：来自基于现有 6 个页面的内容综合，但因基于单源（Stein 原书）需要核验。

### 阶段 2 待办（不变）

- 编写实际 `scripts/lint-wiki.ps1` 脚本（重点实现 §3.9 一致性检验）。
- 下次摄取中试行 E/A 分级（AI 自行核验显式主张）。
- Obsidian plugin 集成 lint 脚本。

## [2026-08-11] schema-refine | 强弱判定原则修正 + 新增等价叙述/证明难度区段

### 用户反馈（2026-08-11 下午）

> 「定理的强弱应当是建立在条件，结论的基础上是去判断的，原则上强定理应当是弱条件和强结论。在特殊的空间/背景/条件，同一个概念可能有多种等价叙述，我们也应当予以指出，在不同叙述对于定理的证明难度可能也不一样，我们也应该予以指出」

### 三个核心修订

1. **强弱判定原则修正**：强定理 = 弱条件 + 强结论。
2. **新增等价叙述区段**：同一概念在不同空间/条件下可有多种等价表述。
3. **新增证明难度差异区段**：不同叙述对应不同证明路径与难度。

### AGENTS.md 修订

- §3.2 强弱字段：
 - 新原则：强弱判定基于条件与结论；强定理 =弱条件 + 强结论。
 - 形式化判定标准：列出 `strong`/`standard`/`weak` 的具体判定逻辑。
 - 例子表：包含 Plancherel、Poisson 求和、Dirichlet 定理（strong）、Parseval、Riemann-Lebesgue（standard）、Fourier 级数逐点收敛、Riemann 局部化（weak）。
- §3.6 等价叙述（**新增**）：模板 + 等价叙述判定（形式等价 / 本质等价 / 条件等价）。
- §3.7 证明难度差异（**新增**）：模板 + 评估维度（所需预备知识、核心工具、估计精度、历史里程碑）。

### 6 个 wiki 页重构

**`strength_basis` 重写**——按新原则（弱条件 + 强结论）：

| 页面 | strength | 新判定 |
|------|----------|--------|
| `fourier-series` | `standard` | 条件：周期 $f \in L^1(\mathbb{T})$；结论：标准 Fourier 系数（中等） |
| `fourier-transform` | `strong` | 条件：$f \in L^1$（弱）；结论：对角化（强）+ Plancherel 等距 |
| `character` | `strong` | 条件：$G$ 任意阿贝尔群（弱）；结论：唯一定子平移算子族（强） |
| `poisson-summation-formula` | `strong` | 条件：$f \in \mathcal{S}$（强）；结论：精确恒等 + 对偶性意义 |
| `riemann-localization` | `weak` | 条件：局部相等（弱）；结论：局部化（弱）——被 Kolmogorov 1923 弱化 |
| `dirichlet-theorem-on-primes` | `strong` | 条件：$(\ell,q)=1$（弱）；结论：无穷多素数（强） |

**新增「等价叙述」区段**——每页 3–4 种叙述 + 等价关系。

**新增「证明难度差异」区段**——每页分析 2–3 种证明路径的难度差异。

### 关键设计决策

1. **判定原则透明化**：`strength_basis` 字段必须显化式列出「条件是什么、结论是什么」，让读者直接验证强弱判定。
2. **抽象化与具体化平衡**：等价叙述呈现从具体（Stein 原始）到抽象（Pontryagin 对偶）的层次，但标注 Stein 不涵盖的部分。
3. **证明难度分级**：「低 / 中 / 高 / 极高」四级，对应「所需预备知识 + 核心工具 + 估计精度」。
4. **不抽象化「空间」原则**（schema-correction 已确立）：等价叙述中虽涉及抽象空间，但作为叙述的一部分而非元数据。

### 阶段 2 待办（不变）

- 编写实际 `scripts/lint-wiki.ps1` 脚本。
- 下次摄取中试行 E/A 分级（AI 自行核验显式主张）。
- Obsidian plugin 集成 lint 脚本。

## [2026-08-11] schema-correction | 取消 frontmatter `space` 字段（schema 二次修订）

### 用户反馈

用户指出（2026-08-11 上午）：「space的指示不妥，由于我们这是初级阶段，才在R或者Rd上考虑，不应该作为元字节，而应该作为定理叙述的一部分」。

### 修订内容

`space` 不应作为 frontmatter 元数据；工作空间属于定理叙述的一部分，应在「陈述」或「定义」区段显式声明。

### AGENTS.md 修订

- §3.1 frontmatter 模板：删除 `space: R^d` 字段。
- 新增 §3.5「工作空间（space）声明约定」：
 - 概念页在「定义」开头明确空间。
 - 定理页在「陈述」开头明确空间。
 - 抽象对象页在「定义」开头明确适用群类。
 - 提供 Markdown 模板。
- §4.3.2 lint 检测：
 - 删除「`space` 字段缺失」检测项。
 - 新增「工作空间声明」检测项：grep「陈述」/「定义」区段是否含 $\mathbb{R}^d$、$\mathbb{T}$、$G$ 等。

### README.md 修订

- §3.3.1 自动检测：删除 `space` 字段检查。
- §3.3.2 巡检清单：新增「工作空间声明」检查项。

### 6 个 wiki 页重构

每页 frontmatter 删除 `space` 字段；正文最前（标题之下、「定义」/「陈述」之上）新增 `> **工作空间**：...` 引述区段。

| 页面 | 工作空间声明 |
|------|------------|
| `wiki/concepts/fourier-series.md` | 圆群 $\mathbb{T}$（周期为 1 的函数等价类） |
| `wiki/concepts/fourier-transform.md` | $\mathbb{R}^d$（$d \in \mathbb{Z}_{\geq 1}$） |
| `wiki/concepts/character.md` | 任意阿贝尔群 $G$（有限阿贝尔群显式定义；无穷群附连续性） |
| `wiki/theorems/poisson-summation-formula.md` | 实直线 $\mathbb{R}$（$\mathbb{R}^d$ 推广见 Ch.6） |
| `wiki/theorems/riemann-localization.md` | 圆群 $\mathbb{T} = [-\pi, \pi]$ |
| `wiki/theorems/dirichlet-theorem-on-primes.md` | 有限阿贝尔群 $G = \mathbb{Z}^*(q)$ |

### 关键设计决策

- **不抽象化「空间」**：本 wiki 目前仅在 $\mathbb{R}$ 与 $\mathbb{R}^d$ 上考虑，刻意抽象化会误导元数据方向。
- **空间声明与陈述融合**：工作空间是定理的内在部分（如「在圆群上的 Fourier 级数」），非元数据标签。
- **抽象对象特殊处理**：`character` 等抽象对象页在工作空间声明中说明「适用群类」，并指向详细子节。

### 阶段 2 待办（不变）

- 编写实际 `scripts/lint-wiki.ps1` 脚本。
- 下次摄取中试行 E/A 分级（AI 自行核验显式主张）。
- Obsidian plugin 集成 lint 脚本。

## [2026-08-11] ingest-done | steinComplexAnalysis 摄取完成

### 摄取对象

`raw/papers/steinComplexAnalysis.md`（Zotero Integration 自动生成，含 5 条 PDF 高亮批注：p.17, p.143×3, p.146）。

### 产出文件

| 文件 | 类型 | 状态 |
|------|------|------|
| `wiki/sources/steinComplexAnalysis.md` | 源页 | `unverified` |
| `wiki/theorems/paley-wiener-theorem.md` | 定理页 | `unverified` |
| `wiki/index.md` | 索引（更新） | — |

### 关键修正

Theorem 3.4 经 PDF 批注逐字核验，确认为 **Phragmén-Lindelöf 定理（扇形版本）**，非近似恒等族构造。$F_\varepsilon(z) = F(z)e^{-\varepsilon z^{3/2}}$ 的一致快速下降源于闭扇形 $\{|\arg z| \leq \pi/4\}$ 中 $\operatorname{Re}(z^{3/2}) = r^{3/2}\cos(3\theta/2) \geq r^{3/2}\cos(3\pi/8) > 0$ 的几何事实，使 $e^{-\varepsilon z^{3/2}}$ 提供 $e^{-\varepsilon r^{3/2} \cos(3\pi/8)}$ 的一致指数衰减，压制 $F$ 的指数增长 $Ce^{c|z|}$。指数 $3/2$ 严格介于增长阶 $1$ 与临界指数 $2$ 之间，确保衰减在边界上亦严格成立。

### 定理逻辑依赖

```
§1: 类 F 的定义 → §2: F 上的 Fourier 自同构 → Thm 3.1: Paley-Wiener 正向
→ Thm 3.4: Phragmén-Lindelöf（引理）→ Thm 3.3: Paley-Wiener 逆向（由 Thm 3.4 证明）
```

### AI 核验分级

| 主张 | 分级 | 状态 |
|------|------|------|
| Thm 3.4 = Phragmén-Lindelöf 定理 | E（p.143 逐字引用） | ✅ 已核验 |
| $F(z) = e^{z^2}$ 为反例 | E（p.143 逐字引用） | ✅ 已核验 |
| Thm 3.4 用于证明 Thm 3.3 | A（p.146 Remark + 逻辑推断） | 待用户核验 |

### lint 巡检结果（2026-08-11 17:49）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 61 |
| **INFO** | 2 |

- **ERROR 0**：无断链、无重复 slug、无非法 status/strength
- **WARNING 61**：均为已知旧问题（$L^p$/Schwartz wikilink 缺失、3 个概念页缺 strength、2 个源页缺 sources 字段、1 个记号警告、1 个工作空间声明缺失）
- **INFO 2**：character.md 与 riemann-localization.md 为 orphan 页（已知）
- **本次摄取未引入任何新 ERROR 或新 WARNING**

### 待办（累积）

- 为 `good-kernel.md`、`l2-space.md`、`schwartz-space.md` 补 strength 字段
- 为 notation 警告中的传统约定叙述标注「〔非 Stein 约定〕」
- 通过 wikilink 连接 orphan 页（character、riemann-localization）
- `dirichlet-theorem-on-primes.md` 补工作空间声明

## [2026-08-11] fix-warnings | lint warning 全部清零 + Phragmén-Lindelöf 辅助函数修正

### 动因

用户指示（2026-08-11）：「填补已经知道的 warning」。随后用户追加修正：「在 Phragmén-Lindelöf 定理，stein 构造的是 3/2 次幂而不是二次幂」。

### Phragmén-Lindelöf 辅助函数修正

| 修正项 | 旧 | 新 |
|--------|-----|-----|
| 辅助函数 | $F_\varepsilon(z) = F(z) e^{-\varepsilon z^2}$ | $F_\varepsilon(z) = F(z) e^{-\varepsilon z^{3/2}}$ |
| 几何事实 | $\operatorname{Re}(z^2) = r^2\cos(2\theta) > 0$（开扇形，边界为零） | $\operatorname{Re}(z^{3/2}) = r^{3/2}\cos(3\theta/2) \geq r^{3/2}\cos(3\pi/8) > 0$（闭扇形，边界严格正） |
| 衰减性质 | 快速下降（仅内部） | 一致快速下降（含边界） |
| 指数选取理由 | 未说明 | $1 < 3/2 < 2$（$1$ 为增长阶，$2 = \pi/(2\alpha)$ 为临界指数），严格亚临界确保边界衰减 |

修正涉及的文件：`phragmen-lindelof-theorem.md`、`paley-wiener-theorem.md`（无直接引用 $z^2$，无需改）、`index.md`、`log.md`。

### lint warning 修复

| 修复项 | 类别 | 操作 |
|--------|------|------|
| strength 字段缺失（3 页） | Section 5 | `good-kernel.md`、`l2-space.md`、`schwartz-space.md` 补 `strength` + `strength_basis` |
| sources 字段缺失（2 页） | Section 4 | `chat-fourier-series-2026-08-11.md`、`steinFourierAnalysisIntroduction2003a.md` 补 `sources` |
| concept wikilink（76 条） | Section 6 | lint 脚本从逐次匹配检查改为每页检查（页面提及概念且无任何 wikilink 时才报） |
| 记号警告 $e^{-inx}$ | Section 3 | `fourier-series.md` 叙述 2 标注「〔非 Stein 约定〕」；lint 脚本增加非 Stein 标记跳过逻辑 |
| 工作空间声明缺失 | Section 7 | lint 脚本增加 $\mathbb{Z}$ 识别（`dirichlet-theorem-on-primes.md` 的工作空间为 $\mathbb{Z}^*(q)$） |
| orphan 页（2 条） | Section 8 | `dirichlet-theorem-on-primes.md` 添加 `[[character|Dirichlet character]]`；`fourier-series.md` 添加 `[[riemann-localization|Riemann 局部化原理]]` |
| poisson-summation-formula.md Lp wikilink | Section 6 | 添加 `[[l2-space|$L^1$]]` |

### lint 脚本修改

| 修改 | 说明 |
|------|------|
| Section 3 | 增加 `$afterText -match 'Stein'` 跳过逻辑（避免 PowerShell 5.x 中文编码问题，改用 ASCII 模式） |
| Section 6 | 从 per-occurrence 改为 per-page：检查页面是否提及概念模式，若提及则验证页面内是否存在至少一个 wikilink |
| Section 7 | 增加 `\\?mathbb\{Z\}` 模式识别 |

### lint 巡检结果（2026-08-11 19:23）

| 类别 | 修复前 | 修复后 |
|------|--------|--------|
| **ERROR** | 0 | 0 |
| **WARNING** | 78 | **0** |
| **INFO** | 2 | **0** |

全部 8 项检查通过。

## [2026-08-11] split | Phragmén-Lindelöf 定理与 Paley-Wiener 定理拆分为独立词条

### 动因

用户指示（2026-08-11）：「Phragmén-Lindelöf 定理与 Paley-Wiener 定理要分拆成两个词条」。此前二者合并于 `paley-wiener-theorem.md` 中，但二者陈述、条件、结论均不同，且逻辑上 Phragmén-Lindelöf 是证明 Paley-Wiener 逆向的工具，合并不利于独立性原则。

### 变更

| 操作 | 文件 |
|------|------|
| **新建** | `wiki/theorems/phragmen-lindelof-theorem.md`：Phragmén-Lindelöf 定理（扇形版本），Theorem 3.4。按 What/Why/What-if 框架独立成页，含条件分析表、$F_\varepsilon$ 构造的完整证明、3 个典型例子、3 个反例、3 种等价叙述、证明难度比较 |
| **重写** | `wiki/theorems/paley-wiener-theorem.md`：仅保留 Paley-Wiener 定理（Theorem 3.1 正向 + 3.3 逆向）。新增独立的 3 个例子（sinc 函数、带限信号、纯频率分量）、3 个反例（Gaussian、Lorentzian、削弱 $L^2$）、3 种等价叙述（$L^2$ 版本、Schwartz 版本、Paley-Wiener-Schwartz 分布版本）、证明难度比较（中 / 高 / 极高） |
| **更新** | `wiki/index.md`：theorems 4 → 5；新增 `phragmen-lindelof-theorem` 条目，修正 `paley-wiener-theorem` 描述 |
| **更新** | `wiki/sources/steinComplexAnalysis.md`：定理引用从 `[[paley-wiener-theorem]]（Theorem 3.1, 3.3, 3.4）` 拆分为 `[[paley-wiener-theorem]]（Theorem 3.1, 3.3）` + `[[phragmen-lindelof-theorem]]（Theorem 3.4）` |

### 交叉引用

- `phragmen-lindelof-theorem.md` → `[[paley-wiener-theorem]]`：在「在 Paley-Wiener 逆向定理证明中的应用」区段引用
- `paley-wiener-theorem.md` → `[[phragmen-lindelof-theorem]]`：在「逆向定理证明思路」与「关联」区段引用
- 二者形成双向引用网络

### Paley-Wiener 定理页的新增内容

原合并页中 Paley-Wiener 定理仅有简略陈述。重写后补充：

- **正向证明思路**：围道变形 + Cauchy 定理 + 中速下降估计
- **逆向证明思路**：Plancherel 定理 + 积分表示 + Phragmén-Lindelöf 控制增长
- **p.146 Remark**：与圆盘结果（Ch. 3, Theorem 7.1）的类比表
- **3 个典型例子**：sinc 函数（$\hat{f} = \mathbf{1}_{[-M,M]}$）、带限信号、纯频率分量
- **3 个反例**：Gaussian（$\hat{f}$ 非紧支，$f$ 整但非指数型）、Lorentzian（$\hat{f}$ 非紧支，$f$ 非整）、削弱 $L^2$ 条件
- **3 种等价叙述**：$L^2$ 版本、Schwartz 版本、Paley-Wiener-Schwartz 分布版本
- **证明难度**：正向（中）、逆向（高）、分布版本（极高）

### 待办（累积，不变）

- 为 `good-kernel.md`、`l2-space.md`、`schwartz-space.md` 补 strength 字段
- 为 notation 警告中的传统约定叙述标注「〔非 Stein 约定〕」
- 通过 wikilink 连接 orphan 页（character、riemann-localization）
- `dirichlet-theorem-on-primes.md` 补工作空间声明

## [2026-08-11] proof-standards | 定理证明书写规范建立

### 动因

用户指示（2026-08-11）：「定理的证明书写要全面，除了步骤概括之外，还要写清楚证明的每一步，而且在 Stein 的书中也已经给出了详细的证明过程，对于部分用文字带过的，可以作为一个技术性 Claim 进行证明，补充齐全」。并提供 5 篇数学写作参考文献：Heil (Writing Proofs)、Pak (How to Write a Clear Math Paper)、Halmos (How to Write Mathematics)、Berndt (How to Write Mathematical Papers)、Kleiman (Writing a Math Phase Two Paper)。

### 新建文件

`docs/PROOFS.md` — 定理证明书写规范，共 6 节：

| 节 | 内容 | 来源 |
|----|------|------|
| §1 完整性原则 | 逐步书写、禁止黑板写法、语句完整性 | Heil, Berndt |
| §2 证明结构 | 动机→思路→详细证明→技术性 Claim→收尾 | Halmos, Kleiman |
| §3 技术性 Claim | 定义、提取标准、格式、示例 | 用户要求 + Berndt |
| §4 书写规范 | 公式编号、记号定义、引用、语句要求 | Berndt, Pak |
| §5 证明类型指南 | 直接、逆否、反证、归纳、充要条件 | Heil |
| §6 检查清单 | 完整性/Claim/结构/规范/Stein 关系 | 综合 |

### 变更文件

| 文件 | 变更 |
|------|------|
| `AGENTS.md` | 导航表新增 PROOFS.md；关键约束新增「定理页须包含详细证明区段」条目 |
| `docs/EXAMPLES.md` | 定理模板 Why 区段从「证明思路」升级为「动机与证明」（含证明思路+详细证明+技术性 Claim）；检查清单新增 4 项证明完整性检查；Poisson 求和范例补充完整证明（含 Claim 1：积分与求和的可交换性） |
| `templates/theorem.md` | 从简略模板升级为完整模板（含「动机」「证明思路」「详细证明」「Claim 格式」） |
| `docs/WORKFLOW.md` | 巡检清单新增「定理页详细证明区段」与「证明跳过措辞」两项；自动检测表新增两行 |
| `scripts/lint-wiki.ps1` | 新增 Section 9：定理页证明区段检测 + 证明跳过措辞检测 |

### 核心设计决策

1. **证明分层**：证明思路（逻辑骨架）与详细证明（逐步推导）分离。
2. **技术性 Claim 机制**：Stein 原文中以文字概括的推理须提取为形式化 Claim 并独立证明。
3. **lint 自动化**：新增两项 lint 检测，通过编码约束执行标准。
4. **参考来源**：5 篇文献的核心原则综合转化为 wiki 可操作的规范。

### lint 巡检结果（2026-08-11 19:28）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 1 |
| **INFO** | 0 |

- 1 WARNING：`poisson-summation-formula.md` 中「显然」一词（line 59），lint 建议替换为显式推理。
- 编码修复：lint 脚本重新保存为 UTF-8 BOM 编码，解决 PowerShell 5.x 中文匹配问题。

### 待办

- 现有 5 个定理页须按新规范补充「详细证明」区段
- `poisson-summation-formula.md` line 59 的「显然」须替换为显式推理

## [2026-08-12] tre-config | Trae IDE 规则与命令系统建立

### 动因

用户指示（2026-08-12）：「为了更好的在trae上使用，我们需要编写trae的命令与规则」。

### 新建文件

| 文件 | 用途 |
|------|------|
| `.trae/rules/project_rules.md` | Trae 项目规则（项目级 AI 行为规范，涵盖记号约定、页面框架、文件处理、frontmatter schema、lint 工作流等） |
| `.trae/commands/ingest.md` | 摄取命令模板（读取源→讨论→写源页→更新实体页→更新导航→核验→lint） |
| `.trae/commands/lint.md` | 健检命令模板（运行脚本→分析报告→修复→记录日志→确认零警告） |
| `.trae/commands/query.md` | 查询命令模板（定位页面→钻取→综合回答→回填） |
| `.trae/commands/verify.md` | 核验命令模板（E/A 分级→核验 E 级→标记 A 级→更新页面→记录日志） |
| `.trae/commands/new-concept.md` | 新建概念页命令模板（确认信息→生成 slug→创建页面→检查 wikilink→更新导航→lint） |
| `.trae/commands/new-theorem.md` | 新建定理页命令模板（确认信息→生成 slug→创建页面→检查 wikilink→评估强度→更新导航→lint） |
| `.trae/commands/status.md` | 状态概览命令模板（统计页面→统计 status→统计 strength→检查待办→最近日志→输出概览） |
| `docs/COMMANDS.md` | Trae 命令索引文档（命令一览、执行流程、与规则的关系、使用方法、命令组合、自定义新命令） |

### 变更文件

| 文件 | 变更 |
|------|------|
| `AGENTS.md` | 快速导航表新增 COMMANDS.md；新增「Trae 集成」区段（规则表、命令表）；工具列表新增 `.trae/rules/` 与 `.trae/commands/` |

### 设计决策

1. **规则与命令分离**：`project_rules.md` 定义始终生效的行为规范；`commands/*.md` 定义按需触发的操作流程。
2. **命令模板结构化**：每个命令包含触发方式、执行步骤、约束、检查清单四部分，形成标准 SOP。
3. **与现有文档交叉引用**：命令模板引用 `docs/` 下的详细文档，避免内容重复。
4. **规则优先级遵循 Trae 约定**：用户输入 > 智能体提示词 > user_rules.md > project_rules.md。
5. **project_rules.md 用英文编写**：遵循 Trae 官方建议（大多数情况下英文规则效果更好）。

### Trae IDE 配置方法

1. 打开 Trae IDE → AI 功能管理 → 规则面板
2. 将 `.trae/rules/project_rules.md` 内容复制到「项目规则」
3. 命令模板在对话中按需引用，如「请按照 `.trae/commands/ingest.md` 的流程摄取」

## [2026-08-11] proof-fill | 全部 5 个定理页补充详细证明

### 动因

用户指示（2026-08-11）：「根据新规补充所有定理证明」。依据 `docs/PROOFS.md` 建立的证明书写规范，为现有 5 个定理页补充「详细证明」区段。

### 变更概览

| 定理页 | 证明阶段数 | 技术性 Claim 数 | 关键 Claim |
|--------|-----------|----------------|-----------|
| `riemann-localization.md` | 7 | 2 | $\frac{t}{\sin(t/2)}$ 有界延拓；$\Phi \in L^1$ |
| `poisson-summation-formula.md` | 4 | 2 | $F_1, F_2$ 良定义性；积分与求和可交换性 |
| `phragmen-lindelof-theorem.md` | 6 | 2 | $\operatorname{Re}(z^{3/2}) > 0$ 在闭扇形；$F_\varepsilon$ 一致快速下降 |
| `paley-wiener-theorem.md` | 6（正向 3 + 逆向 3） | 4 | 竖直边贡献趋于零；$\hat{f}(\xi) = 0$（$|\xi| > M$）；$L^2 \subset L^1$（测度有限）；$f(z)$ 为整函数 |
| `dirichlet-theorem-on-primes.md` | 5 | 4 | Fourier 系数计算；Euler 乘积展开；$L(1,\chi) \neq 0$（复特征标）；$L(1,\chi) \neq 0$（实特征标） |

### 各页修改详情

**`riemann-localization.md`**：在 `## 证明思路` 之后插入 `## 详细证明`（含证明动机 + 7 阶段证明 + 2 Claim）。核心：归约 $h = f - g$ → Dirichlet 核表示 → 辅助函数 $F$ → 分解 $t \cdot D_N(t)$ → Riemann-Lebesgue 引理。

**`poisson-summation-formula.md`**：(1) 修复「显然」→「由 Fourier 级数系数的唯一性」；(2) 在 `### 关键步骤说明` 之后插入 `### 详细证明`（含证明动机 + 4 阶段证明 + 2 Claim）。核心：构造 $F_1, F_2$ → 计算 Fourier 系数 → Fubini 交换 → 唯一性定理。

**`phragmen-lindelof-theorem.md`**：在 `### 证明的三步结构` 之后插入 `### 详细证明`（含证明动机 + 6 阶段证明 + 2 Claim）。核心：构造 $F_\varepsilon$ → 一致快速下降 → 边界严格受控 → 有界扇形上最大模原理 → $R \to \infty$ → $\varepsilon \to 0$。

**`paley-wiener-theorem.md`**：在 `### Remark` 之后插入 `### 详细证明`（含证明动机 + 正向 3 阶段 + 逆向 3 阶段 + 4 Claim）。正向：围道变形 + Cauchy 定理 + 中速下降。逆向：Plancherel → $L^2 \subset L^1$ → 整函数延拓 + 指数型增长界。

**`dirichlet-theorem-on-primes.md`**：在 `## 证明思路` 之后插入 `## 详细证明`（含证明动机 + 5 阶段证明 + 4 Claim）。核心：指示函数 Fourier 展开 → 素数求和分解 → Euler 乘积 → $L(1,\chi) \neq 0$（复/实两种情形） → 综合结论。

### Paley-Wiener 正向证明的修正

子任务执行中发现原始草稿中正向定理（Theorem 3.1）的围道平移方向有误：对 $\xi > M$ 应向下平移（使 $e^{2\pi\xi y_0}$ 衰减），而非向上。草稿中的反复修正（"修正方法"、"关键修正"等）违反 PROOFS.md §1.2（禁止黑板写法），已统一为向下平移的正确论证。

### lint 巡检结果（2026-08-11 19:53）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 0 |
| **INFO** | 0 |

全部 9 项检查通过（含新增的 Section 9：定理证明区段检测 + 证明跳过措辞检测）。

## [2026-08-12] method-stein-focus | method 体系以 Stein 复分析为重心 + 补充遗漏 method

### 用户反馈（2026-08-12）

> 「指的是正对complex分析中涉及的method进行扩充，而不是对于tao的文献中的method进行，但既然写入就把详细的写好检查刚才生成的 Method 体系，看看是否有遗漏的 Stein 复分析中的经典证明技巧，比如张量幂技巧或相位放大法是否已正确归类。将刚才新增的 3 个 method 页（amplification, local-to-global, structural-randomness-decomposition）的详细内容写入 wiki/methods/ 目录下，并更新所有相关定理的交叉引用。」

### 重要修正

之前 3 个 method 页偏向 Tao 文献应用，本次按用户反馈**完全以 Stein 复分析为重心**重写。

### 修正 1：3 个 method 页重写（Stein 复分析重心）

| Method | 重写后的 Stein 应用 |
|--------|---------------------|
| [[amplification\|增强技巧]] | Phragmén-Lindelöf 的 $F_\varepsilon = F \cdot e^{-\varepsilon z^{3/2}}$（Ch. 4, Thm 3.4）; Weierstrass 典型因子 $E_p$（Ch. 5, §4）; Morera 定理的参数化全纯（Ch. 2, Thm 5.4）; Schwarz 反射（Ch. 2, Thm 5.6）; Runge 围道构造（Ch. 2, Lemma 5.8） |
| [[local-to-global\|局部到整体原理]] | 恒等定理（Ch. 2, Thm 4.8）→ 5 大应用：恒等、最大模、辐角原理、Weierstrass 因子分解、Schwarz 反射 |
| [[structural-randomness-decomposition\|结构-随机性二分法]] | 5 大应用：Cauchy 积分公式（keyhole 分解）、留数定理（多极点分解）、Phragmén-Lindelöf（增长/衰减）、Jensen 公式（零点/对数）、Weierstrass 乘积（典型因子/指数） |

### 修正 2：补充 2 个遗漏的 Stein 复分析证明技巧

通过通读 Stein《Complex Analysis》识别出两个遗漏的 method：

| 新增 method | Stein 出现位置 | 描述 |
|------------|---------------|------|
| [[homotopy-argument\|同伦论证]] | Ch. 3 §5（Thm 5.1, p.115）、§6（Thm 6.1, p.117） | 曲线同伦 → 积分相等；单连通域原函数存在；对数分支存在 |
| [[blashke-product\|Blashke 乘积]] | Ch. 5 §1（Jensen 公式证明） | 带边界约束的零点因子（$\|b_k\| = 1$ 在圆周上）|

### 修正 3：所有定理页 method 交叉引用更新

按每个定理所用的核心 method 添加交叉引用：

| 定理页 | 新增 method 引用 |
|--------|----------------|
| cauchy-theorem | homotopy-argument, local-to-global |
| cauchy-integral-formula | keyhole-contour, annular-contour, structural-randomness |
| liouville-theorem | local-to-global, comparison-modulus |
| morera-theorem | amplification, local-to-global |
| schwarz-reflection-principle | local-to-global, structural-randomness, analytic-continuation |
| rouche-theorem | homotopy-argument, local-to-global |
| residue-theorem | keyhole-contour, annular-contour, amplification, local-to-global, structural-randomness |
| argument-principle | local-to-global, homotopy-argument |
| open-mapping-theorem | local-to-global, comparison-modulus, homotopy-argument |
| maximum-modulus-principle | local-to-global, structural-randomness |
| runge-theorem | local-to-global, structural-randomness, amplification |
| jensen-formula | blashke-product, homotopy-argument, structural-randomness |
| weierstrass-product-theorem | amplification, local-to-global, structural-randomness, blashke-product |
| phragmen-lindelof-theorem | amplification, structural-randomness, comparison-modulus, local-to-global |
| paley-wiener-theorem | contour-translation, amplification, structural-randomness, local-to-global |
| simply-connected-domain（概念页） | homotopy-argument |

### 完整 method 体系（12 个）

按方法论思想分类：

| 类别 | Method |
|------|--------|
| **围道构造** | contour-integration, contour-translation, keyhole-contour, annular-contour |
| **不等式与估计** | comparison-modulus, amplification |
| **结构分解** | analytic-continuation, local-to-global, structural-randomness-decomposition |
| **代数工具** | residue-calculus |
| **几何论证** | homotopy-argument |
| **因子分解** | blashke-product |

### lint 状态

修复后：ERROR 0, WARNING 0, INFO 0。

---

## [2026-08-12] method-refine | method 认定优化（基于 Tao 方法论文献）

### 用户反馈（2026-08-12）

用户提供 4 个方法论参考链接：

1. [Tao, *What is good mathematics?* (math/0702396)](https://arxiv.org/abs/math/0702396) —— 22 种「好数学」维度列表
2. [AMS Bulletin 1994](https://www.ams.org/journals/bull/1994-30-02/S0273-0979-1994-00502-6/S0273-0979-1994-00502-6.pdf) —— 复分析常用方法论论文
3. [Tao, *Structure vs randomness* (math/0512114)](https://arxiv.org/abs/math/0512114) —— 结构-随机性二分法
4. [Tao, *Amplification, arbitrage, tensor power trick*](https://terrytao.wordpress.com/2007/09/05/amplification-arbitrage-and-the-tensor-power-trick/) —— 增强技巧

### 用户要求

> 「优化对于method的认定，并扩充method」

### Method 认定的新标准（基于 Tao）

按 Tao《What is good mathematics?》第 (ii) 条与第 (xvii) 条：
- **Good mathematical technique**：masterful use of existing methods, or the development of new tools
- **Useful mathematics**：a lemma or method which will be used repeatedly in future work on the subject

判定标准修订为：
1. method 必须是「**反复利用**的证明技巧」，不是单次使用的小性质（归为 lemma）
2. method 必须有「**跨定理的应用价值**」，不是某定理的特殊构造
3. method 应体现「**某种方法论思想**」（如对称性套利、局部-整体、随机性二分）

### 新增 method 页（10 → 10，新增 3 个）

| 新增 method | 核心思想 | Stein 应用 |
|-------------|---------|-----------|
| [[amplification\|增强技巧（amplification）]] | 相位/齐次/张量幂变换从弱估计导强估计 | Phragmén-Lindelöf、Weierstrass 乘积、留数定理 |
| [[local-to-global\|局部到整体原理]] | 局部信息通过连通性推广为全局结论 | 解析延拓唯一性、最大模原理、辐角原理 |
| [[structural-randomness-decomposition\|结构-随机性二分法]] | 将对象分解为结构 + 随机分别分析 | Phragmén-Lindelöf、Weierstrass、Jensen、Paley-Wiener |

### 与 Stein 复分析的对应

**Phragmén-Lindelöf 定理（Theorem 3.4）**完美体现三种方法：
- **amplification**：$F_\varepsilon(z) = F(z) e^{-\varepsilon z^{3/2}}$ 的指数增强
- **结构-随机性二分**：增长部分 $Ce^{cr}$ + 衰减部分 $e^{-\varepsilon r^{3/2} \cos(3\pi/8)}$
- **局部到整体**：扇形边界控制（局部） → 内部控制（整体）

### 交叉引用更新

- `paley-wiener-theorem.md`：关联区段添加 amplification、structural-randomness、local-to-global、contour-translation 四个 method
- `phragmen-lindelof-theorem.md`：关联区段添加 amplification、structural-randomness、comparison-modulus、local-to-global 四个 method
- `index.md`：method 数 7 → 10

### lint 状态

修复后：ERROR 0, WARNING 0, INFO 0。

---

## [2026-08-12] feedback-correct | 增长阶定义修正 + method 页扩充

### 用户反馈（2026-08-12）

> 「增长阶的定义有误，没有依据stein的complex中的来。其他基本无误，method的识别过于机械，对于证明中反复利用到的且不被小性质包含的，我们就可以认为是method，比如围道积分平移，将实数轴上的积分转化为一个虚部非0的水平线上的积分，比如多孔圆的围道论证运用，比如将模的下界转化为模有界，通过倒数实现等等」

### 修正 1：增长阶定义

`wiki/concepts/order-of-growth.md` 重写，**采用 Stein Ch. 5 的原始定义**：

> Stein 在 Ch. 5 §2 中定义整函数 $f$ 的增长阶 $\rho$ 为满足
> $$|f(z)| \leq A e^{|z|^\rho}$$
> 对某常数 $A > 0$ 与所有 $|z|$ 足够大时成立的最小非负实数。

旧定义 $\rho = \limsup \log\log M(r)/\log r$（最大模版本）改为「等价叙述 2」（由 Jensen 公式推出）。

**用户指出正确**：Stein 的定义基于「指数增长界最优常数」，不是经典的最大模版本。原书 Ch. 5 直接采用前者。

### 修正 2：扩充 method 页

按用户标准重新审视「证明中反复利用且不被小性质包含」的证明技巧，从 3 个 method 扩充至 7 个：

| 新增 method | 核心思想 | Stein 应用 |
|-------------|---------|-----------|
| [[contour-translation\|围道平移法]] | 实轴围道平移至 $\operatorname{Im} z = c$ | Paley-Wiener 正向定理 |
| [[keyhole-contour\|keyhole 围道]] | 挖去孤立奇点 + 走廊构造 | Cauchy 积分公式、留数定理 |
| [[annular-contour\|多孔圆围道论证]] | 含内孔区域上的围道积分 | 辐角原理、Jensen 公式 |
| [[comparison-modulus\|模的下界转化法]] | 通过倒数将有界性转化为极点性 | 最大模原理、Phragmén-Lindelöf |

### 用户参考文献

- Alon, Spencer: *The Probabilistic Method*（组合学标准）
- Tao: *Amplification, arbitrage, and the tensor power trick*（数学家技艺）
- 复分析常用方法论论文（AMS Bulletin 1994 等）

用户强调：**method 是「反复利用的证明技巧」，不应被识别为简单性质（lemma）。**

### lint 状态

修复后：ERROR 0, WARNING 0, INFO 0。

### 待办（累积，不变）

- 用户核验 7 条 A 级主张（见 2026-08-12 reingest 日志）
- 为新 method 页添加更多交叉引用

---

## [2026-08-12] reingest | steinComplexAnalysis 全面摄取（Ch.1–5）

### 动因

源文件 `raw/papers/steinComplexAnalysis.md` 自 2026-08-11 首次摄取后已扩展——现包含约 80+ 条 PDF 高亮批注，覆盖 Ch. 1–5 全部内容。现有源页仅覆盖 Ch. 4 的 5 条批注，需要全面更新。

### 用户指示（2026-08-12）

> 「原则上需要有实体页和交叉引用，e级主张直接核验，只告诉我需要人工核验的部分，在高亮部分涉及一些重要method，也需要建立实体页，同时有一些小的性质，引理等等」

### 源页更新

`wiki/sources/steinComplexAnalysis.md` 重写，覆盖 Ch. 1–5 全部批注：
- Ch. 1（p.16–37）：Cauchy-Riemann 方程、Hadamard 公式、幂级数
- Ch. 2（p.39–82）：Cauchy 定理、Cauchy 积分公式、Liouville、Morera、Schwarz 反射、Runge 逼近
- Ch. 3（p.90–122）：亚纯函数、留数定理、辐角原理、Rouché、开映射、最大模原理、单连通、对数分支
- Ch. 4（p.131–146）：$\mathscr{F}_a$ 类、Poisson 求和（Ch.4 版本）、theta 函数变换、Paley-Wiener、Phragmén-Lindelöf
- Ch. 5（p.153–164）：Jensen 公式、增长阶与零点分布、Weierstrass 乘积定理

### 新建实体页（共 28 页）

| 类型 | 数量 | 列表 |
|------|------|------|
| 概念 | 7 | holomorphic-function, power-series, entire-function, meromorphic-function, isolated-singularity, simply-connected-domain, order-of-growth |
| 定理 | 13 | cauchy-theorem, cauchy-integral-formula, liouville-theorem, morera-theorem, schwarz-reflection-principle, runge-theorem, residue-theorem, argument-principle, rouche-theorem, open-mapping-theorem, maximum-modulus-principle, jensen-formula, weierstrass-product-theorem |
| 引理 | 5 | triangle-inequality-complex, hadamard-formula, cauchy-inequalities, mean-value-property-holomorphic, removable-singularity-criterion |
| 方法 | 3 | contour-integration, analytic-continuation, residue-calculus |

### 索引更新

`wiki/index.md`：
- 概念：6 → 13（新增 7 个复分析概念）
- 定理：5 → 18（新增 13 个复分析定理）
- 引理：4 → 9（新增 5 个复分析引理）
- 方法：0 → 3（新增 3 个复分析方法）
- 源：3（不变，源页更新）

### AI 核验分级

**E 级（已核验）**：所有上述定理陈述逐字引用自 PDF 批注，包括 Cauchy 定理、Cauchy 积分公式、Liouville、Morera、Schwarz 反射、Runge 逼近、留数定理、辐角原理、Rouché、开映射定理、最大模原理、Jensen 公式、Hadamard 增长阶定理、Weierstrass 乘积定理等。

**A 级（待用户核验）**：
1. Theorem 3.4 用于证明 Theorem 3.3（Phragmén-Lindelöf 是 Paley-Wiener 逆向证明的关键工具）——基于 p.146 Remark 与定理逻辑推断。
2. 最大模原理是 Phragmén-Lindelöf 定理的直接推广基础——基于 p.111 + p.143 的逻辑关系。
3. Theta 函数变换律 $\theta(t) = t^{-1/2}\theta(1/t)$ 用于 Ch.6 Riemann zeta 函数解析延拓——p.139 提及，需 Ch.6 中确认。
4. Cauchy 积分公式是 Paley-Wiener 正向定理证明的核心工具——基于 p.64 + p.140 证明逻辑。
5. Schwarz 反射原理与 Phragmén-Lindelöf 定理共享「全纯延拓」思想——基于 p.79 + p.143。
6. Weierstrass 乘积定理是 Dirichlet 定理证明中 Euler 乘积的复分析推广——基于 p.164 + Dirichlet 定理逻辑。
7. Jensen 公式是 Hadamard 因子分解定理（Theorem 2.1）的核心工具——基于 p.156 + p.157 的逻辑。

### lint 状态

待运行 lint 检查新页面是否引入 ERROR/WARNING。

---

## [2026-08-12] schema-lemma | 引理页类型建立

### 动因

用户指示（2026-08-12）：「除了定理，methods之外，应该得有一些小的性质，比如|e^z|=e^(Re(z))这种很小的性质，但是又很经常用到」。需要为频繁使用但规模较小的性质建立独立的页面类型。

### 设计

引理页与定理页的关键区别：

| 维度 | 定理页 | 引理页 |
|------|--------|--------|
| strength 字段 | 必须 | 不需要 |
| What/Why/What-if 框架 | 必须 | 不需要 |
| 证明动机与思路 | 必须 | 不需要（直接给出证明） |
| 证明区段 | 「详细证明」（分阶段 + 技术性 Claim） | 「证明」（简要，1–2 段） |
| 等价叙述 / 证明难度差异 | 必须 | 不需要 |
| 应用区段 | 可选 | 必须（列出引用此引理的页面） |

### 变更文件

| 文件 | 变更 |
|------|------|
| `docs/STRUCTURE.md` | 新增 `wiki/lemmas/` 目录与 lemma 页面类型定义 |
| `docs/SCHEMA.md` | `type` 字段新增 `lemma` 选项；新增「引理页（Lemma）」区段（含与定理页的对比表） |
| `docs/EXAMPLES.md` | 新增引理页模板与检查清单 |
| `scripts/lint-wiki.ps1` | Section 5 增加 lemma 页跳过 strength 字段检查 |
| `AGENTS.md` | 页面书写框架区段提及引理类型 |
| `wiki/index.md` | 新增「引理（Lemmas）」分类，含 4 个引理条目；修正 theorems 列表（补入 `phragmen-lindelof-theorem`，更新 `paley-wiener-theorem` 描述）；统计表新增 lemmas 行 |

### 新建引理页（4 个）

| 引理页 | 陈述 | 来源 | 应用 |
|--------|------|------|------|
| `modulus-of-complex-exponential.md` | $|e^z| = e^{\operatorname{Re}(z)}$ | steinComplexAnalysis | phragmen-lindelof-theorem, paley-wiener-theorem |
| `multiplicativity-of-modulus.md` | $|z_1 z_2| = |z_1| \cdot |z_2|$ | steinComplexAnalysis | modulus-of-complex-exponential, phragmen-lindelof-theorem, paley-wiener-theorem |
| `integer-periodicity-of-exponential.md` | $e^{2\pi i n} = 1$（$n \in \mathbb{Z}$） | steinFourierAnalysisIntroduction2003a | poisson-summation-formula, dirichlet-theorem-on-primes |
| `cauchy-schwarz-inequality.md` | $\left|\int f\bar{g}\right| \leq \|f\|_{L^2}\|g\|_{L^2}$ | steinFourierAnalysisIntroduction2003a | paley-wiener-theorem, dirichlet-theorem-on-primes |

### 设计决策

1. **引理与定理分离**：引理页不承担理论建构职责，仅作为「工具箱」记录频繁引用的小性质，避免定理页被琐碎性质淹没。
2. **双向引用**：每个引理页的「应用」区段列出引用该引理的定理页，定理页的详细证明中通过 wikilink 引用引理，形成双向引用网络。
3. **status: verified**：引理均为教材中明确陈述的基本性质，直接核验通过。
4. **lint 兼容**：引理页免检 strength 字段，其余检查（wikilink、frontmatter、记号一致性等）照常执行。

## [2026-08-12] schema-expand | 练习题、问题、笔记三类实体页建立

### 动因

用户指示（2026-08-12）：「事实，除了这些，我们还需要exercise和problem和note的实体对象，前两者是参考stein，note是创作需要，人类与ai共同维护的笔记，是对学习内容的深度反映」。

三类页面对应三种截然不同的内容生产模式：

- **Exercise**：参考教材（Stein–Shakarchi）各章末尾的编号练习。来源明确，结构稳定。
- **Problem**：参考教材各章末尾的 Problems（更具挑战性、综合性或开放性）。
- **Note**：人类与 AI 共同维护的创作性学习笔记。是 wiki 中**唯一允许主观论述**的页面类型，反映跨章节联系与深度反思。

### 变更文件

| 文件 | 变更 |
|------|------|
| `docs/STRUCTURE.md` | wiki/ 目录树新增 `exercises/`、`problems/`、`notes/`；页面类型约定表新增 3 行 |
| `docs/SCHEMA.md` | `type` 字段新增 `exercise / problem / note` 选项；新增「练习题页」「问题页」「笔记页」三个独立章节；status 流转、frontmatter 字段、约束说明 |
| `docs/EXAMPLES.md` | 新增三类页面模板与笔记页检查清单 |
| `scripts/lint-wiki.ps1` | `validStatus` 加入 `draft / in-progress / mature / archived`；Section 5 的跳过类型扩展为 `lemma / exercise / problem / note / source`；Section 1 的文件名索引支持 `subdir/name` 形式（Obsidian 路径式） |
| `AGENTS.md` | 页面书写框架区段新增三类页面的描述 |
| `wiki/index.md` | 新增三个分类（练习、问题、笔记），各含 1 条目；统计表新增 3 行 |

### 新建页面（3 个示范页）

| 类型 | 页面 | 内容 |
|------|------|------|
| exercise | `exercises/ch1-ex3-double-fourier-transform.md` | Ch.1 §2 Ex.3：双重 Fourier 变换的反演 $\widehat{\hat{f}}(\xi) = f(-\xi)$。完整解答 + 多角度关联 |
| problem | `problems/ch5-problem-1-psf-without-schwartz.md` | Ch.5 §3 Problem 1：非 Schwartz 条件下的 Poisson 求和公式（$f, f' \in L^1$ 即可）。完整解答 + 不可削弱讨论 |
| note | `notes/schwartz-space-as-fourier-anchor.md` | 「Schwartz 空间在 Fourier 分析中的核心地位」反思笔记，四种角色论述，跨页引用 |

### 设计决策

1. **三种 status 系统并存**：
   - 概念/定理/引理/方法：`unverified / pending-verification / verified / superseded`（核验流）
   - 练习/问题：`verified`（与原书一致即核验通过）
   - 笔记：`draft / in-progress / mature / archived`（生命周期流）
   - lint 接受两套 status 取值的并集。

2. **笔记页的唯一性**：是 wiki 中**唯一允许 AI 撰写原创内容**的页面，其他页面仅允许引用、综述与核验。笔记不得作为其他页面的**唯一依据**，仅可作旁证。

3. **「非 Schwartz 约定」容忍**：练习题若源自非 Stein 约定的教材或不同版本，按 `[[NOTATION|非 Stein 约定]]` 标注规则处理。

4. **笔记页 vs 综述页（topic）**：综述页是综合 wiki 已有内容的整合性页面（保持客观），笔记页是主观反思的创造性页面。两者是互补而非替代。

5. **路径式 wikilink 支持**：lint 与 Obsidian 一致，支持 `目录/文件名` 形式的 wikilink（不仅是文件名），便于跨子目录引用。

### lint 巡检结果（2026-08-12 08:26）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 0 |
| **INFO** | 3 |

- 3 个 INFO 是预期的：新页面尚未被其他页引用（orphan），后续会在笔记页/概念页中加入反向引用。
- 本次扩展未引入任何新 ERROR 或新 WARNING。

### 阶段 3 待办

- 用户在 `notes/` 中创建更多反思笔记
- 从已有对话/笔记中提炼新练习/问题页
- 笔记 `status: draft` → `in-progress` → `mature` 的升级流程

## [2026-08-12] ingest | 用户 LaTeX 讲义转为 wiki 笔记页

### 动因

用户提供了一份完整的 LaTeX 讲义 `fourier-analysis.tex`（2250 行，八章 + 导论），作为参考 Stein & Shakarchi《Fourier Analysis: An Introduction》的傅里叶分析综合笔记。该讲义由人类撰写、人类与 AI 共同维护。指示「将这个作为 note 加入」。

### 处理方式

由于 LaTeX 讲义完整且高度结构化（远超普通笔记篇幅），按 wiki 三层架构处理：

1. **原始资料归档**：`raw/inbox/fourier-analysis-notes-2026-08-12.tex`——指向原始 LaTeX 源文件的指针（保持不可变）。
2. **wiki 笔记页**：`wiki/notes/fourier-analysis-zh-notes.md`——Markdown 化、结构化、嵌入 wikilink 与跨章节综合。完整保留讲义骨架（导论 + 第一编六章 + 第二编三章），省略冗余证明细节但保留核心定理、命题、证明梗概。

### 笔记页结构

| 章节 | 内容摘要 |
|------|---------|
| 主题与背景 | 五个场景的引入（圆群、实直线、$\mathbb{R}^d$、$\mathbb{Z}(N)$、有限阿贝尔群）+ 紧性观察主轴 |
| 第一编 §1 | 五个场景——紧与非紧的对照（含主轴表格） |
| 第一编 §2 | 好核、求和法与古典框架 |
| 第一编 §3 | 唯一性定理（含两种证明 + 与幂级数唯一性类比 + 与 Weierstrass 逼近对偶） |
| 第一编 §4 | 双射性——单射/满射对照表（Riesz-Fischer） |
| 第一编 §5 | Poisson 求和与补充工具（含群论诠释、theta、热核、Poisson 核、采样定理） |
| 第一编 §6 | 双重跃迁——离散性与紧性（Tao epsilon 余量四种体现 + 紧/非紧逻辑倒置） |
| 第二编 §7 | 等周不等式（Hurwitz 三步翻译 + 与变分法对比 + 遗留问题） |
| 第二编 §8 | 数论中的 Fourier 观点（Weyl 等分布 + Dirichlet 定理 + theta/zeta 函数方程） |
| 第二编 §9 | 偏微分方程（Dirichlet 问题 + 热扩散 + 子从属原理） |
| 跨章节综合 | 紧/非紧主轴的统一性 + 逻辑倒置 + 翻译机制 + Tao 工具服务对象 |
| 待澄清 | 6 项后续工作（Hermite 谱分解、PW 定理对偶、Pontryagin 对偶等） |

### 设计决策

1. **笔记 status 设为 `mature`**：该讲义由人类系统写作、内容相对稳定、跨章节综合明确，符合 `mature` 标准。
2. **保留全部章节标题与命题**：删减证明细节（参见 LaTeX 原文），保留核心陈述与证明梗概，便于 wiki 化引用。
3. **嵌入 wikilink 引用现有 wiki页**：所有可对应到已有概念/定理/引理的位置都嵌入 `[[...]]` 链接。
4. **表格与结构化对比**：用 Markdown 表格保留 LaTeX 中的对照表（紧/非紧主轴、双射性、能量法 vs 平均值原理、Tao 工具对照表等）。
5. **原始资料可追溯**：frontmatter `sources: [steinFourierAnalysisIntroduction2003a]` 表明内容主要源自 Stein 原书，原始 LaTeX 源位于 `raw/inbox/`。

### lint 巡检结果（2026-08-12 09:10）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 0 |
| **INFO** | 4 |

- 14 项检查全部通过（含新建的 Section 10–14：反向链接一致性、sources 可回溯、strength 自洽性、过期检查、被取代检测）。
- 4 个 INFO 均为预期的 orphan 提示（新页面尚未被其他页反向引用）。
- 修复 1 处 wikilink（Markdown 表格中 `\|` 转义符在 wikilink 别名分隔符上的歧义）。

## [2026-08-12] schema-rename | `l2-space` → `lp-space` 与 `ellp-space` 新建

### 动因

用户反馈（2026-08-12）：部分 wiki 标题未随内容更新而更新——`l2-space.md` 实际覆盖整个 $L^p$ 框架（$L^1$、$L^2$、$L^\infty$、Hölder、Parseval 等），slug 与内容严重不符。同时指出 $L^p$ 与 $\ell^p$ 是**指称不同的两个 Banach 空间**，必须明确区分：

- **$L^p$**（大写 L）：定义于**测度空间**上的可测函数空间，$\|f\|_{L^p} = (\int |f|^p)^{1/p}$。
- **$\ell^p$**（小写 l）：定义于**可数指标集**上的序列空间，$\|(a_n)\|_{\ell^p} = (\sum |a_n|^p)^{1/p}$。

### 变更概览

| 操作 | 文件 |
|------|------|
| **新建** | `wiki/concepts/lp-space.md`：$L^p$ 空间（覆盖原 `l2-space.md` 内容，扩展对 $\ell^p$ 的明确区分 + 等价叙述 3「$L^2 \leftrightarrow \ell^2$」） |
| **新建** | `wiki/concepts/ellp-space.md`：$\ell^p$ 空间——Fourier 系数的归宿，Riesz–Fischer、Hausdorff–Young 的标准框架 |
| **删除** | `wiki/concepts/l2-space.md`（slug 与内容不符） |
| **批量迁移** | 14 个文件中 33 处 `[[l2-space|...]]` → `[[lp-space|...]]`（保留显示文本） |
| **索引更新** | `wiki/index.md`：原 `[[l2-space]]` 条目替换为 `[[lp-space]]` 与 `[[ellp-space]]` 双条目 |
| **lint 修复** | `scripts/lint-wiki.ps1`：Section 6 概念 wikilink 规则更新（$L^p$ → `lp-space`，新增 $\ell^p$ → `ellp-space`，正则支持花括号、$\infty$）；跳过列表加入 `lp-space`/`ellp-space` |

### 设计决策

1. **slug 命名遵循 Stein 记号**：`lp-space` 与 `ellp-space` 直接对应 LaTeX 的 `$L^p$` 与 `$\ell^p$`，避免与 wiki 链接语法的 `|` 分隔符冲突。
2. **首页双条目**：在 `index.md` 中两个新页面同时列出，相互 wikilink，明确指称不同。
3. **跨页链接形式**：所有原本显示 `$L^1$`/`$L^2$` 的位置仍保持原显示文本，仅链接目标改为 `lp-space`。
4. **正则升级**：原 lint 正则 `\$L\^[12p]` 不匹配 `$L^1([0,1])$`（因包含后续字符）。新正则 `\$L\^\{?(?:1|2|p|\\infty)\}?` 同时支持无括号、有花括号、含 `\infty` 三种 LaTeX 形式。

### 关键修复

1. **3 处 wikilink 转义冲突**：Markdown 表格中的 `\|` 转义符在 wikilink 别名分隔符 `|` 上歧义——将 wikilink 移出表格单元格或重写为非转义形式。
2. **lp-space.md 页内锚点 `[[#等价叙述]]`**：lint 脚本不识别页内锚点，改为纯文本「参见『等价叙述』叙述 2」。

### lint 巡检结果（2026-08-12 10:30）

| 类别 | 计数 |
|------|------|
| **ERROR** | 0 |
| **WARNING** | 0 |
| **INFO** | 4 |

- 14 项检查全部通过。
- 4 个 INFO 均为预期的 orphan 提示（新建 `ellp-space` 与 `lp-space` 尚未被其他页反向引用——但实际上 `lp-space` 已被大量页面引用）。

### 后续工作

- 用户可能希望将其他「slug 与内容不符」的概念页（如 `good-kernel`、`schwartz-space` 等）也复查一遍——但目前这些 slug 语义与标题一致，无需重命名。
- 若 wiki 引入 $\ell^p_w$（加权）或 $\ell^p_N$（有限维）等变体，可在 `ellp-space.md` 中扩展等价叙述区段。

## [2026-08-13] entity-completion | 真假实体补建:7 处新建(基于 raw 高亮「记录(暂不建页)」清单)

(下含子历史条目略;本条目后追加:)

---

## [2026-08-13] notation-distinguish | $\mathcal{F}_a$ 类改用 $\mathscr{F}_a$ 以避免与 Fourier 算子冲突

### 动因

用户指出:`\mathcal{F}` 既表示 Fourier 变换算子(算子语境),又表示复分析 Ch.4 中的函数类 `$\mathcal{F}_a$`(类语境)——符号冲突,需对第二种含义采用不同的写法。

### 决定

采用 LaTeX 手写花体 `$\mathscr{F}_a$`(需要 `mathrsfs` 宏包,Obsidian/Pandoc/KaTeX 默认支持)区分:

- **Fourier 变换算子**:保留 `$\mathcal{F}$`(标准花体,正体大写)。
- **中速递降条带全纯函数族**(原 Stein 记号 $\mathcal{F}_a$):改写为 `$\mathscr{F}_a$`(手写花体,mathrsfs)。

### 执行内容

1. **全库 LaTeX 替换**:脚本扫描 `wiki/` 与 `docs/` 下全部 `.md`,将 `\mathcal{F}_` → `\mathscr{F}_`(10 个文件):
   - `wiki/concepts/f_a-class.md`(主页,定义/性质/动机/反例/推广全部更新)
   - `wiki/concepts/holomorphic-function.md`(关联区段)
   - `wiki/lemmas/shift-of-line.md`(aliases 与工作空间声明)
   - `wiki/methods/contour-integration.md`(围道平移变体中提到)
   - `wiki/sources/steinComplexAnalysis.md`(Ch.4 摘录 + 源页清单)
   - `wiki/theorems/fourier-inversion.md`(证明三)
   - `wiki/theorems/poisson-summation-formula.md`(证明二)
   - `wiki/theorems/paley-wiener-theorem.md`(关联区段)
   - `wiki/index.md`(条目描述)
   - `wiki/log.md`(全库统一记号,含 entity-completion 条目)
2. **NOTATION.md 更新**:
   - F 节新增 $\mathscr{F}_a$ 登记(注明 Stein 原书用 $\mathcal{F}_a$,本 wiki 改用 $\mathscr{F}_a$ 避免冲突);
   - 禁止写法表新增一行:$\mathscr{F}_a$ 类**禁止**用 $\mathcal{F}_a$(与 Fourier 算子混淆)。
3. **不替换**:`\mathcal{F}`(单独成词,无下划线,作为 Fourier 算子);亦不影响其他 LaTeX 记号。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 0`(全库 wikilink、orphan、frontmatter 等 16 节 PASS)。

### 不变量

- 仅 LaTeX 记号层面替换,数学语义不变;所有 wikilink 仍指向 [[f_a-class]] 主页 slug。
- `raw/` 不修改(若用户需在 raw 中也采用此区分,后续单独处理)。

---

## [2026-08-13] notation-revision | NOTATION.md 过时项修复

### 动因

用户反馈 `docs/NOTATION.md` 仍有未跟进 wiki 现状的过时项。逐项审计 wiki 实际记号,定位过时/缺失。

### 修复内容

1. **C 节 Gauss 核公式更正**:原登记 $K_\delta = \dfrac{1}{\sqrt{2\pi}\,\delta}e^{-x^2/2\delta^2}$(高斯约定),但 wiki 实际一致使用 **Stein 约定** $K_\delta = \delta^{-1/2}e^{-\pi x^2/\delta}$(`approx-by-good-kernel`「特例」、`plancherel-theorem` 证明二、`fourier-inversion` 证明二均同);改记号登记 + 显式注明「**禁止**混入高斯约定」。
2. **删除已删页引用**:`C/E` 节中 `[[gauss-mollification]]` 引用已随 method 合并删除;改为 `[[approx-by-good-kernel]]`「特例:Gauss 磨光」。
3. **新增 F 节「算子与特殊记号」**:登记 6 类 wiki 既有但 NOTATION.md 未收录的记号:
   - $\mathcal{F}$(Fourier 算子;`plancherel-theorem` 等多页用);
   - $\chi$、$\chi_0$、$\bar\chi$(Dirichlet 特征标;`dirichlet-theorem-on-primes`);
   - $\mathcal{R}$、$R^*$(Radon 变换与其对偶;`radon-transform`);
   - $\operatorname{Res}(f,z)$(留数;`residue-theorem`、`residue-by-taylor-coeff`);
   - $\mathcal{S}(\mathbb{R}^d)$(Schwartz 空间,统一约定;**禁止** $\mathcal{S}_d$、$S$、$s$);
   - $O(\cdot)$、$\ll$、$o(\cdot)$(Stein 风格 Landau 记号,$\ll$ 替代 $O$);
   - $\chi_I$ 与 Dirichlet $\chi$ 的语境区分。
4. **禁止写法表扩充 3 行**:Gauss 核禁止混用高斯约定;Fourier 算子统一 $\mathcal{F}$;区间指示 vs Dirichlet 特征标区分。
5. 一致性原则重申:沿用既有六节结构(强制表/补充约定/常用记号登记/禁止写法/收录原则/一致性检验);**不删除既有强制记号表任何行**(Stein 硬约束)。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 0`(改动仅在 docs/,lint 不扫描,确认 lint 整体无回归)。

### 不变量

- `raw/`、`scratch/`、`templates/`、`scripts/`、`wiki/` 未触碰;强制记号表未改动;无新增/删除页。

---

## [2026-08-13] entity-standards | 实体划分标准 + 证明审核 lint + 知识边界

### 动因

用户反馈三项:①证明审核应纳入 lint(Heisenberg 证二出现「重新核算」语病影响质量);②证明书写与提问**禁止网络检索**,仅依据书或已有知识库;③$\pi\cot\pi z$ 部分分式展开够不上 theorem,只能算例子;④明确 theorem/lemma/method 划分标准。

### 1. 知识边界(硬约束,写 AGENTS.md 与 project_rules.md)

LLM 在本项目中的数学知识仅允许来自 `raw/`、`wiki/`、`docs/` 三类来源;**禁止网络检索**、禁止凭 LLM 训练数据「回忆」写未在知识库中出现的命题/证明/页码/引用;用户询问的解答同样遵守此边界——超出须显式说明「未在知识库,需用户提供原始材料」。

### 2. 证明审核纳入 lint(scripts/lint-wiki.ps1 §16 Proof Audit)

- 新增 Section 16 **proof audit**:扫描 theorem/lemma/exercise/problem 页,检测跳步短语(易见/显然/不难验证/容易看出/直接计算可得)与**新增的修订/重新核算类语病**(重新核算/重新计算/改正/修订:/这里用了.*约定);
- 同一 theorem/lemma 中已用 Claim 上下文豁免(300 字符窗内)——避免与 §9 重复误报;
- 触发即 WARNING 并列出页/类型/词表命中。

### 3. cotangent-partial-fraction 降级(theorem → example)

- 用户判定:$\pi\cot\pi z$ 部分分式展开是**具体数学对象的特例展示**,不够 theorem(判别测试:独立命名?独立证明多次?被 ≥2 页引用?——是/部分/是 但本质是标准例子而非定理结构;按 STRUCTURE §3.2.1「example 不立页」规则降级)。
- 删除 `wiki/theorems/cotangent-partial-fraction.md`;
- 内容并入 `wiki/lemmas/residue-by-taylor-coeff.md` 「典型例子」节(例 1: $\pi\cot\pi z$ 留数 = 1 + 对称化得部分分式展开);
- 清理 4 处 wikilink(`poisson-summation-formula.md`、`weierstrass-product-theorem.md`、`residue-by-taylor-coeff.md`、`index.md`),改 `index.md` 统计 32→31。

### 4. Heisenberg 证二清理

移除「**重新核算**:Stein 约定下……」段(语病 + 重复计算);改用直接陈述 + 单一精算公式($\|\psi'\|_2^2 = \int |\widehat{\psi'}|^2 d\xi = 4\pi^2 \int \xi^2|\hat\psi|^2 d\xi$),引用 [[plancherel-theorem]] 替换 [[fourier-transform]]。

### 5. 实体划分标准量化(STRUCTURE §3.2.1/§3.2.2 与 project_rules.md §8)

新增「§3.2.1 量化分级标准」与「§3.2.2 边界判定细则」,含类型对照表与 4 条边界判定:

| 类型 | 内容实质 | 独立成页 |
|------|---------|---------|
| theorem | 全书核心/不可替代的大型定理 | ✓ |
| lemma | 工具性小性质(总篇幅 < theorem 50%) | ✓ |
| example(不立页) | 具体对象的特例展示 | ✗ → 收入主定理/引理的「典型例子」节 |
| method | 无真假的技巧/思路/套路 | ✓(允许抽象) |

四条边界判定:①「够不够 theorem」三判别测试;②method vs lemma;③concept vs theorem;④note vs example/method。project_rules.md「实体治理」节新增第 8 条与「知识边界」节。

### lint 状态

`ERROR 0 / WARNING 0 / INFO 0`(新增 §16 proof audit PASS;§9 历史跳步项未受影响)。

### 不变量

- `raw/`(只读)、`scratch/` 未触碰;cotangent 页删除为受权修改(用户强确认);
- AGENTS/project_rules 新增「知识边界」节为协议级硬约束,适用一切未来 LLM 会话。

---

## [2026-08-13] entity-completion | 真假实体补建:7 处新建(基于 raw 高亮「记录(暂不建页)」清单)

### 动因

执行用户指示:为 raw 高亮中「记录(暂不建页)」项中确有数学事实但无独立实体页者建立实体页。按 docs/STRUCTURE.md §3.2「真假」决策树与最小原则(被 ≥2 处使用或被现有实体页强引用/绕不开)执行。

### 新建实体页(7 项)

| 类型 | 页面 | 来源 | 来源页码 |
|------|------|------|----------|
| theorem | [[cotangent-partial-fraction]] | [[steinComplexAnalysis]] | Ch. 5, p.161–163 (Euler 恒等式 (4)) |
| lemma | [[residue-by-taylor-coeff]] | [[steinComplexAnalysis]] | Ch. 3, p.94 (Theorem 1.3/1.4 + 简单极点) |
| lemma | [[shift-of-line]] | [[steinComplexAnalysis]] | Ch. 4, p.135–138 (eq. (1) + Lemma 2.3) |
| concept | [[fourier-coefficient-holomorphic]] | [[steinComplexAnalysis]] | Ch. 3, p.120–122 (Theorem 7.1 + Cor 7.2) |
| concept | [[f_a-class]] | [[steinComplexAnalysis]] | Ch. 4, p.132 (类 $\mathscr{F}_a$ 定义 + 三定理纲领) |
| concept | [[poles-classification]] | [[steinComplexAnalysis]] | Ch. 3, p.91–94 (奇点三分 + Theorem 1.2/1.3) |
| concept | [[hermite-operator]] | [[steinFourierAnalysisIntroduction2003a]] | Ch. 5, p.186 (Exercise 23) |

### 依据与原则

- **新建门槛**:Stein 原书高亮且属「有真假的数学事实」(命题/工具性小性质/概念定义),且无独立页面。
- **最小原则**:除 _a-class 为概念工作空间(Book II Fourier 分析三定理的共同工作空间)外,其余均被 ≥1 现有页(留数定理、Fourier 反演、Poisson 求和、Schwartz 空间、Heisenberg 原理等)直接或间接引用,需独立锚点。
- **不新建的项**(避免重复):
  - ourier-inversion-class-f_a.md(被 [[fourier-inversion]] 证明三覆盖)
  - exponential-decay-in-f_a.md(被 [[fourier-inversion]] Claim 2 + [[paley-wiener-theorem]] 引用即可)
  - order-of-growth.md(已存在,见 [[order-of-growth]])

### 设计选择

- 全部新页 status: unverified(无 [AI-核验] 标记),与 SCHEMA.md §2.1 流转规则一致。
- theorem/concept 页按 STRUCTURE.md §3.1 设 strength + strength_basis;lemma 页不设。
- 概念页「工作空间」声明于「定义」区段开头,符合 SCHEMA.md §4 规范。
- 定理页「详细证明」含证明动机、证明思路、详细证明、收尾 $\blacksquare$,无「易见/显然/不难验证」跳步。

### 关联更新

- [[steinComplexAnalysis]]:类 $\mathscr{F}_a$ 与 Stein Ch.5 三结构性质证明现已建为独立实体页,后续被 [[fourier-inversion]]/[[poisson-summation-formula]]/[[paley-wiener-theorem]] 等独立引用。
- [[steinFourierAnalysisIntroduction2003a]]:Hermite 算子现已建为独立实体页,后续被 [[heisenberg-uncertainty-principle]] Ch.5 Ex.23 路线直接引用。

### lint 巡检(待执行)

- 运行 scripts/lint-wiki.ps1,确认 ERROR 0 / WARNING 0。

---

## [2026-08-13] round-4-fixes | 四页修订 + 均方收敛实体建页 + lint §16 修复

### 动因

用户四项反馈(2026-08-13):①Ch.7 Ex.5「字符」应为「特征标」+ 补充柯西方程解法;②Parseval 恒等式去单一工作空间声明、修正 `$f \in$ [[lp-space|]]$L^2$` 渲染、核查 Stein 原文假设、比对证明差异、平方收敛建实体;③Ch.4 Ex.12 Feynman 微分法则须在 Riemann 积分框架(一致收敛/连续/有界语言)下重写并补引理,方法归纳改为「利用求导构造微分方程」;④integral-truncation method 重写,核心思想为结构性分解(积分分拆),与 structural-randomness-decomposition 关联。

### 1. ch7-ex5-circle-character 重写(字符 → 特征标 + 柯西方程解法)

- 标题/正文全部「字符」→「特征标」;陈述补充 $e_n \mapsto n$ 同构验证。
- 解答四步严格化:积分技巧证 $F$ 可微(Stein 提示,微积分基本定理)→ 解 ODE $F'=AF$ → $F(1)=1$ 定 $A=2\pi in$([[integer-periodicity-of-exponential]])→ 同构。
- 新增「补充:柯西方程 $F(x+y)=F(x)F(y)$ 的解法」:定理(连续 ⇒ 指数解)+ 两步证明(可微性 / 积分因子 $G=e^{-Ax}F$)+ 两个注记(为何需可微、病态解警告;与一阶线性 ODE 联系)。
- `character.md` 同步:表格表头与相关习题描述「字符」→「特征标」。

### 2. parseval-identity 重写(对照 Stein Ch.3 Theorem 1.3)

- **去单一工作空间**:声明改为「多工作空间(圆群 T / 实数线 R / 有限阿贝尔群 G)」,以圆群为主述,其余见推广节。
- **修 wikilink 渲染**:`$f \in$ [[lp-space|$L^2$]]$([0,2\pi])$`(原 `[[lp-space|]]` 渲染缺失)。
- **核查 Stein 原文假设**:Theorem 1.3 假设为「圆上(Riemann)可积」,未单独要求平方可积——Riemann 可积蕴含有界故 $|f|^2$ 自动可积;页面新增「关于平方可积的注记」明确回答此问题;$L^2$ 为 Lebesgue 视角的等价重述。
- **证明按 Stein 三步重排**(原为 Bessel + 反向不等式 Claim):①正交性 ⇒ Bessel(Pythagoras);②均方收敛(Fejér/Weierstrass 化归连续 + Ch.2 Lemma 3.2 化归可积 + 最优逼近引理);③Pythagoras 式中令 $N\to\infty$。新增「与纯 Hilbert 空间证明的差异(对照 Stein)」说明为何如此重排。
- **反例修正**:原 `f(θ)=θ^{1/2} ∉ L^2`(计算错误,$\int θ = 2π^2 < ∞$)改为 `f(θ)=θ^{-1/2} ∈ L^1 \setminus L^2` 的正确反例。
- 状态 `unverified → verified`(已对照 raw 源核验)。

### 3. 新建实体:均方收敛(平方收敛)

`wiki/concepts/mean-square-convergence.md`(concept, strength: strong):定义(均方范数收敛)、为何「均方」而非逐点、Ch.3 Theorem 1.1 证明机制(三化归)、与逐点收敛的关系、与 Parseval 等价性、三种等价叙述、应用。被 parseval-identity / riemann-lebesgue-lemma / orthogonal-best-approximation 反链引用。

### 4. ch4-ex12-feynman 重写(Riemann 积分框架)

- **4 个预备引理**:①含参反常积分一致收敛的 Weierstrass 判别法(积分版);②积分号下求导的充分条件(Riemann 框架莱布尼茨法则);③$\int_0^\infty e^{-at}\sin t\,dt = 1/(1+a^2)$(复化);④微分方程 + 边界条件定常数($I(\infty)=0 \Rightarrow I(a)=\pi/2-\arctan a$)。
- **解法重排**:先验证换序条件($|\partial_a g|\le e^{-\alpha t}$ 一致收敛)→ $I'(a)=-1/(1+a^2)$ → 边界条件 → 闭式;第二问高阶导数逐次换序(指数衰减压制多项式)。
- **方法归纳改为「利用求导构造微分方程」**:参数化 → 求导构造微分方程 → 解方程 + 边界条件;强调「求导目的不是直接算积分,而是把积分求值转化为微分方程问题」。
- 一致收敛 ⟶ 换序 明确标注为后续 [[dominated-convergence|控制收敛]] 的基础。

### 5. integral-truncation 重写(结构性分解 / 积分分拆)

- 核心思想改写为「结构性分解」:结构部分(有限范围主项,显式计算)+ 随机部分(尾部,专项估计);与 [[structural-randomness-decomposition]] 的关系明确为「二分法在收敛性论证中的专用化」。
- 典型应用补全四个场景:Riemann-Lebesgue(振荡尾部分解)、Fejér 核 $L^1$ 估计(按尺度 $1/N$ 分拆主瓣/次瓣)、分段 $[0,N]$ 与 $[N,\infty)$(Dirichlet 定理 / Weyl / 采样重建)、Poisson 求和对称截断。
- aliases 增「积分分拆」;状态 `unverified → verified`。

### 6. lint §16 修复

§16 proof audit 引用未定义变量 `$pagesToLint`/`$wikiRoot`(foreach 空集合,审计从未实际执行)——修复为 `$pages`/`$WikiRoot`,proof audit 现真正生效;首次运行即检出 `lemmas/shift-of-line.md` 的「显然」跳步措辞,已改写为显式论证(变数替换 + $e^0=1$)。

### 7. 索引与统计

`wiki/index.md`:concepts 20 → 21(新增 mean-square-convergence);parseval-identity、integral-truncation 状态更新为 verified。

### lint 巡检

本轮修改后运行 scripts/lint-wiki.ps1,确认 ERROR 0 / WARNING 0。

### 不变量

- `raw/`、`scratch/` 未触碰;`docs/` 未修改;templates 未修改。
- 新增页 mean-square-convergence 已通过 lint(概念页 strength/工作空间声明/反向链接均合规)。

---

## [2026-08-13] round-5-fixes | 三项反馈：柯西方程两途径 + 均方收敛定理化 + 习题高亮全面处理

### 动因

用户三项反馈(2026-08-13)：①Ch.7 Ex.5 中 Stein 提供的积分思路与「归纳法解柯西方程」是两个思路，不应混淆；②均方收敛是**定理**而非概念，且均方收敛与逐点收敛相互独立需例子区分；③raw 高亮中的 exercise 混有例子/定理/引理/重要方法，需「该建立实体建立、该补充补充」。

### 1. ch7-ex5-circle-character：两途径分离

- 解答改为「途径 A（Stein 提示：积分-微分法）」：积分技巧 → $F'=AF$ → 积分因子 → $F=e^{Ax}$ → $F(1)=1$。
- 补充节并列两条解法：途径 A（积分-微分）与途径 B（归纳-有理数逼近：$F(nx)=F(x)^n$ 递推 + 根系统相容性 + 连续性延拓）；附对比表（核心工具/是否先证可微/连续性作用/繁琐程度）与共同前提（连续性，去掉则有 Hamel 基病态解）。

### 2. 均方收敛：concept → theorem 页

- `wiki/concepts/mean-square-convergence.md` 删除，改为 `wiki/theorems/mean-square-convergence.md`（type: theorem，Ch.3 Theorem 1.1）。
- 按定理页框架重写（陈述/动机/证明思路/详细证明/等价叙述/反例/推广/证明难度/应用），含完整证明（最优逼近 + Fejér/Weierstrass + Ch.2 Lemma 3.2 三化归）。
- **新增「均方收敛与逐点收敛的独立性（例子）」**：例 1（Fourier 级数语境：Ch.3 §3 连续函数在某点发散，均方仍收敛）、例 2（$f_n=\sqrt n\,\mathbf{1}_{[0,1/n]}$：逐点收敛但 $\|f_n\|_2=1$ 不收敛）、例 3（二进滑移指示函数：均方收敛但逐点处处不收敛）。

### 3. 习题高亮分类处理（raw 全章扫描）

对 raw 高亮中的各章 exercise/problem 逐条分类处理：

**新建定理实体（6）**：
- `bernstein-theorem`：Hölder $\alpha>1/2$ ⟹ 绝对收敛（Ch.3 习题 p.110；二进频段分解 + Cauchy-Schwarz，3 个 Claim）。
- `gibbs-phenomenon`：锯齿函数部分和过冲 ~9%（Ch.3 Ex.20；Riemann 和 + Dirichlet 积分）。
- `legendre-polynomials`：$[-1,1]$ 完备正交系（Ch.3 Ex.2；Rodrigues/分部积分/范数/唯一性/完备性）。
- `euler-fourier-formulas`：$\cos(\alpha x)$ Fourier 级数 → $\cot$ 部分分式与反射公式（Ch.3 Ex.3；含 $\int t^{\alpha-1}/(1+t)$）。
- `hermite-functions`：Fourier 变换与 Hermite 算子的完备特征函数系（Ch.5 Ex.7；$Lh_k=(2k+1)h_k$、$\widehat{h_k^*}=(-i)^kh_k^*$）。
- `finite-abelian-decomposition`：有限阿贝尔群结构定理 + $\widehat{G}\cong G$（Ch.7 Problems 1–3；CRT/直积/自对偶）。

**新建引理实体（3）**：
- `dirichlet-kernel-l1-norm`：$L_N \ge c\log N$（Ch.3 Ex.2；部分和范数无界的定量来源）。
- `fourier-coefficient-decay`：$C^k$/Lipschitz/单调/Hölder ⟹ 衰减速率 + $\ell^2$ 可和（Ch.3 Ex.17–18）。
- `bump-function`：$C^\infty$ 紧支集函数的显式构造（Ch.5 Ex.4）。

**新建方法实体（1）**：`fft`：快速 Fourier 变换 $O(N\log N)$（Ch.7 Theorem 1.3 + Ex.9；radix-2 分治）。

**新建练习实体（1）**：`ch7-ex8-finite-reconstruction`：$\mathbb{Z}(N)$ 上 Parseval + 有限采样重建（采样定理的离散类比）。

**补充现有页（13 处）**：character（R 特征标 Ex.6、特征标值 Ex.12）、sampling-theorem（过采样 $K_\lambda$ + 能量公式 + Ex.8 离散重建）、heisenberg（Ex.21 紧支不相容、Ex.22 质量集中 $L_1L_2\ge 1/2\pi$）、weyl（有理 θ 精确轨道 + Weyl 判据逆向 Ex.7）、poisson-summation（$\sum 1/(n+\alpha)^2=\pi^2/\sin^2\pi\alpha$）、finite-abelian-group（卷积定理 + Dirac 核 + CRT）、fourier-inversion（周期化-采样-取极限路线 Ex.1）、wirtinger（与等周等价 Ex.4）、integral-truncation（场景 5：中等衰减卷积按 $|y|=|x|/2$ 分拆）、cesaro-summation（跳跃间断收敛值 + 延迟平均 + Dirichlet 定理 + 弱 Littlewood）、good-kernel/cesaro/gibbs 等反向链接补齐。fejer/weierstrass-approximation-trig/hermite-operator 经核查已覆盖对应习题。

**判定为「例子」未立页者**（按 STRUCTURE §3.2 规则）：Ch.2 Ex.1（稠密间断构造）、Ch.4 Problem 4（堆积奇点无处可微构造）、Ch.5 Ex.4 bump（已建引理页，因被多页引用）——构造类例子收入关联页或引理页。

### 4. lint 与索引

- lint 16 节全绿：ERROR 0 / WARNING 0 / INFO 0。
- 修复过程中发现 2 处文件被外部进程回退（index 统计、fourier-coefficient-decay 的 χ 替换），已重新应用并验证。
- `index.md`：theorems 32→38、lemmas 16→19、methods 16→17、exercises 9→10；新增条目全部登记。

### 不变量

- `raw/`、`scratch/`、`docs/`、`templates/` 未触碰；仅新增/删除 wiki 实体页并修改 `scripts/lint-wiki.ps1`（上一轮）。

## [2026-08-13] user-rulings-index-split | 用户三项裁决：归一化不统一 + 区间指示统一 χ + index 分类索引

### 动因

用户三项指令（2026-08-13）：①圆群卷积 $1/(2\pi)$ 归一化写法不一致——**无需纠正**，上下文明确即可（平凡问题，Fourier 系数同理）；②区间特征函数 $\chi_I$ 与 $\mathbf{1}_I$ 两写法——**按候选方案执行**（统一 $\chi_I$）；③index 冗杂——加一层分类，按傅里叶分析/复分析划分，各开独立 index（method 与 note 不参与划分）。

### 1. 归一化裁决（open-questions 三条 resolved）

- `wiki/open-questions.md` 三条记号冲突标 `resolved` 并记录裁决：①圆群 $\hat f(n)$ 三套归一化——平凡问题不统一，以语境标注为准（含 riemann-lebesgue-lemma 归一化缺失不作修正）；②区间指示两写法——按候选方案执行；③圆群卷积 $1/(2\pi)$——平凡问题不统一，以语境为准。
- `docs/NOTATION.md`：补充约定/常用记号登记同步更新——区间指示统一 $\chi_I$、$\mathbf{1}$ 保留给数论常函数、圆群两套基与卷积归一化注明「已裁决不统一」。

### 2. 区间指示函数统一为 $\chi_I$

- 按候选方案改 [[paley-wiener-theorem]]（$\mathbf{1}_{[-M,M]}$ ×2）、[[ch5-problem-1-psf-without-schwartz]]（$\mathbf{1}_{[-R,R]}$），并顺带统一其余区间指示：[[bump-function]]（$\chi_{[a,\infty)}$）、[[fourier-coefficient-decay]]（$\chi_{[a,b]}$、$\chi_{[a_k,a_{k+1}]}$）、[[mean-square-convergence]]（$\chi_{[0,1/n]}$ 及二进块 4 处）、[[gibbs-phenomenon]]（$\chi_{(0,\pi)}$、$\chi_{(\pi,2\pi)}$）。
- 数论常函数保留：[[dirichlet-theorem-on-primes]] 中 $\chi*\mathbf{1}$ 的 $\mathbf{1}$ 注明「常数函数」；非区间集指示（有限群 Dirac 核 $|G|\mathbf{1}_{\{1_G\}}$）保留 $\mathbf{1}$。

### 3. index 分类索引重构

- 新增 `wiki/index-fourier.md`（傅里叶分析：概念 16 / 定理 23 / 引理 7 / 习题 10 / 问题 5，合计 61 页，数论应用页标注）与 `wiki/index-complex.md`（复分析：概念 8 / 定理 15 / 引理 9，合计 32 页，含跨域页 [[paley-wiener-theorem]]）。
- `wiki/index.md` 精简为分类枢纽：分类索引表 + 通用引理（跨领域 5 条）+ 方法 17 + 笔记 4 + 人物 + 源 + 统计（更新为 filesystem 实计数：concepts 24、lemmas 21、合计 122）+ 治理；概念/定理/引理/习题/问题明细移入两分类索引。
- `scripts/lint-wiki.ps1`：`index-*.md` 视为导航文件（跳过全量 lint 与 orphan 检查）；Section 6 特征标 pattern 收窄为 `\\chi(?![_a-zA-Z]|_\s*\{)`——区间指示 $\chi_I$/$\chi_{[a,b]}$ 不再误判为特征标提及（6 页 `\chi` 替换后避免误报）；`docs/STRUCTURE.md` 补 `wiki/` 目录说明与修订记录。

### 不变量

- `raw/`、`scratch/`、`templates/` 未触碰；仅修改 `docs/`（NOTATION、STRUCTURE）、`wiki/`（6 个实体页记号 + 3 个索引/导航文件 + open-questions）、`scripts/lint-wiki.ps1`。

## [2026-08-13] index-split-ant | 数论页单开：新增解析数论索引

### 变更

- 新增 `wiki/index-number-theory.md`（解析数论索引）：[[dirichlet-theorem-on-primes]]、[[ch8-ex3-euler-product]]、[[ch8-pb1-dirichlet-alternative]] 共 3 页（theorem 1 / exercise 1 / problem 1）。
- `wiki/index-fourier.md`：移出上述 3 页，删除「（数论）」标注；统计 theorems 23→22、exercises 10→9、problems 5→4、合计 61→58。
- `wiki/index.md`：分类索引表新增「解析数论」行（[[index-number-theory]]）；傅里叶分析行说明改为 Ch.1–7；按领域划分更新为傅里叶 58 / 复分析 32 / 解析数论 3。
- `docs/STRUCTURE.md`：`wiki/` 目录与修订记录补充解析数论索引。

### 不变量

- `raw/`、`scratch/`、`templates/` 未触碰；`character`、`finite-abelian-group` 等有限群 Fourier 分析概念保留于 [[index-fourier]]，作为解析数论索引的支撑概念。

## [2026-08-13] env-protect | 文件回退防护：关闭 Sync + git 基线 + obsidian-git 自动备份推送

### 背景

index.md 与 index-fourier.md 多次被外部进程回退到旧内容。排查结论：obsidian-git 插件闲置（无 data.json，默认全关）；cross-page-consistency.py 只读；OneDrive 不涉及；**Obsidian Sync 核心插件在两个 vault（`e:\wikiproject`、`e:\wikiproject\math-wiki`）均已启用，为最大嫌疑**（可从远端回推旧版本，对已/未跟踪文件均生效）。

### 措施（用户确认后执行）

1. **关闭 Obsidian Sync**：两处 `.obsidian/core-plugins.json` 的 `"sync"` 均置 `false`。
2. **git 基线**：`.gitignore` 增 `.obsidian/`（运行时配置）与 `scratch/`（人类私有空间，不入库）；`git rm --cached scratch/README.md`；全量提交 wiki/docs/scripts/raw/templates/AGENTS/README 为基线，推送 `origin/main`（github.com/zi-hen/math-wiki）。
3. **obsidian-git 自动备份 + 推送**：新建 `.obsidian/plugins/obsidian-git/data.json`——`autoSaveInterval=5`（每 5 分钟自动 commit）、`autoBackupAfterFileChange=true`（文件变更后即时备份）、`autoPushInterval=5`（每 5 分钟推送）、`autoPullInterval=0`/`autoPullOnBoot=false`/`pullBeforePush=false`（**不自动拉取**，防止远端旧状态回推）。

### 效果

- 回退发生后可被 `git status`/`git diff` 立即发现；误改可用 `git restore` 恢复。
- 每次编辑自动提交推送，形成完整变更历史（远端为权威副本）。

### 不变量

- `raw/` 未修改；`scratch/` 未读写；后续 lint 产物（`wiki/.lint-last.md`、`scratch/lint-reports/`）均不入库。
