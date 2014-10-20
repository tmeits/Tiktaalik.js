MODULE Sorts; (* VI 19.4.2014*)
  IMPORT Out, Random;
  
  CONST n = 10000; p = 13;

  TYPE Item* = INTEGER; RealItem* = REAL;
  
  VAR a: ARRAY n OF Item; r: ARRAY n OF RealItem;
    rp: ARRAY p OF RealItem; ap: ARRAY p OF Item;
  
  PROCEDURE PrintArray*(n: Item; a: ARRAY OF Item);
    VAR i: Item;
  BEGIN
    FOR i:=0 TO n-1 DO
      Out.Int(a[i],6); 
    END;
    Out.Ln;
  END PrintArray;

  PROCEDURE PrintArrayReal*(n: Item; a: ARRAY OF RealItem);
    VAR i: Item;
  BEGIN
    FOR i:=0 TO n-1 DO
      Out.Real(a[i],12); 
    END;
    Out.Ln;
  END PrintArrayReal;

  PROCEDURE InitArray*(n: Item; VAR a: ARRAY OF Item); 
    VAR i, j: INTEGER;
  BEGIN
    j := 0;
    FOR i := n-1 TO 0 BY -1 DO
      a[j] := i; j := j+1;
    END;
  END InitArray;

  PROCEDURE InitArrayReal*(n: Item; VAR a: ARRAY OF RealItem); 
    VAR i, j: INTEGER;
  BEGIN
    j := 0;
    FOR i := n-1 TO 0 BY -1 DO
      a[j] := i + 0.3456789; j := j+1;
    END;
  END InitArrayReal;

  PROCEDURE InitArrayRealRandom* (n: Item; VAR a: ARRAY OF RealItem);
    VAR i: INTEGER;
  BEGIN
    Random.InitSeed(45);
    FOR i := 0 TO n-1 DO
      a[i] := Random.URand();
    END;
  END InitArrayRealRandom;

  PROCEDURE BubbleSort*(n: Item; VAR a: ARRAY OF Item); 
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

  PROCEDURE BubbleSortReal*(n: Item; VAR a: ARRAY OF RealItem); 
    VAR i, j: INTEGER; x: RealItem;
  BEGIN
    FOR i := 1 TO n-1 DO
      FOR j := n-1 TO i BY -1 DO
        IF a[j-1] > a[j] THEN
          x := a[j-1]; a[j-1] := a[j]; a[j] := x;
        END;
      END;
    END;
  END BubbleSortReal;

  PROCEDURE sort ( L, R: INTEGER; VAR a: ARRAY OF Item );
    VAR  i, j: INTEGER;  w, x: Item;
  BEGIN
    i := L;  j := R;
    x := a[(L+R) DIV 2];
    REPEAT
      WHILE  a[i] < x  DO  i := i+1  END;
        WHILE  x < a[j]  DO  j := j-1  END;
  	IF  i <= j  THEN
  	w := a[i];  a[i] := a[j];  a[j] := w;
  	i := i+1;  j := j-1
    END
    UNTIL  i > j;
    IF  L < j  THEN sort(L, j, a) END;
    IF  i < R  THEN sort(i, R, a) END
  END sort;

  PROCEDURE QuickSort*(n: Item; VAR a: ARRAY OF Item);   
  BEGIN  sort(0, n-1, a)
  END QuickSort;

  PROCEDURE SortPermutation* (n: Item; (* number of individuals in a population *)
    a: ARRAY OF RealItem; VAR p: ARRAY OF Item);
    VAR i, j, k: Item;
      x: RealItem;
  BEGIN
    FOR i := 0 TO n-1 DO
      p[i] := i;
    END;
    (* BubbleSortReal *)
    FOR i := 1 TO n-1 DO
      FOR j := n-1 TO i BY -1 DO
        IF a[j-1] > a[j] THEN
          x := a[j-1]; a[j-1] := a[j]; a[j] := x;
          k := p[j-1]; p[j-1] := p[j]; p[j] := k;
        END;
      END;
    END;
  END SortPermutation;

  PROCEDURE Test*;
  BEGIN
    Out.String("*** BubbleSort"); Out.Ln;
    InitArray(p, a); PrintArray(p, a);
    BubbleSort(p, a);
    PrintArray(p, a);
    Out.String("*** BubbleSortReal"); Out.Ln;
    InitArrayReal(p, r); PrintArrayReal(p, r);
    BubbleSortReal(p, r);
    PrintArrayReal(p, r);
    Out.String("*** QuickSort"); Out.Ln;
    InitArray(p, a); PrintArray(p, a);
    QuickSort(p, a);
    PrintArray(p, a);
    Out.String("*** SortPermutation"); Out.Ln;
    InitArrayReal(p, r); InitArray(p, a);
    SortPermutation(p, r, a);
    PrintArray(p, a);
    PrintArrayReal(p, r);

    Out.String("*** SortPermutation 2"); Out.Ln;
    InitArrayReal(p, rp); (*InitArray(p, ap);*)
    rp[7] := 0.1;
    SortPermutation(p, rp, ap);
    PrintArray(p, ap);
    PrintArrayReal(p, rp);

    Out.String("*** SortPermutation Random"); Out.Ln;
    InitArrayRealRandom(p, rp); 
    SortPermutation(p, rp, ap);
    PrintArray(p, ap);
    PrintArrayReal(p, rp);
  END Test;

BEGIN (* Test *)
  Test
END Sorts.

(*
  ~/xds/bin/xc =o
  ~/xds/bin/xc =make Sort.ob2  +CHANGESYM +VERBOSE
  ~/xds/bin/xc =compile Sort.ob2 +MAIN
  +CHANGESYM
  rm *.sym
  ~/xds/bin/xc =compile Random.ob2
  ~/xds/bin/xc =make Sort.ob2 +MAIN
  rm *.sym | ~/xds/bin/xc =compile Sort.ob2 +MAIN !!!
  rm *.sym | ~/xds/bin/xc =make Sort.ob2 +MAIN
  gcc -m32 -o Sorts Sorts.o  ~/xds/lib/x86/libts.a ~/xds/lib/x86/libxds.a  -lm
  sudo apt-get install gcc-multilib *** for ubuntu 12.04 64bits
  
  READ
  http://www.excelsior.ru/files/pages/wirth-pim.pdf
  http://www.uni-vologda.ac.ru/oberon/infoart/m2&oop.htm
  *)
 