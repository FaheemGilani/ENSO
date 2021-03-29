clear all
close all




saveflag=0;

standard=load('standardload.mat');
load normalizations
addpath('boundedline/')

[~,min_inds]=min(standard.pc5_TEWBHW_pc_Linearnet_prior);
[~,max_inds]=max(standard.pc5_TEWBHW_pc_Linearnet_prior);


vec=[0:1:49]/4.2857;
% colors=linspecer(6);
ms=5;

set(groot,'DefaultLineLineWidth',1.2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
    'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
    'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])

figure
t=tiledlayout(3,2,'TileSpacing','compact');
nexttile
hold on
plot(vec,standard.Corr_ENSO_1D,'MarkerSize',ms,'color',[.5 0 .5])
plot(vec,standard.Corr_ENSO_3D,'g-','MarkerSize',ms)
plot(vec,mean(standard.TE_pc_Linearnet_prior),'b-','MarkerSize',ms)
plot(vec,mean(standard.TEHW_pc_Linearnet_prior),'m-','MarkerSize',ms)
plot(vec,mean(standard.TEWBHW_pc_Linearnet_prior),'r-','MarkerSize',ms)
ylabel('PC')
yline(.5,'k-','LineWidth',2)
title('PC')
l=legend({'Persistence','3-D Model','$T_E$','$(T_E,H_W)$','$(T_E, H_W,\tau)$',},'location','SouthWest');
l.Interpreter='latex';
l.FontSize=8;
grid on

nexttile
hold on

plot(vec,standard.RMSE_ENSO_1D,'color',[.5 0 .5],'MarkerSize',ms)
plot(vec,standard.RMSE_ENSO_3D,'g-','MarkerSize',ms)
plot(vec,mean(standard.TE_rms_Linearnet_prior),'b-','MarkerSize',ms)
plot(vec,mean(standard.TEHW_rms_Linearnet_prior),'m-','MarkerSize',ms)
plot(vec,mean(standard.TEWBHW_rms_Linearnet_prior),'r-','MarkerSize',ms)
ylabel('NRMS')
grid on

title('NRMS')

kk=26;
nexttile([1 2])
hold on
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,1)+data_mean_2,'color',[.5 0 .5],'DisplayName','Persistence','LineWidth',1)
plot(standard.tt_reference(1+kk:end),standard.u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(standard.standard_param(max_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TE_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'b-','DisplayName','T_E','LineWidth',2)
plot(standard.standard_param(max_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TEHW_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'m-','DisplayName','T_E','LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TEWBHW_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2)
xlim([1982 2000])
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])

kk=34;
nexttile([1 2])
hold on
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,1)+data_mean_2,'color',[.5 0 .5],'DisplayName','Persistence','LineWidth',1)
plot(standard.tt_reference(1+kk:end),standard.u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(standard.standard_param(max_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TE_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'b-','DisplayName','T_E','LineWidth',2)
plot(standard.standard_param(max_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TEHW_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'m-','DisplayName','T_E','LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TEWBHW_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2)
xlim([1982 2000])
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])
l=legend({'Persistence','3-D Model','$T_E$','$T_E,H_W$','$(T_E, H_W,\tau)$','Truth'},'location','Best');
l.Interpreter='latex';
l.FontSize=8;

title(t,'Standard Parameters: Effect of Covariates','FontSize',16)
width=800;
height=700;
set(gcf,'position',[10,10,width,height])

if saveflag==1
f=gcf;
exportgraphics(f,'standardparampriorEScovariates.png','Resolution',600)
saveas(f,'standardparampriorEScovariates.fig')
end



% figure
% t=tiledlayout(2,1,'TileSpacing','compact');
% nexttile
% p=boundedline(vec,mean(standard.TE_pc_Linearnet_prior),1.96*std(standard.TE_pc_Linearnet_prior)/sqrt(10));
% set(p,'LineWidth',2)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(groot,'DefaultLineLineWidth',1.2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
    'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
    'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])

figure
t=tiledlayout(2,4,'TileSpacing','compact');

kk=26;
nexttile([1 4])
hold on
plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(min_inds).response_test_1(:,1)+data_mean_1,'color',[.5 0 .5],'DisplayName','Persistence','LineWidth',1)
plot(standard.tt_reference(1+kk:end),standard.u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(standard.standard_param(max_inds).time_1(:,kk),data_std_1*standard.standard_param(max_inds).TE_prediction_Linearnet_prior_1(:,kk)+data_mean_1,'b-','DisplayName','T_E','LineWidth',2)
plot(standard.standard_param(max_inds).time_1(:,kk),data_std_1*standard.standard_param(max_inds).TEHW_prediction_Linearnet_prior_1(:,kk)+data_mean_1,'m-','DisplayName','(T_E,H_W)','LineWidth',2)
plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(max_inds).TEWBHW_prediction_Linearnet_prior_1(:,kk)+data_mean_1,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(min_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2)
xlim([2001 2019])
hold off
title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])

kk=34;
nexttile([1 4])
hold on
plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(min_inds).response_test_1(:,1)+data_mean_1,'color',[.5 0 .5],'DisplayName','Persistence','LineWidth',1)
plot(standard.tt_reference(1+kk:end),standard.u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(standard.standard_param(max_inds).time_1(:,kk),data_std_1*standard.standard_param(max_inds).TE_prediction_Linearnet_prior_1(:,kk)+data_mean_1,'b-','DisplayName','T_E','LineWidth',2)
plot(standard.standard_param(max_inds).time_1(:,kk),data_std_1*standard.standard_param(max_inds).TEHW_prediction_Linearnet_prior_1(:,kk)+data_mean_1,'m-','DisplayName','T_E','LineWidth',2)
plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(max_inds).TEWBHW_prediction_Linearnet_prior_1(:,kk)+data_mean_1,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(min_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2)
xlim([2001 2019])
hold off
title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])
l=legend({'Persistence','3-D Model','$T_E$','$(T_E,H_W)$','$(T_E, H_W,\tau)$','Truth'},'location','Best');
l.Interpreter='latex';
l.FontSize=8;

