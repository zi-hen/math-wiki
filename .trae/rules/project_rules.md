# Project Rules — Math Wiki

> Trae 加载的项目规则(执行级)。与 `AGENTS.md` 不重复——AGENTS.md 是项目身份与地图,本文件是 Trae 始终加载的硬约束。冲突时本文件优先(Trae 实际加载)。

---

## File Handling

- **NEVER modify** any file under `raw/`. This is the immutable source layer.
- **NEVER read or write** any file under `scratch/`. This is the human's private space.
- Every wiki claim must be traceable to a source page (via wikilink or citekey).
- `unverified` sources cannot serve as the sole basis for other pages.
- Working space ($\mathbb{R}^d$, $\mathbb{T}$, $G$) must be declared in the "陈述"/"定义" section, **not** in frontmatter.

---

## Stein–Shakarchi Notation (Hard Constraints)

All formulas must follow Stein–Shakarchi notation. Full rules: `docs/NOTATION.md`.

- Fourier transform: $\hat{f}(\xi) = \int f(x)\,e^{-2\pi i \xi x}\,dx$ (kernel $e^{-2\pi i\xi x}$, **no** $1/(2\pi)$ or $1/\sqrt{2\pi}$ normalization)
- Inverse Fourier transform: $f(x) = \int \hat{f}(\xi)\,e^{2\pi i \xi x}\,d\xi$
- Poisson summation: $\sum_{n\in\mathbb{Z}} f(n) = \sum_{n\in\mathbb{Z}} \hat{f}(n)$ (**no** $2\pi$ factor)
- Convolution: $(f*g)(x) = \int f(x-y)g(y)\,dy$
- Schwartz space: $\mathcal{S}(\mathbb{R}^d)$ (must use `\mathcal{S}`, not plain `S`)
- $L^p$ norm: $\|f\|_p = (\int |f|^p)^{1/p}$

If a source uses different conventions, convert to Stein conventions and mark with 「〔已换算为 Stein 约定〕」. Traditional (non-Stein) formulations must be marked with 「〔非 Stein 约定〕」.

New notation not covered by `docs/NOTATION.md` is registered into the notation table **by default** when no conflict exists; only conflicts (one object with two notations, or one symbol with two meanings) trigger review and are logged to `wiki/open-questions.md`.

---

## Language

