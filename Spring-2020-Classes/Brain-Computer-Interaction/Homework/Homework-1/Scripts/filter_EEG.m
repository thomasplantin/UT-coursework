% Brain Computer Interaction - Homework 1
% 
% Goal: Filter EEG measurements
% 
% Thomas Plantin - January 30, 2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clear the command window
clc;

% Import the EEG data
cd /Users/thomasplantin/Documents/UT-Austin-Academics/Spring-2020-Classes/Brain-Computer-Interaction/Homework/Homework-1/Data
load EEG

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot the raw signal
figure
hold on;
grid minor;
plot(signal, 'Color', EEGClass.setColor('#0072BD'));

% Reformat the triggers so that they can be plotted
my_triggers = zeros(length(signal), 1);
for i=1:length(trigger)
    pointer = trigger(i);
    my_triggers(pointer) = 8;
end

% Plot the triggers
plot(my_triggers, 'Color', EEGClass.setColor('#FF0000'));

% Customize plot
lgd = legend('Raw Signal', 'Trigger');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Raw Signal and Trigger over Time');
xlabel('Time'); ylabel('EEG Signal');

% Seal this figure
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Declaring alpha & beta bands, and the filter order
f_a = [9 11]; % alpha band
f_b = [18 22]; % beta band
N = 5; % filter order

