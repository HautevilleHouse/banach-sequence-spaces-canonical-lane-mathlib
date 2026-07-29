import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure SequenceSpace (α : Type u) where
  carrier : Set (ℕ → α)
  norm : (ℕ → α) → ℝ
  norm_nonneg : ∀ x, 0 ≤ norm x
  norm_zero_iff : ∀ x, norm x = 0 ↔ x = 0
  norm_triangle : ∀ x y, norm (x + y) ≤ norm x + norm y
  norm_smul : ∀ (c : ℝ) (x : ℕ → α), norm (c • x) = |c| * norm x

structure BanachSequenceSpace (α : Type u) extends SequenceSpace α where
  complete : ∀ f : ℕ → (ℕ → α), (∀ n, f n ∈ carrier) → (Cauchy f) → ∃ x ∈ carrier, f → x

structure SchauderBasis (X : SequenceSpace ℝ) where
  basis : ℕ → (ℕ → ℝ)
  linearIndependent : ∀ (c : ℕ → ℝ) (finite : ∃ N, ∀ n > N, c n = 0), (∑' n, c n • basis n) = 0 → ∀ n, c n = 0
  spanDense : ∀ x ∈ X.carrier, ∃ (c : ℕ → ℝ), (∑' n, c n • basis n) = x

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse