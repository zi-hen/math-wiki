---
type: note
title: <笔记标题>
aliases: [<别名>]
created: 2026-08-11
updated: 2026-08-11
sources: []
status: draft
tags: [<主题>, <主题>]
authors: [<人类>, <AI>]
---

# <笔记标题>

> **笔记性质**：人类与 AI 共同维护的创作性学习笔记。是 wiki 中**唯一允许主观论述**的页面类型,反映跨章节联系与深度反思。

## 引子（可选）

[引发本笔记的契机:某个定理的反思、某次对话的结论、跨章节的联系等。]

## 主题论述

[主观论述区段。可包含:个人理解、跨章节联系、深度反思、对比分析、猜想与开放问题。]

## 与现有 wiki 的关联

- 涉及的概念：[[<concept-slug-1>]]、[[<concept-slug-2>]]
- 涉及的定理：[[<theorem-slug-1>]]
- 涉及的方法：[[<method-slug-1>]]
- 引用的源：[[<citekey>]]

## 反思与未决问题

[记录笔记中的开放问题或与现有 verified 页矛盾之处,后续须以 `wiki/open-questions.md` 跟踪。]

## 维护记录

| 日期 | 操作 | 维护者 |
|------|------|--------|
| 2026-08-11 | 初稿 | AI |

---

**注**:笔记页关键约束（详见 [docs/SCHEMA.md](docs/SCHEMA.md)「笔记页（Note）」节）:

1. `status` 取值为 `draft / in-progress / mature / archived`（生命周期流,非核验流）。
2. `sources` 可空(独立创作)或包含参考。
3. **不得作为其他页面的唯一依据**(可作旁证)。
4. 笔记中若与现有 `verified` 页内容冲突,须以 `wiki/open-questions.md` 记录该矛盾,**不得直接修改被引用页**。
5. 是 wiki 中**唯一允许 AI 撰写原创内容**的页面。