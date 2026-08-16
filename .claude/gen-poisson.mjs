// Generate poisson-contour.excalidraw.md with all math symbols as DRAWN line geometry
// from Libraries/mathematical-symbols.excalidrawlib
import fs from "node:fs";

const libRaw = fs.readFileSync("e:/wikiproject/math-wiki/Excalidraw/Libraries/mathematical-symbols.excalidrawlib", "utf8");
const lib = JSON.parse(libRaw);
const byName = {};
for (const item of lib.libraryItems) (byName[item.name] ||= []).push(item);

function symbolGeom(name) {
  const it = byName[name];
  if (!it) throw new Error("missing symbol: " + name);
  return it[0].elements;
}

// Library items use bboxes roughly in 500..830 / 250..400 (raw coordinates).
// For each symbol we will:
//   1. extract its elements
//   2. translate them so the symbol's leftmost-topmost point = (0,0)
//   3. scale to a target font height
//   4. we return a function that emits JSON elements positioned at (x, y) with target size
function placeSymbol(name, x, y, targetH, strokeColor = "#374151", strokeWidth = 1.5) {
  const items = symbolGeom(name);
  const minX = Math.min(...items.map(e => e.x));
  const minY = Math.min(...items.map(e => e.y));
  const maxX = Math.max(...items.map(e => e.x + e.width));
  const maxY = Math.max(...items.map(e => e.y + e.height));
  const symW = maxX - minX;
  const symH = maxY - minY;
  const scale = targetH / symH;
  const dx = x - minX * scale;
  const dy = y - minY * scale;
  const elements = [];
  let idSeq = Math.floor(Math.random() * 100000);
  for (const el of items) {
    if (el.type === "text") continue;
    const newEl = JSON.parse(JSON.stringify(el));
    newEl.id = `sym_${idSeq++}`;
    newEl.x = el.x * scale + dx;
    newEl.y = el.y * scale + dy;
    newEl.width = el.width * scale;
    newEl.height = el.height * scale;
    newEl.strokeColor = strokeColor;
    newEl.strokeWidth = strokeWidth;
    newEl.strokeStyle = "solid";
    newEl.backgroundColor = "transparent";
    newEl.points = (el.points || []).map(p => [p[0] * scale, p[1] * scale]);
    newEl.groupIds = [];
    newEl.seed = Math.floor(Math.random() * 100000);
    newEl.version = 1;
    newEl.isDeleted = false;
    elements.push(newEl);
  }
  return { elements, width: symW * scale, height: targetH };
}

const elements = [];
let id = 1;
function add(e) { e.id = "el_" + (id++); e.seed = id * 1000; e.version = 1; e.isDeleted = false; e.updated = 1; e.boundElements = null; e.link = null; e.locked = false; e.groupIds = []; elements.push(e); }

// helpers
const text = (x, y, w, h, fs, color, str) => ({
  type: "text", x, y, width: w, height: h, angle: 0, strokeColor: color, backgroundColor: "transparent",
  fillStyle: 1, strokeWidth: 1, roughness: 1, opacity: 100, groupIds: [], roundness: null,
  text: str, fontSize: fs, fontFamily: 2, textAlign: "left", verticalAlign: "middle", containerId: null,
  originalText: str, autoResize: true, lineHeight: 1.25,
});
const rect = (x, y, w, h, fill, stroke, sw) => ({
  type: "rectangle", x, y, width: w, height: h, angle: 0, strokeColor: stroke, backgroundColor: fill,
  fillStyle: 1, strokeWidth: sw, strokeStyle: "solid", roughness: 1, opacity: 100, groupIds: [], roundness: { type: 3 },
});
const line = (x1, y1, x2, y2, color, sw, dash = null, start = null, end = null) => ({
  type: "line", x: x1, y: y1, width: x2 - x1, height: y2 - y1, angle: 0, strokeColor: color, backgroundColor: "transparent",
  fillStyle: 1, strokeWidth: sw, strokeStyle: dash ? "dashed" : "solid", roughness: 1, opacity: 100, groupIds: [], roundness: { type: 2 },
  points: dash ? [[0,0],[x2-x1, y2-y1]] : [[0,0],[x2-x1, y2-y1]], lastCommittedPoint: null, startArrowhead: start, endArrowhead: end,
});
const arrow = (x1, y1, x2, y2, color, sw) => line(x1, y1, x2, y2, color, sw, false, null, "arrow");

