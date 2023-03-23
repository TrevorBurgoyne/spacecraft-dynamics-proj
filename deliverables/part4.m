%% Part 4 Code Deliverables
% Trevor Burgoyne, 24 Mar 2023
% AEM 4305 Spacecraft Attitude Dynamics and Control

% Add path to simulation functions so that we can use them
addpath  '..\simulation\';

%% Load data and plot with omega_0 = [0 0 0]
load('..\simulation\output\part_4_full_orbit.mat')
plot_script_v2

%% Load data and plot with omega_0 = [0.08; -0.1; 0.3]
% Took 10.5 hours to simulate :-0
load('..\simulation\output\part_4_full_orbit_init_cond.mat')
plot_script_v2