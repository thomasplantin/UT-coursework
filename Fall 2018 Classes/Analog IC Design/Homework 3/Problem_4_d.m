clc;

R1 = 3.344E3;
R2 = 1E6;
L = 0.2965E-3;

sys = tf([R1*L R1*R2],[L R1+R2]);

opts = bodeoptions('myOptions');
opts.FreqUnits = 'Hz';

bode(sys,{10E3, 10E12}, opts);
title('Bode Plot from Hand Calculations');
grid on;