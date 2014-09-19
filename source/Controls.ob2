(* Control variables and flags *)
MODULE Controls;
CONST
  NMAX* = 32;  (* NMAX is the maximum number of adjustable parameters *)
  PMAX* = 128; (* PMAX is the maximum population *)
  DMAX* = 6;   (* DMAX is the maximum number of Genes (digits) per Chromosome segement *)
TYPE setctl* =
  RECORD
    n:  INTEGER; (* number of individuals in a population (default is 100) *)
    ng: INTEGER; (*number of generations over which solution is to evolve (default is 500)*)
  END;
PROCEDURE Default*;
BEGIN
END Default;	
PROCEDURE Report*;
BEGIN
END Report;
BEGIN
END Controls.
(*
 rm *.sym | ~/xds/bin/xc =make Controls.ob2 +MAIN
 *)