import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.BanachSequenceSpace

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure LinearOperator (X Y : SequenceSpace ℝ) where
  f : (ℕ → ℝ) → (ℕ → ℝ)
  linear : ∀ x y, f (x + y) = f x + f y ∧ ∀ c, f (c • x) = c • f x
  bounded : ∃ M > 0, ∀ x ∈ X.carrier, norm Y (f x) ≤ M * norm X x

structure BanachAlgebra (X : BanachSequenceSpace ℝ) extends LinearOperator X X where
  multiplication : (ℕ → ℝ) → (ℕ → ℝ) → (ℕ → ℝ)
  associative : ∀ a b c, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  normInequality : ∀ a b, norm X (multiplication a b) ≤ norm X a * norm X b
  identity : ∃ e ∈ X.carrier, ∀ a, multiplication e a = a ∧ multiplication a e = a

def operatorNorm (X Y : SequenceSpace ℝ) (T : LinearOperator X Y) : ℝ :=
  Inf { M | ∀ x ∈ X.carrier, norm Y (T.f x) ≤ M * norm X x }

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse