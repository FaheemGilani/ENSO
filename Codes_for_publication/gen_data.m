clear all
close all
load standard_params.mat
load normalizations.mat
load ENSO_Reference.mat
load model_and_persistence.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stdev=std(T_E);
stdev=stdev(1);
RMSE_ENSO_1D=1-RMSE_ENSO_1D./stdev;
RelEntropy_ENSO_1D=1-exp(-RelEntropy_ENSO_1D);

RMSE_ENSO_3D=1-RMSE_ENSO_3D./stdev;
RelEntropy_ENSO_3D=1-exp(-RelEntropy_ENSO_3D);

truth=[standard_param(1).response_test_1;standard_param(1).response_test_2];



TE_prior=[];
TE_priordata=[];
TE_priorpost=[];
TE_priorpostdata=[];
TE_data=[];
TE_sampling=[];

TE_priorval=[];
TE_priordataval=[];
TE_priorpostval=[];
TE_priorpostdataval=[];
TE_dataval=[];
TE_samplingval=[];


TE_priorns=[];
TE_priordatans=[];
TE_priorpostns=[];
TE_priorpostdatans=[];
TE_datans=[];
TE_samplingns=[];


TEWB_prior=[];
TEWB_priordata=[];
TEWB_priorpost=[];
TEWB_priorpostdata=[];
TEWB_data=[];
TEWB_sampling=[];

TEWB_priorval=[];
TEWB_priordataval=[];
TEWB_priorpostval=[];
TEWB_priorpostdataval=[];
TEWB_dataval=[];
TEWB_samplingval=[];


TEWB_priorns=[];
TEWB_priordatans=[];
TEWB_priorpostns=[];
TEWB_priorpostdatans=[];
TEWB_datans=[];
TEWB_samplingns=[];

TEHW_prior=[];
TEHW_priordata=[];
TEHW_priorpost=[];
TEHW_priorpostdata=[];
TEHW_data=[];
TEHW_sampling=[];

TEHW_priorval=[];
TEHW_priordataval=[];
TEHW_priorpostval=[];
TEHW_priorpostdataval=[];
TEHW_dataval=[];
TEHW_samplingval=[];


TEHW_priorns=[];
TEHW_priordatans=[];
TEHW_priorpostns=[];
TEHW_priorpostdatans=[];
TEHW_datans=[];
TEHW_samplingns=[];


TEWBHW_prior=[];
TEWBHW_priordata=[];
TEWBHW_priorpost=[];
TEWBHW_priorpostdata=[];
TEWBHW_data=[];
TEWBHW_sampling=[];

TEWBHW_priorval=[];
TEWBHW_priordataval=[];
TEWBHW_priorpostval=[];
TEWBHW_priorpostdataval=[];
TEWBHW_dataval=[];
TEWBHW_samplingval=[];


TEWBHW_priorns=[];
TEWBHW_priordatans=[];
TEWBHW_priorpostns=[];
TEWBHW_priorpostdatans=[];
TEWBHW_datans=[];
TEWBHW_samplingns=[];

TE_pc_Linearnet_prior=[];
TE_pc_Linearnet_priordata=[];
TE_pc_Linearnet_priorpost=[];
TE_pc_Linearnet_priorpostdata=[];
TE_pc_Linearnet_data=[];
TE_pc_Linearnet_sampling=[];

TE_pc_Linearnet_priorval=[];
TE_pc_Linearnet_priordataval=[];
TE_pc_Linearnet_priorpostval=[];
TE_pc_Linearnet_priorpostdataval=[];
TE_pc_Linearnet_dataval=[];
TE_pc_Linearnet_samplingval=[];


TE_pc_Linearnet_priorns=[];
TE_pc_Linearnet_priordatans=[];
TE_pc_Linearnet_priorpostns=[];
TE_pc_Linearnet_priorpostdatans=[];
TE_pc_Linearnet_datans=[];
TE_pc_Linearnet_samplingns=[];


TEHW_pc_Linearnet_prior=[];
TEHW_pc_Linearnet_priordata=[];
TEHW_pc_Linearnet_priorpost=[];
TEHW_pc_Linearnet_priorpostdata=[];
TEHW_pc_Linearnet_data=[];
TEHW_pc_Linearnet_sampling=[];

TEHW_pc_Linearnet_priorval=[];
TEHW_pc_Linearnet_priordataval=[];
TEHW_pc_Linearnet_priorpostval=[];
TEHW_pc_Linearnet_priorpostdataval=[];
TEHW_pc_Linearnet_dataval=[];
TEHW_pc_Linearnet_samplingval=[];


TEHW_pc_Linearnet_priorns=[];
TEHW_pc_Linearnet_priordatans=[];
TEHW_pc_Linearnet_priorpostns=[];
TEHW_pc_Linearnet_priorpostdatans=[];
TEHW_pc_Linearnet_datans=[];
TEHW_pc_Linearnet_samplingns=[];




TEWB_pc_Linearnet_prior=[];
TEWB_pc_Linearnet_priordata=[];
TEWB_pc_Linearnet_priorpost=[];
TEWB_pc_Linearnet_priorpostdata=[];
TEWB_pc_Linearnet_data=[];
TEWB_pc_Linearnet_sampling=[];

TEWB_pc_Linearnet_priorval=[];
TEWB_pc_Linearnet_priordataval=[];
TEWB_pc_Linearnet_priorpostval=[];
TEWB_pc_Linearnet_priorpostdataval=[];
TEWB_pc_Linearnet_dataval=[];
TEWB_pc_Linearnet_samplingval=[];


TEWB_pc_Linearnet_priorns=[];
TEWB_pc_Linearnet_priordatans=[];
TEWB_pc_Linearnet_priorpostns=[];
TEWB_pc_Linearnet_priorpostdatans=[];
TEWB_pc_Linearnet_datans=[];
TEWB_pc_Linearnet_samplingns=[];



TEWBHW_pc_Linearnet_prior=[];
TEWBHW_pc_Linearnet_priordata=[];
TEWBHW_pc_Linearnet_priorpost=[];
TEWBHW_pc_Linearnet_priorpostdata=[];
TEWBHW_pc_Linearnet_data=[];
TEWBHW_pc_Linearnet_sampling=[];

TEWBHW_pc_Linearnet_priorval=[];
TEWBHW_pc_Linearnet_priordataval=[];
TEWBHW_pc_Linearnet_priorpostval=[];
TEWBHW_pc_Linearnet_priorpostdataval=[];
TEWBHW_pc_Linearnet_dataval=[];
TEWBHW_pc_Linearnet_samplingval=[];


