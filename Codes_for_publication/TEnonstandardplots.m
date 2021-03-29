
clear all
close all

figure

saveflag=0;
t=tiledlayout(5,6);

% random_numbers=abs(randn(7,25));
load random_numbers.mat

random_numbers=[random_numbers,abs(randn(7,2))];

for m=[1 7 13 19 25]



scale=sqrt(.8);
% scale=0;
d_u=1.5+scale*random_numbers(1,m+2);
d_tau = 2*2+scale*random_numbers(2,m+2);
omega_u = -1.5+scale*random_numbers(3,m+2);
sigma_u = 0.8+scale*random_numbers(4,m+2);
alpha_1 = 1+scale*random_numbers(5,m+2);
alpha_2 = (-0.4)+scale*random_numbers(6,m+2);
 sigma_tau_scale=random_numbers(7,m+2);
% sigma_tau_scale=1;

save('parameters.mat','d_u','d_tau','omega_u','sigma_u','alpha_1','alpha_2','sigma_tau_scale');
run Model_predict_all_2.m
clear d_u d_tau omega_u sigma_u alpha_1 alpha_2 sigma_tau_scale


load standard_model_and_persistence.mat


[pdf_truth1, xx_1] = ksdensity(u1_reference); % compute the true PDF
pdf_truth1(pdf_truth1<=1e-5) = 1e-5; % Note: we set every small values in the PDF to be 1e-5 for the convenience of computing the relative entropy
pdf_truth1 = pdf_truth1/trapz(xx_1,pdf_truth1);
[pdf_pred1, xx_1] = ksdensity(u1_save);
pdf_pred1(pdf_pred1<=1e-5) = 1e-5;
pdf_pred1 = pdf_pred1/trapz(xx_1,pdf_pred1);
autocorrtruth1=autocorr(u1_reference,365*4);
autocorrpred1=autocorr(u1_save,365*4);




eval(['ax' num2str(m) '=axes(t);']);
eval(['ax' num2str(m) '.Layout.Tile=' num2str(m) ';'])
eval(['ax' num2str(m) '.Layout.TileSpan=[' num2str(1) ' ' num2str(4) ';]']);
eval(['plot(ax' num2str(m) ',tt_reference,u1_reference,"b-");'])
eval(['ax' num2str(m) '.XLim=[tt_reference(1) tt_reference(end);]'])
eval(['ax' num2str(m) '.YLim=[-2 3];']);
eval(['ax' num2str(m+1) '=axes(t);']);
eval(['ax' num2str(m+1) '.Layout.Tile=' num2str(m) ';'])
eval(['ax' num2str(m+1) '.Layout.TileSpan=[' num2str(1) ' ' num2str(4) '];']);
eval(['plot(ax' num2str(m+1) ',[1:1:length(u1_save)]/365,u1_save,"r-");'])
eval(['ax' num2str(m+1) '.XLim=[0 13929]/365;']);
eval(['ax' num2str(m+1) '.XAxisLocation="top";']);
eval(['ax' num2str(m+1) '.YAxisLocation="right";']);
eval(['ax' num2str(m+1) '.YLim=[-2 3];']);
eval(['ax' num2str(m+1) '.Color="none";']);
eval(['ax' num2str(m) '.Box="off";']);
eval(['ax' num2str(m+1) '.Box="off";']);
eval(['ax' num2str(m+1) '.XColor="r";']);
eval(['ax' num2str(m+1) '.YColor="r";']);
% title('(a) Trajectory of T_E')

nexttile
hold on
plot(xx_1,pdf_truth1,'b-','LineWidth',2)
plot(xx_1,pdf_pred1,'r-','LineWidth',2)
hold off
% title('(d) PDF of T_E')


nexttile
hold on
plot([1:1:length(autocorrtruth1)]/365,autocorrtruth1,'b-','LineWidth',2)
plot([1:1:length(autocorrpred1)]/365,autocorrpred1,'r-','LineWidth',2)
hold off

% clear d_u d_tau omega_u sigma_u alpha_1 alpha_2 sigma_tau_scale
end
if saveflag==1
f=gcf;
%exportgraphics(f,'standard2000_2020_sampling.png','Resolution',600)
saveas(f,'TE_nonstandard_series_statistics.fig')
end

% title('(g) ACF of T_E')

% ax3=axes(t);
% ax3.Layout.Tile=7;
% ax3.Layout.TileSpan=[1 4];
% plot(ax3,tt_reference,u2_reference,'b-')
% ax3.XLim=[tt_reference(1) tt_reference(end)];
% ax4=axes(t);
% ax4.Layout.Tile=7;
% ax4.Layout.TileSpan=[1 4];
% plot(ax4,1:1:length(u2_save),u2_save,'r-')
% ax4.XLim=[0 1250];
% ax4.XAxisLocation='top';
% ax4.YAxisLocation='right';
% ax4.Color='none';
% ax3.Box='off';
% ax4.Box='off';
% ax4.XColor='r';
% ax4.YColor='r';
% title('(b) Trajectory of H_W')
% 
% nexttile
% hold on
% plot(xx_2,pdf_truth2,'b-','LineWidth',2)
% plot(xx_2,pdf_pred2,'r-','LineWidth',2)
% hold off
% title('(e) PDF of H_W')
% 
% 
% nexttile
% hold on
% plot([1:1:length(autocorrtruth2)]/36.5,autocorrtruth2,'b-','LineWidth',2)
% plot([1:1:length(autocorrpred2)]/36.5,autocorrpred2,'r-','LineWidth',2)
% hold off
% title('(h) ACF of H_W')
% 
% 
% ax5=axes(t);
% ax5.Layout.Tile=13;
% ax5.Layout.TileSpan=[1 4];
% plot(ax5,tt_reference,tau_reference,'b-')
% ax5.XLim=[tt_reference(1) tt_reference(end)];
% ax6=axes(t);
% ax6.Layout.Tile=13;
% ax6.Layout.TileSpan=[1 4];
% plot(ax6,1:1:length(tau_save),u1_save,'r-')
% ax6.XLim=[0 1250];
% ax6.XAxisLocation='top';
% ax6.YAxisLocation='right';
% ax6.Color='none';
% ax5.Box='off';
% ax6.Box='off';
% ax6.XColor='r';
% ax6.YColor='r';
% title('(c) Trajectory of \tau')
% 
% nexttile
% hold on
% plot(xx_3,pdf_truth3,'b-','LineWidth',2)
% plot(xx_3,pdf_pred3,'r-','LineWidth',2)
% hold off
% title('(f) PDF of \tau')
% 
% 
% nexttile
% hold on
% plot([1:1:length(autocorrtruth3)]/36.5,autocorrtruth3,'b-','LineWidth',2)
% plot([1:1:length(autocorrpred3)]/36.5,autocorrpred3,'r-','LineWidth',2)
% hold off
% title('(i) ACF of \tau')



