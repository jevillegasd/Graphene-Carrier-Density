%Numerically computes the Fermi Dirac Integral
% x = value of eta to compute the integral (= (Ef-Ec)/kT for a semiconductor)
% order = order of the Fermi-Dirac Integral (=1/2 for a semiconductor)
%Juan Esteban Villegas
%NYU 2020

function int = fermi(x, order)
    Emax = 10; %eV
    kT = 0.025851999786435;
    
    umax= Emax/kT; steps = 20000;  %dt = umax/steps;
    umin= 1e-4/kT;
    u = linspace(0,umax,steps);
    u = logspace(log10(umin),log10(umax),steps);
    
    j = order;
    f = @(t) t.^(j)./(1+exp(t-x)); %Fermi following  NIST DLMF but without prefactor

    int = 0;
    for i = 2:steps
        dt = u(i)-u(i-1);
        int = int + (f(u(i))+f(u(i-1)))/2*dt; %Integral using trapezoid rule
    end
end