function blueColorMap = getBlueColorMap()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

minR = 0; maxR = 200;
minG = 0; maxG = 255;
minB = 50; maxB = 255;
R = [ones(1,100).*minR linspace(minR, maxR, 100) ]./255;
G = [ones(1,50).*minG  linspace(minG, maxG, 100) ones(1,50).*maxG]./255;
B = [ linspace(minB, maxB, 100) ones(1,100).*maxB]./255;
R = fliplr(R) .';
G = fliplr(G) .';
B = fliplr(B) .';
blueColorMap = horzcat(R, G, B);

end

