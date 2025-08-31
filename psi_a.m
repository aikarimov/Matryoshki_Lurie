function y = psi_a(x)
    %a = 2; 
    %b = 1.4; 
    %c = 0.2;
    vareps = 0.1;
    %fv = c*x.*sin(2*pi/(a*b)*log(1 + b*abs(x)));

    a = 4.2;
    %c = 0.32;
    c = 0.33;
    sinf = sin(2*pi/a*log(abs(x)));
    %fv = c*x.*sinf;
    %y = sign(x).*(sqrt(fv.^2 + vareps^2) - vareps); %smooth for abs(fv)
    %y = sign(x).*abs(fv); %smooth for abs(fv)
    k = 100;
    sinp = sinf./(1 + exp(-k*sinf)) - sinf./(1 + exp(k*sinf)); %smooth sigmoid approximation of abs
    %sinp = abs(sinf);
    y = c*x.*sinp; %smooth for abs(fv)
end