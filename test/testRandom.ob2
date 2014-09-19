<*+ MAIN *>
MODULE testRandom;
  IMPORT In, Out, Random;
  CONST n = 10;
  VAR i: LONGINT;
      rnd: REAL;
  CONST FieldWidth = 6;

BEGIN
  In.Open;
  Out.String ("Seed? "); In.LongInt (i); Out.Ln;
  IF ~ In.Done THEN 
    Random.InitSeed(12345);
    Out.String("Wrong number - set default InitSeed(12345)"); Out.Ln;
  ELSE
    Random.InitSeed(i);  
  END;
  FOR i:=1 TO 10 DO
    rnd:=Random.Uniform();
    Out.Real(rnd, FieldWidth); Out.Ln;
  END;
  Out.String("============================="); Out.Ln;
  Random.InitSeed(i);
  FOR i:=1 TO 10 DO
    rnd:=Random.URand();
    Out.Real(rnd, FieldWidth); Out.Ln;
  END;
END testRandom.
(* ~/xds/bin/xc =compile ~/git/Tiktaalik/test/testRandom.ob2 
   gcc  -o testRandom Random.o testRandom.o ~/xds/lib/x86/libts.a ~/xds/lib/x86/libxds.a  -lm 
*)
(* 
http://www.cs.bath.ac.uk/~claire/Oberon.pdf 
http://smalllinux.sourceforge.net/oberon/oakwood.htm
http://www.excelsior-usa.com/doc/xds/xc06.html
http://www.uni-vologda.ac.ru/oberon/o2rus.htm
http://www.inr.ac.ru/~info21/pdf/Modula-Oberon-June-2007-ru.pdf

http://www.kronos.ru/literature/mithril
http://www.kronos.ru/literature/nedorya
*)