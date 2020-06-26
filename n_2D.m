%Find the carrier denisty of a 2D graphene at T=300K

function ret = n_2D(Ef, Ec, m)
% Useful constants
kB = 8.617333262145e-5; % eV / K
T = 300;                % K
kT = kB*T;
m0 = 9.10938356e-31;    % Electron mass in kg
hbar = 6.582119569e-16; % eV s 
h = 4.135667696e-15;    % eV;
gamma1 = 2.9; a=0.426e-9;       % Electronic Transport in Graphene, Yuanbo Zhang
ev_to_J =  1/6.24e18;
vf = sqrt(3)*gamma1*a/(2*hbar); % m/s
vf = 1e6;   % Common approximation of this value

%Computaion of carrier concentration
    eta_f = Ef/kT;
    N_2D = 2/pi*(kT)^2/(hbar*vf)^2;
    ret = N_2D*fermi(eta_f,1);
end