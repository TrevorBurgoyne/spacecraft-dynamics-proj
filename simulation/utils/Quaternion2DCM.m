function [Cba] = Quaternion2DCM(q_ba)
%QUATERNION2DCM  Quaternion to DCM conversion.
% [Cba] = QUATERNION2DCM(q_ba) solves for the DCM based on the quaternion 
% using expression on p. 25 of de Ruiter (2013).
%
% INPUT PARAMETERS:
% q_ba = 4x1 column matrix containing quaternion parameters
%
% OUTPUT PARAMETERS:
% Cba = 3x3 DCM calculated from q
%
% Ryan Caverly, Trevor Burgoyne
% Updated Feburary 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extract column matrix and scalar part of quaternion
[epsilon_ba, eta_ba] = DecomposeQuaternion(q_ba);

Cba = (2*eta_ba^2-1)*eye(3) + 2*epsilon_ba*epsilon_ba' - 2*eta_ba*crossm(epsilon_ba);