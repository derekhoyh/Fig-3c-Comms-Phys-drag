function surfplot

load('rhoddata-T70.mat')

figure;

load('factor.mat','factor')

surf(nAplt,nPplt,rhodplt.*factor,'EdgeColor', 'None', 'facecolor', 'interp');
% colormap jet;
n=500;
R=[linspace(0,1,n/2), linspace(1,1,n/2)];
G=[linspace(0,1,n/2), linspace(1,0,n/2)];
B=[linspace(1,1,n/2), linspace(1,0,n/2)];
colormap( [R(:), G(:), B(:)]) ;

view(2);
box on;
% c = colorbar;
% set(c,'ylim',[min(min(rhodplt)) max(max(rhodplt))])
[cmin,cmax] = caxis;
caxis([-70,70])
% xlim([-60 60]);ylim([-60 60])
xlim([-50 50]);ylim([-50 50])


text(-45,43,10,'(c)','FontSize',30, 'Interpreter', 'latex');
text(16,43,10,'$T=70K$','FontSize',18, 'Interpreter', 'latex');
text(16,36,10,'$d=9$ nm','FontSize',18, 'Interpreter', 'latex');
text(16,29,10,'Homogeneous','FontSize',18, 'Interpreter', 'latex');
xlabel('$n_{A}$ ($10^{10} \mathrm{cm}^{-2}$)', 'FontSize', 30, 'Interpreter', 'latex');
ylabel('$n_{P}$ ($10^{10} \mathrm{cm}^{-2}$)', 'FontSize', 30, 'Interpreter', 'latex');
h=gca;
h.XTick=(-50:25:50);
h.YTick=(-50:25:50);
h.XMinorTick='on';
h.YMinorTick='on';

c = colorbar;
% ylabel(c, '$\tilde{\rho}_{D}$ ($\Omega$)', 'FontSize', 30, 'Interpreter', 'latex');

h=gca;
h.LineWidth=3;
h.FontSize=20;

print('Fig3c.png','-dpng')
end
