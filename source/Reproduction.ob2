(* REPRODUCTION MODULE *)
MODULE Reproduction;
IMPORT Out, Sorts;
(*
  Select: Parent selection by roulette wheel algorithm
  Rnkpop: Ranks population
  Genrep: Inserts offspring into population, for full generational replacement
  Stdrep: Inserts offspring into population, for steady-state reproduction
  Newpop: Replaces old generation with new generation
*)
PROCEDURE Select (np: Sorts.Item; 
  jfit: ; 
  fdif: ; (* relative fitness differential; range from 0 (none) to 1 (maximum).  (default is 1.) *)
  idad: );
(* Selects a parent from the population, using roulette wheel
   algorithm with the relative fitnesses of the phenotypes as
   the "hit" probabilities [see Davis 1991, chap. 1]. *)
BEGIN
  Out.Ln;
END Select;

PROCEDURE RanksPopulation* (n: Sorts.Item; arrin: ARRAY OF Sorts.RealItem; VAR indx, rank: ARRAY OF Sorts.Item);
(* Calls external sort routine to produce key index and rank order
   of input array arrin (which is not altered). *)
  VAR i: Sorts.Item;
BEGIN
  (* Compute the key index *)
  Sorts.SortPermutation (n, arrin, indx);
  (* ...and the rank order *)
  FOR i := 0 TO n DO
    rank[indx[i]] := n-i+1;
  END;
  Out.Ln;
END RanksPopulation;
BEGIN
  Out.Ln;
END Reproduction.
(*
 rm *.sym | ~/xds/bin/xc =compile Reproduction.ob2 +MAIN
 rm *.sym | ~/xds/bin/xc =make Reproduction.ob2 +MAIN
*)
