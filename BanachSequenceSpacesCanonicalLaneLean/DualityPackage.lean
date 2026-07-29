import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure DualityPackage where
  p : ℝ≥0∞
  q : ℝ≥0∞
  holder_conjugate : 1/p + 1/q = 1
  dual_is_isomorphic : Prop
  isometric_embedding : Prop

structure DualityEvidence (D : DualityPackage) where
  dual_is_isomorphic_closed : D.dual_is_isomorphic
  isometric_embedding_closed : D.isometric_embedding

def DualityClosed (D : DualityPackage) : Prop :=
  D.dual_is_isomorphic ∧ D.isometric_embedding

theorem duality_closed_from_evidence (D : DualityPackage) (E : DualityEvidence D) : DualityClosed D :=
  And.intro E.dual_is_isomorphic_closed E.isometric_embedding_closed

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse