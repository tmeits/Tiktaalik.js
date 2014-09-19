(* GENETICS MODULE *)
MODULE Genetics;
(*
  Encode:    encodes phenotype into genotype
  Decode:    decodes genotype into phenotype
  Cross:     Breeds two offspring from two parents
  Mutate:    Introduces random mutation in a genotype
  Adjmut:    Implements variable mutation rate
*)
TYPE Item* = INTEGER;
TYPE Bits* = INTEGER;

PROCEDURE Encode*(n: Item; nd: Bits; ph: ARRAY OF REAL; gn: ARRAY OF Item);
(*  Encode phenotype parameters into integer genotype
    ph(k) are x,y coordinates [ 0 < x,y < 1 ] *)
BEGIN
END Encode;	

BEGIN
END Genetics.
(* rm *.sym | ~/xds/bin/xc =make Genetics.ob2 +MAIN *)