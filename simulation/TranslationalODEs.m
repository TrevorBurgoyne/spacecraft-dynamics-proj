function  [dot_x] = TranslationalODEs(t,x)
%ODES  
% [dot_x] = TranslationalODEs(t,x) returns x_dot = f(x,t) by
% specifying the differential equations of the system in first-order form.
%
% INPUT PARAMETERS:
% x = [x, y, z, x_dot, y_dot, z_dot]'
% t = time
%
% OUTPUT PARAMETERS:
% dot_x = [x_dot, y_dot, z_dot, x_2dot, y_2dot, z_2dot]'
% the first-order differential equation evaluated at x and t
%
% Ryan Caverly, Trevor Burgoyne
% Updated 3 Mar 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynamics

% First, extract states in a convenient form. 
r     = x(1:3); % [x, y, z]'
r_dot = x(4:6); % [x_dot, y_dot, z_dot]'

% J2 perturbation correction factor
r_mag = norm(r);
r3 = [0;0;r(3)]; % Column vector with only r(3)
J2 = ((3*C.mu*C.J2*C.Re^2)/(2*r_mag^5))*( ((5/r_mag^2)*(r(3)^2 -1))*r - 2*r3);

% Form dot_x = f(x,u) system.
dot_x      = zeros(6,1);
dot_x(1:3) = r_dot; 
dot_x(4:6) = (-C.mu / (r_mag^3))*r + J2;


