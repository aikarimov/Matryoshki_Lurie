function dX = fmatryosh_P_boost(t,X)
    dX = X;
    K = 50;
    x = X(1); y = X(2); z = X(3);
    sig = -19*x - 3.5*K*sin(y/K)  - 3.2*z;
    dX(1) = K*sin(y/K);
    dX(2) = z;
    dX(3) = - K*sin(y/K) - z + P(sig);
end