%Code to invoke important parameters.
%After running the code once, comment out line 6 for faster compiling.
%All parameters are invoked with the following format: var(Vsb,Vgs,Vds,L)

clc;
load nmos.mat; load pmos.mat;

%gm/id for NMOS and PMOS
gm_id_nch = squeeze(str2double(nch.gm)./str2double(nch.id));
gm_id_pch = squeeze(str2double(pch.gm)./str2double(pch.id));
fprintf('Done 1\n');

%Cgd/Cgg for NMOS and PMOS
cgd_cgg_nch = squeeze(str2double(nch.cgd)./str2double(nch.cgg));
cgd_cgg_pch = squeeze(str2double(pch.cgd)./str2double(pch.cgg));
fprintf('Done 2\n');

%Cgb/Cgg for NMOS and PMOS
cgb_cgg_nch = squeeze(str2double(nch.cgb)./str2double(nch.cgg));
cgb_cgg_pch = squeeze(str2double(pch.cgb)./str2double(pch.cgg));
fprintf('Done 3\n');

%fT for NMOS and PMOS
f_T_nch = squeeze(str2double(nch.gm)./str2double(nch.cgg));
f_T_pch = squeeze(str2double(pch.gm)./str2double(pch.cgg));
fprintf('Done 4\n');

%gm/gds for NMOS and PMOS
gm_gds_nch = squeeze(str2double(nch.gm)./str2double(nch.gds));
gm_gds_pch = squeeze(str2double(pch.gm)./str2double(pch.gds));
fprintf('Done 5\n');

%gmb/gm for NMOS and PMOS
gmb_gm_nch = squeeze(str2double(nch.gmb)./str2double(nch.gm));
gmb_gm_pch = squeeze(str2double(pch.gmb)./str2double(pch.gm));
fprintf('Done 6\n');