TEWBHW_pc_Linearnet_priorns=[];
TEWBHW_pc_Linearnet_priordatans=[];
TEWBHW_pc_Linearnet_priorpostns=[];
TEWBHW_pc_Linearnet_priorpostdatans=[];
TEWBHW_pc_Linearnet_datans=[];
TEWBHW_pc_Linearnet_samplingns=[];









for i=1:numel(standard_param)
    
TE_prior=[standard_param(i).TE_prediction_Linearnet_prior_1;standard_param(i).TE_prediction_Linearnet_prior_2];
TE_priordata=[standard_param(i).TE_prediction_Linearnet_priordata_1;standard_param(i).TE_prediction_Linearnet_priordata_2];
TE_priorpost=[standard_param(i).TE_prediction_Linearnet_priorpost_1;standard_param(i).TE_prediction_Linearnet_priorpost_2];
TE_priorpostdata=[standard_param(i).TE_prediction_Linearnet_priorpostdata_1;standard_param(i).TE_prediction_Linearnet_priorpostdata_2];
TE_data=[standard_param(i).TE_prediction_Linearnet_data_1;standard_param(i).TE_prediction_Linearnet_data_2];
TE_sampling=[standard_param(i).TE_prediction_Linearnet_sampling_1;standard_param(i).TE_prediction_Linearnet_sampling_2];

TE_priorval=[standard_param(i).TE_prediction_Linearnet_priorval_1;standard_param(i).TE_prediction_Linearnet_priorval_2];
TE_priordataval=[standard_param(i).TE_prediction_Linearnet_priordataval_1;standard_param(i).TE_prediction_Linearnet_priordataval_2];
TE_priorpostval=[standard_param(i).TE_prediction_Linearnet_priorpostval_1;standard_param(i).TE_prediction_Linearnet_priorpostval_2];
TE_priorpostdataval=[standard_param(i).TE_prediction_Linearnet_priorpostdataval_1;standard_param(i).TE_prediction_Linearnet_priorpostdataval_2];
TE_dataval=[standard_param(i).TE_prediction_Linearnet_dataval_1;standard_param(i).TE_prediction_Linearnet_dataval_2];
TE_samplingval=[standard_param(i).TE_prediction_Linearnet_samplingval_1;standard_param(i).TE_prediction_Linearnet_samplingval_2];

TE_priorns=[standard_param(i).TE_prediction_Linearnet_priorns_1;standard_param(i).TE_prediction_Linearnet_priorns_2];
TE_priordatans=[standard_param(i).TE_prediction_Linearnet_priordatans_1;standard_param(i).TE_prediction_Linearnet_priordatans_2];
TE_priorpostns=[standard_param(i).TE_prediction_Linearnet_priorpostns_1;standard_param(i).TE_prediction_Linearnet_priorpostns_2];
TE_priorpostdatans=[standard_param(i).TE_prediction_Linearnet_priorpostdatans_1;standard_param(i).TE_prediction_Linearnet_priorpostdatans_2];
TE_datans=[standard_param(i).TE_prediction_Linearnet_datans_1;standard_param(i).TE_prediction_Linearnet_datans_2];
TE_samplingns=[standard_param(i).TE_prediction_Linearnet_samplingns_1;standard_param(i).TE_prediction_Linearnet_samplingns_2];



TE_pc_Linearnet_prior(i,:)=get_corr(TE_prior,truth);
TE_pc_Linearnet_priordata(i,:)=get_corr(TE_priordata,truth);
TE_pc_Linearnet_priorpost(i,:)=get_corr(TE_priorpost,truth);
TE_pc_Linearnet_priorpostdata(i,:)=get_corr(TE_priorpostdata,truth);
TE_pc_Linearnet_data(i,:)=get_corr(TE_data,truth);
TE_pc_Linearnet_sampling(i,:)=get_corr(TE_sampling,truth);

TE_pc_Linearnet_priorval(i,:)=get_corr(TE_priorval,truth);
TE_pc_Linearnet_priordataval(i,:)=get_corr(TE_priordataval,truth);
TE_pc_Linearnet_priorpostval(i,:)=get_corr(TE_priorpostval,truth);
TE_pc_Linearnet_priorpostdataval(i,:)=get_corr(TE_priorpostdataval,truth);
TE_pc_Linearnet_dataval(i,:)=get_corr(TE_dataval,truth);
TE_pc_Linearnet_samplingval(i,:)=get_corr(TE_samplingval,truth);

TE_pc_Linearnet_priorns(i,:)=get_corr(TE_priorns,truth);
TE_pc_Linearnet_priordatans(i,:)=get_corr(TE_priordatans,truth);
TE_pc_Linearnet_priorpostns(i,:)=get_corr(TE_priorpostns,truth);
TE_pc_Linearnet_priorpostdatans(i,:)=get_corr(TE_priorpostdatans,truth);
TE_pc_Linearnet_datans(i,:)=get_corr(TE_datans,truth);
TE_pc_Linearnet_samplingns(i,:)=get_corr(TE_samplingns,truth);


TE_rms_Linearnet_prior(i,:)=get_rmse(TE_prior,truth);
TE_rms_Linearnet_priordata(i,:)=get_rmse(TE_priordata,truth);
TE_rms_Linearnet_priorpost(i,:)=get_rmse(TE_priorpost,truth);
TE_rms_Linearnet_priorpostdata(i,:)=get_rmse(TE_priorpostdata,truth);
TE_rms_Linearnet_data(i,:)=get_rmse(TE_data,truth);
TE_rms_Linearnet_sampling(i,:)=get_rmse(TE_sampling,truth);

TE_rms_Linearnet_priorval(i,:)=get_rmse(TE_priorval,truth);
TE_rms_Linearnet_priordataval(i,:)=get_rmse(TE_priordataval,truth);
TE_rms_Linearnet_priorpostval(i,:)=get_rmse(TE_priorpostval,truth);
TE_rms_Linearnet_priorpostdataval(i,:)=get_rmse(TE_priorpostdataval,truth);
TE_rms_Linearnet_dataval(i,:)=get_rmse(TE_dataval,truth);
TE_rms_Linearnet_samplingval(i,:)=get_rmse(TE_samplingval,truth);

TE_rms_Linearnet_priorns(i,:)=get_rmse(TE_priorns,truth);
TE_rms_Linearnet_priordatans(i,:)=get_rmse(TE_priordatans,truth);
TE_rms_Linearnet_priorpostns(i,:)=get_rmse(TE_priorpostns,truth);
TE_rms_Linearnet_priorpostdatans(i,:)=get_rmse(TE_priorpostdatans,truth);
TE_rms_Linearnet_datans(i,:)=get_rmse(TE_datans,truth);
TE_rms_Linearnet_samplingns(i,:)=get_rmse(TE_samplingns,truth);


