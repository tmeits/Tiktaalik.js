(* sorting-algorithms *)
(**)
MODULE Sorts;
  IMPORT Out;
  
  CONST n = 10000; p = 13;
  TYPE Item* = INTEGER;
  VAR a: ARRAY n OF Item;
  
PROCEDURE PrintArray*(n: Item; a: ARRAY OF Item);
  VAR i: Item;
BEGIN
  FOR i:=0 TO n-1 DO
    Out.Int(a[i],6); 
  END;
  Out.Ln;
END PrintArray;

PROCEDURE InitArray*(n: Item; VAR a: ARRAY OF Item); 
  VAR i, j: INTEGER;
BEGIN
  j := 0;
  FOR i := n-1 TO 0 BY -1 DO
    a[j] := i; j := j+1;
  END;
END InitArray;

PROCEDURE BubbleSort*(n: Item; VAR a: ARRAY OF Item); (*  *)
  VAR i, j: INTEGER; x: Item;
BEGIN
  FOR i := 1 TO n-1 DO
    FOR j := n-1 TO i BY -1 DO
      IF a[j-1] > a[j] THEN
        x := a[j-1]; a[j-1] := a[j]; a[j] := x;
      END;
    END;
  END;
END BubbleSort;

BEGIN (* Test *)
  InitArray(p, a); PrintArray(p, a);
  BubbleSort(p, a);
  PrintArray(p, a);
END Sorts.
(*
  rm *.sym
  ~/xds/bin/xc =make s.ob2 +MAIN
  gcc -m32 -o Sorts Sorts.o  ~/xds/lib/x86/libts.a ~/xds/lib/x86/libxds.a  -lm
  sudo apt-get install gcc-multilib
  *)
  
