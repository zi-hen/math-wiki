// Extract library items by name → return list of {name, items}
import fs from "node:fs";
const raw = fs.readFileSync(
  "e:/wikiproject/math-wiki/Excalidraw/Libraries/mathematical-symbols.excalidrawlib",
  "utf8"
);
const data = JSON.parse(raw);
const byName = {};
for (const item of data.libraryItems || []) {
  const name = item.name || item.id;
  if (!byName[name]) byName[name] = [];
  byName[name].push(item);
}
const want = ["Summation","Integral","Implication","Approaches","Element","Infinity","Natural numbers","Integers","Real numbers","Complex numbers","Greater than or equal to","Less than or equal to","Universal quantification","Existential quantification","Partial derivaive"];
console.log("availability:");
for (const n of want) console.log(" ", n, "=", byName[n] ? "YES (" + byName[n][0].elements.length + " elements)" : "NO");
// Print first elements for each
for (const n of want) {
  if (!byName[n]) continue;
  const it = byName[n][0];
  console.log("---", n, "bbox:", it.elements[0].x, it.elements[0].y, "×", it.elements[0].width, it.elements[0].height, "types:", [...new Set(it.elements.map(e=>e.type))].join(","));
}