TE_rel_entropy_Linearnet_prior(i,:)=get_rel_entropy(TE_prior,truth);
TE_rel_entropy_Linearnet_priordata(i,:)=get_rel_entropy(TE_priordata,truth);
TE_rel_entropy_Linearnet_priorpost(i,:)=get_rel_entropy(TE_priorpost,truth);
TE_rel_entropy_Linearnet_priorpostdata(i,:)=get_rel_entropy(TE_priorpostdata,truth);
TE_rel_entropy_Linearnet_data(i,:)=get_rel_entropy(TE_data,truth);
TE_rel_entropy_Linearnet_sampling(i,:)=get_rel_entropy(TE_sampling,truth);

TE_rel_entropy_Linearnet_priorval(i,:)=get_rel_entropy(TE_priorval,truth);
TE_rel_entropy_Linearnet_priordataval(i,:)=get_rel_entropy(TE_priordataval,truth);
TE_rel_entropy_Linearnet_priorpostval(i,:)=get_rel_entropy(TE_priorpostval,truth);
TE_rel_entropy_Linearnet_priorpostdataval(i,:)=get_rel_entropy(TE_priorpostdataval,truth);
TE_rel_entropy_Linearnet_dataval(i,:)=get_rel_entropy(TE_dataval,truth);
TE_rel_entropy_Linearnet_samplingval(i,:)=get_rel_entropy(TE_samplingval,truth);

TE_rel_entropy_Linearnet_priorns(i,:)=get_rel_entropy(TE_priorns,truth);
TE_rel_entropy_Linearnet_priordatans(i,:)=get_rel_entropy(TE_priordatans,truth);
TE_rel_entropy_Linearnet_priorpostns(i,:)=get_rel_entropy(TE_priorpostns,truth);
TE_rel_entropy_Linearnet_priorpostdatans(i,:)=get_rel_entropy(TE_priorpostdatans,truth);
TE_rel_entropy_Linearnet_datans(i,:)=get_rel_entropy(TE_datans,truth);
TE_rel_entropy_Linearnet_samplingns(i,:)=get_rel_entropy(TE_samplingns,truth);


TEHW_prior=[standard_param(i).TEHW_prediction_Linearnet_prior_1;standard_param(i).TEHW_prediction_Linearnet_prior_2];
TEHW_priordata=[standard_param(i).TEHW_prediction_Linearnet_priordata_1;standard_param(i).TEHW_prediction_Linearnet_priordata_2];
TEHW_priorpost=[standard_param(i).TEHW_prediction_Linearnet_priorpost_1;standard_param(i).TEHW_prediction_Linearnet_priorpost_2];
TEHW_priorpostdata=[standard_param(i).TEHW_prediction_Linearnet_priorpostdata_1;standard_param(i).TEHW_prediction_Linearnet_priorpostdata_2];
TEHW_data=[standard_param(i).TEHW_prediction_Linearnet_data_1;standard_param(i).TEHW_prediction_Linearnet_data_2];
TEHW_sampling=[standard_param(i).TEHW_prediction_Linearnet_sampling_1;standard_param(i).TEHW_prediction_Linearnet_sampling_2];

TEHW_priorval=[standard_param(i).TEHW_prediction_Linearnet_priorval_1;standard_param(i).TEHW_prediction_Linearnet_priorval_2];
TEHW_priordataval=[standard_param(i).TEHW_prediction_Linearnet_priordataval_1;standard_param(i).TEHW_prediction_Linearnet_priordataval_2];
TEHW_priorpostval=[standard_param(i).TEHW_prediction_Linearnet_priorpostval_1;standard_param(i).TEHW_prediction_Linearnet_priorpostval_2];
TEHW_priorpostdataval=[standard_param(i).TEHW_prediction_Linearnet_priorpostdataval_1;standard_param(i).TEHW_prediction_Linearnet_priorpostdataval_2];
TEHW_dataval=[standard_param(i).TEHW_prediction_Linearnet_dataval_1;standard_param(i).TEHW_prediction_Linearnet_dataval_2];
TEHW_samplingval=[standard_param(i).TEHW_prediction_Linearnet_samplingval_1;standard_param(i).TEHW_prediction_Linearnet_samplingval_2];

TEHW_priorns=[standard_param(i).TEHW_prediction_Linearnet_priorns_1;standard_param(i).TEHW_prediction_Linearnet_priorns_2];
TEHW_priordatans=[standard_param(i).TEHW_prediction_Linearnet_priordatans_1;standard_param(i).TEHW_prediction_Linearnet_priordatans_2];
TEHW_priorpostns=[standard_param(i).TEHW_prediction_Linearnet_priorpostns_1;standard_param(i).TEHW_prediction_Linearnet_priorpostns_2];
TEHW_priorpostdatans=[standard_param(i).TEHW_prediction_Linearnet_priorpostdatans_1;standard_param(i).TEHW_prediction_Linearnet_priorpostdatans_2];
TEHW_datans=[standard_param(i).TEHW_prediction_Linearnet_datans_1;standard_param(i).TEHW_prediction_Linearnet_datans_2];
TEHW_samplingns=[standard_param(i).TEHW_prediction_Linearnet_samplingns_1;standard_param(i).TEHW_prediction_Linearnet_samplingns_2];


TEHW_pc_Linearnet_prior(i,:)=get_corr(TEHW_prior,truth);
TEHW_pc_Linearnet_priordata(i,:)=get_corr(TEHW_priordata,truth);
TEHW_pc_Linearnet_priorpost(i,:)=get_corr(TEHW_priorpost,truth);
TEHW_pc_Linearnet_priorpostdata(i,:)=get_corr(TEHW_priorpostdata,truth);
TEHW_pc_Linearnet_data(i,:)=get_corr(TEHW_data,truth);
TEHW_pc_Linearnet_sampling(i,:)=get_corr(TEHW_sampling,truth);

TEHW_pc_Linearnet_priorval(i,:)=get_corr(TEHW_priorval,truth);
TEHW_pc_Linearnet_priordataval(i,:)=get_corr(TEHW_priordataval,truth);
TEHW_pc_Linearnet_priorpostval(i,:)=get_corr(TEHW_priorpostval,truth);
TEHW_pc_Linearnet_priorpostdataval(i,:)=get_corr(TEHW_priorpostdataval,truth);
TEHW_pc_Linearnet_dataval(i,:)=get_corr(TEHW_dataval,truth);
TEHW_pc_Linearnet_samplingval(i,:)=get_corr(TEHW_samplingval,truth);