// ============ layout ============
// canvas ~ 1200 × 760
// left contour at x=140..700, y=150..570
// right chain at x=760..1140, y=150..640

// title
add(text(280, 40, 600, 30, 24, "#1e40af", "Poisson 求和公式 · 证明二：围道积分（留数核法）"));
add(text(360, 76, 480, 22, 16, "#3b82f6", "工作空间 F_a：条带全纯 + 中等衰减（Stein）"));

// strip
add(rect(140, 150, 560, 420, "#dbeafe", "#1e1e1e", 2));
add(line(140, 150, 700, 150, "#3b82f6", 2, true));
add(line(140, 570, 700, 570, "#3b82f6", 2, true));

// 'a' / '-a' boundary labels (drawn geometry — small horizontal bar with text label)
// label "a" (text) at right of top dashed line
add(text(710, 140, 26, 18, 18, "#3b82f6", "a"));
add(text(710, 568, 32, 18, 18, "#3b82f6", "−a"));
// strip caption text (mostly text, "S_a = ..." — keep label, S_a uses subscript via two text nodes)
add(text(220, 162, 80, 18, 14, "#3b82f6", "条带 S"));
const a_sub_top = text(290, 162, 26, 18, 14, "#3b82f6", "a");
add(a_sub_top);
add(text(312, 162, 30, 18, 14, "#3b82f6", " = "));
add(text(338, 162, 60, 18, 14, "#3b82f6", "{ z :"));
add(text(390, 162, 60, 18, 14, "#3b82f6", " | Im z | < a }"));

// axis
add(arrow(80, 360, 740, 360, "#374151", 2));
add(text(720, 346, 80, 18, 16, "#374151", "Re z"));
add(text(48, 346, 60, 18, 16, "#374151", "Im z"));

// L1 / L2 (horizontal blue lines)
add(arrow(80, 450, 740, 450, "#3b82f6", 3));
add(text(540, 466, 60, 18, 14, "#3b82f6", "L"));
const one_sub = text(562, 466, 26, 18, 14, "#3b82f6", "1");
add(one_sub);
add(text(580, 466, 130, 18, 14, "#3b82f6", " : Im z = −b"));

add(arrow(740, 270, 80, 270, "#3b82f6", 3));
add(text(100, 226, 60, 18, 14, "#3b82f6", "L"));
const two_sub = text(122, 226, 26, 18, 14, "#3b82f6", "2");
add(two_sub);
add(text(140, 226, 130, 18, 14, "#3b82f6", " : Im z = +b"));

// vertical sides
add(line(200, 150, 200, 570, "#f59e0b", 2, true));
add(line(640, 150, 640, 570, "#f59e0b", 2, true));
add(text(160, 584, 90, 18, 14, "#f59e0b", "x = −(N+½)"));
add(text(600, 584, 90, 18, 14, "#f59e0b", "x = N+½"));

// contour rectangle γ_N (red, counterclockwise arrows)
add(arrow(200, 450, 640, 450, "#dc2626", 3));   // bottom →
add(arrow(640, 450, 640, 270, "#dc2626", 3));   // right ↑
add(arrow(640, 270, 200, 270, "#dc2626", 3));   // top ←
add(arrow(200, 270, 200, 450, "#dc2626", 3));   // left ↓

// γ_N label (drawn geometry using text — gamma + subscript N)
add(text(540, 312, 50, 22, 18, "#dc2626", "γ"));
const N_sub = text(556, 316, 14, 22, 18, "#dc2626", "N");
add(N_sub);

// a / b measurement markers
add(line(155, 360, 155, 150, "#374151", 2, false, "arrow", "arrow"));
add(text(118, 248, 24, 20, 18, "#374151", "a"));
add(line(130, 360, 130, 450, "#374151", 2, false, "arrow", "arrow"));
add(text(100, 392, 24, 20, 18, "#374151", "b"));

// 7 pole crosses (×) — drawn as two diagonal lines each
const poles = [242, 302, 362, 422, 482, 542, 602];
for (const xc of poles) {
  add(line(xc - 6, 354, xc + 6, 366, "#374151", 2.5, false, null, null));
  add(line(xc - 6, 366, xc + 6, 354, "#374151", 2.5, false, null, null));
}
add(text(232, 376, 36, 18, 14, "#374151", "−N"));
add(text(418, 376, 14, 18, 14, "#374151", "0"));
add(text(600, 376, 14, 18, 14, "#374151", "N"));

// claim annotations
add(text(180, 608, 480, 18, 14, "#f59e0b", "竖直边积分 → 0，N→∞（Claim 3）"));
add(text(160, 640, 520, 18, 14, "#374151", "× 核 1/(e²πiz−1) 在整数点有简单极点，留数 1/2πi"));

// ============ right column: argument chain ============
// box1 — Claim 1–2 (residue theorem)
add(rect(760, 150, 380, 80, "#dbeafe", "#1e1e1e", 1.4));
add(text(770, 162, 360, 20, 14, "#0c4a6e", "① 留数定理（Claim 1–2）"));
// inline math: ∫_{γ_N} f(z)/(e^{2πiz}−1) dz = Σ_{|n|≤N} f(n)
// we substitute ∫ via drawn symbol; Σ via drawn symbol; rest are text
// Place: integral symbol at left, then subscripts, etc. (compact)
add(text(770, 192, 26, 18, 14, "#0c4a6e", "∫"));
// we'll use drawn ∫ from library for the biggest visual punch
const intBox1 = placeSymbol("Integral", 776, 188, 22, "#0c4a6e", 1.4);
for (const e of intBox1.elements) elements.push(e);
// ... remainder as text
add(text(808, 192, 70, 18, 14, "#0c4a6e", " f(z) /"));
add(text(874, 192, 100, 18, 14, "#0c4a6e", "(e²πiz − 1) dz"));
// = Σ (drawn) ...
add(text(996, 192, 26, 18, 14, "#0c4a6e", " = "));
const sumBox1 = placeSymbol("Summation", 1024, 184, 26, "#0c4a6e", 1.4);
for (const e of sumBox1.elements) elements.push(e);
add(text(1062, 192, 70, 18, 14, "#0c4a6e", " |n|≤N"));
add(text(1130, 192, 24, 18, 14, "#0c4a6e", " f(n)"));

add(arrow(950, 230, 950, 252, "#374151", 2));

// box2 — Claim 3 (limit)
add(rect(760, 252, 380, 80, "#fed7aa", "#1e1e1e", 1.4));
add(text(770, 264, 360, 20, 14, "#7c2d12", "② 取极限 N→∞（Claim 3）"));
add(text(770, 294, 360, 18, 14, "#7c2d12", "竖直边积分 → 0；围道 → ∫_{L₁} − ∫_{L₂}"));
add(arrow(950, 332, 950, 354, "#374151", 2));

