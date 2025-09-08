close all

x0 = [0.3483; 0.3992; -0.6120];
y0 = -x0;

h =  0.01;
T = 700;
tspan = 0:h:T;
cmap = colormap('lines');
alph = 0.2;
ctr = 1;
[~,y1] = ode89(@finitial,tspan,x0);
[~,y2] = ode89(@finitial,tspan,y0);

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
%axis equal

xlabel('$y$','interpreter','latex');
ylabel('$z$','interpreter','latex');
set(gca,'TickLabelInterpreter','latex');
xtickformat('$%g$'); 
ytickformat('$%g$');

set(gcf,'position',[500 100  500  300]);

figure(2);
col = [cmap(ctr,:),alph];
plot3(y1(:,1),y1(:,2),y1(:,3),'Color',col); hold on
col = [cmap(ctr+1,:),alph];
plot3(y2(:,1),y2(:,2),y2(:,3),'Color',col);