TEHW_pc_Linearnet_priorns(i,:)=get_corr(TEHW_priorns,truth);
TEHW_pc_Linearnet_priordatans(i,:)=get_corr(TEHW_priordatans,truth);
TEHW_pc_Linearnet_priorpostns(i,:)=get_corr(TEHW_priorpostns,truth);
TEHW_pc_Linearnet_priorpostdatans(i,:)=get_corr(TEHW_priorpostdatans,truth);
TEHW_pc_Linearnet_datans(i,:)=get_corr(TEHW_datans,truth);
TEHW_pc_Linearnet_samplingns(i,:)=get_corr(TEHW_samplingns,truth);


TEHW_rms_Linearnet_prior(i,:)=get_rmse(TEHW_prior,truth);
TEHW_rms_Linearnet_priordata(i,:)=get_rmse(TEHW_priordata,truth);
TEHW_rms_Linearnet_priorpost(i,:)=get_rmse(TEHW_priorpost,truth);
TEHW_rms_Linearnet_priorpostdata(i,:)=get_rmse(TEHW_priorpostdata,truth);
TEHW_rms_Linearnet_data(i,:)=get_rmse(TEHW_data,truth);
TEHW_rms_Linearnet_sampling(i,:)=get_rmse(TEHW_sampling,truth);

TEHW_rms_Linearnet_priorval(i,:)=get_rmse(TEHW_priorval,truth);
TEHW_rms_Linearnet_priordataval(i,:)=get_rmse(TEHW_priordataval,truth);
TEHW_rms_Linearnet_priorpostval(i,:)=get_rmse(TEHW_priorpostval,truth);
TEHW_rms_Linearnet_priorpostdataval(i,:)=get_rmse(TEHW_priorpostdataval,truth);
TEHW_rms_Linearnet_dataval(i,:)=get_rmse(TEHW_dataval,truth);
TEHW_rms_Linearnet_samplingval(i,:)=get_rmse(TEHW_samplingval,truth);

TEHW_rms_Linearnet_priorns(i,:)=get_rmse(TEHW_priorns,truth);
TEHW_rms_Linearnet_priordatans(i,:)=get_rmse(TEHW_priordatans,truth);
TEHW_rms_Linearnet_priorpostns(i,:)=get_rmse(TEHW_priorpostns,truth);
TEHW_rms_Linearnet_priorpostdatans(i,:)=get_rmse(TEHW_priorpostdatans,truth);
TEHW_rms_Linearnet_datans(i,:)=get_rmse(TEHW_datans,truth);
TEHW_rms_Linearnet_samplingns(i,:)=get_rmse(TEHW_samplingns,truth);


TEHW_rel_entropy_Linearnet_prior(i,:)=get_rel_entropy(TEHW_prior,truth);
TEHW_rel_entropy_Linearnet_priordata(i,:)=get_rel_entropy(TEHW_priordata,truth);
TEHW_rel_entropy_Linearnet_priorpost(i,:)=get_rel_entropy(TEHW_priorpost,truth);
TEHW_rel_entropy_Linearnet_priorpostdata(i,:)=get_rel_entropy(TEHW_priorpostdata,truth);
TEHW_rel_entropy_Linearnet_data(i,:)=get_rel_entropy(TEHW_data,truth);
TEHW_rel_entropy_Linearnet_sampling(i,:)=get_rel_entropy(TEHW_sampling,truth);

TEHW_rel_entropy_Linearnet_priorval(i,:)=get_rel_entropy(TEHW_priorval,truth);
TEHW_rel_entropy_Linearnet_priordataval(i,:)=get_rel_entropy(TEHW_priordataval,truth);
TEHW_rel_entropy_Linearnet_priorpostval(i,:)=get_rel_entropy(TEHW_priorpostval,truth);
TEHW_rel_entropy_Linearnet_priorpostdataval(i,:)=get_rel_entropy(TEHW_priorpostdataval,truth);
TEHW_rel_entropy_Linearnet_dataval(i,:)=get_rel_entropy(TEHW_dataval,truth);
TEHW_rel_entropy_Linearnet_samplingval(i,:)=get_rel_entropy(TEHW_samplingval,truth);

TEHW_rel_entropy_Linearnet_priorns(i,:)=get_rel_entropy(TEHW_priorns,truth);
TEHW_rel_entropy_Linearnet_priordatans(i,:)=get_rel_entropy(TEHW_priordatans,truth);
TEHW_rel_entropy_Linearnet_priorpostns(i,:)=get_rel_entropy(TEHW_priorpostns,truth);
TEHW_rel_entropy_Linearnet_priorpostdatans(i,:)=get_rel_entropy(TEHW_priorpostdatans,truth);
TEHW_rel_entropy_Linearnet_datans(i,:)=get_rel_entropy(TEHW_datans,truth);
TEHW_rel_entropy_Linearnet_samplingns(i,:)=get_rel_entropy(TEHW_samplingns,truth);

TEWB_prior=[standard_param(i).TEWB_prediction_Linearnet_prior_1;standard_param(i).TEWB_prediction_Linearnet_prior_2];
TEWB_priordata=[standard_param(i).TEWB_prediction_Linearnet_priordata_1;standard_param(i).TEWB_prediction_Linearnet_priordata_2];
TEWB_priorpost=[standard_param(i).TEWB_prediction_Linearnet_priorpost_1;standard_param(i).TEWB_prediction_Linearnet_priorpost_2];
TEWB_priorpostdata=[standard_param(i).TEWB_prediction_Linearnet_priorpostdata_1;standard_param(i).TEWB_prediction_Linearnet_priorpostdata_2];
TEWB_data=[standard_param(i).TEWB_prediction_Linearnet_data_1;standard_param(i).TEWB_prediction_Linearnet_data_2];
TEWB_sampling=[standard_param(i).TEWB_prediction_Linearnet_sampling_1;standard_param(i).TEWB_prediction_Linearnet_sampling_2];

TEWB_priorval=[standard_param(i).TEWB_prediction_Linearnet_priorval_1;standard_param(i).TEWB_prediction_Linearnet_priorval_2];
TEWB_priordataval=[standard_param(i).TEWB_prediction_Linearnet_priordataval_1;standard_param(i).TEWB_prediction_Linearnet_priordataval_2];
TEWB_priorpostval=[standard_param(i).TEWB_prediction_Linearnet_priorpostval_1;standard_param(i).TEWB_prediction_Linearnet_priorpostval_2];
TEWB_priorpostdataval=[standard_param(i).TEWB_prediction_Linearnet_priorpostdataval_1;standard_param(i).TEWB_prediction_Linearnet_priorpostdataval_2];
TEWB_dataval=[standard_param(i).TEWB_prediction_Linearnet_dataval_1;standard_param(i).TEWB_prediction_Linearnet_dataval_2];
TEWB_samplingval=[standard_param(i).TEWB_prediction_Linearnet_samplingval_1;standard_param(i).TEWB_prediction_Linearnet_samplingval_2];