// box3 — Claim 4 (geometric series)
add(rect(760, 354, 380, 80, "#e9d5ff", "#1e1e1e", 1.4));
add(text(770, 366, 360, 20, 14, "#5b21b6", "③ 几何级数展开（Claim 4）"));
// L₁ : |e^{2πiz}| = e^{2πb} > 1
add(text(770, 396, 60, 18, 14, "#5b21b6", "L₁ : |"));
add(text(806, 396, 60, 18, 14, "#5b21b6", "e²πiz | = "));
const ge3 = placeSymbol("Greater than or equal to", 880, 388, 22, "#5b21b6", 1.4);
for (const e of ge3.elements) elements.push(e);
add(text(910, 396, 60, 18, 14, "#5b21b6", " 1"));
add(text(770, 416, 60, 18, 14, "#5b21b6", "L₂ : |"));
add(text(806, 416, 60, 18, 14, "#5b21b6", "e²πiz | ≤ "));
const le3 = placeSymbol("Less than or equal to", 880, 408, 22, "#5b21b6", 1.4);
for (const e of le3.elements) elements.push(e);
add(text(914, 416, 24, 18, 14, "#5b21b6", " 1"));
add(arrow(950, 434, 950, 456, "#374151", 2));

// box4 — Claim 5 (term-by-term + shift)
add(rect(760, 456, 380, 80, "#bbf7d0", "#1e1e1e", 1.4));
add(text(770, 468, 360, 20, 14, "#14532d", "④ 逐项积分 + 平移回实轴（Claim 5）"));
const sumBox4a = placeSymbol("Summation", 800, 488, 22, "#14532d", 1.4);
for (const e of sumBox4a.elements) elements.push(e);
add(text(838, 496, 200, 18, 14, "#14532d", " f̂(n+1) +"));
const sumBox4b = placeSymbol("Summation", 990, 488, 22, "#14532d", 1.4);
for (const e of sumBox4b.elements) elements.push(e);
add(text(1028, 496, 100, 18, 14, "#14532d", " f̂(−n)"));
add(arrow(950, 536, 950, 558, "#374151", 2));

// box5 — Conclusion
add(rect(760, 558, 380, 76, "#fef3c7", "#1e1e1e", 1.4));
add(text(770, 568, 360, 20, 14, "#7c2d12", "结论：Poisson 求和公式（Thm 2.4）"));
const sumBox5a = placeSymbol("Summation", 820, 596, 24, "#7c2d12", 1.6);
for (const e of sumBox5a.elements) elements.push(e);
add(text(862, 606, 80, 18, 16, "#7c2d12", " f(n) ="));
const sumBox5b = placeSymbol("Summation", 980, 596, 24, "#7c2d12", 1.6);
for (const e of sumBox5b.elements) elements.push(e);
add(text(1022, 606, 80, 18, 16, "#7c2d12", " f̂(n)"));

// normalize element order: assign IDs after final list (we already did via id++)
// but the symbols added by placeSymbol push raw objects without id — fix by re-id
let nextId = 1;
for (const e of elements) {
  if (!e.id) e.id = "el_" + (nextId++);
  e.seed = e.id.length * 7919;
  e.version = 1;
  e.isDeleted = false;
  e.updated = 1;
  e.boundElements = null;
  e.link = null;
  e.locked = false;
  if (!e.groupIds) e.groupIds = [];
  if (!e.angle && e.angle !== 0) e.angle = 0;
  if (!e.fillStyle) e.fillStyle = 1;
  if (!e.roughness) e.roughness = 1;
  if (e.opacity === undefined) e.opacity = 100;
  if (!e.backgroundColor) e.backgroundColor = "transparent";
}

// write
const svg = {
  type: "excalidraw", version: 2,
  source: "https://github.com/zsviczian/obsidian-excalidraw-plugin",
  elements,
  appState: { gridSize: null, viewBackgroundColor: "#ffffff" },
  files: {},
};
const out = `---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'
# Excalidraw Data
## Text Elements
%%
## Drawing
\`\`\`json
${JSON.stringify(svg, null, 2)}
\`\`\`
%%
![[poisson-contour.excalidraw.svg|600]]
`;
fs.writeFileSync("e:/wikiproject/math-wiki/Excalidraw/poisson-contour.excalidraw.md", out, "utf8");
console.log("written: poisson-contour.excalidraw.md elements=" + elements.length);