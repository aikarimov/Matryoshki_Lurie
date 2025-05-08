%close all
global sig_a
sig_a = fzero(@phi_0,8)

x = [-10:0.0001:10];

figure(10);
hold on
 
y =  psi_m(x);
plot(x,y);

y =  psi_a(x); %analytic
plot(x,y);

legend('$\psi_{m}(\sigma)$','$\psi_{a}(\sigma)$','interpreter','latex');
grid
xlabel('$\sigma$','interpreter','latex');
ylabel('$y$','interpreter','latex');
xtickformat('$%g$'); 
ytickformat('$%g$');
set(gca,'TickLabelInterpreter','latex');

set(gcf,'position',[200 200  400  300]);

















