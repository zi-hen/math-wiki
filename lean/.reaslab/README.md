# ReasLab 工作流说明

> 本文件说明如何把 `math-wiki/lean/` 目录接入 [ReasLab](https://docs.reaslab.io/zh/guides/overview.html) 在线 IDE,完成 Lean 4 形式化证明。

## 为什么用 ReasLab

math-wiki 项目本机无 `lake` 工具链,而 ReasLab 提供:
- **浏览器级 Lean 语言服务器**——无需终端配置,Infoview 实时显示证明状态
- **AI 智能体**(可配置 DeepSeek、SiliconFlow、AiHubMix 等)——自动填写 `sorry` 占位
- **实时协作**——多人同时编辑 `.lean` 文件
- **GitHub 集成**——支持从 GitHub 导入已有仓库

## 接入步骤

### 1. 准备 GitHub 仓库

```powershell
cd e:\wikiproject\math-wiki\lean
git init
git add .
git commit -m "init: Lean 4 形式化项目骨架"
# 在 GitHub 创建仓库,把仓库推上去
git remote add origin https://github.com/<your-account>/math-wiki-lean.git
git push -u origin main
```

> **注意**:`lean/` 是 wiki 项目的**子目录**。如果不想把整个 `math-wiki/` 推到 GitHub,可单独把 `lean/` 抽出来作为独立仓库。

### 2. 在 ReasLab 创建 Lean 项目

1. 登录 [ReasLab](https://docs.reaslab.io/zh/guides/sign-up.html),创建账号(GitHub OAuth 或邮箱)。
2. 控制台点击「新建项目」,**类型选 Lean**。
3. 选择「从 GitHub 导入」,粘贴刚才创建的 `math-wiki-lean` 仓库 URL。
4. ReasLab 会自动读取 `lean-toolchain`(`leanprover/lean4:v4.8.0`)与 `lakefile.lean`。

### 3. 配置 AI 智能体

为启用"自动填写 sorry"功能:

1. 右上角齿轮 → 模型功能配置。
2. 添加服务商(参考 [provider-config 指南](https://docs.reaslab.io/zh/guides/provider-config.html)):
   - 推荐:**DeepSeek**(`https://api.deepseek.com`)或**硅基流动**(`https://api.siliconflow.cn`)
   - 性价比 + 中文数学术语友好
3. 填入 API Key,选择具体模型(DeepSeek-V3 或 DeepSeek-R1)。
4. 在编辑器中,把光标放在 `sorry` 上,ReasLab 的 AI 智能体会提示战术建议,点击「应用」即可。

### 4. 编写并验证 Lean 证明

1. 打开 `MathWIKI/CauchyGoursat.lean`(或其他 theorem 文件)。
2. 编辑右侧 Infoview 实时显示目标状态。
3. 写完一段战术后,ReasLab 自动增量编译,**红波浪线 = 类型错误**、**黄波浪线 = 警告**。
4. 通过 `Cmd/Ctrl + R` 重启分析,确认证明状态与预期一致。

### 5. 把 Lean 改动回写到 wiki

完成 Lean 战术后,务必执行以下同步步骤:

```powershell
# 1. 在 ReasLab 中提交 Lean 改动到 GitHub(IDE 内一键完成)
# 2. 本机拉取
cd e:\wikiproject\math-wiki\lean
git pull
# 3. 获取新 commit SHA
git log -1 --format=%H
# 4. 更新 wiki 页 frontmatter 的 formal_proof.commit
#    (手动或用脚本批量)
# 5. 跑校验
pwsh e:\wikiproject\math-wiki\scripts\lint-wiki.ps1
pwsh e:\wikiproject\math-wiki\scripts\check-lean-wiki-sync.ps1
```

## 同步约束(强约束)

- Lean 文件首部必须有 `/-! WIKI_SOURCE: <slug> -/`(`check-lean-wiki-sync.ps1` 强制)
- 主定理命名严格为 `wiki_<slug>_main`(kebab → snake)
- 文件末尾必须有 `/-! WIKI_STATUS: formalized -/`
- 当 Lean 文件改动时,对应 wiki 页 `formal_proof.commit` **必须**同步更新
- 当 wiki 主页「详细证明」改动时,Lean 文件**必须**同步

## 三种状态切换

| Lean 文件状态 | frontmatter `formal_proof.status` | 含义 |
|--------------|-----------------------------------|------|
| 占位,未编译 | `pending-formalization` | 仅有骨架,等待 ReasLab 战术填充 |
| 编译通过,wiki 同步 | `formalized` | 可把 theorem 页升 `verified` |
| 形式化失败 | `failed-formalization` | 记录原因到 theorem 页 `audit_notes` |

## 试点文件清单

| Lean 文件 | 对应 wiki theorem | 状态 |
|-----------|-------------------|------|
| `MathWIKI/CauchyGoursat.lean` | `cauchy-theorem`(Goursat 三角版本) | 占位 |
| `MathWIKI/WeierstrassApprox.lean` | `weierstrass-approximation-trig` | 占位 |
| `MathWIKI/FourierInversion.lean` | `fourier-inversion`(主证明) | 占位 |

## 限制

- Lean 核心标准库不含 Mathlib 的 Schwartz 空间 / Lebesgue 积分 / 控制收敛等。Fourier 反演形式化**必须**先在 `lakefile.lean` 启用 Mathlib require 块(详见 [lean/lakefile.lean](../lakefile.lean) 注释)。
- ReasLab 的 AI 智能体在数学证明中可能产生错误战术,务必人在 Infoview 中逐 tactic 复核。
- 本说明文件描述的工作流基于 [ReasLab 概览](https://docs.reaslab.io/zh/guides/overview.html) 与 [Lean 指南](https://docs.reaslab.io/zh/guides/lean.html)(2026-08-16 检索)。如有 API 变动,以 ReasLab 官方文档为准。