title(t,'Standard Parameters: Effect of Covariates','FontSize',16)
width=800;
height=700;
set(gcf,'position',[10,10,width,height])


if saveflag==1
f=gcf;
exportgraphics(f,'standardparampriorEScovariates20002020.png','Resolution',600)
saveas(f,'standardparampriorEScovariates20002020.fig')
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
colors=linspecer(6);
set(groot,'DefaultLineLineWidth',1.2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
    'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
    'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])

figure
t=tiledlayout(3,2,'TileSpacing','compact');
nexttile
hold on
boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_priorns),1.96*std(standard.TEWBHW_pc_Linearnet_priorns)/sqrt(10),'cmap',repmat(colors(6,:),10,1),'alpha')
%boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_priorpostns),1.96*std(standard.TEWBHW_pc_Linearnet_priorpostns)/sqrt(10),'cmap',repmat(colors(3,:),10,1))
% boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_priordatans),1.96*std(standard.TEWBHW_pc_Linearnet_priordatans)/sqrt(10),'cmap',repmat(colors(3,:),10,1))
 boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_priorpostns),1.96*std(standard.TEWBHW_pc_Linearnet_datans)/sqrt(10),'cmap',repmat(colors(5,:),10,1),'alpha')
ylabel('PC')
yline(.5,'-','LineWidth',2)
title('PC: Standard ML')
grid on

nexttile
hold on
p0=boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_prior),1.96*std(standard.TEWBHW_pc_Linearnet_prior)/sqrt(10),'cmap',repmat(colors(6,:),10,1),'alpha');
%p1=boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_priorpost),1.96*std(standard.TEWBHW_pc_Linearnet_priorpost)/sqrt(10),'cmap',repmat(colors(3,:),10,1));
% p1=boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_priordata),1.96*std(standard.TEWBHW_pc_Linearnet_priordata)/sqrt(10),'cmap',repmat(colors(3,:),10,1));
p2=boundedline(vec,mean(standard.TEWBHW_pc_Linearnet_priorpost),1.96*std(standard.TEWBHW_pc_Linearnet_data)/sqrt(10),'cmap',repmat(colors(5,:),10,1),'alpha');
ylabel('PC')
yline(.5,'-','LineWidth',2)
title('PC: BML')
grid on
l=legend( [p0(1), p2(1)],'Prior','Data+post');
l.Interpreter='latex';
l.FontSize=8;

