(** TEST GENETICS MODULE *)
MODULE testGenetics;
   IMPORT Out, MathR, Random, Controls, Genetics;
(**
  testEncode:    encodes phenotype into genotype
  testDecode:    decodes genotype into phenotype
  testCross:     Breeds two offspring from two parents
  testMutate:    Introduces random mutation in a genotype
  testAdjmut:    Implements variable mutation rate
*)
   TYPE Item* = INTEGER;
   TYPE Bits* = INTEGER;

   VAR ph: Controls.Phenotype; gn: Controls.Genotype; 
   
PROCEDURE testEncode*();
(**   *)
VAR i: Item; val: REAL;
BEGIN
   Random.InitSeed(12);
   val := Random.URand(); ph[0] := val;
   Out.Real(ph[0],6); Out.Ln;
   Genetics.Encode(1, 6, ph, gn);
   FOR i := 0 TO 6-1 DO
      Out.Int(gn[i],6); Out.Ln;
   END;
   Genetics.Decode(1,6, gn, ph);
   Out.Real(ph[0],6); Out.Ln;
END testEncode;

BEGIN
   testEncode()
END testGenetics.
(**
   rm *.sym | ~/xds/bin/xc =compile Controls.ob2 
 ~/xds/bin/xc =compile Random.ob2
 ~/xds/bin/xc =make Genetics.ob2
 ~/xds/bin/xc =make ~/git/Tiktaalik/test/testGenetics.ob2 +MAIN
 ./testGenetics
 
 @test Pikaia.encode(1,6,[0.27749011]) == [2, 7, 7, 4, 9, 0]
 *)
