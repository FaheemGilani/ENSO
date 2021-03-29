clear all
close all




saveflag=0;

nonstandard=load('nonstandardload.mat');
load('model_and_persistence.mat', 'Corr_ENSO_1D','RMSE_ENSO_1D','tt_reference')
load normalizations
addpath('boundedline/')

[~,min_inds]=min(nonstandard.pc5_TEWBHW_pc_Linearnet_prior);
[~,max_inds]=max(nonstandard.pc5_TEWBHW_pc_Linearnet_prior);


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
%plot(vec,Corr_ENSO_1D,'m-','MarkerSize',ms)
plot(vec,mean(nonstandard.Corr_ENSO_3D),'g-','MarkerSize',ms)
plot(vec,mean(nonstandard.TE_pc_Linearnet_priorpost),'b-','MarkerSize',ms)
plot(vec,mean(nonstandard.TEWBHW_pc_Linearnet_priorpost),'r-','MarkerSize',ms)
ylabel('PC')
yline(.5,'k-','LineWidth',2)
title('PC')
% l=legend({'Persistence','3-D Model','$T_E$','$(T_E, H_W,\tau)$'},'location','SouthWest');
l=legend({'3-D Model'},'location','SouthWest');
l.Interpreter='latex';
l.FontSize=8;
grid on

nexttile
hold on
%plot(vec,RMSE_ENSO_1D,'m-','MarkerSize',ms)
plot(vec,mean(nonstandard.RMSE_ENSO_3D),'g-','MarkerSize',ms)
plot(vec,mean(nonstandard.TE_rms_Linearnet_priorpost),'b-','MarkerSize',ms)
plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priorpost),'r-','MarkerSize',ms)
ylabel('NRMS')
grid on

title('NRMS')

kk=26;
nexttile([1 2])
hold on
% plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,1)+data_mean_2,'m--','DisplayName','Persistence','LineWidth',1)
plot(tt_reference(1+kk:end),nonstandard.non_standard_param(max_inds).u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(nonstandard.non_standard_param(max_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(max_inds).TE_prediction_Linearnet_priorpost_2(:,kk)+data_mean_2,'b-','DisplayName','T_E','LineWidth',2)
plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(max_inds).TEWBHW_prediction_Linearnet_priorpost_2(:,kk)+data_mean_2,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2)
xlim([1982 2000])
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])

kk=34;
nexttile([1 2])
hold on
% plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,1)+data_mean_2,'m--','DisplayName','Persistence','LineWidth',1)
plot(tt_reference(1+kk:end),nonstandard.non_standard_param(max_inds).u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(nonstandard.non_standard_param(max_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(max_inds).TE_prediction_Linearnet_priorpost_2(:,kk)+data_mean_2,'b-','DisplayName','T_E','LineWidth',2)
plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(max_inds).TEWBHW_prediction_Linearnet_priorpost_2(:,kk)+data_mean_2,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2)
xlim([1982 2000])
l=legend({'3-D Model','$T_E$','$(T_E, H_W,\tau)$','Truth'},'location','best');
l.Interpreter='latex';
l.FontSize=8;
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])

title(t,'Perturbed Parameters: Effect of Covariates','FontSize',16)
width=800;
height=700;
set(gcf,'position',[10,10,width,height])

if saveflag==1
f=gcf;
exportgraphics(f,'nonstandardparampriorEScovariates.png','Resolution',600)
saveas(f,'nonstandardparampriorEScovariates.fig')
end


%%%%%%%%%%%

set(groot,'DefaultLineLineWidth',1.2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
    'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
    'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])

figure
t=tiledlayout(2,4,'TileSpacing','compact');

kk=26;
nexttile([1 4])
hold on
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).response_test_1(:,1)+data_mean_1,'DisplayName','Persistence','color',[.5 0 .5],'LineWidth',1)
plot(tt_reference(1+kk:end),nonstandard.non_standard_param(max_inds).u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).TE_prediction_Linearnet_priorpost_1(:,kk)+data_mean_1,'b-','DisplayName','T_E','LineWidth',2)
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).TEWBHW_prediction_Linearnet_priorpost_1(:,kk)+data_mean_1,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2)
xlim([2001 2019])
hold off
title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])

kk=34;
nexttile([1 4])
hold on
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).response_test_1(:,1)+data_mean_1,'color',[.5 0 .5],'DisplayName','Persistence','LineWidth',1)
plot(tt_reference(1+kk:end),nonstandard.non_standard_param(max_inds).u1_save(kk,1:end-kk),'g-','DisplayName','3-D Model','LineWidth',1)
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).TE_prediction_Linearnet_priorpost_1(:,kk)+data_mean_1,'b-','DisplayName','T_E','LineWidth',2)
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).TEWBHW_prediction_Linearnet_priorpost_1(:,kk)+data_mean_1,'r-','DisplayName','(T_E,H_W,\tau)','LineWidth',2)
plot(nonstandard.non_standard_param(max_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(max_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2)
xlim([2001 2019])
l=legend({'Persistence','3-D Model','$T_E$','$(T_E, H_W,\tau)$','Truth'},'location','best');
% l=legend({'3-D Model','$T_E$','$(T_E, H_W,\tau)$','Truth'},'location','best');
l.Interpreter='latex';
l.FontSize=8;
hold off
title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])


if saveflag==1
f=gcf;
exportgraphics(f,'nonstandardparampriorEScovariates20002020.png','Resolution',600)
saveas(f,'nonstandardparampriorEScovariates20002020.fig')
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
boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_datans),1.96*std(nonstandard.TEWBHW_pc_Linearnet_datans)/sqrt(10),'cmap',repmat(colors(5,:),10,1),'alpha')
boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_priorns),1.96*std(nonstandard.TEWBHW_pc_Linearnet_priorns)/sqrt(10),'cmap',repmat(colors(6,:),10,1),'alpha')
boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_priorpostns),1.96*std(nonstandard.TEWBHW_pc_Linearnet_priorpostns)/sqrt(10),'cmap',repmat(colors(2,:),10,1),'alpha')
% boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_priorpostdatans),1.96*std(nonstandard.TEWBHW_pc_Linearnet_priorpostdatans)/sqrt(10),'cmap',repmat(colors(3,:),10,1))
ylabel('PC')
yline(.5,'-','LineWidth',2)
title('PC: Standard ML')
grid on

nexttile
hold on
p0=boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_data),1.96*std(nonstandard.TEWBHW_pc_Linearnet_data)/sqrt(10),'cmap',repmat(colors(5,:),10,1),'alpha');
p1=boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_prior),1.96*std(nonstandard.TEWBHW_pc_Linearnet_prior)/sqrt(10),'cmap',repmat(colors(6,:),10,1),'alpha');
p2=boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_priorpost),1.96*std(nonstandard.TEWBHW_pc_Linearnet_priorpost)/sqrt(10),'cmap',repmat(colors(2,:),10,1),'alpha');
% p3=boundedline(vec,mean(nonstandard.TEWBHW_pc_Linearnet_priorpostdata),1.96*std(nonstandard.TEWBHW_pc_Linearnet_priorpostdata)/sqrt(10),'cmap',repmat(colors(3,:),10,1));
ylabel('PC')
yline(.5,'-','LineWidth',2)
title('PC: BML')
grid on
% l=legend( [p0(1), p1(1), p2(1), p3(1)],'prior+post','prior','Prior+Post+Obs','prior+obs');
l=legend([p0(1), p1(1), p2(1)],'data','prior','prior+post','location','southwest');
l.Interpreter='latex';
l.FontSize=8;

kk=26;
nexttile([1 2])
hold on
plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2)
plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(max_inds).TEWBHW_prediction_Linearnet_priorpost_2(:,kk)+data_mean_2,'DisplayName','(T_E,H_W,\tau)','color',colors(2,:),'LineWidth',2)

xlim([1982 2000])
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])

kk=34;
nexttile([1 2])
hold on
p0=plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2);
p1=plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(max_inds).TEWBHW_prediction_Linearnet_priorpost_2(:,kk)+data_mean_2,'DisplayName','(T_E,H_W,\tau)','color',colors(2,:),'LineWidth',2);
xlim([1982 2000])
hold off
title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])
l=legend([p0(1), p1(1)],'prior+post','Truth','location','best');
l.Interpreter='latex';
l.FontSize=8;

title(t,'Perturbed Parameters: Effect BML on PC','FontSize',16)
width=800;
height=700;
set(gcf,'position',[10,10,width,height])

if saveflag==1
f=gcf;
exportgraphics(f,'nonstandardparamESvsnoES.png','Resolution',600)
saveas(f,'nonstandardparamESvsnoES.fig')
end


% nexttile
% hold on
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priorns),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priorpostns),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priordatans),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priorpostdatans),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_datans),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec,nonstandard.RMSE_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,nonstandard.RMSE_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('NRMS')
% l=legend({'Prior','Prior+Post', 'Prior+Data','Prior+Post+Data','Data','Persistence','3-D Model'});
% l.Interpreter='latex';
% l.FontSize=8;
% grid on
% title('NRMS: No ES')
% 
% nexttile
% hold on
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_prior),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priorpost),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priordata),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_priorpostdata),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec,mean(nonstandard.TEWBHW_rms_Linearnet_data),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec,nonstandard.RMSE_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,nonstandard.RMSE_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('NRMS')
% grid on
% title('NRMS: With ES')




