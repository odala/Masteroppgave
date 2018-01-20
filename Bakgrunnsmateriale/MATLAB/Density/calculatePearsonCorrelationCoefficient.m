function r = calculatePearsonCorrelationCoefficient( A, B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if size(A) ~= size(B)
    return    
end %if

Nrows = size(A, 1);
Ncols = size(A, 2);
sumA = 0; 
sumB = 0; 
sumAB = 0; 
sumA2 = 0; 
sumB2 = 0;
N = 0;
for row = 1:Nrows
    for col = 1:Ncols
        if isnan(A(row, col)) || isnan(B(row, col))
        else
            sumA = sumA + A(row, col);
            sumB = sumB + B(row, col); 
            sumAB = sumAB + A(row, col)*B(row, col); 
            sumA2 = sumA2 + A(row, col)*A(row, col); 
            sumB2 = sumB2 + B(row, col)*B(row, col);
            N = N + 1;
        end %if
    end %for
end %for

r = ( N*sumAB - sumA*sumB ) / sqrt( N*sumA2 - sumA^2 ) / sqrt( N*sumB2 - sumB^2 );

end

