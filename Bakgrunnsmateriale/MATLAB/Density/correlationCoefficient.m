%------------------------------------------------------------------------%
clear all;
% ---------------------------------------------------------------------- %
% --- Pearson correlation coefficient. --------------------------------- %
% ---------------------------------------------------------------------- %

fontSize = 30;
filename = 'densityData';

n = input('\nWhat do you want to correlate?\n\n1: Voids and microvoids on substrate B.\n2: Polishing grit on substrate C as-received and after etch.\n3: Polishing grit on substrate A with donuts in the film.\n4: Polishing grit on substrate B with donuts in the film.\n5: Polishing grit on substrate C with microvoids in the film.\n0: Exit.\n\nEnter a number: ');

switch n
    case 1
        voids  = xlsread(filename, 'subBa','C3:C123');
        microvoids = xlsread(filename, 'subBa','E3:E123');
        A = voids;
        B = microvoids;
    case 2
        Ca = xlsread(filename, 'subCa','C29:C123');
        Cb = xlsread(filename, 'subCb','C3:C123');
        A = Ca;
        B = Cb;
    case 3
        Ab = xlsread(filename, 'subAb','C3:C123');
        Ac = xlsread(filename, 'LPE453','C3:C123');
        A = Ab;
        B = Ac;
    case 4
        B2b = xlsread(filename, 'subB2b','C3:C123');
        B2c = xlsread(filename, 'LPE454','B3:C123');
        B2c = B2c(:,2);
        A = B2b;
        B = B2c;
    case 5
        Cb = xlsread(filename, 'subCb','C3:C123');
        Cc = xlsread(filename, 'CMT801','C3:C123');
        A = Cb;
        B = Cc;
    otherwise
        return
end

% Plot and calculate correlation coefficient.
AB = horzcat(A, B);
corrplot(AB)
fprintf('\nPearson correlation coefficient = %f\n', calculatePearsonCorrelationCoefficient(A, B))

