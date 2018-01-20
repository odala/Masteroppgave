function [ output_args ] = printMaxMinMeanStd( x )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%----- Print maximum and minimum ----------------------------------------%
fprintf('\nMinimum = %.2d\n', nanmin(x))
fprintf('Maximum = %.2d\n', nanmax(x))

%----- Print mean and std -----------------------------------------------%
fprintf('\nMean = %.2d\n', nanmean(x))
fprintf('Standard deviation = %.2d\n', nanstd(x))

end

