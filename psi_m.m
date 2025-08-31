function y = psi_m(sig)
    global sig_a
    N = length(sig);
    y = zeros(1,N);
    
    m = 5;
    a = m - 1;
    C = 0.975;
    %C = 1.001;
    x0 = sig_a;
    for i = 1:N
        x = sig(i);
        if x == 0
            x = eps;
        end
        flag = 1;
        while flag
            x1 = m*x0;
            if abs(x) > x1 %if x is beyond local interval, increase
                x0 = m*x0;
                a = a*m;
            else
                if abs(x) > x0 && abs(x) <= x1 %if x is in local interval, compute
                    flag = 0;
                    val = C*sign(x)*a*phi_0((abs(x) - x0)/a);
                else
                    x0 = x0/m ;
                    a = a/m ;
                end
            end
        end
        y(i) = val;
    end
end