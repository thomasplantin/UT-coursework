%Recall ==> var(L,Vgs,Vds,Vsb)

%Givens
clc;
% load 180nmos.mat; load 180pmos.mat;
Iref = 100E-6;
L = 1.2;     
gm_ID = 20;

%
vgs_o = whatisVGS(nch, 'GM_ID', 20, 'L', L);
vds_o = vgs_o;
vgs = whatisVGS(nch, 'GM_ID', 20, 'L', L, 'VDS', vds_o);
vds = vgs;

fprintf('Homework 4 - Problem 1\n');
fprintf('\n');
%-----------------------------------------------------------------------i
VoutChange = 0.1;
gm = gm_ID*Iref;
gm_gds = whatis(nch, 'GM_GDS','L', L, 'VGS', vgs, 'VDS', vds);
gds = gm / gm_gds;
ro = 1/gds;
VxChange = VoutChange/(gm*ro);

fprintf('i) Corresponding swing at node X --> VxSwing = %d V\n', VxChange);
fprintf('\n');

%-----------------------------------------------------------------------ii
JD = whatis(nch, 'ID_W','L', L, 'VGS', vgs, 'VDS', vds);
W = Iref/JD;

vbias = vds + whatisVGS(nch, 'GM_ID', 20, 'L', L, 'VDS', vds);

fprintf('ii) Width of the devices --> W = %d m\n', W);
fprintf('    Vbias for the circuit --> Vbias = %d V\n', vbias);
fprintf('\n');

%-----------------------------------------------------------------------iii
vout = [0:0.025:1.8];
gds3 = gm ./ whatis(nch, 'GM_GDS','L', L, 'VGS', vgs, 'VDS', vout/2);
ro3 = 1./gds3;

gm3 = gm;
gmb3 = gm3 / whatis(nch,'GM_GMB' , 'GM_ID', gm_ID, 'VDS', vds,'L', L);
r_mirror = ro3.*(1+(gm3+gmb3).*ro3)+ro3;


figure(1);
plot(vout, ro3, '-k', vout, r_mirror, '-r');
legend('Rout of M3', 'Rout of current mirror');
xlabel('Vout (V)'); ylabel('Resistance (Ohm)');

fprintf('iii) Plots done.');
fprintf('\n');

%-----------------------------------------------------------------------iv
vov4a = whatis(nch, 'VTH','L', L, 'VGS', vgs);

vds4a = 60E-3;
vds4b = 65E-3;
vds4c = 70E-3;

JD4a = whatis(nch, 'ID_W', 'GM_ID', gm_ID , 'L', L, 'VDS', vds4a);
W4a = Iref / JD4a;
JD4b = whatis(nch, 'ID_W', 'GM_ID', gm_ID , 'L', L, 'VDS', vds4b);
W4b = Iref / JD4b;
JD4c = whatis(nch, 'ID_W', 'GM_ID', gm_ID , 'L', L, 'VDS', vds4c);
W4c = Iref / JD4c;

vout4a = 2 * vds4a;
vout4b = 2 * vds4b;
vout4c = 2 * vds4c;