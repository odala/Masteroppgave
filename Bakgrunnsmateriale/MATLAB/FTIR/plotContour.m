function plotContour( x, y, Z, xLen, yLen, filename )
%PLOTMAP Summary of this function goes here
%   Detailed explanation goes here

fh = figure('visible','off');
fontSize = 14;
[ X, Y ] = meshgrid(x, y);
surf(X,Y,Z)
view(2)
%contourf(x, y, rot90(rot90(Z,3),3)); %view(-90,90); % rotate to get correct axis
xlabel('$x$'); ylabel('$y$');
xlim([0 xLen]); ylim([0 yLen]);
daspect([max(daspect)*[1 1] 1])
set(gca,'Xtick',0:5:xLen)
set(gca,'Ytick',0:5:yLen)

c = colorbar('TickLabelInterpreter', 'latex');
colormap(jet)
caxis([0, 70])
ylabel(c,'Transmittance $T$ (\%)', ...
    'Interpreter', 'latex',...
    'FontSize',fontSize)
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')
%set(gca,'LooseInset',get(gca,'TightInset'))
saveas(fh, filename)
%barefigur(fig3, strcat(substrate.version, '_ftir_map.png'))


end

