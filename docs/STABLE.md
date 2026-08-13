# STABLE.md — 稳定区与自由度分类

> 本文件对应 Harness Engineering「Architectural Constraints」支柱:稳定区是项目的硬核,自由区是 LLM 的创作空间,灰区是演化中的判定区。
>
> 「约束让 Agent 更高效,而非更低效——通过阻止无用探索。」

---

## 1. 三档分类

### 1.1 稳定区 (Stable Zone)

**定义**：不应轻易修改的部分。修改须用户明示,并写入 `wiki/log.md`。

**当前稳定区清单**(2026-08-12 审定):

| 内容 | 文件 | 稳定理由 |
|------|------|---------|
| 三层架构 | `raw/` / `wiki/` / `scratch/` | 项目身份,不可变 |
| 文件处理规则 | `AGENTS.md` 关键约束、永不修改 `raw/`、不读不写 `scratch/` | LLM 行为契约 |
| 基础概念登记 | `[[lp-space]]`、`[[ellp-space]]`、`[[schwartz-space]]`、`[[good-kernel]]` 必须有独立页 | 反向强制使用 wikilink |
| Stein 记号约定 | `docs/NOTATION.md` 强制表 | 内容一致性的根 |
| status 流转规则 | `unverified → pending-verification → verified` / `→ superseded` | 核验链可追溯 |
| lint 强制约束 | `scripts/lint-wiki.ps1` 14 节 | 机械执行的人类品味 |
| AGENTS.md / docs/ 路径 | L1/L2 导航表 | 配置层级的稳定 |

### 1.2 灰区 (Gray Zone)

**定义**：可演化但需谨慎。LLM 与用户共同决定演化方向。

**当前灰区清单**：

| 内容 | 文件 | 演化状态 |
|------|------|---------|
| Wiki 实体页内容 | `wiki/**` | 持续摄取 / 修订 |
| 方法体系 | `wiki/methods/*.md` | 按需增删,每次更新交叉引用 |
| proof-claim 数量 | 各定理页 | 与 Stein 原书证明粒度对齐 |
| log.md 格式 | `## [YYYY-MM-DD] <op> | <title>` | 已稳定,但细节可微调 |
| open-questions.md | 矛盾追踪格式 | 已稳定 |

### 1.3 自由区 (Free Zone)

**定义**：LLM 可自由创作,不受强约束。

**当前自由区清单**：

| 内容 | 文件 | 自由度 |
|------|------|--------|
| 笔记页 | `wiki/notes/*.md` | AI 可撰写原创内容 |
| 反向引用区段 | 各页「引用本定理的引理」 | LLM 可酌情添加 |
| audit / refactor 命令的细节 | `.trae/commands/*.md` | 用户可自定义 |
| log.md 文案 | 时间线条目描述 | LLM 自由编写 |
| 表达式与措辞 | 全部 wiki 内容 | 在 What/Why/What-if 框架内自由 |

---

## 2. 稳定区的修订流程

### 2.1 触发

稳定区的任何修改必须由用户明示(如「修改 X」「调整 Y」)或会议讨论产生共识。

### 2.2 步骤

1. 用户明示修改意图。
2. LLM 评估影响范围(哪些页面 / 命令 / 文档受影响)。
3. 在 `wiki/log.md` 追加「schema-XXX」条目,记录变更原因。
4. 修改稳定区内容。
5. 同步更新引用该稳定区的下游文件(如修改 `SCHEMA.md` 须同步更新 `EXAMPLES.md`、`lint-wiki.ps1`)。
6. 运行 lint 验证未引入 ERROR/WARNING。

### 2.3 反例(不应做的事)

- LLM 在未获授权的情况下修改 `AGENTS.md` 的「核心原则」节。
- LLM 自行将 `[[lp-space]]`（或 `[[ellp-space]]`）从基础概念清单中删除。
- LLM 修改 Stein 记号约定表(如把 $e^{-2\pi i\xi x}$ 改为 $e^{-i\xi x}$)。
- LLM 改变 status 流转方向(如允许 `verified → unverified`)。

---

## 3. 灰区演化建议

### 3.1 Wiki 实体页

- 摄取新源:走 `.trae/commands/ingest.md` SOP。
- 修订旧页:用 `.trae/commands/refactor.md` SOP。
- 涉及多个页面的修订:在 `wiki/log.md` 标注「refactor」条目。

### 3.2 方法体系

- 每摄取新章节后,识别该章节中的「反复利用的证明技巧」是否已建 method 页。
- 缺失则新建;冗余则合并或拆分。
- 每次 method 变更须同步更新所有引用该 method 的定理页的交叉引用。

### 3.3 proof-claim 数量

- 与 Stein 原书证明的粒度对齐——既不省略关键步骤,也不冗余。
- 评判标准:遵循 `docs/PROOFS.md` 第三节「技术性 Claim」提取规则。

---

## 4. 与 Harness Engineering 的对应

| Harness 概念 | 本项目实现 | 对应分类 |
|-------------|----------|---------|
| 核心硬约束 | 稳定区 | 1.1 |
| 演化缓冲 | 灰区 | 1.2 |
| Agent 创作空间 | 自由区 | 1.3 |
| 模式强制 | 稳定区 + lint | 1.1 + L6 |
| Entropy Management | 灰区演化 | 1.2 |

---

## 5. 修订记录

| 日期 | 变更 | 原因 |
|------|------|------|
| 2026-08-12 | 新建 STABLE.md(稳定区/自由区/灰区) | 对齐 Harness Engineering 三大支柱;提供稳定区保护机制 |

---

**本文档是 L2 详细规范的扩展,由 AGENTS.md「配置层级」节指向。**