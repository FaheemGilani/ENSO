import scipy.io as sio
import numpy as np



from pyfunctionforkeras import get_corr_matrix
from pyfunctionforkeras import predict_oneshot,create_Linearnet_multioutput
import os 
#import subprocess


#subprocess.call(['matlab', '-wait','-nosplash','-nodesktop','-r','perturbtest.m'])

Full_Data= sio.loadmat('data_for_net.mat')

out_step=50


###########################################################################################
################################TE#########################################################
###########################################################################################


indices=np.arange(8)
#
#
#
input_shape=(len(indices),)
#covariate_train_1=Full_Data['covariate_train_1'][:,indices]
#response_train_1=Full_Data['response_train_1']
Dcovariate_train_1=Full_Data['Dcovariate_train_1'][:,indices]
Dresponse_train_1=Full_Data['Dresponse_train_1']
covariate_test_1=Full_Data['covariate_test_1'][:,indices]
response_test_1=Full_Data['response_test_1']

#covariate_train_2=Full_Data['covariate_train_2'][:,indices]
#response_train_2=Full_Data['response_train_2']
Dcovariate_train_2=Full_Data['Dcovariate_train_2'][:,indices]
Dresponse_train_2=Full_Data['Dresponse_train_2']
covariate_test_2=Full_Data['covariate_test_2'][:,indices]
response_test_2=Full_Data['response_test_2']



time_1=Full_Data['time_1']
time_2=Full_Data['time_2']


#Scovariate_train_1=Full_Data['Scovariate_train_1'][:,indices]
#Scovariate_train_2=Full_Data['Scovariate_train_2'][:,indices]
#Sresponse_train_1=Full_Data['Sresponse_train_1']
#Sresponse_train_2=Full_Data['Sresponse_train_2']
covariate_prior_1=Full_Data['covariate_prior_1'][:,indices]
response_prior_1=Full_Data['response_prior_1']
covariate_prior_2=Full_Data['covariate_prior_2'][:,indices]
response_prior_2=Full_Data['response_prior_2']

covariate_priordata_1=Full_Data['covariate_priordata_1'][:,indices]
response_priordata_1=Full_Data['response_priordata_1']
covariate_priordata_2=Full_Data['covariate_priordata_2'][:,indices]
response_priordata_2=Full_Data['response_priordata_2']

covariate_priorpost_1=Full_Data['covariate_priorpost_1'][:,indices]
response_priorpost_1=Full_Data['response_priorpost_1']
covariate_priorpost_2=Full_Data['covariate_priorpost_2'][:,indices]
response_priorpost_2=Full_Data['response_priorpost_2']

covariate_priorpostdata_1=Full_Data['covariate_priorpostdata_1'][:,indices]
response_priorpostdata_1=Full_Data['response_priorpostdata_1']
covariate_priorpostdata_2=Full_Data['covariate_priorpostdata_2'][:,indices]
response_priorpostdata_2=Full_Data['response_priorpostdata_2']

covariate_sampling_1=Full_Data['covariate_sampling_1'][:,indices]
response_sampling_1=Full_Data['response_sampling_1']
covariate_sampling_2=Full_Data['covariate_sampling_2'][:,indices]
response_sampling_2=Full_Data['response_sampling_2']

