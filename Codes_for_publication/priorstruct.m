function Sampling=priorstruct(navg,data)


T_E=data(1,:);
H_W=data(2,:);
WB=data(3,:);

Sampling=repmat(struct('data',[],'name',[],'mean',[],'std',[],'time',[]),1,4);

    
Sampling(1).mean=mean(T_E);
Sampling(1).std=std(T_E);
Sampling(1).data=T_E(2:end);
Sampling(1).name=['TE'];

Sampling(2).mean=mean(H_W);
Sampling(2).std=std(H_W);
Sampling(2).data=H_W(2:end);
Sampling(2).name=['HW'];


Sampling(3).mean=mean(WB);
Sampling(3).std=std(WB);
Sampling(3).data=WB(2:end);
Sampling(3).name=['WB'];



Sampling(4).name=['TE Derivative'];

temp=diff(T_E)/0.00273972887976015;
Sampling(4).mean=mean(temp);
Sampling(4).std=std(temp);
Sampling(4).data=temp;


