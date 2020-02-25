%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script offers a rough attempt to find the lengths of the devices.
% 
% Analog IC Design --- EE 382M-14
% Written by Thomas Plantin
% Monday November 15th, 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
gm_ID = 15;
beta_max = 1/3;
beta = 0.75*beta_max;

Ao1 = 800;         %Ao1~(gm*ro)^2/2, so gmro = gm_gds ~ 40
L1 = 0.18; 
gmro1 = whatis(nch, 'GM_GDS', 'GM_ID', gm_ID, 'L', L1);
gmro11 = whatis(pch, 'GM_GDS', 'GM_ID', gm_ID, 'L', L1);
Ao1_star = gmro1^2*gmro11^2/(gmro1^2+gmro11^2);
fprintf('Approximate gain of 1st stage --> %d\n', Ao1_star);


Ao2 = 10;         %|Ao2|~gm*ro/2, so gmro = gm_gds ~ 20
L2 = 0.18; 
gmro2 = whatis(nch, 'GM_GDS', 'GM_ID', gm_ID, 'L', L2);
gmro22 = whatis(pch, 'GM_GDS', 'GM_ID', gm_ID, 'L', L2);
Ao2_star = gmro2*gmro22/(gmro2+gmro22);
fprintf('Approximate gain of 2nd stage --> %d\n', Ao2_star);