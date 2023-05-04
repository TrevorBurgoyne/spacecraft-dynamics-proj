function  [dot_x] = ODEs(t,x)
%ODES  
% [dot_x] = ODEs(t,x) returns x_dot = f(x,t) by
% specifying the differential equations of the system in first-order form.
%
% INPUT PARAMETERS:
% x = [r, v, epsilon, eta, omega, epsilon_hat, eta_hat]'
% t = time
%
% OUTPUT PARAMETERS:
% dot_x = [v, v_dot, epsilon_dot, eta_dot, omega_dot, epsilon_hat_dot, eta_hat_dot]'
% the first-order differential equation evaluated at x and t
%
% Ryan Caverly, Trevor Burgoyne
% Updated 1 May 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First, extract states in a convenient form. 
translational = x(1:6);   % [r, v]'
rotational    = x(7:13);  % [epsilon, eta, omega]'
% estimate      = x(14:17); % [epsilon_hat, eta_hat]', attitude estimate quaternion

% Gravity Gradient Torque
r_a  = x(1:3);                   % r in the inertial frame
q_ba = x(7:10);                  % quaternion relating frames b and a
C_ba  = Quaternion2DCM(q_ba);    % DCM relating frames b and a
r_b  = C_ba*r_a;                 % r resolved in frame b
r    = norm(r_b);                % Magnitude of r
torque_gg = (3*C.mu*r^-5)*crossm(r_b)*C.I*r_b;

torque_c = 0; % initialize
torque_m = 0; % initialize
omega    = x(11:13);  % True angular velocity

% Control Torque using PD Control and TRUE values
epsilon = x(7:9);    % True epsilon
torque_c = -C.kp*epsilon - C.kd*omega;

% % Control Torque using PD Control and ESTIMATE values
% TRIAD attitude determination
% True values s1_a (Earth Horizon) and s2_a (Magnetometer)
% s1_a = -r_a;
% s2_a = EarthMagField(r_a,t);
% 
% % Sensor Readings s1_b (Earth Horizon) and s2_b (Magnetometer)
% s1_b = EarthSensorNoisy(r_a,C_ba,t);
% s2_b = MagnetometerNoisy(r_a,C_ba,t);
% 
% C_hat = TRIAD(s1_a,s2_a,s1_b,s2_b);   % TRIAD DCM estimate
% q_hat = DCM2Quaternion(C_hat);        % Quaternion estimate
% epsilon_hat = q_hat(1:3);             % Estimated epsilon
% omega_hat   = RateGyroNoisy(omega,t); % Estimated angular velocity
% 
% torque_c = -C.kp*epsilon_hat - C.kd*omega_hat;

% % OPTION (A): Quaternion PD Attitude Tracking Control
% q_err       = C.T*q_ba;   % C.T is constant, a function of C.q_d
% epsilon_err = q_err(1:3); % True epsilon error
% torque_c = -C.kp*epsilon_err - C.kd*omega;

% OPTION (C): Magnetic Torquer
gamma = x(14:16); % Rxn wheel speeds
b_a = EarthMagField(r_a,t);
b_b = C_ba*b_a;
m_b = -C.kh*C.Is*inv(b_b'*b_b)*crossm(b_b)*(gamma - C.gamma_d);
torque_m = -crossm(b_b)*m_b;

% Combine torques
torque = torque_gg + torque_c + torque_m;

% Form dot_x = f(x,u) system.
dot_x        = zeros(length(x),1);
dot_x(1:6)   = TranslationalODEs(t,translational); 
dot_x(7:13)  = RotationalODEs(t,rotational,torque);
% dot_x(14:17) = EstimateODEs(t,x);
% dot_x(14:17) = zeros(4,1);

% OPTION (C): PD Attitude Control with Reaction Wheels
dot_x(14:16) = -torque_c / C.Is; % Rxn wheel acceleration, rad/s^2
