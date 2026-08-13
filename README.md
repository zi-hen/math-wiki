# Math Wiki — Obsidian × Zotero × LLM 工作流

依据 Karpathy《LLM Wiki》笔记搭建的渐进式知识库。三层架构：**raw/**（不可变源）→ **wiki/**（LLM 维护）→ **scratch/**（人类私有）。本文件是安装与操作指南。

> 核心思想：LLM 增量地构建并维护一个持久的、互链的 markdown 知识库，置于你与原始源之间。每加入一个源，LLM 读取、提取、整合进现有 wiki——更新实体页、修订综述、标注矛盾。知识被编译一次后持续保鲜，而非每次提问从零检索。

---

## 0. 你将得到什么

```
Zotero 收集 PDF + 批注 ──┐
                         ├─→ Zotero Integration 插件导出 ──→ raw/papers/<citekey>.md
Web Clipper 剪藏网页 ────┘                                      │
                                                                 ▼
                                          LLM 按 AGENTS.md 摄取 ──→ wiki/ 各页
                                                                 │
                                                                 ▼
                                                  Obsidian graph view 浏览
```

- **Zotero** 扮演 raw 层的「源管理器」：PDF、元数据、批注，由 Better BibTeX 提供稳定 citation key。
- **Obsidian** 扮演「IDE」：浏览、graph view、Dataview 查询、Marp 幻灯。
- **LLM agent** 扮演「程序员」：读源、写摘要、维护交叉引用、标注矛盾。

---

## 1. 前置安装

### 1.1 Zotero（源管理器）

1. 安装 [Zotero 7](https://www.zotero.org/download/)（含内置 PDF 阅读器）。
2. 安装 [Better BibTeX for Zotero](https://retorque.re/zotero-better-bibtex/installation/)：
   - 下载 `.xpi` → Zotero → 工具 → 插件 → 齿轮 → Install Add-on From File。
3. 配置 citation key 格式： Zotero → 编辑 → 首选项 → Better BibTeX → Citation keys。
   推荐公式（生成形如 `stein1971introduction` 的稳定键）：
   ```
   auth.lower + shorttitle(3,3).lower + year
   ```
   或用 `author.lower + year + shorttitle.lower`。关键是**稳定且唯一**。
4. 导出选项：Better BibTeX → Export，可设自动导出 `.bib` 到本仓库（便于 LaTeX 引用）。
5. 在 Zotero 首选项 → Export → Quick Copy，选择一个引用样式（如 APA 或 Chicago）；Zotero Integration 的引用功能依赖此项。

### 1.2 Obsidian（wiki IDE）

1. 安装 [Obsidian](https://obsidian.md/)。
2. 把 `math-wiki/` 文件夹**作为 vault 打开**：Open folder as vault → 选 `math-wiki/`。
3. 安装社区插件（设置 → 社区插件 → 关闭安全模式 → Browse）：

| 插件 | 作用 | 必装 |
|------|------|------|
| **Zotero Integration** (mgmeyers) | 从 Zotero 导入条目 + PDF 批注为 markdown | 是 |
| **Dataview** | 基于 frontmatter 的动态查询表 | 强烈推荐 |
| **Templater** | 模板插入（可选，LLM 也直接写） | 可选 |
| **Web Clipper**（官方浏览器扩展） | 网页 → markdown 存入 raw/web/ | 推荐 |
| **Marp Slides** | 从 wiki 生成幻灯 | 可选 |

4. **附件文件夹**：设置 → Files and links → Attachment folder path 设为 `raw/papers/assets`。这样图片落入固定目录，LLM 可直接引用。
5. **下载附件快捷键**：设置 → Hotkeys → 搜 "Download attachments for current file"，绑定如 `Ctrl+Shift+D`。剪藏文章后按此键把图片下载到本地。

### 1.3 配置 Zotero Integration 插件

设置 → Zotero Integration：

- **Import format**: 选 Markdown，**Template file** 指向 `templates/zotero-import.md`。
- **Output path / folder**: 设为 `raw/papers`（导入的笔记落此）。
- **PDF import**: 开启（导入时一并复制 PDF 引用）。
- 确保 Zotero 桌面端**正在运行**（插件通过本地 API 通信）。
- Better BibTeX 必须已启用——Zotero Integration 依赖其 citation key。

> 插件命令：`Zotero Integration: Create Markdown note from annotation`（或自定义命令名）。可绑快捷键。

---

## 2. 目录结构

```
math-wiki/                       ← Obsidian vault 根
├── AGENTS.md                    schema：LLM 的「宪法」（含 Stein 记号约定）
├── README.md                    本文件
├── raw/                         不可变原始源（LLM 只读）
│   ├── inbox/                   未分类新源（含 AI 对话摘要，status=unverified）
│   ├── papers/                  Zotero Integration 导出，文件名 = citation key
│   │   └── assets/              PDF 提取的图片
│   ├── books/                   书籍章节笔记
│   ├── web/                     Web Clipper 剪藏
│   └── personal/                个人笔记（人类独立思考产物；NEW 2026-08-11）
│       ├── notes/               电子笔记的 markdown 化
│       └── sketches/            草图与图示
├── wiki/                        LLM 维护的知识库
│   ├── topics/                  综述页（evolving thesis）
│   ├── concepts/                概念实体页
│   ├── theorems/                定理实体页
│   ├── methods/                 方法/技巧页
│   ├── people/                  数学家页
│   ├── sources/                 每源一页摘要
│   ├── index.md                 内容目录
│   ├── log.md                   时间线日志（仅追加）
│   └── open-questions.md        矛盾与未决
├── scratch/                     人类私有记事本（LLM 不碰）
├── scripts/                     自动化脚本（lint 等，NEW 2026-08-11）
└── templates/                   模板
    ├── zotero-import.md         Zotero Integration 导入模板
    ├── source-summary.md
    ├── concept.md
    ├── theorem.md
    ├── topic.md
    ├── method.md
    └── person.md
```

---

## 3. 三种操作

### 3.1 摄取（Ingest）—— 加入一个源

**路径 A：论文（经 Zotero）**

1. 在 Zotero 内用内置 PDF 阅读器阅读论文，做高亮/批注。
2. Obsidian 内运行 Zotero Integration 命令 → 选该条目 → 生成 `raw/papers/<citekey>.md`（含元数据 + 全部批注）。
3. 对 LLM 说：「摄取 `<citekey>`」。
4. LLM 读 raw 笔记 → 与你讨论要点 → 在 `wiki/sources/<citekey>.md` 写摘要 → 更新 8–15 个相关实体页 → 更新 index → 追加 log。

**路径 B：网页（经 Web Clipper）**

1. 浏览器装 Obsidian Web Clipper → 一键把文章转 markdown 存入 `raw/web/`。
2. `Ctrl+Shift+D` 下载图片到 `raw/papers/assets`（可选）。
3. 对 LLM 说：「摄取 `raw/web/<file>`」。

**路径 C：AI 对话摘要（quarantine）**

1. 把 ChatGPT/Claude 对话导出为 markdown，放入 `raw/inbox/`。
2. 这类源 `status: unverified`，须与原始文献（如 Stein 原书段落）逐条核验后方可提升为依据。

> 单源通常触及 8–15 个 wiki 页面。LLM 做所有交叉引用与簿记工作。

### 3.2 查询（Query）—— 提问

1. 对 LLM 提问。
2. LLM 先读 `wiki/index.md` 定位 → 钻取相关页 → 必要时回溯 raw 原文核验 → 综合回答，附内联引用 `[[citekey|描述]]`。
3. 若回答是有价值的综合（对比表、新分析、发现的联系），征得同意后**回填**为新 wiki 页——探索同样复利积累。
4. 输出可变：markdown 页、对比表、Marp 幻灯、matplotlib 图。公式一律 Stein 记号。

### 3.3 健检（Lint）—— 维护 wiki 健康

#### 3.3.1 触发与流程

定期对 LLM 说「lint」，或执行 `scripts/lint-wiki.ps1`（PowerShell）/`lint-wiki.sh`（Bash）。自动检测：

- 悬空 wikilink（如本次发现的 `dirichlet-theorem-on-primes-on-primes` 文件名重复）。
- Stein 记号一致性（全文禁止 $1/(2\pi)^d$、$(2\pi)^{-d/2}$ 等非 Stein 约定）。
- frontmatter 完整性（type/title/status/sources/strength）。
- status 流转合法性（仅允许 §3.3 AGENTS.md 所列路径）。
- sources 可回溯性（每页 sources 必须在 raw/ 或 wiki/sources/ 中存在）。

LLM 收到报告 → 你确认 → 修复 → 追加 log。

#### 3.3.2 巡检清单（人工 lint）

- 页面间矛盾（同一量在不同页不同陈述）。
- 被新源取代的陈旧主张（`status: superseded` 却被引用）。
- 无入链的孤儿页。
- 被多处提及却无独立页的重要概念。
- 缺失交叉引用。
- 强弱关系标注（`strength` 字段）。
- 工作空间声明（「陈述」/「定义」区段须含 $\mathbb{R}^d$、$\mathbb{T}$、$G$ 等）。
- 可经 web 搜索填补的缺口。

LLM 出报告 → 你确认 → 修复 → 追加 log。

---

## 4. 关键约定

### 4.1 Stein–Shakarchi 记号（强制）

| 对象 | 公式 |
|------|------|
| Fourier 变换 | $\hat{f}(\xi)=\int f(x)\,e^{-2\pi i \xi x}\,dx$ |
| Poisson 求和 | $\sum_{n\in\mathbb{Z}} f(n)=\sum_{n\in\mathbb{Z}}\hat{f}(n)$（无 $2\pi$ 因子） |

源若用他约，摄取时换算并注「〔已换算为 Stein 约定〕」。详见 `AGENTS.md` §1。

### 4.2 验证状态

- 每页 frontmatter 含 `status: verified | unverified | superseded`。
- `unverified` 内容**不得作为其他页依据**（防循环证据）。
- 经 raw/ 核验后升 `verified`；被新源取代改 `superseded`。

### 4.3 citation key 是唯一锚点

Zotero 的 Better BibTeX citation key 同时是：
- `raw/papers/<citekey>.md` 的文件名，
- `wiki/sources/<citekey>.md` 的文件名，
- 各页 frontmatter `sources` 字段的条目，
- 行内引用 `[[citekey|描述]]` 的目标。

构成 raw ↔ wiki 的可回溯链。

---

## 5. 日常使用范式

- **屏幕布局**：一侧开 LLM agent，一侧开 Obsidian。LLM 编辑，你实时浏览——跟链接、看 graph view、读更新后的页。
- **graph view**：观察 wiki 形态——枢纽页、孤儿页、连通分量。
- **Dataview**：动态查 `status: unverified` 的页、按 `updated` 排序、按 `tags` 过滤。
- **版本控制**：整个 `math-wiki/` 即一个 git 仓库。`git init` 后享有历史、分支、协作。

### Dataview 示例查询

在任意页插入：

````markdown
```dataview
TABLE status, updated, sources
FROM "wiki/concepts"
WHERE status = "unverified"
SORT updated DESC
```
````

---

## 6. 给 LLM agent 的启动提示

在 LLM agent（如 Claude Code、Codex、TRAE）会话开始时，粘贴：

```
你在维护一个 LLM Wiki。先读 AGENTS.md（schema），它规定记号约定、
页面类型、摄取/查询/lint 流程。raw/ 只读，wiki/ 由你写。
我会在 Obsidian 旁实时浏览你的编辑。现在开始：摄取 <citekey>。
```

---

## 7. 扩展点

- **qmd**：当 wiki 增长到数百页，用 [qmd](https://github.com/tobi/qmd)（本地 BM25/向量混合搜索 + LLM 重排）替代纯 index 检索。
- **Marp**：从 topic 页直接生成幻灯。
- **Excalidraw**：手绘草图嵌入 wiki（配合 Quicker 动作从 Zotero 批注导入）。
- **多领域**：仿 bluejaeha 的做法，在 `raw/` 与 `wiki/` 下按领域分目录（fourier-analysis / number-theory / pde …），每域可有自己的引用格式约定。

---

## 8. 文件清单

| 文件 | 角色 |
|------|------|
| `AGENTS.md` | schema，LLM 的宪法 |
| `README.md` | 本文件 |
| `templates/zotero-import.md` | Zotero Integration 导入模板（Nunjucks） |
| `templates/source-summary.md` | 源摘要页模板 |
| `templates/concept.md` | 概念页模板 |
| `templates/theorem.md` | 定理页模板 |
| `templates/topic.md` | 综述页模板 |
| `templates/method.md` | 方法页模板 |
| `templates/person.md` | 人物页模板 |
| `wiki/index.md` | 内容目录 |
| `wiki/log.md` | 时间线日志 |
| `wiki/open-questions.md` | 矛盾与未决 |

> 起步只需三步：① Zotero + Better BibTeX 配好 citation key；② Obsidian 打开本文件夹为 vault 并装 Zotero Integration 指向 `templates/zotero-import.md`；③ 把 AGENTS.md 内容发给你的 LLM agent，说「摄取第一个源」。
