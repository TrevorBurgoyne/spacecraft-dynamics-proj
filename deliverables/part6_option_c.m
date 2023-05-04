%% Part 6 Option C Code Deliverables
% Trevor Burgoyne, 1 May 2023
% AEM 4305 Spacecraft Attitude Dynamics and Control

% Add path to simulation functions so that we can use them
addpath  '..\simulation\';

%% Option C: PD Attitude Control with Reaction Wheels (Wheels Only)
load('..\simulation\output\part_6_option_c_just_wheels')
plot_script_v2

%% Do the reaction wheels spin up to large speeds?

% Indeed they do, they quickly jump to ~10^4 rad/s, or ~10^3 rpm.

%% Option C: PD Attitude Control with Reaction Wheels (w/Magnetic Torquer)
load('..\simulation\output\part_6_option_c')
plot_script_v2

%% Do the reaction wheels approach the desired speed (ie, 0)?

% Yes, the magnetic torquer is a great help in reducing the maximum spin rate
% of the reaction wheels. They all still have some spin by the end of the
% sim, probably because the Euler angles haven't all quite settled down to
% zero yet either.
