import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.BanachSpaceDefinitions

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

theorem completeness_iff_cauchy_convergent (B : BanachSequenceSpace) :
  (∀ (f : ℕ → B.underlyingSpace), CauchySeq f → ∃ x, f n → x) :=
by
  intro f hf
  have hcomplete : CompleteSpace B.underlyingSpace := by
    -- B is a Banach space, so it is complete
    exact B.isBanach
  have hcauchy : CauchySeq f := hf
  have hlim : ∃ x, Tendsto f atTop (𝓝 x) := by
    apply hcomplete.tendsto_atTop_iff_cauchySeq.mp
    exact hcauchy
  rcases hlim with ⟨x, hx⟩
  exact ⟨x, hx⟩

theorem schauder_basis_expansion_unique (B : BanachSequenceSpace) (x : B.underlyingSpace) :
  ∃! (c : ℕ → ℝ), x = ∑' n, c n • B.basis n :=
by
  have hbasis : SchauderBasis B.underlyingSpace := B.isSchauderBasis
  have hrep : ∃ c, x = tsum (λ n => c n • B.basis n) := hbasis.repr x
  rcases hrep with ⟨c, hc⟩
  refine ⟨c, hc, ?_⟩
  intro c' hc'
  have hunique : hbasis.repr x = c' := hbasis.repr_unique x hc'
  -- Need to show c = c'
  ext n
  have h_eq : hbasis.repr x n = c' n := by
    simpa using congr_fun hunique n
  have h_c_repr : hbasis.repr x n = c n := by
    -- Since c is one representation, hc says x = ∑ c_n e_n, so hbasis.repr x should equal c
    exact hbasis.repr_eq_coeff x c hc n
  calc
    c n = hbasis.repr x n := by symm; exact h_c_repr
    _ = c' n := h_eq

def isBounded (x : ℕ → ℝ) : Prop :=
  ∃ M, ∀ n, |x n| ≤ M

def isSummable (x : ℕ → ℝ) : Prop :=
  ∃ s, ∀ ε>0, ∃ N, ∀ m≥N, |∑_{n=N}^m x n - s| < ε

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse