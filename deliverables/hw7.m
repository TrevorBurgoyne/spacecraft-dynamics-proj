%% Homework 7
% Trevor Burgoyne, 14 Apr 2023
% AEM 4305 Spacecraft Attitude Dynamics and Control

% Add path to util functions so that we can use them
addpath  '..\simulation\utils\';

%% (b) Define the given test vectors

% frame a
s1_a = [0;1;2];
s2_a = [1;3;0];
s3_a = [1;1;1];

% frame b
s1_b = [2.0139;.7545;.6124];
s2_b = [1.7398;1.2292;-2.3371];
s3_b = [1.6578;-.0429;-.5000];

%% (b) find C_ba from s1 and s2
[C_ba] = TRIAD(s1_a, s2_a, s1_b ,s2_b)
[yaw, pitch, roll] =  DCM2Euler321(C_ba)

%% (b) find C_ba from s1 and s3
[C_ba] = TRIAD(s1_a, s3_a, s1_b, s3_b)
[yaw, pitch, roll] =  DCM2Euler321(C_ba)

%% (c) Noisy Sensor Values

% noisy frame b values
s1_b = [2.0712;0.7264;0.6192];
s2_b = [1.8040;1.1874;-2.3363];
s3_b = [1.1046;-.2449;-.3776];

%% (c) find C_ba from s1 and s2
[C_ba2] = TRIAD(s1_a, s2_a, s1_b ,s2_b)
[yaw, pitch, roll] =  DCM2Euler321(C_ba)

%% (c) find C_ba from s1 and s3
[C_ba3] = TRIAD(s1_a, s3_a, s1_b, s3_b)
[yaw, pitch, roll] =  DCM2Euler321(C_ba)

%% (c) Which is noisier, s2 or s3?
% Let's look qualitatively at how different the DCMs are
s2_diff = C_ba2 ./ C_ba
s3_diff = C_ba3 ./ C_ba

%% So which is noisier?
% s3 is the noisier measurement

% The differencies of each of the DCM values for s3 are much farther from 1
% for every single DCM entry, indicating that it is farther from the exact
% measurements and thus must be noiser.