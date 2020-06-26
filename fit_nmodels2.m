% Fits the carrier denisty models of a 2D graphene and a 3D semicoductor
% around an energy value.
% Juan Esteban Villegas
% NYU 2020

function m = fit_nmodels2(Ef,Ec,t)
%Fit function around this Energy level
%figure(3); clf; hold on; 
it = 0;
n2D = n_2D(Ef);
err_min = 1e-8;
itmax = 100;

%Fitting of the funcion using the Newtons method (twice derivative)
%Change this to something formal like the Newton Method
m_old = 1; f_old=0; df_old = 1;
m = 2; f = err_min+1;
    while abs(f) > err_min
        n3D = n_3D(Ef,Ec,m)*t;
        f = abs(n3D - n2D)/n2D;

        %% 
            dx = m-m_old;
            df = (f - f_old)/dx;
            d2f = (df - df_old)/dx;

            m_old = m;
            if abs(f) > err_min
                m = m - df/d2f;
            end
        %% Plot
        %disp("Iteration " + num2str(it) + " error: " + num2str(f)); 
        %plot(it,f/n2D,'o');
        it = it+1;
        if it>itmax, break, end
    end 

end