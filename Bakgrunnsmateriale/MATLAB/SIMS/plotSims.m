function plotSims( filename, legendNames, detectionLimit)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%----- Reading from Excel -----------------------------------------------%
data = xlsread(filename, 'Processed data','A2:L240');

%----- Set plot colors --------------------------------------------------%
co = [  0.0000    0.4470    0.7410; 0.0000    0.4470    0.7410;
        0.8500    0.3250    0.0980; 0.8500    0.3250    0.0980;
        0.9290    0.6940    0.1250; 0.9290    0.6940    0.1250;
        0.4940    0.1840    0.5560; 0.4940    0.1840    0.5560;
        0.4660    0.6740    0.1880; 0.4660    0.6740    0.1880;
        0.3010    0.7450    0.9330; 0.3010    0.7450    0.9330;
        0.6350    0.0780    0.1840; 0.6350    0.0780    0.1840];
set(groot,'defaultAxesColorOrder',co)

%----- Plot concetrations -----------------------------------------------%
xmin = 1000; xmax = -1000; ymin = 1e12; ymax = 1e19;
for i=1:size(data,2)/2
    if isempty(legendNames{i})
        continue;
    end %if
    semilogy(data(:,2*i-1), data(:,2*i), ...
        'LineWidth', 1.5, ...
        'DisplayName', legendNames{i})
    hold on
    semilogy(data(:,2*i-1), detectionLimit(i).*ones(length(data(:,2*i-1)),1),...
        'LineStyle', '--',...
        'LineWidth', 1.5, ...
        'HandleVisibility','off');
    xmin = min(min(data(:,2*i-1)), xmin);
    xmax = max(max(data(:,2*i-1)), xmax);
end %for
axis([floor(xmin) ceil(xmax) ymin ymax]);
%------------------------------------------------------------------------%
end

