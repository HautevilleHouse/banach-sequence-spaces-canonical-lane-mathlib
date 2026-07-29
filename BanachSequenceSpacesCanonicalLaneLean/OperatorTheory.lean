import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.SequenceSpaceProperties

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure BoundedLinearOperator (B : BanachSequenceSpace) where
  domain : B.underlyingSpace → B.underlyingSpace
  linear : ∀ x y, f (x + y) = f x + f y ∧ ∀ c x, f (c • x) = c • f x
  bounded : ∃ M, ∀ x, norm (f x) ≤ M * norm x

theorem operator_norm_exists (f : BoundedLinearOperator B) :
  ∃ M, (∀ x, norm (f x) ≤ M * norm x) ∧ (∀ M' < M, ∃ x, norm (f x) > M' * norm x) :=
  sorry

def shiftOperator (B : BanachSequenceSpace) (k : ℕ) : BoundedLinearOperator B :=
  { domain := λ x n => x (n + k),
    linear := by intro x y; simp,
    bounded := by use 1; intro x; simp [norm] }

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse