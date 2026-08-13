# STRUCTURE.md — 目录结构与页面类型

> 本文件是 wiki 页面类型与目录归属的**唯一权威**。frontmatter 字段定义、status 流转、AI 核验分级见 [docs/SCHEMA.md](SCHEMA.md);具体页面模板见 [docs/EXAMPLES.md](EXAMPLES.md)。

---

## 1. 三层架构

```
raw/        不可变原始源(PDF 导出笔记、剪藏网页、讲义、手写扫描、个人笔记)。LLM 只读,绝不修改。
wiki/       LLM 生成并维护的 markdown 知识库。摘要页、实体页、概念页、综述页。
scratch/    人类私有记事本,排除在一切工作流之外。LLM 不读不写。
```

- **raw/** 是事实之源(source of truth)。一切 wiki 主张须可回溯到 raw/ 中的某条记录。
- **wiki/** 由 LLM 完全拥有:创建页面、更新交叉引用、标注矛盾、保持一致。人类只读,不手写。
- **scratch/** 给你记临时灵感,与 LLM 工作流隔离。

## 2. raw/ 子目录

```
raw/
  inbox/        未分类新源(含 AI 对话摘要,status=unverified)
  papers/       Zotero Integration 导出的论文笔记,文件名 = citation key
    assets/     从 PDF 提取的图片
  books/        书籍章节笔记
  web/          Web Clipper 剪藏
  personal/     个人笔记(人类独立思考产物;与 AI 对话笔记区分)
    notes/      电子笔记的 markdown 化
    sketches/   草图与图示
```

**个人笔记(personal/)特别说明**:
- frontmatter `type: raw-personal`。
- 摄取规则同工作流:初始 `unverified`,LLM 比对现有 `verified` 页决定新建或追加。
- 个人笔记中的数学断言须经原书或其他 `verified` 源核验后方可作为 `verified` 依据。

## 3. wiki/ 目录与页面类型

```
wiki/
  topics/       综述页:对一个主题的渐进式综合(含 evolving thesis)
  concepts/     概念实体页(如「缓增分布」「极大函数」)
  theorems/     定理实体页(如「Calderón–Zygmund 分解」)
  lemmas/       引理页:频繁使用的小性质(如 |e^z| = e^{Re(z)})
  methods/      方法/技巧页(如「圆周法」「光滑截断」)
  exercises/    练习题页(参考 Stein 各章 Exercises)
  problems/     问题页(参考 Stein 各章 Problems)
  notes/        笔记页(人类与 AI 共同维护的创作性学习笔记)
  people/       数学家页
  sources/      每个源一页摘要
  index.md      内容目录(枢纽:分类索引 + 通用引理/方法/笔记/人物/源)
  index-fourier.md  傅里叶分析分类索引(concept/theorem/lemma/exercise/problem 按领域归类)
  index-complex.md  复分析分类索引(concept/theorem/lemma 按领域归类)
  index-number-theory.md  解析数论分类索引(theorem/exercise/problem 按领域归类)
  log.md        时间线日志(仅追加)
  open-questions.md  矛盾与未决问题
```

### 3.1 页面类型一览(唯一权威)

| 类型 | 目录 | 关键 frontmatter 字段 | 主要区段 | 内容定位 |
|------|------|----------------------|----------|---------|
| `source` | `wiki/sources/<citekey>.md` | type, title, sources, status, created, updated | 摘要、关键摘录、概念清单、定理清单、与现有 wiki 的关系 | 单个源的摘要 + 关键摘录 + 与现有 wiki 的关系 |
| `concept` | `wiki/concepts/<slug>.md` | type, title, sources, status, tags, strength, strength_basis | 定义、动机、性质、关联定理、关联方法、典型反例、相关习题、What/Why/What-if | 概念实体页:定义 + 性质 + 反例 + 等价叙述 |
| `theorem` | `wiki/theorems/<slug>.md` | type, title, sources, status, tags, strength, strength_basis | 陈述(Stein 记号)、等价叙述、证明思路(含动机)、详细证明、其他证明(如有)、证明难度差异、推广、应用、反例、相关习题 | 定理实体页:陈述 + 详细证明 + 反例 + 推广 |
| `lemma` | `wiki/lemmas/<slug>.md` | type, title, sources, status, tags(**无** strength) | 陈述、简要证明、应用场景(必填) | 频繁使用的**数学命题**(工具性小性质,如 $\|e^z\| = e^{\operatorname{Re}(z)}$):陈述 + 简要证明 + 应用。**不得收录技巧性(程序性)内容** |
| `method` | `wiki/methods/<slug>.md` | type, title, sources, status, tags, strength, strength_basis | 适用场景、关键思想(可抽象)、步骤(可选)、陷阱、实例、相关命题 | 一种**技巧/程序**(非命题,无真假可言):适用场景、关键思想、步骤(可选)、陷阱、实例 |
| `exercise` | `wiki/exercises/<slug>.md` | type, title, chapter, number, sources, status, tags(**无** strength) | 陈述、思路提示、解答、关联 | 教材各章编号练习:陈述 + 思路 + 解答 |
| `problem` | `wiki/problems/<slug>.md` | type, title, chapter, number, sources, status, tags(**无** strength) | 陈述、思路提示、解答、关联 | 教材各章末尾 Problems:陈述 + 思路 + 解答 |
| `note` | `wiki/notes/<slug>.md` | type, title, authors, sources(可空), status (draft/in-progress/mature/archived), tags(**无** strength) | 主题与背景、核心想法、待澄清与下一步、关联 | 创作性学习笔记:个人理解 + 跨章节联系 + 深度反思 |
| `topic` | `wiki/topics/<slug>.md` | type, title, sources, status, tags, strength, strength_basis | evolving thesis、关联实体页清单 | 对某主题的综述,含 evolving thesis,汇集关联实体页 |
| `person` | `wiki/people/<slug>.md` | type, title, sources, status, tags, strength, strength_basis | 人物、贡献、关联定理/概念 | 人物、贡献、关联定理/概念 |

**「相关习题」区段格式**(concept / theorem 页):`[[slug|编号]]: 一句话陈述摘要`,只列陈述摘要,**不含证明**;证明仅存在于对应的习题/问题页。

**字段必填性约定**:
- `source` / `note` / `lemma` / `exercise` / `problem`:不设 `strength` 字段。
- `concept` / `theorem` / `method` / `topic` / `person`:必设 `strength` 与 `strength_basis` 字段。
- 完整字段定义与 status 流转规则见 [docs/SCHEMA.md](SCHEMA.md)。

## 3.2 类型判定:以「真假」为核心的 method/lemma 决策树

来自源的高亮、对话、习题或证明中的任何内容要落页时,先沿以下决策树判定类型:

```
某内容(来自源的高亮/对话/习题/证明)要落页:
├─ 它是否断言了某个数学事实(有真假,可证明或可反证)?
│   ├─ 是 → lemma(小而常用)或 theorem(大/核心)——必须给出证明或已证出处
│   └─ 否 → 它是否是可复用的技巧/思路/套路(无真假)?
│       ├─ 是 → method 页
│       └─ 否 → 概念(definition)或其他
```

### 3.2.1 量化分级标准

| 类型 | 内容实质 | 是否独立为 theorem | 备选归属 |
|------|---------|--------------------|---------|
| **theorem** | 全书核心/不可替代的大型定理(标准结果,有反复独立证明) | ✓ | — |
| **lemma** | 工具性小性质,频繁被多页引用(总篇幅 < theorem 50%) | ✓(小而专) | — |
| **example**(不立页) | 具体对象的特例展示(恒等式、单点计算、典型例) | ✗ | 收录入主定理的「典型例子」或主引理的「典型例子」区段 |
| **method** | 无真假的技巧/思路/论证套路 | ✗(仅 method) | 允许抽象,允许 trick/技术/模式 |

### 3.2.2 边界判定细则

1. **"够不够 theorem"**:
   - 若内容是**具体数学对象**(某个特定函数的展开、某个特定序列的收敛、某个特定恒等式)——通常**不够 theorem**,应作为 example 收录到主定理/引理的「典型例子」节(如 $\pi\cot\pi z$ 部分分式展开 → [[residue-by-taylor-coeff]]「典型例子」节,而非独立 theorem 页);
   - 若内容是**普适性命题**(对一类对象成立、有非平凡证明、被反复引用)——为 theorem/lemma;
   - **判别测试**:此结果是否在文献中独立命名?独立证明是否多次出现?是否被 ≥2 个其他定理页引用?全否 → 不立 theorem 页。

2. **method vs lemma**:
   - 含**可证明的命题** → lemma/theorem(不得归 method);
   - 仅描述**程序/技巧/论证模式**(如"乘 1 技巧"、"局部到整体"、"模的倒数转化") → method;
   - method **可含技术性 Claim**(作为方法的实现细节),但不得把命题本身冒充 method。

3. **concept vs theorem**:
   - **对象定义**(类/算子/空间/族) + 基本性质 → concept 页(可含定理作为「基本性质」节,但定理本身不独立);
   - **核心命题** → theorem(可引用 concept 页定义)。

4. **note vs example/method**:
   - **创作性学习笔记/跨章节反思/思想性高亮提炼** → note 页;
   - **具体数学对象的事实陈述** → 不入 note,而入 theorem/lemma/concept/method 或其 example。

- **method 允许抽象**:可以是证明中的 trick(如乘 $e^{-\varepsilon z^{3/2}}$ 压制增长)、证明技术(如模的倒数转化)、论证模式(如局部到整体、结构—随机性二分);「步骤」节**非必填**。
- **method 可积累**:每次在证明中认出同一套路,回链/补充既有 method 页,不另立新页。
- **硬约束**:
  - method 页**不得含未证明数学断言**;涉及命题须 wikilink 到 lemma/theorem 页,或作为技术性 Claim 给出证明(遵循 [docs/PROOFS.md](PROOFS.md))。
  - lemma 页**不得收录程序性技巧**,只放命题 + 证明 + 应用。
  - example 类内容**不得独立成页**;若发现散落为 theorem/lemma 页(违反"够不够 theorem"判别),降级并入相关主页面。

## 3.3 实体唯一性(一页一实体)

同一定理/概念/方法/引理的不同形式——等价叙述、不同空间版本($\mathbb{R}^d$、$\mathbb{T}$、$G$)、不同证法——**只允许在一个实体页**;其余形式以该页的「等价叙述」「其他证明」区段记录,不另立新页。

- **唯一性检索(强制)**:建页/摄取前必须执行——检索 `wiki/index.md` + 全库 grep 关键词(别名、英文名、章节号)。
- 发现重复 → **合并进既有页**(强确认),不新建。
- 合并后在 `wiki/log.md` 记录;原 slug 页面删除,或标注「已并入 [[xxx]]」。

## 3.4 实体页最小原则(如无必要,勿增实体)

新建实体页必须满足下列**至少一条**:

1. 属基础概念登记清单([docs/SCHEMA.md](SCHEMA.md) §7)或核心定理/方法;
2. 内容量足够(陈述 + 证明/程序 + 关联),无法内嵌到既有页;
3. 被 ≥1 页引用,且需要独立锚点。

不满足任一条件 → 并入既有页,或作源页「关键摘录」记录。

## 4. 文件命名

- 小写、连字符、语义化 slug。
- 源页用 Better BibTeX citation key(如 `stein1971introduction`)。
- 禁止重复 slug 模式(如 `foo-foo`),由 `scripts/lint-wiki.ps1` Section 2 检测。

## 5. 修订记录

| 日期 | 变更 | 原因 |
|------|------|------|
| 2026-08-12 | 页面类型表新增「关键 frontmatter 字段」与「主要区段」两列;吸收 SCHEMA.md 拆出的页面类型说明 | docs 结构重构(spec:restructure-docs-eliminate-overlap) |
| 2026-08-13 | method/lemma 真假决策树、实体唯一性、实体页最小原则、相关习题区段、description 字段、OKF 对齐(三强制规则⊂lint、图而非目录、Playbook↔method 同构、Skill/Tools 评估结论不安装) | 规则修订 spec:revise-rules-entity-governance |
| 2026-08-13 | index.md 增分类层:新增 `wiki/index-fourier.md`、`wiki/index-complex.md` 分类索引(概念/定理/引理/习题/问题按傅里叶分析、复分析归类;method 与 note 不参与划分,保留于 index.md);lint 视 `index-*.md` 为导航文件 | index 冗杂治理 |
| 2026-08-13 | 数论页单开:新增 `wiki/index-number-theory.md` 解析数论分类索引(dirichlet-theorem-on-primes、ch8-ex3、ch8-pb1 自傅里叶索引移出) | 数论页单开 |
