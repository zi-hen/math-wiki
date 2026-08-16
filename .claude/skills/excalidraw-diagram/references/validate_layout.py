"""Validate Excalidraw render layout: measure text bboxes, detect overlaps & out-of-canvas.

Usage: uv run python validate_layout.py <file.excalidraw>
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

from playwright.sync_api import sync_playwright

CANVAS = (1200, 800)


def load_scene(path: Path) -> dict:
    data = json.loads(path.read_text(encoding="utf-8"))
    return data


def main() -> None:
    path = Path(sys.argv[1])
    data = load_scene(path)
    template_url = (Path(__file__).parent / "render_template.html").as_uri()

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page(viewport={"width": 1280, "height": 900})
        page.goto(template_url)
        page.wait_for_function("window.__moduleReady === true", timeout=60000)
        result = page.evaluate(f"window.renderDiagram({json.dumps(data)})")
        if not result or not result.get("success"):
            print("RENDER FAILED:", result)
            browser.close()
            sys.exit(1)
        page.wait_for_function("window.__renderComplete === true", timeout=15000)

        # Measure every <text> bbox inside the exported SVG.
        # getBBox() returns LOCAL coords (ignores ancestor transforms), so use
        # getBoundingClientRect() which accounts for the exportToSvg transform.
        measure_js = """
        () => {
          const texts = Array.from(document.querySelectorAll('#root svg text'));
          const svg = document.querySelector('#root svg');
          const sb = svg.getBoundingClientRect();
          return {
            svg: { left: sb.left, top: sb.top, width: sb.width, height: sb.height },
            texts: texts.map(t => {
              const r = t.getBoundingClientRect();
              return {
                text: (t.textContent || '').slice(0, 40),
                x: r.left, y: r.top, w: r.width, h: r.height
              };
            })
          };
        }
        """
        measured = page.evaluate(measure_js)
        boxes = measured["texts"]
        svg_rect = measured["svg"]
        browser.close()

    print(f"=== text elements: {len(boxes)} (svg rect: {svg_rect}) ===")
    for i, b in enumerate(boxes):
        print(f"[{i:02d}] x={b['x']:7.1f} y={b['y']:7.1f} w={b['w']:6.1f} h={b['h']:5.1f} | {b['text']}")

    # Overlap detection (axis-aligned), relative coordinates
    rel = []
    for b in boxes:
        rel.append({
            "x": b["x"] - svg_rect["left"],
            "y": b["y"] - svg_rect["top"],
            "w": b["w"],
            "h": b["h"],
        })

    print("\n=== overlaps (area > 9px^2) ===")
    found = 0
    for i in range(len(rel)):
        for j in range(i + 1, len(rel)):
            a, b = rel[i], rel[j]
            ix = max(0.0, min(a["x"] + a["w"], b["x"] + b["w"]) - max(a["x"], b["x"]))
            iy = max(0.0, min(a["y"] + a["h"], b["y"] + b["h"]) - max(a["y"], b["y"]))
            area = ix * iy
            if area > 9.0:
                print(f"  [{i}] vs [{j}] overlap={area:7.1f} : {boxes[i]['text']!r} <-> {boxes[j]['text']!r}")
                found += 1
    if found == 0:
        print("  none")

    # Out-of-SVG check
    print("\n=== text out of SVG bounds ===")
    oob = 0
    for i, b in enumerate(rel):
        if b["x"] < -2 or b["y"] < -2 or b["x"] + b["w"] > svg_rect["width"] + 2 or b["y"] + b["h"] > svg_rect["height"] + 2:
            print(f"  [{i}] out of svg: {boxes[i]}")
            oob += 1
    if oob == 0:
        print("  none")


if __name__ == "__main__":
    main()
