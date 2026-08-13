# 命令:重构 wiki 内容

## 目标

合并/拆分/迁移/重命名 wiki 页面,保持 wikilink 网络与 schema 一致。

## 触发词

- 「重构 <页面>」
- 「合并 <页面 A> 与 <页面 B>」
- 「拆分 <页面> 为 A 与 B」

## 工具路径

- 读取: 当前涉及的所有 wiki 页
- 写入: 新页面 + 旧页面删除/重定向
- 钻取: `docs/WORKFLOW.md`(重构节)、`docs/SCHEMA.md`
- 校验: `scripts/lint-wiki.ps1`(反链 + 孤儿 + 引用检测)
- 更新: `wiki/index.md`、`wiki/log.md`、`wiki/open-questions.md`

## 完成判据

- 重构意图明确(合并 / 拆分 / 迁移 / 重命名 四选一)
- 双向 wikilink 完整(若涉及双向引用关系)
- 旧 wikilink 已全部改写为新 slug
- `lint` 状态不恶化(ERROR 与 WARNING 计数不增加)
- `wiki/index.md` 调整条目归属与统计
- `wiki/log.md` 追加 `## [YYYY-MM-DD] refactor | <重构标题>`,简述动过的页面与原因
- 遗留矛盾(若有)记入 `wiki/open-questions.md`

## autonomy

**一次确认** — 重构前一句话请示用户意图(合并/拆分/迁移/重命名)与影响范围。

**强确认** — 删除原页面前须用户明示批准。

## 机械不变量(必执行,不可省)

- 重构前后 lint 状态**不得恶化**
- 涉及 frontmatter 字段修改时须同步更新 `docs/SCHEMA.md`(若新增字段)
- 不得修改 `raw/` 下任何文件
- 不得破坏 status 流转规则

## 四种重构操作

| 操作 | 关键步骤 |
|------|---------|
| **合并** | 选定保留页 A; B 内容并入 A; A 「关联」加 B 反向引用; B 删除; 所有 `[[B]]` 改写为 `[[A]]` |
| **拆分** | 原页 A 拆为 A' 与 B; 双向 wikilink; 删除 A,新建 A' 与 B |
| **迁移** | 跨目录迁移; `type` 字段更新; wikilink 无须改动; `index.md` 调整归属 |
| **重命名** | slug 改名; 所有 `[[old-slug]]` 改写为 `[[new-slug]]`(可用 grep 检索); `log.md` 记录重命名 |

## 与其他命令的关系

- **前置**: `status`(确认当前状态)、`audit`(审计跨页一致性)
- **后置**: `lint`(验证重构后状态)、`verify`(核验新合并页的主张)
