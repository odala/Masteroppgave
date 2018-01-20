%------------------------------------------------------------------------%
clear all;
% ---------------------------------------------------------------------- %
% --- Select which substrate you want to investigate. ------------------ %
% ---------------------------------------------------------------------- %

% Which substrate do you want to investigate?
name = 'CMT801'; % 'Ba', 'Ca', 'Ab', 'Bb', 'B2b', 'Cb', 'LPE453', 'LPE454', 'CMT801'
type = 1;  % have 1 for polishing grit except for substrate Ba (1 for voids, 2 for microvoids)

% Linear or logarithmic scale? (lin/log)
scale = 'log';
if strcmp(name, 'Ba') || strcmp(name, 'Bb') || strcmp(name, 'B2b')
    cLocation = 'northoutside';
else
    cLocation = 'eastoutside'; % 'eastoutside' or 'northoutside'
end %if

% ---------------------------------------------------------------------- %
% --- Do not change anything below this line. -------------------------- %
% ---------------------------------------------------------------------- %

fontSize = 30;

filename = 'densityData';
if strcmp('LPE453', name) || strcmp('LPE454', name)
    fprintf('\nFilm %s:\n', name)
    tabname = strcat(name);
    cLow = 1e+03; cHigh = 1e+05;
elseif strcmp('CMT801', name)
    fprintf('\nFilm %s:\n', name)
    tabname = strcat(name);
    cLow = 1e+04; cHigh = 1.06e+06;
elseif strcmp('Ba', name)
    fprintf('\nVoids på substrat %s:\n', name)
    tabname = strcat('sub', name);
    cLow = 1e+03; cHigh = 2e+04;
else
    fprintf('\nSubstrate %s:\n', name)
    tabname = strcat('sub', name);
    cLow = 2.21e+05; cHigh = 6.11e+07;
end %if
cLowLog = log10(cLow); cHighLog = log10(cHigh);

%tabname  = 'subCa';  % [2.42e+06, 9.88e+07], mean: 4.36e+07 +- 2.41e+07
%tabname  = 'subAb';  % [2.20e+06, 2.88e+07], mean: 7.30e+06 +- 6.84e+06
%tabname  = 'subBb';  % [4.84e+06, 4.82e+07], mean: 2.24e+07 +- 9.28e+06


% --- Read data from Excel ----------------------------------------------%
[x, y, sz, xMax, yMax, szMax] = readFromExcel(filename, tabname, type);

% --- Print maximum, minimum, mean, and standard deviation --------------%
printMaxMinMeanStd(sz);

% --- Plot data from file -----------------------------------------------%
if strcmp(cLocation, 'northoutside')
    fh = figure('Position', [0, 0, 880, 960],'visible','off'); 
else
    fh = figure('Position', [0, 0, 960, 880],'visible','off'); % East outside
end %if
%sizeVector = sz./szMax*1e3
sizeScalar = 1000;
size = sizeScalar;
if strcmp(scale, 'log')
    for i=1:length(x)
        if ~isnan(sz(i))
            scatter(x(i),y(i), size, log10(sz(i)), 'filled', ...
                'LineWidth',1.0, ...
                'MarkerFaceAlpha', 1.0);
            hold on
        end %if
        
    end %for
else
    for i=1:length(x)
        if isnan(sz(i))
            scatter(x(i),y(i), 0, 'k', 'filled', ...
            'LineWidth',1.0, ...
            'MarkerFaceAlpha', 1.0);
        else
        scatter(x(i),y(i), size, sz(i), 'filled', ...
            'LineWidth',1.0, ...
            'MarkerFaceAlpha', 1.0);
        end %if
        hold on
    end %for
end

%----- Configure plot ---------------------------------------------------%

% Set colorbar axis.
if strcmp(scale, 'log')
    cTicks = linspace(ceil(cLowLog), floor(cHighLog), floor(cHighLog) - ceil(cLowLog) + 1);
    cTickLabel = cell(length(cTicks));
    for i = 1:length(cTicks)
        cTickLabel{i} = strcat('$1$e$', num2str(cTicks(i)), '$');
    end
    c = colorbar('Location', cLocation, ...
        'TickLabelInterpreter', 'latex', ...
        'Ticks', cTicks,...
        'YTickLabel', cTickLabel);
    caxis([cLowLog cHighLog])
else
    c = colorbar('Location', cLocation, ...
    'TickLabelInterpreter', 'latex');
    caxis([cLow cHigh])
end
colormap(jet)

% Set axis limits.
grid on;
axis([ 0 xMax 0 yMax ]);
daspect([max(daspect)*[1 1] 1])
set(gca,'Xtick',0:5:xMax)
set(gca,'Ytick',0:5:yMax)

% Set labels on axis.
xlabel('$x$ [mm]')
ylabel('$y$ [mm]')
ylabel(c,'Density [cm$^{-2}$]', ...
    'Interpreter', 'latex',...
    'FontSize',fontSize)

% Set Latex font.
set(0,...
    'DefaultTextInterpreter', 'latex', ...
    'DefaultAxesFontSize', fontSize)
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')

% Set background color.
set(fh, ...
    'color', 'white');

%----- Save figure ------------------------------------------------------%
saveas(fh, strcat('fig\', tabname, '_', filename, '.png'));
%------------------------------------------------------------------------%
