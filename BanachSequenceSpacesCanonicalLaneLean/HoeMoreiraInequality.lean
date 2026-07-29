import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

structure InequalityPackage where
  inequality_name : String
  lhs : Prop
  rhs : Prop
  proof_available : Prop

structure InequalityEvidence (I : InequalityPackage) where
  lhs_closed : I.lhs
  rhs_closed : I.rhs
  proof_available_closed : I.proof_available

def InequalityClosed (I : InequalityPackage) : Prop :=
  I.lhs ∧ I.rhs ∧ I.proof_available

theorem inequality_closed_from_evidence (I : InequalityPackage) (E : InequalityEvidence I) : InequalityClosed I :=
  And.intro E.lhs_closed (And.intro E.rhs_closed E.proof_available_closed)

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse