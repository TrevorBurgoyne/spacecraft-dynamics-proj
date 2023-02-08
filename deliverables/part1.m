%% Part 1 Code Deliverables
% Trevor Burgoyne, 17 Feb 2023,
% AEM 4305 Spacecraft Attitude Dynamics and Control

% Add path to util functions so that we can use them
addpath  '..\utils\';

% Define Cba as given in instructions
Cba = [...
     .8995   .3870  -.2026;
    -.3201   .8995   .2974;
     .2974  -.2026   .9330;
];

%% Verify part (b)
q_ba = DCM2Quaternion(Cba)

%% Verify part (d)
[yaw, pitch, roll] = DCM2Euler321(Cba)