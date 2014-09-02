(* ------|---------|---------|---------|---------|---------|---------|------- *)
(*       BBBB      EEEEE     L         The                                    *)
(*       B   B     E         L           BIOLOGICAL                           *)
(*       BBBB      EEE       L           ENGINEERING                          *)
(*       B    B    E         L           LABORATORY                           *)
(*       BBBBB     EEEEEE    LLLLLL        @ Saginaw Valley State University  *)
(* ------|---------|---------|---------|---------|---------|---------|------- *)

This is version 1.2 of January, 2010, for BEL written by Alan D. Freed.

BEL was compiled on a computer running:
Linux, version 2.6.31-17
Mono JIT compiler, version 2.4.2.3  (see http://www.mono-project.org).
Zonnon compiler, version 1.2.5.53   (see http://www.zonnon.ethz.ch).

BEL is a suite of libraries for the .NET/Mono platforms written in Zonnon.
BEL is released under Version 3 of the GNU Lesser General Public License
(http://www.gnu.org/licences/gpl.html) for libraries.  A copy of this license
agreement can be found in the <doc> directory of this distribution, and is
also attached as an appendix to the Users Guide.  The author has only tested
this suite on the Mono platform running on a Linux machine.

BEL is a platform for developing computational programs and applications. It
is similar to the Oberon packages CAT and CAPO that the author wrote. The idea
is to have single numeric types for numbers, arrays, and matrices. All operators
are overloaded so that they can interface with the numerous .NET core types.
I have used this package as the basis for developing my own programs, and it
works quite well. I've been ferretting out bugs over time, and I'm sure there
are still bugs in this code.  If you run across one, I would appreciate hearing
from you. Contributions that are in the spirit of both Zonnon and BEL are
welcomed and, if you choose, may be considered for inclusion in future releases.

The types for numbers, arrays, and matrices hide their data.  This was done on
purpose so that the internal workings of anyone of these can be changed as the
software evolves without affecting the user interface and the applications that
depend upon it.  All are static or value types.  In the case of the array and
matrix types, and the data structures like lists and trees, their dynamic data
structions are internal - hidden from the programmer.  Again, this was a
purposeful design decision.

Right now the raw type for a number is a System.Double.  In the future, I would
like to change this to a complex number, but that will have to wait until I have
more time that can be dedicate to that activity.

If you find this suite to be useful, the author would like to hear form you.

AUTHOR

Prof. Alan D. Freed
Clifford H. Spicer Chair in Engineering
Saginaw Valley State University
202 Pioneer Hall, 7400 Bay Road
University Center, MI 48710

Tel:  1-989-964-2288
Fax:  1-989-964-2717
Work: adfreed@svsu.edu
Home: alan.d.freed@gmail.com

DIRECTORY STRUCTURE

I place my Zonnon files in my local directory structure ~/Work/code/zonnon.
Yours will likely be different.  I use the following notation in what follows:
   <bel>      to mean ~/Work/code/zonnon/bel
which is the root directory for this package,
   <source>   to mean <bel>/source
which is where the BEL source code resides,
   <bin>      to mean ~/Work/code/zonnon/bin
which is where the DLL and EXE files are placed,
   <doc>      to mean <bel>/doc
which is where the documentation for BEL resides,
   <test>     to mean <bel>/test
which is where the test codes reside, and
   <compiler> to mean ~/Work/code/zonnon/compiler
which (assuming Mono is the framework being used) is where I place the Zonnon
compiler - it consists of six files:
   ETH.Zonnon.dll
   System.Compiler.dll
   System.Compiler.Framework.dll
   System.Compiler.Runtime.dll
   zc.exe
   Zonnon.RTL.dll
The compiler can be updated by swapping these six files for newer versions
(when available) that can be downloaded from http://www.zonnon.ethz.ch.

Documentation is found in the <bel>/docs directory, including this file.  Also
located there is "BEL, A .NET Computational Package Written in Zonnon: A Users
Guide", the GNU LGPL license, and a file zonnon.xml, which is a format file for
highlighting .znn files in the KDE editor Kate.  Zonnon.xml is now distributed
with Kate, so mostlikely it is already installed on your Linux box.

A command line interface to the Zonnon compiler is utilized below.  There are
three integrated development environments that can also be used.  For Windows
machines, MS Visual Studio 2008 or Zonnon Builder can be used, while for Linux
machines, Eclipse can be used (see the Zonnon website).  I prefer Kate and the
command line myself.

THE BEL LIBRARY CONTAINS:

::DEFINITIONS::

   Bel.Object
   Bel.Field
   Bel.EvaluateSeries
   Bel.Gene
   Bel.Chromosome

::MODULES/OBJECTS::

System IO
   Bel.IO.Log
   Bel.IO.DataFiles
   Bel.IO.TextFiles

Persistent Data Structures
   Bel.DATA.Queue
   Bel.DATA.Stack
   Bel.DATA.Keys
   Bel.DATA.List
   Bel.DATA.Tree

Mathematical Fields
   Bel.MF.Numbers
   Bel.MF.Arrays
   Bel.MF.Matrices

Mathematical Functions, Procedures and Operators
   Bel.MATH.Series
   Bel.MATH.Functions
   Bel.MATH.Interpolations
   Bel.MATH.Distributions
   Bel.MATH.Derivatives
   Bel.MATH.Integrals
   Bel.MATH.RungeKutta
   Bel.MATH.LinearAlgebra
   Bel.MATH.NewtonRaphson

::APPLICATIONS::

Genetic Algorithm
   Bel.GA.Statistics
   Bel.GA.Genes
   Bel.GA.Chromosomes
   Bel.GA.Genomes
   Bel.GA.Individuals
   Bel.GA.Colonies
   Bel.GA.GeneticAlgorithm

Physical Fields
   Bel.PF.Units
   Bel.PF.Scalars
   Bel.PF.SMath
   Bel.PF.Vectors2
   Bel.PF.Tensors2
   Bel.PF.QuadTensors2

Biaxial Kinematics/Kinetics
   Bel.BI.Kinematics
   Bel.BI.Kinetics

Tissue Mechanics - Constitutive Model for Tissues
   Bel.TM.Hypoelastic.Isotropic

The files belonging to this library are listed from the lowest level on up:
   01) objects.znn       - definitions for various object types used in BEL
IO and error/warning message interface
   02) log.znn           - for writing messages to the log file
   03) dataFiles.znn     - for reading/writing from/to a binary file
   04) textFiles.znn     - for reading/writing from/to a UTF8 text file
Data structures
   05) queues.znn        - a FIFO data buffer
   06) stacks.znn        - a FILO data buffer
   07) keys.znn          - used in lists and trees to sort their data
   08) lists.znn         - a doubly linked list
   09) trees.znn         - an AVL balanced binary tree
Fields
   10) numbers.znn       - base type for zeroth-order fields
   11) series.znn        - various series expansions for numbers
   12) functions.znn     - math library for numbers
   13) arrays.znn        - base type for first-order  fields
   14) matrices.znn      - base type for second-order fields
   15) linearAlgebra.znn - solves linear systems of matrix/vector equations
Specialized math modules for fields
   16) interpolation.znn - Neville-Aitken interpolation
   17) distributions.znn - percentage-point statistics for some distributions
   18) derivatives.znn   - numeric approximation of derivatives
   19) integrals.znn     - numeric approximation of integrals
   20) rungeKutta.znn    - a 4(3) Runge-Kutta method with step-size control
   21) newtonRaphson.znn - Newton-Raphson iteration via Marquardt-Levenberg

:: APPLICATIONS ::

Genetic Algorithm (GA) for parameter optimization
   22) statistics.znn    - provides log-likelihood obj fn & related statistics
   23) genes.znn         - defines biallelic and triallelic genes for GAs
   24) chromosomes.znn   - defines haploid and diploid chromosomes for GAs
   25) genome.znn        - collects chromosomes into a genotype and manages them
   26) individuals.znn   - combines a genome with its geneology and manages it
   27) colonies.znn      - manages a population of individuals
   28) geneticAlg.znn    - exports a driver or user interface to the GA
Tensor Fields for membrane analysis
   29) units.znn         - SI units
   30) scalars.znn       - zeroth-order tensor fields
   31) sFunctions.znn    - the math library for scalars
   32) vectors2.znn      - first-order  tensor fields in 2-space
   33) tensors2.znn      - second-order tensor fields in 2-space
   34) quadTensors2.znn  - fourth-order tensor fields in 2-space
In-Plane Biaxial BVP
   35) kinematics.znn    - analysis of deformation related tensor fields
   36) kinetics.znn      - analysis of the various stress tensor fields
Tissue Mechanics
   37) hypoelastic.znn   - an isotropic hypoelastic constitutive model

To compile Bel.dll go to the <source> directory and execute:

mono <compiler>/zc.exe objects.znn log.znn dataFiles.znn textFiles.znn keys.znn queues.znn stacks.znn lists.znn trees.znn numbers.znn series.znn functions.znn arrays.znn matrices.znn linearAlgebra.znn interpolation.znn distributions.znn derivatives.znn integrals.znn rungeKutta.znn newtonRaphson.znn statistics.znn genes.znn chromosomes.znn genome.znn individuals.znn colonies.znn geneticAlg.znn units.znn scalars.znn sFunctions.znn vectors2.znn tensors2.znn quadTensors2.znn kinematics.znn kinetics.znn hypoelastic.znn /out:<bin>/Bel

EXAMPLES

The test code used to validate BEL is included in the subdirectory <bel>/test.
These examples are provided so that you can learn how to program, both in
Zonnon and with the BEL package.  I hope you find them useful.  They include:

   i)     testLog.znn
   ii)    testFiles.znn
   iii)   testNumbers.znn
   iv)    testMath.znn
   v)     testArrays.znn
   vi)    testMatrices.znn
   vii)   testLinearAlgebra.znn
   viii)  testDataStructures.znn
   ix)    testUnits.znn
   x)     testScalars.znn
   xi)    testVectors.znn
   xii)   testTensors.znn
   xiii)  testSpectralDecomp.znn
   xiv)   testQuadTensors.znn
   xv)    testInterpolation.znn
   xvi)   testDistributions.zn
   xvii)  testDerivatives.znn
   xviii) testIntegrals.znn
   xix)   testRungeKutta.znn
   xx)    testMarquardt.znn           * There is a bug in here yet
   xxi)   testGeneticAlgorithm.znn
   xxii)  testHypoelastic.znn

To compile an application that uses Bel.dll, e.g., testNumbers.znn, go to the
<test> directory that came with this distribution and execute the command line
compiler from a terminal window via

mono <compiler>/zc.exe testNumbers.znn /ref:<bin>/Bel.dll /out:<bin>/test /entry:Main

This will create the file 'test.exe' in the <bin> directory that, in this
case, tests module Bel.MF.Numbers.znn.

Mono uses a JIT (just-in-time) compiler by default to execute programs.
If you want to have Mono compile the executable down to native machine code
(ahead-of-time compiling) then cd to the <bin> directory and execute

mono -O=all --aot test.exe                   % still uses the Mono JIT compiler
or
mono -O=all --aot --full-aot test.exe        % can run without the JIT compiler

If you do decide to compile down to native code, then the executable will only
run on computers with the same architecture as yours - you loose portability.
Now, run the program by executing the command from within the <bin> directory

mono test.exe

The output will stream into your terminal window.

NOTICE:  You will need to place a copy the Zonnon runtime library Zonnon.RTL.dll
in your <bin> directory in order for the program to execute.


HISTORY OF CHANGES

Jan 2010 - The Runge-Kutta integrator was reworked to introduce Richardson
           extrapolation per John Butcher's suggestion.

Version 1.2 released.
Jan 2010 - Reworked the hypoelastic constitutive model.
Dec 2009 - Genetic algorithm fitness function changed to R^2 statistic, etc.
           Confidence regions added to the genetic algorithm's capability.
           Added method ToString to type Bel.PF.Scalars.Scalar.
Nov 2009 - Created BelExtra in an effort to pair down the number of files in
           Bel.  Moved out of Bel were the more sophisticated material models.
Oct 2009 - Incorporated Nina's changes into Bel.MF.Arrays, Bel.MF.Matrices,
           Bel.PF.Vectors2, Bel.PF.Tensors2 and Bel.PF.QuadTensors2 taking
           advantage of the new math extensions added to the Zonnon language.
Sep 2009 - Revised definition for computing the residuals in the statistics
           module for the GA.  Rewrote the hypoelastic modules to reflect a
           change in its structure suggested by a reviewer of my paper.
