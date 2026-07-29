import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure BanachSequenceSpace where
  carrier : Type
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier
  normedGroup : NormedGroup carrier
  complete : CompleteSpace carrier

default

structure BanachSequenceAdmittedObject where
  space : BanachSequenceSpace
  isBasis : Prop
  schauderBasis : Prop
  basisNormEquivalence : Prop
  conclusion : isBasis ∧ schauderBasis ∧ basisNormEquivalence

structure AdmissibleClass where
  object : BanachSequenceAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BanachSequenceWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse