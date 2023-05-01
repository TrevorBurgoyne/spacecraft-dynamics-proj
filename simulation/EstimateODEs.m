function  [dot_x] = EstimateODEs(t,x)
%ODES  
% [dot_x] = EstimateODEs(t,x) returns x_dot = f(x,t) by
% specifying the differential equations of the system in first-order form.
% Attitude estimate is by default performed using the TRIAD algorithm and 
% simulated sensor data from an Earth Horizon Sensor and Magnetometer.
% Inertial navigation can instead be used instead if commented back in. 
% The Angular velocity is estimated using a Rate Gyro.
%
% INPUT PARAMETERS:
% x = [r, v, epsilon, eta, omega, epsilon_hat, eta_hat]'
% t = time
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

% Form dot_x = f(x,u) system.
dot_x = zeros(4,1);

% Get omega estimate using Rate Gyro
omega     = x(11:13);
omega_hat = RateGyroNoisy(omega,t);

% Get values
r_a  = x(1:3);                   % r in the inertial frame
q_ba = x(7:10);                  % quaternion relating frames b and a
C_ba  = Quaternion2DCM(q_ba);    % DCM relating frames b and a

% TRIAD attitude determination
% True values s1_a (Earth Horizon) and s2_a (Magnetometer)
s1_a = -r_a;
s2_a = EarthMagField(r_a,t);

% Sensor Readings s1_b (Earth Horizon) and s2_b (Magnetometer)
s1_b = EarthSensorNoisy(r_a,C_ba,t);
s2_b = MagnetometerNoisy(r_a,C_ba,t);

C_TRIAD = TRIAD(s1_a,s2_a,s1_b,s2_b); % TRIAD DCM estimate
q_TRIAD = DCM2Quaternion(C_TRIAD);    % TRIAD Quaternion estimate

q_hat = x(14:17);                     % Estimated quaternion
epsilon_hat = x(14:16);               % Estimated epsilon
eta_hat     = x(17);                  % Estimated eta

T         = [
    eta_hat*eye(3)-crossm(epsilon_hat), -epsilon_hat
    epsilon_hat',                       eta_hat
];
q_err       = T*q_TRIAD; 
epsilon_err = q_err(1:3);
eta_err     = q_err(4);

% Complementary filter
dot_x(1:4) = GammaQuaternion(q_hat)*(omega_hat + C.ke*eta_err*epsilon_err);
    
% % Inertial navigation
% % First, extract states in a convenient form.
% q_hat = x(14:17); 
% dot_x(1:4) = GammaQuaternion(q_hat)*omega_hat;



