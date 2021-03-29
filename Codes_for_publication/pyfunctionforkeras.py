from datetime import datetime,timedelta
import pandas as pd
import numpy as np


from tensorflow.keras.models import Model
from tensorflow.keras.layers import Dense,LSTM,Flatten,Input,BatchNormalization,GRU,Reshape
from tensorflow.keras.layers import Conv1D,MaxPooling1D,AveragePooling1D,Conv2D,MaxPooling2D
from tensorflow.keras.layers import Dropout,GaussianNoise
from tensorflow.keras.callbacks import EarlyStopping


import tensorflow as tf
import tensorflow.keras.backend as K




def get_corr(a,b):
    corr=np.corrcoef(a.reshape(1,-1),b.reshape(1,-1))
    return corr[0,1]

    
def get_corr_matrix(predicted,truth):
    pc=np.zeros((truth.shape[1]))
    for i in range(len(pc)):
        corr=np.corrcoef(predicted[:,i].reshape(1,-1),truth[:,i].reshape(1,-1))
        pc[i]=corr[0,1]
    
    return pc



################################################################
#########################Neural Nets#############################
################################################################


def predict_oneshot(net,batch_size,covariate_train,response_train,covariate_test,covariate_validate,response_validate,flag=1):
    if flag==1:
        callback = EarlyStopping(monitor='val_loss', patience=20,mode='min',restore_best_weights=True)
        net.compile(optimizer='adam',loss='mse')
        net.fit(covariate_train,response_train,epochs=1500,batch_size=batch_size,validation_data=(covariate_validate,response_validate),callbacks=[callback])
        prediction=net.predict(covariate_test)
    elif flag==2:
        net.compile(optimizer='adam',loss='mse')
        net.fit(covariate_train,response_train,epochs=500,batch_size=batch_size)
        prediction=net.predict(covariate_test)
    else:
        callback = EarlyStopping(monitor='val_loss', patience=50,mode='min',restore_best_weights=True)
        net.compile(optimizer='adam',loss='mse')
        net.fit(covariate_train,response_train,epochs=400,batch_size=batch_size,validation_split=.2,callbacks=[callback])
        net.fit(covariate_train,response_train,epochs=400,batch_size=batch_size,validation_split=.2,callbacks=[callback])
        prediction=net.predict(covariate_test)     
    return prediction

def create_Linearnet_multioutput(shape,out_step):
    visible=Input(shape=shape)
    NN=Dense(32,activation='tanh')(visible)
    NN=Dense(32,activation='tanh')(NN)
    NN=Dense(128)(NN)
    NN=Dense(out_step)(NN)
    model=Model(inputs=visible,outputs=NN)  
    return model
    

def create_LSTM_multi(shape,out_step):
    visible=Input(shape=shape)
    NN=LSTM(128,return_sequences=False)(visible)
    NN=Dense(out_step*shape[1],kernel_initializer=tf.initializers.zeros)(NN)
    NN=Reshape((out_step,shape[1]))(NN)
    model=Model(inputs=visible,outputs=NN)    
    return model

def create_Convnet_multi(shape,out_step):
    conv_width=4
    visible=Input(shape=shape)
    NN=tf.keras.layers.Lambda(lambda x: x[:, -conv_width:, :])(visible)
    NN=Conv1D(256,activation='relu',kernel_size=(conv_width))(NN)
    NN=Dense(out_step*shape[1],kernel_initializer=tf.initializers.zeros)(NN)
    NN=Reshape((out_step,shape[1]))(NN)
    model=Model(inputs=visible,outputs=NN)    
    return model

def create_Linearnet_multi(shape,out_step):
    visible=Input(shape=shape)
    NN=tf.keras.layers.Lambda(lambda x: x[:, -1:, :])(visible)
    NN=Dense(200)(NN)
    NN=Dense(200)(NN)
    NN=Dense(out_step*shape[1],kernel_initializer=tf.initializers.zeros)(NN)
    NN=Reshape((out_step,shape[1]))(NN)
    model=Model(inputs=visible,outputs=NN)    
    return model

def create_Tanh_multi(shape,out_step):
    visible=Input(shape=shape)
    NN=tf.keras.layers.Lambda(lambda x: x[:, -1:, :])(visible)
    NN=Dense(200,activation='tanh')(NN)
    NN=Dense(200,activation='tanh')(NN)
    NN=Dense(out_step*shape[1],kernel_initializer=tf.initializers.zeros)(NN)
    NN=Reshape((out_step,shape[1]))(NN)
    model=Model(inputs=visible,outputs=NN)    
    return model


def create_Mixed_multi(shape,out_step):
    conv_width=3
    visible=Input(shape=shape)
    NN=tf.keras.layers.Lambda(lambda x: x[:, -conv_width:, :])(visible)
    NN=Conv1D(256,activation='relu',kernel_size=(conv_width))(NN)
    NN=LSTM(64,return_sequences=False)(NN)
    NN=Dense(out_step*shape[1],kernel_initializer=tf.initializers.zeros)(NN)
    NN=Reshape((out_step,shape[1]))(NN)
    model=Model(inputs=visible,outputs=NN)    
    return model

    
def create_LSTM(shape):
    visible=Input(shape=shape)
    NN=GRU(32,return_sequences=True)(visible)
    NN=Dropout(.1)(NN)
    NN=GRU(32,return_sequences=True)(NN)
    NN=Dropout(.1)(NN)
    NN=GRU(32,return_sequences=False)(NN)
    NN=Dense(1)(NN)
    model=Model(inputs=visible,outputs=NN)
    return model      
    
    
def create_Convnet(shape):
    visible=Input(shape=shape)
    NN=Conv1D(filters=40,kernel_size=5,activation='tanh',strides=2,padding='same')(visible)
    NN=Conv1D(filters=40,kernel_size=3,activation='tanh',strides=1,padding='same')(NN)
    # NN=MaxPooling1D(2)(NN)
    NN=Conv1D(filters=40,kernel_size=3,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=3,activation='tanh',strides=1,padding='same')(NN)
    # NN=MaxPooling1D(2)(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Flatten()(NN)
    NN=Dense(40,activation='tanh')(NN)
    NN=Dropout(.1)(NN)
    NN=Dense(40)(NN)
    NN=Dense(1)(NN)
    model=Model(inputs=visible,outputs=NN)
    return model    

def create_Linearnet(shape):
    visible=Input(shape=shape)
    NN=Dense(80)(visible)
    NN=Dense(80)(NN)
    NN=Dense(1)(NN)
    model=Model(inputs=visible,outputs=NN)
    return model

def create_Tanhnet(shape):
    visible=Input(shape=shape)
    NN=Dense(40,activation='tanh')(visible)
    NN=Dense(40,activation='tanh')(NN)
    NN=Dense(1)(NN)
    model=Model(inputs=visible,outputs=NN)
    return model



def create_Convlstm(shape):
    visible=Input(shape=shape)
    NN=Conv1D(filters=40,kernel_size=5,activation='tanh',strides=2,padding='same')(visible)
    NN=Conv1D(filters=40,kernel_size=5,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=Conv1D(filters=40,kernel_size=2,activation='tanh',strides=1,padding='same')(NN)
    NN=GRU(64,return_sequences=False)(NN)
    NN=Flatten()(NN)
    NN=Dense(40,activation='tanh')(NN)
    NN=Dense(40)(NN)
    NN=Dense(1)(NN)
    model=Model(inputs=visible,outputs=NN)
    return model    

    
    
    
    