(* sorting-algorithms *)
MODULE Sort;
	IMPORT Out;

PROCEDURE BubbleSort(a: ARRAY * OF INTEGER); (* ADenS2_Sorts *)
  VAR i, j: INTEGER; x: Item;
BEGIN
  FOR i := 1 TO n-1 DO
    FOR j := n-1 TO i BY -1 DO
      IF a[j-1] > a[j] THEN
        x := a[j-1]; a[j-1] := a[j]; a[j] := x
      END
    END
  END
END BubbleSort;
BEGIN
	Out.Ln;
END Sort.
(* http://www.inr.ac.ru/~info21/ADen/AD2012.pdf page 66*)
