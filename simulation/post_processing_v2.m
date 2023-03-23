%% Post processing script.
% Created by James Richard Forbes
% Edited by Ryan James Caverly, Trevor Burgoye
% Updated 24 Mar 2023

addpath ..\simulation\utils\ % Add util functions to path
const_struct   % Extract C (constants) struct from utils\const_struct.m 

% Pull data from global vars
x       = x_out(:,1:3);
x_dot   = x_out(:,4:6);
epsilon = x_out(:,7:9)';
eta     = x_out(:,10);
omega   = x_out(:,11:13)';


% Here is where you do post processing. 
% For instance, when all forces are conservative, energy should be 
% conserved. So, let's compute the energy, E = T + V + J2.

% Rotational
n_entries = length(omega);

% Energy
T_r = zeros(n_entries,1);

% Euler Angles
yaw   = zeros(n_entries,1);
pitch = zeros(n_entries,1);
roll  = zeros(n_entries,1);

% Quaternion Norm
q_norm = zeros(n_entries,1);

% Gravity Gradient Torque
V_gg = zeros(n_entries,1);

for i=1:n_entries
    % Energy
    T_r(i) = .5*omega(:,i)'*C.I*omega(:,i);
    
    % Euler Angles
    q = [epsilon(:,i); eta(i)];
    C_ba = Quaternion2DCM(q);
    [y,p,r] = DCM2Euler321(C_ba);
    yaw(i)   = y;
    pitch(i) = p;
    roll(i)  = r;

    % Quaternion Unit Norm Check
    q_norm(i) = epsilon(:,i)'*epsilon(:,i) + eta(i)^2 - 1;
    
    % r_b
    r_b = C_ba*x(i);
    r = norm(r_b);
    
    % Gravity Gradient Torque
    V_gg(i) = (.5*C.mu*r^-3)*((3*r^-2)*crossm(r_b)'*C.I*r_b  - trace(C.I));
end

% Translational
v = vecnorm(x_dot,2,2); % Magnitude of xdot at each time tick
r = vecnorm(x,2,2);     % Magnitude of x at each time tick

T  = .5*C.ms*(v.^2);     % KE at each time tick
V_g  = -(C.mu*C.ms)./r;    % PE at each time tick

% J2 PE Correction
J2 = ((C.mu*C.ms*C.J2*C.Re^2)./(r.^3)).*( (3./(2*r.^2)).*(x(:,3).^2) -.5 );

% Total energy
E = T + T_r + V_g + J2 + V_gg;
