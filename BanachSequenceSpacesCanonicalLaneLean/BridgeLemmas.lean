import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

def BanachSequenceWitnessClosed (O : BanachSequenceAdmittedObject) : Prop :=
  O.isBasis ∧ O.schauderBasis ∧ O.basisNormEquivalence

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BanachSequenceWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse