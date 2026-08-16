# AGENTS.md — Math Wiki 运行原则

> 本文件是 wiki 的**轻量地图**。具体规范存于 `docs/`,按任务需要钻取,不一次性全部加载。

---

## 项目身份

数学知识 wiki,涵盖 Fourier 分析、复分析与数论,主依 **Stein–Shakarchi** 记号。

| 维度 | 规则 |
|------|------|
| **架构** | `raw/`(不可变源)→ `wiki/`(LLM 维护)→ `scratch/`(人类私有,LLM 不读不写) |
| **语言** | wiki 内容中文(学术数学风格);脚本与变量名可英文 |
| **记号** | Stein 约定 — Fourier 核 $e^{-2\pi i\xi x}$、Poisson 无 $2\pi$ 因子、$\mathcal{S}$ 用花体。详见 `docs/NOTATION.md` |
| **真相** | 仓库内文件是唯一真相;LLM 内存不视为持久状态 |
| **OKF 对齐** | 设计参考 OKF(Object-Knowledge-First):一页一实体、断言可追溯;不安装外部 OKF skill/tool,仅作设计参考 |

---

## 自治边界(autonomy)

按任务风险分级——判断当前动作属于哪一级再决定行为。

| 等级 | 触发 | 行为 |
|------|------|------|
| **自动** | 读取 wiki、查询、生成草稿、运行 lint | 直接执行,事后通知 |
| **一次确认** | 新建页面、修改 schema、批量重构 | 一句话请示后执行 |
| **强确认** | 删除内容、跨多页大幅改动、修改 `raw/` 与 `scratch/` | 必须用户明示批准 |

**示例**:「新建概念 Schwartz 空间」→ 一次确认;「删除整页」→ 强确认;「运行 lint」→ 自动。

---

## 知识边界(硬约束,任何环节适用)

LLM 在本项目中的数学知识**仅允许来自以下三类来源**,且**禁止网络检索**:

1. **`raw/`** —— 不可变原始源(Stein 教材笔记、个人笔记、剪藏等);
2. **`wiki/`** —— 已建立并验证的实体页(concept/theorem/lemma/method 等)与其证明;
3. **`docs/`** —— 项目规范(STRUCTURE/SCHEMA/PROOFS/NOTATION 等)。

**禁止行为**:
- **网络检索**(任何形式)以获取教材外的数学事实、定理证明、引理出处;
- **凭 LLM 训练数据「回忆」**写未在 raw/ 或 wiki/ 出现的命题、证明、引用、页码;
- 在用户询问数学问题时**答非所问或凭印象编造**——只能基于 raw/wiki/docs 中存在的内容作答,否则须明确说明「未在知识库中,需用户提供原始材料」;
- 引用未在 `raw/` 或 `wiki/` 出现的定理名称、人物、年份、文献。

**应用范围**:wiki 实体页撰写与修订、源页摄取、用户询问的解答、lint 报告解读与修复建议,均遵守上述约束。违反此边界的事实性内容须剔除或显式标注「〔未在知识库,待核验〕」。

---

## 文档指针(按需钻取,不全部加载)

| 关注点 | 文档 |
|--------|------|
| 三层架构、页面类型 | [docs/STRUCTURE.md](docs/STRUCTURE.md) |
| Frontmatter 模式 | [docs/SCHEMA.md](docs/SCHEMA.md) |
| Stein 记号 | [docs/NOTATION.md](docs/NOTATION.md) |
| 定理强度 | [docs/STRENGTH.md](docs/STRENGTH.md) |
| 证明书写 | [docs/PROOFS.md](docs/PROOFS.md) |
| 摄取/查询/健检流程 | [docs/WORKFLOW.md](docs/WORKFLOW.md) |
| 页面模板 | [docs/EXAMPLES.md](docs/EXAMPLES.md) |
| Trae 命令 | [docs/COMMANDS.md](docs/COMMANDS.md) |
| 上下文加载 | [docs/CONTEXT.md](docs/CONTEXT.md) |
| 回归测试 | [docs/REGRESSION.md](docs/REGRESSION.md) |
| 稳定区 | [docs/STABLE.md](docs/STABLE.md) |

