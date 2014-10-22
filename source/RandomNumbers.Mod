MODULE RandomNumbers; (* From M.Raiser, N.Wirth "Programming in Oberon" *)
IMPORT JS;

VAR z: INTEGER;

PROCEDURE Uniform*(): REAL;
  CONST
    a = 16807; m = 2147483647;
    q = m DIV a; r = m MOD a;
  VAR gamma: INTEGER;
BEGIN
  gamma := a*(z MOD q) - r*(z DIV q);
  IF gamma > 0 THEN z:=gamma
  ELSE z := gamma + m
  END;
  RETURN FLT(z)*(1.0/FLT(m))
END Uniform;

PROCEDURE InitSeed*(seed: INTEGER);
BEGIN 
  z :=seed;
END InitSeed;

PROCEDURE Test*;
  VAR i: INTEGER;
BEGIN
  z:=141556;
  FOR i:=0 TO 10 DO
    JS.console.log(Uniform());
  END
END Test;

BEGIN
  z:=314159;
  Test
END RandomNumbers.
(* http://repl.it/1uI/3
http://css-tricks.com/snippets/css/a-guide-to-flexbox/
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
(*Чаще всего в диктофонах происходят следующие поломки:
Аккумуляторная батарея диктофона не заряжается, либо заряжается не полностью;
Диктофон не включается;
Индикатор вкл/выкл горит, но на дисплее диктофона ничего не отображается;
Диктофон зависает;
В диктофоне не исправен микрофон или динамик.*)