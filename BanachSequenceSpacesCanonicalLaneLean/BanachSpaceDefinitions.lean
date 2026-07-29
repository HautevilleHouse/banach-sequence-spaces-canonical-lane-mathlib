import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure LpSpace (p : ℝ≥0∞) where
  carrier : Set (ℕ → ℝ)
  norm : (ℕ → ℝ) → ℝ
  norm_nonneg : ∀ x, 0 ≤ norm x
  norm_zero : norm 0 = 0
  norm_smul : ∀ (c : ℝ) (x : ℕ → ℝ), norm (c • x) = |c| * norm x
  norm_triangle : ∀ x y, norm (x + y) ≤ norm x + norm y
  completeness : ∀ (f : ℕ → ℕ → ℝ), (∀ n, f n ∈ carrier) → (CauchySeq (λ n => f n)) → ∃ x ∈ carrier, norm (f n - x) → 0

structure BanachSequenceSpace where
  underlyingSpace : Type u
  norm : underlyingSpace → ℝ
  derivedFromLp : LpSpace 1
  basis : ℕ → underlyingSpace
  basisSpanning : ∀ x, ∃ (c : ℕ → ℝ) (h : c atTop=0), x = ∑' n, c n • basis n

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse