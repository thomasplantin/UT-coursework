%%% Problem 1 %%%

% Part a)

Cqi = 8; % fF/(um^2)
Bge2 = 240; % fF/(eV * um^2)
phi = linspace(-0.3, 0.3);
vg = 0.7;

Cq = sqrt(Cqi^2 + (Bge2*phi).^2);
Cox = -(phi.*Cq)./(phi-vg);

figure(1)
plot(phi, Cq, phi, Cox);
xlabel('\phi (V)'); ylabel('Capacitance (fF/(um^2))');
legend('C_q', 'C_o_x');
title('PB1 - Part a');
grid minor; grid on;



% Part b)

Ctot = Cq.*Cox./(Cq+Cox);

figure(2)
plot(phi, Ctot, phi, Cox);
xlabel('\phi (V)'); ylabel('Capacitance (fF/(um^2))');
legend('C_T_O_T', 'C_e_s');
title('PB1 - Part b');
grid minor; grid on;

