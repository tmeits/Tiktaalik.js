(* Test functions for optimization *)
MODULE TestFunctions;
  IMPORT Out, Sorts;
(*  *)
PROCEDURE DeJong* (n: Sorts.Item; a: ARRAY OF Sorts.RealItem) : Sorts.RealItem;
  VAR i: Sorts.Item;
    r: Sorts.RealItem;
BEGIN
  r := 0.0;
  FOR i := 0 TO n-1 DO
    r := a[i]*a[i];
  END;
  RETURN r;
END DeJong;
(* This program runs the DeJong test problems *)
BEGIN
  Out.Ln;
END TestFunctions.
(*
 rm *.sym | ~/xds/bin/xc =compile Sort.ob2 | ~/xds/bin/xc =make TestFunctions.ob2 +MAIN
 http://lancet.mit.edu/galib-2.4/examples/ex19.C
*)