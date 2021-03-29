function Sampling=samplejoin(time,no_tr,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale)

[T_Sampling,H_W_Sampling,WB_Sampling]=EnsoSampleGenerate([time(1) time(end)],no_tr,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale);

T_Sampling=T_Sampling';
H_W_Sampling=H_W_Sampling';
WB_Sampling=WB_Sampling';




T_Sampling=T_Sampling(:)';
H_W_Sampling=H_W_Sampling(:)';
WB_Sampling=WB_Sampling(:)';

Sampling=[T_Sampling;H_W_Sampling;WB_Sampling];