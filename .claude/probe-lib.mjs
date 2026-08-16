// Detail: print each library item's name and its first elements
import fs from "node:fs";
const raw = fs.readFileSync(
  "e:/wikiproject/math-wiki/Excalidraw/Libraries/mathematical-symbols.excalidrawlib",
  "utf8"
);
const data = JSON.parse(raw);
for (const item of data.libraryItems || []) {
  console.log("ITEM:", JSON.stringify(item.name || item.id || "?"), "elements=", (item.elements || []).length);
  for (const el of (item.elements || []).slice(0, 3)) {
    console.log("  ", el.type, el.id, "bbox=", el.x, el.y, el.width, "x", el.height);
    if (el.type === "text") console.log("     text=", el.text);
  }
}