function [ fig ] = myPlot( x, y, xlab, ylab)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    fig = figure;
    plot(x, y, 'b-')
    xlabel(xlab, 'Interpreter', 'Latex')
    ylabel(ylab, 'Interpreter', 'Latex')
    axis( [0.0, max(x), 0.0, ceil(10*max(y))/10 ] )

end