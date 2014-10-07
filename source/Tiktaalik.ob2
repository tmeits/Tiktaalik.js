(** Optimization (maximization) of user-supplied "fitness" function
   ff over n-dimensional parameter space  x  using a basic genetic
   algorithm method. *)
MODULE Tiktaalik;
  IMPORT Out, Random, TestFunctions;
  TYPE
   Item = LONGINT;
  TYPE 
   RealItem = REAL;
  TYPE FitnessFunction =
   PROCEDURE(n: Item; a: ARRAY OF RealItem) : RealItem;
  VAR
   FF : FitnessFunction;
   
PROCEDURE evolve* (n: Item; ff: FitnessFunction);
   CONST N = 10;
   VAR a : ARRAY N OF RealItem; r : RealItem; i : Item;
BEGIN
   FOR i := 0 TO N-1 DO
      Random.InitSeed(123);
      a[i]:=Random.URand();
   END;
   r := ff(N, a);
   Out.Real(r,9);
END evolve;
BEGIN
   evolve(10, TestFunctions.DeJong);
   Out.Ln;
END Tiktaalik.
(**
   rm *.sym | ~/xds/bin/xc =compile Random.ob2 
   ~/xds/bin/xc =compile Sort.ob2
   ~/xds/bin/xc =compile TestFunctions.ob2
  ~/xds/bin/xc =compile Tiktaalik.ob2
*)