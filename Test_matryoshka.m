close all
%x0 = [0.3483; 0.3992; -0.6120];
x0 = [0.3483753; 0.39921774; -0.61195144];
%x0 = [0.4; 0.4; -0.5];
y0 = -x0;

global sig_a
sig_a = fzero(@phi_0,8)

h =  0.01;
T = 7000;
tspan = 0:h:T;
a = 5;
m = 4;
cmap = colormap('lines');
alph = 0.2;
ctr = 1;

for i = -0:1
    [~,y1] = ode45(@fmatryosh,tspan,m^i*x0);
    [~,y2] = ode45(@fmatryosh,tspan,m^i*y0);
    figure(1);
    col = [cmap(ctr,:),alph];
    plot(y1(:,1),y1(:,3),'Color',col); hold on
    col = [cmap(ctr + 1,:),alph];
    plot(y2(:,1),y2(:,3),'Color',col);

    figure(2);
    col = [cmap(ctr,:),alph];
    plot3(y1(:,1),y1(:,2),y1(:,3),'Color',col); hold on

    col = [cmap(ctr + 1,:),alph];
    plot3(y2(:,1),y2(:,2),y2(:,3),'Color',col);

    ctr = ctr + 2;
end

xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
zlabel('$z$','interpreter','latex');
xtickformat('$%g$'); 
ytickformat('$%g$');
ztickformat('$%g$');
set(gca,'TickLabelInterpreter','latex');