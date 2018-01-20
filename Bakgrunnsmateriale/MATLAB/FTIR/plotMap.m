function plotMap(Z, substrate, filename )
%PLOTMAP Summary of this function goes here
%   Detailed explanation goes here
fontSize = 30;

x    = substrate.x;
y    = substrate.y;
xLen = substrate.xLen;
yLen = substrate.yLen;

fh = figure('Position', [0, 0, 880, 950], 'visible','off'); %880, 950
imagesc(x, y, rot90(Z,3)); view(-90,90); % rotate to get correct axis
xlabel('$y$ (mm)'); ylabel('$x$ (mm)');
xlim([0 xLen]); ylim([0 yLen]);
daspect([max(daspect)*[1 1] 1])
set(gca,'Xtick',0:5:xLen)
set(gca,'Ytick',0:5:yLen)

% Colorbar
c = colorbar('Location', 'northoutside', ...
    'TickLabelInterpreter', 'latex');
colormap(jet)
if strcmp(substrate.type, 'mct')
    caxis([0, 70])
else
    caxis([0, 70])
end %if
ylabel(c,'Transmittance $T$ (\%)', ...
    'Interpreter', 'latex',...
    'FontSize',fontSize)
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')
set(gca,'LooseInset',get(gca,'TightInset'))
% Adds label to colorbar (since the above one dissapear due to weird bug from above line).
str = '$T$ (\%)';
text((1+1.1/15)*yLen,-2.6/15*yLen,str,'FontSize',fontSize,'Interpreter','latex')

% Save figure.
saveas(fh, filename)
%barefigur(fig3, strcat(substrate.version, '_ftir_map.png'))

end

