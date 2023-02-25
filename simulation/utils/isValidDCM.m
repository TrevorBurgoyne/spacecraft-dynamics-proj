function [bool] = isValidDCM(C, throwException)
% Check if the input is a valid DCM, and throw an execption if it isn't.
% USAGE:
% isValidDCM(C, throwException);
%
% INPUT PARAMETERS:
% C              = DCM. A 3x3 matrix of doubles 
% throwException = (optional) boolean flag. true if an exception should be thrown.
%
% OUTPUT PARAMETERS:
% bool = boolean (truthy). true when q is a valid DCM, false otherwise.
%
% Trevor Burgoyne
% Updated Feb 2023

% Check args
if nargin < 2
  throwException = true; % Throw an exception by default
end

bool = false; % assume false until proven

% Ensure proper Quaternion dimensions
if size(C) == [3 3]
    % TODO: Other checks?
    bool = true;
elseif throwException
    throw(MException("utils:InvalidDimension","DCM must be a 3x3 matrix."))
end