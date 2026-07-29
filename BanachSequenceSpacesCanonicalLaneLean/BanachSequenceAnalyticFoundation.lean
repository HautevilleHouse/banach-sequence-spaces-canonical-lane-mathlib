import HautevilleHouse.BanachSequenceSpacesCanonicalLaneLean.OperatorProperties

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure BanachSequenceFoundation where
  baseSpace : BanachSequenceSpace ℝ
  basis : SchauderBasis baseSpace.toSequenceSpace
  algebra : BanachAlgebra baseSpace
  operatorSet : List (LinearOperator baseSpace baseSpace)

def BanachSequenceFoundationClosed (F : BanachSequenceFoundation) : Prop :=
  F.baseSpace.complete ∧
  SchauderBasis_axioms F.basis ∧
  BanachAlgebra_axioms F.algebra

theorem banach_sequence_foundation_closed (F : BanachSequenceFoundation) :
    BanachSequenceFoundationClosed F := by
  refine And.intro F.baseSpace.complete ?_
  refine And.intro ?_ ?_
  · exact F.basis.linearIndependent
  · exact F.basis.spanDense
  · exact F.algebra.normInequality

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse