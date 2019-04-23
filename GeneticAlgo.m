% lab 4 Genetic Algos
% we want to minimise the function of the sum of squares
% the Phen1 array stores 50x10 rows,cols of "weights", can we find the
% function that minimises the weights
Nind = 50; %Number of individuals in the population
Nvar = 10; %Number of decision variables
Lind = 10; %Length of individual variables
XOV = 0.7; %Crossover rate set equal to 0.7
MUTR = 0.05; %Set mutation rate
GGAP = 0.95; 
Maxgen = 1000;

FieldD = [Lind Lind Lind Lind Lind Lind Lind Lind Lind Lind; 
    0 0 0 0 0 0 0 0 0 0; 100 100 100 100 100 100 100 100 100 100; 1 1 1 1 1 1 1 1 1 1; 
    0 0 0 0 0 0 0 0 0 0; 
    1 1 1 1 1 1 1 1 1 1; 
    1 1 1 1 1 1 1 1 1 1];
Chrom = crtbp(Nind, Lind*Nvar);
Phen1 = bs2rv(Chrom, FieldD);
Gen = 0;
ObjV = objfuntest(bs2rv(Chrom, FieldD));
ObjV
while Gen < Maxgen
    FitnV = ranking(ObjV);
    SelCh = select("sus", Chrom, FitnV, GGAP);
    SelCh = recombin("xovsp", SelCh, XOV);
    SelCh = mut(SelCh);
    ObjVSel = -objfuntest(bs2rv(SelCh, FieldD));
    [Chrom ObjV] = reins(Chrom, SelCh, 1, 1, ObjV, ObjVSel);
    Gen = Gen+1;
end
Phen = bs2rv(Chrom, FieldD);
open Phen
% this contains the old values
open Phen1