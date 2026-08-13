# 命令:查询

## 目标

定位并综合 wiki 中相关页面,回答用户问题(可附引用)。

## 触发词

- 用户提问

## 工具路径

- 入口: `wiki/index.md`(按类目浏览)
- 钻取: 相关 `wiki/<category>/<page>.md`
- 回溯: `raw/`(仅在需核验时;**不改**)
- 写入(可选):新 wiki 页 + `wiki/index.md` + `wiki/log.md`
- 钻取文档: `docs/WORKFLOW.md`(查询节)

## 完成判据

- 回答覆盖问题核心,附内联引用(`[[citekey|描述]]` 或 `[[page-slug|页面名]]`)
- 中文学术数学风格,Stein 记号
- `status` 字段遵循:`verified` → 直接引用;`pending-verification` → 标「待核验」;`unverified` → 须交叉验证
- 若涉及多页综合,使用对比表或结构化格式
- 若回答有保存价值,**征得用户同意**后写为 wiki 页并追加 log

## autonomy

**自动** — 读取与综合回答直接执行。

**一次确认** — 是否保存为 wiki 新页(避免污染)。

## 机械不变量(必执行,不可省)

- 不得引用 `scratch/` 下的内容(LLM 不读不写)。
- 引用 `unverified` 源时须显式标注。
- 若 wiki 中无相关内容,坦诚说明并建议摄取相关源。
- 公式一律使用 Stein 记号。
