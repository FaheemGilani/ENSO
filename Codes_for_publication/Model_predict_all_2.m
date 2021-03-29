% clear all
% close all
load ENSO_Reference
rng(1)
gap = 1; % prediction every 'gap' days
PredLength = 10*13929; % the maximum lead in prediction is PredLength*gap

% 
u1_reference = T_E(1:gap:end);
u2_reference = H_W(1:gap:end)/14;
tau_reference = Total_WB(1:gap:end);
tt_reference = ttt(1:gap:end);
% Length=length(u1_reference);
Length=1;

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


EnsNum = 1; % Total numbers of the ensemble members in forecasts
% Assume the initial values are perfect
u1_pred20 = ones(EnsNum,1) * u1_reference(1);
u2_pred20 = ones(EnsNum,1) * u2_reference(1); 
tau_pred20 = ones(EnsNum,1) * tau_reference(1); %filter_tau(1:gap:6570);%
% Save the prediction results
u1_save = zeros(PredLength,Length);
u2_save = zeros(PredLength,Length);
tau_save = zeros(PredLength,Length);
% Prediction; since we choose a 10 times smaller time step, 10 time steps
% here means one day


%%%Each row of _save is gap lead time.
k = 1;
load parameters.mat
% d_u = 1.5;
% d_tau = 2*2;
% omega_u = -1.5;
% sigma_u = 0.8;0.15; % determined by quadratic variation
% alpha_1 = 1;0.6;
% alpha_2 = (-0.4);-0.3;
% sigma_tau_scale=1


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

%%%%%%
u1_pred20 = ones(EnsNum,1) * u1_reference(1);
u2_pred20 = ones(EnsNum,1) * u2_reference(1); 
tau_pred20 = ones(EnsNum,1) * tau_reference(1); 

u1_save2 = zeros(PredLength,Length);
u2_save2 = zeros(PredLength,Length);
tau_save2 = zeros(PredLength,Length);
k = 1;
for j = 1:PredLength*gap
    sigma_tau =  sigma_tau_scale*(1.5 *3 * (tanh(u1_pred20) + 1 ) + 4);
    u1_pred2 = u1_pred20 + (- d_u * u1_pred20 - omega_u * u2_pred20 ) * dt + sigma_u * sqrt(dt) * randn(EnsNum,Length);
    u2_pred2 = u2_pred20 + (- d_u * u2_pred20 + omega_u * u1_pred20 ) * dt + sigma_u * sqrt(dt) * randn(EnsNum,Length);

     
    u1_pred20 = u1_pred2;
    u2_pred20 = u2_pred2;

    if mod(j,gap) == 0
        u1_save2(k,:) = mean(u1_pred2);
        u2_save2(k,:) = mean(u2_pred2);
        k = k + 1;
    end
    

end
%%%%%%
u1_pred20 = ones(EnsNum,1) * u1_reference(1);
u2_pred20 = ones(EnsNum,1) * u2_reference(1); 
tau_pred20 = ones(EnsNum,1) * tau_reference(1); 

u1_save3 = zeros(PredLength,Length);
u2_save3 = zeros(PredLength,Length);
tau_save3 = zeros(PredLength,Length);
k = 1;
for j = 1:PredLength*gap

    u1_pred2 = u1_pred20;
    u2_pred2 = u2_pred20;

     
    u1_pred20 = u1_pred2;
    u2_pred20 = u2_pred2;

    if mod(j,gap) == 0
        u1_save3(k,:) = mean(u1_pred2);
        u2_save3(k,:) = mean(u2_pred2);
        k = k + 1;
    end
    

end
%%%%%%
% load LSTM_Pred_Before2000
% 
% figure
% for i = 1:3
%     subplot(3,1,i)
%     if i == 1
%         k = 6;   
%     elseif i == 2
%         k = 24;
%     else
%         k = 36; 
%     end
%     hold on
%     plot(tt_reference, u1_reference,'b','linewidth',2)
%     plot(tt_reference(1+k:end), u1_save(k,1:end-k),'r');
%     plot(tt_reference(1+k:end), u1_save2(k,1:end-k),'y');
%     plot(tt_reference(1+k:end), u1_save3(k,1:end-k),'g');
%     box on
%     set(gca,'fontsize',12)
%     if i == 1
%         legend('Truth','Prediction 3D','Prediction 2D','Persistence')
%     end
%     title(['Prediction of T_E at lead time ', num2str(k*gap/30), ' months']);
%     xlim([tt_reference(1),tt_reference(end)])
% end



