function [ output_args ] = plotIRTIndicator( T, kLow, filename )
%PLOTIRTINDICATOR Plot T1000, T5000, and T1000/T5000 for all the measurement points.
%   Detailed explanation goes here

fontSize = 14;

% --- Calculate the transmission at wavenumber 1000 cm-1.
T1000 = vec2mat(flip(T(:,:,getIndexAtWavenumber(1000, kLow)) ,1), 1);
    
% --- Calculate the transmission at wavenumber 5000 cm-1.
T5000 = vec2mat(flip(T(:,:,getIndexAtWavenumber(5000, kLow)) ,1), 1);
    
% --- Divide the transmission at wavenumber 1000 cm-1 with
%     that at 5000 cm-1.
T1000_T5000 =  T1000./T5000;

fig4 = figure('visible','off');
subplot(2,1,1);
Npoints = size(T,1)*size(T,2);
plot(1:Npoints, T1000, 'b')
grid on
hold on 
plot(1:Npoints, T5000, 'r')
ylabel('Transmittance $T$')
xlabel('Measurement number')
xlim([1, Npoints])
set(0,...
    'DefaultTextInterpreter', 'latex', ...
    'DefaultAxesFontSize', fontSize)
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')
subplot(2,1,2);
plot(1:Npoints, T1000_T5000)
ylabel('$T_{1000}/T_{5000}$')
xlabel('Measurement number')
xlim([1, Npoints])
grid on
set(0,...
    'DefaultTextInterpreter', 'latex', ...
    'DefaultAxesFontSize', fontSize)
set(gca,...
    'FontSize',fontSize, ...
    'TickLabelInterpreter','latex')
saveas(fig4, filename)


end

