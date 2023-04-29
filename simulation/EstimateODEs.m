function  [dot_x] = EstimateODEs(t,x,triad)
%ODES  
% [dot_x] = EstimateODEs(t,x,omega) returns x_dot = f(x,t) by
% specifying the differential equations of the system in first-order form.
% Attitude estimate is  by default performed using the TRIAD algorithm and 
% simulated sensor data from an Earth Horizon Sensor and Magnetometer.
% Inertial navigation can instead be used if `triad=false`. 
% The Angular velocity is estimated using a Rate Gyro.
%
% INPUT PARAMETERS:
% x = [r, v, epsilon, eta, omega, epsilon_hat, eta_hat]'
% t = time
% triad = boolean (by default is true)
%
% OUTPUT PARAMETERS:
% dot_x = [epsilon_hat_dot, eta_hat_dot]'
% the first-order differential equation evaluated at x and t
%
% Trevor Burgoyne
% Updated 29 Apr 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check args
if nargin < 3
  triad = true; % Default to using TRIAD
end

% Form dot_x = f(x,u) system.
dot_x = zeros(4,1);

if triad
    % TRIAD attitude determination
    
    % First, extract states in a convenient form. 
    r_a  = x(1:3);              % [x, y, z]' in earth frame
    q_ba = x(7:10);             % [epsilon, eta]'
    C_ba = Quaternion2DCM(q_ba); % True DCM
    
    % True values s1_a (Earth Horizon) and s2_a (Magnetometer)
    s1_a = -r_a;
    s2_a = EarthMagField(r_a,t);

    % Sensor Readings s1_b (Earth Horizon) and s2_b (Magnetometer)
    s1_b = EarthSensorNoisy(r_a,C_ba,t);
    s2_b = MagnetometerNoisy(r_a,C_ba,t);

    
    C_hat = TRIAD(s1_a,s2_a,s1_b,s2_b); % TRIAD DCM estimate
    dot_x(1:4) = DCM2Quaternion(C_hat); % Quaternion estimate
else
    % Inertial navigation
    % First, extract states in a convenient form.
    omega       = x(11:13);
    epsilon_hat = x(14:16); 
    eta_hat     = x(17);
    
    % Get omega estimate using Rate Gyro
    omega_hat = RateGyroNoisy(omega,t);
    
    dot_x(1:3) = .5*(eta_hat*eye(3) + crossm(epsilon_hat)) * omega_hat; 
    dot_x(4)   = -.5 * epsilon_hat' * omega_hat;
end

