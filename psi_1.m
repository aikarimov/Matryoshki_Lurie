function y = psi_1(sig)
    global sig_a
    a = 3.9;
    y = a*phi_0((sig - sig_a)/4);
end