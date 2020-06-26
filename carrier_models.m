%Calculates the carrier density on graphene and a 3D semiconductor
%And find values of m* to fit the 3D to the 2D models
%Juan E. Villegas
%NYU 2020

kB = 8.617333262145e-5; % eV / K
T = 300;                % K
kT = kB*T;
m0 = 9.10938356e-31;    % Electron mass in kg
hbar = 6.582119569e-16; % eV s 
h = 4.135667696e-15;    % eV;
gamma1 = 2.9; a=0.426e-9;       % Electronic Transport in Graphene, Yuanbo Zhang
vf = sqrt(3)*gamma1*a/(2*hbar); % m/s
vf = 1e6;   % Common approximation of this value
ev_to_J =  1/6.24e18;

Ef = linspace(-2,2,1000);

%2D graphene model
n2D = n_2D(abs(Ef));
figure(1); clf; semilogy(Ef,n2D,"red"); hold on; %ylim([0 n2D(500)])

%3D semiconductor model
%m = 1.768; Ec = 0.1; t = 0.1e-9; 
%
%for m=1.6:0.02:1.8
%    N_3D = 1/sqrt(2)*(m*m0*kT/(pi*ev_to_J*hbar^2))^(3/2);
%    eta_f = (Ef-Ec)/kT;
%    n_3D = N_3D*fermi_juan(eta_f,1/2);
%    n_3D_2D = n_3D*t;
%    plot(n_3D_2D,Ef,"blue");
%end
%hold off; grid on; 

%% Fit the n2D and n3D models around a point
figure(1), hold on;

%Fitting parameters Ec, Ef, t
Ec = 0.1;
Ef_t = [0.025 0.025 0.05 0.1 , 0.5 1 1.5];        %Trial Fermi Energy
t = [0.75 0.1 0.1 0.1 , 0.75 0.75 0.75]*1e-9;   %Trial thicknesses

m = zeros(length(Ef_t),1);
for it = 1:length(Ef_t)
    m(it) = fit_nmodels2(Ef_t(it),Ec,t(it)); 
    n3D = n_3D(abs(Ef),Ec,m(it))*t(it);
    figure(1), hold on, semilogy(Ef,n3D,"blue","linestyle",'-.'); 
    disp("using Ec = "+num2str(Ec) + ", t = " +num2str(t(it)*1e9) + " nm, Ef = " + ...
        num2str(Ef_t(it))+": m*=" + num2str(m(it)));
end

hold off; grid on;
ylabel("2D Carrier concentration m^-^2");
xlabel("Fermi Level (eV)");

%% Plot Lumerical Models
figure(2), clf;
semilogy(Ef,n2D,"red"); hold on;
n3D = n_3D(abs(Ef),0.1,1.768)*0.1e-9;
    figure(2), hold on, semilogy(Ef,n3D,"blue","linestyle",'-'); 
n3D = n_3D(abs(Ef),0.1,0.464)*0.75e-9;
    figure(2), hold on, semilogy(Ef,n3D,"cyan","linestyle",'-'); 
legend("2D Model", "Lumerical <0.05", "Lumerical >0.05");
hold off; grid on;

ylabel("2D Carrier concentration m^-^2");
xlabel("Fermi Level (eV)");

matrix = [Ef_t', Ec*ones(length(Ef_t),1), t'*1e9, m];


%legend("2D","3D")