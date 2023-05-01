%% Part 6 Q2 Code Deliverables
% Trevor Burgoyne, 29 Apr 2023
% AEM 4305 Spacecraft Attitude Dynamics and Control

% Add path to simulation functions so that we can use them
addpath  '..\simulation\';

%% Part (a): Using true values of epsilon and omega
load('..\simulation\output\part_6_q2_a.mat')
plot_script_v2

%% Part (b): Using estimated values of epsilon and omega
load('..\simulation\output\part_6_q2_b.mat')
plot_script_v2

%% (i) Do results tend toward zero?

% The true values tend toward zero very quickly, although it took some trial 
% and error to get gains of the right magnitude. When using the estimated 
% values, the angles still generally try and tend to zero, with some
% jumpiness due to the inherent error between what the estimate is telling
% the controller and what the true attitude actually is.

%% (ii) Why not use arbitrarily large control gains?

% Large control gains generally mean larger magnitude control torques, 
% which may not be achievable given the magnitude limitations of 
% on-board torquers.