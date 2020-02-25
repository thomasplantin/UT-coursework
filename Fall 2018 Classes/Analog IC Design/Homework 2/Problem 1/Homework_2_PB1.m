%This script reads and plots data from a .CSV file.

clc;


%Open data file
fid = fopen('PB1_ALLDATA.csv');

format = '%f';
for i = 1:30
    format = [format, '%f'];
end

%Read data in from .CSV file
readData = textscan(fid, format, 'Headerlines',2,'Delimiter',',');
%If more columns (yData), add a %f

%NMOS data
Vov_18N = readData{1,1}(:,1);
Vov_36N = readData{1,2}(:,1);
Vov_1N = readData{1,3}(:,1);

gm_over_Id_18N = readData{1,4}(:,1);
gm_over_Id_36N = readData{1,5}(:,1);
gm_over_Id_1N = readData{1,6}(:,1);

gm_over_gds_18N = readData{1,7}(:,1);
gm_over_gds_36N = readData{1,8}(:,1);
gm_over_gds_1N = readData{1,9}(:,1);

ft_18N = readData{1,10}(:,1);
ft_36N = readData{1,11}(:,1);
ft_1N = readData{1,12}(:,1);

Id_over_W_18N = readData{1,13}(:,1);
Id_over_W_36N = readData{1,14}(:,1);
Id_over_W_1N = readData{1,15}(:,1);

%PMOS Data
Vov_18P = readData{1,16}(:,1);
Vov_36P = readData{1,17}(:,1);
Vov_1P = readData{1,18}(:,1);

gm_over_Id_18P = readData{1,19}(:,1);
gm_over_Id_36P = readData{1,20}(:,1);
gm_over_Id_1P = readData{1,21}(:,1);

gm_over_gds_18P = readData{1,22}(:,1);
gm_over_gds_36P = readData{1,23}(:,1);
gm_over_gds_1P = readData{1,24}(:,1);

ft_18P = readData{1,25}(:,1);
ft_36P = readData{1,26}(:,1);
ft_1P = readData{1,27}(:,1);

Id_over_W_18P = readData{1,28}(:,1);
Id_over_W_36P = readData{1,29}(:,1);
Id_over_W_1P = readData{1,30}(:,1);

% %Plot Data
% %gm/Id vs Vov
% figure(1)
% hold on;
% plot(Vov_18N, gm_over_Id_18N, 'k-'); 
% plot(Vov_36N, gm_over_Id_36N, 'k--');
% plot(Vov_1N, gm_over_Id_1N, 'k:');
% plot(Vov_18P, gm_over_Id_18P, 'ko');
% plot(Vov_36P, gm_over_Id_36P, 'kx');
% plot(Vov_1P, gm_over_Id_1P, 'k^');
% legend('NMOS L = 180nm','NMOS L = 360nm','NMOS L = 1um','PMOS L = 180nm','PMOS L = 360nm','PMOS L = 1um', 'Location','east','NumColumns',2);
% title('Plot of g_m/I_D vs V_O_V for different channel lengths and types');
% xlabel('V_O_V (V)');
% ylabel('g_m/I_D (S/A)');
% grid on;
% grid minor;
% 
% %gm/gds vs gm/Id
% figure(2)
% hold on;
% plot(gm_over_Id_18N, gm_over_gds_18N, 'k-');
% plot(gm_over_Id_36N, gm_over_gds_36N, 'k--');
% plot(gm_over_Id_1N, gm_over_gds_1N, 'k:');
% plot(gm_over_Id_18P, gm_over_gds_18P, 'ko');
% plot(gm_over_Id_36P, gm_over_gds_36P, 'kx');
% plot(gm_over_Id_1P, gm_over_gds_1P, 'k^');
% legend('NMOS L = 180nm','NMOS L = 360nm','NMOS L = 1um','PMOS L = 180nm','PMOS L = 360nm','PMOS L = 1um', 'Location','southeast','NumColumns',2);
% title('Plot of g_m/g_ds vs g_m/I_D for different channel lengths and types');
% xlabel('g_m/I_D (S/A)');
% ylabel('g_m/g_ds (unitless)');
% grid on;
% grid minor;
% 
% %ft vs gm/Id
% figure(3)
% hold on;
% plot(gm_over_Id_18N, ft_18N, 'k-');
% plot(gm_over_Id_36N, ft_36N, 'k--');
% plot(gm_over_Id_1N, ft_1N, 'k:');
% plot(gm_over_Id_18P, ft_18P, 'ko');
% plot(gm_over_Id_36P, ft_36P, 'kx');
% plot(gm_over_Id_1P, ft_1P, 'k^');
% legend('NMOS L = 180nm','NMOS L = 360nm','NMOS L = 1um','PMOS L = 180nm','PMOS L = 360nm','PMOS L = 1um', 'Location','northeast','NumColumns',2);
% title('Plot of f_T vs g_m/I_D for different channel lengths and types');
% xlabel('g_m/I_D (S/A)');
% ylabel('f_T (Hz)');
% grid on;
% grid minor;
% 
% %Id/W vs gm/Id
% figure(4)
% hold on;
% plot(gm_over_Id_18N, Id_over_W_18N, 'k-');
% plot(gm_over_Id_36N, Id_over_W_36N, 'k--');
% plot(gm_over_Id_1N, Id_over_W_1N, 'k:');
% plot(gm_over_Id_18P, Id_over_W_18P, 'ko');
% plot(gm_over_Id_36P, Id_over_W_36P, 'kx');
% plot(gm_over_Id_1P, Id_over_W_1P, 'k^');
% legend('NMOS L = 180nm','NMOS L = 360nm','NMOS L = 1um','PMOS L = 180nm','PMOS L = 360nm','PMOS L = 1um', 'Location','northeast','NumColumns',2);
% title('Plot of I_D/W vs g_m/I_D for different channel lengths and types');
% xlabel('g_m/I_D (S/A)');
% ylabel('I_D/W (A/m)');
% grid on;
% grid minor;