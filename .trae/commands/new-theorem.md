# 命令:新建定理页

## 目标

按 What/Why/What-if 框架(含详细证明)创建新的定理 wiki 页。

## 触发词

- 「新建定理 <名称>」
- 摄取过程中发现需要新建的定理

## 工具路径

- 写入: `wiki/theorems/<slug>.md`
- 模板: `templates/theorem.md`、`docs/EXAMPLES.md`(定理模板)
- 必读: `docs/PROOFS.md`(证明规范)、`docs/STRENGTH.md`(强度判定)、`docs/SCHEMA.md`、`docs/NOTATION.md`
- 更新: `wiki/index.md`、`wiki/log.md`
- 校验: `scripts/lint-wiki.ps1`

## 完成判据

- frontmatter 必填字段齐全(含 `strength: strong/standard/weak` + `strength_basis` 显式说明条件与结论)
- What 区段:工作空间声明 + 形式化陈述(Stein 记号)+ 来源标注 + 前提条件 + ≥ 2 个典型例子
- Why 区段:动机 + 证明思路(分步列表) + **详细证明**(以完整语句逐步写出,每步标注依据,技术性 Claim 独立证明,以 $\blacksquare$ 结尾)
- What-if 区段:≥ 1 个反例 + ≥ 2 种等价叙述(从具体到抽象) + 推广/变体
- 证明难度差异区段:比较不同证明路径的难度(low / medium / high / extremely high)
- 应用区段:定理在哪些问题中发挥作用
- 关联区段:前置定理、推论、关联概念(wikilink)
- `lint` 0 ERROR / 0 WARNING

## autonomy

**一次确认** — 涉及新建页面前先与用户确认:定理名、工作空间、strength 判定依据、status 初始值。

## 机械不变量(必执行,不可省)

- 详细证明必须以完整语句逐步写出,不得用黑板写法("易见"、"显然"等被 lint 检测为跳过措辞)
- Stein 原文中以文字概括的推理须提取为技术性 Claim 并独立证明(详见 `docs/PROOFS.md` §3)
- strength 判定须基于「条件 + 结论」(强 = 弱条件 + 强结论)
- 工作空间不写入 frontmatter,只在「陈述」区段声明
- 完成后运行 `scripts/lint-wiki.ps1` 修复所有新引入的问题
