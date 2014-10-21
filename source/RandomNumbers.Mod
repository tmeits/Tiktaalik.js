(* From M.Raiser, N.Wirth "Programming in Oberon" *)
MODULE RandomNumbers;

VAR z: LONGINT;

PROCEDURE Uniform*(): REAL;
  CONST
    a = 16807;  m = 2147483647;
    q = m DIV a;  r = m MOD a;
  VAR gamma: LONGINT;
BEGIN
  gamma:=a*(z MOD q) - r*(z DIV q);
  IF gamma>0 THEN z:=gamma
  ELSE z:=gamma+m
  END;
  RETURN z*(1.0/m)
END Uniform;

PROCEDURE InitSeed*(seed: LONGINT);
BEGIN 
  z:=seed;
END InitSeed;

BEGIN
  z:=314159;
END RandomNumbers.
(*http://www.modulaware.com/mdlt37.htm
http://www.astrobe.com/Oberon.Guide.pdf
http://forum.oberoncore.ru/download/file.php?id=1956
http://repl.it/1uI/1*)