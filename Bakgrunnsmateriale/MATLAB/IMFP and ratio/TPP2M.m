function [ IMFP ] = TPP2M( E, Eg, rho, Nv, M )
% Calculate the inelastic mean free path of electrons in a material [Å].
%   Using the model of Tanuma et. al., Surf. Interface Anal., Vol. 36, 1-14 (2004).
%   Input:    E electron energy [eV]
%             Eg bandgap energy for non-conductors [eV]
%             rho density [g cm^(-3)]
%             Nv number of valence electrons per atom (for elements) or molecule (compounds)
%             M atomic or molecular weight
%   Output:   IMFP inelastic mean free path [Å]

% --- Calculate free electron plasmon energy [eV].
Ep =28.8*(Nv*rho/M)^(1/2);

% --- Calculate relevant parameters.
beta  = -0.10 + 0.944*(Ep^2 + Eg^2)^(-1/2) + 0.069*rho^0.1;
gamma = 0.191*rho^(-0.50);
U = Nv*rho/M;
C = 1.97 - 0.91*U;
D = 53.4 - 20.8*U;

% --- Print the parameters to console for testing.
%fprintf('beta = %.4f, gamma = %.3f, C = %.2f, D = %.1f\n', beta, gamma, C, D);

% --- Calculate inelastic mean free path [eV].
IMFP = E ./ (Ep^2.*(beta.*log(gamma.*E) - C./E + D./E.^2));

end

