/-!
MathWIKI.Defs — 通用定义层

本文件提供形式化三个试点定理所需的最小抽象。为避免依赖 Mathlib,使用
Lean core 类型(Real、Complex、ContinuousOn 等)的轻量封装。

约定:
- 使用 Stein 记号:Fourier 变换 $\hat f(\xi) = \int f(x) e^{-2\pi i \xi x}\,dx$
- 所有类型不依赖 Mathlib;若未来需要 Mathlib,本文件将成为 Mathlib 类型的别名层
-/

namespace MathWIKI

/-- 圆群 $\mathbb{T}$ 上的连续函数(以 $2\pi$ 为周期的实值或复值连续函数) -/
structure CircleFunction where
  val : ℝ → ℂ
  periodic : ∀ x : ℝ, val (x + 2 * Real.pi) = val x
  continuous : Continuous val

/-- 三角多项式(有限和 $\sum_{|n| \le N} c_n e^{in\theta}$) -/
structure TrigPoly where
  coeffs : ℤ → ℂ       -- 仅有限个非零
  supportBound : ℕ      -- |n| > supportBound ⇒ coeffs n = 0

/-- Schwartz 空间 $\mathcal{S}(\mathbb{R})$ 的最小定义(速降 + 光滑)。
    此处仅声明类型,具体条件在 FourierInversion.lean 中展开。 -/
def Schwartz (f : ℝ → ℂ) : Prop :=
  -- placeholder: light-weight predicate; replaced by the actual Lean theorem body
  True

/-- 沿可求长曲线 $\gamma$ 的围道积分占位类型。
    三试点中:Cauchy Goursat 用三角围道,Weierstrass 用求和,Fourier 用 Lebesgue 积分。
    此处给出最小抽象,具体定义见各 theorem 文件。 -/
def contourIntegralPlaceholder : Prop :=
  True

end MathWIKI