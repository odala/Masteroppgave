figure
DrawFcc(0.0, 0.0, 0.0, false);
x2 = [0.25 0.25 0.75 0.75];
y2 = [0.25 0.75 0.25 0.75];
z2 = [0.25 0.75 0.75 0.25];
r2 = 0.1*ones(length(x2));
c2 = 0.5*ones(length(x2),1)*[1 0 0];
PlotSphere(x2,y2,z2,r2,c2);
legend('Cd','Te')

figure
DrawFcc(0.0, 0.0, 0.0, true);

xmin = 0; xmax = 1; 
ymin = 0; ymax = 1; 
zmin = 0; zmax = 1;

figure
for xi = xmin:xmax
    for yi = ymin:ymax
        for zi = zmin:zmax
            DrawUnit(xi,yi,zi);
        end %for
    end %for
end %for
%DrawPlane(0,0,0,2,1,1)
%DrawPlane(0,0,0,1,1,1)
%DrawPlane(0,0.5,0.5,1,1,1)
DrawPlane(0.5,1,0.5,1,1,1)
%DrawPlane(1,1,1,1,1,1)
DrawGrid([xmin xmax ymin ymax zmin zmax])
axis([xmin xmax ymin ymax zmin zmax])
xlabel('x'); ylabel('y'); zlabel('z')

