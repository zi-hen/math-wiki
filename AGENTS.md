# AGENTS.md — LLM Wiki Schema (Mathematics Research)

> 本文件是 wiki 的「宪法」。LLM 在每次会话开始时优先读取本文件，据此决定如何摄取源、回答问题、维护 wiki。
> 你（人类）与 LLM 共同演化本文件。当某条规则在实践中不顺手时，修订它，并在 `wiki/log.md` 记录变更原因。

---

## 0. 三层架构

```
raw/        不可变原始源（PDF 导出笔记、剪藏网页、讲义、手写扫描）。LLM 只读，绝不修改。
wiki/       LLM 生成并维护的 markdown 知识库。摘要页、实体页、概念页、综述页。
scratch/    人类私有记事本，排除在一切工作流之外。LLM 不读不写。
```

- **raw/** 是事实之源（source of truth）。一切 wiki 主张须可回溯到 raw/ 中的某条记录。
- **wiki/** 由 LLM 完全拥有：创建页面、更新交叉引用、标注矛盾、保持一致。人类只读，不手写。
- **scratch/** 给你记临时灵感，与 LLM 工作流隔离。

---

## 1. 数学记号约定（强制）

本 wiki 统一采用 **Stein–Shakarchi** 记号。任何页面中的公式必须符合下列约定；若某源使用不同约定，摄取时须换算为本约定并注明「〔已换算为 Stein 约定〕」。

| 对象 | 约定 | 公式 |
|------|------|------|
| Fourier 变换 | $e^{2\pi i \xi x}$ | $\hat{f}(\xi)=\int_{-\infty}^{\infty} f(x)\,e^{-2\pi i \xi x}\,dx$ |
| 逆 Fourier 变换 | 对称 | $f(x)=\int_{-\infty}^{\infty}\hat{f}(\xi)\,e^{2\pi i \xi x}\,d\xi$ |
| Poisson 求和 | 无 $2\pi$ 因子 | $\displaystyle\sum_{n\in\mathbb{Z}} f(n)=\sum_{n\in\mathbb{Z}}\hat{f}(n)$ |
| 卷积 | 标准 | $(f*g)(x)=\int f(x-y)g(y)\,dy$ |
| 调和函数 | 平均值性质 | $u(x)=\frac{1}{|B|}\int_B u$ |
| $L^p$ 范数 | 标准 | $\|f\|_p=\bigl(\int|f|^p\bigr)^{1/p}$ |

- 复共轭记作 $\overline{z}$；内积记作 $\langle f,g\rangle=\int f\overline{g}$。
- $B_R$ 表示半径 $R$ 的球；$\partial B_R$ 其边界；$\sigma$ 表示球面测度。
- 求和/积分上下限优先写 $\in\mathbb{Z}$、$\in\mathbb{R}^d$ 等集合记法。
- 凡涉及多变量，默认空间为 $\mathbb{R}^d$，并在页首 frontmatter 的 `space` 字段注明。

---

## 2. 目录结构与页面类型

```
raw/
  inbox/        未分类新源（含 AI 对话摘要，标记 unverified）
  papers/       Zotero Integration 导出的论文笔记，文件名 = citation key
    assets/     从 PDF 提取的图片
  books/        书籍章节笔记
  web/          Web Clipper 剪藏文章
wiki/
  topics/       综述页：对一个主题的渐进式综合（含 evolving thesis）
  concepts/     概念实体页（如「缓增分布」「极大函数」）
  theorems/     定理实体页（如「Calderón–Zygmund 分解」）
  methods/      方法/技巧页（如「圆周法」「光滑截断」）
  people/       数学家页
  sources/      每个源一页摘要
  index.md      内容目录（按类目）
  log.md        时间线日志（仅追加）
  open-questions.md  矛盾与未决问题
templates/      Obsidian 模板与 Zotero 导入模板
```

页面类型约定（详见各模板）：
- **source 页** (`wiki/sources/<citekey>.md`)：单个源的摘要 + 关键摘录 + 与现有 wiki 的关系。
- **concept 页** (`wiki/concepts/<slug>.md`)：一个概念的定义、动机、性质、关联定理、关联方法、典型反例。
- **theorem 页** (`wiki/theorems/<slug>.md`)：陈述（Stein 记号）、证明思路、前提条件、推广、应用、来源。
- **method 页** (`wiki/methods/<slug>.md`)：一种技巧的适用场景、步骤、陷阱、实例。
- **topic 页** (`wiki/topics/<slug>.md`)：对某主题的综述，含 evolving thesis，汇集关联实体页。
- **person 页** (`wiki/people/<slug>.md`)：人物、贡献、关联定理/概念。

---

## 3. 文件命名与 frontmatter

- 文件名 = 小写、连字符、语义化 slug。源页用 Better BibTeX citation key（如 `stein1971introduction`）。
- 每个 wiki 页必须含 YAML frontmatter：

```yaml
---
type: concept          # concept | theorem | method | topic | person | source
title: 缓增分布
aliases: [tempered distribution, Schwartz 分布]
created: 2026-08-11
updated: 2026-08-11
sources: [stein1971introduction, rudin1991functional]   # 支撑本页的 citekey 列表
status: verified        # verified | unverified | superseded
tags: [fourier-analysis, distribution]
space: R^d
---
```

- `status` 规则：未经 raw/ 核验的内容标记 `unverified`，**不得作为其他页的依据**（防止循环证据）。核验后改 `verified`；被新源取代改 `superseded`。
- 行内引用源用 wikilink + citekey：`[[stein1971introduction|Stein & Shakarchi (2003), §2.1]]`。

---

## 4. 操作流程

### 4.1 摄取（Ingest）

触发：用户说「摄取 <源>」或将文件放入 `raw/inbox/` 并提示。

步骤：
1. **读取** raw 源（先读文本，必要时单独查看引用的图片）。源若是 `unverified`（如 AI 对话摘要），全程标记 quarantine。
2. **讨论**：向用户简述关键发现（3–5 条），询问要强调什么、有无已知联系。
3. **写源页** `wiki/sources/<citekey>.md`：摘要、关键摘录（带页码/定位）、概念清单、定理清单、与现有 wiki 的关系。
4. **更新实体页**：对源中出现的每个重要概念/定理/方法，更新或新建对应页面，追加新事实并交叉引用。一个源通常触及 8–15 个页面。
5. **更新 index.md**：新增/修订条目，保持类目组织。
6. **追加 log.md**：格式 `## [YYYY-MM-DD] ingest | <源标题>`，简述动过的页面。
7. 若发现矛盾，记入 `open-questions.md`。

约束：
- 永不修改 raw/ 下任何文件。
- 每个 wiki 主张须可回溯到源页（wikilink 或 citekey）。
- `unverified` 源不得提升其他 `unverified` 页为依据。

### 4.2 查询（Query）

触发：用户提问。

步骤：
1. 先读 `wiki/index.md` 定位相关页面。
2. 钻取相关页，必要时回溯 raw/ 原文核验。
3. 综合回答，附内联引用 `[[citekey|描述]]`。
4. **回填**：若回答是有价值的综合（对比表、新分析、发现的联系），征得同意后存为新 wiki 页，更新 index 与 log（`## [YYYY-MM-DD] query | <问题>`）。

输出格式可变：markdown 页、对比表、Marp 幻灯、matplotlib 图、canvas。公式一律用 Stein 记号。

### 4.3 健检（Lint）

触发：用户说「lint」或定期执行。

检查项：
- 页面间矛盾（同一量在不同页有不同陈述）。
- 被新源取代的陈旧主张（`status: superseded` 但仍被引用）。
- 无入链的孤儿页。
- 被多处提及却无独立页的重要概念。
- 缺失的交叉引用。
- 可通过 web 搜索填补的数据缺口。

输出：一份报告，列出问题与建议；征得同意后修复。追加 log `## [YYYY-MM-DD] lint | N 项已修复`。

---

## 5. 引用与可回溯性

- 一切非平凡主张须可回溯：`[[<citekey>|<简述>]]` 指向源页，源页再指向 raw/。
- 禁止两个 `unverified` 页互相引用作为依据。
- 数学定义/定理以 Stein–Shakarchi 记号书写；换算源的原记号时标注「〔已换算〕」。

---

## 6. 导航文件

- **index.md**：内容目录。按类目（concepts / theorems / methods / topics / people / sources）组织，每条含链接 + 一句话摘要。每次 ingest 更新。
- **log.md**：仅追加的时间线。条目统一前缀 `## [YYYY-MM-DD] <op> | <标题>`，便于 `grep "^## \[" log.md | tail -n 5` 取最近 5 条。
- **open-questions.md**：矛盾与未决问题清单，每条含状态、涉及页面、建议下一步。

---

## 7. 工具提示

- **Obsidian graph view**：观察 wiki 形态——哪些页是枢纽、哪些是孤儿。
- **Dataview 插件**：基于 frontmatter 生成动态表（如按 `status: unverified` 过滤）。
- **Obsidian Web Clipper**：浏览器扩展，把网页文章转 markdown 存入 `raw/web/`。
- **Marp**：从 wiki 内容生成幻灯。
- 整个 wiki 即一个 git 仓库，享有版本历史与分支。

---

## 8. 与 Zotero 的衔接

- Zotero 管理 PDF、元数据、批注；**Better BibTeX** 生成稳定 citation key。
- **Zotero Integration 插件**（mgmeyers）按 `templates/zotero-import.md` 把一个 Zotero 条目 + 其 PDF 批注导入为 `raw/papers/<citekey>.md`。
- citation key 同时是源页文件名与 frontmatter `sources` 字段，构成 raw↔wiki 的唯一锚点。
- 详见 `README.md` 的安装与配置章节。
