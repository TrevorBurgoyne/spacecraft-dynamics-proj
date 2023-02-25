%% Post processing script.
% Created by James Richard Forbes
% Edited by Ryan James Caverly, Trevor Burgoye
% Updated 3 Mar 2023

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% Pull data from global vars
x     = x_out(:,1:3);
x_dot = x_out(:,4:6);


% Here is where you do post processing. 
% For instance, when all forces are conservative, energy should be 
% conserved. So, let's compute the energy, E = T + V + J2.

v = vecnorm(x_dot,2,2); % Magnitude of xdot at each time tick
r = vecnorm(x,2,2);     % Magnitude of x at each time tick

T  = .5*C.ms*(v.^2);     % KE at each time tick
V  = -(C.mu*C.ms)./r;    % PE at each time tick

% J2 PE Correction
J2 = ((C.mu*C.ms*C.J2*C.Re^2)./(r.^3)).*( (3./(2*r.^2)).*(x(:,3).^2) -.5 );

E = T + V + J2;