TEWB_priorns=[standard_param(i).TEWB_prediction_Linearnet_priorns_1;standard_param(i).TEWB_prediction_Linearnet_priorns_2];
TEWB_priordatans=[standard_param(i).TEWB_prediction_Linearnet_priordatans_1;standard_param(i).TEWB_prediction_Linearnet_priordatans_2];
TEWB_priorpostns=[standard_param(i).TEWB_prediction_Linearnet_priorpostns_1;standard_param(i).TEWB_prediction_Linearnet_priorpostns_2];
TEWB_priorpostdatans=[standard_param(i).TEWB_prediction_Linearnet_priorpostdatans_1;standard_param(i).TEWB_prediction_Linearnet_priorpostdatans_2];
TEWB_datans=[standard_param(i).TEWB_prediction_Linearnet_datans_1;standard_param(i).TEWB_prediction_Linearnet_datans_2];
TEWB_samplingns=[standard_param(i).TEWB_prediction_Linearnet_samplingns_1;standard_param(i).TEWB_prediction_Linearnet_samplingns_2];

TEWB_pc_Linearnet_prior(i,:)=get_corr(TEWB_prior,truth);
TEWB_pc_Linearnet_priordata(i,:)=get_corr(TEWB_priordata,truth);
TEWB_pc_Linearnet_priorpost(i,:)=get_corr(TEWB_priorpost,truth);
TEWB_pc_Linearnet_priorpostdata(i,:)=get_corr(TEWB_priorpostdata,truth);
TEWB_pc_Linearnet_data(i,:)=get_corr(TEWB_data,truth);
TEWB_pc_Linearnet_sampling(i,:)=get_corr(TEWB_sampling,truth);

TEWB_pc_Linearnet_priorval(i,:)=get_corr(TEWB_priorval,truth);
TEWB_pc_Linearnet_priordataval(i,:)=get_corr(TEWB_priordataval,truth);
TEWB_pc_Linearnet_priorpostval(i,:)=get_corr(TEWB_priorpostval,truth);
TEWB_pc_Linearnet_priorpostdataval(i,:)=get_corr(TEWB_priorpostdataval,truth);
TEWB_pc_Linearnet_dataval(i,:)=get_corr(TEWB_dataval,truth);
TEWB_pc_Linearnet_samplingval(i,:)=get_corr(TEWB_samplingval,truth);

TEWB_pc_Linearnet_priorns(i,:)=get_corr(TEWB_priorns,truth);
TEWB_pc_Linearnet_priordatans(i,:)=get_corr(TEWB_priordatans,truth);
TEWB_pc_Linearnet_priorpostns(i,:)=get_corr(TEWB_priorpostns,truth);
TEWB_pc_Linearnet_priorpostdatans(i,:)=get_corr(TEWB_priorpostdatans,truth);
TEWB_pc_Linearnet_datans(i,:)=get_corr(TEWB_datans,truth);
TEWB_pc_Linearnet_samplingns(i,:)=get_corr(TEWB_samplingns,truth);



TEWB_rms_Linearnet_prior(i,:)=get_rmse(TEWB_prior,truth);
TEWB_rms_Linearnet_priordata(i,:)=get_rmse(TEWB_priordata,truth);
TEWB_rms_Linearnet_priorpost(i,:)=get_rmse(TEWB_priorpost,truth);
TEWB_rms_Linearnet_priorpostdata(i,:)=get_rmse(TEWB_priorpostdata,truth);
TEWB_rms_Linearnet_data(i,:)=get_rmse(TEWB_data,truth);
TEWB_rms_Linearnet_sampling(i,:)=get_rmse(TEWB_sampling,truth);

TEWB_rms_Linearnet_priorval(i,:)=get_rmse(TEWB_priorval,truth);
TEWB_rms_Linearnet_priordataval(i,:)=get_rmse(TEWB_priordataval,truth);
TEWB_rms_Linearnet_priorpostval(i,:)=get_rmse(TEWB_priorpostval,truth);
TEWB_rms_Linearnet_priorpostdataval(i,:)=get_rmse(TEWB_priorpostdataval,truth);
TEWB_rms_Linearnet_dataval(i,:)=get_rmse(TEWB_dataval,truth);
TEWB_rms_Linearnet_samplingval(i,:)=get_rmse(TEWB_samplingval,truth);

TEWB_rms_Linearnet_priorns(i,:)=get_rmse(TEWB_priorns,truth);
TEWB_rms_Linearnet_priordatans(i,:)=get_rmse(TEWB_priordatans,truth);
TEWB_rms_Linearnet_priorpostns(i,:)=get_rmse(TEWB_priorpostns,truth);
TEWB_rms_Linearnet_priorpostdatans(i,:)=get_rmse(TEWB_priorpostdatans,truth);
TEWB_rms_Linearnet_datans(i,:)=get_rmse(TEWB_datans,truth);
TEWB_rms_Linearnet_samplingns(i,:)=get_rmse(TEWB_samplingns,truth);


TEWB_rel_entropy_Linearnet_prior(i,:)=get_rel_entropy(TEWB_prior,truth);
TEWB_rel_entropy_Linearnet_priordata(i,:)=get_rel_entropy(TEWB_priordata,truth);
TEWB_rel_entropy_Linearnet_priorpost(i,:)=get_rel_entropy(TEWB_priorpost,truth);
TEWB_rel_entropy_Linearnet_priorpostdata(i,:)=get_rel_entropy(TEWB_priorpostdata,truth);
TEWB_rel_entropy_Linearnet_data(i,:)=get_rel_entropy(TEWB_data,truth);
TEWB_rel_entropy_Linearnet_sampling(i,:)=get_rel_entropy(TEWB_sampling,truth);

TEWB_rel_entropy_Linearnet_priorval(i,:)=get_rel_entropy(TEWB_priorval,truth);
TEWB_rel_entropy_Linearnet_priordataval(i,:)=get_rel_entropy(TEWB_priordataval,truth);
TEWB_rel_entropy_Linearnet_priorpostval(i,:)=get_rel_entropy(TEWB_priorpostval,truth);
TEWB_rel_entropy_Linearnet_priorpostdataval(i,:)=get_rel_entropy(TEWB_priorpostdataval,truth);
TEWB_rel_entropy_Linearnet_dataval(i,:)=get_rel_entropy(TEWB_dataval,truth);
TEWB_rel_entropy_Linearnet_samplingval(i,:)=get_rel_entropy(TEWB_samplingval,truth);

TEWB_rel_entropy_Linearnet_priorns(i,:)=get_rel_entropy(TEWB_priorns,truth);
TEWB_rel_entropy_Linearnet_priordatans(i,:)=get_rel_entropy(TEWB_priordatans,truth);
TEWB_rel_entropy_Linearnet_priorpostns(i,:)=get_rel_entropy(TEWB_priorpostns,truth);
TEWB_rel_entropy_Linearnet_priorpostdatans(i,:)=get_rel_entropy(TEWB_priorpostdatans,truth);
TEWB_rel_entropy_Linearnet_datans(i,:)=get_rel_entropy(TEWB_datans,truth);
TEWB_rel_entropy_Linearnet_samplingns(i,:)=get_rel_entropy(TEWB_samplingns,truth);

TEWBHW_prior=[standard_param(i).TEWBHW_prediction_Linearnet_prior_1;standard_param(i).TEWBHW_prediction_Linearnet_prior_2];
TEWBHW_priordata=[standard_param(i).TEWBHW_prediction_Linearnet_priordata_1;standard_param(i).TEWBHW_prediction_Linearnet_priordata_2];
TEWBHW_priorpost=[standard_param(i).TEWBHW_prediction_Linearnet_priorpost_1;standard_param(i).TEWBHW_prediction_Linearnet_priorpost_2];
TEWBHW_priorpostdata=[standard_param(i).TEWBHW_prediction_Linearnet_priorpostdata_1;standard_param(i).TEWBHW_prediction_Linearnet_priorpostdata_2];
TEWBHW_data=[standard_param(i).TEWBHW_prediction_Linearnet_data_1;standard_param(i).TEWBHW_prediction_Linearnet_data_2];
TEWBHW_sampling=[standard_param(i).TEWBHW_prediction_Linearnet_sampling_1;standard_param(i).TEWBHW_prediction_Linearnet_sampling_2];

TEWBHW_priorval=[standard_param(i).TEWBHW_prediction_Linearnet_priorval_1;standard_param(i).TEWBHW_prediction_Linearnet_priorval_2];
TEWBHW_priordataval=[standard_param(i).TEWBHW_prediction_Linearnet_priordataval_1;standard_param(i).TEWBHW_prediction_Linearnet_priordataval_2];
TEWBHW_priorpostval=[standard_param(i).TEWBHW_prediction_Linearnet_priorpostval_1;standard_param(i).TEWBHW_prediction_Linearnet_priorpostval_2];
TEWBHW_priorpostdataval=[standard_param(i).TEWBHW_prediction_Linearnet_priorpostdataval_1;standard_param(i).TEWBHW_prediction_Linearnet_priorpostdataval_2];
TEWBHW_dataval=[standard_param(i).TEWBHW_prediction_Linearnet_dataval_1;standard_param(i).TEWBHW_prediction_Linearnet_dataval_2];
TEWBHW_samplingval=[standard_param(i).TEWBHW_prediction_Linearnet_samplingval_1;standard_param(i).TEWBHW_prediction_Linearnet_samplingval_2];

TEWBHW_priorns=[standard_param(i).TEWBHW_prediction_Linearnet_priorns_1;standard_param(i).TEWBHW_prediction_Linearnet_priorns_2];
TEWBHW_priordatans=[standard_param(i).TEWBHW_prediction_Linearnet_priordatans_1;standard_param(i).TEWBHW_prediction_Linearnet_priordatans_2];
TEWBHW_priorpostns=[standard_param(i).TEWBHW_prediction_Linearnet_priorpostns_1;standard_param(i).TEWBHW_prediction_Linearnet_priorpostns_2];
TEWBHW_priorpostdatans=[standard_param(i).TEWBHW_prediction_Linearnet_priorpostdatans_1;standard_param(i).TEWBHW_prediction_Linearnet_priorpostdatans_2];
TEWBHW_datans=[standard_param(i).TEWBHW_prediction_Linearnet_datans_1;standard_param(i).TEWBHW_prediction_Linearnet_datans_2];
TEWBHW_samplingns=[standard_param(i).TEWBHW_prediction_Linearnet_samplingns_1;standard_param(i).TEWBHW_prediction_Linearnet_samplingns_2];


TEWBHW_pc_Linearnet_prior(i,:)=get_corr(TEWBHW_prior,truth);
TEWBHW_pc_Linearnet_priordata(i,:)=get_corr(TEWBHW_priordata,truth);
TEWBHW_pc_Linearnet_priorpost(i,:)=get_corr(TEWBHW_priorpost,truth);
TEWBHW_pc_Linearnet_priorpostdata(i,:)=get_corr(TEWBHW_priorpostdata,truth);
TEWBHW_pc_Linearnet_data(i,:)=get_corr(TEWBHW_data,truth);
TEWBHW_pc_Linearnet_sampling(i,:)=get_corr(TEWBHW_sampling,truth);

TEWBHW_pc_Linearnet_priorval(i,:)=get_corr(TEWBHW_priorval,truth);
TEWBHW_pc_Linearnet_priordataval(i,:)=get_corr(TEWBHW_priordataval,truth);
TEWBHW_pc_Linearnet_priorpostval(i,:)=get_corr(TEWBHW_priorpostval,truth);
TEWBHW_pc_Linearnet_priorpostdataval(i,:)=get_corr(TEWBHW_priorpostdataval,truth);
TEWBHW_pc_Linearnet_dataval(i,:)=get_corr(TEWBHW_dataval,truth);
TEWBHW_pc_Linearnet_samplingval(i,:)=get_corr(TEWBHW_samplingval,truth);

TEWBHW_pc_Linearnet_priorns(i,:)=get_corr(TEWBHW_priorns,truth);
TEWBHW_pc_Linearnet_priordatans(i,:)=get_corr(TEWBHW_priordatans,truth);
TEWBHW_pc_Linearnet_priorpostns(i,:)=get_corr(TEWBHW_priorpostns,truth);
TEWBHW_pc_Linearnet_priorpostdatans(i,:)=get_corr(TEWBHW_priorpostdatans,truth);
TEWBHW_pc_Linearnet_datans(i,:)=get_corr(TEWBHW_datans,truth);
TEWBHW_pc_Linearnet_samplingns(i,:)=get_corr(TEWBHW_samplingns,truth);


TEWBHW_rms_Linearnet_prior(i,:)=get_rmse(TEWBHW_prior,truth);
TEWBHW_rms_Linearnet_priordata(i,:)=get_rmse(TEWBHW_priordata,truth);
TEWBHW_rms_Linearnet_priorpost(i,:)=get_rmse(TEWBHW_priorpost,truth);
TEWBHW_rms_Linearnet_priorpostdata(i,:)=get_rmse(TEWBHW_priorpostdata,truth);
TEWBHW_rms_Linearnet_data(i,:)=get_rmse(TEWBHW_data,truth);
TEWBHW_rms_Linearnet_sampling(i,:)=get_rmse(TEWBHW_sampling,truth);

