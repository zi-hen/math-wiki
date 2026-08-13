# 命令:状态概览

## 目标

输出 wiki 当前的页面统计、status 分布、strength 分布、未决问题与最近变更。

## 触发词

- 「状态」「概览」「status」

## 工具路径

- 入口: `wiki/index.md`(获取页面统计)
- 扫描: 所有 wiki 页面 frontmatter(统计 status / strength 分布)
- 未决问题: `wiki/open-questions.md`
- 最近日志: `wiki/log.md`(最近 5 条)

## 完成判据

- 输出包含 6 类页面数(concepts / theorems / lemmas / methods / topics / people / sources / exercises / problems / notes)
- status 分布(4 + 4 = 8 种取值)
- strength 分布(strong / standard / weak,仅非 source 页)
- open-questions 列表(仅 open 项)
- 最近 5 条 log 记录

## autonomy

**自动** — 直接执行,无需请示。

## 输出格式

```markdown
## Wiki 状态概览(YYYY-MM-DD)

### 页面统计

| 类别 | 数量 |
|------|------|
| concepts | N |
| theorems | N |
| lemmas | N |
| methods | N |
| topics | N |
| people | N |
| sources | N |
| exercises | N |
| problems | N |
| notes | N |
| **合计** | N |

### Status 分布

| Status | 数量 |
|--------|------|
| verified | N |
| pending-verification | N |
| unverified | N |
| superseded | N |
| draft | N |
| in-progress | N |
| mature | N |
| archived | N |

### Strength 分布(非 source 页)

| Strength | 数量 |
|----------|------|
| strong | N |
| standard | N |
| weak | N |

### 未决问题

- [列出 open-questions.md 中的未解决项]

### 最近变更

- [列出最近 5 条 log 记录]
```
