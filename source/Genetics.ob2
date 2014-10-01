(** GENETICS MODULE *)
MODULE Genetics;
   IMPORT Out, MathR, Random, Controls;
(**
  Encode:    encodes phenotype into genotype
  Decode:    decodes genotype into phenotype
  Cross:     Breeds two offspring from two parents
  Mutate:    Introduces random mutation in a genotype
  Adjmut:    Implements variable mutation rate
*)
   TYPE Item* = INTEGER;
   TYPE Bits* = INTEGER;

   VAR ph: Controls.Phenotype; gn: Controls.Genotype; i: Item; val: REAL;
   
PROCEDURE Encode*(n: Item; nd: Bits; ph: Controls.Phenotype; VAR gn: Controls.Genotype);
(**  Encode phenotype parameters into integer genotype
      ph(k) are x,y coordinates [ 0 < x,y < 1 ] *)
   VAR ip, i, j, ii : INTEGER;
      z: REAL;
BEGIN
   z := MathR.power(10.0, nd);
   ii := 0;
   FOR i := 0 TO n-1 DO
      ip := SHORT(ENTIER(ph[i]*z));
      FOR j := nd-1 TO 0 BY -1 DO
         gn[ii+j] := ip MOD 10;
         ip := ip DIV 10;
      END;
      ii := ii+nd;
   END;
   (**
   z=10.**nd
      ii=0
      do 1 i=1,n
         ip=int(ph(i)*z)
         do 2 j=nd,1,-1
            gn(ii+j)=mod(ip,10)
            ip=ip/10
    2   continue
        ii=ii+nd
    1 continue
   *)
END Encode;
PROCEDURE Decode*(n: Item; nd: Bits; gn: Controls.Genotype; VAR ph: Controls.Phenotype);
(** decode genotype into phenotype parameters
   ph(k) are x,y coordinates [ 0 < x,y < 1 ] *)
   VAR ip, i, j, ii : INTEGER;
      z: REAL;
BEGIN
   z := MathR.power(10.0, -nd);
   ii := 0;
   FOR i := 0 TO n-1 DO
      ip := 0;
      FOR j := 0 TO nd-1 DO
         ip := 10*ip+gn[ii+j];
      END;
      ph[i] := ip*z;
      ii := ii+nd;
   END;
(**
z=10.**(-nd)
      ii=0
      do 1 i=1,n
         ip=0
         do 2 j=1,nd
            ip=10*ip+gn(ii+j)
    2    continue
         ph(i)=ip*z
         ii=ii+nd
    1 continue
*)
END Decode;
BEGIN
   Random.InitSeed(12);
   val := Random.URand(); ph[0] := val;
   Out.Real(ph[0],6); Out.Ln;
   Encode(1, 6, ph, gn);
   FOR i := 0 TO 6-1 DO
      Out.Int(gn[i],6); Out.Ln;
   END;
   Decode(1,6, gn, ph);
   Out.Real(ph[0],6); Out.Ln;
END Genetics.
(**
 rm *.sym | ~/xds/bin/xc =compile Controls.ob2 
 ~/xds/bin/xc =compile Random.ob2
 ~/xds/bin/xc =make Genetics.ob2 +MAIN

  *)
