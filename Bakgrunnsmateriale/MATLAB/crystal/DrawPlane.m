function DrawPlane( x0, y0, z0, a, b, c )
%DRAWPLANE Summary of this function goes here
%   Detailed explanation goes here
x = -1:.1:1;
[X,Y] = meshgrid(x);
d = a*x0 + b*y0 + c*z0;
Z = (d - a*X - b*Y)/c;
hold on;
surf(X,Y,Z)
end

