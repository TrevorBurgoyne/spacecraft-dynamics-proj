function [s_ba] = SmatrixQuaternion(q)
% Compute the s_ba for a quaternion such that omega_ba = s_ba*q_dot.
% USAGE:
% [s_ba] = SmatrixQuaternion(q)
%
% INPUT PARAMETERS:
% q = quaternion. A 4x1 column matrix of doubles 
%
% OUTPUT PARAMETERS:
% s_ba = S matrix. A 3x4 matrix of doubles such that omega_ba = s_ba*q_dot
%
% Trevor Burgoyne
% Updated Feb 2023
%
% References:
% [1] A. H. J. de Ruiter, C. J. Damaren, and J. R. Forbes, Spacecraft 
% Dynamics and Control: An Introduction. 
% West Sussex, UK: John Wiley & Sons, Ltd., 2013.

% Ensure proper Quaternion dimensions
if size(q) ~= [4 1]
    throw(MException("utils:InvalidDimension","Quaternion input must be a 4x1 matrix."))
end

% Extract column matrix and scalar part of quaternion
[epsilon, eta] = DecomposeQuaternion(q);

% Use equation 1.67 from [1], factoring out [epsilon_dot; eta_dot]
% to leave just what we'll call s_ba
s_ba = [2*(eta*eye(3) - crossm(epsilon)) -2*epsilon];