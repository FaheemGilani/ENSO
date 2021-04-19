trials=10;

standard_param=repmat(struct('time_1',[],'time_2',[],'response_test_1',[], 'response_test_2',[],...
    'TE_prediction_Linearnet_priorval_1',[],'TE_prediction_Linearnet_priorval_2',[],...
    'TE_prediction_Linearnet_priordataval_1',[],'TE_prediction_Linearnet_priordataval_2',[],...
    'TE_prediction_Linearnet_priorpostval_1',[],'TE_prediction_Linearnet_priorpostval_2',[],...
    'TE_prediction_Linearnet_priorpostdataval_1',[],'TE_prediction_Linearnet_priorpostdataval_2',[],...
    'TE_prediction_Linearnet_dataval_1',[],'TE_prediction_Linearnet_dataval_2',[],...
    'TE_prediction_Linearnet_samplingval_1',[],'TE_prediction_Linearnet_samplingval_2',[],...
    'TE_prediction_Linearnet_priorns_1',[],'TE_prediction_Linearnet_priorns_2',[],...
    'TE_prediction_Linearnet_priordatans_1',[],'TE_prediction_Linearnet_priordatans_2',[],...
    'TE_prediction_Linearnet_priorpostns_1',[],'TE_prediction_Linearnet_priorpostns_2',[],...
    'TE_prediction_Linearnet_priorpostdatans_1',[],'TE_prediction_Linearnet_priorpostdatans_2',[],...
    'TE_prediction_Linearnet_datans_1',[],'TE_prediction_Linearnet_datans_2',[],...
    'TE_prediction_Linearnet_samplingns_1',[],'TE_prediction_Linearnet_samplingns_2',[],...
    'TE_prediction_Linearnet_prior_1',[],'TE_prediction_Linearnet_prior_2',[],...
    'TE_prediction_Linearnet_priordata_1',[],'TE_prediction_Linearnet_priordata_2',[],...
    'TE_prediction_Linearnet_priorpost_1',[],'TE_prediction_Linearnet_priorpost_2',[],...
    'TE_prediction_Linearnet_priorpostdata_1',[],'TE_prediction_Linearnet_priorpostdata_2',[],...
    'TE_prediction_Linearnet_data_1',[],'TE_prediction_Linearnet_data_2',[],...
    'TE_prediction_Linearnet_sampling_1',[],'TE_prediction_Linearnet_sampling_2',[],...
    'TEHW_prediction_Linearnet_priorval_1',[],'TEHW_prediction_Linearnet_priorval_2',[],...
    'TEHW_prediction_Linearnet_priordataval_1',[],'TEHW_prediction_Linearnet_priordataval_2',[],...
    'TEHW_prediction_Linearnet_priorpostval_1',[],'TEHW_prediction_Linearnet_priorpostval_2',[],...
    'TEHW_prediction_Linearnet_priorpostdataval_1',[],'TEHW_prediction_Linearnet_priorpostdataval_2',[],...
    'TEHW_prediction_Linearnet_dataval_1',[],'TEHW_prediction_Linearnet_dataval_2',[],...
    'TEHW_prediction_Linearnet_samplingval_1',[],'TEHW_prediction_Linearnet_samplingval_2',[],...
    'TEHW_prediction_Linearnet_priorns_1',[],'TEHW_prediction_Linearnet_priorns_2',[],...
    'TEHW_prediction_Linearnet_priordatans_1',[],'TEHW_prediction_Linearnet_priordatans_2',[],...
    'TEHW_prediction_Linearnet_priorpostns_1',[],'TEHW_prediction_Linearnet_priorpostns_2',[],...
    'TEHW_prediction_Linearnet_priorpostdatans_1',[],'TEHW_prediction_Linearnet_priorpostdatans_2',[],...
    'TEHW_prediction_Linearnet_datans_1',[],'TEHW_prediction_Linearnet_datans_2',[],...
    'TEHW_prediction_Linearnet_samplingns_1',[],'TEHW_prediction_Linearnet_samplingns_2',[],...
    'TEHW_prediction_Linearnet_prior_1',[],'TEHW_prediction_Linearnet_prior_2',[],...
    'TEHW_prediction_Linearnet_priordata_1',[],'TEHW_prediction_Linearnet_priordata_2',[],...
    'TEHW_prediction_Linearnet_priorpost_1',[],'TEHW_prediction_Linearnet_priorpost_2',[],...
    'TEHW_prediction_Linearnet_priorpostdata_1',[],'TEHW_prediction_Linearnet_priorpostdata_2',[],...
    'TEHW_prediction_Linearnet_data_1',[],'TEHW_prediction_Linearnet_data_2',[],...
    'TEHW_prediction_Linearnet_sampling_1',[],'TEHW_prediction_Linearnet_sampling_2',[],...
    'TEWB_prediction_Linearnet_priorval_1',[],'TEWB_prediction_Linearnet_priorval_2',[],...
    'TEWB_prediction_Linearnet_priordataval_1',[],'TEWB_prediction_Linearnet_priordataval_2',[],...
    'TEWB_prediction_Linearnet_priorpostval_1',[],'TEWB_prediction_Linearnet_priorpostval_2',[],...
    'TEWB_prediction_Linearnet_priorpostdataval_1',[],'TEWB_prediction_Linearnet_priorpostdataval_2',[],...
    'TEWB_prediction_Linearnet_dataval_1',[],'TEWB_prediction_Linearnet_dataval_2',[],...
    'TEWB_prediction_Linearnet_samplingval_1',[],'TEWB_prediction_Linearnet_samplingval_2',[],...
    'TEWB_prediction_Linearnet_priorns_1',[],'TEWB_prediction_Linearnet_priorns_2',[],...
    'TEWB_prediction_Linearnet_priordatans_1',[],'TEWB_prediction_Linearnet_priordatans_2',[],...
    'TEWB_prediction_Linearnet_priorpostns_1',[],'TEWB_prediction_Linearnet_priorpostns_2',[],...
    'TEWB_prediction_Linearnet_priorpostdatans_1',[],'TEWB_prediction_Linearnet_priorpostdatans_2',[],...
    'TEWB_prediction_Linearnet_datans_1',[],'TEWB_prediction_Linearnet_datans_2',[],...
    'TEWB_prediction_Linearnet_samplingns_1',[],'TEWB_prediction_Linearnet_samplingns_2',[],...
    'TEWB_prediction_Linearnet_prior_1',[],'TEWB_prediction_Linearnet_prior_2',[],...
    'TEWB_prediction_Linearnet_priordata_1',[],'TEWB_prediction_Linearnet_priordata_2',[],...
    'TEWB_prediction_Linearnet_priorpost_1',[],'TEWB_prediction_Linearnet_priorpost_2',[],...
    'TEWB_prediction_Linearnet_priorpostdata_1',[],'TEWB_prediction_Linearnet_priorpostdata_2',[],...
    'TEWB_prediction_Linearnet_data_1',[],'TEWB_prediction_Linearnet_data_2',[],...
    'TEWB_prediction_Linearnet_sampling_1',[],'TEWB_prediction_Linearnet_sampling_2',[],...
    'TEWBHW_prediction_Linearnet_priorval_1',[],'TEWBHW_prediction_Linearnet_priorval_2',[],...
    'TEWBHW_prediction_Linearnet_priordataval_1',[],'TEWBHW_prediction_Linearnet_priordataval_2',[],...
    'TEWBHW_prediction_Linearnet_priorpostval_1',[],'TEWBHW_prediction_Linearnet_priorpostval_2',[],...
    'TEWBHW_prediction_Linearnet_priorpostdataval_1',[],'TEWBHW_prediction_Linearnet_priorpostdataval_2',[],...
    'TEWBHW_prediction_Linearnet_dataval_1',[],'TEWBHW_prediction_Linearnet_dataval_2',[],...
    'TEWBHW_prediction_Linearnet_samplingval_1',[],'TEWBHW_prediction_Linearnet_samplingval_2',[],...
    'TEWBHW_prediction_Linearnet_priorns_1',[],'TEWBHW_prediction_Linearnet_priorns_2',[],...
    'TEWBHW_prediction_Linearnet_priordatans_1',[],'TEWBHW_prediction_Linearnet_priordatans_2',[],...
    'TEWBHW_prediction_Linearnet_priorpostns_1',[],'TEWBHW_prediction_Linearnet_priorpostns_2',[],...
    'TEWBHW_prediction_Linearnet_priorpostdatans_1',[],'TEWBHW_prediction_Linearnet_priorpostdatans_2',[],...
    'TEWBHW_prediction_Linearnet_datans_1',[],'TEWBHW_prediction_Linearnet_datans_2',[],...
    'TEWBHW_prediction_Linearnet_samplingns_1',[],'TEWBHW_prediction_Linearnet_samplingns_2',[],...
    'TEWBHW_prediction_Linearnet_prior_1',[],'TEWBHW_prediction_Linearnet_prior_2',[],...
    'TEWBHW_prediction_Linearnet_priordata_1',[],'TEWBHW_prediction_Linearnet_priordata_2',[],...
    'TEWBHW_prediction_Linearnet_priorpost_1',[],'TEWBHW_prediction_Linearnet_priorpost_2',[],...
    'TEWBHW_prediction_Linearnet_priorpostdata_1',[],'TEWBHW_prediction_Linearnet_priorpostdata_2',[],...
    'TEWBHW_prediction_Linearnet_data_1',[],'TEWBHW_prediction_Linearnet_data_2',[],...
    'TEWBHW_prediction_Linearnet_sampling_1',[],'TEWBHW_prediction_Linearnet_sampling_2',[],...
    'TEWBHW_pc_Linearnet_prior',[],...
    'TEWBHW_pc_Linearnet_priordata',[],...
    'TEWBHW_pc_Linearnet_priorpost',[],...
    'TEWBHW_pc_Linearnet_priorpostdata',[],...
    'TEWBHW_pc_Linearnet_data',[],...
    'TEWBHW_pc_Linearnet_sampling',[],...
    'u1_save',[],'u2_save',[],'tau_save',[],'tt_reference',[]),1,trials);