Aug 2009 - Corrected an error in the traction-to-stress mapping in Kinetics.
           Revised the genetic algorithm according to Goldberg's 2nd book.
Jul 2009 - Corrected a couple of errors in the hypoelastic formulation and
           added an discussion about hypoelasticity to the users manual.
           Created a test case for hypoelasticity with the genetic algorithm.
Jun 2009 - Prof. Blake Johnson at SVSU finished the art work for the BEL icon.
           Wrote modules for isotropic, anisotropic and composite, isochoric,
           hypoelastic, constitutive equations for tissue mechanics modeling,
           and added module Physical2 as a bottleneck for constitutive models.
May 2009 - The major rewrite of the core, that became vs 1.2, was completed.
           Added the genetic algorithm suite of modules to the distribution.
           Wrote the first documentation for the library.
Apr 2009 - A major rewrite of the library was begun.  Many changes were made.
           The purpose was to unify the various DLLs into a single DLL because
           of some meta programming issues that arise when using multiple DLLs
           using the current state of the compiler.  Roman Mitin is aware of
           these issues, and they will be fixed in a future compiler release.

Version 1.1 - an internal release only.
Mar 2009 - Unified the interpolation algorithms into a single procedure call
           in Math.Interpolations.
Feb 2009 - Changed licensing from GNU General Public License to the GNU Lesser
           General Public License, the latter being designed for libraries.
           Cleaned up some modules due to an improvement in the compiler that
           checks for declared but unused variables.  Added 'Bel' prefix to all
           module and dll names to avoid potential name conflicts.  Removed
           material models from CCM; it was felt that CCM should pertain to
           just the general linear algebra parts of continuum tensor analysis.
           Added Eigenvalues, Eigenvectors and SpectralDecomposition procedures
           to CCM Tensors2 module.
Dec 2008 - Rewrote Math.Derivatives and Math.Integrals to allow for both fixed
           step-size algorithms, and ones that internally adjust the step size
           and use Richardson extrapolation to achieve a predefined level of
           precision, i.e., course (roughly 8 significant figures), medium
           (roughly 11 significant figures) and fine (roughly 14 significant
           figures).
Nov 2008 - Fixed bug and introduced enumerated type in Math.Distributions.znn
           Restructured the error codes in Core.Log so that it would be easier
           for a user/programmer to locate an error message or add a new one.
           This required all other files to have their log calls remapped.
           Extracted NewtonRaphson from Optimization.Static and moved it to
           Math.NewtonRaphson, allowing the Opt library to be removed
Oct 2008 - fixed a bug in the Core.Math.ArcTan2 function
           Change type conversion procedures from private to public in module
           Core.Numbers.  This was done so that the definitions of overloaded
           operators in other modules could be rewritten in terms of proper
           procedure calls only, i.e., free from other overloaded operators.
           This avoids nesting of overloaded operators, and should improve on
           overall efficiency.  This forced changes in modules: Core.Arrays,
           Core.Matrices, Ccm.Units, Ccm.Scalars, Ccm.Vectors, Ccm.Tensors and
           Ccm.QuadTensors.
           Renamed modules biVectors.znn -> vectors.znn, biTensors.znn ->
           tensors.znn and biQuadTensors.znn -> quadTensors.znn in CCM.
           CCM is now considered to be just for membrane analysis.
           Added modules kinematics.znn, hypoelastic.znn, displacementBVP.znn
           and tractionBVP.znn to the CCM library.
Sep 2008 - Added some new error codes to Core.Log.
           Overloaded arithmetic '+' and '-' and boolean '=', '#', '>', '>=',
           '<', and '<=' operators for Ccm.Scalars.Scalar introduced to handle
           operations between dimensionless scalars and the core number types.
           Allow negative tolerance in Static and Dynamic optimizers to handle
           case where statistics of fit can be got without updating parameters.
           Bug fixes in the Static and Dynamic optimizers.

Version 1.0 released.
Aug 2008 - Two additional libraries have been added: Ccm.dll and Opt.dll. These
           are more on the application side.
May 2008 - The first three BEL libraries were added: Core.dll, Data.dll and
           Math.dll.  These were ports from the Oberon package CAPO.