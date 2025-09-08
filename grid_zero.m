%1-D grid roots
c = [-19; -3.5; -3.4];
m = 5;
i = -15;
n = 1;

%X0 = m^i*[0.3485; 2.4173; -0.6421];
X0 = [0; 0; 0];
x0 = X0(1); y0 = X0(2); z0 = X0(3);
dz0 = - y0 - z0 + P(c'*X0);
F = @(x)P(c(1)*x);
siga = fzero(@phi_0,8)
(fzero(F,5/2*n*siga) - 5/2*siga*n)/n

K = 30;
F = @(y)P(c(2)*K*sin(y/K));

fzero(F,2*pi*K) - 2*pi*K
