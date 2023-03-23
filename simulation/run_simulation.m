%% Spacecraft Simulation
% Created by James Richard Forbes
% Edited by Ryan James Caverly, Trevor Burgoyne
% Updated 24 Mar 2023

clear all
format long

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants 
addpath  '..\simulation\utils\'; % Add util functions to path
addpath  '..\simulation\odewbar'; % function to show wait bar while running sim
const_struct % All constants in one file.

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Conditions
% Translational
r_0    = [0, 0, C.Rs]';    % Initial position [x,y,z]'
v_0    = [0, C.v, 0]';     % Initial velocity [xdot,ydot,zdot]'
% Rotational
epsilon_0 = zeros(3,1);        % Initial epsilon
eta_0     = 1;                 % Initial eta
omega_0   = [0.08; -0.1; 0.3]; % Initial omega (rad/s)

% Combined Initial Conditions
x = [r_0', v_0', epsilon_0', eta_0, omega_0']'; 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation time.
t_0 = 0; % s
% t_max = .75*C.day; % s
t_max = C.hour; % s
t_div = 10001; % number of steps to divide the time series into.
t_span = linspace(t_0,t_max,t_div); % Total simulation time.

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation options.
options = odeset('AbsTol',1e-9,'RelTol',1e-9); % This changes the integration tolerence.

tic
% [t,x_out] = ode45(@TranslationalODEs,t_span,x,options);
% [t,x_out] = ode45(@RotationalODEs,t_span,x,options);
[t,x_out] = ode45(@ODEs,t_span,x,options,'OutputFcn',@odewbar);
time_stamp = toc;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Post Processing
post_processing_v2

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot data
plot_script_v2


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save all the data. (You never know when you'll need it again.)
save '..\simulation\output\sim_data_v1'