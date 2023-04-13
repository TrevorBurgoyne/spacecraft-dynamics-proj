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
% Updated 13 Apr 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First, extract states in a convenient form. 
translational = x(1:6);   % [r, v]'
rotational    = x(7:13);  % [epsilon, eta, omega]'
estimate      = x(14:17); % [epsilon_hat, eta_hat]', attitude estimate quaternion

% Gravity Gradient Torque
r_a  = x(1:3);                   % r in the inertial frame
q_ba = x(7:10);                  % quaternion relating frames b and a
Cba  = Quaternion2DCM(q_ba);     % DCM relating frames b and a
r_b  = Cba*r_a;                  % r resolved in frame b
r    = norm(r_b);                % Magnitude of r
torque = (3*C.mu*r^-5)*crossm(r_b)*C.I*r_b;

% Get true omega for INS estimate
omega = x(11:13);

% Form dot_x = f(x,u) system.
dot_x        = zeros(13,1);
dot_x(1:6)   = TranslationalODEs(t,translational); 
dot_x(7:13)  = RotationalODEs(t,rotational,torque);
dot_x(14:17) = EstimateODEs(t,estimate,omega);

