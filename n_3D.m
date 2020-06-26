%Find the carrier denisty of a 3D semiconductor at T=300K

function ret = n_3D(Ef, Ec, m)
% Useful constants
kB = 8.617333262145e-5; % eV / K
T = 300;                % K
kT = kB*T;
m0 = 9.10938356e-31;    % Electron mass in kg
hbar = 6.582119569e-16; % eV s 
h = 4.135667696e-15;    % eV;
ev_to_J =  1/6.24e18;

%Computaion of carrier concentration
    N_3D = 1/sqrt(2).*(m*m0*kT/(pi*ev_to_J*hbar^2)).^(3/2);
    eta_f = (Ef-Ec)/kT;
    ret = N_3D*fermi(eta_f,1/2);
end