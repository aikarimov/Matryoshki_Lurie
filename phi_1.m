function y = phi_1(sig)
    global sig_a
    y = phi_0(sig).*(abs(sig) < sig_a) + ...
        phi_0(sig_a).*(abs(sig) >= sig_a);
end