for i=1:trials 
% scale=sqrt(1);
scale=0;
d_u=1.5+scale*abs(randn(1));
d_tau = 2*2+abs(scale*randn(1));
omega_u = -1.5+abs(scale*randn(1));
sigma_u = 0.8+abs(scale*randn(1)); % determined by quadratic variation
alpha_1 = 1+abs(scale*randn(1));
alpha_2 = (-0.4)+abs(scale*randn(1));
% sigma_tau_scale=abs(rand(1));
sigma_tau_scale=1;




generate_covariate_data(d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);

% [~,error_message]=system('conda activate enso && python ENSO_figure.py');
[~,error_message]=system('python ENSO_figure.py');

load('pythonresults.mat')

standard_param(i).time_1=time_1;
standard_param(i).time_2=time_2;
standard_param(i).response_test_1=response_test_1;
standard_param(i).response_test_2=response_test_2;

standard_param(i).TE_prediction_Linearnet_priorval_1=TE_prediction_Linearnet_priorval_1;
standard_param(i).TE_prediction_Linearnet_priorval_2=TE_prediction_Linearnet_priorval_2;
standard_param(i).TE_prediction_Linearnet_priordataval_1=TE_prediction_Linearnet_priordataval_1;
standard_param(i).TE_prediction_Linearnet_priordataval_2=TE_prediction_Linearnet_priordataval_2;
standard_param(i).TE_prediction_Linearnet_priorpostval_1=TE_prediction_Linearnet_priorpostval_1;                                 
standard_param(i).TE_prediction_Linearnet_priorpostval_2=TE_prediction_Linearnet_priorpostval_2;
standard_param(i).TE_prediction_Linearnet_priorpostdataval_1=TE_prediction_Linearnet_priorpostdataval_1;
standard_param(i).TE_prediction_Linearnet_priorpostdataval_2=TE_prediction_Linearnet_priorpostdataval_2;
standard_param(i).TE_prediction_Linearnet_dataval_1=TE_prediction_Linearnet_dataval_1;
standard_param(i).TE_prediction_Linearnet_dataval_2=TE_prediction_Linearnet_dataval_2;
standard_param(i).TE_prediction_Linearnet_samplingval_1=TE_prediction_Linearnet_samplingval_1;
standard_param(i).TE_prediction_Linearnet_samplingval_2=TE_prediction_Linearnet_samplingval_2;