% set(groot,'DefaultLineLineWidth',1,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
%     'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
%     'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])
% 
% [~,min_inds]=min(nonstandard.pc5_TEWBHW_pc_Linearnet_prior);
% [~,max_inds]=max(nonstandard.pc5_TEWBHW_pc_Linearnet_prior);
% 
% 
% 
% TEWBHW_prediction_Linearnet_priorpostdata_2_plot=zeros(length(nonstandard.non_standard_param(1).TEWBHW_prediction_Linearnet_priorpostdata_2(:,1)),50,10);
% TEWBHW_prediction_Linearnet_priorpostdata_1_plot=zeros(length(nonstandard.non_standard_param(1).TEWBHW_prediction_Linearnet_priorpostdata_1(:,1)),50,10);
% 
% 
% TEWBHW_prediction_Linearnet_priorpostdata_2_plotns=zeros(length(nonstandard.non_standard_param(1).TEWBHW_prediction_Linearnet_priorpostdata_2(:,1)),50,10);
% TEWBHW_prediction_Linearnet_priorpostdata_1_plotns=zeros(length(nonstandard.non_standard_param(1).TEWBHW_prediction_Linearnet_priorpostdata_1(:,1)),50,10);
% for i=1:10
%     TEWBHW_prediction_Linearnet_priorpostdata_2_plot(:,:,i)=data_std_2*nonstandard.non_standard_param(i).TEWBHW_prediction_Linearnet_priorpostdata_2+data_mean_2;
%     TEWBHW_prediction_Linearnet_priorpostdata_1_plot(:,:,i)=data_std_1*nonstandard.non_standard_param(i).TEWBHW_prediction_Linearnet_priorpostdata_1+data_mean_1;
%     
%     TEWBHW_prediction_Linearnet_priorpostdata_2_plotns(:,:,i)=data_std_2*nonstandard.non_standard_param(i).TEWBHW_prediction_Linearnet_priorpostdatans_2+data_mean_2;
%     TEWBHW_prediction_Linearnet_priorpostdata_1_plotns(:,:,i)=data_std_1*nonstandard.non_standard_param(i).TEWBHW_prediction_Linearnet_priorpostdatans_1+data_mean_1;
% end
% scaling=0
% kk=26;
% figure
% t=tiledlayout(4,1,'TileSpacing','compact');
% nexttile
% hold on
% p1=plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(nonstandard.non_standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% % p3=boundedline(nonstandard.non_standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plotns(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plotns(:,kk,:))')/sqrt(10),'cmap',colors(2,:),'transparency', .5);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% % set(p3(1),'LineWidth',2,'color',colors(2,:))
% xlim([1983 1999])
% hold off
% title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])
% kk=34;
% nexttile
% hold on
% p1=plot(nonstandard.non_standard_param(min_inds).time_2(:,kk),data_std_2*nonstandard.non_standard_param(min_inds).response_test_2(:,kk)+data_mean_2,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(nonstandard.non_standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% % p3=boundedline(nonstandard.non_standard_param(max_inds).time_2(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plotns(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_2_plotns(:,kk,:))')/sqrt(10),'cmap',colors(2,:),'transparency', .5);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% % set(p3(1),'LineWidth',2,'color',colors(2,:))
% xlim([1983 1999])
% hold off
% title(['1983-2000: ' num2str(round(kk/4.2857)) ' Months'])
% kk=26;
% nexttile
% hold on
% p1=plot(nonstandard.non_standard_param(min_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(min_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(nonstandard.non_standard_param(max_inds).time_1(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_1_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_1_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% % p3=boundedline(nonstandard.non_standard_param(max_inds).time_1(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_1_plotns(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_1_plotns(:,kk,:))')/sqrt(10),'cmap',colors(2,:),'transparency', .5);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% % set(p3(1),'LineWidth',2,'color',colors(2,:))
% xlim([2001 2019])
% kk=34;
% hold off
% title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])
% nexttile
% hold on
% p1=plot(nonstandard.non_standard_param(min_inds).time_1(:,kk),data_std_1*nonstandard.non_standard_param(min_inds).response_test_1(:,kk)+data_mean_1,'k-','DisplayName','Truth','LineWidth',2);
% p2=boundedline(nonstandard.non_standard_param(max_inds).time_1(:,kk),mean(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_1_plot(:,kk,:))'),scaling*std(squeeze(TEWBHW_prediction_Linearnet_priorpostdata_1_plot(:,kk,:))')/sqrt(10),'cmap',colors(3,:),'transparency', .8);
% set(p2(1),'LineWidth',2,'color',colors(3,:))
% xlim([2001 2019])
% hold off
% title(['2000-2020: ' num2str(round(kk/4.2857)) ' Months'])
% 
% title(t,'BML: Prior,post and Obs','FontSize',16)
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
% exportgraphics(f,'nonstandardtimeseries.png','Resolution',600)
% saveas(f,'nonstandardtimeseries.fig')
% end
% 
% 
% 
% % set(groot,'DefaultLineLineWidth',1,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
% %     'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
% %     'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])
% % figure
% % data1 =var([nonstandard.pc5_TEWBHW_pc_Linearnet_prior,nonstandard.pc5_TEWBHW_pc_Linearnet_priordata,nonstandard.pc5_TEWBHW_pc_Linearnet_priorpost,nonstandard.pc5_TEWBHW_pc_Linearnet_priorpostdata]);
% % data2=var([nonstandard.pc5_TEWBHW_pc_Linearnet_priorns,nonstandard.pc5_TEWBHW_pc_Linearnet_priordatans,nonstandard.pc5_TEWBHW_pc_Linearnet_priorpostns,nonstandard.pc5_TEWBHW_pc_Linearnet_priorpostdatans]);
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