- All wiki content must be written in **Chinese** (academic mathematical style, similar to Stein's mathematical writing).
- Mathematical formulas use LaTeX inline (`$...$`) and display (`$$...$$`) math.
- Code comments and variable names in scripts may use English.

---

## Frontmatter (Required Fields)

```yaml
---
type: concept | theorem | lemma | method | topic | person | source | exercise | problem | note
title: <中文标题>
aliases: [<英文别名>]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [<citekey>]
status: unverified | verified | pending-verification | superseded | draft | in-progress | mature | archived
tags: [<主题>]
description: <一句话摘要>  # 可选;概念/定理/方法/引理推荐填写,与 index.md 条目一致
strength: strong | standard | weak  # required for concept/theorem/method/topic/person; NOT set for source/lemma/exercise/problem/note
strength_basis: <判定依据>
---
```

Full schema: `docs/SCHEMA.md`. Status transitions: `unverified → pending-verification → verified` or `unverified → superseded`; notes use `draft → in-progress → mature → archived`.

---

## Page Writing Framework (What / Why / What-if)

Every **concept** and **theorem** page must cover three types of questions (full templates in `docs/EXAMPLES.md`):

| Type | Question | Section |
|------|----------|---------|
| **What** | What are the facts? | Definition, statement, properties |
| **Why** | Why does it hold? | Motivation, proof strategy |
| **What-if** | What if conditions change? | Counterexamples, equivalent formulations, generalizations |

**Lemma pages** (`type: lemma`) only need statement + brief proof + application — no strength field, no What/Why/What-if.

**Theorem pages** must include a "详细证明" (detailed proof) section with motivation, step-by-step reasoning, and extracted Claims. Standard: `docs/PROOFS.md`.

**Proof difficulty** evaluated on a four-level scale: low / medium / high / extremely high.

---

## Basic Concept Registration

When any wiki page uses a foundational concept, that concept **must** have an independent wiki page. Reference via wikilink. **Never** define a basic concept inline in a theorem page.

Currently registered basic concepts:
- `[[lp-space|$L^p$ space]]` — `wiki/concepts/lp-space.md`
- `[[ellp-space|$\ell^p$ space]]` — `wiki/concepts/ellp-space.md`
- `[[schwartz-space|Schwartz space]]` — `wiki/concepts/schwartz-space.md`
- `[[good-kernel|good kernel]]` — `wiki/concepts/good-kernel.md`

---

## 实体治理(Entity Governance)

建页/摄取的实体硬约束。完整决策树见 `docs/STRUCTURE.md` §3.2。

1. **method/lemma「真假」判定**:区分要点是「真假」而非「程序性」——有真假的数学命题归 lemma/theorem;无真假、可复用的技巧/思路/套路归 method。method **允许抽象**(证明 trick、证明技术、论证模式),步骤非必填。
2. **method 页禁未证明断言**:method 页中出现的任何数学断言(如 $|f|\ge c \Rightarrow |1/f|\le 1/c$)必须 wikilink 到 lemma/theorem 页,或作为技术性 Claim 给出证明;不得裸断言。
3. **一页一实体**:同一定理/概念/方法/引理的不同形式只在一个实体页记录(等价叙述/其他证明放入对应区段);建页/摄取前必须唯一性检索(index.md + grep 别名/章节号),重复 → 合并。
4. **实体页最小原则**:如无必要,勿增实体。新建实体页须满足三者至少其一:基础概念登记或核心定理/方法;内容量足够、无法内嵌;被引用需独立锚点。否则并入既有页或源页摘录。
5. **相关习题填充**:theorem/concept 页对强相关(替代证法、特例、反例、证明直接引用)的 exercise/problem,必须在「相关习题」区段填充**陈述**(不含证明);证明仅存在于习题页。
6. **摄取高亮处理**:摄取时每个高亮必须处理——Enrich(补充既有页)/ Mint(新建页,须过最小原则)/ Skip(记录于源页摘录);源页附「高亮处理清单」。
7. **frontmatter 可选 `description`**:一句话摘要(见 Frontmatter 节 schema),概念/定理/方法/引理推荐填写,与 index.md 条目一致(新雇测试,OKF 对齐)。
8. **example 类不立页**:具体数学对象(某个特定函数的展开、特定恒等式)的展示**不得独立为 theorem/lemma 页**;应收录到主定理/引理的「典型例子」节(如 $\pi\cot\pi z$ 部分分式展开 → [[residue-by-taylor-coeff]])。判别测试:此结果是否在文献中独立命名?独立证明是否多次出现?是否被 ≥2 个其他定理页引用?全否 → 不立 theorem 页(完整细则见 STRUCTURE §3.2.2)。

---

## 知识边界(Knowledge Boundary,硬约束)

LLM 在本项目中的数学知识**仅允许来自以下三类来源**,且**禁止网络检索**:

1. **`raw/`** —— 不可变原始源(Stein 教材笔记、个人笔记、剪藏等);
2. **`wiki/`** —— 已建立并验证的实体页(concept/theorem/lemma/method 等)与其证明;
3. **`docs/`** —— 项目规范(STRUCTURE/SCHEMA/PROOFS/NOTATION 等)。

**禁止行为**:网络检索;凭 LLM 训练数据「回忆」写未在 raw/ 或 wiki/ 出现的命题/证明/页码;在用户询问时编造未在知识库中的数学事实;引用未在 `raw/` 或 `wiki/` 出现的定理名称、人物、年份、文献。

**应用范围**:wiki 实体页撰写、源页摄取、用户询问的解答、lint 报告解读与修复建议。

---

## Lint Workflow

**Always run `scripts/lint-wiki.ps1` after modifying wiki pages.** Fix all errors and warnings before completing a task. The script checks 14 sections: broken wikilinks, duplicate slugs, Stein notation, frontmatter completeness, status/strength validity, basic concept wikilinks, working space declaration, orphan pages, theorem proof sections, proof skip phrases, back-link consistency, sources traceability, strength self-consistency, update freshness, superseded reference detection.

Full lint spec: `docs/CONTEXT.md` §配置层级 L6.

---

## Theorem Strength Classification

| Value | Criterion |
|-------|-----------|
| `strong` | Weak conditions + strong conclusions (e.g., Plancherel, Poisson summation) |
| `standard` | Moderate conditions and conclusions; reusable across scenarios |
| `weak` | Weak conclusions or counterexample-type theorems |

Full classification: `docs/STRENGTH.md`.

---

## Key File Paths

- `AGENTS.md` — project identity (read first)
- `docs/STRUCTURE.md` — directory structure and page types
- `docs/SCHEMA.md` — frontmatter schema and validation
- `docs/NOTATION.md` — Stein notation conventions
- `docs/STRENGTH.md` — theorem strength classification
- `docs/PROOFS.md` — proof writing standards
- `docs/WORKFLOW.md` — ingestion, query, lint workflows
- `docs/EXAMPLES.md` — concept and theorem page templates
- `scripts/lint-wiki.ps1` — automated lint script
- `wiki/index.md` — content index
- `wiki/log.md` — change log

---

## Tool Routing

Math Wiki has access to MCP servers, Skills, and Plugins in addition to local scripts. Use them according to the following routing rules.

### Priority

1. **Project scripts and commands first.** Prefer `scripts/lint-wiki.ps1` and `.trae/commands/*.md` for wiki-specific workflows.
2. **Reach for external tools only when scripts cannot do the job.** Examples: PDF parsing, online verification, Zotero sync, Obsidian vault queries, GitHub connector workflows.

### Approved Tools

| Tool | Use Case | Hard Constraints |
|------|----------|-----------------|
| **Zotero** | Manage references, export `.bib`, insert citekeys | Confirm before writing to the Zotero library |
| **PDF Monster** | Ingest and analyze PDF sources in `raw/` | Do not create `output/` folders in the working directory; clean temporary artifacts after use |
| **Obsidian CLI** | Search vault, inspect backlinks/tasks/properties | Read-only probe first; use `path=` for mutations; never mutate through ambiguous targets |
| **GitHub** | PR/issue triage, reviews, publishing | Prefer connector for PR/issue data; use local `git`/`gh` only for gaps |
| **Browser Use** | Verify public mathematical sources, access web sources | Only public, verifiable resources; do not use for paywalled or private content without user approval |
| **A/V Notes** | Transcribe math lectures or meetings | Transcripts containing mathematical terms must be reviewed before becoming wiki claims |

### Universal Constraints

- **NEVER** use any tool to modify files under `raw/`.
- **NEVER** use any tool to read or write files under `scratch/`.
- Any output that will be persisted to `wiki/` must pass `scripts/lint-wiki.ps1` before the task is considered complete.
- When a tool provides a connector (e.g., GitHub app) and a local CLI, prefer the connector for structured data and fall back to the CLI only for gaps.