standard_param(i).TE_prediction_Linearnet_priorns_1=TE_prediction_Linearnet_priorns_1;
standard_param(i).TE_prediction_Linearnet_priorns_2=TE_prediction_Linearnet_priorns_2;
standard_param(i).TE_prediction_Linearnet_priordatans_1=TE_prediction_Linearnet_priordatans_1;
standard_param(i).TE_prediction_Linearnet_priordatans_2=TE_prediction_Linearnet_priordatans_2;
standard_param(i).TE_prediction_Linearnet_priorpostns_1=TE_prediction_Linearnet_priorpostns_1;                                 
standard_param(i).TE_prediction_Linearnet_priorpostns_2=TE_prediction_Linearnet_priorpostns_2;
standard_param(i).TE_prediction_Linearnet_priorpostdatans_1=TE_prediction_Linearnet_priorpostdatans_1;
standard_param(i).TE_prediction_Linearnet_priorpostdatans_2=TE_prediction_Linearnet_priorpostdatans_2;
standard_param(i).TE_prediction_Linearnet_datans_1=TE_prediction_Linearnet_datans_1;
standard_param(i).TE_prediction_Linearnet_datans_2=TE_prediction_Linearnet_datans_2;
standard_param(i).TE_prediction_Linearnet_samplingns_1=TE_prediction_Linearnet_samplingns_1;
standard_param(i).TE_prediction_Linearnet_samplingns_2=TE_prediction_Linearnet_samplingns_2;

standard_param(i).TE_prediction_Linearnet_prior_1=TE_prediction_Linearnet_prior_1;
standard_param(i).TE_prediction_Linearnet_prior_2=TE_prediction_Linearnet_prior_2;
standard_param(i).TE_prediction_Linearnet_priordata_1=TE_prediction_Linearnet_priordata_1;
standard_param(i).TE_prediction_Linearnet_priordata_2=TE_prediction_Linearnet_priordata_2;
standard_param(i).TE_prediction_Linearnet_priorpost_1=TE_prediction_Linearnet_priorpost_1;
standard_param(i).TE_prediction_Linearnet_priorpost_2=TE_prediction_Linearnet_priorpost_2;
standard_param(i).TE_prediction_Linearnet_priorpostdata_1=TE_prediction_Linearnet_priorpostdata_1;
standard_param(i).TE_prediction_Linearnet_priorpostdata_2=TE_prediction_Linearnet_priorpostdata_2;
standard_param(i).TE_prediction_Linearnet_data_1=TE_prediction_Linearnet_data_1;
standard_param(i).TE_prediction_Linearnet_data_2=TE_prediction_Linearnet_data_2;
standard_param(i).TE_prediction_Linearnet_sampling_1=TE_prediction_Linearnet_sampling_1;
standard_param(i).TE_prediction_Linearnet_sampling_2=TE_prediction_Linearnet_sampling_2;

standard_param(i).TEHW_prediction_Linearnet_priorval_1=TEHW_prediction_Linearnet_priorval_1;
standard_param(i).TEHW_prediction_Linearnet_priorval_2=TEHW_prediction_Linearnet_priorval_2;
standard_param(i).TEHW_prediction_Linearnet_priordataval_1=TEHW_prediction_Linearnet_priordataval_1;
standard_param(i).TEHW_prediction_Linearnet_priordataval_2=TEHW_prediction_Linearnet_priordataval_2;
standard_param(i).TEHW_prediction_Linearnet_priorpostval_1=TEHW_prediction_Linearnet_priorpostval_1;                                 
standard_param(i).TEHW_prediction_Linearnet_priorpostval_2=TEHW_prediction_Linearnet_priorpostval_2;
standard_param(i).TEHW_prediction_Linearnet_priorpostdataval_1=TEHW_prediction_Linearnet_priorpostdataval_1;
standard_param(i).TEHW_prediction_Linearnet_priorpostdataval_2=TEHW_prediction_Linearnet_priorpostdataval_2;
standard_param(i).TEHW_prediction_Linearnet_dataval_1=TEHW_prediction_Linearnet_dataval_1;
standard_param(i).TEHW_prediction_Linearnet_dataval_2=TEHW_prediction_Linearnet_dataval_2;
standard_param(i).TEHW_prediction_Linearnet_samplingval_1=TEHW_prediction_Linearnet_samplingval_1;
standard_param(i).TEHW_prediction_Linearnet_samplingval_2=TEHW_prediction_Linearnet_samplingval_2;

standard_param(i).TEHW_prediction_Linearnet_priorns_1=TEHW_prediction_Linearnet_priorns_1;
standard_param(i).TEHW_prediction_Linearnet_priorns_2=TEHW_prediction_Linearnet_priorns_2;
standard_param(i).TEHW_prediction_Linearnet_priordatans_1=TEHW_prediction_Linearnet_priordatans_1;
standard_param(i).TEHW_prediction_Linearnet_priordatans_2=TEHW_prediction_Linearnet_priordatans_2;
standard_param(i).TEHW_prediction_Linearnet_priorpostns_1=TEHW_prediction_Linearnet_priorpostns_1;                                 
standard_param(i).TEHW_prediction_Linearnet_priorpostns_2=TEHW_prediction_Linearnet_priorpostns_2;
standard_param(i).TEHW_prediction_Linearnet_priorpostdatans_1=TEHW_prediction_Linearnet_priorpostdatans_1;
standard_param(i).TEHW_prediction_Linearnet_priorpostdatans_2=TEHW_prediction_Linearnet_priorpostdatans_2;
standard_param(i).TEHW_prediction_Linearnet_datans_1=TEHW_prediction_Linearnet_datans_1;
standard_param(i).TEHW_prediction_Linearnet_datans_2=TEHW_prediction_Linearnet_datans_2;
standard_param(i).TEHW_prediction_Linearnet_samplingns_1=TEHW_prediction_Linearnet_samplingns_1;
standard_param(i).TEHW_prediction_Linearnet_samplingns_2=TEHW_prediction_Linearnet_samplingns_2;

standard_param(i).TEHW_prediction_Linearnet_prior_1=TEHW_prediction_Linearnet_prior_1;
standard_param(i).TEHW_prediction_Linearnet_prior_2=TEHW_prediction_Linearnet_prior_2;
standard_param(i).TEHW_prediction_Linearnet_priordata_1=TEHW_prediction_Linearnet_priordata_1;
standard_param(i).TEHW_prediction_Linearnet_priordata_2=TEHW_prediction_Linearnet_priordata_2;
standard_param(i).TEHW_prediction_Linearnet_priorpost_1=TEHW_prediction_Linearnet_priorpost_1;
standard_param(i).TEHW_prediction_Linearnet_priorpost_2=TEHW_prediction_Linearnet_priorpost_2;
standard_param(i).TEHW_prediction_Linearnet_priorpostdata_1=TEHW_prediction_Linearnet_priorpostdata_1;
standard_param(i).TEHW_prediction_Linearnet_priorpostdata_2=TEHW_prediction_Linearnet_priorpostdata_2;
standard_param(i).TEHW_prediction_Linearnet_data_1=TEHW_prediction_Linearnet_data_1;
standard_param(i).TEHW_prediction_Linearnet_data_2=TEHW_prediction_Linearnet_data_2;
standard_param(i).TEHW_prediction_Linearnet_sampling_1=TEHW_prediction_Linearnet_sampling_1;
standard_param(i).TEHW_prediction_Linearnet_sampling_2=TEHW_prediction_Linearnet_sampling_2;



