function [epsilon, eta] = DecomposeQuaternion(q)
% Decompose a quaternion into epsilon and eta.
% USAGE:
% [epsilon, eta] = DecomposeQuaternion(q)
%
% INPUT PARAMETERS:
% q = quaternion. A 4x1 column matrix of doubles 
%
% OUTPUT PARAMETERS:
% epsilon = 3x1 column matrix of doubles
% eta     = 1x1 double
%
% Trevor Burgoyne
% Updated Feb 2023

% Ensure proper Quaternion dimensions
isValidQuaternion(q);

% Extract column matrix and scalar part of quaternion
epsilon = [q(1);q(2);q(3)];
eta = q(4);