function substrate = getSubstrateInfo( name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

switch name
    % --- Data for substrate A - as-received.
    case 'A'
        substrate = struct( ...
            'path', 'M:\Masteroppgave\Matlab\FTIR\ftir_data\subAa\Mapping_121\', ...
            'version', 'subAa_121', ...
            'type', 'czt', ...
            'name', 'BZ1503107-1', ...
            'Npoints', 121, ... 
            'x', 2:2.6:28, ...
            'y', 2:2.6:28, ...
            'xLen', 30, ...
            'yLen', 30, ...
            'R1', 82, ...
            'R2', 4712 ...
            );
    case 'B'
        % --- Data for substrate B2 - as-received.
        substrate = struct( ...
            'path', 'M:\Masteroppgave\Matlab\FTIR\ftir_data\subBb\Mapping_121\', ...
            'version', 'subB2a_121', ...
            'type', 'czt', ...
            'name', 'C-4040-8', ...
            'Npoints', 121, ... 
            'x', 2:2.6:28, ...
            'y', 2:2.6:28, ...
            'xLen', 30, ...
            'yLen', 30, ...
            'R1', 82, ...
            'R2', 4712 ...
            );
    case 'B36'
        % --- Data for substrate B2 - as-received.
        substrate = struct( ...
            'path', 'M:\Masteroppgave\Matlab\FTIR\ftir_data\subBb\Mapping_36\', ...
            'version', 'subB2a_36', ...
            'type', 'czt', ...
            'name', 'C-4040-8', ...
            'Npoints', 36, ... 
            'x', 2:5.2:28, ...
            'y', 2:5.2:28, ...
            'xLen', 30, ...
            'yLen', 30, ...
            'R1', 82, ...
            'R2', 7512 ...
            );
    case 'C'
        % --- Data for substrate C - as-received.
        substrate = struct( ...
            'path', 'M:\Masteroppgave\Matlab\FTIR\ftir_data\subCa\Mapping_25\', ...
            'version', 'subCa_25', ...
            'type', 'czt', ...
            'name', 'BZ12041010-4', ...
            'Npoints', 25, ... 
            'x', 2.3:2.6:13.7, ...
            'y', 2.3:2.6:13.7, ...
            'xLen', 15, ...
            'yLen', 15, ...
            'R1', 82, ...
            'R2', 4712 ...
            );
    case 'LPE453'
        % --- Data for LPE453.
        substrate = struct( ...
            'path', 'M:\Masteroppgave\Matlab\FTIR\ftir_data\LPE453\Mapping_121\', ...
            'version', 'LPE453', ...
            'type', 'mct', ...
            'name', 'LPE453', ...
            'Npoints', 121, ... 
            'x', 2:2.6:28, ...
            'y', 2:2.6:28, ...
            'xLen', 30, ...
            'yLen', 30, ...
            'R1', 82, ...
            'R2', 4712 ...
            );
    case 'LPE454'
        % --- Data for LPE454.
        substrate = struct( ...
            'path', 'M:\Masteroppgave\Matlab\FTIR\ftir_data\LPE454\Mapping_121\', ...
            'version', 'LPE454', ...
            'type', 'mct', ...
            'name', 'LPE454', ...
            'Npoints', 121, ... 
            'x', 2:2.6:28, ...
            'y', 2:2.6:28, ...
            'xLen', 30, ...
            'yLen', 30, ...            
            'R1', 82, ...
            'R2', 4712 ...
            );
    case 'CMT801'
        % --- Data for CMT801.
        substrate = struct( ...
            'path', 'M:\Masteroppgave\Matlab\FTIR\ftir_data\CMT801\Mapping_1\', ...
            'version', 'CMT801', ...
            'type', 'mct', ...
            'name', 'CMT801', ...
            'Npoints', 1, ... 
            'x', 7.5:1:7.5, ...
            'y', 7.5:1:7.5, ...
            'xLen', 15, ...
            'yLen', 15, ...            
            'R1', 82, ...
            'R2', 7512 ...
            );
    otherwise
        substrate = struct();
end
end

