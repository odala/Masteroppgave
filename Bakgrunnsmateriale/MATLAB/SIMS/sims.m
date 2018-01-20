clear all;
%------------------------------------------------------------------------%
case1 = 'w3'; case2 = 'w4'; run = case2;

% Set names in legend. Empty string ('') ignores the values in that column.
legendName1 = {'Na', 'Al', 'Si', 'K', '', ''};  % {'Na', 'Al', 'Si', 'K', 'Te(raw ion counts)', 'Pb'}
legendName2 = {'Fe', '', '', ''};               % {'Fe', 'Ni', 'Cu', 'Te(raw ion counts)'}

% Set name of files.
if strcmp(run, case1)
    filename1 = 'C0HVJ476a07-NaAlSiKPb_LPE422ann-w3.xls';
    filename2 = 'C0HVJ476a06-FeNiCu_LPE422ann-w3.xls';
    detectionLimit1 = [2e13 2e12 4e15 8e12 -1 2e13];
    detectionLimit2 = [5e13 1e14 2e14 -1];
    figurename = 'sims_lpe422_w3.png';
elseif strcmp(run, case2)
    filename1 = 'C0HVJ476a12-NaAlSiKPb_LPE422ann-w4.xls';
    filename2 = 'C0HVJ476a13-FeNiCu_LPE422ann-w4.xls';
    detectionLimit1 = [1e13 2e12 4e15 8e12 -1 2e13];
    detectionLimit2 = [5e13 1e14 2e14 -1];
    figurename = 'sims_lpe422_w4.png';
end

%----- Plot data from file ----------------------------------------------%
fh = figure('Position', [100, 100, 800, 450]);
plotSims(filename1, legendName1, detectionLimit1);
plotSims(filename2, legendName2, detectionLimit2);

%----- Configure plot ---------------------------------------------------%
lh = legend('show');
%axis([1e12 1e18])
xlabel('Depth [$\mu$m]','FontSize',14)
ylabel('Concentration [atoms cm$^{-3}$]','FontSize',14)
set(0,...
    'DefaultTextInterpreter', 'latex')
set(gca,...
    'FontSize',14, ...
    'TickLabelInterpreter','latex')
set(lh,...
    'fontsize',14,...
    'Interpreter','latex',...
    'Orientation', 'horizontal',...
    'Location', 'north')
set(fh, ...
    'color', 'white');

%----- Save figure ------------------------------------------------------%
barefigur(fh, figurename);
%------------------------------------------------------------------------%