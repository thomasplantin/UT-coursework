%Code to plot the data of problem 1.
%After running the code once, comment out line 5 for faster compiling.

clc;
% load nmos.mat; load pmos.mat;

%---------------------------------------------Data#1-------------------------------------------
%NMOS
cgd_cgg_nch_1 = squeeze(abs(str2double(nch.cgd(1,:,37,1))./str2double(nch.cgg(1,:,37,1))));
cgb_cgg_nch_1 = squeeze(abs(str2double(nch.cgb(1,:,37,1))./str2double(nch.cgg(1,:,37,1))));
gm_id_nch_1 = squeeze(str2double(nch.gm(1,:,37,1))./str2double(nch.id(1,:,37,1)));

%PMOS
cgd_cgg_pch_1 = squeeze(abs(str2double(pch.cgd(1,:,37,1))./str2double(pch.cgg(1,:,37,1))));
cgb_cgg_pch_1 = squeeze(abs(str2double(pch.cgb(1,:,37,1))./str2double(pch.cgg(1,:,37,1))));
gm_id_pch_1 = squeeze(str2double(pch.gm(1,:,37,1))./str2double(pch.id(1,:,37,1)));
%----------------------------------------------------------------------------------------------


%---------------------------------------------Data#2-------------------------------------------
%NMOS
cgd_cgg_nch_2 = squeeze(abs(str2double(nch.cgd(1,:,55,1))./str2double(nch.cgg(1,:,55,1))));
cgb_cgg_nch_2 = squeeze(abs(str2double(nch.cgb(1,:,55,1))./str2double(nch.cgg(1,:,55,1))));
gm_id_nch_2 = squeeze(str2double(nch.gm(1,:,55,1))./str2double(nch.id(1,:,55,1)));

%PMOS
cgd_cgg_pch_2 = squeeze(abs(str2double(pch.cgd(1,:,55,1))./str2double(pch.cgg(1,:,55,1))));
cgb_cgg_pch_2 = squeeze(abs(str2double(pch.cgb(1,:,55,1))./str2double(pch.cgg(1,:,55,1))));
gm_id_pch_2 = squeeze(str2double(pch.gm(1,:,55,1))./str2double(pch.id(1,:,55,1)));
%----------------------------------------------------------------------------------------------


%---------------------------------------------Data#3-------------------------------------------
W = 100E-9;
%NMOS
ft_018_nch = squeeze(abs(str2double(nch.gm(1,:,19,1))./str2double(nch.cgs(1,:,19,1))));
ft_032_nch = squeeze(abs(str2double(nch.gm(1,:,19,8))./str2double(nch.cgs(1,:,19,8))));
ft_048_nch = squeeze(abs(str2double(nch.gm(1,:,19,16))./str2double(nch.cgs(1,:,19,16))));
ft_120_nch = squeeze(abs(str2double(nch.gm(1,:,19,24))./str2double(nch.cgs(1,:,19,24))));
ft_200_nch = squeeze(abs(str2double(nch.gm(1,:,19,32))./str2double(nch.cgs(1,:,19,32))));

j_018_nch = squeeze(str2double(nch.id(1,:,19,1))/W);
j_032_nch = squeeze(str2double(nch.id(1,:,19,8))/W);
j_048_nch = squeeze(str2double(nch.id(1,:,19,16))/W);
j_120_nch = squeeze(str2double(nch.id(1,:,19,24))/W);
j_200_nch = squeeze(str2double(nch.id(1,:,19,32))/W);

%PMOS
ft_018_pch = squeeze(abs(str2double(nch.gm(1,:,19,1))./str2double(nch.cgs(1,:,19,1))));
ft_032_pch = squeeze(abs(str2double(nch.gm(1,:,19,8))./str2double(nch.cgs(1,:,19,8))));
ft_048_pch = squeeze(abs(str2double(nch.gm(1,:,19,16))./str2double(nch.cgs(1,:,19,16))));
ft_120_pch = squeeze(abs(str2double(nch.gm(1,:,19,24))./str2double(nch.cgs(1,:,19,24))));
ft_200_pch = squeeze(abs(str2double(nch.gm(1,:,19,32))./str2double(nch.cgs(1,:,19,32))));

j_018_pch = squeeze(abs(str2double(pch.id(1,:,19,1))/W));
j_032_pch = squeeze(abs(str2double(pch.id(1,:,19,8))/W));
j_048_pch = squeeze(abs(str2double(pch.id(1,:,19,16))/W));
j_120_pch = squeeze(abs(str2double(pch.id(1,:,19,24))/W));
j_200_pch = squeeze(abs(str2double(pch.id(1,:,19,32))/W));
%----------------------------------------------------------------------------------------------


%---------------------------------------------Data#4-------------------------------------------
%NMOS
gm_gds_018_nch = squeeze(str2double(nch.gm(1,:,55,1))./str2double(nch.gds(1,:,55,1)));
gm_gds_032_nch = squeeze(str2double(nch.gm(1,:,55,8))./str2double(nch.gds(1,:,55,8)));
gm_gds_048_nch = squeeze(str2double(nch.gm(1,:,55,16))./str2double(nch.gds(1,:,55,16)));
gm_gds_120_nch = squeeze(str2double(nch.gm(1,:,55,24))./str2double(nch.gds(1,:,55,24)));
gm_gds_200_nch = squeeze(str2double(nch.gm(1,:,55,32))./str2double(nch.gds(1,:,55,32)));

