#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Export all status: unverified wiki pages into one Markdown preview file."""

import os
import re
from pathlib import Path
from datetime import datetime

SCRIPT_DIR = Path(__file__).resolve().parent
WIKI_ROOT = SCRIPT_DIR.parent / "wiki"
OUTPUT_DIR = SCRIPT_DIR.parent / "scratch" / "previews"
TIMESTAMP = datetime.now().strftime("%Y%m%d-%H%M%S")
OUTPUT_FILE = OUTPUT_DIR / f"unverified-preview-{TIMESTAMP}.md"

OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

FRONTMATTER_RE = re.compile(r"^---\s*\n(.*?)\n---", re.DOTALL | re.MULTILINE)
TYPE_RE = re.compile(r"type:\s*(\S+)")
TITLE_RE = re.compile(r'title:\s*"?([^"\n]+?)"?\s*$', re.MULTILINE)
STATUS_RE = re.compile(r"status:\s*unverified")


def collect_pages():
    pages = []
    for md_file in WIKI_ROOT.rglob("*.md"):
        try:
            content = md_file.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue

        m = FRONTMATTER_RE.match(content)
        if not m:
            continue
        frontmatter = m.group(1)
        if not STATUS_RE.search(frontmatter):
            continue

        type_m = TYPE_RE.search(frontmatter)
        title_m = TITLE_RE.search(frontmatter)
        page_type = type_m.group(1) if type_m else "unknown"
        title = title_m.group(1).strip() if title_m else md_file.stem

        rel_path = md_file.relative_to(WIKI_ROOT).as_posix()
        body = content[m.end():].lstrip("\n")

        pages.append({"type": page_type, "title": title, "rel_path": rel_path, "body": body})

    return pages


def render_preview(pages):
    by_type = {}
    for p in pages:
        by_type.setdefault(p["type"], []).append(p)

    lines = []
    lines.append("# Unverified Pages Preview")
    lines.append("")
    lines.append(f"> Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append(f"> Total pages: {len(pages)}")
    lines.append(f"> Wiki root: `{WIKI_ROOT}`")
    lines.append("")
    lines.append("---")
    lines.append("")

    lines.append("## Table of Contents")
    lines.append("")
    for ptype in sorted(by_type):
        lines.append(f"### {ptype} ({len(by_type[ptype])} pages)")
        lines.append("")
        for p in sorted(by_type[ptype], key=lambda x: x["title"]):
            lines.append(f"- [{p['title']}]({p['rel_path']})")
        lines.append("")

    lines.append("---")
    lines.append("")

    for ptype in sorted(by_type):
        lines.append(f"## {ptype} ({len(by_type[ptype])} pages)")
        lines.append("")
        for p in sorted(by_type[ptype], key=lambda x: x["title"]):
            lines.append(f"### {p['title']}")
            lines.append("")
            lines.append(f"> File: `{p['rel_path']}`")
            lines.append("")
            lines.append("---")
            lines.append("")
            lines.append(p["body"].rstrip())
            lines.append("")
            lines.append("---")
            lines.append("")

    return "\n".join(lines)


def main():
    pages = collect_pages()
    print(f"Found {len(pages)} unverified pages")
    by_type = {}
    for p in pages:
        by_type[p["type"]] = by_type.get(p["type"], 0) + 1
    for t, n in sorted(by_type.items()):
        print(f"  {t}: {n}")

    content = render_preview(pages)
    OUTPUT_FILE.write_text(content, encoding="utf-8")
    size_kb = round(OUTPUT_FILE.stat().st_size / 1024, 2)
    print()
    print(f"Preview written: {OUTPUT_FILE}")
    print(f"File size: {size_kb} KB")


if __name__ == "__main__":
    main()
