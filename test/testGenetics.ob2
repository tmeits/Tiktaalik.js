(** TEST GENETICS MODULE *)
MODULE testGenetics;
(*
  testEncode:    encodes phenotype into genotype
  testDecode:    decodes genotype into phenotype
  testCross:     Breeds two offspring from two parents
  testMutate:    Introduces random mutation in a genotype
  testAdjmut:    Implements variable mutation rate
*)
TYPE Item* = INTEGER;
TYPE Bits* = INTEGER;

PROCEDURE testEncode*(n: Item; nd: Bits; ph: ARRAY OF REAL; gn: ARRAY OF Item);
(**   *)
BEGIN
END Encode;

BEGIN
END testGenetics.
(**
 rm *.sym | ~/xds/bin/xc =make Genetics.ob2 +MAIN *)