kk=26;
nexttile([1 2])
hold on
%plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,1)+data_mean_2,'m--','DisplayName','Persistence','LineWidth',1)
%plot(standard.tt_reference(1+kk:end),standard.u1_save(kk,1:end-kk),'b:','DisplayName','3-D Model','LineWidth',1)
%plot(standard.standard_param(max_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TE_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'DisplayName','T_E','color',colors(1,:),'LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TEWBHW_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'DisplayName','(T_E,H_W,\tau)','color',colors(6,:),'LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2)
xlim([1982 2000])
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])

kk=34;
nexttile([1 2])
hold on
%plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,1)+data_mean_2,'m--','DisplayName','Persistence','LineWidth',1)
%plot(standard.tt_reference(1+kk:end),standard.u1_save(kk,1:end-kk),'b:','DisplayName','3-D Model','LineWidth',1)
%plot(standard.standard_param(max_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TE_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'DisplayName','T_E','color',colors(1,:),'LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(max_inds).TEWBHW_prediction_Linearnet_prior_2(:,kk)+data_mean_2,'DisplayName','(T_E,H_W,\tau)','color',colors(6,:),'LineWidth',2)
plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2)
xlim([1982 2000])
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])
l=legend({'$(T_E, H_W,\tau)$','Truth'},'location','Best');
l.Interpreter='latex';
l.FontSize=8;


title(t,'Standard Parameters: Effect of BML on PC','FontSize',16)
width=800;
height=700;
set(gcf,'position',[10,10,width,height])

if saveflag==1
f=gcf;
exportgraphics(f,'standardparamESvsnoES.png','Resolution',600)
saveas(f,'standardparamESvsnoES.fig')
end


% nexttile
% hold on
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_priorns),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_priorpostns),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_priordatans),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_priorpostdatans),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_datans),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec,standard.RMSE_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,standard.RMSE_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('NRMS')
% l=legend({'Prior','Prior+Post', 'Prior+Data','Prior+Post+Data','Data','Persistence','3-D Model'});
% l.Interpreter='latex';
% l.FontSize=8;
% grid on
% title('NRMS: No ES')
% 
% nexttile
% hold on
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_prior),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_priorpost),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_priordata),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_priorpostdata),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec,mean(standard.TEWBHW_rms_Linearnet_data),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec,standard.RMSE_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,standard.RMSE_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('NRMS')
% grid on
% title('NRMS: With ES')




