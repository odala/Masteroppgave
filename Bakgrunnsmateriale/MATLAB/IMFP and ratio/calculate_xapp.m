function [ xapp ] = calculate_xapp( d, theta, x, IMFP1, IMFP2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    xapp = 2.*(1 - (1-x).*exp(-d./(IMFP1.*cos(theta)))) ./ (2 - (1-x).*exp(-d./(IMFP1.*cos(theta))) + (1-x).*exp(-d./(IMFP2.*cos(theta))));

end