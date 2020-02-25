%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script computes the necessary BIAS voltages for the OTA to function
% properly.
%
% MAKE SURE TO RUN basic_spec_calculations.m before running this script!!!
% 
% Analog IC Design --- EE 382M-14
% Written by Thomas Plantin
% Wednesday November 28th, 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%Vds
VDS_1 = (Vdd - VGS_2 - 2/gm_ID_real_1)/2;
VDS_11 = VGS_2/2;
VDS_2 = Vdd/2;
VDS_22 = Vdd/2;

%Vgs was defined basic_spec_calculations.m

%Bias voltages
VB1 = Vdd - VGS_11;
VB2 = Vdd - VDS_11 - VGS_11;
VB3 = Vdd - 2*VDS_11 - VDS_1 + VGS_1;
VB4 = Vdd - 2*VDS_11 - 2*VDS_1 + VGS_1;
VB5 = VGS_22;


%------------------------------PRINTINGS----------------------------------%
fprintf('BIAS Voltages --> VB1 = %d V \n', VB1);
fprintf('              --> VB2 = %d V \n', VB2);
fprintf('              --> VB3 = %d V \n', VB3);
fprintf('              --> VB4 = %d V \n', VB4);
fprintf('              --> VB5 = %d V \n', VB5);
%-------------------------------------------------------------------------%