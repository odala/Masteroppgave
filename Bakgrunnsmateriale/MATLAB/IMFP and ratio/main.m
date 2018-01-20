% --- Set the energy of the Al Ka and Mg Ka x-rays [eV].
Al = 1486.6;
Mg = 1253.6;

% --- Set the energy of the the x-rays [eV].
energyUsed = Mg;

% --- Set emission angle of the electrons with respect
%     to the surface normal [rad].
theta = degToRad(30);

% --- Calculate the apparent concentration x for thickness d of a
%     overlayer of CdTe on Hg(1-x)Cd(x)Te.
A_id = 'CdTe';
A = readParametersFromFile(strcat('param_', A_id, '.txt'));
[ nameEHg, EHg ] = readEnergiesFromFile('energy_Hg.txt');
[ nameECd, ECd ] = readEnergiesFromFile('energy_Cd.txt');
x = 0.2;
fprintf('\nBulk material: Hg(1-x)Cd(x)Te. \nOverlayer: %s.\n', A_id);

% --- Calculate the inelastic mean free path.
IMFP_Cd1 = TPP2M( energyUsed - ECd(1), A.Eg, A.rho, A.Nv, A.M );
IMFP_Hg1 = TPP2M( energyUsed - EHg(1), A.Eg, A.rho, A.Nv, A.M );
IMFP_Cd2 = TPP2M( energyUsed - ECd(3), A.Eg, A.rho, A.Nv, A.M );
IMFP_Hg2 = TPP2M( energyUsed - EHg(3), A.Eg, A.rho, A.Nv, A.M );

% --- Set thickness array.
d = linspace(0.0, 30.0, 100);

% --- Calculate the apparent x-value.
xapp1 = calculate_xapp( d, theta, x, IMFP_Cd1, IMFP_Hg1 );
xapp2 = calculate_xapp( d, theta, x, IMFP_Cd2, IMFP_Hg2 );
%xappd = 1./(1+Rd);
%xappp = 1./(1+Rp);

% --- Plot apparent x as a function of thickness.
figure
plot(d, xapp1, 'b--', d, xapp2, 'r-')
xlabel('Thickness $d$ [\AA]', 'Interpreter', 'latex', 'Fontsize', 12)
ylabel('$x_{app}(d)$', 'Interpreter', 'latex', 'Fontsize', 12)
h = legend('$x_{\mathrm{app, d}}(d)$', '$x_{\mathrm{app, p}}(d)$', 'Location', 'SouthEast');
set(h, 'Interpreter', 'latex', 'Fontsize', 12)
axis( [0.0, max(d), 0.0, ceil(10*max([xapp1 xapp2]))/10 ] )