import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachSequenceSpacesCanonicalLaneLean

def ConstrainedBanachSequenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_banach_sequence_endgame (A : AdmissibleClass) : ConstrainedBanachSequenceClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BanachSequenceSpacesCanonicalLaneLean
end HautevilleHouse