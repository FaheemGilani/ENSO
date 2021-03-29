function pc=get_corr(X,Y)

pc=zeros(1,size(X,2));

for i=1:length(pc)
    pc(i)=corr(X(:,i),Y(:,i));
end
