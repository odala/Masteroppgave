function [ nameE, E ] = readEnergiesFromFile( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [ fileID, errmsg ] = fopen(filename, 'rt');
    if fileID == -1
        fprintf('ERROR: %s', errmsg);
    end
    tmp = textscan(fileID, '%s %f');
    fclose(fileID);
    nameE = tmp{1};
    E     = tmp{2};
    
end

