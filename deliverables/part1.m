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

%% Verify 2(b)
q_ba = DCM2Quaternion(Cba)

%% Verify 2(d)
[yaw, pitch, roll] = DCM2Euler321(Cba)

%% Verify 3(d)
SmatrixQuaternion(q_ba)*GammaQuaternion(q_ba) % should be eye(3)