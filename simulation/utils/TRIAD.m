function [C_ba] = TRIAD(s1_a,s2_a,s1_b,s2_b)
% Estimate C_ba using the TRIAD algorithm.
% USAGE:
% [C_ba] = TRIAD(s1_a,s2_a,s1_b,s2_b)
%
% INPUT PARAMETERS:
% s1_a       = sensor one vector in frame a. A 3x1 array of doubles 
% s2_a       = sensor two vector in frame a. A 3x1 array of doubles
% s1_b       = sensor one vector in frame b. A 3x1 array of doubles 
% s2_b       = sensor two vector in frame b. A 3x1 array of doubles
%
% OUTPUT PARAMETERS:
% C_ba = DCM estimate. A 3x3 matrix of doubles.
%
% Trevor Burgoyne
% Updated Apr 2023
%

%% Define an arbitrary frame w

% w1 axis is the first sensor reading
w1_a = s1_a/norm(s1_a);
w1_b = s1_b/norm(s1_b);

% w2 axis is the cross product of the two sensor readings
w2_a = crossm(s1_a)*s2_a;
w2_b = crossm(s1_b)*s2_b;
% ...normalized
w2_a = w2_a/norm(w2_a);
w2_b = w2_b/norm(w2_b);

% w3 axis is the cross of w1 and w2
w3_a = crossm(w1_a)*w2_a;
w3_b = crossm(w1_b)*w2_b;

% C_ba is the product of C_bw and C_wa, which simplifies
% down to the product of w_b * w_a
C_ba = [w1_b'; w2_b'; w3_b';]'*[w1_a'; w2_a'; w3_a';];