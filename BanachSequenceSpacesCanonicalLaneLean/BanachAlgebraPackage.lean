import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.SequenceSpacePackage

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure BanachAlgebraPackage (X : SequenceSpacePackage) where
  multiplication : (X.indexSet → X.scalarField) → (X.indexSet → X.scalarField) → (X.indexSet → X.scalarField)
  associative : Prop
  distributive : Prop
  submultiplicativeNorm : Prop
  unitElement : X.indexSet → X.scalarField
  unitProperty : Prop

structure BanachAlgebraEvidence {X : SequenceSpacePackage} (A : BanachAlgebraPackage X) where
  associativeClosed : A.associative
  distributiveClosed : A.distributive
  submultiplicativeNormClosed : A.submultiplicativeNorm
  unitPropertyClosed : A.unitProperty

def BanachAlgebraClosed {X : SequenceSpacePackage} (A : BanachAlgebraPackage X) : Prop :=
  A.associative ∧ A.distributive ∧ A.submultiplicativeNorm ∧ A.unitProperty

theorem banach_algebra_closed_from_evidence {X : SequenceSpacePackage} (A : BanachAlgebraPackage X) (E : BanachAlgebraEvidence A) : BanachAlgebraClosed A := by
  exact And.intro E.associativeClosed (And.intro E.distributiveClosed (And.intro E.submultiplicativeNormClosed E.unitPropertyClosed))

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse