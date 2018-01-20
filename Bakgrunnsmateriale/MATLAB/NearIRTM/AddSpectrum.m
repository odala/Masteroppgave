function AddSpectrum( hAxesTarget, wavelength )
%AddSpectrum   Add a spectrum to the X-Axis of a plot.
%    NB: This has to be the last thing that is done to the figure.
%    Inputs: 
%       hAxesTarget - handle to the figure axes
%       wavelength - array of wavelengths in nm
%
%    H = SPECTRUMLABEL(HTARGET, WAVELENGTH) adds a spectrum colorbar and 
%    wavelength labels to the X axis of the axes object HTARGET.  For 
%    plots whose X values are in the range 300 to 830, the colorbar will 
%    show the ROYGBIV spectrum based on the 1964 CIE 10-degree observer.  
%    Values outside the range will be shown as black.  H contains a handle 
%    to the axes object containing the spectrum.
%
%    Examples:
%    ---------
%    % Show the D65 illuminant.
%    wavelength = (0.0:1.0:2000);
%    planck = @(lambda) (2.*c)./((lambda.^4).*(exp((h.*c)./(k.*T.*lambda))-1));
%    figure;
%    plot(wavelength, planck(wavelength))
%    title('Black body radiation')
%    spectrumLabel(gca)

%    Author: Oda Lauten
%    Time: 2017.02.23 10.11

hFig = ancestor(hAxesTarget, 'figure');

% Add a new axes to the same figure as the target axes.
figure(hFig);
hAxesSpectrum = axes;

% Position the axes as appropriate.
targetPosition = get(hAxesTarget, 'position');
spectrumPosition = [targetPosition(1), ...
                    targetPosition(2), targetPosition(3), 1];
set(hAxesSpectrum, 'position', spectrumPosition)
set(hAxesSpectrum, 'units', 'pixels')
spectrumPosition = get(hAxesSpectrum, 'position');
set(hAxesSpectrum, 'position', [spectrumPosition(1), ...
                                spectrumPosition(4) - 20, ...
                                spectrumPosition(3), ...
                                20])

% Calculate the RGBvalues and display the spectrum.
RGB = spectrumRGB(wavelength);
axes(hAxesSpectrum);
image(wavelength, 1:size(RGB,1), RGB);

% Turn off the unneeded axes labels.
set(hAxesSpectrum, 'xtick', []); set(hAxesSpectrum, 'ytick', []);

end

