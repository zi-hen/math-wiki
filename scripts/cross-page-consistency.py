#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
跨页字面一致性检测脚本 (Cross-page literal consistency checker)

目的:
    检测同一对象(如 PSF 公式 $\sum f(n) = \sum \hat{f}(n)$)在不同页面的字面一致性。
    跨页不一致是隐藏熵源,可能让读者产生「这两个对象是否同一概念」的疑虑。

策略:
    1. 定义一组「一致性指纹」——固定的 LaTeX 字面量或自然语言短语。
    2. 遍历 wiki/ 下所有 .md 文件,定位每条指纹的出现位置。
    3. 当一条指纹在多个页面出现时,记录其所在页面与上下文。
    4. 输出报告,供 LLM 在 audit 中检查每个指纹是否字面一致。

约束:
    - 起步阶段仅检测少数核心指纹(如 PSF 公式、Schwartz 空间定义等)。
    - 不强制修改任何页面;仅输出 INFO 级提示。
    - Python 3.7+;无外部依赖(只使用标准库)。
"""

import os
import re
import sys
import json
from pathlib import Path

# 默认 wiki 根路径
DEFAULT_WIKI_ROOT = Path(__file__).resolve().parent.parent / "wiki"

# 一致性指纹清单(LaTeX 字面量或自然语言短语)
FINGERPRINTS = [
    {
        "id": "psf-formula",
        "name": "Poisson 求和公式",
        "pattern": r"\\sum_\{n\\in\\mathbb\{Z\}\}\s*f\(n\)\s*=\s*\\sum_\{n\\in\\mathbb\{Z\}\}\s*\\hat\{f\}\(n\)",
        "description": "Poisson summation: sum of f(n) equals sum of f-hat(n)",
    },
    {
        "id": "fourier-transform-def",
        "name": "Fourier 变换定义(Stein 约定)",
        "pattern": r"\\hat\{f\}\(\\xi\)\s*=\s*\\int[^=]*f\(x\).*e\^\{-2\\pi\s*i\s*\\xi\s*x\}",
        "description": "Fourier transform with e^{-2pi i xi x} kernel (Stein convention)",
    },
    {
        "id": "schwartz-space-def",
        "name": "Schwartz 空间定义",
        "pattern": r"\\mathcal\{S\}\s*\\?\(\\mathbb\{R\}\^?d?\?\)",
        "description": "Schwartz space as mathcal{S}(R^d)",
    },
    {
        "id": "poisson-kernel-formula",
        "name": "Poisson 核公式",
        "pattern": r"P_r\(\\theta\)\s*=\s*\\frac\{1-r\^2\}\{1\s*-\s*2r\\cos\\theta\s*\+\s*r\^2\}",
        "description": "Poisson kernel: (1-r^2) / (1-2r cos theta + r^2)",
    },
    {
        "id": "dirichlet-kernel-formula",
        "name": "Dirichlet 核公式",
        "pattern": r"D_N\(t\)\s*=\s*\\sum_\{n=-N\}\^\{N\}\s*e\^\{2\\pi\s*i\s*n\s*t\}",
        "description": "Dirichlet kernel D_N(t) = sum e^{2pi i n t}",
    },
]


def collect_md_files(wiki_root: Path) -> list:
    """递归收集 wiki/ 下所有 .md 文件,排除隐藏文件。"""
    md_files = []
    for root, _, files in os.walk(wiki_root):
        for f in files:
            if f.endswith(".md") and not f.startswith("."):
                md_files.append(Path(root) / f)
    return md_files


def find_fingerprint(content: str, pattern: str) -> list:
    """在内容中查找正则模式,返回所有匹配位置。"""
    return [m.start() for m in re.finditer(pattern, content)]


def main():
    wiki_root = Path(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT_WIKI_ROOT
    if not wiki_root.exists():
        print(f"ERROR: wiki root not found: {wiki_root}", file=sys.stderr)
        sys.exit(1)

    md_files = collect_md_files(wiki_root)
    print(f"Scanning {len(md_files)} markdown files in {wiki_root}")
    print()

    # 结果收集
    findings = []
    for fp in FINGERPRINTS:
        hits = []
        for md in md_files:
            try:
                content = md.read_text(encoding="utf-8")
            except UnicodeDecodeError:
                continue
            matches = find_fingerprint(content, fp["pattern"])
            if matches:
                rel = md.relative_to(wiki_root).as_posix()
                hits.append({"file": rel, "count": len(matches)})
        findings.append({
            "id": fp["id"],
            "name": fp["name"],
            "description": fp["description"],
            "pattern": fp["pattern"],
            "occurrences": hits,
            "page_count": len(hits),
        })

    # 输出 markdown 报告
    print("# 跨页字面一致性报告")
    print()
    print(f"生成时间: {__import__('datetime').datetime.now().isoformat(timespec='seconds')}")
    print(f"Wiki 根: {wiki_root}")
    print(f"扫描文件数: {len(md_files)}")
    print()
    print("## 摘要")
    print()
    print("| 指纹 ID | 指纹名 | 出现页面数 | 备注 |")
    print("|---------|--------|-----------|------|")
    for f in findings:
        note = ""
        if f["page_count"] == 0:
            note = "未检测到"
        elif f["page_count"] == 1:
            note = "唯一出现"
        else:
            note = f"**{f['page_count']} 页出现,需人工确认字面一致**"
        print(f"| `{f['id']}` | {f['name']} | {f['page_count']} | {note} |")
    print()

    print("## 详细发现")
    print()
    for f in findings:
        print(f"### {f['name']} (`{f['id']}`)")
        print()
        print(f"**描述**: {f['description']}")
        print()
        print(f"**正则**: `{f['pattern']}`")
        print()
        if not f["occurrences"]:
            print("_未在任何页面检测到该字面量。_")
        else:
            print(f"**出现位置** ({f['page_count']} 页):")
            print()
            for hit in f["occurrences"]:
                print(f"- `{hit['file']}` — {hit['count']} 处匹配")
        print()

    # 输出 JSON 摘要(machine-readable)
    json_path = wiki_root / ".cross-page-consistency.json"
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(findings, f, ensure_ascii=False, indent=2)
    print()
    print(f"JSON 摘要已写入: {json_path}")


if __name__ == "__main__":
    main()