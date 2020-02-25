%This script reads and plots data from a .CSV file.

clc;
clear;

%Open data file
f_8_1 = fopen('Page_8_1_loop_gain_PM.csv');
f_8_2 = fopen('Page_8_2_closed_loop_gain.csv');
f_9_1 = fopen('Page_9_1_input_swing.csv');
f_9_2 = fopen('Page_9_2_output_swing.csv');
f_10 = fopen('Page_10_settling.csv');
f_11 = fopen('Page_11_Noise.csv');
f_12_1 = fopen('Page_12_1_CMRR.csv');
f_12_2 = fopen('Page_12_2_PSRRm.csv');
f_12_3 = fopen('Page_12_3_PSRRp.csv');
f_13_0 = fopen('Page_13_0deg.csv');
f_13_1 = fopen('Page_13_110deg.csv');


format_4 = '%f';
for i = 1:3
    format_4 = [format_4, '%f'];
end

format_2 = '%f';
for i = 1:1
    format_2 = [format_2, '%f'];
end

%Read data in from .CSV file
read_8_1 = textscan(f_8_1, format_4, 'Headerlines',1,'Delimiter',',');
read_8_2 = textscan(f_8_2, format_4, 'Headerlines',1,'Delimiter',',');
read_9_1 = textscan(f_9_1, format_2, 'Headerlines',1,'Delimiter',',');
read_9_2 = textscan(f_9_2, format_2, 'Headerlines',1,'Delimiter',',');
read_10 = textscan(f_10, format_2, 'Headerlines',1,'Delimiter',',');
read_11 = textscan(f_11, format_2, 'Headerlines',1,'Delimiter',',');
read_12_1 = textscan(f_12_1, format_2, 'Headerlines',1,'Delimiter',',');
read_12_2 = textscan(f_12_2, format_2, 'Headerlines',1,'Delimiter',',');
read_12_3 = textscan(f_12_3, format_2, 'Headerlines',1,'Delimiter',',');
read_13_0 = textscan(f_13_0, format_2, 'Headerlines',1,'Delimiter',',');
read_13_1 = textscan(f_13_1, format_2, 'Headerlines',1,'Delimiter',',');
%If more columns (yData), add a %f

outMag_8_1_X = read_8_1{1,1}(:,1);
outMag_8_1_Y = read_8_1{1,2}(:,1);
outPh_8_1_X = read_8_1{1,3}(:,1);
outPh_8_1_Y = read_8_1{1,4}(:,1);

outPh_8_2_X = read_8_2{1,1}(:,1);
outPh_8_2_Y = read_8_2{1,2}(:,1);
outMag_8_2_X = read_8_2{1,3}(:,1);
outMag_8_2_Y = read_8_2{1,4}(:,1);

Vin_9_1_X = read_9_1{1,1}(:,1);
Vin_9_1_Y = read_9_1{1,2}(:,1);

Vin_9_2_X = read_9_2{1,1}(:,1);
Vin_9_2_Y = read_9_2{1,2}(:,1);

trans_10_X = read_10{1,1}(:,1);
trans_10_Y = read_10{1,2}(:,1);

noise_11_X = read_11{1,1}(:,1);
noise_11_Y = read_11{1,2}(:,1);

cmrr_12_1_X = read_12_1{1,1}(:,1);
cmrr_12_1_Y = read_12_1{1,2}(:,1);

psrrp_12_2_X = read_12_2{1,1}(:,1);
psrrp_12_2_Y = read_12_2{1,2}(:,1);

psrrm_12_3_X = read_12_3{1,1}(:,1);
psrrm_12_3_Y = read_12_3{1,2}(:,1);

cold_13_0_X = read_13_0{1,1}(:,1);
cold_13_0_Y = read_13_0{1,2}(:,1);

hot_13_1_X = read_13_1{1,1}(:,1);
hot_13_1_Y = read_13_1{1,2}(:,1);

