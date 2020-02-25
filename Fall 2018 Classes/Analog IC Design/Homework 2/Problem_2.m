Vt = 0.6;
k = 194E-6;
Ec = 1.5E6;

Vgs = [Vt:.001:3];

W = 2E-6;
L = 0.5E-6;

Vds = 3;
Vds_act = Ec.*L.*(sqrt(1+2.*(Vgs-Vt)./(Ec.*L))-1);
RSX = 1/(Ec*k*W);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Id_model = k/2*W/L.*(Vds_act).^2;
Id_RSX = k./(2.*(1+k.*W./L.*RSX.*(Vgs-Vt))).*W./L.*(Vgs-Vt).^2;


plot(Vgs, Id_model, 'k', Vgs, Id_RSX,':k');
legend('Model Prediction', 'Direct Caculation');
xlabel('V_G_S (V)');
ylabel('I_D (A)');
title(['Plot curves of I_D vs V_G_S for W = ' num2str(W*10E5) ' um and L = ' num2str(L*10E5) ' um']);
grid on;