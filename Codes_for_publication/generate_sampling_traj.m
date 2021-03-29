function [data_1,data_2,T_Sampling_1,T_Sampling_2,H_W_Sampling_1,H_W_Sampling_2,WB_Sampling_1,WB_Sampling_2]=generate_sampling_traj(d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale)
load ENSO_Reference.mat





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
intlength=60;

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
    



    
no_tr=30;
[T_Sampling_1,H_W_Sampling_1,WB_Sampling_1]=EnsoSampleGenerate([data_1(1).time(1) data_1(1).time(end)],no_tr,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);
[T_Sampling_2,H_W_Sampling_2,WB_Sampling_2]=EnsoSampleGenerate([data_2(1).time(1) data_2(1).time(end)],no_tr,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);

