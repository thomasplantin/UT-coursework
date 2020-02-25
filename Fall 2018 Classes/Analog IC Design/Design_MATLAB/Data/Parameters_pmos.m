%Code to invoke important parameters.
%After running the code once, comment out line 6 for faster compiling.
%All parameters are invoked with the following format: var(Vsb,Vgs,Vds,L)

clc;
load pmos.mat;

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


%gm/id
pch1.gm_id = squeeze(pch1.gm./pch1.id);
fprintf('Done 1\n');

%Cgd/Cgg
pch1.cgd_cgg = squeeze(pch1.cgd./pch1.cgg);
fprintf('Done 2\n');

%Cgb/Cgg
pch1.cgb_cgg = squeeze(pch1.cgb./pch1.cgg);
fprintf('Done 3\n');

%ft
pch1.ft = squeeze(pch1.gm./pch1.cgg/(2*pi));
fprintf('Done 4\n');

%gm/gds
pch1.gm_gds = squeeze(pch1.gm./pch1.gds);
fprintf('Done 5\n');

%gmb/gm
pch1.gmb_gm = squeeze(pch1.gmb./pch1.gm);
fprintf('Done 6\n');

pch1.vgs = [0:0.025:1.8];
pch1.vds = [0:0.025:1.8];
pch1.vsb = [0:0.1:1];
pch1.L = [(0.18:0.02:0.5) (0.6:0.1:2.0)];

save ('pmos1', 'pch1');