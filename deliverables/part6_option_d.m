%% Part 6 Option D Code Deliverables
% Trevor Burgoyne, 30 Apr 2023
% AEM 4305 Spacecraft Attitude Dynamics and Control

% Add path to simulation functions so that we can use them
addpath  '..\simulation\';

%% Option d: Complementary Filter Attitude Estimation
load('..\simulation\output\part_6_option_d')
plot_script_v2

%% Does the CF do better than TRIAD alone?

% As expected, the CF definetly smooths out the output of the TRIAD
% algorithm, so it that sense we can say it does a better job. However its
% clear that my particular implementation has some limitations. For
% example, the error seems to stay offset at a somewhat constant bias,
% something that could potentially be removed by adding a bias estimation
% step to the filter. Additionally, the quaternion estimate very quickly
% becomes invalid (no longer a unit quaternion), which could be solved by
% trying to normalize the estimate at each timestep or at some regular
% interval. 

% Note: I ended up only running the sim for 20 seconds because even
% that took about an hour and a half to run.