% set(groot,'DefaultLineLineWidth',1,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
%     'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
%     'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])
% 
% [~,min_inds]=min(standard.pc5_TEWBHW_pc_Linearnet_prior);
% [~,max_inds]=max(standard.pc5_TEWBHW_pc_Linearnet_prior);
% 
% 
% 
% TEWBHW_prediction_Linearnet_priordata_2_plot=zeros(length(standard.standard_param(1).TEWBHW_prediction_Linearnet_priordata_2(:,1)),50,10);
% TEWBHW_prediction_Linearnet_priordata_1_plot=zeros(length(standard.standard_param(1).TEWBHW_prediction_Linearnet_priordata_1(:,1)),50,10);
% 
% 
% TEWBHW_prediction_Linearnet_priordata_2_plotns=zeros(length(standard.standard_param(1).TEWBHW_prediction_Linearnet_priordata_2(:,1)),50,10);
% TEWBHW_prediction_Linearnet_priordata_1_plotns=zeros(length(standard.standard_param(1).TEWBHW_prediction_Linearnet_priordata_1(:,1)),50,10);
% for i=1:10
%     TEWBHW_prediction_Linearnet_priordata_2_plot(:,:,i)=data_std_2*standard.standard_param(i).TEWBHW_prediction_Linearnet_priordata_2+data_mean_2;
%     TEWBHW_prediction_Linearnet_priordata_1_plot(:,:,i)=data_std_1*standard.standard_param(i).TEWBHW_prediction_Linearnet_priordata_1+data_mean_1;
%     
%     TEWBHW_prediction_Linearnet_priordata_2_plotns(:,:,i)=data_std_2*standard.standard_param(i).TEWBHW_prediction_Linearnet_priordatans_2+data_mean_2;
%     TEWBHW_prediction_Linearnet_priordata_1_plotns(:,:,i)=data_std_1*standard.standard_param(i).TEWBHW_prediction_Linearnet_priordatans_1+data_mean_1;
% end
% scaling=0
% kk=26;
% figure
% t=tiledlayout(4,1,'TileSpacing','compact');
% nexttile
% hold on
% p1=plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(standard.standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% % p3=boundedline(standard.standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plotns(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plotns(:,kk,:))')/sqrt(10),'cmap',colors(2,:),'transparency', .5);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% % set(p3(1),'LineWidth',2,'color',colors(2,:))
% xlim([1983 1999])
% hold off
% title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])
% kk=34;
% nexttile
% hold on
% p1=plot(standard.standard_param(min_inds).time_2(:,kk),data_std_2*standard.standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(standard.standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% % p3=boundedline(standard.standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plotns(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priordata_2_plotns(:,kk,:))')/sqrt(10),'cmap',colors(2,:),'transparency', .5);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% % set(p3(1),'LineWidth',2,'color',colors(2,:))
% xlim([1983 1999])
% hold off
% title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])
% kk=26;
% nexttile
% hold on
% p1=plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(min_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(standard.standard_param(max_inds).time_1(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priordata_1_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priordata_1_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% % p3=boundedline(standard.standard_param(max_inds).time_1(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priordata_1_plotns(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priordata_1_plotns(:,kk,:))')/sqrt(10),'cmap',colors(2,:),'transparency', .5);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% % set(p3(1),'LineWidth',2,'color',colors(2,:))
% xlim([2001 2019])
% k=34;
% hold off
% title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])
% nexttile
% kk=34
% hold on
% p1=plot(standard.standard_param(min_inds).time_1(:,kk),data_std_1*standard.standard_param(min_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(standard.standard_param(max_inds).time_1(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priordata_1_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priordata_1_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% xlim([2001 2019])
% hold off
% title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])
% 
% title(t,'BML: Prior and Obs','FontSize',16)
% 
% hL = legend([p1(1), p2(1)],'Truth','Prediction');
% hL.Interpreter='latex';
% hL.FontSize=10;
% newPosition = [0 .4 0.18 0.18];
% newUnits = 'normalized';
% set(hL,'Position', newPosition,'Units', newUnits);
% 
% width=800;
% height=700;
% set(gcf,'position',[10,10,width,height])
% 
% if saveflag==1
% f=gcf;
% exportgraphics(f,'standardtimeseries.png','Resolution',600)
% saveas(f,'standardtimeseries.fig')
% end
% 
% 
% 
% % set(groot,'DefaultLineLineWidth',1,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
% %     'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
% %     'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])
% % figure
% % data1 =var([standard.pc5_TEWBHW_pc_Linearnet_prior,standard.pc5_TEWBHW_pc_Linearnet_priordata,standard.pc5_TEWBHW_pc_Linearnet_priorpost,standard.pc5_TEWBHW_pc_Linearnet_priorpostdata]);
% % data2=var([standard.pc5_TEWBHW_pc_Linearnet_priorns,standard.pc5_TEWBHW_pc_Linearnet_priordatans,standard.pc5_TEWBHW_pc_Linearnet_priorpostns,standard.pc5_TEWBHW_pc_Linearnet_priorpostdatans]);
% % dataLabels = {'prior','prior,data','prior,post','prior,post,data'};
% % hold on;
% % bar(1:1:length(data1),[data1',data2']);
% % hold off;
% % ax = gca;
% % ax.XTick = 1:numel(dataLabels);
% % ax.XTickLabel = dataLabels;
% % ax.XLim = [0 numel(dataLabels)+1];
% % l=legend({'ES','No ES'});
% % l.Interpreter='latex';
% % l.FontSize=10;
% % title('Variance')