import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.SequenceSpacePackage

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure ComplementedSubspacePackage (X : SequenceSpacePackage) where
  subspace : Set (X.indexSet → X.scalarField)
  projection : ((X.indexSet → X.scalarField) → (X.indexSet → X.scalarField))
  boundedLinear : Prop
  idempotent : Prop
  rangeEqualsSubspace : Prop

structure ComplementedSubspaceEvidence {X : SequenceSpacePackage} (C : ComplementedSubspacePackage X) where
  boundedLinearClosed : C.boundedLinear
  idempotentClosed : C.idempotent
  rangeEqualsSubspaceClosed : C.rangeEqualsSubspace

def ComplementedSubspaceClosed {X : SequenceSpacePackage} (C : ComplementedSubspacePackage X) : Prop :=
  C.boundedLinear ∧ C.idempotent ∧ C.rangeEqualsSubspace

theorem complemented_subspace_closed_from_evidence {X : SequenceSpacePackage} (C : ComplementedSubspacePackage X) (E : ComplementedSubspaceEvidence C) : ComplementedSubspaceClosed C := by
  exact And.intro E.boundedLinearClosed (And.intro E.idempotentClosed E.rangeEqualsSubspaceClosed)

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse