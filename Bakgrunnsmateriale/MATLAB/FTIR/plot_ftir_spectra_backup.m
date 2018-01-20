clear;
addpath('M:\Masteroppgave\Matlab\generic')

% ---------------------------------------------------------------------- %
% --- Choose which substrate to look at. ------------------------------- %
% ---------------------------------------------------------------------- %

% --- Select which substrate you want to investigate
name = 'CMT801'; % 'A', 'B' ('B36'), or 'C', 'LPE453', 'LPE454', 'CMT801'

% --- Select which wavenumber you want to map.
k_map = [500 1000 4000];

% --- Select if you want to plot the IR-indicator (Yujie, 2004).
doPlotIRIndicator = false;

% --- Select if you want to plot the average transmittance with standard
%     deviation in each point.
doPlotAverage     = false;

% --- Select between which k you want to do calculations on (to avoid bad data).
if strcmp('LPE453', name) || strcmp('LPE454', name) || strcmp('CMT801', name)
    kLow = 430; kHigh = 2500;
else
    kLow = 430; kHigh = 4300;
end %if

% ---------------------------------------------------------------------- %
% --- Do not change anything below this line. -------------------------- %
% ---------------------------------------------------------------------- %

% --- Get the information about the substrate.
substrate = getSubstrateInfo(name);

% --- Print the substrate version.
fprintf('\nLooking at: %s.\n', substrate.version)

% --- Read data from file.
[T, k] = getTransmissionMatrix(substrate);

% --- Plot the FTIR-spectra.
filename = strcat('fig/', substrate.version, '_ftir_spectra.png');
indexFirst = getIndexAtWavenumber(kHigh, k(1)); 
indexLast = getIndexAtWavenumber(kLow, k(1));
plotSpectra(T(:,:,indexFirst:indexLast), k(indexFirst:indexLast), substrate, filename);

% --- Calculate average and standard deviation.
TCentre = T(:,:,indexFirst:indexLast);
TAVG = mean(TCentre,3);
TSTD = std(TCentre, 0, 3);
fprintf('\nMax = %.2f.\nMin = %.2f.\n', max(max(max(TCentre))), min(min(min(TCentre))));

% --- Map of the T at the selected k-value for all the measurement points.
for i = 1:length(k_map)
    TK = T(:,:,getIndexAtWavenumber(k_map(i), k(1)));
    filename = strcat('fig/', substrate.version, '_ftir_transmission_at_k', int2str(k_map(i)), 'cm-1.png');
    plotMap( TK, substrate, filename )
    filename = strcat('fig/', substrate.version, '_ftir_transmission_at_k', int2str(k_map(i)), 'cm-1_contour.png');
    %plotContour( substrate.x, substrate.y, TAVG, substrate.xLen, substrate.yLen, filename)
end %for

% --- Contour of the T at the selected k-value for all the measurement points.
%[X,Y] = meshgrid(substrate.x,substrate.y);
%figure
%contourf(X,flip(Y,1),TK, 'ShowText','on')
%axis equal
%xlim([0 substrate.xLen]); ylim([0 substrate.yLen]);

if doPlotAverage
    % --- Plot the average T for all the measurement points.
    filename = strcat('fig/', substrate.version, '_ftir_Tavg.png');
    plotAvgAndStd(TAVG, TSTD, filename )
    
    % --- Map of average transmission data.
    filename = strcat('fig/', substrate.version, '_ftir_transmission_at_k', int2str(kLow), '-', int2str(kHigh), 'cm-1.png');
    plotMap( TAVG, substrate, filename )
end %if

% --- Plot T1000, T5000, and T1000/T5000 for all the measurement points.
if doPlotIRIndicator
    filename = strcat('fig/', substrate.version, '_ftir_T1000_T5000.png');
    plotIRTIndicator(T, k(1), filename)  
end %if
