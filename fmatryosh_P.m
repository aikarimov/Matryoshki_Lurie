function dX = fmatryosh_P(t,X)
    dX = X;
    x = X(1); y = X(2); z = X(3);
    sig = -19*x - 3.5*y  - 3.4*z;
    dX(1) = y;
    dX(2) = z;
    dX(3) = - y - z + P(sig);
end