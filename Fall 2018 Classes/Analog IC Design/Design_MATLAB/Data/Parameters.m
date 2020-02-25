%Code to invoke important parameters.
%After running the code once, comment out line 6 for faster compiling.
%All parameters are invoked with the following format: var(Vsb,Vgs,Vds,L)

clc;
load nmos.mat; load pmos.mat;

nch1.id = str2double(nch.id);
nch1.gm = str2double(nch.gm);
nch1.gmb = str2double(nch.gmb);
nch1.gds = str2double(nch.gds);
nch1.vth = str2double(nch.vth);
nch1.cgg = str2double(nch.cgg);
nch1.cgs = str2double(nch.cgs);
nch1.cgb = str2double(nch.cgb);
nch1.cgd = str2double(nch.cgd);
nch1.cdd = str2double(nch.cdd);
nch1.css = str2double(nch.css);
nch1.cjd = str2double(nch.cjd);
nch1.cjs = str2double(nch.cjs);
fprintf('Done nch\n');

pch1.id = str2double(pch.id);
pch1.gm = str2double(pch.gm);
pch1.gmb = str2double(pch.gmb);
pch1.gds = str2double(pch.gds);
pch1.vth = str2double(pch.vth);
pch1.cgg = str2double(pch.cgg);
pch1.cgs = str2double(pch.cgs);
pch1.cgb = str2double(pch.cgb);
pch1.cgd = str2double(pch.cgd);
pch1.cdd = str2double(pch.cdd);
pch1.css = str2double(pch.css);
pch1.cjd = str2double(pch.cjd);
pch1.cjs = str2double(pch.cjs);
fprintf('Done pch\n');


%gm/id for NMOS and PMOS
gm_id_nch = squeeze(nch1.gm./nch1.id);
gm_id_pch = squeeze(pch1.gm./pch1.id);
fprintf('Done 1\n');

%Cgd/Cgg for NMOS and PMOS
cgd_cgg_nch = squeeze(nch1.cgd./nch1.cgg);
cgd_cgg_pch = squeeze(pch1.cgd./pch1.cgg);
fprintf('Done 2\n');

%Cgb/Cgg for NMOS and PMOS
cgb_cgg_nch = squeeze(nch1.cgb./nch1.cgg);
cgb_cgg_pch = squeeze(pch1.cgb./pch1.cgg);
fprintf('Done 3\n');

%fT for NMOS and PMOS
f_T_nch = squeeze(nch1.gm./nch1.cgg/(2*pi));
f_T_pch = squeeze(pch1.gm./pch1.cgg/(2*pi));
fprintf('Done 4\n');

%gm/gds for NMOS and PMOS
gm_gds_nch = squeeze(nch1.gm./nch1.gds);
gm_gds_pch = squeeze(pch1.gm./pch1.gds);
fprintf('Done 5\n');

%gmb/gm for NMOS and PMOS
gmb_gm_nch = squeeze(nch1.gmb./nch1.gm);
gmb_gm_pch = squeeze(pch1.gmb./pch1.gm);
fprintf('Done 6\n');