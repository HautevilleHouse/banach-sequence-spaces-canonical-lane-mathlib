import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.SequenceSpacePackage

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure DualSpacePackage (X : SequenceSpacePackage) where
  dualNorm : (X.indexSet → X.scalarField) → ℝ
  linearFunctionals : Prop
  dualNormProperties : Prop
  isometricEmbedding : Prop

structure DualSpaceEvidence {X : SequenceSpacePackage} (D : DualSpacePackage X) where
  linearFunctionalsClosed : D.linearFunctionals
  dualNormPropertiesClosed : D.dualNormProperties
  isometricEmbeddingClosed : D.isometricEmbedding

def DualSpaceClosed {X : SequenceSpacePackage} (D : DualSpacePackage X) : Prop :=
  D.linearFunctionals ∧ D.dualNormProperties ∧ D.isometricEmbedding

theorem dual_space_closed_from_evidence {X : SequenceSpacePackage} (D : DualSpacePackage X) (E : DualSpaceEvidence D) : DualSpaceClosed D := by
  exact And.intro E.linearFunctionalsClosed (And.intro E.dualNormPropertiesClosed E.isometricEmbeddingClosed)

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse