function [bool] = isValidQuaternion(q, throwException)
% Check if the input is a valid quaternion, and throw an execption if it isn't.
% USAGE:
% isValidQuaternion(q);
%
% INPUT PARAMETERS:
% q = quaternion. A 4x1 column matrix of doubles 
% throwException = (optional) boolean flag. true if an exception should be thrown.
%
% OUTPUT PARAMETERS:
% bool = boolean (truthy). true when q is a valid quaternion, false otherwise.
%
% Trevor Burgoyne
% Updated Feb 2023

% Check args
if nargin < 2
  throwException = true; % Throw an exception by default
end

bool = false; % assume false until proven

% Ensure proper Quaternion dimensions
if size(q) == [4 1]
    % TODO: Other checks?
    bool = true;
elseif throwException
    throw(MException("utils:InvalidDimension","Quaternion must be a 4x1 matrix."))
end