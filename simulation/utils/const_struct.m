%% Constants
% Trevor Burgoyne
% Updated: 29 Apr 2023
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
C.J2 = 1.08262645e-3;    % Perturbation coefficient for Earth
% C.J2 = 0;
C.mu = C.me*C.G;         % m^3*s^-2, Gravitational Constant for Earth

% Spacecraft Properties
C.ms  = 2860;            % kg, spacecraft mass
C.h   = 3.5786e7;        % m, spacecraft altitude (measured from surface)
% C.h   = 2e6;             % m, LEO
C.Rs  = C.Re + C.h;      % m, spacecraft radius (measured from center of earth)
C.v   = sqrt(C.mu/C.Rs); % m/s, spacecraft orbital velocity
C.s   = 7.1;             % m, size of spacecraft sides (the central cube)
C.l   = 9.45;            % m, length of spacecraft rectangular panels
C.w   = C.s;             % m, width of spacecraft rectangular panels (same as cude size)

% Option (a) Desired orientation:
C.q_d       = [1;0;0;0];
C.epsilon_d = C.q_d(1:3);
C.eta_d     = C.q_d(4);
C.T         = [
    C.eta_d*eye(3) - crossm(C.epsilon_d), -C.epsilon_d
    C.epsilon_d',                       C.eta_d
];

% Inertia about Spacecraft COM in Body Frame
C.I = (C.ms / 6)*diag([
  .9*C.s^2 + .05*C.w^2           % I1
  .9*C.s^2 + .05*C.l^2           % I2
  .9*C.s^2 + .05*(C.w^2 + C.l^2) % I3
]); % kg*m^2

% Option (c) 
C.Is = 0.2; % kg*m^2, Inertia of Reaction Wheels
C.gamma_d = zeros(3,1); % rad/s, desired rxn wheel speeds

% PD Control
C.kp = 1e4;
C.kd = 1e5;
C.ke = 1e5;
C.kh = 1e3;