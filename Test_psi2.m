close all
global sig_a
sig_a = fzero(@phi_0,8);
ctr = 1;
for j = 1:2

    if j == 1
        x0 = [0.3483; 0.3992; -0.6120];
        y0 = -x0;
    else
        x0 = 5*x0;
        y0 = -x0;
    end


    h =  0.01;
    T = 700;
    tspan = 0:h:T;
    cmap = colormap('lines');
    alph = 0.2;
    
    [~,y1] = ode89(@fpsi2,tspan,x0);
    [~,y2] = ode89(@fpsi2,tspan,y0);

    %y1 = myRK4(@fpsi2,tspan,x0);
    %y2 = myRK4(@fpsi2,tspan,y0);

    figure(1);
    subplot(1,2,1);
    col = [cmap(ctr,:),alph];
    plot(y1(:,1),y1(:,2),'Color',col); hold on
    col = [cmap(ctr+1,:),alph];
    plot(y2(:,1),y2(:,2),'Color',col);
    %axis equal

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

    set(gcf,'position',[500 100  500  250]);

    figure(2);
    col = [cmap(ctr,:),alph];
    plot3(y1(:,1),y1(:,2),y1(:,3),'Color',col); hold on
    col = [cmap(ctr+1,:),alph];
    plot3(y2(:,1),y2(:,2),y2(:,3),'Color',col);

end

 figure(3);
 sigs = -15:0.01:15;
 p0 = phi_0(sigs);
 p2 = psi_2(sigs);
 Ps = psi_m(sigs);

 col = [cmap(1,:)];
 plot(sigs,Ps,'-','Color',col); hold on
 col = [cmap(2,:)];
 plot(sigs,p0,'-','Color',col); hold on
 col = [cmap(3,:)];
 plot(sigs,p2,'--','Color',col,'LineWidth',1.5); hold on
 set(gcf,'position',[200 200  400  300]);

 legend('$\psi_m(\sigma)$','$\varphi_0(\sigma)$','$\psi_2(\sigma)$','interpreter','latex')
 xlabel('$\sigma$','interpreter','latex');
 ylabel('$y$','interpreter','latex');
 set(gca,'TickLabelInterpreter','latex');
 xtickformat('$%g$'); 
 ytickformat('$%g$');
 grid;
 
 text(7.9,-0.5,'$\sigma_0$','interpreter','latex');
 text(-9.4,0.5,'$-\sigma_0$','interpreter','latex');