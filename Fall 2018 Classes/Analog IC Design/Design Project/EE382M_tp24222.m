%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script offers a rough attempt to design the OTA using the initial
% specs.
% 
% Analog IC Design --- EE 382M-14
% Written by Thomas Plantin
% Monday November 12th, 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
load 180nmos.mat; load 180pmos.mat;




%----------------------------INITIAL SPECS--------------------------------%

% Technology --> 0.18um 
% Temperature --> 25degC
% Power Dissipation --> MINIMIZE

Vdd = 1.8;               %Supply voltage
Av = 2;                  %Closed-loop gain
CL_min = 2E-12;          %CL >=2pF;
%Cs <= CL;
DR = 70;                 %Dynamic Range (in dB)
epsilon_s = 0.0005;      %Static settling error < 0.05%
epsilon_d = 0.0005;      %Dynamic settling error < 0.05%
ts = 35E-9;              %Setting time
%CMRR > 100dB;
%PSSR_p > 80dB;
%PSSR_m > 80dB;

% Passives --> Total ideal capacitance < 10pF; 
%              Total ideal resistance < 100kOhm

% OTA Input Stage --> NMOS or PMOS differential pair with a tail current
%                     current source

% Current Mirror Ratio <= 20

% Reference Current --> Single ideal current source with arbitrary value,
%                       with positive node tied to Vdd or negative node 
%                       tied to GND.

% CMFB Circuit --> Use ideal model provided.

% Input Voltage Range --> Measure.

% Pole/Zero cancellations and left half plane zeros --> Forbidden

%-------------------------------------------------------------------------%



%-------------------------TENTATIVE VARIABLES-----------------------------%

gm_ID = 15;
beta_max = 1/3;
beta_coeff = 0.98;
beta = beta_coeff*beta_max;
gamma = 1;
Temp = 25 + 273.15;    %25C to Kelvin
kb = 1.38065E-23;   %Boltzmann's Constant
PM = 72;            %Phase Margin = 72 deg = tan^-1(k), yielding k = 3


%-------------------------------------------------------------------------%



%-----------------------------CALCULATION---------------------------------%

% Calculate loop gain from static settling error
T = 1/epsilon_s;


% Dynamic Range (DR), noise and swing
Vov = 2/gm_ID + 2/gm_ID; %Added an overdrive for margin
vodpeak = Vdd - 2*Vov;                %Assume a pk output voltage of 1.2V
vodntot = vodpeak^2 / 10^(DR/10);    %vodntot^2
vodntot_RMS = sqrt(vodntot);   


%-FIRST STAGE--------------------------------------------------------------
Ao = T./beta;
Ao2 = 10;              %Second stage - gain of 10
Ao1 = Ao/Ao2;          %Ao = Ao1*Ao2 First stage - gain of 800
over_design_coeff = 1.2;

% Gain of the first stage is equal to ~ (gmro)^2/2
x1 = 0.6;                                 %x1 = Cgg2/Cc
x2 = 4; % linspace(0.5, 1.5);             %x2 = CLtot/Cc
x3 = 1.25;                                %x3 = CL/Cs

G1 = 1;   %G1 = gm11/gm1 - 1st stage
G2 = 1;   %G2 = gm22/gm2 - 2nd stage
Cc = 2.*(kb.*Temp./vodntot).*(gamma./beta.*(1+G1)+1./x2.*(1+gamma.*(1+G2)));
CLtot = Cc .* x2;
CL = CLtot*2*x3/(2*x3+1-beta);

if CL<CL_min
    CL = CL_min;
    CLtot = CL*(2*x3+1-beta)/(2*x3);
    Cc = CLtot / x2;
end

Cs = CL/x3;
Cf = Cs/2;
Cgg1 = Cf./beta - Cf - Cs;

slewCoeff = 1;
ts = slewCoeff * ts;

% Calculate fc given setting time and dynamic settling error
wc = (-1/ts)*log(epsilon_d);
fc = wc/2/pi;

GM1 = wc*Cc./beta;
wt1 = GM1./Cgg1;
wt1 = max(wt1, 10*wc);
ft1 = wt1/(2*pi);

L_1 = 0.18:0.02:2;          %NMOS Length of stage 1
L_11 = 0.18:0.02:2;         %PMOS Length of stage 1

for i = 1:length(L_1)
    
    L1 = L_1(i);
    %find the gm/id for the design
    gm_ID_real_1 = whatis(nch, 'GM_ID', 'GM_CGG', wt1,'L',L1);
    ID1 = GM1./gm_ID_real_1;
    
    for j = 1:i     %From 1 to i to ensure that PMOS device is smaller than NMOS device
        
        L11 = L_11(j);
        GDS_ID_1 =  whatis(nch, 'GDS_ID', 'GM_ID', gm_ID_real_1, 'L', L1);
        GDS_ID_2 =  whatis(pch, 'GDS_ID', 'GM_ID', gm_ID_real_1, 'L', L11);
        A1_calc = (gm_ID_real_1.^2)./(GDS_ID_1.^2+GDS_ID_2.^2);
        
        if A1_calc > over_design_coeff * Ao1
            
            VGS_1 = whatisVGS(nch, 'GM_ID', gm_ID_real_1, 'VDS', (Vdd - (2./gm_ID_real_1))./4, 'L', L1);
            JD_1 = whatis(nch, 'ID', 'VGS', VGS_1, 'VDS', (Vdd - (2./gm_ID_real_1))./4, 'L', L1)/nch.W;
            W1 = ID1/JD_1;
            VGS_11 = whatisVGS(pch, 'GM_ID', gm_ID_real_1, 'VDS', (Vdd - (2./gm_ID_real_1))./4, 'L', L11);
            JD_11 = whatis(pch, 'ID', 'VGS', VGS_11, 'VDS',(Vdd - (2./gm_ID_real_1))./4, 'L', L11)/pch.W;
            W11 = ID1./JD_11;

            
            validity = (W1>0.24 && W1<500) && (W11>0.24 && W11<500);
            if validity
                break;
            end
        end
    end
    if validity
        break;
    end
end

ID1 = GM1/gm_ID_real_1;


%%%%%%%%% SECOND STAGE CALCULATIONS %%%%%%%%%%%%%%%


k = 3;               %pole coefficent for required phase margin
wp2 = k*wc;     %second pole value
Cgg2 = x1*Cc;

theta1 = 0.3;
theta2 = 0.3;
C1 = Cgg2*(1+theta1);
C2 = CLtot*(1+theta2);
GM2 = wp2*(C1*C2/Cc+C1+C2);

wt2 = GM2/Cgg2;
wt2 = max(wt2,10*wc);
ft2 = (1/2/pi)*wt2;
%FIND LENGTHS
L_2 = 0.18:0.02:2;          %NMOS Length of stage 2
L_22 = 0.6;         %PMOS Length of stage 2
for i = 1:length(L_2)
    
    L2 = L_2(i);
    %find the gm/id for the design
    gm_ID_real_2 = whatis(pch, 'GM_ID', 'GM_CGG', wt2,'L',L2);
    ID2 = GM2/gm_ID_real_2;
    
    for j = i:length(L_22)     %Start from i to ensure that PMOS device is smaller than NMOS device
        
        L22 = L_22(j);
        GDS_ID_1 =  whatis(pch, 'GDS_ID', 'GM_ID', gm_ID_real_2, 'L', L2);
        GDS_ID_2 =  whatis(nch, 'GDS_ID', 'GM_ID', gm_ID_real_2, 'L', L22);
        A2_calc = (gm_ID_real_2)/(GDS_ID_1+GDS_ID_2);
        
        if A2_calc > over_design_coeff * Ao2
            
            VGS_2 = whatisVGS(pch, 'GM_ID', gm_ID_real_2, 'VDS', Vdd/2, 'L', L2);
            JD_2 = whatis(pch, 'ID', 'VGS', VGS_2, 'VDS', Vdd/2, 'L', L2)/pch.W;
            W2 = ID2/JD_2;
            VGS_22 = whatisVGS(nch, 'GM_ID', gm_ID_real_2, 'VDS', Vdd/2, 'L', L22);
            JD_22 = whatis(nch, 'ID', 'VGS', VGS_22, 'VDS',Vdd/2, 'L', L22)/nch.W;
            W22 = ID2/JD_22;
            
            validity = (W2>0.24 && W2<500) && (W22>0.24 && W22<500);
            if validity
                break;
            end
        end
    end
    if validity
        break;
    end
end

IDtot = 2*(ID1 + ID2);
Ibias = max(2*ID1, ID2)/20;
Itail = 2*ID1;

%-------------------------------------------------------------------------%

%------------------------------PRINTINGS----------------------------------%

fprintf('Open-loop gain --> Ao = %d\n', Ao);
fprintf('Loop gain --> T = %d\n', T);
fprintf('Closed-loop gain --> Av = %d\n', Av);
fprintf('\n');

fprintf('Crossover Frequency (unity gain f) --> wc = %d rad/s\n', wc);
fprintf('Crossover Frequency (unity gain f) --> fc = %d Hz\n', fc);
fprintf('\n');

fprintf('Capacitors --> Cc = %d F\n', Cc);
fprintf('           --> CLtot = %d F\n', CLtot);
fprintf('           --> Cf = %d F\n', Cf);
fprintf('           --> Cs = %d F\n', Cs);
fprintf('           --> Cgg1 = %d F\n', Cgg1);
fprintf('           --> Cgg2 = %d F\n', Cgg2);
fprintf('\n');

fprintf('1st Stage: Transconductance --> GM1 = %d S\n', GM1);
fprintf('           Efficiency --> GM_ID1 = %d V^-1\n', gm_ID_real_1);
fprintf('           Speed --> wt1 = %d rad/s\n', wt1);
fprintf('           Current --> ID1 = %d\n', ID1);
fprintf('\n');

fprintf('2nd Stage: Transconductance --> GM2 = %d S\n', GM2);
fprintf('           Efficiency --> GM_ID2 = %d V^-1\n', gm_ID_real_2);
fprintf('           Speed --> wt2 = %d rad/s\n', wt2);
fprintf('           Current --> ID2 = %d\n', ID2);
fprintf('\n');

fprintf('Total current --> IDtot = %d\n', IDtot);
fprintf('\n');

fprintf('Bias current --> Ibias = %d\n', Ibias);
fprintf('\n');

fprintf('Stage 1 current --> Itail = %d\n', Itail);
fprintf('Stage 2 current --> ID2 = %d\n', ID2);
fprintf('\n');
%-------------------------------------------------------------------------%