standard_param(i).TEWB_prediction_Linearnet_priorval_1=TEWB_prediction_Linearnet_priorval_1;
standard_param(i).TEWB_prediction_Linearnet_priorval_2=TEWB_prediction_Linearnet_priorval_2;
standard_param(i).TEWB_prediction_Linearnet_priordataval_1=TEWB_prediction_Linearnet_priordataval_1;
standard_param(i).TEWB_prediction_Linearnet_priordataval_2=TEWB_prediction_Linearnet_priordataval_2;
standard_param(i).TEWB_prediction_Linearnet_priorpostval_1=TEWB_prediction_Linearnet_priorpostval_1;                                 
standard_param(i).TEWB_prediction_Linearnet_priorpostval_2=TEWB_prediction_Linearnet_priorpostval_2;
standard_param(i).TEWB_prediction_Linearnet_priorpostdataval_1=TEWB_prediction_Linearnet_priorpostdataval_1;
standard_param(i).TEWB_prediction_Linearnet_priorpostdataval_2=TEWB_prediction_Linearnet_priorpostdataval_2;
standard_param(i).TEWB_prediction_Linearnet_dataval_1=TEWB_prediction_Linearnet_dataval_1;
standard_param(i).TEWB_prediction_Linearnet_dataval_2=TEWB_prediction_Linearnet_dataval_2;
standard_param(i).TEWB_prediction_Linearnet_samplingval_1=TEWB_prediction_Linearnet_samplingval_1;
standard_param(i).TEWB_prediction_Linearnet_samplingval_2=TEWB_prediction_Linearnet_samplingval_2;

standard_param(i).TEWB_prediction_Linearnet_priorns_1=TEWB_prediction_Linearnet_priorns_1;
standard_param(i).TEWB_prediction_Linearnet_priorns_2=TEWB_prediction_Linearnet_priorns_2;
standard_param(i).TEWB_prediction_Linearnet_priordatans_1=TEWB_prediction_Linearnet_priordatans_1;
standard_param(i).TEWB_prediction_Linearnet_priordatans_2=TEWB_prediction_Linearnet_priordatans_2;
standard_param(i).TEWB_prediction_Linearnet_priorpostns_1=TEWB_prediction_Linearnet_priorpostns_1;                                 
standard_param(i).TEWB_prediction_Linearnet_priorpostns_2=TEWB_prediction_Linearnet_priorpostns_2;
standard_param(i).TEWB_prediction_Linearnet_priorpostdatans_1=TEWB_prediction_Linearnet_priorpostdatans_1;
standard_param(i).TEWB_prediction_Linearnet_priorpostdatans_2=TEWB_prediction_Linearnet_priorpostdatans_2;
standard_param(i).TEWB_prediction_Linearnet_datans_1=TEWB_prediction_Linearnet_datans_1;
standard_param(i).TEWB_prediction_Linearnet_datans_2=TEWB_prediction_Linearnet_datans_2;
standard_param(i).TEWB_prediction_Linearnet_samplingns_1=TEWB_prediction_Linearnet_samplingns_1;
standard_param(i).TEWB_prediction_Linearnet_samplingns_2=TEWB_prediction_Linearnet_samplingns_2;

standard_param(i).TEWB_prediction_Linearnet_prior_1=TEWB_prediction_Linearnet_prior_1;
standard_param(i).TEWB_prediction_Linearnet_prior_2=TEWB_prediction_Linearnet_prior_2;
standard_param(i).TEWB_prediction_Linearnet_priordata_1=TEWB_prediction_Linearnet_priordata_1;
standard_param(i).TEWB_prediction_Linearnet_priordata_2=TEWB_prediction_Linearnet_priordata_2;
standard_param(i).TEWB_prediction_Linearnet_priorpost_1=TEWB_prediction_Linearnet_priorpost_1;
standard_param(i).TEWB_prediction_Linearnet_priorpost_2=TEWB_prediction_Linearnet_priorpost_2;
standard_param(i).TEWB_prediction_Linearnet_priorpostdata_1=TEWB_prediction_Linearnet_priorpostdata_1;
standard_param(i).TEWB_prediction_Linearnet_priorpostdata_2=TEWB_prediction_Linearnet_priorpostdata_2;
standard_param(i).TEWB_prediction_Linearnet_data_1=TEWB_prediction_Linearnet_data_1;
standard_param(i).TEWB_prediction_Linearnet_data_2=TEWB_prediction_Linearnet_data_2;
standard_param(i).TEWB_prediction_Linearnet_sampling_1=TEWB_prediction_Linearnet_sampling_1;
standard_param(i).TEWB_prediction_Linearnet_sampling_2=TEWB_prediction_Linearnet_sampling_2;


standard_param(i).TEWBHW_prediction_Linearnet_priorval_1=TEWBHW_prediction_Linearnet_priorval_1;
standard_param(i).TEWBHW_prediction_Linearnet_priorval_2=TEWBHW_prediction_Linearnet_priorval_2;
standard_param(i).TEWBHW_prediction_Linearnet_priordataval_1=TEWBHW_prediction_Linearnet_priordataval_1;
standard_param(i).TEWBHW_prediction_Linearnet_priordataval_2=TEWBHW_prediction_Linearnet_priordataval_2;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostval_1=TEWBHW_prediction_Linearnet_priorpostval_1;                                 
standard_param(i).TEWBHW_prediction_Linearnet_priorpostval_2=TEWBHW_prediction_Linearnet_priorpostval_2;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostdataval_1=TEWBHW_prediction_Linearnet_priorpostdataval_1;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostdataval_2=TEWBHW_prediction_Linearnet_priorpostdataval_2;
standard_param(i).TEWBHW_prediction_Linearnet_dataval_1=TEWBHW_prediction_Linearnet_dataval_1;
standard_param(i).TEWBHW_prediction_Linearnet_dataval_2=TEWBHW_prediction_Linearnet_dataval_2;
standard_param(i).TEWBHW_prediction_Linearnet_samplingval_1=TEWBHW_prediction_Linearnet_samplingval_1;
standard_param(i).TEWBHW_prediction_Linearnet_samplingval_2=TEWBHW_prediction_Linearnet_samplingval_2;

