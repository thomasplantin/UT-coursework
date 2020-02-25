%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script iterates through possible combinations of x2 and beta to find 
% the optimal operating point that consumes the least total current.
% 
% Analog IC Design --- EE 382M-14
% Written by Thomas Plantin
% Tuesday November 27th, 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
load 180nmos.mat; load 180pmos.mat;


pch.ID = abs(pch.ID);

beta_sweep = 0.9:0.01:0.99;
x2_sweep = 2.2:0.2:4;

for i = 1:length(beta_sweep)
    parfor j = 1:length(x2_sweep)     %parallel for loop
        [IDtot(i,j), validity(i,j), lengths{i,j}, widths{i,j}] = beta_x2_function(nch, pch, beta_sweep(i), x2_sweep(j));
    end
end
surf(x2_sweep, beta_sweep, IDtot); 
title('Surface plot of x_2 vs betaCoeff vs Total current (I_D_T_O_T)');
xlabel('x_2'); ylabel('betaCoeff'); zlabel('I_D_T_O_T');