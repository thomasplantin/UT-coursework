%Code to invoke important nmos parameters.
%After running the code once, comment out line 6 for faster compiling.
%All parameters are invoked with the following format: var(Vsb,Vgs,Vds,L)

clc;
load nmos.mat;

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

%gm/id
nch1.gm_id = squeeze(nch1.gm./nch1.id);
fprintf('Done 1\n');

%Cgd/Cgg
nch1.cgd_cgg = squeeze(nch1.cgd./nch1.cgg);
fprintf('Done 2\n');

%Cgb/Cgg 
nch1.cgb_cgg = squeeze(nch1.cgb./nch1.cgg);
fprintf('Done 3\n');

%fT 
nch1.ft = squeeze(nch1.gm./nch1.cgg/(2*pi));
fprintf('Done 4\n');

%gm/gds
nch1.gm_gds = squeeze(nch1.gm./nch1.gds);
fprintf('Done 5\n');

%gmb/gm
nch1.gmb_gm = squeeze(nch1.gmb./nch1.gm);
fprintf('Done 6\n');

nch1.vgs = [0:0.025:1.8];
nch1.vds = [0:0.025:1.8];
nch1.vsb = [0:0.1:1];
nch1.L = [(0.18:0.02:0.5) (0.6:0.1:2.0)];

save ('nmos1', 'nch1');