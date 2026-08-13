---
type: lemma
title: <引理名>
description: <一句话摘要>   # 可选;引理页推荐填写,与 index.md 条目一致
aliases: [<英文别名>]
created: 2026-08-11
updated: 2026-08-11
sources: [<citekey1>]
status: verified
tags: [<主题>]
---

# <引理名>

> **工作空间**：$\mathbb{R}^d$（或 $\mathbb{T}$、$G$ 等）。

## 陈述

> 设 $f \in \dots$，则 ……

（一律 Stein 记号。若源用他约，换算并注「〔已换算为 Stein 约定〕」。）

依据 [[<citekey>|来源, 页码]]。

## 证明

（简要,1–2 段。引理页不需要「详细证明」与「技术性 Claim」,直接给出论证。)

$\blacksquare$

## 应用

引用此引理的页面列表（双向引用）。

- [[<theorem-slug-1>]]：在「详细证明」第 N 步使用。
- [[<theorem-slug-2>]]：在「详细证明」第 M 步使用。
- [[<concept-slug>]]：在「What」陈述中引用。

## 来源

- [[<citekey>|作者 (年), §<节>, p.<页>]]

---

**注**:引理页与定理页的关键区别见 [docs/SCHEMA.md](docs/SCHEMA.md)「引理页（Lemma）」节。

- 无 `strength` 与 `strength_basis` 字段。
- 无 What/Why/What-if 框架。
- 无「证明动机」「证明思路」「详细证明」分层。
- 必须列出「应用」区段（引用此引理的页面）。