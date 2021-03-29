function [covariate,response,time_response]=embed_multi(X,max_lead,lag,dim,numavg,responsedim,normalizeflag)
%%%%%%%%%%X should be of the form X(i).data where data is no_traj x no_obs


numavg=numavg(dim);
lag=lag(dim);
X=X(dim);


max_lag=max(lag);
maxavg=max(numavg);



temp=repmat(struct('lagged',[]),1,length(dim));





for j=1:length(dim)
        [temptraj,~]=embed_matrix(X(j).data,max_lag*maxavg,max_lag*maxavg+1,max_lead*maxavg);
        temp(j).lagged=temptraj;
end

covariate=[];

for j=1:length(dim)
    templagged=temp(j).lagged(:,flip(end:-1*numavg(j):1));
    covariate=[covariate,templagged(:,end-lag(j)+1:end)];
    
end
covariate=covariate(1:numavg(1):end,:);

if length(X(1).time)>0
[~,time_response]=embed_matrix(X(1).time,max_lag*maxavg,max_lag*maxavg+1,max_lead*maxavg);
time_response=time_response(1:numavg(1):end,1:numavg(1):end);
else
    time_response=0;
end

response=[];
for i=1:length(responsedim)
[~,response_temp]=embed_matrix(X(i).data,max_lag*maxavg,max_lag*maxavg+1,max_lead*maxavg);
response=cat(3,response,response_temp);
end


response=response(1:numavg(1):end,1:numavg(1):end,:);




