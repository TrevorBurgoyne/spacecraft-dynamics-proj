function  [dot_x] = RotationalODEs(t,x,torque)
%ODES  
% [dot_x] = RotationalODEs(t,x,torque) returns x_dot = f(x,t) by
% specifying the differential equations of the system in first-order form.
%
% INPUT PARAMETERS:
% x = [epsilon, eta, omega]'
% t = time
%
% OUTPUT PARAMETERS:
% dot_x = [epsilon_dot, eta_dot, omega_dot]'
% the first-order differential equation evaluated at x and t
%
% Ryan Caverly, Trevor Burgoyne
% Updated 24 Mar 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin < 3
    % Set torques as 0 if not passed in
    torque = 0;
end

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynamics

% First, extract states in a convenient form. 
epsilon = x(1:3); 
eta     = x(4);
omega   = x(5:7);

% Form dot_x = f(x,u) system.
dot_x      = zeros(7,1);
dot_x(1:3) = .5*(eta*eye(3) + crossm(epsilon)) * omega; 
dot_x(4)   = -.5 * epsilon' * omega;
dot_x(5:7) = inv(C.I) * (torque - crossm(omega)*C.I*omega);


