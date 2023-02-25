%% Post processing script.
% Created by James Richard Forbes
% Edited by Ryan James Caverly, Trevor Burgoye
% Updated 3 Mar 2023

addpath utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% Pull data from global vars
x     = x_out(:,1:3);
x_dot = x_out(:,4:6);


% Here is where you do post processing. 
% For instance, when all forces are conservative, energy should be 
% conserved. So, let's compute the energy, E = T + V.

T = .5*C.ms*(vecnorm(x_dot,2,2).^2); % KE at each time tick
V = -(C.mu*C.ms)./vecnorm(x,2,2);    % PE at each time tick

E = T + V;
