(* sorting-algorithms-bogosort.oberon-2 *)
MODULE Sort;
	IMPORT Out, Random;
	VAR a: ARRAY 10 OF INTEGER;

PROCEDURE Init;
    VAR i: INTEGER;
BEGIN
    FOR i := 0 TO LEN(a) - 1 DO
        a[i] := i + 1;
    END;
END Init;
PROCEDURE Sorted*(VAR a: ARRAY OF INTEGER): BOOLEAN;
	VAR i: INTEGER;
BEGIN
    IF LEN(a) <= 1 THEN
       	RETURN TRUE;
   	END;
   	FOR i := 1 TO LEN(a) - 1 DO
       	IF (a[i] < a[i - 1]) THEN
           	RETURN FALSE;
        END;
    END;
	RETURN TRUE;
END Sorted;
PROCEDURE Shuffle*(VAR a: ARRAY OF INTEGER);
    VAR n, t, r: INTEGER;
BEGIN
    FOR n := 0 TO LEN(a) - 1 DO
        r := Random.Roll(n);
        t := a[n];
        a[n] := a[r];
        a[r] := t;
    END;
END Shuffle;
PROCEDURE BubbleSort; (* ADenS2_Sorts *)
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
