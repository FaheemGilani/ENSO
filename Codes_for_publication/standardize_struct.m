function [struct,nmean,nstd]=standardize_struct(target_struct,reference_struct)

for i=1:numel(target_struct)
    target_struct(i).data=(target_struct(i).data-reference_struct(1).mean)./reference_struct(1).std;
end

% for i=1:numel(target_struct)
%     target_struct(i).data=(target_struct(i).data-target_struct(i).mean)./target_struct(i).std;
% end


struct=target_struct;
nmean=reference_struct(1).mean;
nstd=reference_struct(1).std;
% nmean=0;
% nstd=0;