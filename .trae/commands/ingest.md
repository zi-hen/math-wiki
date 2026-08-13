# 命令:摄取源

## 目标

将 `raw/` 中的新源摄取到 wiki,建立源页与实体页的 wikilink 网络,保证所有新主张可回溯。

## 触发词

- 「摄取 <源>」
- 文件放入 `raw/inbox/` 后由 LLM 主动摄取

## 工具路径

- 读取: `raw/papers/` / `raw/inbox/` / `raw/books/` / `raw/web/`
- 写入: `wiki/sources/<citekey>.md`、`wiki/concepts/`、`wiki/theorems/`、`wiki/lemmas/`、`wiki/methods/`
- 更新: `wiki/index.md`、`wiki/log.md`
- 校验: `scripts/lint-wiki.ps1`
- 钻取文档: `docs/WORKFLOW.md`、`docs/SCHEMA.md`、`docs/NOTATION.md`、`docs/EXAMPLES.md`

## 完成判据

- 源页已建立(含 frontmatter、摘要、关键摘录、概念清单、定理清单)
- 源中每个重要概念/定理/方法对应到 wiki 页(或新建)
- 所有新页面使用 wikilink 引用基础概念
- `wiki/index.md` 与 `wiki/log.md` 已同步
- `lint` 0 ERROR / 0 WARNING(INFO 可酌情保留)

## autonomy

**一次确认** — 涉及新建页面与 schema 引用,先向用户简述关键发现(3-5 条)与计划改动。

## 机械不变量(必执行,不可省)

- **永不修改** `raw/` 下任何文件。
- 每个 wiki 主张须可回溯到源页。
- `unverified` 源不得提升其他 `unverified` 页为依据。
- 摄取新源时若记号不一致,须换算为 Stein 约定并标注「〔已换算〕」。
- 完成后运行 `scripts/lint-wiki.ps1` 修复所有新引入的 ERROR/WARNING。
