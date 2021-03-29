clear all
close all
saveflag=0;
% scale=sqrt(1);
scale=0;
d_u=1.5+scale*abs(randn(1));
d_tau = 2*2+abs(scale*randn(1));
omega_u = -1.5+abs(scale*randn(1));
sigma_u = 0.8+abs(scale*randn(1)); 
alpha_1 = 1+abs(scale*randn(1));
alpha_2 = (-0.4)+abs(scale*randn(1));
sigma_tau_scale=1;


[data_1,data_2,T_Sampling_1,T_Sampling_2,H_W_Sampling_1,H_W_Sampling_2,WB_Sampling_1,WB_Sampling_2]=generate_sampling_traj(d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);

load random_numbers.mat
m=1;
scale=sqrt(.8);
d_u=1.5+scale*random_numbers(1,m+2);
d_tau = 2*2+scale*random_numbers(2,m+2);
omega_u = -1.5+scale*random_numbers(3,m+2);
sigma_u = 0.8+scale*random_numbers(4,m+2);
alpha_1 = 1+scale*random_numbers(5,m+2);
alpha_2 = (-0.4)+scale*random_numbers(6,m+2);
sigma_tau_scale=random_numbers(7,m+2);
% sigma_tau_scale=1;
[data_1_n,data_2_n,T_Sampling_1_n,T_Sampling_2_n,H_W_Sampling_1_n,H_W_Sampling_2_n,WB_Sampling_1_n,WB_Sampling_2_n]=generate_sampling_traj(d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);





