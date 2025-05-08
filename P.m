function y = P(w)
    a = -25*8.0391;
    b = -a;
    N = length(w);
    y = zeros(1,N);
    for i = 1:N
        x = w(i);
        frq = (x - a)/(b - a);
        sc = a + (b - a)*(frq - floor(frq));
        y(i) = psi_m(sc);
    end
end