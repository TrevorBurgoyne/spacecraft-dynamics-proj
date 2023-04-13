function  [dot_x] = EstimateODEs(t,x,omega)
%ODES  
% [dot_x] = EstimateODEs(t,x,omega) returns x_dot = f(x,t) by
% specifying the differential equations of the system in first-order form.
% Attitude estimate is performed using the TRIAD algorithm and simulated
% sensor data from an Earth Horizon Sensor and Magnetometer.
% Angular velocity is estimated using a Rate Gyro.
%
% INPUT PARAMETERS:
% x = [epsilon_hat, eta_hat]'
% t = time
% omega = 3x1 true angular velocity
%
% OUTPUT PARAMETERS:
% dot_x = [epsilon_hat_dot, eta_hat_dot]'
% the first-order differential equation evaluated at x and t
%
% Trevor Burgoyne
% Updated 13 Apr 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get omega estimate using Rate Gyro
omega_hat = RateGyroNoisy(omega,t);

% Dynamics

% First, extract states in a convenient form. 
epsilon_hat = x(1:3); 
eta_hat     = x(4);

% Form dot_x = f(x,u) system.
dot_x      = zeros(4,1);
dot_x(1:3) = .5*(eta_hat*eye(3) + crossm(epsilon_hat)) * omega_hat; 
dot_x(4)   = -.5 * epsilon_hat' * omega_hat;

