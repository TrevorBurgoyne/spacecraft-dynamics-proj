function [gamma_ba] = GammaQuaternion(q)
% Compute gamma_ba for a quaternion such that gamma_ba*omega_ba = q_dot.
% USAGE:
% [gamma_ba] = GammaQuaternion(q)
%
% INPUT PARAMETERS:
% q = quaternion. A 4x1 column matrix of doubles 
%
% OUTPUT PARAMETERS:
% gamma_ba = Gamma. 4x3 matrix of doubles such that gamma_ba*omega_ba = q_dot
%
% Trevor Burgoyne
% Updated Feb 2023
%
% References:
% [1] A. H. J. de Ruiter, C. J. Damaren, and J. R. Forbes, Spacecraft 
% Dynamics and Control: An Introduction. 
% West Sussex, UK: John Wiley & Sons, Ltd., 2013.

% Ensure proper Quaternion dimensions
isValidQuaternion(q);

% Extract column matrix and scalar part of quaternion
[epsilon, eta] = DecomposeQuaternion(q);

% Stack the two expressions of equation 1.68 from [1]
gamma_ba = .5*[eta*eye(3) + crossm(epsilon); -epsilon'];