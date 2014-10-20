MODULE Genetics; (* VI 19.4.2013 / 20.10.2014 *)
  IMPORT Out, MathR, Random, Controls;

  TYPE Item* = INTEGER;
  TYPE Bits* = INTEGER;

  PROCEDURE Encode*(n: Item; nd: Bits; ph: Controls.Phenotype; VAR gn: Controls.Genotype);
  (* Encode phenotype parameters into integer genotype ph(k) are x,y coordinates [ 0 < x,y < 1 ] *)
    VAR ip, i, j, ii: INTEGER;
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
    END
  END Encode;

  PROCEDURE Decode*(n: Item; nd: Bits; gn: Controls.Genotype; VAR ph: Controls.Phenotype);
  (* decode genotype into phenotype parameters ph(k) are x,y coordinates [ 0 < x,y < 1 ] *)
    VAR ip, i, j, ii: INTEGER;
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
    END
  END Decode;

  PROCEDURE OnePointCrossover* (n: Item; nd: Bits; pcross: REAL; VAR gen1, gen2: Controls.Genotype);
  (* breeds two parent chromosomes into two offspring chromosomes breeding occurs through crossover.*)
    VAR i, tmp: INTEGER; ispl: LONGINT;
  BEGIN
    IF URand() < pcross THEN
      ispl := ENTIER(URand()*n*nd)+1;
      Out.Int(ispl, 9);
      FOR i := ispl TO n*nd DO (* Swap genes*)
        tmp := gen1[i]; gen2[i] := gen1[i]; gen1[i] := tmp;
      END;
    END;
  END OnePointCrossover;

  PROCEDURE Mutation*(); (* Introduces random mutation in a genotype*)
  BEGIN
  END;
BEGIN
END Genetics.
(*
  rm *.sym | ~/xds/bin/xc =compile Controls.ob2 
  ~/xds/bin/xc =compile Random.ob2
  ~/xds/bin/xc =compile Genetics.ob2 
  ~/xds/bin/xc =make Genetics.ob2 +MAIN
  *)
