function y = psi_m(sig)
    global sig_a
    N = length(sig);
    y = zeros(1,N);
    
    a = 5;
    x0 = sig_a;
    m = a-1;
    for i = 1:N
        x = sig(i);
        if x == 0
            x = eps;
        end
        flag = 1;
        while flag
            x1 = a*x0;
            if abs(x) > x1 %if x is beyond local interval, increase 
                x0 = a*x0;
                m = m*a;
            else
                if abs(x) > x0 && abs(x) <= x1 %if x is in local interval, compute 
                    flag = 0;
                    val = sign(x)*m*phi_0((abs(x) - x0)/m);
                else
                    x0 = x0/a;
                    m = m/a;
                end
            end
        end
        y(i) = val;
    end
end