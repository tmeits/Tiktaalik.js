(** Test functions for optimization *)
MODULE TestFunctions;
  IMPORT Out;
  TYPE
   Item = LONGINT;
  TYPE 
   RealItem = REAL;
(**  *)
PROCEDURE DeJong* (n: Item; a: ARRAY OF RealItem) : RealItem;
  VAR i: Item;
    r: RealItem;
BEGIN
  r := 0.0;
  FOR i := 0 TO n-1 DO
    r := a[i]*a[i];
  END;
  RETURN r;
END DeJong;
(** This program runs the DeJong test problems *)
BEGIN
  Out.Ln;
END TestFunctions.
(**
 rm *.sym | ~/xds/bin/xc =compile TestFunctions.ob2 
 http://lancet.mit.edu/galib-2.4/examples/ex19.C
*)