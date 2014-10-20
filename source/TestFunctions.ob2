MODULE TestFunctions; (* VI 19.4.2014 *)
  IMPORT Out;

  TYPE Item = LONGINT;
  TYPE RealItem = REAL;

  PROCEDURE DeJong* (n: Item; a: ARRAY OF RealItem): RealItem; (* Test functions for optimization *)
    VAR i: Item;
      r: RealItem;
  BEGIN
    r := 0.0;
    FOR i := 0 TO n-1 DO
      r := a[i]*a[i];
    END;
    RETURN r
  END DeJong;
BEGIN (* This program runs the DeJong test problems *)
  Out.Ln
END TestFunctions.
(*
  rm *.sym | ~/xds/bin/xc =compile TestFunctions.ob2 
  http://lancet.mit.edu/galib-2.4/examples/ex19.C
  ~/xds/bin/xc  =compile  TestFunctions.ob2 +MAKEDEF
*)