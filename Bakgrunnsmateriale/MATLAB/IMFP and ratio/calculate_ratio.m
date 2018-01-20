function [ R ] = calculate_ratio( d, theta, a_A, a_B, IMFP_AA, IMFP_BA, IMFP_BB )
% Simple model for calculating the ratio of A to B signals.
%   A thin abrupt uniform overlayer A on a B substrate.
%   Input:    d the thickness of overlayer A on B [�]
%             theta [rad]
%             a_A the characteristic atom size of A [�]
%             a_B the characteristic atom size of B [�]
%             IMFP_AA the inealstic mean free path of A in A [�]
%             IMFP_BA the inealstic mean free path of B in A [�]
%             IMFP_BB the inealstic mean free path of B in B [�]
%   Output:   R the ratio of A to B signals.

R = (a_B./a_A).^3 .* IMFP_AA./IMFP_BB .* (1 - exp(-d./(IMFP_AA.*cos(theta)))) ./ (exp(-d./(IMFP_BA.*cos(theta))));

end