%Open-loop
figure(1)
yyaxis left
semilogx(outMag_8_1_X, outMag_8_1_Y,'LineWidth',2);
hold on
plot(outMag_8_1_X(10),outMag_8_1_Y(10),'ro');
plot(outMag_8_1_X(222),outMag_8_1_Y(222),'r*');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
yyaxis right
semilogx(outPh_8_1_X, outPh_8_1_Y,'LineWidth',2);
plot(outPh_8_1_X(222),outPh_8_1_Y(222),'r+');
ylabel('Phase (deg)');
grid on;
grid minor;
hold off
legend('Magnitude','Low Frequency Loop Gain = 68.92 dB', 'Loop Unity-Gain Frequency = 27.1 MHz', 'Phase','Phase Margin = 67.79 deg','Location','northeast');
title('Magnitude and Phase plot of the Loop Gain T(jw)');
% 
% %Closed-loop
% figure(2)
% yyaxis left
% semilogx(outMag_8_2_X, outMag_8_2_Y,'LineWidth',2);
% hold on
% xlabel('Frequency (Hz)');
% ylabel('Magnitude (dB)');
% yyaxis right
% semilogx(outPh_8_2_X, outPh_8_2_Y,'LineWidth',2);
% ylabel('Phase (deg)');
% grid on;
% grid minor;
% hold off
% legend('Magnitude','Phase','Location','northeast');
% title('Magnitude and Phase plot of the Closed-Loop Frequency Response');


% %Vin Swing
% figure(3)
% plot(Vin_9_1_X, Vin_9_1_Y,'LineWidth',2);
% hold on
% plot(Vin_9_1_X(22), Vin_9_1_Y(22),'r*');
% xlabel('Input Voltage (V)');
% ylabel('Magnitude (dB)');
% grid on;
% grid minor;
% hold off
% legend('Open-Loop Gain (dB)','Gain drop of 30% from maximum = 1.05 V','Location','south');
% title('Input Voltage Range Simulation');
% 
% %Vout Swing
% figure(4)
% plot(Vin_9_2_X, Vin_9_2_Y,'LineWidth',2);
% hold on
% plot(Vin_9_2_X(42), Vin_9_2_Y(42),'r*');
% plot(Vin_9_2_X(58), Vin_9_2_Y(58),'r*');
% xlabel('Output Swing (V)');
% ylabel('Magnitude (V/V)');
% grid on;
% grid minor;
% hold off
% legend('Open-Loop Gain (V/V)','Gain drop of 30% from maximum = 2.63 V','Location','south');
% title('Output Voltage Range Simulation');



% %Transient + Zoom
% figure(6)
% plot(trans_10_X, trans_10_Y,'LineWidth',2);
% hold on
% plot(trans_10_X(4305), trans_10_Y(4305),'r*');
% plot(trans_10_X(7603), trans_10_Y(7603),'ro');
% plot(trans_10_X(9900), trans_10_Y(9900),'r^');
% xlabel('Time (s)');
% ylabel('Output Voltage (V)');
% grid on;
% grid minor;
% hold off
% legend('Output Voltage (V)','Settling Time = 32.9733 ns', 'Dynamic Error = 0.0017%','Final Settling point = 199.9 mV', 'Location','northeast');
% title('Settling Time Simulation (Zoomed in)');
% 
% %Noise
% figure(7)
% semilogx(noise_11_X, noise_11_Y,'LineWidth',2);
% hold on
% xlabel('Frequency (Hz)');
% ylabel('Total Input-Referred Noise (V)');
% grid on;
% grid minor;
% hold off
% legend('Total Input-Referred Noise (V)', 'Location','northeast');
% title('Total Input-Referred Noise Spectral Density');


% %CMRR
% figure(8)
% semilogx(cmrr_12_1_X, cmrr_12_1_Y,'LineWidth',2);
% hold on
% xlabel('Frequency (Hz)');
% ylabel('CMRR');
% grid on;
% grid minor;
% hold off
% legend('CMRR', 'Location','northeast');
% title('CMRR of the Circuit');

% %PSRR+ & PSRR-
% figure(9)
% yyaxis left
% semilogx(psrrp_12_2_X, psrrp_12_2_Y,'LineWidth',2);
% hold on
% xlabel('Frequency (Hz)');
% ylabel('PSRR+');
% yyaxis right
% semilogx(psrrm_12_3_X, psrrm_12_3_Y,'LineWidth',2);
% ylabel('PSRR-');
% grid on;
% grid minor;
% hold off
% legend('PSRR+','PSRR-','Location','northeast');
% title('PSRR+ and PSRR- of the OTA');

% %Two Corners
% figure(10)
% semilogx(cold_13_0_X, cold_13_0_Y,'LineWidth',2);
% hold on
% xlabel('Frequency (Hz)');
% ylabel('Magnitude (dB)');
% semilogx(hot_13_1_X, hot_13_1_Y,'LineWidth',2);
% grid on;
% grid minor;
% hold off
% legend('Fast Corner (T = 0 degC, V_D_D = 1.98 V','Slow Corner (T = 110 degC, V_D_D = 1.62 V','Location','northeast');
% title('Loop Gain Magnitude T(jw) across the Two Corners');