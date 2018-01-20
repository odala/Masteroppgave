function DrawUnit( originX, originY, originZ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
hold on;
x1 = 0.50.*[0 0 1 1];
y1 = 0.50.*[0 1 0 1];
z1 = 0.50.*[0 1 1 0];
x2 = 0.25.*[3 3 1 1];
y2 = 0.25.*[3 1 3 1];
z2 = 0.25.*[3 1 1 3];
c1 = ones(length(x1),1)*[1 0 0];
c2 = ones(length(x1),1)*[0 0 1];
r1 = 0.1*ones(length(x1));
r2 = 0.1*ones(length(x2));
PlotSphere(x1+originX,y1+originY,z1+originZ,r1,c1);
PlotSphere(x2+originX,y2+originY,z2+originZ,r2,c2);
end

