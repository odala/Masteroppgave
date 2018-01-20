function [x, y, sz, xMax, yMax, szMax] = readFromExcel( filename, tabname, col )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

xMax  = xlsread(filename, tabname,'A2');
yMax  = xlsread(filename, tabname,'B2');
if (col == 1)
    szMax = xlsread(filename, tabname,'C2');
    data  = xlsread(filename, tabname,'A3:C123');  % change if more than 121 data points
elseif (col == 2)
    szMax = xlsread(filename, tabname,'C3');
    data  = horzcat(xlsread(filename, tabname,'A3:B123'), xlsread(filename, tabname,'E3:E123'));  % change if more than 121 data points
elseif (col == 3)
    szMax = xlsread(filename, tabname,'C4');
    data  = horzcat(xlsread(filename, tabname,'A3:B123'), xlsread(filename, tabname,'G3:G123'));  % change if more than 121 data points
end %if
x     = data(:,1);  % mm
y     = data(:,2);  % mm
sz    = data(:,3);  % particles per square centimetre

end

