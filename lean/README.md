# Lean 形式化证明集合(MathWIKI)

> 本目录是 math-wiki 的 Lean 4 形式化项目根,试点 3 个定理(cauchy / weierstrass-trig / fourier-inversion)。

## 定位

- **角色**:ReasLab 在线 IDE 或本机 `lake` 的工作根,产出**机器可核验的证据**。
- **与 wiki 的关系**:单方向依赖——Lean 文件是 wiki 主页「详细证明」的**形式化复述**,wiki 主页是 Lean 文件的**人类可读解释**。同步由 `scripts/check-lean-wiki-sync.ps1` 监控(每个 Lean 文件首部必须含 `WIKI_SOURCE: <slug>`,文件末尾必须含 `WIKI_STATUS: formalized`)。
- **与 raw/ 的关系**:`raw/` 是不可变源,Lean 文件不视作 `raw/`(放不进 `raw/`),但内容必须**忠实**对应 wiki 中已有的 `verified` 源页(如 `steinComplexAnalysis`、`steinFourierAnalysisIntroduction2003a`)。
- **与 scratch/ 的关系**:无交集。

## 快速开始

### 本机(若有 `lake`)

```powershell
cd e:\wikiproject\math-wiki\lean
lake build
```

### ReasLab 在线 IDE

1. 在 ReasLab 控制台创建项目,**类型选 Lean**。
2. 把本目录作为 GitHub 仓库推到自己的 GitHub 账号(或用 `git bundle` 打包上传)。
3. ReasLab 会自动读取 `lean-toolchain` 与 `lakefile.lean`,Infoview 实时显示证明状态。
4. 编辑后的 Lean 文件需 git commit,把 commit SHA 回写到对应 wiki 页的 `formal_proof.commit` 字段。

## 目录树

```
lean/
├── .gitignore              # Lean 构建产物忽略
├── README.md               # 本文件
├── lean-toolchain          # Lean 版本锁定
├── lakefile.lean           # lake 构建脚本
├── MathWIKI.lean           # 库入口(import 所有形式化模块)
├── MathWIKI/
│   ├── Defs.lean           # 通用定义(holomorphic、contour、Schwartz 等)
│   ├── CauchyGoursat.lean  # wiki/theorems/cauchy-theorem.md ↔ Goursat 三角版本
│   ├── WeierstrassApprox.lean  # wiki/theorems/weierstrass-approximation-trig.md
│   └── FourierInversion.lean   # wiki/theorems/fourier-inversion.md(主证明)
└── .reaslab/
    └── README.md           # ReasLab 工作流说明
```

## 已知依赖

- **Lean 4** `v4.8.0`(见 `lean-toolchain`)
- **Mathlib4**(若 `lakefile.lean` 引入;失败则回退到 Lean core)
- **Obsidian / PowerShell** 仅用于 wiki 侧(lint + sync 脚本),与 Lean 无运行时依赖

## 试点文件入口

| 文件 | 对应 wiki 页 | 主定理 Lean 名 |
|------|--------------|----------------|
| `MathWIKI/CauchyGoursat.lean` | `wiki/theorems/cauchy-theorem.md` | `wiki_cauchy_theorem_main`(Goursat 三角版本) |
| `MathWIKI/WeierstrassApprox.lean` | `wiki/theorems/weierstrass-approximation-trig.md` | `wiki_weierstrass_approximation_trig_main` |
| `MathWIKI/FourierInversion.lean` | `wiki/theorems/fourier-inversion.md` | `wiki_fourier_inversion_main` |

## 同步约定

**任何 Lean 文件改动必须:**
1. 更新对应 wiki 页 frontmatter 的 `formal_proof.commit` 字段。
2. 若定理正文有变动,同步更新 wiki 页「详细证明」区段。
3. 跑 `pwsh scripts/lint-wiki.ps1` 与 `pwsh scripts/check-lean-wiki-sync.ps1`,二者均 PASS 才算完成一次同步。

## 扩展指引

新增定理形式化时:
1. 在 `MathWIKI/` 下新建 `Xxx.lean`,首部加 `/-! WIKI_SOURCE: <slug> -/`。
2. 命名主定理 `wiki_<slug>_main`,类型严格对应 wiki 主页「陈述」区段。
3. 在 `MathWIKI.lean` 中 `import` 新文件。
4. 在对应 wiki 页 frontmatter 加 `formal_proof` 块。
5. 跑三套校验(lint / sync / lake build)。