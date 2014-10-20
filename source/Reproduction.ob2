MODULE Reproduction; (* VI 19.4.2014*)
  IMPORT Out, Random, Sorts;

  (* Select*         : Parent selection by roulette wheel algorithm
     RanksPopulation*: Ranks population
     Genrep: Inserts offspring into population, for full generational replacement
     Stdrep: Inserts offspring into population, for steady-state reproduction
     NewPopulation*  : Replaces old generation with new generation *)
  
  PROCEDURE Select*(np: Sorts.Item; jfit: ARRAY OF Sorts.Item; (* rank order*)
                  fdif: REAL; (* relative fitness differential; range from 0 (none) to 1 (maximum).*)
                  VAR idad: INTEGER);
    (* Selects a parent from the population, using roulette wheel algorithm with the relative fitnesses 
      of the phenotypes as the "hit" probabilities [see Davis 1991, chap. 1].*)
    VAR i, np1: INTEGER;
      dice, rtfit: REAL;
  BEGIN
    np1 := np + 1; dice := Random.URand() * np * np1; rtfit := 0.0;
    LOOP 
      FOR i := 0 TO np-1 DO
        rtfit := rtfit + np1 + fdif * (np1 - 2 * jfit[i]);
        IF rtfit >= dice THEN idad := i; EXIT END
      END
    END
  END Select;

  PROCEDURE RanksPopulation*(n: Sorts.Item; arrin: ARRAY OF Sorts.RealItem; VAR indx, rank: ARRAY OF Sorts.Item);
    (* Calls external sort routine to produce key index and rank order
      of input array arrin (which is not altered). *)
    VAR i: Sorts.Item;
  BEGIN
    Sorts.SortPermutation(n, arrin, indx); (* Compute the key index *)
    (* ...and the rank order *)
    FOR i := 0 TO n-1 DO
      rank[indx[i]] := n-i+1;
    END
  END RanksPopulation;

  PROCEDURE NewPopulation*();
  BEGIN 
  END NewPopulation;

BEGIN
  Out.Ln
END Reproduction.
(**
 rm *.sym
 ~/xds/bin/xc =compile Sort.ob2
 ~/xds/bin/xc =compile Random.ob2
 ~/xds/bin/xc =compile Reproduction.ob2
 rm *.sym | ~/xds/bin/xc =make Reproduction.ob2 +MAIN
*)