standard_param(i).TEWBHW_prediction_Linearnet_priorns_1=TEWBHW_prediction_Linearnet_priorns_1;
standard_param(i).TEWBHW_prediction_Linearnet_priorns_2=TEWBHW_prediction_Linearnet_priorns_2;
standard_param(i).TEWBHW_prediction_Linearnet_priordatans_1=TEWBHW_prediction_Linearnet_priordatans_1;
standard_param(i).TEWBHW_prediction_Linearnet_priordatans_2=TEWBHW_prediction_Linearnet_priordatans_2;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostns_1=TEWBHW_prediction_Linearnet_priorpostns_1;                                 
standard_param(i).TEWBHW_prediction_Linearnet_priorpostns_2=TEWBHW_prediction_Linearnet_priorpostns_2;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostdatans_1=TEWBHW_prediction_Linearnet_priorpostdatans_1;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostdatans_2=TEWBHW_prediction_Linearnet_priorpostdatans_2;
standard_param(i).TEWBHW_prediction_Linearnet_datans_1=TEWBHW_prediction_Linearnet_datans_1;
standard_param(i).TEWBHW_prediction_Linearnet_datans_2=TEWBHW_prediction_Linearnet_datans_2;
standard_param(i).TEWBHW_prediction_Linearnet_samplingns_1=TEWBHW_prediction_Linearnet_samplingns_1;
standard_param(i).TEWBHW_prediction_Linearnet_samplingns_2=TEWBHW_prediction_Linearnet_samplingns_2;

standard_param(i).TEWBHW_prediction_Linearnet_prior_1=TEWBHW_prediction_Linearnet_prior_1;
standard_param(i).TEWBHW_prediction_Linearnet_prior_2=TEWBHW_prediction_Linearnet_prior_2;
standard_param(i).TEWBHW_prediction_Linearnet_priordata_1=TEWBHW_prediction_Linearnet_priordata_1;
standard_param(i).TEWBHW_prediction_Linearnet_priordata_2=TEWBHW_prediction_Linearnet_priordata_2;
standard_param(i).TEWBHW_prediction_Linearnet_priorpost_1=TEWBHW_prediction_Linearnet_priorpost_1;
standard_param(i).TEWBHW_prediction_Linearnet_priorpost_2=TEWBHW_prediction_Linearnet_priorpost_2;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostdata_1=TEWBHW_prediction_Linearnet_priorpostdata_1;
standard_param(i).TEWBHW_prediction_Linearnet_priorpostdata_2=TEWBHW_prediction_Linearnet_priorpostdata_2;
standard_param(i).TEWBHW_prediction_Linearnet_data_1=TEWBHW_prediction_Linearnet_data_1;
standard_param(i).TEWBHW_prediction_Linearnet_data_2=TEWBHW_prediction_Linearnet_data_2;
standard_param(i).TEWBHW_prediction_Linearnet_sampling_1=TEWBHW_prediction_Linearnet_sampling_1;
standard_param(i).TEWBHW_prediction_Linearnet_sampling_2=TEWBHW_prediction_Linearnet_sampling_2;


save('standard_params.mat','standard_param')

end



















