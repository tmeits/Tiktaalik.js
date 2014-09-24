(* Sample driver module for Tiktaalik.ob2 *)
MODULE SampleDriver;
  IMPORT In, Out, Random, Controls, TestFunctions, Tiktaalik;
  TYPE Item = INTEGER; RealItem = REAL;
  VAR n, seed, i, status : Item;
PROCEDURE SimpleGA;
BEGIN
  (* First, initialize the random-number generator *)
  Random.InitSeed(12345);
  (* Set control variables (use defaults) *)
  Controls.Default;
  (* Now call Tiktaalik *)
  Tiktaalik.evolve();
END;
BEGIN
END SampleDriver.
(*

*)