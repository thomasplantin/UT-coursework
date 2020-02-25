clc;

VDD = 2;
Adc = -4;
Id = 0.5E-3;
RL = 1E3;
Ri = 10E3;
L = 0.35E-6;
VBias = [0:0.025:1.8];
W = 0.1E-6;

gm = -Adc/RL;
VDS = VDD - Id*RL;
gm_Id = gm/Id;
figure(1);
plot(VBias,gm_id_nch(1,:,61,9));
grid minor;
grid on;

VGS = interp1(gm_id_nch(1,:,61,9),VBias,gm_Id);

JD = str2double(nch.id(1,:,61,9))/W;

figure(2);
plot(gm_id_nch(1,:,61,9), JD);
grid minor;
grid on;


Jfinal = interp1(gm_id_nch(1,:,61,9),JD,gm_Id);

Wfinal = Id/Jfinal;

figure(3);
plot(gm_id_nch(1,:,61,9),f_T_nch(1,:,61,9));
grid minor;
grid on;

disp(gm_Id);
disp(VDS);
disp(VGS);
disp(Wfinal);
disp(interp1(gm_id_nch(1,:,61,9),f_T_nch(1,:,61,9), gm_Id));