% %%%%%%%%%%%%%Test Figures
% 
% 
% load model_and_persistence.mat
% load normalizations.mat
% load ENSO_Reference.mat
% 
% 
% truth=[data_std_1*standard_param(1).response_test_1+data_mean_1;data_std_2*standard_param(1).response_test_2+data_mean_2];
% stdev=std(truth);
% stdev=stdev(1);
% 
% RMSE_ENSO_1D=1-RMSE_ENSO_1D./stdev;
% RMSE_ENSO_3D=1-RMSE_ENSO_3D./stdev;
% 
% RelEntropy_ENSO_1D=1-exp(-RelEntropy_ENSO_1D);
% RelEntropy_ENSO_3D=1-exp(-RelEntropy_ENSO_3D);
% 
% TEWBHWWB_prior=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_priordata=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_priorpost=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_priorpostdata=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_priorns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_priordatans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_priorpostns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_priorpostdatans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_data=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_datans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_sampling=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWB_samplingns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% 
% 
% 
% TEWBHWWBWB_prior=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_priordata=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_priorpost=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_priorpostdata=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_priorns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_priordatans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_priorpostns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_priorpostdatans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_data=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_datans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_sampling=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWB_samplingns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% 
% TEWBHWWBWBHW_prior=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_priordata=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_priorpost=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_priorpostdata=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_priorns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_priordatans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_priorpostns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_priorpostdatans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_data=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_datans=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_sampling=zeros(size(truth,1),size(truth,2),numel(standard_param));
% TEWBHWWBWBHW_samplingns=zeros(size(truth,1),size(truth,2),numel(standard_param));
% 
% 
% TEWBHWWB_pc_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWB_pc_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWB_pc_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWB_pc_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_pc_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_pc_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_pc_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWBWB_pc_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_pc_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_pc_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_pc_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_pc_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% 
% TEWBHWWB_rms_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWB_rms_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWB_rms_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWB_rms_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_rms_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_rms_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_rms_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWBWB_rms_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_rms_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_rms_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_rms_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rms_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% 
% TEWBHWWB_rel_entropy_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWB_rel_entropy_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWB_rel_entropy_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWB_rel_entropy_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_rel_entropy_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_rel_entropy_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWBWB_rel_entropy_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWBWB_rel_entropy_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_rel_entropy_Linearnet_prior=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priordata=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpost=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpostdata=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorns=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priordatans=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpostns=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpostdatans=zeros(numel(standard_param),50);
% 
% TEWBHWWBWBHW_rel_entropy_Linearnet_data=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_datans=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_sampling=zeros(numel(standard_param),50);
% TEWBHWWBWBHW_rel_entropy_Linearnet_samplingns=zeros(numel(standard_param),50);
% 
% 
% 
% for i=1
%     
% TEWBHWWB_prior(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_prior_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_prior_2+data_mean_2];
% TEWBHWWB_priordata(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_priordata_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_priordata_2+data_mean_2];
% TEWBHWWB_priorpost(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpost_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpost_2+data_mean_2];
% TEWBHWWB_priorpostdata(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpostdata_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpostdata_2+data_mean_2];
% 
% 
% TEWBHWWB_priorns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_priorns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_priorns_2+data_mean_2];
% TEWBHWWB_priordatans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_priordatans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_priordatans_2+data_mean_2];
% TEWBHWWB_priorpostns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpostns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpostns_2+data_mean_2];
% TEWBHWWB_priorpostdatans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpostdatans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_priorpostdatans_2+data_mean_2];
% 
% TEWBHWWB_data(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_data_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_data_2+data_mean_2];
% TEWBHWWB_datans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_datans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_datans_2+data_mean_2];
% TEWBHWWB_sampling(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_sampling_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_sampling_2+data_mean_2];
% TEWBHWWB_samplingns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWB_prediction_Linearnet_samplingns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWB_prediction_Linearnet_samplingns_2+data_mean_2];
% 
% 
% TEWBHWWB_pc_Linearnet_prior(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_prior;
% TEWBHWWB_pc_Linearnet_priordata(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_priordata;
% TEWBHWWB_pc_Linearnet_priorpost(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_priorpost;
% TEWBHWWB_pc_Linearnet_priorpostdata(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_priorpostdata;
% 
% TEWBHWWB_pc_Linearnet_priorns(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_priorns;
% TEWBHWWB_pc_Linearnet_priordatans(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_priordatans;
% TEWBHWWB_pc_Linearnet_priorpostns(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_priorpostns;
% TEWBHWWB_pc_Linearnet_priorpostdatans(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_priorpostdatans;
% 
% TEWBHWWB_pc_Linearnet_data(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_data;
% TEWBHWWB_pc_Linearnet_datans(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_datans;
% TEWBHWWB_pc_Linearnet_sampling(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_sampling;
% TEWBHWWB_pc_Linearnet_samplingns(i,:)=standard_param(i).TEWBHWWB_pc_Linearnet_samplingns;
% 
% TEWBHWWB_rms_Linearnet_prior(i,:)=get_rmse(TEWBHWWB_prior(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_priordata(i,:)=get_rmse(TEWBHWWB_priordata(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_priorpost(i,:)=get_rmse(TEWBHWWB_priorpost(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_priorpostdata(i,:)=get_rmse(TEWBHWWB_priorpostdata(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_priorns(i,:)=get_rmse(TEWBHWWB_priorns(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_priordatans(i,:)=get_rmse(TEWBHWWB_priordatans(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_priorpostns(i,:)=get_rmse(TEWBHWWB_priorpostns(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_priorpostdatans(i,:)=get_rmse(TEWBHWWB_priorpostdatans(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_data(i,:)=get_rmse(TEWBHWWB_data(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_datans(i,:)=get_rmse(TEWBHWWB_datans(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_sampling(i,:)=get_rmse(TEWBHWWB_sampling(:,:,i),truth);
% TEWBHWWB_rms_Linearnet_samplingns(i,:)=get_rmse(TEWBHWWB_samplingns(:,:,i),truth);
% 
% TEWBHWWB_rel_entropy_Linearnet_prior(i,:)=get_rel_entropy(TEWBHWWB_prior(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_priordata(i,:)=get_rel_entropy(TEWBHWWB_priordata(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_priorpost(i,:)=get_rel_entropy(TEWBHWWB_priorpost(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_priorpostdata(i,:)=get_rel_entropy(TEWBHWWB_priorpostdata(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_priorns(i,:)=get_rel_entropy(TEWBHWWB_priorns(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_priordatans(i,:)=get_rel_entropy(TEWBHWWB_priordatans(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_priorpostns(i,:)=get_rel_entropy(TEWBHWWB_priorpostns(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_priorpostdatans(i,:)=get_rel_entropy(TEWBHWWB_priorpostdatans(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_data(i,:)=get_rel_entropy(TEWBHWWB_data(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_datans(i,:)=get_rel_entropy(TEWBHWWB_datans(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_sampling(i,:)=get_rel_entropy(TEWBHWWB_sampling(:,:,i),truth);
% TEWBHWWB_rel_entropy_Linearnet_samplingns(i,:)=get_rel_entropy(TEWBHWWB_samplingns(:,:,i),truth);
% 
% TEWBHWWBWB_prior(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_prior_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_prior_2+data_mean_2];
% TEWBHWWBWB_priordata(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priordata_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priordata_2+data_mean_2];
% TEWBHWWBWB_priorpost(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpost_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpost_2+data_mean_2];
% TEWBHWWBWB_priorpostdata(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpostdata_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpostdata_2+data_mean_2];
% 
% 
% TEWBHWWBWB_priorns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorns_2+data_mean_2];
% TEWBHWWBWB_priordatans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priordatans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priordatans_2+data_mean_2];
% TEWBHWWBWB_priorpostns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpostns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpostns_2+data_mean_2];
% TEWBHWWBWB_priorpostdatans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpostdatans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_priorpostdatans_2+data_mean_2];
% 
% TEWBHWWBWB_data(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_data_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_data_2+data_mean_2];
% TEWBHWWBWB_datans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_datans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_datans_2+data_mean_2];
% TEWBHWWBWB_sampling(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_sampling_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_sampling_2+data_mean_2];
% TEWBHWWBWB_samplingns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWB_prediction_Linearnet_samplingns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWB_prediction_Linearnet_samplingns_2+data_mean_2];
% 
% 
% TEWBHWWBWB_pc_Linearnet_prior(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_prior;
% TEWBHWWBWB_pc_Linearnet_priordata(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_priordata;
% TEWBHWWBWB_pc_Linearnet_priorpost(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_priorpost;
% TEWBHWWBWB_pc_Linearnet_priorpostdata(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_priorpostdata;
% 
% TEWBHWWBWB_pc_Linearnet_priorns(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_priorns;
% TEWBHWWBWB_pc_Linearnet_priordatans(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_priordatans;
% TEWBHWWBWB_pc_Linearnet_priorpostns(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_priorpostns;
% TEWBHWWBWB_pc_Linearnet_priorpostdatans(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_priorpostdatans;
% 
% TEWBHWWBWB_pc_Linearnet_data(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_data;
% TEWBHWWBWB_pc_Linearnet_datans(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_datans;
% TEWBHWWBWB_pc_Linearnet_sampling(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_sampling;
% TEWBHWWBWB_pc_Linearnet_samplingns(i,:)=standard_param(i).TEWBHWWBWB_pc_Linearnet_samplingns;
% 
% TEWBHWWBWB_rms_Linearnet_prior(i,:)=get_rmse(TEWBHWWBWB_prior(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_priordata(i,:)=get_rmse(TEWBHWWBWB_priordata(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_priorpost(i,:)=get_rmse(TEWBHWWBWB_priorpost(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_priorpostdata(i,:)=get_rmse(TEWBHWWBWB_priorpostdata(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_priorns(i,:)=get_rmse(TEWBHWWBWB_priorns(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_priordatans(i,:)=get_rmse(TEWBHWWBWB_priordatans(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_priorpostns(i,:)=get_rmse(TEWBHWWBWB_priorpostns(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_priorpostdatans(i,:)=get_rmse(TEWBHWWBWB_priorpostdatans(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_data(i,:)=get_rmse(TEWBHWWBWB_data(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_datans(i,:)=get_rmse(TEWBHWWBWB_datans(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_sampling(i,:)=get_rmse(TEWBHWWBWB_sampling(:,:,i),truth);
% TEWBHWWBWB_rms_Linearnet_samplingns(i,:)=get_rmse(TEWBHWWBWB_samplingns(:,:,i),truth);
% 
% 
% TEWBHWWBWB_rel_entropy_Linearnet_prior(i,:)=get_rel_entropy(TEWBHWWBWB_prior(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_priordata(i,:)=get_rel_entropy(TEWBHWWBWB_priordata(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpost(i,:)=get_rel_entropy(TEWBHWWBWB_priorpost(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpostdata(i,:)=get_rel_entropy(TEWBHWWBWB_priorpostdata(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_priorns(i,:)=get_rel_entropy(TEWBHWWBWB_priorns(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_priordatans(i,:)=get_rel_entropy(TEWBHWWBWB_priordatans(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpostns(i,:)=get_rel_entropy(TEWBHWWBWB_priorpostns(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_priorpostdatans(i,:)=get_rel_entropy(TEWBHWWBWB_priorpostdatans(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_data(i,:)=get_rel_entropy(TEWBHWWBWB_data(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_datans(i,:)=get_rel_entropy(TEWBHWWBWB_datans(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_sampling(i,:)=get_rel_entropy(TEWBHWWBWB_sampling(:,:,i),truth);
% TEWBHWWBWB_rel_entropy_Linearnet_samplingns(i,:)=get_rel_entropy(TEWBHWWBWB_samplingns(:,:,i),truth);
% 
% TEWBHWWBWBHW_prior(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_prior_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_prior_2+data_mean_2];
% TEWBHWWBWBHW_priordata(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priordata_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priordata_2+data_mean_2];
% TEWBHWWBWBHW_priorpost(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpost_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpost_2+data_mean_2];
% TEWBHWWBWBHW_priorpostdata(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpostdata_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpostdata_2+data_mean_2];
% 
% 
% TEWBHWWBWBHW_priorns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorns_2+data_mean_2];
% TEWBHWWBWBHW_priordatans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priordatans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priordatans_2+data_mean_2];
% TEWBHWWBWBHW_priorpostns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpostns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpostns_2+data_mean_2];
% TEWBHWWBWBHW_priorpostdatans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpostdatans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_priorpostdatans_2+data_mean_2];
% 
% TEWBHWWBWBHW_data(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_data_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_data_2+data_mean_2];
% TEWBHWWBWBHW_datans(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_datans_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_datans_2+data_mean_2];
% TEWBHWWBWBHW_sampling(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_sampling_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_sampling_2+data_mean_2];
% TEWBHWWBWBHW_samplingns(:,:,i)=[data_std_1*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_samplingns_1+data_mean_1;data_std_2*standard_param(i).TEWBHWWBWBHW_prediction_Linearnet_samplingns_2+data_mean_2];
% 
% TEWBHWWBWBHW_pc_Linearnet_prior(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_prior;
% TEWBHWWBWBHW_pc_Linearnet_priordata(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_priordata;
% TEWBHWWBWBHW_pc_Linearnet_priorpost(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_priorpost;
% TEWBHWWBWBHW_pc_Linearnet_priorpostdata(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_priorpostdata;
% 
% TEWBHWWBWBHW_pc_Linearnet_priorns(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_priorns;
% TEWBHWWBWBHW_pc_Linearnet_priordatans(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_priordatans;
% TEWBHWWBWBHW_pc_Linearnet_priorpostns(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_priorpostns;
% TEWBHWWBWBHW_pc_Linearnet_priorpostdatans(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_priorpostdatans;
% 
% TEWBHWWBWBHW_pc_Linearnet_data(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_data;
% TEWBHWWBWBHW_pc_Linearnet_datans(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_datans;
% TEWBHWWBWBHW_pc_Linearnet_sampling(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_sampling;
% TEWBHWWBWBHW_pc_Linearnet_samplingns(i,:)=standard_param(i).TEWBHWWBWBHW_pc_Linearnet_samplingns;
% 
% TEWBHWWBWBHW_rms_Linearnet_prior(i,:)=get_rmse(TEWBHWWBWBHW_prior(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_priordata(i,:)=get_rmse(TEWBHWWBWBHW_priordata(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_priorpost(i,:)=get_rmse(TEWBHWWBWBHW_priorpost(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_priorpostdata(i,:)=get_rmse(TEWBHWWBWBHW_priorpostdata(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_priorns(i,:)=get_rmse(TEWBHWWBWBHW_priorns(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_priordatans(i,:)=get_rmse(TEWBHWWBWBHW_priordatans(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_priorpostns(i,:)=get_rmse(TEWBHWWBWBHW_priorpostns(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_priorpostdatans(i,:)=get_rmse(TEWBHWWBWBHW_priorpostdatans(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_data(i,:)=get_rmse(TEWBHWWBWBHW_data(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_datans(i,:)=get_rmse(TEWBHWWBWBHW_datans(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_sampling(i,:)=get_rmse(TEWBHWWBWBHW_sampling(:,:,i),truth);
% TEWBHWWBWBHW_rms_Linearnet_samplingns(i,:)=get_rmse(TEWBHWWBWBHW_samplingns(:,:,i),truth);
% 
% 
% TEWBHWWBWBHW_rel_entropy_Linearnet_prior(i,:)=get_rel_entropy(TEWBHWWBWBHW_prior(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priordata(i,:)=get_rel_entropy(TEWBHWWBWBHW_priordata(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpost(i,:)=get_rel_entropy(TEWBHWWBWBHW_priorpost(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpostdata(i,:)=get_rel_entropy(TEWBHWWBWBHW_priorpostdata(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorns(i,:)=get_rel_entropy(TEWBHWWBWBHW_priorns(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priordatans(i,:)=get_rel_entropy(TEWBHWWBWBHW_priordatans(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpostns(i,:)=get_rel_entropy(TEWBHWWBWBHW_priorpostns(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_priorpostdatans(i,:)=get_rel_entropy(TEWBHWWBWBHW_priorpostdatans(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_data(i,:)=get_rel_entropy(TEWBHWWBWBHW_data(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_datans(i,:)=get_rel_entropy(TEWBHWWBWBHW_datans(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_sampling(i,:)=get_rel_entropy(TEWBHWWBWBHW_sampling(:,:,i),truth);
% TEWBHWWBWBHW_rel_entropy_Linearnet_samplingns(i,:)=get_rel_entropy(TEWBHWWBWBHW_samplingns(:,:,i),truth);
% 
% i
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% vec2=[0:1:49]/4.2857;
% vec=[0:1:49]/4.2857;
% 
% colors=linspecer(6);
% 
% ms=5;
% 
% set(groot,'DefaultLineLineWidth',2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
%     'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
%     'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])
% 
% figure
% t=tiledlayout(1,3,'TileSpacing','compact');
% nexttile
% hold on
% plot(vec2,TEWBHWWBWB_pc_Linearnet_prior(1,:),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_pc_Linearnet_priorns(1,:),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_pc_Linearnet_priordatans(1,:),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_pc_Linearnet_priorpost(1,:),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_pc_Linearnet_priorpostdatans(1,:),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_pc_Linearnet_samplingns(1,:),'-','color',colors(6,:),'MarkerSize',ms)
% plot(vec,Corr_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,Corr_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('PC')
% yline(.5,'-','LineWidth',2)
% title('PC')
% grid on
% 
% nexttile
% hold on
% plot(vec2,TEWBHWWBWB_rms_Linearnet_prior(1,:),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rms_Linearnet_priorns(1,:),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rms_Linearnet_priordatans(1,:),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rms_Linearnet_priorpost(1,:),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rms_Linearnet_priorpostdatans(1,:),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rms_Linearnet_samplingns(1,:),'-','color',colors(6,:),'MarkerSize',ms)
% plot(vec,RMSE_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,RMSE_ENSO_3D,'b-','MarkerSize',ms)
% l=legend({'Prior ES','Prior', 'Prior+Data','Prior+Post ES','Prior+Data+post','post','Sampling ES','Persistence','3-D Model'});
% l.Interpreter='latex';
% l.FontSize=10;
% ylabel('RMSE')
% grid on
% 
% title('RMSE')
% nexttile
% hold on
% plot(vec2,TEWBHWWBWB_rel_entropy_Linearnet_prior(1,:),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rel_entropy_Linearnet_priorns(1,:),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rel_entropy_Linearnet_priordatans(1,:),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rel_entropy_Linearnet_priorpost(1,:),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rel_entropy_Linearnet_priorpostdatans(1,:),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWB_rel_entropy_Linearnet_samplingns(1,:),'-','color',colors(6,:),'MarkerSize',ms)
% plot(vec,RelEntropy_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,RelEntropy_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('Relative Entropy')
% yline(.5,'-','LineWidth',2)
% xlabel('Lead Time (months)')
% xlim([0 11])
% ylim([0 1])
% title('Relative Entropy')
% grid on
% 
% title(t,'TEWBHWWBWB','FontSize',16)
% width=800;
% height=700;
% set(gcf,'position',[10,10,width,height])
% 
% 
% 
% 
% 
% 
% 
% set(groot,'DefaultLineLineWidth',2,'DefaultAxesLineWidth', 0.5,'DefaultAxesXColor', 'k','DefaultAxesXColor', 'k','DefaultAxesFontUnits', 'points',...
%     'DefaultAxesFontSize', 10,'DefaultAxesFontName', 'Helvetica','DefaultTextFontUnits', 'Points','DefaultTextFontSize', 10,...
%     'DefaultTextFontName', 'Helvetica','DefaultAxesTickLength', [0.02 0.025])
% 
% figure
% t=tiledlayout(1,3,'TileSpacing','compact');
% nexttile
% hold on
% plot(vec2,TEWBHWWBWBHW_pc_Linearnet_prior(1,:),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_pc_Linearnet_priorns(1,:),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_pc_Linearnet_priordatans(1,:),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_pc_Linearnet_priorpost(1,:),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_pc_Linearnet_priorpostdata(1,:),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_pc_Linearnet_sampling(1,:),'-','color',colors(6,:),'MarkerSize',ms)
% plot(vec,Corr_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,Corr_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('PC')
% yline(.5,'-','LineWidth',2)
% title('PC')
% grid on
% 
% nexttile
% hold on
% plot(vec2,TEWBHWWBWBHW_rms_Linearnet_prior(1,:),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rms_Linearnet_priorns(1,:),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rms_Linearnet_priordatans(1,:),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rms_Linearnet_priorpost(1,:),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rms_Linearnet_priorpostdatans(1,:),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rms_Linearnet_samplingns(1,:),'-','color',colors(6,:),'MarkerSize',ms)
% plot(vec,RMSE_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,RMSE_ENSO_3D,'b-','MarkerSize',ms)
% l=legend({'Prior ES','Prior', 'Prior+Data','Prior+Post ES','Prior+Data+post','post','Persistence','3-D Model'});
% l.Interpreter='latex';
% l.FontSize=10;
% ylabel('RMSE')
% grid on
% 
% title('RMSE')
% nexttile
% hold on
% plot(vec2,TEWBHWWBWBHW_rel_entropy_Linearnet_prior(1,:),'-','color',colors(1,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rel_entropy_Linearnet_priorns(1,:),'-','color',colors(2,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rel_entropy_Linearnet_priordatans(1,:),'-','color',colors(3,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rel_entropy_Linearnet_priorpost(1,:),'-','color',colors(4,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rel_entropy_Linearnet_priorpostdatans(1,:),'-','color',colors(5,:),'MarkerSize',ms)
% plot(vec2,TEWBHWWBWBHW_rms_Linearnet_samplingns(1,:),'-','color',colors(6,:),'MarkerSize',ms)
% plot(vec,RelEntropy_ENSO_1D,'m-','MarkerSize',ms)
% plot(vec,RelEntropy_ENSO_3D,'b-','MarkerSize',ms)
% ylabel('Relative Entropy')
% yline(.5,'-','LineWidth',2)
% xlabel('Lead Time (months)')
% xlim([0 11])
% ylim([0 1])
% title('Relative Entropy')
% grid on
% 
% title(t,'TEWBHWWBWBHW','FontSize',16)
% width=800;
% height=700;
% set(gcf,'position',[10,10,width,height])
% 
% 
% 
% 
% 
% 
% 
% 
