import Lake
open Lake DSL

package «MathWIKI»

/--
Lean 4 formalization project for math-wiki.

We deliberately do NOT depend on Mathlib at this stage (fallback plan):
- Mathlib requires an extra `lake exe cache get` step and a heavy toolchain.
- Three pilot theorems (Cauchy Goursat / Weierstrass trig / Fourier inversion)
  can be expressed with Lean core types and minimal abstract infrastructure.

If a future theorem requires Mathlib, uncomment the require block below and
ensure the Lean toolchain matches Mathlib's supported version.

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"
-/

@[default_target]
lean_lib «MathWIKI»