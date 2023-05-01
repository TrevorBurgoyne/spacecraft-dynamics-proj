%% Part 6 Option A Code Deliverables
% Trevor Burgoyne, 29 Apr 2023
% AEM 4305 Spacecraft Attitude Dynamics and Control

% Add path to simulation functions so that we can use them
addpath  '..\simulation\';

%% % OPTION (A): Quaternion PD Attitude Tracking Control
load('..\simulation\output\part_6_option_a.mat')
plot_script_v2

%% Does the controller track the desired altitude?

% Yes, the controller quickly moves to the desired attitude of yaw=pitch=0
% and roll=pi. In the graph of roll, at one point it decides to switch from
% +pi to -pi but these represent the same orientation.