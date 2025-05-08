function y = psi_1(sig)
    global sig_a
    a = 4;
    y = a*phi_0((sig - sig_a)/a);
end