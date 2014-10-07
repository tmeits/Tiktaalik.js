(** Sample driver module for Tiktaalik.ob2 *)
MODULE SampleDriver;
  IMPORT In, Out, Random, Controls, TestFunctions, Tiktaalik;
  TYPE 
   Item = INTEGER; RealItem = REAL;
  VAR 
   n, seed, i, status : Item;
PROCEDURE SimpleGA*;
BEGIN
  (** First, initialize the random-number generator *)
  Random.InitSeed(12345);
  (** Set control variables (use defaults) *)
  Controls.Default;
  (** Now call Tiktaalik *)
  Tiktaalik.evolve(10, TestFunctions.DeJong);
  Out.Ln;
END SimpleGA;
BEGIN
  SimpleGA
END SampleDriver.
(**
   rm *.sym | ~/xds/bin/xc =compile Random.ob2 |
   ~/xds/bin/xc =compile Sort.ob2 |
   ~/xds/bin/xc =compile Controls.ob2 |
   ~/xds/bin/xc =compile TestFunctions.ob2 |
   ~/xds/bin/xc =compile Tiktaalik.ob2 |
   ~/xds/bin/xc =compile SampleDriver.ob2
   

*)