clc;
% load 180nmos.mat; load 180pmos.mat;
gm_ID = 20;
L3 = 0.5;
CL = 10E-12;
Vdd = 1.8;
Vic = 1.1;
Voc = 0.9;
g = 5E-3;

fprintf('Homework 4 - Problem 2\n');
fprintf('\n');



%-------------------------------------------------------------------------a
Adc = 45;
gds3_ID = whatis(nch, 'GDS_ID', 'GM_ID', gm_ID, 'L', L3, 'VDS', Voc);
gds2_ID = gm_ID/Adc - gds3_ID;
L2 = 0.395;
gds2_IDstar = whatis(pch, 'GDS_ID', 'GM_ID', gm_ID, 'L', 0.395);           %pch
% A length of 0.2977 is needed for gds2_ID and gds2_IDstar to match.

fprintf('a) Designing for a slightly higher gain (45 instead of 40) - Length of M2 --> L2 = %d um\n', L2);
fprintf('\n');



%-------------------------------------------------------------------------b
GBW = 120E6;
gm2 = 2*pi*GBW*CL;

fprintf('b) gm2 needed to acheive a GBW of 120MHz --> gm2 = %d A/V\n', gm2);
fprintf('\n');



%-------------------------------------------------------------------------c
Vgb_c = abs(Vic - Vdd);
Vdb_c = abs(Voc - Vdd);
Vgd_c = abs(Vgb_c - Vdb_c);
Vgs_c = whatisVGS(pch, 'GM_ID', gm_ID, 'VDB', Vdb_c, 'VGB', Vgb_c, 'L', L2);%pch
Vsb_c = Vgb_c - Vgs_c;
Vds_c = abs(Vgd_c - Vgs_c);
JD2_c = whatis(pch, 'ID_W', 'GM_ID', gm_ID, 'L', L2, 'VDS', Voc, 'VSB', Vsb_c);%pch

IBIAS = gm2 / gm_ID;
W2 = IBIAS/JD2_c;
W3 = W2;
W1a = W2;
W1b = 2*W1a;

fprintf('c) IBIAS = %d A\n', IBIAS);
fprintf('   W1a = %d m\n', W1a);
fprintf('   W1b = %d m\n', W1b);
fprintf('   W2 = %d m\n', W2);
fprintf('   W3 = %d m\n', W3);
fprintf('\n');



%-------------------------------------------------------------------------d
L1 = L2;
vgs1b = Vdd - (Vds_c + Voc) - abs(whatis(pch, 'VT', 'VGS', 0.4, 'L', L1));
gds1b = 2 * IBIAS * abs(whatis(pch, 'GDS_ID', 'VGS', vgs1b, 'L', L1));
gds2 = IBIAS * gds2_ID;
gds3 = IBIAS * gds3_ID;
gmb2 = W2 * whatis(pch, 'GMB_W', 'VGS', Vgs_c, 'VDS', Vds_c, 'L', L2);
Acm = gm2 / (gds3+gds2+2/gds1b*(gds2*gds3 - (gm2+gmb2)*gds3));

CMRR = (1+(gm2+gmb2)*(2/(gds1b+gds2)))/(1+(gds2+gds3)*(2*(gm2+gmb2)/gds1b));
PSRR_plus = 1;
PSRR_minus = 0;

fprintf('d) Acm = %d\n', Acm);
fprintf('   CMRR = %d\n', CMRR);