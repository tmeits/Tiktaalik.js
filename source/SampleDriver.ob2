(** Sample driver module for Tiktaalik.ob2 *)
MODULE SampleDriver;
  IMPORT In, Out, Random, Controls, TestFunctions, Tiktaalik;
  TYPE 
   Item = INTEGER; RealItem = REAL;
  VAR 
   n, seed, i, status : Item;
   FF : Tiktaalik.FitnessFunction;
PROCEDURE SimpleGA*;
BEGIN
  (** First, initialize the random-number generator *)
  Random.InitSeed(123);
  (** Set control variables (use defaults) *)
  Controls.Default;
  (** Now call Tiktaalik *)
  FF := TestFunctions.DeJong;
  Tiktaalik.evolve(10, FF);
  Out.Ln;
END SimpleGA; 
BEGIN
  SimpleGA
END SampleDriver.
(**
   http://www.inf.ethz.ch/personal/wirth/ProjectOberon/
   Project Oberon (New Edition 2013)

*)