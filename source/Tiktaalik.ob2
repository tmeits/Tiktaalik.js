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
   Chromosome* = ARRAY Controls.NMAX OF RealItem;
   Population* = ARRAY Controls.PMAX OF Controls.Phenotype;
   
PROCEDURE evolve* (n: Item; ff: FitnessFunction);
   CONST N = 10;
   VAR a : ARRAY N OF RealItem; r : RealItem; i : Item;
   VAR pop : Population; ch, ch1 : Chromosome; ch2 : Controls.Phenotype;
      
BEGIN
   (** Initial Population for Genetic Algorithms *)
   ch[0] :=0; ch2[0] := 1; pop[0,0] := ch[0]; pop[0,0] := ch2[0]; ch := ch1;
   pop[2] := ch1;
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
 http://neuronus.com/em/19-theory/14-osnovnaya-terminologiya-geneticheskikh-algoritmov.html
*)