set(groot,'DefaultLineLineWidth',1.2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
    'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
    'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])

figure
t=tiledlayout(3,4,'TileSpacing','compact');
nexttile([1 4])
hold on
h1= plot(data_1(1).time,T_Sampling_1(1,:),'k-');
for i=1:29
    plot(data_1(1).time,T_Sampling_1(i,:),'k-');
end
h3=plot(data_1(1).time,data_1(1).data,'r-');
h2=plot(data_1(1).time,T_Sampling_1(30,:),'b-');
legend([h3,h2,h1],'Truth','Sample Path #1','Sample Paths #2-30')
title('T_E')
nexttile([1 4])
hold on
h1= plot(data_1(2).time,H_W_Sampling_1(1,:),'k-');
for i=1:29
    plot(data_1(2).time,H_W_Sampling_1(i,:),'k-');
end
h3=plot(data_1(2).time,data_1(2).data,'r-');
h2=plot(data_1(2).time,H_W_Sampling_1(30,:),'b-');
title('H_W')
nexttile([1 4])
hold on
h1= plot(data_1(3).time,WB_Sampling_1(1,:),'k-');
for i=1:29
    plot(data_1(3).time,WB_Sampling_1(i,:),'k-');
end
h3=plot(data_1(3).time,data_1(3).data,'r-');
h2=plot(data_1(3).time,WB_Sampling_1(30,:),'b-');
title('WB')

title(t,'Optimal Parameters: Posterior Sampled Trajectories 1982-2000','FontSize',12)
if saveflag==1
f=gcf;
%exportgraphics(f,'standard1982_2000_sampling.png','Resolution',600)
saveas(f,'standard1982_2000_sampling.fig')
end

figure
t=tiledlayout(3,4,'TileSpacing','compact');
nexttile([1 4])
hold on
h1= plot(data_2(1).time,T_Sampling_2(1,:),'k-');
for i=1:29
    plot(data_2(1).time,T_Sampling_2(i,:),'k-');
end
h3=plot(data_2(1).time,data_2(1).data,'r-');
h2=plot(data_2(1).time,T_Sampling_2(30,:),'b-');
legend([h3,h2,h1],'Truth','Sample Path #1','Sample Paths #2-30')
xlim([2000 2020])
title('T_E')
nexttile([1 4])
hold on
h1= plot(data_2(2).time,H_W_Sampling_2(1,:),'k-');
for i=1:29
    plot(data_2(2).time,H_W_Sampling_2(i,:),'k-');
end
h3=plot(data_2(2).time,data_2(2).data,'r-');
h2=plot(data_2(2).time,H_W_Sampling_2(30,:),'b-');
xlim([2000 2020])
title('H_W')
nexttile([1 4])
hold on
h1= plot(data_2(3).time,WB_Sampling_2(1,:),'k-');
for i=1:29
    plot(data_2(3).time,WB_Sampling_2(i,:),'k-');
end
h3=plot(data_2(3).time,data_2(3).data,'r-');
h2=plot(data_2(3).time,WB_Sampling_2(30,:),'b-');
xlim([2000 2020])
title('WB')

title(t,'Optimal Parameters: Posterior Sampled Trajectories 2000-2020','FontSize',12)
if saveflag==1
f=gcf;
%exportgraphics(f,'standard2000_2020_sampling.png','Resolution',600)
saveas(f,'standard2000_2020_sampling.fig')
end

%%%%%%%%%%%%%%%%%




set(groot,'DefaultLineLineWidth',1.2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
    'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
    'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])

figure
t=tiledlayout(3,4,'TileSpacing','compact');
nexttile([1 4])
hold on
h1= plot(data_1_n(1).time,T_Sampling_1_n(1,:),'k-');
for i=1:29
    plot(data_1_n(1).time,T_Sampling_1_n(i,:),'k-');
end
h3=plot(data_1_n(1).time,data_1_n(1).data,'r-');
h2=plot(data_1_n(1).time,T_Sampling_1_n(30,:),'b-');
legend([h3,h2,h1],'Truth','Sample Path #1','Sample Paths #2-30')
title('T_E')
nexttile([1 4])
hold on
h1= plot(data_1_n(2).time,H_W_Sampling_1_n(1,:),'k-');
for i=1:29
    plot(data_1_n(2).time,H_W_Sampling_1_n(i,:),'k-');
end
h3=plot(data_1_n(2).time,data_1_n(2).data,'r-');
h2=plot(data_1_n(2).time,H_W_Sampling_1_n(30,:),'b-');
title('H_W')
nexttile([1 4])
hold on
h1= plot(data_1_n(3).time,WB_Sampling_1_n(1,:),'k-');
for i=1:29
    plot(data_1_n(3).time,WB_Sampling_1_n(i,:),'k-');
end
h3=plot(data_1_n(3).time,data_1_n(3).data,'r-');
h2=plot(data_1_n(3).time,WB_Sampling_1_n(30,:),'b-');
title('WB')

title(t,'Perturbed Parameters: Posterior Sampled Trajectories 1982-2000','FontSize',12)
if saveflag==1
f=gcf;
%exportgraphics(f,'nonstandard1982_2000_sampling.png','Resolution',600)
saveas(f,'nonstandard1982_2000_sampling.fig')
end


figure
t=tiledlayout(3,4,'TileSpacing','compact');
nexttile([1 4])
hold on
h1= plot(data_2_n(1).time,T_Sampling_2_n(1,:),'k-');
for i=1:29
    plot(data_2_n(1).time,T_Sampling_2_n(i,:),'k-');
end
h3=plot(data_2_n(1).time,data_2_n(1).data,'r-');
h2=plot(data_2_n(1).time,T_Sampling_2_n(30,:),'b-');
xlim([2000 2020])
legend([h3,h2,h1],'Truth','Sample Path #1','Sample Paths #2-30')
title('T_E')
nexttile([1 4])
hold on
h1= plot(data_2_n(2).time,H_W_Sampling_2_n(1,:),'k-');
for i=1:29
    plot(data_2_n(2).time,H_W_Sampling_2_n(i,:),'k-');
end
h3=plot(data_2(2).time,data_2(2).data,'r-');
h2=plot(data_2_n(2).time,H_W_Sampling_2_n(30,:),'b-');
xlim([2000 2020])
title('H_W')

nexttile([1 4])
hold on
h1= plot(data_2_n(3).time,WB_Sampling_2_n(1,:),'k-');
for i=1:29
    plot(data_2_n(3).time,WB_Sampling_2_n(i,:),'k-');
end
h3=plot(data_2_n(3).time,data_2_n(3).data,'r-');
h2=plot(data_2_n(3).time,WB_Sampling_2_n(30,:),'b-');
xlim([2000 2020])
title('WB')

title(t,'Perturbed Parameters: Posterior Sampled Trajectories 2000-2020','FontSize',12)
if saveflag==1
f=gcf;
%exportgraphics(f,'standard2000_2020_sampling.png','Resolution',600)
saveas(f,'nonstandard2000_2020_sampling.fig')
end



if saveflag==1
save('sampling_figures_data.mat','data_1','data_1_n','data_2','data_2_n','T_Sampling_1','T_Sampling_1_n','T_Sampling_2','T_Sampling_2_n','H_W_Sampling_1','H_W_Sampling_1_n',...
    'H_W_Sampling_2','H_W_Sampling_2_n','WB_Sampling_1','WB_Sampling_1_n','WB_Sampling_2','WB_Sampling_2_n')
end