TEWBHW_rms_Linearnet_priorval(i,:)=get_rmse(TEWBHW_priorval,truth);
TEWBHW_rms_Linearnet_priordataval(i,:)=get_rmse(TEWBHW_priordataval,truth);
TEWBHW_rms_Linearnet_priorpostval(i,:)=get_rmse(TEWBHW_priorpostval,truth);
TEWBHW_rms_Linearnet_priorpostdataval(i,:)=get_rmse(TEWBHW_priorpostdataval,truth);
TEWBHW_rms_Linearnet_dataval(i,:)=get_rmse(TEWBHW_dataval,truth);
TEWBHW_rms_Linearnet_samplingval(i,:)=get_rmse(TEWBHW_samplingval,truth);

TEWBHW_rms_Linearnet_priorns(i,:)=get_rmse(TEWBHW_priorns,truth);
TEWBHW_rms_Linearnet_priordatans(i,:)=get_rmse(TEWBHW_priordatans,truth);
TEWBHW_rms_Linearnet_priorpostns(i,:)=get_rmse(TEWBHW_priorpostns,truth);
TEWBHW_rms_Linearnet_priorpostdatans(i,:)=get_rmse(TEWBHW_priorpostdatans,truth);
TEWBHW_rms_Linearnet_datans(i,:)=get_rmse(TEWBHW_datans,truth);
TEWBHW_rms_Linearnet_samplingns(i,:)=get_rmse(TEWBHW_samplingns,truth);


TEWBHW_rel_entropy_Linearnet_prior(i,:)=get_rel_entropy(TEWBHW_prior,truth);
TEWBHW_rel_entropy_Linearnet_priordata(i,:)=get_rel_entropy(TEWBHW_priordata,truth);
TEWBHW_rel_entropy_Linearnet_priorpost(i,:)=get_rel_entropy(TEWBHW_priorpost,truth);
TEWBHW_rel_entropy_Linearnet_priorpostdata(i,:)=get_rel_entropy(TEWBHW_priorpostdata,truth);
TEWBHW_rel_entropy_Linearnet_data(i,:)=get_rel_entropy(TEWBHW_data,truth);
TEWBHW_rel_entropy_Linearnet_sampling(i,:)=get_rel_entropy(TEWBHW_sampling,truth);

TEWBHW_rel_entropy_Linearnet_priorval(i,:)=get_rel_entropy(TEWBHW_priorval,truth);
TEWBHW_rel_entropy_Linearnet_priordataval(i,:)=get_rel_entropy(TEWBHW_priordataval,truth);
TEWBHW_rel_entropy_Linearnet_priorpostval(i,:)=get_rel_entropy(TEWBHW_priorpostval,truth);
TEWBHW_rel_entropy_Linearnet_priorpostdataval(i,:)=get_rel_entropy(TEWBHW_priorpostdataval,truth);
TEWBHW_rel_entropy_Linearnet_dataval(i,:)=get_rel_entropy(TEWBHW_dataval,truth);
TEWBHW_rel_entropy_Linearnet_samplingval(i,:)=get_rel_entropy(TEWBHW_samplingval,truth);

TEWBHW_rel_entropy_Linearnet_priorns(i,:)=get_rel_entropy(TEWBHW_priorns,truth);
TEWBHW_rel_entropy_Linearnet_priordatans(i,:)=get_rel_entropy(TEWBHW_priordatans,truth);
TEWBHW_rel_entropy_Linearnet_priorpostns(i,:)=get_rel_entropy(TEWBHW_priorpostns,truth);
TEWBHW_rel_entropy_Linearnet_priorpostdatans(i,:)=get_rel_entropy(TEWBHW_priorpostdatans,truth);
TEWBHW_rel_entropy_Linearnet_datans(i,:)=get_rel_entropy(TEWBHW_datans,truth);
TEWBHW_rel_entropy_Linearnet_samplingns(i,:)=get_rel_entropy(TEWBHW_samplingns,truth);

i
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% pc5_TE_pc_Linearnet_prior = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priordata = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priorpost = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priorpostdata = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_data = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_sampling = zeros(numel(standard_param),1);
% 
% pc5_TE_pc_Linearnet_priorval = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priordataval = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priorpostval = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priorpostdataval = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_dataval = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_samplingval = zeros(numel(standard_param),1);
% 
% 
% pc5_TE_pc_Linearnet_priorns = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priordatans = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priorpostns = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_priorpostdatans = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_datans = zeros(numel(standard_param),1);
% pc5_TE_pc_Linearnet_samplingns = zeros(numel(standard_param),1);
% 
% 
% pc5_TEHW_pc_Linearnet_prior = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priordata = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priorpost = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priorpostdata = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_data = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_sampling = zeros(numel(standard_param),1);
% 
% pc5_TEHW_pc_Linearnet_priorval = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priordataval = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priorpostval = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priorpostdataval = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_dataval = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_samplingval = zeros(numel(standard_param),1);
% 

% pc5_TEHW_pc_Linearnet_priorns = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priordatans = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priorpostns = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_priorpostdatans = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_datans = zeros(numel(standard_param),1);
% pc5_TEHW_pc_Linearnet_samplingns = zeros(numel(standard_param),1);
% 
% 
% pc5_TEWB_pc_Linearnet_prior = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priordata = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priorpost = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priorpostdata = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_data = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_sampling = zeros(numel(standard_param),1);
% 
% pc5_TEWB_pc_Linearnet_priorval = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priordataval = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priorpostval = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priorpostdataval = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_dataval = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_samplingval = zeros(numel(standard_param),1);
% 
% 
% pc5_TEWB_pc_Linearnet_priorns = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priordatans = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priorpostns = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_priorpostdatans = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_datans = zeros(numel(standard_param),1);
% pc5_TEWB_pc_Linearnet_samplingns = zeros(numel(standard_param),1);
% 

pc5_TEWBHW_pc_Linearnet_prior = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priordata = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priorpost = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priorpostdata = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_data = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_sampling = zeros(numel(standard_param),1);

pc5_TEWBHW_pc_Linearnet_priorval = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priordataval = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priorpostval = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priorpostdataval = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_dataval = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_samplingval = zeros(numel(standard_param),1);


pc5_TEWBHW_pc_Linearnet_priorns = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priordatans = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priorpostns = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_priorpostdatans = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_datans = zeros(numel(standard_param),1);
pc5_TEWBHW_pc_Linearnet_samplingns = zeros(numel(standard_param),1);


