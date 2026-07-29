import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure SequenceSpacePackage where
  scalarField : Type u
  indexSet : Type v
  norm : (indexSet → scalarField) → ℝ
  linearSpace : Prop
  normProperties : Prop
  completeness : Prop

structure SequenceSpaceEvidence (S : SequenceSpacePackage) where
  linearSpaceClosed : S.linearSpace
  normPropertiesClosed : S.normProperties
  completenessClosed : S.completeness

def SequenceSpaceClosed (S : SequenceSpacePackage) : Prop :=
  S.linearSpace ∧ S.normProperties ∧ S.completeness

theorem sequence_space_closed_from_evidence (S : SequenceSpacePackage) (E : SequenceSpaceEvidence S) : SequenceSpaceClosed S := by
  exact And.intro E.linearSpaceClosed (And.intro E.normPropertiesClosed E.completenessClosed)

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse