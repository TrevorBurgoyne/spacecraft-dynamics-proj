function [q_ba] = DCM2Quaternion(Cba, tolerance)
% Convert a DCM to its quaternion parameterization.
% USAGE:
% [q_ba] = DCM2Quaternion(Cba)
%
% INPUT PARAMETERS:
% Cba       = DCM. A 3x3 array of doubles 
% tolerance = (optional) numerical tolerance. Default 1e-12.
%
% OUTPUT PARAMETERS:
% q_ba = Quaternion. A 4x1 column matrix of doubles
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

% Compute eta using equation 1.35 from [1]
% Note that both positive/negative eta will correspond to the same
% rotation. Here the positive value is used.
eta = .5*sqrt(trace(Cba) + 1);

if (~isreal(eta))
    throw(MException("utils:NotReal","Computed eta value is not a real number."))
elseif (abs(eta) <= tolerance)
    warning("eta detected as 0, using modified quaternion calculation."))
    % When eta is 0, use equation 1.38 from [1]
    % Note that the signs can be switched around as shown in [1].
    % Here we choose the solution where abs(epsilon(1)) > 0
    epsilon = [...
        sqrt( .5*( Cba(1,1) - 1 ) );...
        sign(Cba(1,2))*sqrt( .5*( Cba(2,2) - 1 ) );...
        sign(Cba(1,3))*sqrt( .5*( Cba(3,3) - 1 ) );...
    ];
else
    % When eta is nonzero, use equation 1.37 from [1]
    epsilon = [...
        Cba(2,3) - Cba(3,2);...
        Cba(3,1) - Cba(1,3);...
        Cba(1,2) - Cba(2,1);...
    ]./(4*eta);
end

% Create quaternion by stacking epsilon on top of eta
q_ba = [epsilon; eta];