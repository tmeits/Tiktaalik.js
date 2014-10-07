(**    *)
MODULE Random;
   IMPORT Out;
   TYPE  Item = INTEGER;
   VAR z: LONGINT;

   (* From M.Raiser, N.Wirth "Programming in Oberon" *)
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

   PROCEDURE rand16*(VAR x: LONGINT);
   BEGIN
     x:=ENTIER(Uniform()*10000H);
   END rand16;

   PROCEDURE InitSeed*(seed: LONGINT);
   BEGIN
     IF seed < 0 THEN 
       Out.String("Wrong number - set default InitSeed(12345)"); Out.Ln;
       z := 12345
     ELSE z:=seed
     END
   END InitSeed;

   (* "Minimal standard" pseudo-random number generator of Park and
       Miller. Returns a uniform random deviate r s.t. 0.0 < r < 1.0. *)
   PROCEDURE ran0(VAR seed: LONGINT): REAL;
     CONST
       A = 48271; M = 2147483647; Q = 44488; R = 3399;
       SCALE = 1./M; EPS = 1.2E-7; RNMX = 1.-EPS;
     VAR
       j: LONGINT;
   BEGIN
     (* Executable section *)
     j := seed DIV Q;
     seed := A*(seed-j*Q)-R*j;
     IF seed < 0 THEN seed := seed+M; END;
     IF seed*SCALE < RNMX THEN RETURN seed*SCALE
     ELSE RETURN RNMX 
     END;
   END ran0;
   (* Return the next pseudo-random deviate from a sequence which is
      uniformly distributed in the interval [0.,1.] *)
   PROCEDURE URand*():REAL;
   BEGIN
     RETURN ran0(z)
   END URand;

   PROCEDURE GetRandomSeed* () : LONGINT;
   BEGIN
      RETURN z;
   END GetRandomSeed;

   PROCEDURE RandUniform* (a,b : REAL) : REAL;
   BEGIN
      RETURN a+URand()*(b-a)
   END RandUniform;
   
   PROCEDURE RandUniformInt* (a,b : LONGINT) : LONGINT;
   BEGIN
      RETURN ENTIER(a+URand()*(b-a))
   END RandUniformInt;

BEGIN
   z:=314159;
END Random.
(* 
   cd ~/git/Tiktaalik/source/
   rm *.sym | ~/xds/bin/xc =compile Random.ob2 
   *)



















