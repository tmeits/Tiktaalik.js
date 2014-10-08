(** Optimization (maximization) of user-supplied "fitness" function
   ff over n-dimensional parameter space  x  using a basic genetic
   algorithm method. *)
MODULE Tiktaalik;
  IMPORT Out, Random (*, TestFunctions*), Controls;
  TYPE
   Item = LONGINT;
  TYPE 
   RealItem = REAL;
  TYPE FitnessFunction* =
   PROCEDURE(n: Item; a: ARRAY OF RealItem) : RealItem;
  TYPE (* http://www.doc.ic.ac.uk/~nd/surprise_96/journal/vol1/hmw/article1.gene.gif *)
   Gene* = RealItem;
   Chromosome* = ARRAY Controls.NMAX OF Gene;
   Population* = ARRAY Controls.PMAX OF Chromosome;
   
PROCEDURE evolve* (n: Item; ff: FitnessFunction);
   CONST N = 10;
   VAR a : ARRAY N OF RealItem; r : RealItem; i : Item;
   VAR 
      ch1 : Chromosome; ch2 : Controls.Phenotype;
BEGIN
   (** Initial Population for Genetic Algorithms *)
   ch1 := ch2;
   FOR i := 0 TO N-1 DO
      (* Random.InitSeed(1234);*)
      a[i]:=Random.URand();
   END;
   r := ff(N, a);
   Out.Real(r,9);
END evolve;
BEGIN
   (**evolve(10, TestFunctions.DeJong);
   Out.Ln; *)  
END Tiktaalik.
(**
 
*)