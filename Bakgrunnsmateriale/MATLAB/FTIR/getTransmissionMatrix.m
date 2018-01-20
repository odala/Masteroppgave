function [ T, k ] = getTransmissionMatrix( substrate )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% --- Indicate where to fine the data in the files.
R1 = substrate.R1;    % rowStart
R2 = substrate.R2;  % rowEnd
C1 = 0;     % columnStart
C2 = 1;     % columnEnd

% --- Read data from file.
T  = zeros(length(substrate.x), length(substrate.y), R2-R1+1);
for n = 1:substrate.Npoints
    
    if n < 10
        number = strcat('0', int2str(n));
    else
        number = int2str(n);
    end
  
    filename = strcat(substrate.path, substrate.name, '_t', number, '_cm-1.asc');
    M = dlmread(filename, ' ', [R1 C1 R2 C2]);    % 0-index, reads only the range bounded by row offsets R1 and R2 and column offsets C1 and C2.
    k = M(:,1);
    Ttemp = M(:,2);
    
    % --- Add the transmission spectra to the transmission matrix.
    row = size(T,1)-floor((n-1)/sqrt(substrate.Npoints));
    col = n - sqrt(substrate.Npoints)*(size(T,1) - row);
    T(row,col,:) = Ttemp;
end

end

