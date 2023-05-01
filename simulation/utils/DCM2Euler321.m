function [yaw, pitch, roll] =  DCM2Euler321(Cba, tolerance)
% Convert a DCM to a 3-2-1 yaw-pitch-roll Euler angle parameterization.
% USAGE:
% [yaw, pitch, roll] =  DCM2Euler321(Cba)
%
% INPUT PARAMETERS:
% Cba       = DCM. A 3x3 array of doubles 
% tolerance = (optional) numerical tolerance. Default 1e-12.
%
% OUTPUT PARAMETERS:
% yaw   = yaw angle (psi) in rad. A 1x1 double
% pitch = pitch angle (theta) in rad. A 1x1 double
% roll  = roll angle (phi) in rad. A 1x1 double
% 
% Trevor Burgoyne
% Updated Feb 2023
%
% References:
% [1] A. H. J. de Ruiter, C. J. Damaren, and J. R. Forbes, Spacecraft 
% Dynamics and Control: An Introduction. 
% West Sussex, UK: John Wiley & Sons, Ltd., 2013.

% Check args
if nargin < 2
  tolerance = 1e-12; % Default tolerance
end

% Ensure proper DCM dimensions
if size(Cba) ~= [3 3]
    throw(MException("utils:InvalidDimension","Cba input must be a 3x3 matrix."))
end

% Catch pitch singularity
if (abs(Cba(1,1)) <= tolerance || abs(Cba(3,3)) <= tolerance)
    throw(MException(...
        "utils:KinematicSingularity",...
        "Pitch singularity detected in DCM. No unique solutions exists for roll and yaw."...
    ));
else 
    % Use angle relations derived from equation 1.30 of [1]
    pitch = -asin(Cba(1,3)); 
%     roll  = atan2(Cba(2,3),Cba(3,3));
%     yaw   = atan2(Cba(1,2),Cba(1,1));
    
    roll  = atan(Cba(2,3)/Cba(3,3));
    yaw   = atan(Cba(1,2)/Cba(1,1));
end