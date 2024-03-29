%% Plotting script.
% Created by James Richard Forbes
% Edited by Ryan James Caverly, Trevor Burgoyne
% Updated 1 May 2023

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Font size, line size, and line width. 
font_size = 15;
line_size = 15;
line_width = 2;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots.
% Notice how the axes for each plot are labeled with the appropriate units

% System response
% figure('Position',[100 100 1200 800])
% % x vs time
% subplot(2,3,1) 
% plot(t,x_out(:,1),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('x (m)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % y vs time
% subplot(2,3,2) 
% plot(t,x_out(:,2),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('y (m)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % z vs time
% subplot(2,3,3) 
% plot(t,x_out(:,3),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('z (m)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % xdot vs time
% subplot(2,3,4)
% plot(t,x_out(:,4),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('xdot (m/s)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % ydot vs time
% subplot(2,3,5)
% plot(t,x_out(:,5),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('ydot (m/s)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % zdot vs time
% subplot(2,3,6)
% plot(t,x_out(:,6),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('zdot (m/s)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square

% Rotational stuffs
% epsilon1
figure('Position',[100 100 1200 600])
subplot(2,4,1)
plot(t,x_out(:,7),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\varepsilon_{1}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% epsilon2
subplot(2,4,2)
plot(t,x_out(:,8),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\varepsilon_{2}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% epsilon3
subplot(2,4,3)
plot(t,x_out(:,9),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\varepsilon_{3}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% eta
subplot(2,4,4)
plot(t,x_out(:,10),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\eta$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% q_norm
subplot(2,4,5)
plot(t,q_norm,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\varepsilon^{T}\varepsilon+\eta^{2}-1$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% yaw
subplot(2,4,6)
plot(t,yaw,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Yaw ($\psi, rad$)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% pitch
subplot(2,4,7)
plot(t,pitch,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Pitch ($\theta, rad$)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% roll
subplot(2,4,8)
plot(t,roll,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Roll ($\phi, rad$)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% Omega stuffs
figure('Position',[100 100 1200 600])

% omega1
subplot(1,3,1)
plot(t,x_out(:,11),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\omega_{1}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% omega2
subplot(1,3,2)
plot(t,x_out(:,12),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\omega_{2}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% omega3
subplot(1,3,3)
plot(t,x_out(:,13),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\omega_{3}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square


% % Energy, which should be constant when damping is zero.
% figure
% subplot(2,1,1) % Plot of total energy vs time (should be constant)
% plot(t,E,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('$E$ (J)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% 
% % Plot of normalized change in energy vs time (should be zero)
% subplot(2,1,2)
% plot(t,(E-E(1))./E(1),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('$(E - E(0))/E(0)$ (J)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% 
% % Plot of spacecraft trajectory around Earth
% figure
% plot3(x_out(:,1),x_out(:,2),x_out(:,3))
% xlabel('x (m)','fontsize',font_size,'Interpreter','latex');
% ylabel('y (m)','fontsize',font_size,'Interpreter','latex');
% zlabel('z (m)','fontsize',font_size,'Interpreter','latex');
% grid on
% axis equal
% hold on
% [X,Y,Z] = sphere; % Sphere
% surf(X*C.Re, Y*C.Re, Z*C.Re); % Earth
% 
% 
% INS Estimates
% epsilon1_hat
% figure('Position',[100 100 1200 600])
% subplot(2,4,1)
% plot(t,x_out(:,14),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('$\hat{\varepsilon}_{1}$','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % epsilon2_hat
% subplot(2,4,2)
% plot(t,x_out(:,15),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('$\hat{\varepsilon}_{2}$','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % epsilon3_hat
% subplot(2,4,3)
% plot(t,x_out(:,16),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('$\hat{\varepsilon}_{3}$','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % eta_hat
% subplot(2,4,4)
% plot(t,x_out(:,17),'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('$\hat{\eta}$','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % q_hat_norm
% subplot(2,4,5)
% plot(t,q_hat_norm,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('$\hat{\varepsilon}^{T}\hat{\varepsilon}+\hat{\eta}^{2}-1$','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% % 
% % yaw_IN_err
% subplot(2,4,6)
% plot(t,yaw_IN_err,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('CF Yaw Error ($\psi^{CF}_{err}, rad$)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % pitch_IN_err
% subplot(2,4,7)
% plot(t,pitch_IN_err,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('CF Pitch Error ($\theta^{CF}_{err}, rad$)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % roll_IN_err
% subplot(2,4,8)
% plot(t,roll_IN_err,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('CF Roll Error ($\phi^{CF}_{err}, rad$)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% % 
% % TRIAD errors
% % yaw_TRIAD_err
% figure('Position',[100 100 1200 600])
% subplot(1,3,1)
% plot(t,yaw_TRIAD_err,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('TRIAD Yaw Error ($\psi^{TRIAD}_{err}, rad$)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % pitch_TRIAD_err
% subplot(1,3,2)
% plot(t,pitch_TRIAD_err,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('TRIAD Pitch Error ($\theta^{TRIAD}_{err}, rad$)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square
% 
% % roll_TRIAD_err
% subplot(1,3,3)
% plot(t,roll_TRIAD_err,'Linewidth',line_width);
% hold on
% xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
% ylabel('TRIAD Roll Error ($\phi^{TRIAD}_{err}, rad$)','fontsize',font_size,'Interpreter','latex');
% set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
% grid on
% axis square

% OPTION (C): Reaction Wheels
% gamma1_dot
figure('Position',[100 100 1200 600])
subplot(1,3,1)
plot(t,x_out(:,14),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\dot{\gamma}_{1} (rad/s)$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% gamma2_dot
subplot(1,3,2)
plot(t,x_out(:,15),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\dot{\gamma}_{2} (rad/s)$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% gamma3_dot
subplot(1,3,3)
plot(t,x_out(:,16),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\dot{\gamma}_{3} (rad/s)$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square