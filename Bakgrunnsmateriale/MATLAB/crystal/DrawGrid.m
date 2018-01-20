function [ output_args ] = DrawGrid( axis )
%DRAWGRID Summary of this function goes here
%   Detailed explanation goes here

% Get grid limits.
xmin = axis(1); xmax = axis(2);
ymin = axis(3); ymax = axis(4);
zmin = axis(5); zmax = axis(6);

% Plot grid lines.
for xi = xmin:1:xmax
    for yi = xmin:1:xmax
        for zi = zmin:1:zmax
        plot3([xi xi],[yi yi],[zmin zmax], 'k')
        plot3([xi xi],[ymin ymax],[zi zi], 'k')
        plot3([xmin xmax],[yi yi],[zi zi], 'k')
        end %for
    end %for
end %for
end

