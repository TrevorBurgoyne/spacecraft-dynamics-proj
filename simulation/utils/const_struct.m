%% Constants
% Trevor Burgoyne
% Updated: 3 Mar 2023
%
% Usage: 
% >> addpath  '{path\to\directory\with\this\file\}'
% >> const_struct % initialize the structure, which pulls from this file
% >> C.m          % access structure members using '.' on the structure

% Global Constants
C.G    = 6.6743e-11;      % m^3*kg^-1*s^-2, Universal Gravitational Constant
C.min  = 60;              % s, length of a minute
C.hour = 60*C.min;        % s, length of an hour
C.day  = 24*C.hour;       % s, length of a day

% Earth Properties
C.me = 5.97219e24;       % kg, mass of Earth
C.Re = 6.3712e6;         % m, Radius of Earth
% C.J2 = 1.08262645e-3;    % Perturbation coefficient for Earth
C.J2 = 0;
C.mu = C.me*C.G;         % m^3*s^-2, Gravitational Constant for Earth

% Spacecraft Properties
C.ms  = 2860;            % kg, spacecraft mass
C.h   = 3.5786e7;        % m, spacecraft altitude (measured from surface)
C.Rs  = C.Re + C.h;      % m, spacecraft radius (measured from center of earth)
C.v   = sqrt(C.mu/C.Rs); % m/s, spacecraft orbital velocity