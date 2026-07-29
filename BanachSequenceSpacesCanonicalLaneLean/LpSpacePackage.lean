import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure LpSpacePackage (p : ℝ≥0∞) where
  carrier_set : Set (ℕ → ℝ)
  norm_def : (carrier_set : Set (ℕ → ℝ)) → ℝ
  completeness : Prop
  holder_inequality : Prop
  minkowski_inequality : Prop

structure LpSpaceEvidence {p : ℝ≥0∞} (L : LpSpacePackage p) where
  completeness_closed : L.completeness
  holder_closed : L.holder_inequality
  minkowski_closed : L.minkowski_inequality

def LpSpaceClosed {p : ℝ≥0∞} (L : LpSpacePackage p) : Prop :=
  L.completeness ∧ L.holder_inequality ∧ L.minkowski_inequality

theorem lp_space_closed_from_evidence {p : ℝ≥0∞} (L : LpSpacePackage p) (E : LpSpaceEvidence L) : LpSpaceClosed L :=
  And.intro E.completeness_closed (And.intro E.holder_closed E.minkowski_closed)

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse