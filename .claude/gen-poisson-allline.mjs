// Generate poisson-contour.excalidraw.md — ALL elements as line geometry, NO text.
// Math symbols from Libraries/mathematical-symbols.excalidrawlib.
// All other characters (CJK / Latin / digits / greek) from char-dict.mjs (hand-drawn).
import fs from "node:fs";
import { strokesFor } from "./char-dict.mjs";

const libRaw = fs.readFileSync("e:/wikiproject/math-wiki/Excalidraw/Libraries/mathematical-symbols.excalidrawlib", "utf8");
const lib = JSON.parse(libRaw);
const byName = {};
for (const item of lib.libraryItems) (byName[item.name] ||= []).push(item);

// ============ symbol from library (line-based math symbols) ============
function placeSymbol(name, x, y, targetH, strokeColor = "#374151", strokeWidth = 1.5) {
  const it = byName[name];
  if (!it) throw new Error("missing symbol: " + name);
  const items = it[0].elements;
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
  for (const el of items) {
    if (el.type === "text") continue;
    const newEl = JSON.parse(JSON.stringify(el));
    newEl.x = el.x * scale + dx;
    newEl.y = el.y * scale + dy;
    newEl.width = el.width * scale;
    newEl.height = el.height * scale;
    newEl.strokeColor = strokeColor;
    newEl.strokeWidth = strokeWidth;
    newEl.strokeStyle = "solid";
    newEl.backgroundColor = "transparent";
    newEl.points = (el.points || []).map(p => [p[0] * scale, p[1] * scale]);
    elements.push(newEl);
  }
  return { elements, width: symW * scale, height: targetH };
}

// ============ hand-drawn character ============
function placeChar(ch, x, y, h, color, sw = 1.5, advance = 0.7) {
  // ch is a single character; default advance is h * 0.7 (variable width font)
  const strokes = strokesFor(ch);
  if (!strokes.length) return { width: h * 0.4, elements: [] };  // unknown → advance minimal
  const elements = [];
  for (const stroke of strokes) {
    // each stroke: array of [x01..y0] in 0..1
    const pts = stroke.map(p => [p[0] * h, p[1] * h]);
    if (pts.length < 2) continue;
    elements.push({
      type: "line",
      x: x + pts[0][0],
      y: y + pts[0][1],
      width: pts[pts.length - 1][0] - pts[0][0],
      height: pts[pts.length - 1][1] - pts[0][1],
      points: pts.map(p => [p[0] - pts[0][0], p[1] - pts[0][1]]),
      lastCommittedPoint: null,
      startArrowhead: null,
      endArrowhead: null,
      angle: 0,
      strokeColor: color, backgroundColor: "transparent",
      fillStyle: 1, strokeWidth: sw, strokeStyle: "solid", roughness: 1, opacity: 100,
    });
  }
  return { width: h * advance, elements };
}

// ============ write text using hand-drawn chars ============
function drawText(str, x, y, h, color, sw = 1.5, gap = 0.15) {
  const allElements = [];
  let curX = x;
  for (const ch of str) {
    const r = placeChar(ch, curX, y, h, color, sw);
    allElements.push(...r.elements);
    curX += r.width + h * gap;
  }
  return { width: curX - x, elements: allElements };
}

// ============ generate ============
const elements = [];
let id = 1;
function add(e) {
  e.id = "el_" + (id++);
  e.seed = id * 7919;
  e.version = 1;
  e.isDeleted = false;
  e.updated = 1;
  e.boundElements = null;
  e.link = null;
  e.locked = false;
  e.groupIds = [];
  if (e.angle === undefined) e.angle = 0;
  if (!e.fillStyle) e.fillStyle = 1;
  if (!e.roughness) e.roughness = 1;
  if (e.opacity === undefined) e.opacity = 100;
  if (!e.backgroundColor) e.backgroundColor = "transparent";
  elements.push(e);
}

const rect = (x, y, w, h, fill, stroke, sw) => ({
  type: "rectangle", x, y, width: w, height: h, angle: 0, strokeColor: stroke, backgroundColor: fill,
  fillStyle: 1, strokeWidth: sw, strokeStyle: "solid", roughness: 1, opacity: 100, groupIds: [], roundness: { type: 3 },
});
const line = (x1, y1, x2, y2, color, sw, dash = false, start = null, end = null) => ({
  type: "line", x: x1, y: y1, width: x2 - x1, height: y2 - y1, angle: 0, strokeColor: color, backgroundColor: "transparent",
  fillStyle: 1, strokeWidth: sw, strokeStyle: dash ? "dashed" : "solid", roughness: 1, opacity: 100, groupIds: [], roundness: { type: 2 },
  points: [[0, 0], [x2 - x1, y2 - y1]], lastCommittedPoint: null, startArrowhead: start, endArrowhead: end,
});
const arrow = (x1, y1, x2, y2, color, sw) => line(x1, y1, x2, y2, color, sw, false, null, "arrow");

// === TITLE (hand-drawn Chinese) ===
const titleStr = "围道积分 留数核法 证明";
let titleX = 80;
for (const ch of titleStr) {
  const r = placeChar(ch, titleX, 36, 26, "#1e40af", 2);
  elements.push(...r.elements);
  titleX += r.width + 6;
}

// === SUBTITLE: "工作空间 F_a" — F is Latin (use upper-case F); a subscript drawn smaller ===
// We just place the chars we have
const subY = 76;
let subX = 240;
for (const ch of "工作空间") {
  const r = placeChar(ch, subX, subY, 16, "#3b82f6", 1.5);
  elements.push(...r.elements);
  subX += r.width + 3;
}
// subscript a
const aSub = placeChar("a", subX, subY + 5, 12, "#3b82f6", 1.3);
elements.push(...aSub.elements);

// === strip S_a ===
add(rect(140, 150, 560, 420, "#dbeafe", "#1e1e1e", 2));
add(line(140, 150, 700, 150, "#3b82f6", 2, true));
add(line(140, 570, 700, 570, "#3b82f6", 2, true));

// "S_a" label inside strip
let lx = 220; const ly = 162;
for (const ch of "条带") {
  const r = placeChar(ch, lx, ly, 14, "#3b82f6", 1.4);
  elements.push(...r.elements);
  lx += r.width + 2;
}
const SaSub = placeChar("a", lx, ly + 4, 11, "#3b82f6", 1.2);
elements.push(...SaSub.elements);
lx += SaSub.width + 4;
for (const ch of "={z:") {
  const r = placeChar(ch, lx, ly, 14, "#3b82f6", 1.4);
  elements.push(...r.elements);
  lx += r.width + 2;
}

// "a" / "-a" boundary labels at right of strip
const aLbl = placeChar("a", 710, 138, 18, "#3b82f6", 1.8);
elements.push(...aLbl.elements);
let lx2 = 710; const ly2 = 568;
const neg = placeChar("−", lx2, ly2, 18, "#3b82f6", 1.8);
elements.push(...neg.elements);
lx2 += neg.width + 2;
const aLbl2 = placeChar("a", lx2, ly2, 18, "#3b82f6", 1.8);
elements.push(...aLbl2.elements);

// === axis Re / Im ===
add(arrow(80, 360, 740, 360, "#374151", 2));
const reLbl = placeChar("R", 720, 346, 16, "#374151", 1.5);
elements.push(...reLbl.elements);
let reLblX = 720 + reLbl.width + 2;
const eLbl = placeChar("e", reLblX, 346, 16, "#374151", 1.5);
elements.push(...eLbl.elements);
// "Re z" — actually we need a space then z
let zX = reLblX + eLbl.width + 6;
const zLbl = placeChar("z", zX, 346, 16, "#374151", 1.5);
elements.push(...zLbl.elements);

const imLbl = placeChar("I", 48, 346, 16, "#374151", 1.5);
elements.push(...imLbl.elements);
let imX = 48 + imLbl.width + 2;
const mLbl = placeChar("m", imX, 346, 16, "#374151", 1.5);
elements.push(...mLbl.elements);

// === L1, L2 (horizontal blue lines) ===
add(arrow(80, 450, 740, 450, "#3b82f6", 3));
// L₁ label
let lxL = 540; const lyL = 466;
const L1 = placeChar("L", lxL, lyL, 14, "#3b82f6", 1.4);
elements.push(...L1.elements);
const L1Sub = placeChar("1", lxL + L1.width - 2, lyL + 5, 11, "#3b82f6", 1.2);
elements.push(...L1Sub.elements);
let l1X = lxL + L1.width + 6;
for (const ch of ":Im z=−b") {
  const r = placeChar(ch, l1X, lyL, 14, "#3b82f6", 1.4);
  elements.push(...r.elements);
  l1X += r.width + 2;
}

add(arrow(740, 270, 80, 270, "#3b82f6", 3));
let lxL2 = 100; const lyL2 = 226;
const L2 = placeChar("L", lxL2, lyL2, 14, "#3b82f6", 1.4);
elements.push(...L2.elements);
const L2Sub = placeChar("2", lxL2 + L2.width - 2, lyL2 + 5, 11, "#3b82f6", 1.2);
elements.push(...L2Sub.elements);
let l2X = lxL2 + L2.width + 6;
for (const ch of ":Im z=+b") {
  const r = placeChar(ch, l2X, lyL2, 14, "#3b82f6", 1.4);
  elements.push(...r.elements);
  l2X += r.width + 2;
}

// === vertical sides ===
add(line(200, 150, 200, 570, "#f59e0b", 2, true));
add(line(640, 150, 640, 570, "#f59e0b", 2, true));
// "x = -(N+½)" left
let lxV = 160; const lyV = 584;
for (const ch of "x=−") {
  const r = placeChar(ch, lxV, lyV, 14, "#f59e0b", 1.4);
  elements.push(...r.elements);
  lxV += r.width + 2;
}
for (const ch of "(N+½)") {
  const r = placeChar(ch, lxV, lyV, 14, "#f59e0b", 1.4);
  elements.push(...r.elements);
  lxV += r.width + 2;
}
// "x = N+½" right
let rxV = 600;
for (const ch of "x=N+½") {
  const r = placeChar(ch, rxV, lyV, 14, "#f59e0b", 1.4);
  elements.push(...r.elements);
  rxV += r.width + 2;
}

// === contour γ_N (red) ===
add(arrow(200, 450, 640, 450, "#dc2626", 3));
add(arrow(640, 450, 640, 270, "#dc2626", 3));
add(arrow(640, 270, 200, 270, "#dc2626", 3));
add(arrow(200, 270, 200, 450, "#dc2626", 3));
// "γ_N" label
const gam = placeChar("γ", 540, 310, 18, "#dc2626", 1.8);
elements.push(...gam.elements);
const gamSub = placeChar("N", 540 + gam.width, 314, 14, "#dc2626", 1.6);
elements.push(...gamSub.elements);

// === a / b measurement ===
add(line(155, 360, 155, 150, "#374151", 2, false, "arrow", "arrow"));
const aLbl3 = placeChar("a", 116, 248, 18, "#374151", 1.8);
elements.push(...aLbl3.elements);

add(line(130, 360, 130, 450, "#374151", 2, false, "arrow", "arrow"));
const bLbl = placeChar("b", 96, 392, 18, "#374151", 1.8);
elements.push(...bLbl.elements);

// === 7 pole crosses × ===
const poles = [242, 302, 362, 422, 482, 542, 602];
for (const xc of poles) {
  add(line(xc - 6, 354, xc + 6, 366, "#374151", 2.5));
  add(line(xc - 6, 366, xc + 6, 354, "#374151", 2.5));
}
// "-N", "0", "N" labels under poles
const mn = placeChar("−", 232, 376, 14, "#374151", 1.4);
elements.push(...mn.elements);
const nN = placeChar("N", 232 + mn.width, 376, 14, "#374151", 1.4);
elements.push(...nN.elements);
const zro = placeChar("0", 418, 376, 14, "#374151", 1.4);
elements.push(...zro.elements);
const pN = placeChar("N", 600, 376, 14, "#374151", 1.4);
elements.push(...pN.elements);

// === claim annotations ===
// 竖直边积分 → 0 N→∞ (Claim 3)
let cx = 180; const cy = 608;
for (const ch of "竖直边积分→0N→∞(Claim 3)") {
  if (ch === " ") { cx += 8; continue; }
  const r = placeChar(ch, cx, cy, 14, "#f59e0b", 1.4);
  elements.push(...r.elements);
  cx += r.width + 2;
}
// × 核 1/(e²πiz-1) 在整数点有简单极点, 留数 1/2πi
cx = 80; const cy2 = 640;
for (const ch of "×核 1/(e²πiz-1) 在整数点有简单极点 留数 1/2πi") {
  if (ch === " ") { cx += 8; continue; }
  const r = placeChar(ch, cx, cy2, 14, "#374151", 1.4);
  elements.push(...r.elements);
  cx += r.width + 2;
}

// ============ RIGHT COLUMN: argument chain ============

// box1: ① 留数定理 (Claim 1–2)
add(rect(760, 150, 380, 80, "#dbeafe", "#1e1e1e", 1.4));
// title
let bx = 770; const by1 = 162;
const one = placeChar("①", bx, by1, 14, "#0c4a6e", 1.4);
elements.push(...one.elements);
bx += one.width + 6;
for (const ch of "留数定理 (Claim 1–2)") {
  const r = placeChar(ch, bx, by1, 14, "#0c4a6e", 1.4);
  elements.push(...r.elements);
  bx += r.width + 2;
}

// formula inside box1: ∫_{γ_N} f(z)/(e^{2πiz}-1) dz = Σ_{|n|≤N} f(n)
// placed as: ∫ (lib) + small "_γ_N" + space + f(z)/(e^{2πiz}-1) dz + space + = + space + Σ (lib) + small "_{|n|≤N}" + f(n)
const int1 = placeSymbol("Integral", 778, 188, 22, "#0c4a6e", 1.5);
for (const e of int1.elements) elements.push(e);
// γ_N subscript on integral (placed after ∫ at right-bottom)
const igN = placeChar("γ", 798, 198, 12, "#0c4a6e", 1.2);
elements.push(...igN.elements);
const igNS = placeChar("N", 798 + igN.width - 1, 200, 10, "#0c4a6e", 1.0);
elements.push(...igNS.elements);
// f(z)/(e^{2πiz}-1) dz
let f1x = 814; const f1y = 192;
for (const ch of "f(z)/(e²πiz−1) dz =") {
  const r = placeChar(ch, f1x, f1y, 14, "#0c4a6e", 1.4);
  elements.push(...r.elements);
  f1x += r.width + 2;
}
const sum1 = placeSymbol("Summation", f1x, 184, 26, "#0c4a6e", 1.5);
for (const e of sum1.elements) elements.push(e);
// |n|≤N subscript
let sbx = f1x + 8; const sby = 200;
const sb1 = placeChar("|n|≤N", sbx, sby, 11, "#0c4a6e", 1.0);
// |n|≤N has only Latin/digit chars; iterate
for (const ch of "|n|≤N") {
  const r = placeChar(ch, sbx, sby, 11, "#0c4a6e", 1.0);
  elements.push(...r.elements);
  sbx += r.width + 1;
}
sbx += 4;
const fofn = placeChar("f(n)", sbx, f1y, 14, "#0c4a6e", 1.4);
elements.push(...fofn.elements);

add(arrow(950, 230, 950, 252, "#374151", 2));

// box2: ② 取极限 N→∞ (Claim 3)
add(rect(760, 252, 380, 80, "#fed7aa", "#1e1e1e", 1.4));
let bx2 = 770; const by2 = 264;
const two = placeChar("②", bx2, by2, 14, "#7c2d12", 1.4);
elements.push(...two.elements);
bx2 += two.width + 6;
for (const ch of "取极限 N→∞ (Claim 3)") {
  const r = placeChar(ch, bx2, by2, 14, "#7c2d12", 1.4);
  elements.push(...r.elements);
  bx2 += r.width + 2;
}
// body: 竖直边积分 → 0；围道 → ∫_{L₁} − ∫_{L₂}
let bx2b = 770; const by2b = 294;
for (const ch of "竖直边积分→0围道→∫_{L₁}−∫_{L₂}") {
  // ∫ via library
  if (ch === "∫") {
    const intHere = placeSymbol("Integral", bx2b, by2b - 4, 18, "#7c2d12", 1.3);
    for (const e of intHere.elements) elements.push(e);
    bx2b += intHere.width + 1;
  } else if (ch === " ") {
    bx2b += 4;
  } else if (ch === "−" || ch === "→") {
    const r = placeChar(ch, bx2b, by2b, 14, "#7c2d12", 1.4);
    elements.push(...r.elements);
    bx2b += r.width + 2;
  } else {
    const r = placeChar(ch, bx2b, by2b, 14, "#7c2d12", 1.4);
    elements.push(...r.elements);
    bx2b += r.width + 2;
  }
}

add(arrow(950, 332, 950, 354, "#374151", 2));

// box3: ③ 几何级数展开 (Claim 4)
add(rect(760, 354, 380, 80, "#e9d5ff", "#1e1e1e", 1.4));
let bx3 = 770; const by3 = 366;
const thr = placeChar("③", bx3, by3, 14, "#5b21b6", 1.4);
elements.push(...thr.elements);
bx3 += thr.width + 6;
for (const ch of "几何级数展开 (Claim 4)") {
  const r = placeChar(ch, bx3, by3, 14, "#5b21b6", 1.4);
  elements.push(...r.elements);
  bx3 += r.width + 2;
}
let bx3a = 770; const by3a = 396;
// L₁ : |e^{2πiz}| = e^{2πb} > 1
for (const ch of "L₁:|e²πiz|=e²πb") {
  const r = placeChar(ch, bx3a, by3a, 14, "#5b21b6", 1.4);
  elements.push(...r.elements);
  bx3a += r.width + 2;
}
// >
const ge = placeSymbol("Greater than or equal to", bx3a, by3a - 4, 18, "#5b21b6", 1.3);
for (const e of ge.elements) elements.push(e);
bx3a += ge.width + 2;
// 1
const oneN = placeChar("1", bx3a, by3a, 14, "#5b21b6", 1.4);
elements.push(...oneN.elements);
// second row
let bx3b = 770; const by3b = 416;
for (const ch of "L₂:|e²πiz|=e⁻²πb") {
  const r = placeChar(ch, bx3b, by3b, 14, "#5b21b6", 1.4);
  elements.push(...r.elements);
  bx3b += r.width + 2;
}
const le = placeSymbol("Less than or equal to", bx3b, by3b - 4, 18, "#5b21b6", 1.3);
for (const e of le.elements) elements.push(e);
bx3b += le.width + 2;
const oneN2 = placeChar("1", bx3b, by3b, 14, "#5b21b6", 1.4);
elements.push(...oneN2.elements);

add(arrow(950, 434, 950, 456, "#374151", 2));

// box4: ④ 逐项积分 + 平移回实轴 (Claim 5)
add(rect(760, 456, 380, 80, "#bbf7d0", "#1e1e1e", 1.4));
let bx4 = 770; const by4 = 468;
const fr = placeChar("④", bx4, by4, 14, "#14532d", 1.4);
elements.push(...fr.elements);
bx4 += fr.width + 6;
for (const ch of "逐项积分+平移回实轴 (Claim 5)") {
  const r = placeChar(ch, bx4, by4, 14, "#14532d", 1.4);
  elements.push(...r.elements);
  bx4 += r.width + 2;
}
// body: Σ_{n≥0} f̂(n+1) + Σ_{n≥0} f̂(−n)
let bx4b = 770; const by4b = 496;
// Σ via library
const sum4a = placeSymbol("Summation", bx4b, by4b - 4, 22, "#14532d", 1.4);
for (const e of sum4a.elements) elements.push(e);
bx4b += sum4a.width + 2;
// _{n≥0} f̂(n+1) +
let sbx4 = bx4b; const sby4 = by4b + 6;
for (const ch of "n≥0") {
  const r = placeChar(ch, sbx4, sby4, 11, "#14532d", 1.0);
  elements.push(...r.elements);
  sbx4 += r.width + 1;
}
bx4b = sbx4 + 4;
for (const ch of " f̂(n+1) +") {
  const r = placeChar(ch, bx4b, by4b, 14, "#14532d", 1.4);
  elements.push(...r.elements);
  bx4b += r.width + 2;
}
// second Σ
const sum4b = placeSymbol("Summation", bx4b, by4b - 4, 22, "#14532d", 1.4);
for (const e of sum4b.elements) elements.push(e);
bx4b += sum4b.width + 2;
let sbx4b = bx4b; const sby4b = by4b + 6;
for (const ch of "n≥0") {
  const r = placeChar(ch, sbx4b, sby4b, 11, "#14532d", 1.0);
  elements.push(...r.elements);
  sbx4b += r.width + 1;
}
bx4b = sbx4b + 4;
const fon = placeChar("f̂(−n)", bx4b, by4b, 14, "#14532d", 1.4);
elements.push(...fon.elements);

add(arrow(950, 536, 950, 558, "#374151", 2));

// box5: 结论 Poisson 求和公式 (Thm 2.4)
add(rect(760, 558, 380, 76, "#fef3c7", "#1e1e1e", 1.4));
let bx5 = 770; const by5 = 568;
for (const ch of "结论 Poisson 求和公式 (Thm 2.4)") {
  const r = placeChar(ch, bx5, by5, 14, "#7c2d12", 1.4);
  elements.push(...r.elements);
  bx5 += r.width + 2;
}
// body: Σ_{n∈Z} f(n) = Σ_{n∈Z} f̂(n)
let bx5b = 770; const by5b = 600;
const sum5a = placeSymbol("Summation", bx5b, by5b - 6, 26, "#7c2d12", 1.6);
for (const e of sum5a.elements) elements.push(e);
bx5b += sum5a.width + 2;
let sbx5 = bx5b; const sby5 = by5b + 8;
for (const ch of "n∈Z") {
  const r = placeChar(ch, sbx5, sby5, 11, "#7c2d12", 1.0);
  elements.push(...r.elements);
  sbx5 += r.width + 1;
}
bx5b = sbx5 + 6;
for (const ch of " f(n) =") {
  const r = placeChar(ch, bx5b, by5b, 16, "#7c2d12", 1.6);
  elements.push(...r.elements);
  bx5b += r.width + 2;
}
const sum5b = placeSymbol("Summation", bx5b, by5b - 6, 26, "#7c2d12", 1.6);
for (const e of sum5b.elements) elements.push(e);
bx5b += sum5b.width + 2;
let sbx5b = bx5b; const sby5b = by5b + 8;
for (const ch of "n∈Z") {
  const r = placeChar(ch, sbx5b, sby5b, 11, "#7c2d12", 1.0);
  elements.push(...r.elements);
  sbx5b += r.width + 1;
}
bx5b = sbx5b + 6;
const fnHat = placeChar("f̂(n)", bx5b, by5b, 16, "#7c2d12", 1.6);
elements.push(...fnHat.elements);

// ============ OUTPUT ============
const excalidraw = {
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
${JSON.stringify(excalidraw, null, 2)}
\`\`\`
%%
![[poisson-contour.excalidraw.svg|600]]
`;
fs.writeFileSync("e:/wikiproject/math-wiki/Excalidraw/poisson-contour.excalidraw.md", out, "utf8");
console.log("elements=" + elements.length);
const counts = {};
for (const e of elements) counts[e.type] = (counts[e.type] || 0) + 1;
console.log("by type:", counts);