MODULE RandomNumbers; (* From M.Raiser, N.Wirth "Programming in Oberon" *)
IMPORT JS;

VAR z: INTEGER;

PROCEDURE Uniform*(): REAL;
  CONST
    a = 16807;  m = 2147483647;
    q = m DIV a;  r = m MOD a;
  VAR gamma: INTEGER;
BEGIN
  gamma:=a*(z MOD q) - r*(z DIV q);
  IF gamma>0 THEN z:=gamma
  ELSE z:=gamma+m
  END;
  RETURN FLT(z)*(1.0/FLT(m))
END Uniform;

PROCEDURE InitSeed*(seed: INTEGER);
BEGIN 
  z:=seed;
END InitSeed;

BEGIN
  z:=314159;
  JS.console.log(Uniform())
END RandomNumbers.
(*
var RandomNumbers = function (JS){
var z = 0;

function Uniform(){
    var a = 16807;
  var m = 2147483647;
  var q = m / a | 0;
  var r = m % a;
  var gamma = 0;
  gamma = (a * (z % q) | 0) - (r * (z / q | 0) | 0) | 0;
  if (gamma > 0){
    z = gamma;
  }
  else {
    z = gamma + m | 0;
  }
  return z * (1 / m);
}

function InitSeed(seed/*INTEGER*/){
  z = seed;
}
z = 314159;
JS.console.log(Uniform());
return {
  Uniform: Uniform,
  InitSeed: InitSeed
}
}(this);
*)
(*http://repl.it/1uI/2*)