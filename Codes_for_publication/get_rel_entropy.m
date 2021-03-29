function rel_entropy=get_rel_entropy(truth,prediction)

rel_entropy=zeros(1,size(truth,2));
for i=1:length(rel_entropy)
    temp1=truth(:,i)';
    temp2=prediction(:,i)';
    
    [pdf_truth, xx_1] = ksdensity(temp1,linspace(-3.5,3.5,200));
    pdf_truth(pdf_truth<=1e-5) = 1e-5;
    pdf_truth = pdf_truth/trapz(xx_1,pdf_truth);
    [pdf_pred, xx_1] = ksdensity(temp2,xx_1);
    pdf_pred(pdf_pred<=1e-5) = 1e-5;
    pdf_pred = pdf_pred/trapz(xx_1,pdf_pred);
    
    rel_entropy(i)=1-exp(-1*trapz(xx_1, pdf_truth .* log(pdf_truth./pdf_pred))); 
end
