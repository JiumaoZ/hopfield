clc; clear all; close all;

global k a b c d
y0 = [0.1,0.1,0.1];

%% case 1 只考虑忆阻器耦合的影响
% k=1;a=0;b=0;c=0;d=0;
%% case 2 考虑忆阻器耦合下第一个神经元受到外部刺激的影响
k=1;a=1;b=1.5;c=0;d=0;
%% case 3 考虑忆阻器耦合下第二个神经元受到外部刺激的影响
% k=1;a=0;b=0;c=1;d=1.5;
%% case 4 考虑忆阻器耦合下神经元一和二同时受到外部刺激的影响
% k=1;a=1;b=1.5;c=1;d=1.0;
tsp = 0:0.01:500;
options = odeset('RelTol',1e-6,'AbsTol',1e-6);
[t,y] = ode45('NonHete',tsp,y0,options);

cut = 2000;
xmax = ceil(max(y(cut:end,1))); xmin = floor(min(y(cut:end,1)));
ymax = ceil(max(y(cut:end,2))); ymin = floor(min(y(cut:end,2)));
zmax = ceil(max(y(cut:end,3))); zmin = floor(min(y(cut:end,3)));
cs = 'Case4\';
phxy = 'phasexy.png' ; phxz = 'phasexz.png'; phyz = 'phaseyz.png';
fig1 = figure;
plot(y(cut:end,1),y(cut:end,2),'r','linewidth',2)
set(gca,'FontName','Times New Roman','FontSize',18)
xlabel('x','fontsize',24,'FontName','Times New Roman')
ylabel('y','fontsize',24,'FontName','Times New Roman')
xlim([xmin-0.5, xmax+0.5])
set(gca,'XGrid','on')
set(gca,'YGrid','on')
set(gcf,'color','w')
xticks('auto')
set(gca,'linewidth',1.5)
frm = getframe(fig1);
img = frame2im(frm);
imwrite(img,[cs,phxy]);

fig2 = figure;
plot(y(cut:end,1),y(cut:end,3),'g','linewidth',2)
set(gca,'FontName','Times New Roman','FontSize',18)
xlabel('x','fontsize',24,'FontName','Times New Roman')
ylabel('z','fontsize',24,'FontName','Times New Roman')
xlim([xmin-0.5, xmax+0.5])
set(gca,'XGrid','on')
set(gca,'YGrid','on')
set(gcf,'color','w')
set(gca,'linewidth',1.5)
frm = getframe(fig2);
img = frame2im(frm);
imwrite(img,[cs,phxz]);

fig3 = figure;
plot(y(cut:end,2),y(cut:end,3),'b','linewidth',2)
set(gca,'FontName','Times New Roman','FontSize',18)
xlabel('y','fontsize',24,'FontName','Times New Roman')
ylabel('z','fontsize',24,'FontName','Times New Roman')
xlim([ymin-0.5, ymax+0.5])
set(gca,'XGrid','on')
set(gca,'YGrid','on')
set(gcf,'color','w')
set(gca,'linewidth',1.5)
frm = getframe(fig3);
img = frame2im(frm);
imwrite(img,[cs,phyz]);

