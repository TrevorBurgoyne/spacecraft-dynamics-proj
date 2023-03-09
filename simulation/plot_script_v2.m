%% Plotting script.
% Created by James Richard Forbes
% Edited by Ryan James Caverly, Trevor Burgoyne
% Updated 3 Mar 2023

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
% % xzdot vs time
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
subplot(2,4,1)
plot(t,x_out(:,1),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\varepsilon_{1}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% epsilon2
subplot(2,4,2)
plot(t,x_out(:,2),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\varepsilon_{2}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% epsilon3
subplot(2,4,3)
plot(t,x_out(:,3),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$\varepsilon_{3}$','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% eta
subplot(2,4,4)
plot(t,x_out(:,4),'Linewidth',line_width);
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
ylabel('Yaw ($\psi$)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% pitch
subplot(2,4,7)
plot(t,pitch,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Pitch ($\phi$)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% roll
subplot(2,4,8)
plot(t,yaw,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Roll ($\theta$)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
axis square

% Energy, which should be constant when damping is zero.
figure
subplot(2,1,1) % Plot of total energy vs time (should be constant)
plot(t,E,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$E$ (J)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

% Plot of normalized change in energy vs time (should be zero)
subplot(2,1,2)
plot(t,(E-E(1))./E(1),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$(E - E(0))/E(0)$ (J)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

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