#
##########Linear############
Linearnet_multioutput_model_priorval_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorval_1=predict_oneshot(Linearnet_multioutput_model_priorval_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorval_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorval_2=predict_oneshot(Linearnet_multioutput_model_priorval_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priordataval_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priordataval_1=predict_oneshot(Linearnet_multioutput_model_priordataval_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priordataval_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priordataval_2=predict_oneshot(Linearnet_multioutput_model_priordataval_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostval_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostval_1=predict_oneshot(Linearnet_multioutput_model_priorpostval_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostval_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostval_2=predict_oneshot(Linearnet_multioutput_model_priorpostval_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostdataval_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostdataval_1=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostdataval_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostdataval_2=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,3)


Linearnet_multioutput_model_samplingval_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_samplingval_1=predict_oneshot(Linearnet_multioutput_model_samplingval_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,3)
#
Linearnet_multioutput_model_samplingval_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_samplingval_2=predict_oneshot(Linearnet_multioutput_model_samplingval_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_dataval_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_dataval_1=predict_oneshot(Linearnet_multioutput_model_dataval_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,3)


Linearnet_multioutput_model_dataval_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_dataval_2=predict_oneshot(Linearnet_multioutput_model_dataval_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,3)



Linearnet_multioutput_model_priorns_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorns_1=predict_oneshot(Linearnet_multioutput_model_priorns_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorns_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorns_2=predict_oneshot(Linearnet_multioutput_model_priorns_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priordatans_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priordatans_1=predict_oneshot(Linearnet_multioutput_model_priordatans_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priordatans_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priordatans_2=predict_oneshot(Linearnet_multioutput_model_priordatans_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostns_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostns_1=predict_oneshot(Linearnet_multioutput_model_priorpostns_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostns_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostns_2=predict_oneshot(Linearnet_multioutput_model_priorpostns_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostdatans_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostdatans_1=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostdatans_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostdatans_2=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,2)


Linearnet_multioutput_model_samplingns_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_samplingns_1=predict_oneshot(Linearnet_multioutput_model_samplingns_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,2)
#
Linearnet_multioutput_model_samplingns_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_samplingns_2=predict_oneshot(Linearnet_multioutput_model_samplingns_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_datans_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_datans_1=predict_oneshot(Linearnet_multioutput_model_datans_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,2)


Linearnet_multioutput_model_datans_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_datans_2=predict_oneshot(Linearnet_multioutput_model_datans_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,2)



Linearnet_multioutput_model_prior_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_prior_1=predict_oneshot(Linearnet_multioutput_model_prior_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_prior_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_prior_2=predict_oneshot(Linearnet_multioutput_model_prior_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priordata_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priordata_1=predict_oneshot(Linearnet_multioutput_model_priordata_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priordata_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priordata_2=predict_oneshot(Linearnet_multioutput_model_priordata_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpost_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpost_1=predict_oneshot(Linearnet_multioutput_model_priorpost_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpost_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpost_2=predict_oneshot(Linearnet_multioutput_model_priorpost_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpostdata_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostdata_1=predict_oneshot(Linearnet_multioutput_model_priorpostdata_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpostdata_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_priorpostdata_2=predict_oneshot(Linearnet_multioutput_model_priorpostdata_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_data_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_data_1=predict_oneshot(Linearnet_multioutput_model_data_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_data_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_data_2=predict_oneshot(Linearnet_multioutput_model_data_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_sampling_1=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_sampling_1=predict_oneshot(Linearnet_multioutput_model_sampling_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_sampling_2=create_Linearnet_multioutput(input_shape,out_step)
TE_prediction_Linearnet_sampling_2=predict_oneshot(Linearnet_multioutput_model_sampling_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1)


############################################################
############################TEHW############################
############################################################
############################################################


indices=np.concatenate((np.arange(8),np.arange(24,32)))

input_shape=(len(indices),)

Dcovariate_train_1=Full_Data['Dcovariate_train_1'][:,indices]
Dresponse_train_1=Full_Data['Dresponse_train_1']
covariate_test_1=Full_Data['covariate_test_1'][:,indices]
response_test_1=Full_Data['response_test_1']


Dcovariate_train_2=Full_Data['Dcovariate_train_2'][:,indices]
Dresponse_train_2=Full_Data['Dresponse_train_2']
covariate_test_2=Full_Data['covariate_test_2'][:,indices]
response_test_2=Full_Data['response_test_2']



time_1=Full_Data['time_1']
time_2=Full_Data['time_2']



covariate_prior_1=Full_Data['covariate_prior_1'][:,indices]
response_prior_1=Full_Data['response_prior_1']
covariate_prior_2=Full_Data['covariate_prior_2'][:,indices]
response_prior_2=Full_Data['response_prior_2']

covariate_priordata_1=Full_Data['covariate_priordata_1'][:,indices]
response_priordata_1=Full_Data['response_priordata_1']
covariate_priordata_2=Full_Data['covariate_priordata_2'][:,indices]
response_priordata_2=Full_Data['response_priordata_2']

covariate_priorpost_1=Full_Data['covariate_priorpost_1'][:,indices]
response_priorpost_1=Full_Data['response_priorpost_1']
covariate_priorpost_2=Full_Data['covariate_priorpost_2'][:,indices]
response_priorpost_2=Full_Data['response_priorpost_2']

covariate_priorpostdata_1=Full_Data['covariate_priorpostdata_1'][:,indices]
response_priorpostdata_1=Full_Data['response_priorpostdata_1']
covariate_priorpostdata_2=Full_Data['covariate_priorpostdata_2'][:,indices]
response_priorpostdata_2=Full_Data['response_priorpostdata_2']

covariate_sampling_1=Full_Data['covariate_sampling_1'][:,indices]
response_sampling_1=Full_Data['response_sampling_1']
covariate_sampling_2=Full_Data['covariate_sampling_2'][:,indices]
response_sampling_2=Full_Data['response_sampling_2']



#########Linear############
Linearnet_multioutput_model_priorval_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorval_1=predict_oneshot(Linearnet_multioutput_model_priorval_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorval_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorval_2=predict_oneshot(Linearnet_multioutput_model_priorval_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priordataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priordataval_1=predict_oneshot(Linearnet_multioutput_model_priordataval_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priordataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priordataval_2=predict_oneshot(Linearnet_multioutput_model_priordataval_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostval_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostval_1=predict_oneshot(Linearnet_multioutput_model_priorpostval_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostval_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostval_2=predict_oneshot(Linearnet_multioutput_model_priorpostval_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostdataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostdataval_1=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostdataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostdataval_2=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,3)


Linearnet_multioutput_model_samplingval_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_samplingval_1=predict_oneshot(Linearnet_multioutput_model_samplingval_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,3)
#
Linearnet_multioutput_model_samplingval_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_samplingval_2=predict_oneshot(Linearnet_multioutput_model_samplingval_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_dataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_dataval_1=predict_oneshot(Linearnet_multioutput_model_dataval_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,3)


Linearnet_multioutput_model_dataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_dataval_2=predict_oneshot(Linearnet_multioutput_model_dataval_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,3)



Linearnet_multioutput_model_priorns_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorns_1=predict_oneshot(Linearnet_multioutput_model_priorns_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorns_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorns_2=predict_oneshot(Linearnet_multioutput_model_priorns_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priordatans_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priordatans_1=predict_oneshot(Linearnet_multioutput_model_priordatans_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priordatans_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priordatans_2=predict_oneshot(Linearnet_multioutput_model_priordatans_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostns_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostns_1=predict_oneshot(Linearnet_multioutput_model_priorpostns_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostns_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostns_2=predict_oneshot(Linearnet_multioutput_model_priorpostns_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostdatans_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostdatans_1=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostdatans_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostdatans_2=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,2)


Linearnet_multioutput_model_samplingns_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_samplingns_1=predict_oneshot(Linearnet_multioutput_model_samplingns_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,2)
#
Linearnet_multioutput_model_samplingns_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_samplingns_2=predict_oneshot(Linearnet_multioutput_model_samplingns_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_datans_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_datans_1=predict_oneshot(Linearnet_multioutput_model_datans_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,2)


Linearnet_multioutput_model_datans_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_datans_2=predict_oneshot(Linearnet_multioutput_model_datans_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,2)



Linearnet_multioutput_model_prior_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_prior_1=predict_oneshot(Linearnet_multioutput_model_prior_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_prior_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_prior_2=predict_oneshot(Linearnet_multioutput_model_prior_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priordata_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priordata_1=predict_oneshot(Linearnet_multioutput_model_priordata_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priordata_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priordata_2=predict_oneshot(Linearnet_multioutput_model_priordata_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpost_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpost_1=predict_oneshot(Linearnet_multioutput_model_priorpost_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpost_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpost_2=predict_oneshot(Linearnet_multioutput_model_priorpost_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpostdata_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostdata_1=predict_oneshot(Linearnet_multioutput_model_priorpostdata_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpostdata_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_priorpostdata_2=predict_oneshot(Linearnet_multioutput_model_priorpostdata_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_data_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_data_1=predict_oneshot(Linearnet_multioutput_model_data_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_data_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_data_2=predict_oneshot(Linearnet_multioutput_model_data_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_sampling_1=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_sampling_1=predict_oneshot(Linearnet_multioutput_model_sampling_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_sampling_2=create_Linearnet_multioutput(input_shape,out_step)
TEHW_prediction_Linearnet_sampling_2=predict_oneshot(Linearnet_multioutput_model_sampling_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1)




###########################################################################################
################################TEWB#########################################################
###########################################################################################

indices=np.arange(16)


#
input_shape=(len(indices),)
#covariate_train_1=Full_Data['covariate_train_1'][:,indices]
#response_train_1=Full_Data['response_train_1']
Dcovariate_train_1=Full_Data['Dcovariate_train_1'][:,indices]
Dresponse_train_1=Full_Data['Dresponse_train_1']
covariate_test_1=Full_Data['covariate_test_1'][:,indices]
response_test_1=Full_Data['response_test_1']

#covariate_train_2=Full_Data['covariate_train_2'][:,indices]
#response_train_2=Full_Data['response_train_2']
Dcovariate_train_2=Full_Data['Dcovariate_train_2'][:,indices]
Dresponse_train_2=Full_Data['Dresponse_train_2']
covariate_test_2=Full_Data['covariate_test_2'][:,indices]
response_test_2=Full_Data['response_test_2']



time_1=Full_Data['time_1']
time_2=Full_Data['time_2']


#Scovariate_train_1=Full_Data['Scovariate_train_1'][:,indices]
#Scovariate_train_2=Full_Data['Scovariate_train_2'][:,indices]
#Sresponse_train_1=Full_Data['Sresponse_train_1']
#Sresponse_train_2=Full_Data['Sresponse_train_2']
covariate_prior_1=Full_Data['covariate_prior_1'][:,indices]
response_prior_1=Full_Data['response_prior_1']
covariate_prior_2=Full_Data['covariate_prior_2'][:,indices]
response_prior_2=Full_Data['response_prior_2']

covariate_priordata_1=Full_Data['covariate_priordata_1'][:,indices]
response_priordata_1=Full_Data['response_priordata_1']
covariate_priordata_2=Full_Data['covariate_priordata_2'][:,indices]
response_priordata_2=Full_Data['response_priordata_2']

covariate_priorpost_1=Full_Data['covariate_priorpost_1'][:,indices]
response_priorpost_1=Full_Data['response_priorpost_1']
covariate_priorpost_2=Full_Data['covariate_priorpost_2'][:,indices]
response_priorpost_2=Full_Data['response_priorpost_2']

covariate_priorpostdata_1=Full_Data['covariate_priorpostdata_1'][:,indices]
response_priorpostdata_1=Full_Data['response_priorpostdata_1']
covariate_priorpostdata_2=Full_Data['covariate_priorpostdata_2'][:,indices]
response_priorpostdata_2=Full_Data['response_priorpostdata_2']

covariate_sampling_1=Full_Data['covariate_sampling_1'][:,indices]
response_sampling_1=Full_Data['response_sampling_1']
covariate_sampling_2=Full_Data['covariate_sampling_2'][:,indices]
response_sampling_2=Full_Data['response_sampling_2']

#
##########Linear############

Linearnet_multioutput_model_priorval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorval_1=predict_oneshot(Linearnet_multioutput_model_priorval_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorval_2=predict_oneshot(Linearnet_multioutput_model_priorval_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priordataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priordataval_1=predict_oneshot(Linearnet_multioutput_model_priordataval_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priordataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priordataval_2=predict_oneshot(Linearnet_multioutput_model_priordataval_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostval_1=predict_oneshot(Linearnet_multioutput_model_priorpostval_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostval_2=predict_oneshot(Linearnet_multioutput_model_priorpostval_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostdataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostdataval_1=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostdataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostdataval_2=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,3)


Linearnet_multioutput_model_samplingval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_samplingval_1=predict_oneshot(Linearnet_multioutput_model_samplingval_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,3)
#
Linearnet_multioutput_model_samplingval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_samplingval_2=predict_oneshot(Linearnet_multioutput_model_samplingval_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_dataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_dataval_1=predict_oneshot(Linearnet_multioutput_model_dataval_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,3)


Linearnet_multioutput_model_dataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_dataval_2=predict_oneshot(Linearnet_multioutput_model_dataval_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,3)




Linearnet_multioutput_model_priorns_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorns_1=predict_oneshot(Linearnet_multioutput_model_priorns_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorns_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorns_2=predict_oneshot(Linearnet_multioutput_model_priorns_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priordatans_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priordatans_1=predict_oneshot(Linearnet_multioutput_model_priordatans_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priordatans_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priordatans_2=predict_oneshot(Linearnet_multioutput_model_priordatans_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostns_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostns_1=predict_oneshot(Linearnet_multioutput_model_priorpostns_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostns_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostns_2=predict_oneshot(Linearnet_multioutput_model_priorpostns_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostdatans_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostdatans_1=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostdatans_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostdatans_2=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,2)


Linearnet_multioutput_model_samplingns_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_samplingns_1=predict_oneshot(Linearnet_multioutput_model_samplingns_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,2)
#
Linearnet_multioutput_model_samplingns_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_samplingns_2=predict_oneshot(Linearnet_multioutput_model_samplingns_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_datans_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_datans_1=predict_oneshot(Linearnet_multioutput_model_datans_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,2)


Linearnet_multioutput_model_datans_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_datans_2=predict_oneshot(Linearnet_multioutput_model_datans_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,2)



Linearnet_multioutput_model_prior_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_prior_1=predict_oneshot(Linearnet_multioutput_model_prior_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_prior_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_prior_2=predict_oneshot(Linearnet_multioutput_model_prior_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priordata_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priordata_1=predict_oneshot(Linearnet_multioutput_model_priordata_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priordata_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priordata_2=predict_oneshot(Linearnet_multioutput_model_priordata_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpost_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpost_1=predict_oneshot(Linearnet_multioutput_model_priorpost_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpost_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpost_2=predict_oneshot(Linearnet_multioutput_model_priorpost_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpostdata_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostdata_1=predict_oneshot(Linearnet_multioutput_model_priorpostdata_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpostdata_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_priorpostdata_2=predict_oneshot(Linearnet_multioutput_model_priorpostdata_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_data_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_data_1=predict_oneshot(Linearnet_multioutput_model_data_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_data_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_data_2=predict_oneshot(Linearnet_multioutput_model_data_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_sampling_1=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_sampling_1=predict_oneshot(Linearnet_multioutput_model_sampling_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_sampling_2=create_Linearnet_multioutput(input_shape,out_step)
TEWB_prediction_Linearnet_sampling_2=predict_oneshot(Linearnet_multioutput_model_sampling_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1)


# ############################

# ###########################################################################################
# ################################TEWBHW#########################################################
# ###########################################################################################


indices=np.concatenate((np.arange(16),np.arange(24,32)))

input_shape=(len(indices),)
#covariate_train_1=Full_Data['covariate_train_1'][:,indices]
#response_train_1=Full_Data['response_train_1']
Dcovariate_train_1=Full_Data['Dcovariate_train_1'][:,indices]
Dresponse_train_1=Full_Data['Dresponse_train_1']
covariate_test_1=Full_Data['covariate_test_1'][:,indices]
response_test_1=Full_Data['response_test_1']

#covariate_train_2=Full_Data['covariate_train_2'][:,indices]
#response_train_2=Full_Data['response_train_2']
Dcovariate_train_2=Full_Data['Dcovariate_train_2'][:,indices]
Dresponse_train_2=Full_Data['Dresponse_train_2']
covariate_test_2=Full_Data['covariate_test_2'][:,indices]
response_test_2=Full_Data['response_test_2']



time_1=Full_Data['time_1']
time_2=Full_Data['time_2']


#Scovariate_train_1=Full_Data['Scovariate_train_1'][:,indices]
#Scovariate_train_2=Full_Data['Scovariate_train_2'][:,indices]
#Sresponse_train_1=Full_Data['Sresponse_train_1']
#Sresponse_train_2=Full_Data['Sresponse_train_2']
covariate_prior_1=Full_Data['covariate_prior_1'][:,indices]
response_prior_1=Full_Data['response_prior_1']
covariate_prior_2=Full_Data['covariate_prior_2'][:,indices]
response_prior_2=Full_Data['response_prior_2']

covariate_priordata_1=Full_Data['covariate_priordata_1'][:,indices]
response_priordata_1=Full_Data['response_priordata_1']
covariate_priordata_2=Full_Data['covariate_priordata_2'][:,indices]
response_priordata_2=Full_Data['response_priordata_2']

covariate_priorpost_1=Full_Data['covariate_priorpost_1'][:,indices]
response_priorpost_1=Full_Data['response_priorpost_1']
covariate_priorpost_2=Full_Data['covariate_priorpost_2'][:,indices]
response_priorpost_2=Full_Data['response_priorpost_2']

covariate_priorpostdata_1=Full_Data['covariate_priorpostdata_1'][:,indices]
response_priorpostdata_1=Full_Data['response_priorpostdata_1']
covariate_priorpostdata_2=Full_Data['covariate_priorpostdata_2'][:,indices]
response_priorpostdata_2=Full_Data['response_priorpostdata_2']

covariate_sampling_1=Full_Data['covariate_sampling_1'][:,indices]
response_sampling_1=Full_Data['response_sampling_1']
covariate_sampling_2=Full_Data['covariate_sampling_2'][:,indices]
response_sampling_2=Full_Data['response_sampling_2']



#########Linear############
Linearnet_multioutput_model_priorval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorval_1=predict_oneshot(Linearnet_multioutput_model_priorval_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorval_2=predict_oneshot(Linearnet_multioutput_model_priorval_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priordataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priordataval_1=predict_oneshot(Linearnet_multioutput_model_priordataval_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priordataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priordataval_2=predict_oneshot(Linearnet_multioutput_model_priordataval_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostval_1=predict_oneshot(Linearnet_multioutput_model_priorpostval_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostval_2=predict_oneshot(Linearnet_multioutput_model_priorpostval_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_priorpostdataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostdataval_1=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,3)

Linearnet_multioutput_model_priorpostdataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostdataval_2=predict_oneshot(Linearnet_multioutput_model_priorpostdataval_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,3)


Linearnet_multioutput_model_samplingval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_samplingval_1=predict_oneshot(Linearnet_multioutput_model_samplingval_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,3)
#
Linearnet_multioutput_model_samplingval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_samplingval_2=predict_oneshot(Linearnet_multioutput_model_samplingval_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,3)

Linearnet_multioutput_model_dataval_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_dataval_1=predict_oneshot(Linearnet_multioutput_model_dataval_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,3)


Linearnet_multioutput_model_dataval_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_dataval_2=predict_oneshot(Linearnet_multioutput_model_dataval_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,3)



Linearnet_multioutput_model_priorns_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorns_1=predict_oneshot(Linearnet_multioutput_model_priorns_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorns_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorns_2=predict_oneshot(Linearnet_multioutput_model_priorns_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priordatans_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priordatans_1=predict_oneshot(Linearnet_multioutput_model_priordatans_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priordatans_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priordatans_2=predict_oneshot(Linearnet_multioutput_model_priordatans_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostns_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostns_1=predict_oneshot(Linearnet_multioutput_model_priorpostns_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostns_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostns_2=predict_oneshot(Linearnet_multioutput_model_priorpostns_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_priorpostdatans_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostdatans_1=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2,2)

Linearnet_multioutput_model_priorpostdatans_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostdatans_2=predict_oneshot(Linearnet_multioutput_model_priorpostdatans_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1,2)


Linearnet_multioutput_model_samplingns_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_samplingns_1=predict_oneshot(Linearnet_multioutput_model_samplingns_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2,2)
#
Linearnet_multioutput_model_samplingns_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_samplingns_2=predict_oneshot(Linearnet_multioutput_model_samplingns_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1,2)

Linearnet_multioutput_model_datans_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_datans_1=predict_oneshot(Linearnet_multioutput_model_datans_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2,2)


Linearnet_multioutput_model_datans_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_datans_2=predict_oneshot(Linearnet_multioutput_model_datans_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1,2)



Linearnet_multioutput_model_prior_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_prior_1=predict_oneshot(Linearnet_multioutput_model_prior_1,256,covariate_prior_1, response_prior_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_prior_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_prior_2=predict_oneshot(Linearnet_multioutput_model_prior_2,256,covariate_prior_2, response_prior_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priordata_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priordata_1=predict_oneshot(Linearnet_multioutput_model_priordata_1,256,covariate_priordata_1, response_priordata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priordata_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priordata_2=predict_oneshot(Linearnet_multioutput_model_priordata_2,256,covariate_priordata_2, response_priordata_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpost_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpost_1=predict_oneshot(Linearnet_multioutput_model_priorpost_1,256,covariate_priorpost_1, response_priorpost_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpost_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpost_2=predict_oneshot(Linearnet_multioutput_model_priorpost_2,256,covariate_priorpost_2, response_priorpost_2, covariate_test_2, covariate_test_1, response_test_1)

Linearnet_multioutput_model_priorpostdata_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostdata_1=predict_oneshot(Linearnet_multioutput_model_priorpostdata_1,256,covariate_priorpostdata_1, response_priorpostdata_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_priorpostdata_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_priorpostdata_2=predict_oneshot(Linearnet_multioutput_model_priorpostdata_2,256,covariate_priorpostdata_2, response_priorpostdata_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_data_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_data_1=predict_oneshot(Linearnet_multioutput_model_data_1, 256,Dcovariate_train_1, Dresponse_train_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_data_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_data_2=predict_oneshot(Linearnet_multioutput_model_data_2, 256,Dcovariate_train_2, Dresponse_train_2, covariate_test_2, covariate_test_1, response_test_1)


Linearnet_multioutput_model_sampling_1=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_sampling_1=predict_oneshot(Linearnet_multioutput_model_sampling_1,256,covariate_sampling_1, response_sampling_1, covariate_test_1, covariate_test_2, response_test_2)

Linearnet_multioutput_model_sampling_2=create_Linearnet_multioutput(input_shape,out_step)
TEWBHW_prediction_Linearnet_sampling_2=predict_oneshot(Linearnet_multioutput_model_sampling_2,256,covariate_sampling_2, response_sampling_2, covariate_test_2, covariate_test_1, response_test_1)
#####################################

# TE_pc_Linearnet_priorval=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorval_1,TE_prediction_Linearnet_priorval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priordataval=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priordataval_1,TE_prediction_Linearnet_priordataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priorpostval=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorpostval_1,TE_prediction_Linearnet_priorpostval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priorpostdataval=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorpostdataval_1,TE_prediction_Linearnet_priorpostdataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_samplingval=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_samplingval_1,TE_prediction_Linearnet_samplingval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_dataval=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_dataval_1,TE_prediction_Linearnet_dataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TE_pc_Linearnet_priorns=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorns_1,TE_prediction_Linearnet_priorns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priordatans=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priordatans_1,TE_prediction_Linearnet_priordatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priorpostns=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorpostns_1,TE_prediction_Linearnet_priorpostns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priorpostdatans=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorpostdatans_1,TE_prediction_Linearnet_priorpostdatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_samplingns=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_samplingns_1,TE_prediction_Linearnet_samplingns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_datans=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_datans_1,TE_prediction_Linearnet_datans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TE_pc_Linearnet_prior=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_prior_1,TE_prediction_Linearnet_prior_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priordata=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priordata_1,TE_prediction_Linearnet_priordata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priorpost=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorpost_1,TE_prediction_Linearnet_priorpost_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_priorpostdata=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_priorpostdata_1,TE_prediction_Linearnet_priorpostdata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_sampling=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_sampling_1,TE_prediction_Linearnet_sampling_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TE_pc_Linearnet_data=get_corr_matrix(np.concatenate((TE_prediction_Linearnet_data_1,TE_prediction_Linearnet_data_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEHW_pc_Linearnet_priorval=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorval_1,TEHW_prediction_Linearnet_priorval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priordataval=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priordataval_1,TEHW_prediction_Linearnet_priordataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priorpostval=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorpostval_1,TEHW_prediction_Linearnet_priorpostval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priorpostdataval=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorpostdataval_1,TEHW_prediction_Linearnet_priorpostdataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_samplingval=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_samplingval_1,TEHW_prediction_Linearnet_samplingval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_dataval=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_dataval_1,TEHW_prediction_Linearnet_dataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEHW_pc_Linearnet_priorns=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorns_1,TEHW_prediction_Linearnet_priorns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priordatans=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priordatans_1,TEHW_prediction_Linearnet_priordatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priorpostns=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorpostns_1,TEHW_prediction_Linearnet_priorpostns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priorpostdatans=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorpostdatans_1,TEHW_prediction_Linearnet_priorpostdatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_samplingns=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_samplingns_1,TEHW_prediction_Linearnet_samplingns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_datans=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_datans_1,TEHW_prediction_Linearnet_datans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEHW_pc_Linearnet_prior=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_prior_1,TEHW_prediction_Linearnet_prior_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priordata=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priordata_1,TEHW_prediction_Linearnet_priordata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priorpost=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorpost_1,TEHW_prediction_Linearnet_priorpost_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_priorpostdata=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_priorpostdata_1,TEHW_prediction_Linearnet_priorpostdata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_sampling=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_sampling_1,TEHW_prediction_Linearnet_sampling_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEHW_pc_Linearnet_data=get_corr_matrix(np.concatenate((TEHW_prediction_Linearnet_data_1,TEHW_prediction_Linearnet_data_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEWB_pc_Linearnet_priorval=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorval_1,TEWB_prediction_Linearnet_priorval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priordataval=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priordataval_1,TEWB_prediction_Linearnet_priordataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priorpostval=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorpostval_1,TEWB_prediction_Linearnet_priorpostval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priorpostdataval=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorpostdataval_1,TEWB_prediction_Linearnet_priorpostdataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_samplingval=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_samplingval_1,TEWB_prediction_Linearnet_samplingval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_dataval=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_dataval_1,TEWB_prediction_Linearnet_dataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEWB_pc_Linearnet_priorns=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorns_1,TEWB_prediction_Linearnet_priorns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priordatans=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priordatans_1,TEWB_prediction_Linearnet_priordatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priorpostns=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorpostns_1,TEWB_prediction_Linearnet_priorpostns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priorpostdatans=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorpostdatans_1,TEWB_prediction_Linearnet_priorpostdatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_samplingns=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_samplingns_1,TEWB_prediction_Linearnet_samplingns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_datans=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_datans_1,TEWB_prediction_Linearnet_datans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEWB_pc_Linearnet_prior=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_prior_1,TEWB_prediction_Linearnet_prior_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priordata=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priordata_1,TEWB_prediction_Linearnet_priordata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priorpost=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorpost_1,TEWB_prediction_Linearnet_priorpost_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_priorpostdata=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_priorpostdata_1,TEWB_prediction_Linearnet_priorpostdata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_sampling=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_sampling_1,TEWB_prediction_Linearnet_sampling_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWB_pc_Linearnet_data=get_corr_matrix(np.concatenate((TEWB_prediction_Linearnet_data_1,TEWB_prediction_Linearnet_data_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))



# TEWBHW_pc_Linearnet_priorval=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorval_1,TEWBHW_prediction_Linearnet_priorval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priordataval=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priordataval_1,TEWBHW_prediction_Linearnet_priordataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priorpostval=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorpostval_1,TEWBHW_prediction_Linearnet_priorpostval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priorpostdataval=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorpostdataval_1,TEWBHW_prediction_Linearnet_priorpostdataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_samplingval=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_samplingval_1,TEWBHW_prediction_Linearnet_samplingval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_dataval=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_dataval_1,TEWBHW_prediction_Linearnet_dataval_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEWBHW_pc_Linearnet_priorns=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorns_1,TEWBHW_prediction_Linearnet_priorns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priordatans=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priordatans_1,TEWBHW_prediction_Linearnet_priordatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priorpostns=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorpostns_1,TEWBHW_prediction_Linearnet_priorpostns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priorpostdatans=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorpostdatans_1,TEWBHW_prediction_Linearnet_priorpostdatans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_samplingns=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_samplingns_1,TEWBHW_prediction_Linearnet_samplingns_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_datans=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_datans_1,TEWBHW_prediction_Linearnet_datans_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))


# TEWBHW_pc_Linearnet_prior=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_prior_1,TEWBHW_prediction_Linearnet_prior_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priordata=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priordata_1,TEWBHW_prediction_Linearnet_priordata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priorpost=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorpost_1,TEWBHW_prediction_Linearnet_priorpost_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_priorpostdata=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_priorpostdata_1,TEWBHW_prediction_Linearnet_priorpostdata_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_sampling=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_sampling_1,TEWBHW_prediction_Linearnet_sampling_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))
# TEWBHW_pc_Linearnet_data=get_corr_matrix(np.concatenate((TEWBHW_prediction_Linearnet_data_1,TEWBHW_prediction_Linearnet_data_2),axis=0),np.concatenate((response_test_1,response_test_2),axis=0))



#os.chdir('Meetings/Feb_5_2021/')
# sio.savemat('pythonresults.mat',{'time_1':time_1,'time_2':time_2,'response_test_1':response_test_1,'response_test_2':response_test_2,
#                                    'TE_prediction_Linearnet_priorval_1':TE_prediction_Linearnet_priorval_1,'TE_prediction_Linearnet_priorval_2':TE_prediction_Linearnet_priorval_2,             
#                                    'TE_prediction_Linearnet_priordataval_1':TE_prediction_Linearnet_priordataval_1,'TE_prediction_Linearnet_priordataval_2':TE_prediction_Linearnet_priordataval_2,
#                                    'TE_prediction_Linearnet_priorpostval_1':TE_prediction_Linearnet_priorpostval_1,'TE_prediction_Linearnet_priorpostval_2':TE_prediction_Linearnet_priorpostval_2,
#                                    'TE_prediction_Linearnet_priorpostdataval_1':TE_prediction_Linearnet_priorpostdataval_1,'TE_prediction_Linearnet_priorpostdataval_2':TE_prediction_Linearnet_priorpostdataval_2,
#                                    'TE_prediction_Linearnet_dataval_1':TE_prediction_Linearnet_dataval_1,'TE_prediction_Linearnet_dataval_2':TE_prediction_Linearnet_dataval_2,
#                                    'TE_prediction_Linearnet_samplingval_1':TE_prediction_Linearnet_samplingval_1,'TE_prediction_Linearnet_samplingval_2':TE_prediction_Linearnet_samplingval_2,
#                                    # 'TE_pc_Linearnet_priorval':TE_pc_Linearnet_priorval,
#                                    # 'TE_pc_Linearnet_priordataval':TE_pc_Linearnet_priordataval,
#                                    # 'TE_pc_Linearnet_priorpostval':TE_pc_Linearnet_priorpostval,
#                                    # 'TE_pc_Linearnet_priorpostdataval':TE_pc_Linearnet_priorpostdataval,
#                                    # 'TE_pc_Linearnet_samplingval':TE_pc_Linearnet_samplingval,
#                                    # 'TE_pc_Linearnet_dataval':TE_pc_Linearnet_dataval,

#                                    'TE_prediction_Linearnet_priorns_1':TE_prediction_Linearnet_priorns_1,'TE_prediction_Linearnet_priorns_2':TE_prediction_Linearnet_priorns_2,             
#                                    'TE_prediction_Linearnet_priordatans_1':TE_prediction_Linearnet_priordatans_1,'TE_prediction_Linearnet_priordatans_2':TE_prediction_Linearnet_priordatans_2,
#                                    'TE_prediction_Linearnet_priorpostns_1':TE_prediction_Linearnet_priorpostns_1,'TE_prediction_Linearnet_priorpostns_2':TE_prediction_Linearnet_priorpostns_2,
#                                    'TE_prediction_Linearnet_priorpostdatans_1':TE_prediction_Linearnet_priorpostdatans_1,'TE_prediction_Linearnet_priorpostdatans_2':TE_prediction_Linearnet_priorpostdatans_2,
#                                    'TE_prediction_Linearnet_datans_1':TE_prediction_Linearnet_datans_1,'TE_prediction_Linearnet_datans_2':TE_prediction_Linearnet_datans_2,
#                                    'TE_prediction_Linearnet_samplingns_1':TE_prediction_Linearnet_samplingns_1,'TE_prediction_Linearnet_samplingns_2':TE_prediction_Linearnet_samplingns_2,
#                                    # 'TE_pc_Linearnet_priorns':TE_pc_Linearnet_priorns,
#                                    # 'TE_pc_Linearnet_priordatans':TE_pc_Linearnet_priordatans,
#                                    # 'TE_pc_Linearnet_priorpostns':TE_pc_Linearnet_priorpostns,
#                                    # 'TE_pc_Linearnet_priorpostdatans':TE_pc_Linearnet_priorpostdatans,
#                                    # 'TE_pc_Linearnet_samplingns':TE_pc_Linearnet_samplingns,
#                                    # 'TE_pc_Linearnet_datans':TE_pc_Linearnet_datans,

#                                    'TE_prediction_Linearnet_prior_1':TE_prediction_Linearnet_prior_1,'TE_prediction_Linearnet_prior_2':TE_prediction_Linearnet_prior_2,
#                                    'TE_prediction_Linearnet_priordata_1':TE_prediction_Linearnet_priordata_1,'TE_prediction_Linearnet_priordata_2':TE_prediction_Linearnet_priordata_2,
#                                    'TE_prediction_Linearnet_priorpost_1':TE_prediction_Linearnet_priorpost_1,'TE_prediction_Linearnet_priorpost_2':TE_prediction_Linearnet_priorpost_2,
#                                    'TE_prediction_Linearnet_priorpostdata_1':TE_prediction_Linearnet_priorpostdata_1,'TE_prediction_Linearnet_priorpostdata_2':TE_prediction_Linearnet_priorpostdata_2,
#                                    'TE_prediction_Linearnet_data_1':TE_prediction_Linearnet_data_1,'TE_prediction_Linearnet_data_2':TE_prediction_Linearnet_data_2, 
#                                    'TE_prediction_Linearnet_sampling_1':TE_prediction_Linearnet_sampling_1,'TE_prediction_Linearnet_sampling_2':TE_prediction_Linearnet_sampling_2,
#                                    # 'TE_pc_Linearnet_prior':TE_pc_Linearnet_prior,
#                                    # 'TE_pc_Linearnet_priordata':TE_pc_Linearnet_priordata,
#                                    # 'TE_pc_Linearnet_priorpost':TE_pc_Linearnet_priorpost,
#                                    # 'TE_pc_Linearnet_priorpostdata':TE_pc_Linearnet_priorpostdata,
#                                    # 'TE_pc_Linearnet_sampling':TE_pc_Linearnet_sampling,
#                                    # 'TE_pc_Linearnet_data':TE_pc_Linearnet_data,
                                    
#                                    'TEHW_prediction_Linearnet_priorval_1':TEHW_prediction_Linearnet_priorval_1,'TEHW_prediction_Linearnet_priorval_2':TEHW_prediction_Linearnet_priorval_2,             
#                                    'TEHW_prediction_Linearnet_priordataval_1':TEHW_prediction_Linearnet_priordataval_1,'TEHW_prediction_Linearnet_priordataval_2':TEHW_prediction_Linearnet_priordataval_2,
#                                    'TEHW_prediction_Linearnet_priorpostval_1':TEHW_prediction_Linearnet_priorpostval_1,'TEHW_prediction_Linearnet_priorpostval_2':TEHW_prediction_Linearnet_priorpostval_2,
#                                    'TEHW_prediction_Linearnet_priorpostdataval_1':TEHW_prediction_Linearnet_priorpostdataval_1,'TEHW_prediction_Linearnet_priorpostdataval_2':TEHW_prediction_Linearnet_priorpostdataval_2,
#                                    'TEHW_prediction_Linearnet_dataval_1':TEHW_prediction_Linearnet_dataval_1,'TEHW_prediction_Linearnet_dataval_2':TEHW_prediction_Linearnet_dataval_2,
#                                    'TEHW_prediction_Linearnet_samplingval_1':TEHW_prediction_Linearnet_samplingval_1,'TEHW_prediction_Linearnet_samplingval_2':TEHW_prediction_Linearnet_samplingval_2,
#                                    # 'TEHW_pc_Linearnet_priorval':TEHW_pc_Linearnet_priorval,
#                                    # 'TEHW_pc_Linearnet_priordataval':TEHW_pc_Linearnet_priordataval,
#                                    # 'TEHW_pc_Linearnet_priorpostval':TEHW_pc_Linearnet_priorpostval,
#                                    # 'TEHW_pc_Linearnet_priorpostdataval':TEHW_pc_Linearnet_priorpostdataval,
#                                    # 'TEHW_pc_Linearnet_samplingval':TEHW_pc_Linearnet_samplingval,
#                                    # 'TEHW_pc_Linearnet_dataval':TEHW_pc_Linearnet_dataval,

#                                    'TEHW_prediction_Linearnet_priorns_1':TEHW_prediction_Linearnet_priorns_1,'TEHW_prediction_Linearnet_priorns_2':TEHW_prediction_Linearnet_priorns_2,             
#                                    'TEHW_prediction_Linearnet_priordatans_1':TEHW_prediction_Linearnet_priordatans_1,'TEHW_prediction_Linearnet_priordatans_2':TEHW_prediction_Linearnet_priordatans_2,
#                                    'TEHW_prediction_Linearnet_priorpostns_1':TEHW_prediction_Linearnet_priorpostns_1,'TEHW_prediction_Linearnet_priorpostns_2':TEHW_prediction_Linearnet_priorpostns_2,
#                                    'TEHW_prediction_Linearnet_priorpostdatans_1':TEHW_prediction_Linearnet_priorpostdatans_1,'TEHW_prediction_Linearnet_priorpostdatans_2':TEHW_prediction_Linearnet_priorpostdatans_2,
#                                    'TEHW_prediction_Linearnet_datans_1':TEHW_prediction_Linearnet_datans_1,'TEHW_prediction_Linearnet_datans_2':TEHW_prediction_Linearnet_datans_2,
#                                    'TEHW_prediction_Linearnet_samplingns_1':TEHW_prediction_Linearnet_samplingns_1,'TEHW_prediction_Linearnet_samplingns_2':TEHW_prediction_Linearnet_samplingns_2,
#                                    # 'TEHW_pc_Linearnet_priorns':TEHW_pc_Linearnet_priorns,
#                                    # 'TEHW_pc_Linearnet_priordatans':TEHW_pc_Linearnet_priordatans,
#                                    # 'TEHW_pc_Linearnet_priorpostns':TEHW_pc_Linearnet_priorpostns,
#                                    # 'TEHW_pc_Linearnet_priorpostdatans':TEHW_pc_Linearnet_priorpostdatans,
#                                    # 'TEHW_pc_Linearnet_samplingns':TEHW_pc_Linearnet_samplingns,
#                                    # 'TEHW_pc_Linearnet_datans':TEHW_pc_Linearnet_datans,

#                                    'TEHW_prediction_Linearnet_prior_1':TEHW_prediction_Linearnet_prior_1,'TEHW_prediction_Linearnet_prior_2':TEHW_prediction_Linearnet_prior_2,
#                                    'TEHW_prediction_Linearnet_priordata_1':TEHW_prediction_Linearnet_priordata_1,'TEHW_prediction_Linearnet_priordata_2':TEHW_prediction_Linearnet_priordata_2,
#                                    'TEHW_prediction_Linearnet_priorpost_1':TEHW_prediction_Linearnet_priorpost_1,'TEHW_prediction_Linearnet_priorpost_2':TEHW_prediction_Linearnet_priorpost_2,
#                                    'TEHW_prediction_Linearnet_priorpostdata_1':TEHW_prediction_Linearnet_priorpostdata_1,'TEHW_prediction_Linearnet_priorpostdata_2':TEHW_prediction_Linearnet_priorpostdata_2,
#                                    'TEHW_prediction_Linearnet_data_1':TEHW_prediction_Linearnet_data_1,'TEHW_prediction_Linearnet_data_2':TEHW_prediction_Linearnet_data_2, 
#                                    'TEHW_prediction_Linearnet_sampling_1':TEHW_prediction_Linearnet_sampling_1,'TEHW_prediction_Linearnet_sampling_2':TEHW_prediction_Linearnet_sampling_2,
#                                    # 'TEHW_pc_Linearnet_prior':TEHW_pc_Linearnet_prior,
#                                    # 'TEHW_pc_Linearnet_priordata':TEHW_pc_Linearnet_priordata,
#                                    # 'TEHW_pc_Linearnet_priorpost':TEHW_pc_Linearnet_priorpost,
#                                    # 'TEHW_pc_Linearnet_priorpostdata':TEHW_pc_Linearnet_priorpostdata,
#                                    # 'TEHW_pc_Linearnet_sampling':TEHW_pc_Linearnet_sampling,
#                                    # 'TEHW_pc_Linearnet_data':TEHW_pc_Linearnet_data,
                                                            
#                                    'TEWB_prediction_Linearnet_priorval_1':TEWB_prediction_Linearnet_priorval_1,'TEWB_prediction_Linearnet_priorval_2':TEWB_prediction_Linearnet_priorval_2,             
#                                    'TEWB_prediction_Linearnet_priordataval_1':TEWB_prediction_Linearnet_priordataval_1,'TEWB_prediction_Linearnet_priordataval_2':TEWB_prediction_Linearnet_priordataval_2,
#                                    'TEWB_prediction_Linearnet_priorpostval_1':TEWB_prediction_Linearnet_priorpostval_1,'TEWB_prediction_Linearnet_priorpostval_2':TEWB_prediction_Linearnet_priorpostval_2,
#                                    'TEWB_prediction_Linearnet_priorpostdataval_1':TEWB_prediction_Linearnet_priorpostdataval_1,'TEWB_prediction_Linearnet_priorpostdataval_2':TEWB_prediction_Linearnet_priorpostdataval_2,
#                                    'TEWB_prediction_Linearnet_dataval_1':TEWB_prediction_Linearnet_dataval_1,'TEWB_prediction_Linearnet_dataval_2':TEWB_prediction_Linearnet_dataval_2,
#                                    'TEWB_prediction_Linearnet_samplingval_1':TEWB_prediction_Linearnet_samplingval_1,'TEWB_prediction_Linearnet_samplingval_2':TEWB_prediction_Linearnet_samplingval_2,
#                                    # 'TEWB_pc_Linearnet_priorval':TEWB_pc_Linearnet_priorval,
#                                    # 'TEWB_pc_Linearnet_priordataval':TEWB_pc_Linearnet_priordataval,
#                                    # 'TEWB_pc_Linearnet_priorpostval':TEWB_pc_Linearnet_priorpostval,
#                                    # 'TEWB_pc_Linearnet_priorpostdataval':TEWB_pc_Linearnet_priorpostdataval,
#                                    # 'TEWB_pc_Linearnet_samplingval':TEWB_pc_Linearnet_samplingval,
#                                    # 'TEWB_pc_Linearnet_dataval':TEWB_pc_Linearnet_dataval,

#                                    'TEWB_prediction_Linearnet_priorns_1':TEWB_prediction_Linearnet_priorns_1,'TEWB_prediction_Linearnet_priorns_2':TEWB_prediction_Linearnet_priorns_2,             
#                                    'TEWB_prediction_Linearnet_priordatans_1':TEWB_prediction_Linearnet_priordatans_1,'TEWB_prediction_Linearnet_priordatans_2':TEWB_prediction_Linearnet_priordatans_2,
#                                    'TEWB_prediction_Linearnet_priorpostns_1':TEWB_prediction_Linearnet_priorpostns_1,'TEWB_prediction_Linearnet_priorpostns_2':TEWB_prediction_Linearnet_priorpostns_2,
#                                    'TEWB_prediction_Linearnet_priorpostdatans_1':TEWB_prediction_Linearnet_priorpostdatans_1,'TEWB_prediction_Linearnet_priorpostdatans_2':TEWB_prediction_Linearnet_priorpostdatans_2,
#                                    'TEWB_prediction_Linearnet_datans_1':TEWB_prediction_Linearnet_datans_1,'TEWB_prediction_Linearnet_datans_2':TEWB_prediction_Linearnet_datans_2,
#                                    'TEWB_prediction_Linearnet_samplingns_1':TEWB_prediction_Linearnet_samplingns_1,'TEWB_prediction_Linearnet_samplingns_2':TEWB_prediction_Linearnet_samplingns_2,
#                                    # 'TEWB_pc_Linearnet_priorns':TEWB_pc_Linearnet_priorns,
#                                    # 'TEWB_pc_Linearnet_priordatans':TEWB_pc_Linearnet_priordatans,
#                                    # 'TEWB_pc_Linearnet_priorpostns':TEWB_pc_Linearnet_priorpostns,
#                                    # 'TEWB_pc_Linearnet_priorpostdatans':TEWB_pc_Linearnet_priorpostdatans,
#                                    # 'TEWB_pc_Linearnet_samplingns':TEWB_pc_Linearnet_samplingns,
#                                    # 'TEWB_pc_Linearnet_datans':TEWB_pc_Linearnet_datans,

#                                    'TEWB_prediction_Linearnet_prior_1':TEWB_prediction_Linearnet_prior_1,'TEWB_prediction_Linearnet_prior_2':TEWB_prediction_Linearnet_prior_2,
#                                    'TEWB_prediction_Linearnet_priordata_1':TEWB_prediction_Linearnet_priordata_1,'TEWB_prediction_Linearnet_priordata_2':TEWB_prediction_Linearnet_priordata_2,
#                                    'TEWB_prediction_Linearnet_priorpost_1':TEWB_prediction_Linearnet_priorpost_1,'TEWB_prediction_Linearnet_priorpost_2':TEWB_prediction_Linearnet_priorpost_2,
#                                    'TEWB_prediction_Linearnet_priorpostdata_1':TEWB_prediction_Linearnet_priorpostdata_1,'TEWB_prediction_Linearnet_priorpostdata_2':TEWB_prediction_Linearnet_priorpostdata_2,
#                                    'TEWB_prediction_Linearnet_data_1':TEWB_prediction_Linearnet_data_1,'TEWB_prediction_Linearnet_data_2':TEWB_prediction_Linearnet_data_2, 
#                                    'TEWB_prediction_Linearnet_sampling_1':TEWB_prediction_Linearnet_sampling_1,'TEWB_prediction_Linearnet_sampling_2':TEWB_prediction_Linearnet_sampling_2,
#                                    # 'TEWB_pc_Linearnet_prior':TEWB_pc_Linearnet_prior,
#                                    # 'TEWB_pc_Linearnet_priordata':TEWB_pc_Linearnet_priordata,
#                                    # 'TEWB_pc_Linearnet_priorpost':TEWB_pc_Linearnet_priorpost,
#                                    # 'TEWB_pc_Linearnet_priorpostdata':TEWB_pc_Linearnet_priorpostdata,
#                                    # 'TEWB_pc_Linearnet_sampling':TEWB_pc_Linearnet_sampling,
#                                    # 'TEWB_pc_Linearnet_data':TEWB_pc_Linearnet_data,
                                   
#                                    'TEWBHW_prediction_Linearnet_priorval_1':TEWBHW_prediction_Linearnet_priorval_1,'TEWBHW_prediction_Linearnet_priorval_2':TEWBHW_prediction_Linearnet_priorval_2,             
#                                    'TEWBHW_prediction_Linearnet_priordataval_1':TEWBHW_prediction_Linearnet_priordataval_1,'TEWBHW_prediction_Linearnet_priordataval_2':TEWBHW_prediction_Linearnet_priordataval_2,
#                                    'TEWBHW_prediction_Linearnet_priorpostval_1':TEWBHW_prediction_Linearnet_priorpostval_1,'TEWBHW_prediction_Linearnet_priorpostval_2':TEWBHW_prediction_Linearnet_priorpostval_2,
#                                    'TEWBHW_prediction_Linearnet_priorpostdataval_1':TEWBHW_prediction_Linearnet_priorpostdataval_1,'TEWBHW_prediction_Linearnet_priorpostdataval_2':TEWBHW_prediction_Linearnet_priorpostdataval_2,
#                                    'TEWBHW_prediction_Linearnet_dataval_1':TEWBHW_prediction_Linearnet_dataval_1,'TEWBHW_prediction_Linearnet_dataval_2':TEWBHW_prediction_Linearnet_dataval_2,
#                                    'TEWBHW_prediction_Linearnet_samplingval_1':TEWBHW_prediction_Linearnet_samplingval_1,'TEWBHW_prediction_Linearnet_samplingval_2':TEWBHW_prediction_Linearnet_samplingval_2,
#                                    # 'TEWBHW_pc_Linearnet_priorval':TEWBHW_pc_Linearnet_priorval,
#                                    # 'TEWBHW_pc_Linearnet_priordataval':TEWBHW_pc_Linearnet_priordataval,
#                                    # 'TEWBHW_pc_Linearnet_priorpostval':TEWBHW_pc_Linearnet_priorpostval,
#                                    # 'TEWBHW_pc_Linearnet_priorpostdataval':TEWBHW_pc_Linearnet_priorpostdataval,
#                                    # 'TEWBHW_pc_Linearnet_samplingval':TEWBHW_pc_Linearnet_samplingval,
#                                    # 'TEWBHW_pc_Linearnet_dataval':TEWBHW_pc_Linearnet_dataval,

#                                    'TEWBHW_prediction_Linearnet_priorns_1':TEWBHW_prediction_Linearnet_priorns_1,'TEWBHW_prediction_Linearnet_priorns_2':TEWBHW_prediction_Linearnet_priorns_2,             
#                                    'TEWBHW_prediction_Linearnet_priordatans_1':TEWBHW_prediction_Linearnet_priordatans_1,'TEWBHW_prediction_Linearnet_priordatans_2':TEWBHW_prediction_Linearnet_priordatans_2,
#                                    'TEWBHW_prediction_Linearnet_priorpostns_1':TEWBHW_prediction_Linearnet_priorpostns_1,'TEWBHW_prediction_Linearnet_priorpostns_2':TEWBHW_prediction_Linearnet_priorpostns_2,
#                                    'TEWBHW_prediction_Linearnet_priorpostdatans_1':TEWBHW_prediction_Linearnet_priorpostdatans_1,'TEWBHW_prediction_Linearnet_priorpostdatans_2':TEWBHW_prediction_Linearnet_priorpostdatans_2,
#                                    'TEWBHW_prediction_Linearnet_datans_1':TEWBHW_prediction_Linearnet_datans_1,'TEWBHW_prediction_Linearnet_datans_2':TEWBHW_prediction_Linearnet_datans_2,
#                                    'TEWBHW_prediction_Linearnet_samplingns_1':TEWBHW_prediction_Linearnet_samplingns_1,'TEWBHW_prediction_Linearnet_samplingns_2':TEWBHW_prediction_Linearnet_samplingns_2,
#                                    # 'TEWBHW_pc_Linearnet_priorns':TEWBHW_pc_Linearnet_priorns,
#                                    # 'TEWBHW_pc_Linearnet_priordatans':TEWBHW_pc_Linearnet_priordatans,
#                                    # 'TEWBHW_pc_Linearnet_priorpostns':TEWBHW_pc_Linearnet_priorpostns,
#                                    # 'TEWBHW_pc_Linearnet_priorpostdatans':TEWBHW_pc_Linearnet_priorpostdatans,
#                                    # 'TEWBHW_pc_Linearnet_samplingns':TEWBHW_pc_Linearnet_samplingns,
#                                    # 'TEWBHW_pc_Linearnet_datans':TEWBHW_pc_Linearnet_datans,

#                                    'TEWBHW_prediction_Linearnet_prior_1':TEWBHW_prediction_Linearnet_prior_1,'TEWBHW_prediction_Linearnet_prior_2':TEWBHW_prediction_Linearnet_prior_2,
#                                    'TEWBHW_prediction_Linearnet_priordata_1':TEWBHW_prediction_Linearnet_priordata_1,'TEWBHW_prediction_Linearnet_priordata_2':TEWBHW_prediction_Linearnet_priordata_2,
#                                    'TEWBHW_prediction_Linearnet_priorpost_1':TEWBHW_prediction_Linearnet_priorpost_1,'TEWBHW_prediction_Linearnet_priorpost_2':TEWBHW_prediction_Linearnet_priorpost_2,
#                                    'TEWBHW_prediction_Linearnet_priorpostdata_1':TEWBHW_prediction_Linearnet_priorpostdata_1,'TEWBHW_prediction_Linearnet_priorpostdata_2':TEWBHW_prediction_Linearnet_priorpostdata_2,
#                                    'TEWBHW_prediction_Linearnet_data_1':TEWBHW_prediction_Linearnet_data_1,'TEWBHW_prediction_Linearnet_data_2':TEWBHW_prediction_Linearnet_data_2, 
#                                    'TEWBHW_prediction_Linearnet_sampling_1':TEWBHW_prediction_Linearnet_sampling_1,'TEWBHW_prediction_Linearnet_sampling_2':TEWBHW_prediction_Linearnet_sampling_2
#                                    # 'TEWBHW_pc_Linearnet_prior':TEWBHW_pc_Linearnet_prior,
#                                    # 'TEWBHW_pc_Linearnet_priordata':TEWBHW_pc_Linearnet_priordata,
#                                    # 'TEWBHW_pc_Linearnet_priorpost':TEWBHW_pc_Linearnet_priorpost,
#                                    # 'TEWBHW_pc_Linearnet_priorpostdata':TEWBHW_pc_Linearnet_priorpostdata,
#                                    # 'TEWBHW_pc_Linearnet_sampling':TEWBHW_pc_Linearnet_sampling,
#                                    # 'TEWBHW_pc_Linearnet_data':TEWBHW_pc_Linearnet_data})




sio.savemat('pythonresults.mat',{'time_1':time_1,'time_2':time_2,'response_test_1':response_test_1,'response_test_2':response_test_2,
                                   'TE_prediction_Linearnet_priorval_1':TE_prediction_Linearnet_priorval_1,'TE_prediction_Linearnet_priorval_2':TE_prediction_Linearnet_priorval_2,             
                                   'TE_prediction_Linearnet_priordataval_1':TE_prediction_Linearnet_priordataval_1,'TE_prediction_Linearnet_priordataval_2':TE_prediction_Linearnet_priordataval_2,
                                   'TE_prediction_Linearnet_priorpostval_1':TE_prediction_Linearnet_priorpostval_1,'TE_prediction_Linearnet_priorpostval_2':TE_prediction_Linearnet_priorpostval_2,
                                   'TE_prediction_Linearnet_priorpostdataval_1':TE_prediction_Linearnet_priorpostdataval_1,'TE_prediction_Linearnet_priorpostdataval_2':TE_prediction_Linearnet_priorpostdataval_2,
                                   'TE_prediction_Linearnet_dataval_1':TE_prediction_Linearnet_dataval_1,'TE_prediction_Linearnet_dataval_2':TE_prediction_Linearnet_dataval_2,
                                   'TE_prediction_Linearnet_samplingval_1':TE_prediction_Linearnet_samplingval_1,'TE_prediction_Linearnet_samplingval_2':TE_prediction_Linearnet_samplingval_2,
                                   

                                   'TE_prediction_Linearnet_priorns_1':TE_prediction_Linearnet_priorns_1,'TE_prediction_Linearnet_priorns_2':TE_prediction_Linearnet_priorns_2,             
                                   'TE_prediction_Linearnet_priordatans_1':TE_prediction_Linearnet_priordatans_1,'TE_prediction_Linearnet_priordatans_2':TE_prediction_Linearnet_priordatans_2,
                                   'TE_prediction_Linearnet_priorpostns_1':TE_prediction_Linearnet_priorpostns_1,'TE_prediction_Linearnet_priorpostns_2':TE_prediction_Linearnet_priorpostns_2,
                                   'TE_prediction_Linearnet_priorpostdatans_1':TE_prediction_Linearnet_priorpostdatans_1,'TE_prediction_Linearnet_priorpostdatans_2':TE_prediction_Linearnet_priorpostdatans_2,
                                   'TE_prediction_Linearnet_datans_1':TE_prediction_Linearnet_datans_1,'TE_prediction_Linearnet_datans_2':TE_prediction_Linearnet_datans_2,
                                   'TE_prediction_Linearnet_samplingns_1':TE_prediction_Linearnet_samplingns_1,'TE_prediction_Linearnet_samplingns_2':TE_prediction_Linearnet_samplingns_2,
                                   
                                   'TE_prediction_Linearnet_prior_1':TE_prediction_Linearnet_prior_1,'TE_prediction_Linearnet_prior_2':TE_prediction_Linearnet_prior_2,
                                   'TE_prediction_Linearnet_priordata_1':TE_prediction_Linearnet_priordata_1,'TE_prediction_Linearnet_priordata_2':TE_prediction_Linearnet_priordata_2,
                                   'TE_prediction_Linearnet_priorpost_1':TE_prediction_Linearnet_priorpost_1,'TE_prediction_Linearnet_priorpost_2':TE_prediction_Linearnet_priorpost_2,
                                   'TE_prediction_Linearnet_priorpostdata_1':TE_prediction_Linearnet_priorpostdata_1,'TE_prediction_Linearnet_priorpostdata_2':TE_prediction_Linearnet_priorpostdata_2,
                                   'TE_prediction_Linearnet_data_1':TE_prediction_Linearnet_data_1,'TE_prediction_Linearnet_data_2':TE_prediction_Linearnet_data_2, 
                                   'TE_prediction_Linearnet_sampling_1':TE_prediction_Linearnet_sampling_1,'TE_prediction_Linearnet_sampling_2':TE_prediction_Linearnet_sampling_2,
                                  
                                    
                                   'TEHW_prediction_Linearnet_priorval_1':TEHW_prediction_Linearnet_priorval_1,'TEHW_prediction_Linearnet_priorval_2':TEHW_prediction_Linearnet_priorval_2,             
                                   'TEHW_prediction_Linearnet_priordataval_1':TEHW_prediction_Linearnet_priordataval_1,'TEHW_prediction_Linearnet_priordataval_2':TEHW_prediction_Linearnet_priordataval_2,
                                   'TEHW_prediction_Linearnet_priorpostval_1':TEHW_prediction_Linearnet_priorpostval_1,'TEHW_prediction_Linearnet_priorpostval_2':TEHW_prediction_Linearnet_priorpostval_2,
                                   'TEHW_prediction_Linearnet_priorpostdataval_1':TEHW_prediction_Linearnet_priorpostdataval_1,'TEHW_prediction_Linearnet_priorpostdataval_2':TEHW_prediction_Linearnet_priorpostdataval_2,
                                   'TEHW_prediction_Linearnet_dataval_1':TEHW_prediction_Linearnet_dataval_1,'TEHW_prediction_Linearnet_dataval_2':TEHW_prediction_Linearnet_dataval_2,
                                   'TEHW_prediction_Linearnet_samplingval_1':TEHW_prediction_Linearnet_samplingval_1,'TEHW_prediction_Linearnet_samplingval_2':TEHW_prediction_Linearnet_samplingval_2,
                                   

                                   'TEHW_prediction_Linearnet_priorns_1':TEHW_prediction_Linearnet_priorns_1,'TEHW_prediction_Linearnet_priorns_2':TEHW_prediction_Linearnet_priorns_2,             
                                   'TEHW_prediction_Linearnet_priordatans_1':TEHW_prediction_Linearnet_priordatans_1,'TEHW_prediction_Linearnet_priordatans_2':TEHW_prediction_Linearnet_priordatans_2,
                                   'TEHW_prediction_Linearnet_priorpostns_1':TEHW_prediction_Linearnet_priorpostns_1,'TEHW_prediction_Linearnet_priorpostns_2':TEHW_prediction_Linearnet_priorpostns_2,
                                   'TEHW_prediction_Linearnet_priorpostdatans_1':TEHW_prediction_Linearnet_priorpostdatans_1,'TEHW_prediction_Linearnet_priorpostdatans_2':TEHW_prediction_Linearnet_priorpostdatans_2,
                                   'TEHW_prediction_Linearnet_datans_1':TEHW_prediction_Linearnet_datans_1,'TEHW_prediction_Linearnet_datans_2':TEHW_prediction_Linearnet_datans_2,
                                   'TEHW_prediction_Linearnet_samplingns_1':TEHW_prediction_Linearnet_samplingns_1,'TEHW_prediction_Linearnet_samplingns_2':TEHW_prediction_Linearnet_samplingns_2,
                              

                                   'TEHW_prediction_Linearnet_prior_1':TEHW_prediction_Linearnet_prior_1,'TEHW_prediction_Linearnet_prior_2':TEHW_prediction_Linearnet_prior_2,
                                   'TEHW_prediction_Linearnet_priordata_1':TEHW_prediction_Linearnet_priordata_1,'TEHW_prediction_Linearnet_priordata_2':TEHW_prediction_Linearnet_priordata_2,
                                   'TEHW_prediction_Linearnet_priorpost_1':TEHW_prediction_Linearnet_priorpost_1,'TEHW_prediction_Linearnet_priorpost_2':TEHW_prediction_Linearnet_priorpost_2,
                                   'TEHW_prediction_Linearnet_priorpostdata_1':TEHW_prediction_Linearnet_priorpostdata_1,'TEHW_prediction_Linearnet_priorpostdata_2':TEHW_prediction_Linearnet_priorpostdata_2,
                                   'TEHW_prediction_Linearnet_data_1':TEHW_prediction_Linearnet_data_1,'TEHW_prediction_Linearnet_data_2':TEHW_prediction_Linearnet_data_2, 
                                   'TEHW_prediction_Linearnet_sampling_1':TEHW_prediction_Linearnet_sampling_1,'TEHW_prediction_Linearnet_sampling_2':TEHW_prediction_Linearnet_sampling_2,
                                  
                                                            
                                   'TEWB_prediction_Linearnet_priorval_1':TEWB_prediction_Linearnet_priorval_1,'TEWB_prediction_Linearnet_priorval_2':TEWB_prediction_Linearnet_priorval_2,             
                                   'TEWB_prediction_Linearnet_priordataval_1':TEWB_prediction_Linearnet_priordataval_1,'TEWB_prediction_Linearnet_priordataval_2':TEWB_prediction_Linearnet_priordataval_2,
                                   'TEWB_prediction_Linearnet_priorpostval_1':TEWB_prediction_Linearnet_priorpostval_1,'TEWB_prediction_Linearnet_priorpostval_2':TEWB_prediction_Linearnet_priorpostval_2,
                                   'TEWB_prediction_Linearnet_priorpostdataval_1':TEWB_prediction_Linearnet_priorpostdataval_1,'TEWB_prediction_Linearnet_priorpostdataval_2':TEWB_prediction_Linearnet_priorpostdataval_2,
                                   'TEWB_prediction_Linearnet_dataval_1':TEWB_prediction_Linearnet_dataval_1,'TEWB_prediction_Linearnet_dataval_2':TEWB_prediction_Linearnet_dataval_2,
                                   'TEWB_prediction_Linearnet_samplingval_1':TEWB_prediction_Linearnet_samplingval_1,'TEWB_prediction_Linearnet_samplingval_2':TEWB_prediction_Linearnet_samplingval_2,
                                   

                                   'TEWB_prediction_Linearnet_priorns_1':TEWB_prediction_Linearnet_priorns_1,'TEWB_prediction_Linearnet_priorns_2':TEWB_prediction_Linearnet_priorns_2,             
                                   'TEWB_prediction_Linearnet_priordatans_1':TEWB_prediction_Linearnet_priordatans_1,'TEWB_prediction_Linearnet_priordatans_2':TEWB_prediction_Linearnet_priordatans_2,
                                   'TEWB_prediction_Linearnet_priorpostns_1':TEWB_prediction_Linearnet_priorpostns_1,'TEWB_prediction_Linearnet_priorpostns_2':TEWB_prediction_Linearnet_priorpostns_2,
                                   'TEWB_prediction_Linearnet_priorpostdatans_1':TEWB_prediction_Linearnet_priorpostdatans_1,'TEWB_prediction_Linearnet_priorpostdatans_2':TEWB_prediction_Linearnet_priorpostdatans_2,
                                   'TEWB_prediction_Linearnet_datans_1':TEWB_prediction_Linearnet_datans_1,'TEWB_prediction_Linearnet_datans_2':TEWB_prediction_Linearnet_datans_2,
                                   'TEWB_prediction_Linearnet_samplingns_1':TEWB_prediction_Linearnet_samplingns_1,'TEWB_prediction_Linearnet_samplingns_2':TEWB_prediction_Linearnet_samplingns_2,
                     

                                   'TEWB_prediction_Linearnet_prior_1':TEWB_prediction_Linearnet_prior_1,'TEWB_prediction_Linearnet_prior_2':TEWB_prediction_Linearnet_prior_2,
                                   'TEWB_prediction_Linearnet_priordata_1':TEWB_prediction_Linearnet_priordata_1,'TEWB_prediction_Linearnet_priordata_2':TEWB_prediction_Linearnet_priordata_2,
                                   'TEWB_prediction_Linearnet_priorpost_1':TEWB_prediction_Linearnet_priorpost_1,'TEWB_prediction_Linearnet_priorpost_2':TEWB_prediction_Linearnet_priorpost_2,
                                   'TEWB_prediction_Linearnet_priorpostdata_1':TEWB_prediction_Linearnet_priorpostdata_1,'TEWB_prediction_Linearnet_priorpostdata_2':TEWB_prediction_Linearnet_priorpostdata_2,
                                   'TEWB_prediction_Linearnet_data_1':TEWB_prediction_Linearnet_data_1,'TEWB_prediction_Linearnet_data_2':TEWB_prediction_Linearnet_data_2, 
                                   'TEWB_prediction_Linearnet_sampling_1':TEWB_prediction_Linearnet_sampling_1,'TEWB_prediction_Linearnet_sampling_2':TEWB_prediction_Linearnet_sampling_2,
                                
                                   
                                   'TEWBHW_prediction_Linearnet_priorval_1':TEWBHW_prediction_Linearnet_priorval_1,'TEWBHW_prediction_Linearnet_priorval_2':TEWBHW_prediction_Linearnet_priorval_2,             
                                   'TEWBHW_prediction_Linearnet_priordataval_1':TEWBHW_prediction_Linearnet_priordataval_1,'TEWBHW_prediction_Linearnet_priordataval_2':TEWBHW_prediction_Linearnet_priordataval_2,
                                   'TEWBHW_prediction_Linearnet_priorpostval_1':TEWBHW_prediction_Linearnet_priorpostval_1,'TEWBHW_prediction_Linearnet_priorpostval_2':TEWBHW_prediction_Linearnet_priorpostval_2,
                                   'TEWBHW_prediction_Linearnet_priorpostdataval_1':TEWBHW_prediction_Linearnet_priorpostdataval_1,'TEWBHW_prediction_Linearnet_priorpostdataval_2':TEWBHW_prediction_Linearnet_priorpostdataval_2,
                                   'TEWBHW_prediction_Linearnet_dataval_1':TEWBHW_prediction_Linearnet_dataval_1,'TEWBHW_prediction_Linearnet_dataval_2':TEWBHW_prediction_Linearnet_dataval_2,
                                   'TEWBHW_prediction_Linearnet_samplingval_1':TEWBHW_prediction_Linearnet_samplingval_1,'TEWBHW_prediction_Linearnet_samplingval_2':TEWBHW_prediction_Linearnet_samplingval_2,
                          

                                   'TEWBHW_prediction_Linearnet_priorns_1':TEWBHW_prediction_Linearnet_priorns_1,'TEWBHW_prediction_Linearnet_priorns_2':TEWBHW_prediction_Linearnet_priorns_2,             
                                   'TEWBHW_prediction_Linearnet_priordatans_1':TEWBHW_prediction_Linearnet_priordatans_1,'TEWBHW_prediction_Linearnet_priordatans_2':TEWBHW_prediction_Linearnet_priordatans_2,
                                   'TEWBHW_prediction_Linearnet_priorpostns_1':TEWBHW_prediction_Linearnet_priorpostns_1,'TEWBHW_prediction_Linearnet_priorpostns_2':TEWBHW_prediction_Linearnet_priorpostns_2,
                                   'TEWBHW_prediction_Linearnet_priorpostdatans_1':TEWBHW_prediction_Linearnet_priorpostdatans_1,'TEWBHW_prediction_Linearnet_priorpostdatans_2':TEWBHW_prediction_Linearnet_priorpostdatans_2,
                                   'TEWBHW_prediction_Linearnet_datans_1':TEWBHW_prediction_Linearnet_datans_1,'TEWBHW_prediction_Linearnet_datans_2':TEWBHW_prediction_Linearnet_datans_2,
                                   'TEWBHW_prediction_Linearnet_samplingns_1':TEWBHW_prediction_Linearnet_samplingns_1,'TEWBHW_prediction_Linearnet_samplingns_2':TEWBHW_prediction_Linearnet_samplingns_2,
                              
                                   'TEWBHW_prediction_Linearnet_prior_1':TEWBHW_prediction_Linearnet_prior_1,'TEWBHW_prediction_Linearnet_prior_2':TEWBHW_prediction_Linearnet_prior_2,
                                   'TEWBHW_prediction_Linearnet_priordata_1':TEWBHW_prediction_Linearnet_priordata_1,'TEWBHW_prediction_Linearnet_priordata_2':TEWBHW_prediction_Linearnet_priordata_2,
                                   'TEWBHW_prediction_Linearnet_priorpost_1':TEWBHW_prediction_Linearnet_priorpost_1,'TEWBHW_prediction_Linearnet_priorpost_2':TEWBHW_prediction_Linearnet_priorpost_2,
                                   'TEWBHW_prediction_Linearnet_priorpostdata_1':TEWBHW_prediction_Linearnet_priorpostdata_1,'TEWBHW_prediction_Linearnet_priorpostdata_2':TEWBHW_prediction_Linearnet_priorpostdata_2,
                                   'TEWBHW_prediction_Linearnet_data_1':TEWBHW_prediction_Linearnet_data_1,'TEWBHW_prediction_Linearnet_data_2':TEWBHW_prediction_Linearnet_data_2, 
                                   'TEWBHW_prediction_Linearnet_sampling_1':TEWBHW_prediction_Linearnet_sampling_1,'TEWBHW_prediction_Linearnet_sampling_2':TEWBHW_prediction_Linearnet_sampling_2)