% Filtering the alpha and beta bands
signal_a = EEGClass.b_filter(signal, N, f_a(1)/fs, f_a(2)/fs);
signal_b = EEGClass.b_filter(signal, N, f_b(1)/fs, f_b(2)/fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot the raw signal and the alpha & beta filtered
figure
grid minor;
subplot(2, 1, 1);
grid minor;
hold on;
plot(signal, 'Color', EEGClass.setColor('#0072BD'));
plot(signal_a, 'Color', EEGClass.setColor('#21BF73'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Alpha Filtered');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Raw Signal and Alfa Filtered over Time');
xlabel('Time'); ylabel('EEG Signal'); ylim([-20 20]);
hold off;

subplot(2, 1, 2);
grid minor;
hold on;
plot(signal, 'Color', EEGClass.setColor('#0072BD'));
plot(signal_b, 'Color', EEGClass.setColor('#F64B3C'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Beta Filtered');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Raw Signal and Beta Filtered over Time');
xlabel('Time'); ylabel('EEG Signal'); ylim([-20 20]);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Computing the power of the signal
power_sig_a = signal_a.^2;
power_sig_b = signal_b.^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the raw signal, the alpha & beta filtered, and the power (s^2)
% figure
% grid minor;
% hold on;
% plot(signal, 'Color', EEGClass.setColor('#0072BD'));
% plot(signal_b, 'Color', EEGClass.setColor('#77AC30'));
% plot(signal_a, 'Color', EEGClass.setColor('#21BF73'));
% plot(power, 'Color', EEGClass.setColor('#A2142F'));
% % Create a legend object and customize it
% lgd = legend('Raw Signal', 'Beta Filtered', 'Alpha Filtered', 'Signal Power');
% lgd.FontSize = 12;
% lgd.FontWeight = 'bold';
% lgd.Location = 'SouthEast';
% title('Raw Signal, Alfa & Beta Filtered, and Power over Time');
% xlabel('Time'); ylabel('EEG Signal'); ylim([-20 50]);
% % Seal this figure
% hold off;
figure
grid minor;
subplot(2, 1, 1);
grid minor;
hold on;
plot(signal, 'Color', EEGClass.setColor('#0072BD'));
plot(signal_a, 'Color', EEGClass.setColor('#21BF73'));
plot(power_sig_a, 'Color', EEGClass.setColor('#A2142F'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Alpha Filtered', 'Alpha Power');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Raw Signal and Alfa Filtered & Power over Time');
xlabel('Time'); ylabel('EEG Signal'); ylim([-20 20]);
hold off;

subplot(2, 1, 2);
grid minor;
hold on;
plot(signal, 'Color', EEGClass.setColor('#0072BD'));
plot(signal_b, 'Color', EEGClass.setColor('#F64B3C'));
plot(power_sig_b, 'Color', EEGClass.setColor('#A2142F'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Beta Filtered', 'Beta Power');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Raw Signal and Beta Filtered & Power over Time');
xlabel('Time'); ylabel('EEG Signal'); ylim([-20 20]);
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Compute moving average for alpha and beta band
avg = 1; % window size
s_mavg_a = (filter(ones(1, avg*fs)/avg/fs, 1, signal_a));
s_mavg_b = (filter(ones(1, avg*fs)/avg/fs, 1, signal_b));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot moving average for alpha and beta band
figure
subplot(2, 1, 1);
grid minor;
hold on;
plot(signal_a, 'Color', EEGClass.setColor('#EDB120'));
plot(s_mavg_a, 'Color', EEGClass.setColor('#F64B3C'));
% Create a legend object and customize it
lgd = legend('Alpha Filtered', 'Alpha Moving-Average');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Alpha Filtered and Alpha Moving-Average over Time');
xlabel('Time'); ylabel('EEG Signal');
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 1, 2);
grid minor;
hold on;
plot(signal_b, 'Color', EEGClass.setColor('#77AC30'));
plot(s_mavg_b, 'Color', EEGClass.setColor('#F64B3C'));
% Create a legend object and customize it
lgd = legend('Beta Filtered', 'Beta Moving-Average');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Beta Filtered and Beta Moving-Average over Time');
xlabel('Time'); ylabel('EEG Signal');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create some trials of raw signal
trial_id = [55 56 74 77];
trial_timing = [-2 6];
sizes = zeros(length(trial_id), 1);

for i=1:length(sizes)
    sizes(i) = trigger(trial_id(i)+1) - trigger(trial_id(i)) + 8*fs + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trial_1 = EEGClass.setTrial(signal, trigger(trial_id(1)) - 2*fs, trigger(trial_id(1)+1) + 6*fs, sizes(1));
trial_2 = EEGClass.setTrial(signal, trigger(trial_id(2)) - 2*fs, trigger(trial_id(2)+1) + 6*fs, sizes(2));
trial_3 = EEGClass.setTrial(signal, trigger(trial_id(3)) - 2*fs, trigger(trial_id(3)+1) + 6*fs, sizes(3));
trial_4 = EEGClass.setTrial(signal, trigger(trial_id(4)) - 2*fs, trigger(trial_id(4)+1) + 6*fs, sizes(4));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot the raw signal trials

figure
subplot(4, 1, 1);
hold on;
grid minor;
plot(trial_1, 'Color', EEGClass.setColor('#0072BD'));
title('Raw Signal over Time for trial_i_d=55');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_1)-1500, 'LineWidth', 1);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4, 1, 2);
hold on;
grid minor;
plot(trial_2, 'Color', EEGClass.setColor('#0072BD'));
title('Raw Signal over Time for trial_i_d=56');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_2)-1500, 'LineWidth', 1);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4, 1, 3);
hold on;
grid minor;
plot(trial_3, 'Color', EEGClass.setColor('#0072BD'));
title('Raw Signal over Time for trial_i_d=74');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_3)-1500, 'LineWidth', 1);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4, 1, 4);
hold on;
grid minor;
plot(trial_4, 'Color', EEGClass.setColor('#0072BD'));
title('Raw Signal over Time for trial_i_d=77');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_4)-1500, 'LineWidth', 1);
% Seal this figure
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Filter the trials of raw signal

trial_1_a = EEGClass.b_filter(trial_1, N, f_a(1)/fs, f_a(2)/fs);
trial_1_b = EEGClass.b_filter(trial_1, N, f_b(1)/fs, f_b(2)/fs);

trial_2_a = EEGClass.b_filter(trial_2, N, f_a(1)/fs, f_a(2)/fs);
trial_2_b = EEGClass.b_filter(trial_2, N, f_b(1)/fs, f_b(2)/fs);

trial_3_a = EEGClass.b_filter(trial_3, N, f_a(1)/fs, f_a(2)/fs);
trial_3_b = EEGClass.b_filter(trial_3, N, f_b(1)/fs, f_b(2)/fs);

trial_4_a = EEGClass.b_filter(trial_4, N, f_a(1)/fs, f_a(2)/fs);
trial_4_b = EEGClass.b_filter(trial_4, N, f_b(1)/fs, f_b(2)/fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot the trials for the raw signal and the alpha & beta filtered
figure
subplot(4, 1, 1);
hold on;
grid minor;
plot(trial_1, 'Color', EEGClass.setColor('#0072BD'));
plot(trial_1_b, 'Color', EEGClass.setColor('#F64B3C'));
plot(trial_1_a, 'Color', EEGClass.setColor('#21BF73'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Beta Filtered', 'Alpha Filtered', 'AutoUpdate', 'off');
lgd.FontSize = 8;
lgd.FontWeight = 'bold';
lgd.Location = 'SouthEast';
title('Raw Signal and Alfa & Beta Filtered over Time for trial_i_d=55');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_1)-1500, 'LineWidth', 1);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4, 1, 2);
hold on;
grid minor;
plot(trial_2, 'Color', EEGClass.setColor('#0072BD'));
plot(trial_2_b, 'Color', EEGClass.setColor('#F64B3C'));
plot(trial_2_a, 'Color', EEGClass.setColor('#21BF73'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Beta Filtered', 'Alpha Filtered', 'AutoUpdate', 'off');
lgd.FontSize = 8;
lgd.FontWeight = 'bold';
lgd.Location = 'SouthEast';
title('Raw Signal and Alfa & Beta Filtered over Time for trial_i_d=56');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_2)-1500, 'LineWidth', 1);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4, 1, 3);
hold on;
grid minor;
plot(trial_3, 'Color', EEGClass.setColor('#0072BD'));
plot(trial_3_b, 'Color', EEGClass.setColor('#F64B3C'));
plot(trial_3_a, 'Color', EEGClass.setColor('#21BF73'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Beta Filtered', 'Alpha Filtered', 'AutoUpdate', 'off');
lgd.FontSize = 8;
lgd.FontWeight = 'bold';
lgd.Location = 'SouthEast';
title('Raw Signal and Alfa & Beta Filtered over Time for trial_i_d=74');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_3)-1500, 'LineWidth', 1);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4, 1, 4);
hold on;
grid minor;
plot(trial_4, 'Color', EEGClass.setColor('#0072BD'));
plot(trial_4_b, 'Color', EEGClass.setColor('#F64B3C'));
plot(trial_4_a, 'Color', EEGClass.setColor('#21BF73'));
% Create a legend object and customize it
lgd = legend('Raw Signal', 'Beta Filtered', 'Alpha Filtered', 'AutoUpdate', 'off');
lgd.FontSize = 8;
lgd.FontWeight = 'bold';
lgd.Location = 'SouthEast';
title('Raw Signal and Alfa & Beta Filtered over Time for trial_i_d=77');
xlabel('Time'); ylabel('EEG Signal'); xline(500, 'LineWidth', 1); xline(length(trial_4)-1500, 'LineWidth', 1);
% Seal this figure
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot averaged signals of alpha and beta power

power_a = signal_a.^2;
power_b = signal_b.^2;
%avg declared in above section
s_mavg_power_a = (filter(ones(1, avg*fs)/avg/fs, 1, power_a));
s_mavg_power_b = (filter(ones(1, avg*fs)/avg/fs, 1, power_b));

figure
subplot(2,1,1);
grid minor;
hold on;
plot(s_mavg_power_a, 'Color', EEGClass.setColor('#0072BD'));
% Create a legend object and customize it
lgd = legend('Averaged Alpha Power');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Averaged Alpha Power over Time');
xlabel('Time'); ylabel('Power');
hold off;

subplot(2, 1, 2);
grid minor;
hold on;
plot(s_mavg_power_b, 'Color', EEGClass.setColor('#F64B3C'));
% Create a legend object and customize it
lgd = legend('Averaged Beta Power');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
lgd.Location = 'NorthWest';
title('Averaged Beta Power over Time');
xlabel('Time'); ylabel('Power');