close all
x0 = [0.3485; 2.4173; -0.6421];

y0 = -x0;

global sig_a
sig_a = fzero(@phi_0,8)

h =  0.01;
T = 700;
tspan = 0:h:T;
m = 5;
cmap = colormap('lines');
alph = 0.2;
ctr = 1;

for i = -4:0
    [~,y1] = ode89(@fmatryosh,tspan,m^i*x0);
    [~,y2] = ode89(@fmatryosh,tspan,m^i*y0);

    figure(1);
    subplot(1,2,1);
    col = [cmap(ctr,:),alph];
    plot(y1(:,1),y1(:,2),'Color',col); hold on
    col = [cmap(ctr+1,:),alph];
    plot(y2(:,1),y2(:,2),'Color',col);
    xlabel('$x$','interpreter','latex');
    ylabel('$y$','interpreter','latex');
    set(gca,'TickLabelInterpreter','latex');
    xtickformat('$%g$');
    ytickformat('$%g$');

    subplot(1,2,2);
    col = [cmap(ctr,:),alph];
    plot(y1(:,2),y1(:,3),'Color',col); hold on
    col = [cmap(ctr+1,:),alph];
    plot(y2(:,2),y2(:,3),'Color',col);
    xlabel('$y$','interpreter','latex');
    ylabel('$z$','interpreter','latex');
    set(gca,'TickLabelInterpreter','latex');
    xtickformat('$%g$');
    ytickformat('$%g$');

    figure(2);
    col = [cmap(ctr,:),alph];
    plot3(y1(:,1),y1(:,2),y1(:,3),'Color',col); hold on

    col = [cmap(ctr + 1,:),alph];
    plot3(y2(:,1),y2(:,2),y2(:,3),'Color',col);


    figure(3);
    subplot(2,1,1);
    col = [cmap(ctr,:)];
    plot(tspan,y1(:,1),'Color',col); hold on
    col = [cmap(ctr+1,:)];
    plot(tspan,y2(:,1),'Color',col);
    xlabel('$t$','interpreter','latex');
    ylabel('$x$','interpreter','latex');
    set(gca,'TickLabelInterpreter','latex');
    xtickformat('$%g$');
    ytickformat('$%g$');

    subplot(2,1,2);
    col = [cmap(ctr,:)];
    plot(tspan,y1(:,2),'Color',col); hold on
    col = [cmap(ctr+1,:)];
    plot(tspan,y2(:,2),'Color',col);
    xlabel('$t$','interpreter','latex');
    ylabel('$y$','interpreter','latex');
    set(gca,'TickLabelInterpreter','latex');
    xtickformat('$%g$');
    ytickformat('$%g$');

    ctr = ctr + 2;
end

xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
zlabel('$z$','interpreter','latex');
xtickformat('$%g$'); 
ytickformat('$%g$');
ztickformat('$%g$');
set(gca,'TickLabelInterpreter','latex');

set(1,'position',[500 100  500  250]);