function plotSpectra( T, k, substrate, filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% --- Set font size for images.
fontSize = 30;

% --- Initialise parameters.
fig = figure('Position', [0, 0, 1400, 950],'visible', 'off');
colors = distinguishable_colors(size(T, 1));

% --- Plot all the spectra with unique color.
for r = 1:size(T, 1)
    for c = 1:size(T, 2)
        colorNumber = r;
        constant = c/size(T,2);
        color = colors(colorNumber,1:3)*constant;
        plot(k, squeeze(T(r, c, :)), 'Color', color, 'LineWidth', 1.5);
        hold on
    end
end

% Set grid on.
grid on;

% Set x-range.
xlim([min(k) max(k)]); %ylim([45 85]); ylim([60 68]);
set(gca,'Xtick',ceil(min(k)/1000)*1000:1000:floor(max(k)/1000)*1000)
set(gca,'XMinorTick','on')

% Set y-range.
if strcmp(substrate.type, 'mct')
    ylim([0 70]);
else
    ylim([0 70]);
end %if

% Set labels.
xlabel('Wavenumber $k$ (cm$^{-1}$)')
ylabel('Transmittance $T$ (\%)')
set(0,...
    'DefaultTextInterpreter', 'latex', ...
    'DefaultAxesFontSize', fontSize)
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')

% Save figure.
set(gca,'LooseInset',get(gca,'TightInset'))
saveas(fig, filename)

end

