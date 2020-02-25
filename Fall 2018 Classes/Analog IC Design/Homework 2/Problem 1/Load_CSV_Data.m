%This script reads and plots data from a .CSV file.

clear all;
clc;


%Open data file
fid = fopen('PB1_NMOS.csv');

%Read data in from .CSV file
readData = textscan(fid, '%f %f %f ', 'Headerlines',2,'Delimiter',',');
%If more columns (yData), add a %f

%Extract data from readData
xData = readData{1,1}(:,1);
yData = readData{1,2}(:,1);
%If more columns (yData):
%yData2 = readData{1,3}(:,1);

%Plot Data
f1 = figure(1);
cla; hold on; grid on;
plot(xData, yData, 'b-');
%plot(xData, yData2, 'r-');
title('Place your title here');
xlabel('x-axis');
ylabel('y-axis');
