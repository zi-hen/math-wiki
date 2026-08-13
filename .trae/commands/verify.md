# 命令:核验

## 目标

核验 wiki 页面中的事实性主张,标记 E/A 分级,决定 status 流转。

## 触发词

- 「核验 <页面>」

## 工具路径

- 待核验页: `wiki/<category>/<page>.md`
- 回溯: `raw/papers/<citekey>.md` / `raw/inbox/<citekey>.md`
- grep 关键字 + WebFetch 验证(仅 E 级)
- 写入: 源页「待核验主张」区段 + `wiki/index.md` + `wiki/log.md` + `wiki/open-questions.md`(若发现矛盾)

## 完成判据

- 每条事实性主张已标 E 级或 A 级
- E 级主张附 grep 输出或 WebFetch 结果作为证据
- A 级主张标注「待用户核验」并说明归级理由
- 核验通过后可将 `status` 从 `unverified` 升级为 `pending-verification`
- 矛盾已登记到 `wiki/open-questions.md`
- `wiki/log.md` 已追加 `## [YYYY-MM-DD] verify | <页面名>`

## autonomy

**自动** — E 级核验(grep + WebFetch)直接执行。

**强确认** — A 级主张的最终核验须用户确认。

## 核验分级(详见 `docs/SCHEMA.md`)

| 等级 | 类型 | 核验责任 |
|------|------|---------|
| **E (Explicit)** | 教材中显式陈述的定理、定义、公式 | LLM 自行核验(grep + WebFetch),标 `[AI-核验]` |
| **A (Abstract)** | 抽象综合、群论诠释、统一结构 | 用户人工核验 |

### E 级认定标准(须**全部**满足)

1. 引用页码与定理编号明确。
2. 公式或叙述逐字匹配 Stein 原书。
3. 未引入抽象数学框架(如 Pontryagin 对偶、商群、谱定理等未在原书出现的术语)。

## 机械不变量(必执行,不可省)

- LLM 仅可自行核验 E 级主张;A 级主张须用户确认。
- 核验须附 grep 输出或 WebFetch 结果作为证据。
- 发现矛盾时不得自行修改主张,须登记到 `open-questions.md` 并告知用户。
- `unverified` 源不得提升其他 `unverified` 页为依据。