---

## Trae 集成

| 类型 | 文件 | 说明 |
|------|------|------|
| 项目规则 | [`.trae/rules/project_rules.md`](.trae/rules/project_rules.md) | Trae 始终加载的执行规则 |
| 命令模板 | [`.trae/commands/*.md`](.trae/commands/) | 按触发词调用,目标 + 触发词 + 工具路径 + 完成判据 + autonomy 五段 |

Trae 规则优先级:用户输入 > 智能体提示词 > `user_rules.md` > `project_rules.md`。详见 `docs/CONTEXT.md`。

---

## 会话启动最小读取

LLM 启动会话时按需加载,**不一次性读完**:

1. 本文件(`AGENTS.md`)—— 项目身份与自治边界。
2. `wiki/index.md` —— 定位已有页面。
3. `wiki/log.md`(最近 5 条)+ `wiki/open-questions.md`(仅 open 项)+ `wiki/.lint-last.md`(若存在)—— 当前状态。

其余按本轮任务钻进对应 `docs/` 文档与命令模板。

---

## 工具与路由(按需调用,不默认加载)

| 工具/能力 | 类型 | 何时使用 | 约束 |
|-----------|------|---------|------|
| `scripts/lint-wiki.ps1` | 项目脚本 | 每次 wiki 变更后 | 必须运行并修复 ERROR |
| `.trae/rules/project_rules.md` | Trae 规则 | 始终加载 | 执行级硬约束 |
| `.trae/commands/*.md` | 命令模板 | 按触发词 | 目标 + 触发词 + 工具路径 + 完成判据 + autonomy |
| **Zotero** (skill/plugin) | 文献管理 | 引用 / 导出 `.bib` / 插入 citekey | 写入 Zotero 库前确认 |
| **PDF Monster** (skill/plugin) | PDF 分析 | 摄取 `raw/` 中 PDF 源 | 不创建 `output/` 等目录,临时产物用后清理 |
| **Obsidian CLI** (MCP + skills) | Vault 操作 | vault 搜索 / backlinks / tasks / properties | 优先官方 CLI,只读先行 |
| **GitHub** (MCP + skills) | 版本控制 | PR / issue / 代码审查 / 发布 | 优先 connector,本地 `gh` 补缺口 |
| **Browser Use** (plugin) | 浏览器自动化 | 核验在线数学资源 / 访问 web 源 | 仅用于公开可验证资源 |
| **A/V Notes** (skill) | 音视频笔记 | 数学讲座 / 会议转写 | 转写结果须经人工核验术语 |
| Obsidian graph view | Obsidian 插件 | 观察 wiki 形态 | 只读 |
| Dataview 插件 | Obsidian 插件 | 基于 frontmatter 生成动态表 | 只读 |
| **Excalidraw 绘图**（skill） | `.claude/skills/excalidraw-diagram` + `excalidraw-obsidian` + Obsidian Excalidraw 插件 | **唯一绘图工具**——所有示意图用 Obsidian Excalidraw 插件直接画（用户习惯）；不要新建 SVG 或 .svg 流水线 | 模板库：`Excalidraw/Libraries/*.excalidrawlib`（9 个，由 Obsidian 加载）；脚本：`Excalidraw/Scripts/Downloaded/`（Excalidraw ScriptEngine，8 个脚本）；公式文本用 `fontFamily: 2`（系统字体），保证数学符号渲染；CJK 字体目录 `Excalidraw/CJK Fonts/` |

**路由原则**:
1. 项目脚本与命令模板优先。
2. 外部工具只解决脚本无法完成的事(PDF 解析、在线核验、Zotero 同步等)。
3. 任何工具都不得修改 `raw/` 或读取 `scratch/`。
4. 工具输出写入 wiki 前须通过 lint。
