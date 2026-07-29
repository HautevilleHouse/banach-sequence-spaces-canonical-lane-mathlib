import BanachSequenceSpacesCanonicalLaneLean.SequenceSpacePackage

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure NormedOperatorPackage {P : SequenceSpacePackage} where
  domain : P.sequenceType
  codomain : P.sequenceType
  operator : domain → codomain
  isBoundedLinear : Prop
  operatorNorm : ℝ
  dualSpace : Type u
  isometricEmbedding : Prop

structure NormedOperatorEvidence {P : SequenceSpacePackage} (N : NormedOperatorPackage P) where
  isBoundedLinearClosed : N.isBoundedLinear
  dualSpaceClosed : N.isometricEmbedding

def NormedOperatorClosed {P : SequenceSpacePackage} (N : NormedOperatorPackage P) : Prop :=
  N.isBoundedLinear ∧ N.isometricEmbedding

theorem normed_operator_closed_from_evidence {P : SequenceSpacePackage} (N : NormedOperatorPackage P) (E : NormedOperatorEvidence N) :
    NormedOperatorClosed N :=
  And.intro E.isBoundedLinearClosed E.dualSpaceClosed

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse
