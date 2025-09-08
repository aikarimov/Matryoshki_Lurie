close all
x0 = [0.3485; 2.4173; -0.64205];
y0 = -x0;
global sig_a
sig_a = fzero(@phi_0,8);
K = 50;

h =  0.01;
T = 1000;
tspan = 0:h:T;
m = 5;
cmap = [2 17 24;
        0 95 114;
        9 147 150;
        150 209 189;
        234 216 166;
        239 154 0;
        202 103 2;
        188 62 3;
        185 62 2;
        175 32 18;
        157 34 39]/256;
alph = 0.1;
ctr = 1;

xp = fzero( @(x)P(-19*x),2.5*sig_a);
cp = xp - 2.5*sig_a;

yshift = 274.1592;
for p = 0:1 % boosting
    for n = -1:1 % inner grid
        for i = -4:1 % matryoshka
            xstart = m^i*x0 + [(cp + 5/2*sig_a)*n; (2*pi*K)*p; 0];
            ystart = m^i*y0 + [(cp + 5/2*sig_a)*n; (2*pi*K)*p; 0];
            [~,y1] = ode89(@fmatryosh_P_boost,tspan,xstart);
            [~,y2] = ode89(@fmatryosh_P_boost,tspan,ystart);

            figure(4);
            subplot(2,3,[1,2,4,5]);
            no1 =  mod(ctr, 11) + 1;
            no2 =  mod(ctr + 3, 11) + 1;

            col = [cmap(no1,:),alph];
            plot(y1(:,1),y1(:,2) - p*yshift,'Color',col); hold on
            col = [cmap(no2,:),alph];
            plot(y2(:,1),y2(:,2) - p*yshift,'Color',col);

           axis equal
            
           if n == 1 &&  p == 1 && i < 1
                figure(4);
                subplot(2,3,3);
                axis equal
                col = [cmap(no1,:),alph];
                plot(y1(:,1),y1(:,2) - p*yshift,'Color',col); hold on
                col = [cmap(no2,:),alph];
                plot(y2(:,1),y2(:,2) - p*yshift,'Color',col);

                xticks([]);
                yticks([]);
           end

           if n == 1 &&  p == 1 && i < 0
                figure(4);
                subplot(2,3,6);
                axis equal
                col = [cmap(no1,:),alph];
                plot(y1(:,1),y1(:,2) - p*yshift,'Color',col); hold on
                col = [cmap(no2,:),alph];
                plot(y2(:,1),y2(:,2) - p*yshift,'Color',col);

                xticks([]);
                yticks([]);
            end

            ctr = ctr + 2;
        end
    end
end

figure(4);
subplot(2,3,[1,2,4,5]);
xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
yticks([0, 2*pi*K - yshift]);
yticklabels({'$0$', '$2 \pi K$'});
xticks([-cp - 5/2*sig_a,0,cp + 5/2*sig_a]);
xticklabels({'$-\sigma_x - \frac{m\sigma_0}{2}$','$0$', '$\sigma_x + \frac{m\sigma_0}{2}$'});
set(gca,'TickLabelInterpreter','latex');

yzero = 20;
ypm = 2;
plot([-40,40],[yzero + ypm,yzero + ypm],'--k'); %line
plot([-40,40],[yzero - ypm,yzero - ypm],'--k'); %line

set(gcf,'Position',[500, 200, 430,  325]);


