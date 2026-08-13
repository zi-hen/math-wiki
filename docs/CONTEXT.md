# CONTEXT.md — 上下文加载与配置层级

> 本文件按任务类型组织加载策略——不再有「步骤 1→2→3」的过程性 SOP,改为「目标 → 最小读取集合 → 停止条件」。具体配置层级由 AGENTS.md「文档指针」承担。

---

## 1. 配置层级(八层架构)

所有「配置 / 规则 / 规范」按以下层级组织。冲突时上层覆盖下层。

| 层级 | 文件 / 目录 | 何时生效 | 谁能修改 |
|------|------------|---------|---------|
| **L1 行为总则** | `AGENTS.md` | 每次会话 | 用户与 LLM 共同演化(人类主笔) |
| **L2 详细规范** | `docs/*.md`(10 份) | 按需深入 | 用户明示 |
| **L3 schema** | `docs/SCHEMA.md` + `docs/NOTATION.md` + `docs/STRENGTH.md` | 摄取 / 创建时 | 修订须写入 `wiki/log.md` |
| **L4 命令** | `.trae/commands/*.md`(9 份) | 按触发词 | 用户新增 / 修订 |
| **L5 Trae 规则** | `.trae/rules/project_rules.md` | Trae 会话始终 | 复制到 Trae「项目规则」面板 |
| **L6 强制约束** | `scripts/lint-wiki.ps1`(14 节) | 自动执行 | 修订须同步 docs |
| **L7 模板** | `templates/*.md` | 创建页面时参考 | 用户新增 |
| **L8 实体** | `wiki/**` | 内容本体 | LLM 维护 |

**优先级**:L1 > L5 > L2 > L3 > L4 > L6 > L7 > L8。`project_rules.md`(L5)与 `AGENTS.md`(L1)冲突时 L5 优先(Trae 实际加载)。

---

## 2. 按任务类型的最小读取集合

> **原则**:能不读就不读。按本轮任务钻进对应文档,不一次性加载全部。

### 2.1 摄取新源

**目标**:建立源页与实体页的 wikilink 网络。

**最小读取**:
- `.trae/commands/ingest.md`(目标导向 SOP)
- `docs/SCHEMA.md`(frontmatter 字段)
- `docs/NOTATION.md`(Stein 记号)
- `templates/source-summary.md` + 涉及类型的 `concept.md` / `theorem.md` / `lemmma.md`

**停止条件**:
- 源页已建立 + 实体页引用完整
- `wiki/index.md` 与 `wiki/log.md` 同步
- `lint` 0 ERROR / 0 WARNING

### 2.2 创建概念页

**目标**:按 What/Why/What-if 框架创建新概念页。

**最小读取**:
- `.trae/commands/new-concept.md`
- `docs/EXAMPLES.md`(概念模板)
- `docs/STRUCTURE.md`(页面类型)

**停止条件**:
- 必填字段齐全 + 三类问题完整 + wikilink 网络完整
- `lint` 0 ERROR / 0 WARNING

### 2.3 创建定理页

**目标**:含详细证明的定理页。

**最小读取**:
- `.trae/commands/new-theorem.md`
- `docs/EXAMPLES.md`(定理模板)
- `docs/PROOFS.md`(证明书写规范)
- `docs/STRENGTH.md`(强度判定)

**停止条件**:
- 详细证明以完整语句逐步写出(无「易见」「显然」)
- strength_basis 显式说明条件与结论
- `lint` 0 ERROR / 0 WARNING

### 2.4 查询 / 综合回答

**目标**:定位并综合 wiki 内容,附引用。

**最小读取**:
- `wiki/index.md`(按类目浏览)
- 相关 `wiki/<category>/<page>.md`
- `raw/<source>/`(仅在需核验时;**不改**)

**停止条件**:
- 回答覆盖问题核心,附内联引用
- 中文学术数学风格,Stein 记号
- `status` 字段已正确标注

### 2.5 健检

**目标**:运行机械不变量检查。

**最小读取**:
- `.trae/commands/lint.md`
- `wiki/.lint-last.md`(若存在,了解上次状态)

**停止条件**:
- `lint` 0 ERROR / WARNING ≤ 5 / INFO ≤ 5
- `wiki/log.md` 已追加

### 2.6 重构

**目标**:合并/拆分/迁移/重命名 wiki 页面。

**最小读取**:
- `.trae/commands/refactor.md`
- `docs/WORKFLOW.md`(重构节)
- 当前涉及的所有 wiki 页

**停止条件**:
- 双向 wikilink 完整
- `lint` 状态不恶化
- `wiki/log.md` 已追加

### 2.7 审计

**目标**:语义巡查(跨页一致 / 反链 / 表达 / 矛盾 / 陈旧)。

**最小读取**:
- `.trae/commands/audit.md`
- `wiki/.lint-last.md`(机械巡检结果)
- `wiki/open-questions.md`(已知矛盾)

**停止条件**:
- 5 大类巡检全部覆盖
- 结构化报告输出
- 与用户确认优先级

### 2.8 schema 修订

**目标**:修订 frontmatter / 记号 / 强度分类的 schema。

**最小读取**:
- `docs/SCHEMA.md` / `docs/NOTATION.md` / `docs/STRENGTH.md`(对应文档)
- 现有 wiki 页的对应字段(影响范围评估)

**停止条件**:
- 新增/废弃字段已在对应 `docs/` 中说明
- 迁移路径明确(若有 breaking change)
- `wiki/log.md` 已追加

---

## 3. Token 预算(参考)

| 文件 | 预估 token | 加载频率 |
|------|----------|---------|
| `AGENTS.md` | ~1K | 每会话 1× |
| `wiki/index.md` | ~1K | 每会话 1× |
| `wiki/log.md`(最近 5 条) | ~1K | 每会话 1× |
| `wiki/open-questions.md` | ~0.5K | 每会话 1× |
| `wiki/.lint-last.md` | ~0.5K | 每会话 1× |
| `docs/*.md`(专题) | 各 1–3K | 按任务 |

**典型会话最低成本**:约 4K token 启动开销。其余按任务按需加载。

---

## 4. 跨会话记忆

本项目不使用 LLM 内部记忆(如 Claude conversation history)。所有跨会话状态均通过仓库内文件持久化:

| 信息类别        | 持久化位置                    | 谁维护           |
| ----------- | ------------------------ | ------------- |
| schema 修订历史 | `wiki/log.md`(追加)        | LLM 与人类共同     |
| 已知矛盾        | `wiki/open-questions.md` | LLM 记录,人类审定   |
| 最近 lint 状态  | `wiki/.lint-last.md`     | lint 脚本自动     |
| 摄取进度        | 各源页 `status` 字段          | LLM 摄取流程中维护   |
| 实体页核验状态     | 各实体页 `status` 字段         | LLM 摄取 / 核验流程 |

**原则**:仓库内文件是唯一真相;LLM 内存不视为持久状态。

---

## 5. 修订记录

| 日期 | 变更 | 原因 |
|------|------|------|
| 2026-08-12 | 新建 CONTEXT.md | 对齐 Harness Engineering Context Engineering 支柱;建立八层架构与六步加载 SOP |
| 2026-08-12 | 改写为按任务类型的最小读取 | 按 Claude 5 / GPT-5.6 新规——「全部堆叠→渐进披露」、「过程性 SOP→目标+停止条件」 |

---

**本文档是 L1 详细规范的扩展(L2),由 AGENTS.md「文档指针」指向。**
