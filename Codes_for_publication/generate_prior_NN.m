function generate_prior_NN(d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale)



load ENSO_Reference.mat
cd('/home/faheem/Projects/ENSO/codes')
% addpath('CIDM\')
Total_WB=uwnd_mean;




M = containers.Map({'TE','HW','WB','DiffTE','IntWB','PosWB','TEsmooth'},[1 2 3 4 5 6 7]);
Keys={'TE','HW','WB','DiffTE','IntWB','PosWB','TEsmooth'};
clear experiments
experiments{1}=[M('TE') M('WB')];
experiments{2}=[M('TE') M('HW')];
experiments{3}=M('TE');
experiments{4}=[M('TE') M('DiffTE')];
experiments{5}=[M('TE') M('DiffTE') M('WB')];
experiments{6}=[M('TE') M('IntWB')];
experiments{7}=[M('TE') M('IntWB') M('WB')];
experiments{8}=[M('TE') M('IntWB') M('PosWB')];
experiments{9}=[M('TE') M('DiffTE') M('PosWB')];
experiments{10}=[M('TE') M('PosWB')];
experiments{11}=[M('TE') M('DiffTE') M('IntWB') M('PosWB')];
experiments{12}=[M('TE') M('TEsmooth') M('WB')];
experiments{13}=[M('TE') M('HW') M('WB')];
experiments{14}=[M('TE') M('WB') M('DiffTE') M('HW')];


lag=[8 8 8 8 8 8 8];
numavg=[7 7 1 7 7 7 7];

exp_index=experiments{14};
resp_index=[1];
% resp_index=exp_index;



navg=1;
% units_for_30=4;
max_time=50;
intlength=60;
WBsmoothflag_s=0; 
TEsmoothflag_s=0;
WBsmoothflag_s2=0;




priordata_1=ENSOmodelintegrated2(210000,1,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);
priordata_2=ENSOmodelintegrated2(210000,2,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);






prior_1=priorstruct(1,priordata_1);
prior_2=priorstruct(1,priordata_2);






split=length(Y(Y<=2000));
time_1=Y(1:1:split);
time_2=Y(split+1:1:end);




data=[T_E;H_W;Total_WB];
smoothmethod='rloess';
smoothwindow=[500 0];
WBsmoothflag_t=0;
TEsmoothflag_t=0;

burn=1;
burn2=0;

data_1=datastruct(navg,data,time_1,Y,intlength,smoothmethod,smoothwindow,WBsmoothflag_t,TEsmoothflag_t,burn,burn2);
data_2=datastruct(navg,data,time_2,Y,intlength,smoothmethod,smoothwindow,WBsmoothflag_t,TEsmoothflag_t,burn,burn2);

% data_full=data_1;
% for i=1:numel(data_full)
%     data_full(i).data=[data_1(i).data,data_2(i).data];
% end
    



    
split=length(Y(Y<=2000));
time_1=Y(1:1:split);
time_2=Y(split+1:1:end);
no_tr=30;
specs=1;
Gen_1=samplejoin(data_1(1).time,no_tr,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);
Gen_2=samplejoin(data_2(1).time,no_tr,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);

Sampling_1=priorstruct(1,Gen_1);
Sampling_2=priorstruct(1,Gen_2);


priordata_1=prior_1;
priordata_2=prior_2;
for i=1:numel(prior_1)
    priordata_1(i).data=[prior_1(i).data,data_1(i).data];
    priordata_2(i).data=[prior_2(i).data,data_2(i).data];
end



priorpost_1=prior_1;
priorpost_2=prior_2;
for i=1:numel(prior_1)
    priorpost_1(i).data=[prior_1(i).data(1:100000),Sampling_1(i).data(1:100000)];
    priorpost_2(i).data=[prior_2(i).data(1:100000),Sampling_2(i).data(1:100000)];
end

priorpostdata_1=prior_1;
priorpostdata_2=prior_2;

for i=1:numel(prior_1)
    priorpostdata_1(i).data=[prior_1(i).data(1:140000),data_1(i).data,Sampling_1(i).data(1:70000)];
    priorpostdata_2(i).data=[prior_2(i).data(1:140000),data_2(i).data,Sampling_2(i).data(1:70000)];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[testing_struct_1,~,~]=standardize_struct(data_2,data_1);
[testing_struct_2,~,~]=standardize_struct(data_1,data_2);

[sampling_training_struct_1,~,~]=standardize_struct(Sampling_1,data_1);
[sampling_training_struct_2,~,~]=standardize_struct(Sampling_2,data_2);


[prior_training_1,~,~]=standardize_struct(prior_1,data_1);
[prior_training_2,~,~]=standardize_struct(prior_2,data_2);


[data_training_struct_1,data_mean_1,data_std_1]=standardize_struct(data_1,data_1);
[data_training_struct_2,data_mean_2,data_std_2]=standardize_struct(data_2,data_2);


[priordata_training_1,~,~]=standardize_struct(priordata_1,data_1);
[priordata_training_2,~,~]=standardize_struct(priordata_2,data_2);

[priorpost_training_1,~,~]=standardize_struct(priorpost_1,data_1);
[priorpost_training_2,~,~]=standardize_struct(priorpost_2,data_2);


[priorpostdata_training_1,~,~]=standardize_struct(priorpostdata_1,data_1);
[priorpostdata_training_2,~,~]=standardize_struct(priorpostdata_2,data_2);


% [testing_struct_1,testing_mean_1,testing_std_1]=standardize_struct(data_2,data_full);
% [testing_struct_2,testing_mean_2,testing_std_2]=standardize_struct(data_1,data_full);
% 
% [sampling_training_struct_1,sampling_mean_1,sampling_std_1]=standardize_struct(Sampling_1,data_full);
% [sampling_training_struct_2,sampling_mean_2,sampling_std_2]=standardize_struct(Sampling_2,data_full);
% 
% 
% [prior_training_1,~,~]=standardize_struct(prior_1,data_full);
% [prior_training_2,~,~]=standardize_struct(prior_2,data_full);
% 
% 
% [data_training_struct_1,data_mean_1,data_std_1]=standardize_struct(data_1,data_full);
% [data_training_struct_2,data_mean_2,data_std_2]=standardize_struct(data_2,data_full);



cd('/home/faheem/Projects/ENSO/codes/Meetings/Feb_5_2021/')
save('normalizations.mat','data_mean_1','data_mean_2','data_std_1','data_std_2');
cd('../..')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




 

[covariate_priordata_1,response_priordata_1,~]=embed_multi2(priordata_training_1,max_time,lag,exp_index,numavg,resp_index,0);
[covariate_priordata_2,response_priordata_2,~]=embed_multi2(priordata_training_2,max_time,lag,exp_index,numavg,resp_index,0);


[covariate_priorpost_1,response_priorpost_1,~]=embed_multi2(priorpost_training_1,max_time,lag,exp_index,numavg,resp_index,0);
[covariate_priorpost_2,response_priorpost_2,~]=embed_multi2(priorpost_training_2,max_time,lag,exp_index,numavg,resp_index,0);

[covariate_priorpostdata_1,response_priorpostdata_1,~]=embed_multi2(priorpostdata_training_1,max_time,lag,exp_index,numavg,resp_index,0);
[covariate_priorpostdata_2,response_priorpostdata_2,~]=embed_multi2(priorpostdata_training_2,max_time,lag,exp_index,numavg,resp_index,0);


[covariate_prior_1,response_prior_1,~]=embed_multi2(prior_training_1,max_time,lag,exp_index,numavg,resp_index,0);
[covariate_prior_2,response_prior_2,~]=embed_multi2(prior_training_2,max_time,lag,exp_index,numavg,resp_index,0);

[covariate_test_1,response_test_1,time_1]=embed_multi2(testing_struct_1,max_time,lag,exp_index,numavg,resp_index,0);
[covariate_test_2,response_test_2,time_2]=embed_multi2(testing_struct_2,max_time,lag,exp_index,numavg,resp_index,0);


[covariate_sampling_1,response_sampling_1,~]=embed_multi2(sampling_training_struct_1,max_time,lag,exp_index,numavg,resp_index,0);
[covariate_sampling_2,response_sampling_2,~]=embed_multi2(sampling_training_struct_2,max_time,lag,exp_index,numavg,resp_index,0);

% covariate_sampling_1=[covariate_sampling_1;covariate_prior_1(1:10000,:)];
% covariate_sampling_2=[covariate_sampling_2;covariate_prior_2(1:10000,:)];

% response_sampling_1=[response_sampling_1;response_prior_1(1:10000,:)];
% response_sampling_2=[response_sampling_2;response_prior_2(1:10000,:)];


[Dcovariate_train_1,Dresponse_train_1,~]=embed_multi2(data_training_struct_1,max_time,lag,exp_index,numavg,resp_index,0);
[Dcovariate_train_2,Dresponse_train_2,~]=embed_multi2(data_training_struct_2,max_time,lag,exp_index,numavg,resp_index,0);


disp('done')


save('perturbed.mat','covariate_priordata_1','covariate_priorpost_1','covariate_priorpostdata_1','covariate_priordata_2','covariate_priorpost_2','covariate_priorpostdata_2',...
    'Dcovariate_train_1','Dcovariate_train_2','covariate_sampling_1','covariate_sampling_2','covariate_prior_1','covariate_prior_2','covariate_test_1',...
    'covariate_test_2','response_sampling_1','response_sampling_2','response_test_1','response_test_2','response_prior_1','response_prior_2','Dresponse_train_1',...
    'covariate_priordata_1','covariate_priorpost_1','covariate_priorpostdata_1','covariate_priordata_2','covariate_priorpost_2','covariate_priorpostdata_2',...
    'response_priordata_1','response_priorpost_1','response_priorpostdata_1','response_priordata_2','response_priorpost_2','response_priorpostdata_2',...
    'Dresponse_train_2','time_1','time_2','Sampling_1','Sampling_2','prior_1','prior_2','data_1','data_2')


