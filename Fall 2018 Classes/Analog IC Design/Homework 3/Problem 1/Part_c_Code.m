%Problem 1 part c
%After running the code once, comment out lines 5 & 6 for faster compiling.

clc;
% load nmos.mat;
% load pmos.mat;

Vdd = 1.8;
R_L = 3.5E3;
R_i = 50E3;
C_B = 1;
Adc = 5;
P = 480E-6;
L_018 = 1; %(Index 1 for L = 0.18um)

%Part (i)
gm = Adc / R_L;
fprintf('(i) gm = %f S\n', gm);

%Part (ii)
I_D = P / (2*Vdd);
gm_ID = gm / I_D;
fprintf('(ii) g_m/I_D = %f 1/V\n', gm_ID);

%Part (iii)
Vds = I_D * R_L;
figure(1);
plot(gm_id_nch(1,:,19,1), str2double(nch.id(1,:,19,1))/0.18E-6);
title('J_D vs g_m/I_D');
xlabel('g_m/I_D (v^-^1)'); ylabel('J_D (A/m)'); 
J_D = interp1(gm_id_nch(1,:,19,1), str2double(nch.id(1,:,19,1))/0.18E-6, gm_ID);
W = I_D / J_D;
fprintf('(iii) W = %d m\n', W);
% 
% %Part (iv)
% figure(2);
% plot(gm_id_nch_1, ft_018_nch);
% title('f_T vs g_m/I_D');
% xlabel('g_m/I_D (v^-^1)'); ylabel('f_T (Hz)'); 
% f_T = interp1(gm_id_nch_1, ft_018_nch, 10.71);
% fprintf('(iii) f_T = %d m\n', f_T);
% 
% 
