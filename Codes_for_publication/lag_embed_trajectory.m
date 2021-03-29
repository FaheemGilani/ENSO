function Embed=lag_embed_trajectory(trajectory,dim)
Embed=zeros(length(trajectory)-dim+1,dim);

for i=1:size(Embed,1)
    Embed(i,:)=trajectory(i:i+dim-1);
end
