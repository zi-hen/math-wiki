# 命令:新建概念页

## 目标

按 What/Why/What-if 框架创建新的概念 wiki 页,确保与现有 schema 一致。

## 触发词

- 「新建概念 <名称>」
- 摄取过程中发现需要新建的概念

## 工具路径

- 写入: `wiki/concepts/<slug>.md`(小写、连字符、英文为主)
- 模板: `templates/concept.md`、`docs/EXAMPLES.md`(概念模板)
- 必读: `docs/SCHEMA.md`(frontmatter)、`docs/NOTATION.md`(Stein 记号)、`docs/STRUCTURE.md`(页面类型)
- 更新: `wiki/index.md`、`wiki/log.md`
- 校验: `scripts/lint-wiki.ps1`

## 完成判据

- frontmatter 必填字段齐全(`type/title/aliases/created/updated/sources/status/tags/strength/strength_basis`)
- What 区段:精确定义(Stein 记号)+ 来源标注 + 基本性质 + ≥ 2 个典型例子
- Why 区段:动机 + 直观解释
- What-if 区段:≥ 1 个反例 + 边界情形 + 等价叙述
- 关联区段:关联定理/方法/概念的 wikilink
- 基础概念以 wikilink 引用(`[[lp-space]]` / `[[schwartz-space]]` / `[[good-kernel]]` 等)
- 工作空间在「定义」开头显式声明
- `lint` 0 ERROR / 0 WARNING

## autonomy

**一次确认** — 涉及新建页面前先与用户确认:概念名称、工作空间、status 初始值。

## 机械不变量(必执行,不可省)

- slug 唯一,不与现有 slug 重复
- 工作空间不写入 frontmatter,只在「定义」区段声明
- 基础概念必须以 wikilink 引用,不得内联定义
- 完成后运行 `scripts/lint-wiki.ps1` 修复所有新引入的问题
