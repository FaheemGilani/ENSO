function [u1_save,u2_save,tau_save,u1_reference,tt_reference,RMSE_ENSO_3D,Corr_ENSO_3D,RelEntropy_ENSO_3D]=model_3d(d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale)
load ENSO_Reference
gap = 7; % prediction every 'gap' days
PredLength = 50; % the maximum lead in prediction is PredLength*gap

% 
u1_reference = T_E(1:gap:end);
u2_reference = H_W(1:gap:end)/14;
tau_reference = Total_WB(1:gap:end);
tt_reference = ttt(1:gap:end);
Length=length(u1_reference);

% % replace the above if you want to predict 1982-1999
% u1_reference = T_E(1:gap:6570);
% u2_reference = H_W(1:gap:6570)/14;
% tau_reference = Total_WB(1:gap:6570);
% tt_reference = ttt(1:gap:6570);

% % replace the above if you want to predict 2000-2020
% u1_reference = T_E(6571:gap:end);
% u2_reference = H_W(6571:gap:end)/14;
% tau_reference = Total_WB(6571:gap:end);
% tt_reference = ttt(6571:gap:end);
% Length = length(u1_reference);


EnsNum = 50; % Total numbers of the ensemble members in forecasts
% Assume the initial values are perfect
u1_pred20 = ones(EnsNum,1) * u1_reference;
u2_pred20 = ones(EnsNum,1) * u2_reference; 
tau_pred20 = ones(EnsNum,1) * tau_reference; %filter_tau(1:gap:6570);%
% Save the prediction results
u1_save = zeros(PredLength,Length);
u2_save = zeros(PredLength,Length);
tau_save = zeros(PredLength,Length);
% Prediction; since we choose a 10 times smaller time step, 10 time steps
% here means one day


%%%Each row of _save is gap lead time.
k = 1;


dt = 1/365;
for j = 1:PredLength*gap   
    sigma_tau =  sigma_tau_scale*(1.5 *3 * (tanh(u1_pred20) + 1 ) + 4);
    u1_pred2 = u1_pred20 + (- d_u * u1_pred20 - omega_u * u2_pred20 + alpha_1 * tau_pred20) * dt + sigma_u * sqrt(dt) * randn(EnsNum,Length);
    u2_pred2 = u2_pred20 + (- d_u * u2_pred20 + omega_u * u1_pred20 + alpha_2 * tau_pred20) * dt + sigma_u * sqrt(dt) * randn(EnsNum,Length);
    tau_pred2 = tau_pred20 + (- d_tau * tau_pred20) * dt + sigma_tau .* sqrt(dt) .* randn(EnsNum,Length);
%%%integrate forward dt, save as previous variables.
     
    u1_pred20 = u1_pred2;
    u2_pred20 = u2_pred2;
    tau_pred20 = tau_pred2;
 %%%Once integratin is a multiple of gap, take mean as prediction.
    if mod(j,gap) == 0
        u1_save(k,:) = mean(u1_pred2);
        u2_save(k,:) = mean(u2_pred2);
        tau_save(k,:) = mean(tau_pred2);
        k = k + 1;
    end
    

end

RMSE_ENSO_3D = zeros(1,PredLength);
Corr_ENSO_3D = zeros(1,PredLength);
RelEntropy_ENSO_3D = zeros(1,PredLength);
[pdf_truth, xx_1] = ksdensity(u1_reference,linspace(-3.5,3.5,200)); % compute the true PDF
pdf_truth(pdf_truth<=1e-5) = 1e-5; % Note: we set every small values in the PDF to be 1e-5 for the convenience of computing the relative entropy
pdf_truth = pdf_truth/trapz(xx_1,pdf_truth);
for k = 1:PredLength
    Corr_temp = corrcoef(u1_reference(1+k:end),u1_save(k,1:end-k));
    Corr_ENSO_3D(k) = Corr_temp(1,2);
    RMSE_ENSO_3D(k) = sqrt(sum((u1_reference(1+k:end) - u1_save(k,1:end-k)).^2)/(Length-k));
    [pdf_pred, xx_1] = ksdensity(u1_save(k,1:end-k),xx_1);
    pdf_pred(pdf_pred<=1e-5) = 1e-5;
    pdf_pred = pdf_pred/trapz(xx_1,pdf_pred);
    RelEntropy_ENSO_3D(k) = trapz(xx_1, pdf_truth .* log(pdf_truth./pdf_pred));    
end


end
