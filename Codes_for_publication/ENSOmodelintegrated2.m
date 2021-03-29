function [priordata]=ENSOmodelintegrated2(Num,timeperiod,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale)
load ENSO_Reference
gap = 1; % prediction every 'gap' days
PredLength = Num+20000; % the maximum lead in prediction is PredLength*gap

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
if timeperiod==1
    u1_pred20 = ones(EnsNum,1) * u1_reference(1);
    u2_pred20 = ones(EnsNum,1) * u2_reference(1); 
    tau_pred20 = ones(EnsNum,1) * tau_reference(1); %filter_tau(1:gap:6570);%
else
    u1_pred20 = ones(EnsNum,1) * u1_reference(6571);
    u2_pred20 = ones(EnsNum,1) * u2_reference(6571); 
    tau_pred20 = ones(EnsNum,1) * tau_reference(6571);
end
% Save the prediction results
u1_save = zeros(PredLength,Length);
u2_save = zeros(PredLength,Length);
tau_save = zeros(PredLength,Length);
% Prediction; since we choose a 10 times smaller time step, 10 time steps
% here means one day


%%%Each row of _save is gap lead time.
k = 50;
% d_u = 1.5;
% d_tau = 2*2;
% omega_u = -1.5;
% sigma_u = 0.8; % determined by quadratic variation
% alpha_1 = 1;
% alpha_2 = (-0.4);
dt = 1/365;


% d_u = 1.5;
% d_tau = 2*2;
% omega_u = -1.5;
% sigma_u = 0.8; % determined by quadratic variation
% alpha_1 = 1;
% alpha_2 = (-0.4);

% d_u = .5*1.5;
% d_tau = .5*2*2;
% omega_u = -1.5;
% sigma_u = 0.8; % determined by quadratic variation
% alpha_1 = 1;
% alpha_2 = (-0.4);


% temp=sqrt(2)*randn(1,3);
% temp=abs(temp);
% d_u = d_u+temp(1);
% d_tau = d_tau+temp(2);
% omega_u = omega_u+temp(3);
% sigma_u = sigma_u; % determined by quadratic variation
% alpha_1 = alpha_1;
% alpha_2 = alpha_2;


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
priordata=[u1_save(20000:end),u2_save(20000:end),tau_save(20000:end)]';
