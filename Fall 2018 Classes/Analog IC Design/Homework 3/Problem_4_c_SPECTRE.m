%This script reads and plots data from a .CSV file.
clc;


%Open data file
fid = fopen('Bode_DATA.csv');

format = '%f';
for i = 1:3
    format = [format, '%f'];
end

%Read data in from .CSV file
readData = textscan(fid, format, 'Headerlines',1,'Delimiter',',');
%If more columns (yData), add a %f

%NMOS data
Frequency = readData{1,1}(:,1);
Gain = readData{1,2}(:,1);
Phase = readData{1,3}(:,1);

Ri = 100;
Rs = 1E3;
Cgs = 8.867E-14;
gm = 1.369E-3;
gmb = 2.054E-4;

sys = tf([Cgs gm],[Cgs*(1+Ri/Rs+gmb*Ri) 1/Rs+gmb+gm]);

opts = bodeoptions('myOptions');
opts.FreqUnits = 'Hz';


subplot(2,1,1);
semilogx(Frequency, Gain);
xlabel('Frequency (Hz)');ylabel('Gain (dB)');
title('Cadence Simulation');
grid on;

subplot(2,1,2);
semilogx(Frequency, Phase);
xlabel('Frequency (Hz)');ylabel('Phase (deg)');
grid on;