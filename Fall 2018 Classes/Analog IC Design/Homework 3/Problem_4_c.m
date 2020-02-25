clc;

Ri = 100;
Rs = 1E3;
Cgs = 8.867E-14;
gm = 1.369E-3;
gmb = 2.054E-4;

sys = tf([Cgs gm],[Cgs*(1+Ri/Rs+gmb*Ri) 1/Rs+gmb+gm]);

opts = bodeoptions('myOptions');
opts.FreqUnits = 'Hz';

bode(sys,{10E3, 60E12}, opts);
title('Bode Plot from Hand Calculations');
grid on;