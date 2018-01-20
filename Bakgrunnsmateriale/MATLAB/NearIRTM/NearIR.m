%------------------------------------------------------------------------%
%---------Black Body Radiation-------------------------------------------%
%------------------------------------------------------------------------%

clc;
close all;
clear all;

%------------------------------------------------------------------------%
lambdaStart = 0e-9; lambdaEnd = 2150*1e-9;  % nm
lambda = (lambdaStart:1e-9:lambdaEnd); % wavelength [m]
T      = 3450;                   % temperature [K]
h      = 6.62607004e-34;         % Planck's constant [m^2 kg / s]
c      = 299792458;              % speed of light [m / s^2]
k      = 1.38064852e-23;         % Boltzmann's constant [m^2 kg / s^2 / K]

fh = figure('Position', [100, 100, 1200, 500]); 

%------------Planck's Law------------------------------------------------%

% Number of photons per second per steradian per square metre per
% wavelength. (Multiply with h.*c./lambda to get energy instead of photons.)
planck = @(lambda) (2.*c)./((lambda.^4).*(exp((h.*c)./(k.*T.*lambda))-1));

% Plot number of photons per second per wavelength!
%------------------------------------------------------------------------%
I = planck(lambda);  % J / s / m^3
%------------------------------------------------------------------------%
xFactor = 1e9; yFactor = 1e-9*1e-21;

fontSize = 20;

plot(lambda*xFactor,I*yFactor,'k', 'LineWidth', 1.5)
axis([min(lambda)*xFactor max(lambda)*xFactor 0.0 1.1*max(I)*yFactor])

%lh = legend('Wien`s Law', 'Planck`s Law');
xlabel('Wavelength [nm]','FontSize',fontSize)
ylabel('Photon radiance [s$^{-1}$sr$^{-1}$m$^{-2}$nm$^{-1}$]','FontSize',fontSize)
%title('Blackbody Radiation','fontsize',fontSize)

set(0,'DefaultTextInterpreter', 'latex')
set(gca,'FontSize',fontSize, 'TickLabelInterpreter','latex')
%set(lh,'fontsize',fontSize,'Interpreter','latex')
set(fh, 'color', 'white');

%------------------------------------------------------------------------%
lower     = 775*1e-9;    % wavelength band gap (nm)
higher    = 1125*1e-9;  % wavelength band gap (nm)
interval1 = (lower:1e-9:lambdaEnd);
interval2 = (200*1e-9:1e-9:higher);
interval3 = (lower:1e-9:higher);
%------------------------------------------------------------------------%
hold on
%area(interval2*xFactor, planck(interval2)*yFactor, ...
 %   'FaceColor', [1.0 0.0 0.0], ...
  %  'FaceAlpha', 0.2, ...
   % 'LineStyle', 'none', ...
    %'EdgeColor', [1.0 0.0 0.0]);
%area(interval1*xFactor, planck(interval1)*yFactor, ...
 %   'FaceColor', [0.0 0.0 1.0], ...
  %  'FaceAlpha', 0.2, ...
   % 'LineStyle', 'none', ...
    %'EdgeColor', [0.0 0.0 1.0]);
plot([lower*xFactor lower*xFactor], [0.0 planck(lower)*yFactor], '--k','linewidth',1.0);
plot([higher*xFactor higher*xFactor], [0.0 planck(higher)*yFactor], '--k','linewidth',0.5);
area(interval3*xFactor, planck(interval3)*yFactor, ...
    'FaceColor', [1.0 0.0 0.0], ...
    'FaceAlpha', 0.6, ...
    'LineStyle', 'none', ...
    'EdgeColor', [1.0 0.0 0.0]);
%------------------------------------------------------------------------%
AddSpectrum(gca, lambda*xFactor);
%------------------------------------------------------------------------%
saveas(fh, 'blackbody_photon_radiance.png');
%------------------------------------------------------------------------%