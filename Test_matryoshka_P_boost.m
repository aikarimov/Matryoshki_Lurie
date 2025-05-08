close all
x0 = [0.3485; 2.4173; -0.6421];
y0 = -x0;
global sig_a
sig_a = fzero(@phi_0,8);
K = 50;

h =  0.01;
T = 700;
tspan = 0:h:T;
m = 5;
cmap = colormap('lines');
alph = 0.2;
ctr = 1;
for p = 0:1 % boosting
    for n = -1:1 % inner grid
        for i = -1:1 % matryoshka
            c = [-19; -3.5; -3.4];
            cp = 1.0577;
            %cp = 1.057746125134262;
            xstart = m^i*x0 + [(cp + 5/2*sig_a)*n; (2*pi*K)*p; 0];
            ystart = m^i*y0 + [(cp + 5/2*sig_a)*n; (2*pi*K)*p; 0];
            [~,y1] = ode89(@fmatryosh_P_boost,tspan,xstart);
            [~,y2] = ode89(@fmatryosh_P_boost,tspan,ystart);

            % figure(1);
            % col = [cmap(ctr,:),alph];
            % plot(y1(:,1),y1(:,3),'Color',col); hold on
            % col = [cmap(ctr + 1,:),alph];
            % plot(y2(:,1),y2(:,3),'Color',col);
            % 
            % figure(4);
            % col = [cmap(ctr,:),alph];
            % plot(y1(:,2),y1(:,3),'Color',col); hold on
            % col = [cmap(ctr + 1,:),alph];
            % plot(y2(:,2),y2(:,3),'Color',col);

            figure(4);
            subplot(1,2,1);
            col = [cmap(ctr,:),alph];
            plot(y1(:,1),y1(:,2),'Color',col); hold on
            col = [cmap(ctr + 1,:),alph];
            plot(y2(:,1),y2(:,2),'Color',col);

            figure(4);
            subplot(1,2,2);
            col = [cmap(ctr,:),alph];
            plot3(y1(:,1),y1(:,2),y1(:,3),'Color',col); hold on

            col = [cmap(ctr + 1,:),alph];
            plot3(y2(:,1),y2(:,2),y2(:,3),'Color',col);

            ctr = ctr + 2;
        end
    end
end

figure(4);
subplot(1,2,1);
xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
%zlabel('$z$','interpreter','latex');
xtickformat('$%g$'); 
ytickformat('$%g$');
%ztickformat('$%g$');
set(gca,'TickLabelInterpreter','latex');
title('a','interpreter','latex')

figure(4);
subplot(1,2,2);
xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
zlabel('$z$','interpreter','latex');
xtickformat('$%g$'); 
ytickformat('$%g$');
ztickformat('$%g$');
set(gca,'TickLabelInterpreter','latex');
title('b','interpreter','latex')