% ===============================================================
% ===== Plot ratio of signal in overlayer to signal in bulk =====
% ===== material as a function of thickness.                =====
% ===============================================================

% --- Set the energy of the Al Ka and Mg Ka x-rays [eV].
Al = 1486.6;
Mg = 1253.6;
energyUsed = Mg;

% --- Set emission angle of the electrons with respect
%     to the surface normal [deg].
theta = 30;

% --- Set signal.
signal = 'Te';

% --- Set bulk material.
B_id = 'Cd96Zn4Te';

% --- Set overlayer material.
A_id = 'TeO';

% --- Set thickness axis.
d_start = 0.0;
d_end   = 10;
Npoints = 100;

% --- Decide which energies in the energy_<>-file to look at.
%     (1 indexed). NB! Some files only have two values.
e1 = 1;
e2 = 3;

% ====================================================
% ===== DO NOT CHANGE THE CODE BELOW THIS POINT. =====
% ====================================================
A_signal = signal;
B_signal = signal;

% --- Define Avogadro's number [atoms / mol].
Nav = 6.0221409e23;

% --- Convert angle to rad.
fprintf('Emission angle (wrt. surface normal [deg]) %.1f\n', theta);
theta = degToRad(theta);

% --- Read in corresponding values from file.
B = readParametersFromFile(strcat('bulk/param_', B_id, '.txt'));
A = readParametersFromFile(strcat('bulk/param_', A_id, '.txt'));
[ nameE_A, E_A ] = readEnergiesFromFile(strcat('energies/energy_', A_signal, '.txt'));
[ nameE_B, E_B ] = readEnergiesFromFile(strcat('energies/energy_', B_signal, '.txt'));
fprintf('\nBulk material: %s. \nOverlayer: %s.\n', B_id, A_id);
fprintf('Ratio of %s-%s to %s-%s signals.\n', A_signal, A_id, B_signal, B_id);

% --- Calculate atomic size [Å].
a_A = (A.M/A.rho/Nav)^(1/3)*1e8;
a_B = (B.M/B.rho/Nav)^(1/3)*1e8;

% --- Calculate inelastic mean free paths for the signal in both the
%     overlayer and in the bulk material [Å].
fprintf('\nBulk material: %s. \nOverlayer: %s.\n', nameE_A{e1}, nameE_B{e2});
IMFP_AA  = TPP2M( energyUsed - E_A(e1), A.Eg, A.rho, A.Nv, A.M );
IMFP_BB  = TPP2M( energyUsed - E_B(e1), B.Eg, B.rho, B.Nv, B.M );
IMFP_BA  = TPP2M( energyUsed - E_B(e1), A.Eg, A.rho, A.Nv, A.M );
IMFP_AA2 = TPP2M( energyUsed - E_A(e2), A.Eg, A.rho, A.Nv, A.M );
IMFP_BB2 = TPP2M( energyUsed - E_B(e2), B.Eg, B.rho, B.Nv, B.M );
IMFP_BA2 = TPP2M( energyUsed - E_B(e2), A.Eg, A.rho, A.Nv, A.M );

% --- Set thickness array.
d = linspace(d_start, d_end, Npoints);

% --- Calculate the ratios for two different energy peaks.
R1 = calculate_ratio( d, theta, a_A, a_B, IMFP_AA, IMFP_BA, IMFP_BB );
R2 = calculate_ratio( d, theta, a_A, a_B, IMFP_AA2, IMFP_BA2, IMFP_BB2 );

% --- Plot ratio as a function of thickness.
plot(d, R1, 'b--', d, R2, 'r-')
xlabel('Thickness $d$ [\AA]', 'Interpreter', 'latex', 'Fontsize', 12)
ylabel('Ratio $R(d)$', 'Interpreter', 'latex', 'Fontsize', 12)
h = legend('$R_\mathrm{1}(d)$', '$R_\mathrm{2}(d)$', 'Location', 'SouthEast');
set(h, 'Interpreter', 'latex', 'Fontsize', 12)
axis( [d_start, d_end, 0.0, ceil(10*max([R1, R2]))/10 ] )
grid on

% ====================================================