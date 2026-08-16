/-! MathWIKI: Lean 4 形式化证明集合

每个文件对应 wiki 中一个 theorem 页(1:1 映射)。
文件首部必须包含 `WIKI_SOURCE: <slug>` 标记,文件末尾必须包含 `WIKI_STATUS: formalized` 标记。
-/

import MathWIKI.Defs
import MathWIKI.CauchyGoursat
import MathWIKI.WeierstrassApprox
import MathWIKI.FourierInversion