j_018_nch_4 = squeeze(str2double(nch.id(1,:,55,1))/W);
j_032_nch_4 = squeeze(str2double(nch.id(1,:,55,8))/W);
j_048_nch_4 = squeeze(str2double(nch.id(1,:,55,16))/W);
j_120_nch_4 = squeeze(str2double(nch.id(1,:,55,24))/W);
j_200_nch_4 = squeeze(str2double(nch.id(1,:,55,32))/W);

%PMOS
gm_gds_018_pch = squeeze(str2double(pch.gm(1,:,55,1))./str2double(pch.gds(1,:,55,1)));
gm_gds_032_pch = squeeze(str2double(pch.gm(1,:,55,8))./str2double(pch.gds(1,:,55,8)));
gm_gds_048_pch = squeeze(str2double(pch.gm(1,:,55,16))./str2double(pch.gds(1,:,55,16)));
gm_gds_120_pch = squeeze(str2double(pch.gm(1,:,55,24))./str2double(pch.gds(1,:,55,24)));
gm_gds_200_pch = squeeze(str2double(pch.gm(1,:,55,32))./str2double(pch.gds(1,:,55,32)));

j_018_pch_4 = squeeze(abs(str2double(pch.id(1,:,55,1))/W));
j_032_pch_4 = squeeze(abs(str2double(pch.id(1,:,55,8))/W));
j_048_pch_4 = squeeze(abs(str2double(pch.id(1,:,55,16))/W));
j_120_pch_4 = squeeze(abs(str2double(pch.id(1,:,55,24))/W));
j_200_pch_4 = squeeze(abs(str2double(pch.id(1,:,55,32))/W));
%----------------------------------------------------------------------------------------------


%---------------------------------------------Data#5-------------------------------------------
vsb = [0:0.1:1];
%NMOS
gmb_gm_018_nch = squeeze(str2double(nch.gmb(:,1,37,1))./str2double(nch.gm(:,1,37,1)));
gmb_gm_032_nch = squeeze(str2double(nch.gmb(:,1,37,8))./str2double(nch.gm(:,1,37,8)));
gmb_gm_048_nch = squeeze(str2double(nch.gmb(:,1,37,16))./str2double(nch.gm(:,1,37,16)));
gmb_gm_120_nch = squeeze(str2double(nch.gmb(:,1,37,24))./str2double(nch.gm(:,1,37,24)));
gmb_gm_200_nch = squeeze(str2double(nch.gmb(:,1,37,32))./str2double(nch.gm(:,1,37,32)));

%PMOS
gmb_gm_018_pch = squeeze(str2double(pch.gmb(:,1,37,1))./str2double(pch.gm(:,1,37,1)));
gmb_gm_032_pch = squeeze(str2double(pch.gmb(:,1,37,8))./str2double(pch.gm(:,1,37,8)));
gmb_gm_048_pch = squeeze(str2double(pch.gmb(:,1,37,16))./str2double(pch.gm(:,1,37,16)));
gmb_gm_120_pch = squeeze(str2double(pch.gmb(:,1,37,24))./str2double(pch.gm(:,1,37,24)));
gmb_gm_200_pch = squeeze(str2double(pch.gmb(:,1,37,32))./str2double(pch.gm(:,1,37,32)));
%----------------------------------------------------------------------------------------------










%---------------------------------------------Plot#1-------------------------------------------
%NMOS
figure(1);
plot(gm_id_nch_1, cgd_cgg_nch_1,'-k', gm_id_nch_1, cgb_cgg_nch_1, '--k');
title('NMOS, C_g_d/C_g_g & C_g_b/C_g_g vs G_m/I_D (V_S_B = 0, V_D_S = V_D_D/2, L = 0.18um)');
legend('C_g_d/C_g_g','C_g_b/C_g_g','Location', 'southeast');
xlabel('G_m/I_D (V^-^1)');
grid on;
grid minor;

%PMOS
figure(2);
plot(gm_id_pch_1, cgd_cgg_pch_1,'-k', gm_id_pch_1, cgb_cgg_pch_1, '--k');
title('PMOS, C_g_d/C_g_g & C_g_b/C_g_g vs G_m/I_D (V_S_B = 0, V_D_S = V_D_D/2, L = 0.18um)');
legend('C_g_d/C_g_g','C_g_b/C_g_g','Location', 'northeast');
xlabel('G_m/I_D (V^-^1)');
grid on;
grid minor;
%----------------------------------------------------------------------------------------------


%---------------------------------------------Plot#2-------------------------------------------
%NMOS
figure(3);
plot(gm_id_nch_2, cgd_cgg_nch_2,'-k', gm_id_nch_2, cgb_cgg_nch_2, '--k');
title('NMOS, C_g_d/C_g_g & C_g_b/C_g_g vs G_m/I_D (V_S_B = 0, V_D_S = 3V_D_D/4, L = 0.18um)');
legend('C_g_d/C_g_g','C_g_b/C_g_g','Location', 'southeast');
xlabel('G_m/I_D (V^-^1)');
grid on;
grid minor;

