# Log — 时间线

> 仅追加。每条统一前缀 `## [YYYY-MM-DD] <op> | <标题>`，便于
> `grep "^## \[" wiki/log.md | tail -n 5` 取最近 5 条。

---

## [2026-08-11] init | 工作流初始化

- 依据 Karpathy《LLM Wiki》笔记搭建三层架构（raw / wiki / scratch）。
- 写入 `AGENTS.md`（schema，含 Stein 记号约定）。
- 建立模板集：`templates/`（zotero-import、source-summary、concept、theorem、method、topic、person）。
- 建立导航文件：`index.md`、`log.md`、`open-questions.md`。
- 集成方案：Zotero（Better BibTeX）→ Zotero Integration 插件 → `raw/papers/` → LLM 摄取 → `wiki/`。
