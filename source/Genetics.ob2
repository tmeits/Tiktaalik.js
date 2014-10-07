(** GENETICS MODULE *)
MODULE Genetics;
   IMPORT MathR, Random, Controls;
(**
  Encode: encodes phenotype into genotype
  Decode: decodes genotype into phenotype
  OnePointCrossover:
  TwoPointCrossover: Breeds two offspring from two parents
  Mutate: Introduces random mutation in a genotype
  AdjustmentMutation: Implements variable mutation rate
*)
   TYPE Item* = INTEGER;
   TYPE Bits* = INTEGER;

   
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
END Decode;
PROCEDURE OnePointCrossover*(n: Item; nd: Bits; pcross: REAL; gen1, gen2: Controls.Genotype; 
   VAR newgen: Controls.Genotype);
(** breeds two parent chromosomes into two offspring chromosomes
   breeding occurs through crossover. 
*)
BEGIN
END OnePointCrossover;
(**
# *********************************************************************
function one_point_crossover(n::Int, nd::Int, pcross::Float64,
    gn1::Vector{Int}, gn2::Vector{Int})
# =====================================================================  
# breeds two parent chromosomes into two offspring chromosomes
# breeding occurs through crossover. 
# =====================================================================

    gen1 = Int[]
    gen2 = Int[]

    for i = 1:length(gn1)
        push!(gen1, gn1[i])
        push!(gen2, gn2[i])
    end
#     gen1 = copy(gn1)
#     gen2 = copy(gn2)
    ce = false

    if urand() < pcross
        ce   = true
        ispl = fortran_int((urand()*n*nd))+1 # choose cutting point
#       @printf("%7i\n",ispl)
        for i = ispl:n*nd
            t       = gen2[i]
            gen2[i] = gen1[i]
            gen1[i] = t
        end
    end

    return (ce, gen1, gen2)
end

*)
BEGIN
END Genetics.
(**
 rm *.sym | ~/xds/bin/xc =compile Controls.ob2 
 ~/xds/bin/xc =compile Random.ob2
 ~/xds/bin/xc =make Genetics.ob2 +MAIN

  *)
