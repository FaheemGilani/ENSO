function [covariate,response]=embed_matrix(X,lag,data_lag,max_lead)

X=X(:,data_lag-lag:end);
Data=[];

for i=1:size(X,1)
    Data=[Data;lag_embed_trajectory(X(i,:),lag+max_lead)];
end

covariate=Data(:,1:end-max_lead+1);
response=Data(:,end-max_lead+1:end);
