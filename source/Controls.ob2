MODULE Controls; (* VI 19.1.2013 / 26.7.2014*)
  IMPORT Out;

  CONST
    NMAX* = 52;  (* maximum number of adjustable parameters *)
    PMAX* = 978; (* maximum population *)
    DMAX* = 6;   (* maximum number of Genes (digits) per Chromosome segement *)

  TYPE GAControls* = RECORD (* Control variables and flags *)
    np: INTEGER; (* number of individuals in a population (default is 100) *)
    ngen: INTEGER; (* number of generations over which solution is to evolve (default is 500)*)
    ndig: INTEGER; (* number of significant digits (i.e., number of genes) retained in chromosomal encoding *)
    pcross: REAL; (* crossover probability; must be  <= 1.0 (default is 0.85). *)
    imut: INTEGER; (* mutation mode; 1/2/3/4/5 (default is 2) *)
    pmut: REAL; (* initial mutation rate; should be small (default is 0.005) *)
    pmutmn: REAL; (* minimum mutation rate; must be >= 0.0 (default is 0.0005) *)
    pmutmx: REAL; (* maximum mutation rate; must be <= 1.0 (default is 0.25) *)
    fdif: REAL; (* relative fitness differential; range from 0 (none) to 1 (maximum).  (default is 1.) *)
    irep: INTEGER; (* reproduction plan; 1/2/3=Full generational replacement/Steady-state-replace-random/Steady-state-replace-worst (default is 3) *)
    ielite: INTEGER; (* elitism flag; 0/1=off/on (default is 0) *)
    ivrb: INTEGER; (* printed output 0/1/2=None/Minimal/Verbose (default is 0) *)
  END;

  TYPE Phenotype* = ARRAY NMAX OF REAL;
  TYPE Genotype* = ARRAY NMAX*DMAX OF INTEGER;

  VAR GACtl*: GAControls;

  PROCEDURE Default*; (* Init default *)
  BEGIN
    GACtl.np := PMAX; GACtl.ngen := 500; GACtl.ndig := 6;
    GACtl.pcross := 0.85;
    GACtl.imut := 2; GACtl.pmut := 0.005; GACtl.pmutmn := 0.0005; GACtl.pmutmx := 0.25;
    GACtl.fdif := 1.; GACtl.irep := 2; GACtl.ielite := 0;
    GACtl.ivrb := 0; 
  END Default;

  PROCEDURE Report*;
  BEGIN
    Out.Ln;
  END Report;

BEGIN
  Default
END Controls.
(*
 rm *.sym | ~/xds/bin/xc =compile Controls.ob2
 http://www.claudio.ch/V4/
 *)