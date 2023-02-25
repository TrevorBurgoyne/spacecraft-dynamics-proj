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
figure
% x vs time
subplot(2,3,1) 
plot(t,x_out(:,1),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('x (m)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

% y vs time
subplot(2,3,2) 
plot(t,x_out(:,2),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('y (m)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

% z vs time
subplot(2,3,3) 
plot(t,x_out(:,3),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('z (m)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

% xdot vs time
subplot(2,3,4)
plot(t,x_out(:,4),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('xdot (m/s)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

% ydot vs time
subplot(2,3,5)
plot(t,x_out(:,5),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('ydot (m/s)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

% xzdot vs time
subplot(2,3,6)
plot(t,x_out(:,6),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('zdot (m/s)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

% Energy, which should be constant when damping is zero.
figure
subplot(2,1,1) % Plot of total energy vs time (should be constant)
plot(t,E,'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$E$ (J)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on

subplot(2,1,2) % Plot of normalized change in energy vs time (should be zero)
plot(t,(E-E(1))./E(1),'Linewidth',line_width);
hold on
xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('$(E - E(0))/E(0)$ (J)','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)
grid on
