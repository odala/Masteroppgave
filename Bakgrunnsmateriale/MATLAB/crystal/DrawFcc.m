function [ output_args ] = DrawFcc(originX, originY, originZ, isColored )
%DRAWFCC Summary of this function goes here
%   Detailed explanation goes here
hold on;
if (isColored)
    x = [0];
    y = [0];
    z = [0];
    r = 0.1*ones(length(x));
    c = 1.0*ones(length(x),1)*[1 1 0];
    PlotSphere(x+originX,y+originY,z+originZ,r,c);
    x = [1];
    y = [1];
    z = [1];
    r = 0.1*ones(length(x));
    c = 0.8*ones(length(x),1)*[0 0 1];
    PlotSphere(x+originX,y+originY,z+originZ,r,c);
    x = [1 0 1 0.5 1 0.5];
    y = [1 1 0 0.5 0.5 1];
    z = [0 1 1 1 0.5 0.5];
    r = 0.1*ones(length(x));
    c = 0.8*ones(length(x),1)*[1 0 0];
    PlotSphere(x+originX,y+originY,z+originZ,r,c);
    x = [1 0.5 0 0.5 0 0];
    y = [0 0.5 1 0 0.5 0];
    z = [0 0 0 0.5 0.5 1];
    r = 0.1*ones(length(x));
    c = 0.8*ones(length(x),1)*[0 1 0];
    PlotSphere(x+originX,y+originY,z+originZ,r,c);
    %x2 = [0.25 0.25 0.75 0.75];
    %y2 = [0.25 0.75 0.25 0.75];
    %z2 = [0.25 0.75 0.75 0.25];
    %r2 = 0.1*ones(length(x2));
    %c2 = 0.5*ones(length(x2),1)*[1 0 0];
    %PlotSphere(x2,y2,z2,r2,c2)
    legend('A','A', 'B', 'C', 'Te')
else
    x = [0 1 0 0 1 0 1 1 0 0.5 0.5 1 0.5 0.5];
    y = [0 0 1 0 1 1 0 1 0.5 0 0.5 0.5 1 0.5];
    z = [0 0 0 1 0 1 1 1 0.5 0.5 0 0.5 0.5 1];
    r = 0.1*ones(length(x));
    c = 0.5*ones(length(x),1)*[0 0 1];
    PlotSphere(x+originX,y+originY,z+originZ,r,c);
end %if

end

