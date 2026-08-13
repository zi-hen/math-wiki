# 命令:健检

## 目标

运行机械不变量检查,确保 wiki 结构与记号与项目约定一致。

## 触发词

- 「lint」「健检」「检查」
- 重大编辑后自动触发

## 工具路径

- 脚本: `scripts/lint-wiki.ps1`(14 节检查)
- 输出: `wiki/.lint-last.md`(LLM 可读摘要)
- 写入: `wiki/log.md` 追加记录

## 完成判据

- `wiki/.lint-last.md` 状态为 ERROR 0 / WARNING ≤ 5 / INFO ≤ 5(不恶化既有状态)
- 所有新增 ERROR 必须修复
- WARNING 须修复或登记到 `wiki/open-questions.md`
- `wiki/log.md` 已追加 `## [YYYY-MM-DD] lint | <修复摘要>`

## autonomy

**自动** — 直接运行,事后通知结果。

## 机械不变量(必执行,不可省)

- 运行脚本后必须追加 `wiki/log.md`。
- 新引入的 ERROR 不可跳过(必须修复)。
- 修复涉及 schema 变更须同步更新 `docs/SCHEMA.md` 与 `wiki/log.md`。

## 14 节检查项(脚本自动)

1. 悬空 wikilink — ERROR
2. 重复 slug 模式 — ERROR
3. Stein 记号一致性 — WARNING
4. frontmatter 完整性 — WARNING/ERROR
5. status / strength 字段 — WARNING
6. 基础概念 wikilink — WARNING
7. 工作空间声明 — WARNING
8. 孤儿页 — INFO
9. 定理页证明区段 + 跳过措辞 — WARNING
10. 反链一致性 — WARNING
11. sources 可回溯性 — ERROR
12. strength 自洽性 — WARNING
13. update 新鲜度(> 90 天) — INFO
14. superseded 引用检测 — WARNING

## 常见修复(脚本自动建议)

- 悬空 wikilink:修正拼写或创建缺失页
- Stein 记号: $e^{-ix}$ → $e^{-2\pi i\xi x}$; $\frac{1}{2\pi}\int$ → $\int$; 传统约定叙述标注「〔非 Stein 约定〕」
- 基础概念 wikilink 缺失:首次提及处加 `[[lp-space|$L^p$]]` / `[[schwartz-space|$\mathcal{S}$]]` / `[[good-kernel|好核]]`
- 工作空间声明:在「陈述」/「定义」区段前加 `> **工作空间**:...`
- 孤儿页:在其他相关页面加反向 wikilink
