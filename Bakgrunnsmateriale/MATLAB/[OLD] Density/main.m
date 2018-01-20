% --- Plot denisty of defects.

Z = [ 11 1 4 1 19 6 4 2 4 8 2 ;
      11 7 12 22 22 1 2 0 7 3 11 ;
      5 4 3 3 3 3 3 3 3 4 5;
      5 4 3 2 2 2 2 2 3 4 5;
      5 4 3 2 1 1 1 2 3 4 5;
      5 4 3 2 1 0 1 2 3 4 5;
      5 4 3 2 1 1 1 2 3 4 5;
      5 4 3 2 2 2 2 2 3 4 5;
      5 4 3 3 3 3 3 3 3 4 5;
      5 4 4 4 4 4 4 4 4 4 5;
      5 5 5 5 5 5 5 5 5 5 5
    ];
  
   
x = linspace(1, 11, 11);
y = linspace(11, 1, 11);
[ X, Y ] = meshgrid(x, y);

% --- Number of contour lines.
Nclines = 1001;

% --- Plot contour plot.
figure
hContour = contourf(X, Y, Z, Nclines, 'LineStyle', 'none');
axis([1 11 1 11])
set(gca, 'YLim', [1 11], 'YTick', linspace(1, 11, 11), 'YTickLabel', ['K'; 'J'; 'I'; 'H'; 'G'; 'F'; 'E'; 'D'; 'C'; 'B'; 'A']);
c = colorbar;
set(c, 'LabelString', 'Test');
grid

% --- Plot surface plot.
figure
hSurface = surfc(X, Y, Z);

% --- Plot nicer contour plot.
figure
x = conv2( randn(600), fspecial('gaussian', 200, 20), 'valid' );
imagesc(x)
colormap(jet)
colorbar
grid