for i=1:numel(standard_param)
    pc5_TEWBHW_pc_Linearnet_prior(i)=(length(TEWBHW_pc_Linearnet_prior(i,TEWBHW_pc_Linearnet_prior(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priordata(i)=(length(TEWBHW_pc_Linearnet_priordata(i,TEWBHW_pc_Linearnet_priordata(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priorpost(i)=(length(TEWBHW_pc_Linearnet_priorpost(i,TEWBHW_pc_Linearnet_priorpost(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priorpostdata(i)=(length(TEWBHW_pc_Linearnet_priorpostdata(i,TEWBHW_pc_Linearnet_priorpostdata(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_data(i)=(length(TEWBHW_pc_Linearnet_data(i,TEWBHW_pc_Linearnet_data(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_sampling(i)=(length(TEWBHW_pc_Linearnet_sampling(i,TEWBHW_pc_Linearnet_sampling(i,:)>= .5))-1)/4.2857;
    
    pc5_TEWBHW_pc_Linearnet_priorval(i)=(length(TEWBHW_pc_Linearnet_priorval(i,TEWBHW_pc_Linearnet_priorval(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priordataval(i)=(length(TEWBHW_pc_Linearnet_priordataval(i,TEWBHW_pc_Linearnet_priordataval(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priorpostval(i)=(length(TEWBHW_pc_Linearnet_priorpostval(i,TEWBHW_pc_Linearnet_priorpostval(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priorpostdataval(i)=(length(TEWBHW_pc_Linearnet_priorpostdataval(i,TEWBHW_pc_Linearnet_priorpostdataval(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_dataval(i)=(length(TEWBHW_pc_Linearnet_data(i,TEWBHW_pc_Linearnet_data(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_samplingval(i)=(length(TEWBHW_pc_Linearnet_sampling(i,TEWBHW_pc_Linearnet_sampling(i,:)>= .5))-1)/4.2857;

    pc5_TEWBHW_pc_Linearnet_priorns(i)=(length(TEWBHW_pc_Linearnet_priorns(i,TEWBHW_pc_Linearnet_priorns(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priordatans(i)=(length(TEWBHW_pc_Linearnet_priordatans(i,TEWBHW_pc_Linearnet_priordatans(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priorpostns(i)=(length(TEWBHW_pc_Linearnet_priorpostns(i,TEWBHW_pc_Linearnet_priorpostns(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_priorpostdatans(i)=(length(TEWBHW_pc_Linearnet_priorpostdatans(i,TEWBHW_pc_Linearnet_priorpostdatans(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_datans(i)=(length(TEWBHW_pc_Linearnet_data(i,TEWBHW_pc_Linearnet_data(i,:)>= .5))-1)/4.2857;
    pc5_TEWBHW_pc_Linearnet_samplingns(i)=(length(TEWBHW_pc_Linearnet_sampling(i,TEWBHW_pc_Linearnet_sampling(i,:)>= .5))-1)/4.2857;
    


%     pc5_TEHW_pc_Linearnet_prior(i)=(length(TEHW_pc_Linearnet_prior(i,TEHW_pc_Linearnet_prior(i,:)>= .5))-1)/4.2857;
%     pc5_TEHW_pc_Linearnet_priorns(i)=(length(TEHW_pc_Linearnet_priorns(i,TEHW_pc_Linearnet_priorns(i,:)>= .5))-1)/4.2857;
%     pc5_TEHW_pc_Linearnet_priordata(i)=(length(TEHW_pc_Linearnet_priordata(i,TEHW_pc_Linearnet_priordata(i,:)>= .5))-1)/4.2857;
%     pc5_TEHW_pc_Linearnet_priordatans(i)=(length(TEHW_pc_Linearnet_priordatans(i,TEHW_pc_Linearnet_priordatans(i,:)>= .5))-1)/4.2857;
%     pc5_TEHW_pc_Linearnet_priorpost(i)=(length(TEHW_pc_Linearnet_priorpost(i,TEHW_pc_Linearnet_priorpost(i,:)>= .5))-1)/4.2857;
%     pc5_TEHW_pc_Linearnet_priorpostns(i)=(length(TEHW_pc_Linearnet_priorpostns(i,TEHW_pc_Linearnet_priorpostns(i,:)>= .5))-1)/4.2857;
%     pc5_TEHW_pc_Linearnet_priorpostdatans(i)=(length(TEHW_pc_Linearnet_priorpostdatans(i,TEHW_pc_Linearnet_priorpostdatans(i,:)>= .5))-1)/4.2857;
%     pc5_TEHW_pc_Linearnet_priorpostdata(i)=(length(TEHW_pc_Linearnet_priorpostdata(i,TEHW_pc_Linearnet_priorpostdata(i,:)>= .5))-1)/4.2857;
% 
%     pc5_TEWB_pc_Linearnet_prior(i)=(length(TEWB_pc_Linearnet_prior(i,TEWB_pc_Linearnet_prior(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorns(i)=(length(TEWB_pc_Linearnet_priorns(i,TEWB_pc_Linearnet_priorns(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priordata(i)=(length(TEWB_pc_Linearnet_priordata(i,TEWB_pc_Linearnet_priordata(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priordatans(i)=(length(TEWB_pc_Linearnet_priordatans(i,TEWB_pc_Linearnet_priordatans(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpost(i)=(length(TEWB_pc_Linearnet_priorpost(i,TEWB_pc_Linearnet_priorpost(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpostns(i)=(length(TEWB_pc_Linearnet_priorpostns(i,TEWB_pc_Linearnet_priorpostns(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpostdatans(i)=(length(TEWB_pc_Linearnet_priorpostdatans(i,TEWB_pc_Linearnet_priorpostdatans(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpostdata(i)=(length(TEWB_pc_Linearnet_priorpostdata(i,TEWB_pc_Linearnet_priorpostdata(i,:)>= .5))-1)/4.2857;
% 
%     pc5_TEWB_pc_Linearnet_prior(i)=(length(TEWB_pc_Linearnet_prior(i,TEWB_pc_Linearnet_prior(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorns(i)=(length(TEWB_pc_Linearnet_priorns(i,TEWB_pc_Linearnet_priorns(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priordata(i)=(length(TEWB_pc_Linearnet_priordata(i,TEWB_pc_Linearnet_priordata(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priordatans(i)=(length(TEWB_pc_Linearnet_priordatans(i,TEWB_pc_Linearnet_priordatans(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpost(i)=(length(TEWB_pc_Linearnet_priorpost(i,TEWB_pc_Linearnet_priorpost(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpostns(i)=(length(TEWB_pc_Linearnet_priorpostns(i,TEWB_pc_Linearnet_priorpostns(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpostdatans(i)=(length(TEWB_pc_Linearnet_priorpostdatans(i,TEWB_pc_Linearnet_priorpostdatans(i,:)>= .5))-1)/4.2857;
%     pc5_TEWB_pc_Linearnet_priorpostdata(i)=(length(TEWB_pc_Linearnet_priorpostdata(i,TEWB_pc_Linearnet_priorpostdata(i,:)>= .5))-1)/4.2857;


end

save('standardload.mat')
