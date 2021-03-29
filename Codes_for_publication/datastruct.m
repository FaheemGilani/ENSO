function Sampling=datastruct(navg,data,time,Y,intlength,smoothmethod,smoothwindow,WBflag,TEflag,burn,burn2)
% if time(1)<1990
%     T_E=data(1,1:navg:split);
%     H_W=data(2,1:navg:split);
%     WB=data(3,1:navg:split);
% else
%     T_E=data(1,split+1:navg:end);
%     H_W=data(2,split+1:navg:end);
%     WB=data(3,split+1:navg:end);
% end
start=find(Y==time(1));
last=find(Y==time(end));

    T_E=data(1,start:1:last);
    H_W=data(2,start:1:last);
    WB=data(3,start:1:last);

Sampling=repmat(struct('data',[],'name',[],'mean',[],'std',[],'time',[]),1,6);

if WBflag==1
    if smoothwindow==0
        WB=smoothdata(WB,smoothmethod);
    else
        WB=smoothdata(WB,smoothmethod,smoothwindow);
    end
end

if TEflag==1
T_E=smoothdata(T_E,smoothmethod,smoothwindow);
end

T_E=T_E(burn:navg:end-burn2);
H_W=H_W(burn:navg:end-burn2);
WB=WB(burn:navg:end-burn2);
time=time(burn:navg:end-burn2);

    
Sampling(1).mean=mean(T_E(intlength+1:end),2);
Sampling(1).std=std(T_E(intlength+1:end),0,2);
Sampling(1).data=T_E(intlength+1:end);
Sampling(1).name=['TE', num2str(floor(time(1)))];
Sampling(1).time=time(intlength+1:end);

Sampling(2).mean=mean(H_W(intlength+1:end),2);
Sampling(2).std=std(H_W(intlength+1:end),0,2);
Sampling(2).data=H_W(intlength+1:end);
Sampling(2).name=['HW',num2str(floor(time(1)))];
Sampling(2).time=time(intlength+1:end);


Sampling(3).mean=mean(WB(intlength+1:end),2);
Sampling(3).std=std(WB(intlength+1:end),0,2);
Sampling(3).data=WB(intlength+1:end);
Sampling(3).name=['WB',num2str(floor(time(1)))];
Sampling(3).time=time(intlength+1:end);



Sampling(4).name=['WB Derivative',num2str(floor(time(1)))];

temp=diff(T_E)./diff(time);
Sampling(4).mean=mean(temp(intlength:end),2);
Sampling(4).std=std(temp(intlength:end),0,2);
Sampling(4).data=temp(intlength:end);
Sampling(4).time=time(intlength+1:end);

temp=zeros(1,length(WB));

for i=1:length(WB)
    temp(:,i)=trapz(WB(1:i));
end

Sampling(5).mean=mean(temp(intlength+1:end),2);
Sampling(5).std=std(temp(intlength+1:end),0,2);
Sampling(5).data=temp(intlength+1:end);
Sampling(5).name=['WB Integral',num2str(floor(time(1)))];
Sampling(5).time=time(intlength+1:end);


temp=.5*(sign(WB)+1).*WB;
Sampling(6).mean=mean(temp(intlength+1:end),2);
Sampling(6).std=std(temp(intlength+1:end),0,2);
Sampling(6).data=temp(intlength+1:end);
Sampling(6).name=['WB sign' ,num2str(floor(time(1)))];
Sampling(6).time=time(intlength+1:end);

