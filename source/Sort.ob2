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
BEGIN
	Out.Ln;
END Sort.
(* *)