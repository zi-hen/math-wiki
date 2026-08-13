# WORKFLOW.md — 高层工作流概念

> 本文件定义 wiki 工作流的**高层概念**——触发词、输入输出、关键约束、与 Zotero 的衔接。具体加载策略(每种任务读哪些文件、何时停止)由 [docs/CONTEXT.md](CONTEXT.md) §2 承担。

---

## 1. 摄取(Ingest)

- **触发**:用户说「摄取 <源>」或将文件放入 `raw/inbox/`。
- **输入**:`raw/<source>/` 下新增或更新的源文件。
- **输出**:源页(含「关键摘录」与「高亮处理清单」)+ 触及的实体页 + `wiki/index.md` + `wiki/log.md` 同步。
  - **新雇测试(OKF 对齐)**:`wiki/index.md` 条目持续携带一句话描述,并与 frontmatter 可选 `description` 字段一致;LLM 在摄取/查询后同步两者。
- **关键约束**:
  - 永不修改 `raw/` 下任何文件。
  - 每个 wiki 主张须可回溯到源页(wikilink 或 citekey)。
  - `unverified` 源不得提升其他 `unverified` 页为依据。
  - **高亮处理(Enrich / Mint / Skip 三选一)**:每个高亮必须处理,不得遗漏;摄取结束源页须附「高亮处理清单」(每个高亮 → 决策 + 落点),保证可追溯。

    | 决策 | 含义 | 动作 |
    |------|------|------|
    | 补充(Enrich) | 高亮属于既有实体页的补充 | 更新既有页,追加来源与 `updated` 日期 |
    | 新建(Mint) | 高亮构成新实体,**且满足实体页最小原则**(见 [docs/STRUCTURE.md](STRUCTURE.md) §3.4) | 新建实体页 |
    | 记录(Skip → 源页摘录) | 高亮不构成新实体(孤立事实、过渡性内容) | 记录于源页「关键摘录」区段 |

  - **唯一性检查(强制)**:建页/摄取前检索 `wiki/index.md` + 全库 grep 关键词(别名、英文名、章节号);发现重复 → 合并进既有页(强确认),不新建(见 [docs/STRUCTURE.md](STRUCTURE.md) §3.3)。
  - **类型判定**:以「真假」为核心区分 lemma/theorem 与 method(见 [docs/STRUCTURE.md](STRUCTURE.md) §3.2):断言了数学事实(有真假)→ lemma/theorem;可复用技巧/思路(无真假)→ method;命题性内容不得进 method 页。
- **加载策略**:见 [docs/CONTEXT.md](CONTEXT.md) §2.1。

## 2. 查询(Query)

- **触发**:用户提问。
- **输入**:用户问题。
- **输出**:中文回答,附内联引用 `[[citekey|描述]]` 或 `[[page-slug|页面名]]`。
- **可选项**:征得同意后,将高价值综合存为新 wiki 页,更新 `index.md` 与 `log.md`。
- **加载策略**:见 [docs/CONTEXT.md](CONTEXT.md) §2.4。

## 3. 健检(Lint)

- **触发**:用户说「lint」「健检」「检查」,或每次 wiki 变更后自动。
- **输入**:`wiki/` 下的所有页面。
- **输出**:`wiki/.lint-last.md` 摘要 + ERROR/WARNING/INFO 计数。
- **巡检维度**(由 lint 脚本自动执行 14 节):
  - 页面间矛盾(同一量在不同页有不同陈述)
  - 被新源取代的陈旧主张
  - 无入链的孤儿页
  - 缺失的交叉引用
  - 定理页是否包含「详细证明」区段
  - 证明中是否有以"易见"、"显然"等措辞跳过的步骤
- **加载策略**:见 [docs/CONTEXT.md](CONTEXT.md) §2.5。

## 4. 核验(Verify)

- **触发**:用户说「核验 <页面>」。
- **输入**:待核验的 wiki 页面。
- **输出**:每条事实性主张标 E/A 级;E 级标 `[AI-核验]`,A 级等待用户核验;`status` 字段升级。
- **加载策略**:见 [docs/CONTEXT.md](CONTEXT.md) §2.4 末尾。

## 5. 重构(Refactor)

- **触发**:用户说「重构 <页面>」/「合并」/「拆分」/「迁移」。
- **输入**:涉及的一个或多个 wiki 页面。
- **输出**:合并/拆分/迁移/重命名后的页面 + 双向 wikilink 完整 + `log.md` 追加。
- **合并约束**:合并时须修复全部 wikilink 与 `wiki/index.md`(删除/更新被并入页的条目),并在 `log.md` 记录。
- **加载策略**:见 [docs/CONTEXT.md](CONTEXT.md) §2.6。

## 6. 审计(Audit)

- **触发**:用户说「审计」「audit」「全量审计」。
- **输入**:`wiki/` 全部页面 + `wiki/open-questions.md`。
- **输出**:LLM 主导的语义巡查报告(跨页一致 / 反链 / 表达 / 矛盾 / 陈旧)。
- **加载策略**:见 [docs/CONTEXT.md](CONTEXT.md) §2.7。

## 7. 与 Zotero 的衔接

- Zotero 管理 PDF、元数据、批注;**Better BibTeX** 生成稳定 citation key。
- **Zotero Integration 插件**(mgmeyers)按 `templates/zotero-import.md` 把一个 Zotero 条目 + 其 PDF 批注导入为 `raw/papers/<citekey>.md`。
- citation key 同时是源页文件名与 frontmatter `sources` 字段,构成 raw↔wiki 的唯一锚点。

## 8. 修订记录

| 日期 | 变更 | 原因 |
|------|------|------|
| 2026-08-12 | 删除具体步骤列表(改由 CONTEXT.md 承担),保留高层概念与 Zotero 衔接;改为「目标 + 触发 + 加载策略指针」 | docs 结构重构(spec:restructure-docs-eliminate-overlap) |
| 2026-08-13 | 高亮 Enrich/Mint/Skip 决策、唯一性强制、新雇测试/index 同步、OKF 对齐 | 规则修订 spec:revise-rules-entity-governance |
