function [ output_args ] = plotAvgAndStd( AVG, STD, filename )
%PLOTAVGANDSTD Plot the average with standard deviation.
%   Detailed explanation goes here


fh = figure('visible', 'off');
fontSize = 14;
avg = vec2mat(flip(AVG ,1), 1);
std = vec2mat(flip(STD ,1), 1);
x = 1:numel(avg);
errorbar(x, avg, std, '-o','MarkerSize',3,...
    'MarkerEdgeColor','red','MarkerFaceColor','red')
ylabel('Average transmittance $T_{\mathrm{avg}} (\%)$')
xlabel('Measurement number')
xlim([min(x), max(x)])
grid on;
set(0,...
    'DefaultTextInterpreter', 'latex', ...
    'DefaultAxesFontSize', fontSize)
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')
barefigur(fh, filename)

end