% u1_reference=transpose(StatisticalNormaliz(u1_reference'));
% 
% u1_save=transpose(StatisticalNormaliz(u1_save'));
% u1_save2=transpose(StatisticalNormaliz(u1_save2'));
% u1_save3=transpose(StatisticalNormaliz(u1_save3'));
% Compute the RMSE, pattern correlation and the relative entropy between
% the PDFs associated with the true signal and the forecast signal
%%%%%%
% RMSE_ENSO_3D = zeros(1,PredLength);
% Corr_ENSO_3D = zeros(1,PredLength);
% RelEntropy_ENSO_3D = zeros(1,PredLength);
% [pdf_truth, xx_1] = ksdensity(u1_reference,linspace(-3.5,3.5,200)); % compute the true PDF
% pdf_truth(pdf_truth<=1e-5) = 1e-5; % Note: we set every small values in the PDF to be 1e-5 for the convenience of computing the relative entropy
% pdf_truth = pdf_truth/trapz(xx_1,pdf_truth);
% for k = 1:PredLength
%     Corr_temp = corrcoef(u1_reference(1+k:end),u1_save(k,1:end-k));
%     Corr_ENSO_3D(k) = Corr_temp(1,2);
%     RMSE_ENSO_3D(k) = sqrt(sum((u1_reference(1+k:end) - u1_save(k,1:end-k)).^2)/(Length-k));
%     [pdf_pred, xx_1] = ksdensity(u1_save(k,1:end-k),xx_1);
%     pdf_pred(pdf_pred<=1e-5) = 1e-5;
%     pdf_pred = pdf_pred/trapz(xx_1,pdf_pred);
%     RelEntropy_ENSO_3D(k) = trapz(xx_1, pdf_truth .* log(pdf_truth./pdf_pred));    
% end
% 
% 
% 
% 
% %%%%%%
% RMSE_ENSO_2D = zeros(1,PredLength);
% Corr_ENSO_2D = zeros(1,PredLength);
% RelEntropy_ENSO_2D = zeros(1,PredLength);
% [pdf_truth, xx_1] = ksdensity(u1_reference,linspace(-3.5,3.5,200)); % compute the true PDF
% pdf_truth(pdf_truth<=1e-5) = 1e-5; % Note: we set every small values in the PDF to be 1e-5 for the convenience of computing the relative entropy
% pdf_truth = pdf_truth/trapz(xx_1,pdf_truth);
% for k = 1:PredLength
%     Corr_temp = corrcoef(u1_reference(1+k:end),u1_save2(k,1:end-k));
%     Corr_ENSO_2D(k) = Corr_temp(1,2);
%     RMSE_ENSO_2D(k) = sqrt(sum((u1_reference(1+k:end) - u1_save2(k,1:end-k)).^2)/(Length-k));
%     [pdf_pred, xx_1] = ksdensity(u1_save2(k,1:end-k),xx_1);
%     pdf_pred(pdf_pred<=1e-5) = 1e-5;
%     pdf_pred = pdf_pred/trapz(xx_1,pdf_pred);
%     RelEntropy_ENSO_2D(k) = trapz(xx_1, pdf_truth .* log(pdf_truth./pdf_pred));    
% end
% %%%%%%
% RMSE_ENSO_1D = zeros(1,PredLength);
% Corr_ENSO_1D = zeros(1,PredLength);
% RelEntropy_ENSO_1D = zeros(1,PredLength);
% [pdf_truth, xx_1] = ksdensity(u1_reference,linspace(-3.5,3.5,200)); % compute the true PDF
% pdf_truth(pdf_truth<=1e-5) = 1e-5; % Note: we set every small values in the PDF to be 1e-5 for the convenience of computing the relative entropy
% pdf_truth = pdf_truth/trapz(xx_1,pdf_truth);
% for k = 1:PredLength
%     Corr_temp = corrcoef(u1_reference(1+k:end),u1_save3(k,1:end-k));
%     Corr_ENSO_1D(k) = Corr_temp(1,2);
%     RMSE_ENSO_1D(k) = sqrt(sum((u1_reference(1+k:end) - u1_save3(k,1:end-k)).^2)/(Length-k));
%     [pdf_pred, xx_1] = ksdensity(u1_save3(k,1:end-k),xx_1);
%     pdf_pred(pdf_pred<=1e-5) = 1e-5;
%     pdf_pred = pdf_pred/trapz(xx_1,pdf_pred);
%     RelEntropy_ENSO_1D(k) = trapz(xx_1, pdf_truth .* log(pdf_truth./pdf_pred));    
% end


save('perturbed_model_and_persistence.mat','tt_reference','u1_reference','u1_save','u1_save2','u1_save3')

% keyboard
% 
% %%%%%%
% std_u1_ref = std(u1_reference); % standard deviation of the true signal, as a reference to the RMSE
% figure
% subplot(1,3,1)
% hold on
% plot([1:PredLength], Corr_ENSO_3D, 'r', 'linewidth',1)
% plot([1:PredLength], Corr_ENSO_2D, 'y', 'linewidth',1)
% plot([1:PredLength], Corr_ENSO_1D, 'g', 'linewidth',1)
% plot([1,PredLength], [0.5,0.5],'b--','linewidth',1)
% box on
% set(gca,'fontsize',12)
% title('(a) Pattern correlation','fontsize',12)
% xlabel('Lead (months)')
% subplot(1,3,2)
% plot([1:PredLength]*gap/30, RMSE_ENSO_3D, 'r', 'linewidth',1)
% plot([1:PredLength]*gap/30, RMSE_ENSO_2D, 'y', 'linewidth',1)
% plot([1:PredLength]*gap/30, RMSE_ENSO_1D, 'g', 'linewidth',1)
% plot([1,PredLength]*gap/30, [std_u1_ref,std_u1_ref],'b--','linewidth',1)
% box on
% set(gca,'fontsize',12)
% title('(b) RMSE','fontsize',12)
% xlabel('Lead (months)')
% subplot(1,3,3)
% hold on
% plot([1:PredLength]*gap/30, RelEntropy_ENSO_3D, 'r', 'linewidth',1)
% plot([1:PredLength]*gap/30, RelEntropy_ENSO_2D, 'y', 'linewidth',1)
% plot([1:PredLength]*gap/30, RelEntropy_ENSO_1D, 'g', 'linewidth',1)
% box on
% set(gca,'fontsize',12)
% title('(c) Relative entropy','fontsize',12)
% xlabel('Lead (months)')
% legend()