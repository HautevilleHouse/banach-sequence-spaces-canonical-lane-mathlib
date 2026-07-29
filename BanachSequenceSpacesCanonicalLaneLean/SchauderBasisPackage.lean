import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.SequenceSpacePackage

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure SchauderBasisPackage (X : SequenceSpacePackage) where
  basisVectors : ℕ → (X.indexSet → X.scalarField)
  coefficientFunctionals : ℕ → ((X.indexSet → X.scalarField) → X.scalarField)
  expansionProperty : Prop
  uniquenessProperty : Prop

structure SchauderBasisEvidence {X : SequenceSpacePackage} (B : SchauderBasisPackage X) where
  expansionPropertyClosed : B.expansionProperty
  uniquenessPropertyClosed : B.uniquenessProperty

def SchauderBasisClosed {X : SequenceSpacePackage} (B : SchauderBasisPackage X) : Prop :=
  B.expansionProperty ∧ B.uniquenessProperty

theorem schauder_basis_closed_from_evidence {X : SequenceSpacePackage} (B : SchauderBasisPackage X) (E : SchauderBasisEvidence B) : SchauderBasisClosed B := by
  exact And.intro E.expansionPropertyClosed E.uniquenessPropertyClosed

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse