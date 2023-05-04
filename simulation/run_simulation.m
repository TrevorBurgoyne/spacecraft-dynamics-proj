%% Spacecraft Simulation
% Created by James Richard Forbes
% Edited by Ryan James Caverly, Trevor Burgoyne
% Updated 1 May 2023

clear all
format long

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants 
addpath  '..\simulation\utils\'; % Add util functions to path
addpath  '..\simulation\ODEProgress'; % function to show wait bar while running sim
const_struct % All constants in one file.

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Conditions
% Translational
r_0    = [0, 0, C.Rs]';    % Initial position [x,y,z]'
v_0    = [0, C.v, 0]';     % Initial velocity [xdot,ydot,zdot]'

% Rotational
% epsilon_0 = zeros(3,1);         % Initial epsilon
% eta_0     = 1;                  % Initial eta
% omega_0   = [0; 0; 0];          % Initial omega (rad/s)
epsilon_0 = (1/sqrt(6))*[1;1;1]; % Initial epsilon
eta_0     = 1/sqrt(2);           % Initial eta
omega_0   = [0.08; -0.1; 0.3];   % Initial omega (rad/s)
gamma_0   = zeros(3,1);          % Initial rxn wheel speeds (rad/s)

% Attitude estimate
epsilon_hat_0 = zeros(3,1);     % Initial epsilon estimate
eta_hat_0     = 1;              % Initial eta estimate
% epsilon_hat_0 = epsilon_0;     % Initial epsilon estimate
% eta_hat_0     = eta_0;         % Initial eta estimate

% Combined Initial Conditions
% x = [r_0', v_0', epsilon_0', eta_0, omega_0', epsilon_hat_0', eta_hat_0]'; 
x = [r_0', v_0', epsilon_0', eta_0, omega_0', gamma_0']';

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation time.
t_0 = 0; % s
% t_max = .75*C.day; % s
% t_max = C.day; % s
t_max = C.min; % s
t_div = 101; % number of steps to divide the time series into.
t_span = linspace(t_0,t_max,t_div); % Total simulation time.

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation options.
tol = 1e-2;
options = odeset('AbsTol',tol,'RelTol',tol,'OutputFcn',@odeprog,'Events',@odeabort); % This changes the integration tolerence.

tic
% [t,x_out] = ode45(@TranslationalODEs,t_span,x,options);
% [t,x_out] = ode45(@RotationalODEs,t_span,x,options);
[t,x_out] = ode45(@ODEs,t_span,x,options);
time_stamp = toc;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Post Processing
post_processing_v2

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot data
plot_script_v2


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save all the data. (You never know when you'll need it again.)
save '..\simulation\output\part_6_option_c'