%PMOS
figure(4);
plot(gm_id_pch_2, cgd_cgg_pch_2,'-k', gm_id_pch_2, cgb_cgg_pch_2, '--k');
title('PMOS, C_g_d/C_g_g & C_g_b/C_g_g vs G_m/I_D (V_S_B = 0, V_D_S = 3V_D_D/4, L = 0.18um)');
legend('C_g_d/C_g_g','C_g_b/C_g_g','Location', 'northeast');
xlabel('G_m/I_D (V^-^1)');
grid on;
grid minor;
%----------------------------------------------------------------------------------------------


%---------------------------------------------Plot#3-------------------------------------------
figure(5);
plot(j_018_nch, ft_018_nch,'k', j_032_nch, ft_032_nch,'+k', j_048_nch, ft_048_nch,'--k', j_120_nch, ft_120_nch,'-.k', j_200_nch, ft_200_nch,':k');
title('NMOS, f_T vs J_D for various channel lengths (V_S_B = 0, V_D_S = V_D_D/4)');
legend('L = 0.18um','L = 0.32um','L = 0.48um','L = 1.2um','L = 2.0um','Location', 'northeast');
xlabel('A/m'); ylabel('f_T (Hz)');
grid on;
grid minor;

figure(6);
plot(j_018_pch, ft_018_pch,'k', j_032_pch, ft_032_pch,'+k', j_048_pch, ft_048_pch,'--k', j_120_pch, ft_120_pch,'-.k', j_200_pch, ft_200_pch,':k');
title('PMOS, f_T vs J_D for various channel lengths (V_S_B = 0, V_D_S = V_D_D/4)');
legend('L = 0.18um','L = 0.32um','L = 0.48um','L = 1.2um','L = 2.0um','Location', 'southeast');
xlabel('A/m'); ylabel('f_T (Hz)');
grid on;
grid minor;
%----------------------------------------------------------------------------------------------


%---------------------------------------------Plot#4-------------------------------------------
figure(7);
plot(j_018_nch_4, gm_gds_018_nch,'k', j_032_nch_4, gm_gds_032_nch,'+k', j_048_nch_4, gm_gds_048_nch,'--k', j_120_nch_4, gm_gds_120_nch,'-.k', j_200_nch_4, gm_gds_200_nch,':k');
title('NMOS, g_m/g_d_s vs J_D for various channel lengths (V_S_B = 0, V_D_S = 3V_D_D/4)');
legend('L = 0.18um','L = 0.32um','L = 0.48um','L = 1.2um','L = 2.0um','Location', 'northeast');
xlabel('A/m'); ylabel('g_m/g_d_s (-)');
grid on;
grid minor;

figure(8);
plot(j_018_pch_4, gm_gds_018_pch,'k', j_032_pch_4, gm_gds_032_pch,'+k', j_048_pch_4, gm_gds_048_pch,'--k', j_120_pch_4, gm_gds_120_pch,'-.k', j_200_pch_4, gm_gds_200_pch,':k');
title('PMOS, g_m/g_d_s vs J_D for various channel lengths (V_S_B = 0, V_D_S = 3V_D_D/4)');
legend('L = 0.18um','L = 0.32um','L = 0.48um','L = 1.2um','L = 2.0um','Location', 'northeast');
xlabel('A/m'); ylabel('g_m/g_d_s (-)');
grid on;
grid minor;
%----------------------------------------------------------------------------------------------


%---------------------------------------------Plot#5-------------------------------------------
figure(9);
plot(vsb, gmb_gm_018_nch,'k', vsb, gmb_gm_032_nch,'+k', vsb, gmb_gm_048_nch,'--k', vsb, gmb_gm_120_nch,'-.k', vsb, gmb_gm_200_nch,':k');
title('NMOS, g_m_b/g_m vs V_S_B for various channel lengths (gm/I_D = 5, V_D_S = V_D_D/2)');
legend('L = 0.18um','L = 0.32um','L = 0.48um','L = 1.2um','L = 2.0um','Location', 'northeast');
xlabel('V_S_B (V)'); ylabel('g_m_b/g_m (-)');
grid on;
grid minor;

figure(10);
plot(vsb, gmb_gm_018_pch,'k', vsb, gmb_gm_032_pch,'+k', vsb, gmb_gm_048_pch,'--k', vsb, gmb_gm_120_pch,'-.k', vsb, gmb_gm_200_pch,':k');
title('PMOS, g_m_b/g_m vs V_S_B for various channel lengths (gm/I_D = 5, V_D_S = V_D_D/2)');
legend('L = 0.18um','L = 0.32um','L = 0.48um','L = 1.2um','L = 2.0um','Location', 'northeast');
xlabel('V_S_B (V)'); ylabel('g_m_b/g_m (-)');
grid on;
grid minor;
%----------------------------------------------------------------------------------------------