function [ material ] = readParametersFromFile( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [ fileID, errmsg ] = fopen(filename, 'rt');
    if fileID == -1
        fprintf('ERROR: %s.', errmsg);
    end
    tmp = textscan(fileID, '%s %f');
    fclose(fileID);
    param = tmp{2};
    Nv = param(1);
    M = param(2);
    rho = param(3);
    Eg = param(4);
    
    material = struct('Nv', Nv, 'M', M, 'rho', rho, 'Eg', Eg);
    
end

