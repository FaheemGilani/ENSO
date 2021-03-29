% ENSO model
% Obs u1, estimate u2 and tau
% fix the random number seeds for repeating experiments
function [T_Sampling_mat,y_Sampling_mat, z_Sampling_mat]=EnsoSampleGenerate(time,Num,d_u,d_tau,omega_u,sigma_u,alpha_1,alpha_2,sigma_tau_scale)
load ENSO_Reference
%  Total_WB=uwnd_mean;

dt = 1/365; % time step; N*dt is the total time length 
time_ind= Y>=time(1) & Y<=time(2);
Y=Y(time_ind);


N=length(Y);
T_E=T_E(time_ind);
H_W=H_W(time_ind);

Total_WB=Total_WB(time_ind);

ttt=ttt(time_ind);

% Model parameters
% d_u = 1.5;
% d_tau = 4;
% omega_u = -1.5;

% d_u = 1.5;
% d_tau = 4;
% omega_u = -1.5*.5;
% sigma_u = .5*0.8; 
% % alpha_1 = 1; 
% % alpha_2 = -0.4; 
% alpha_1 = 1; 
% alpha_2 = -.4*.5; 


% d_u = 1.5;sigma_
% d_tau = 4;
% omega_u = -1.5*scale;
% sigma_u = noisecoeff2*0.8; 
% % alpha_1 = 1; 
% %alpha_2 = -0.4*scale; 
% alpha_1 = 1*scale; 
% alpha_2 = -.4*scale; 

% d_u = 1.5;
% d_tau = 3;
% omega_u = -1.5*.5;
% sigma_u = .5*0.8; 
% % alpha_1 = 1; 
% % alpha_2 = -0.4; 
% alpha_1 = 2; 
% alpha_2 = -3*.5; 


% Time lags of computing ACF
Lag = 3000;
% Dimension of the hidden variables
Dim = 2; Dim2 = 4; %Dim2 is Dim^2;

u1_truth = T_E;
% u2_truth = H_W;
% u3_truth = T_W;
tau_truth = Total_WB;
% -- Filtering --

% save the posterior mean and posterior covariance
gamma_mean_trace = zeros(Dim,N);
gamma_cov_trace = zeros(Dim2,N);
% initial value 
gamma_mean0 = [H_W(1);Total_WB(1)];gamma_mean_trace(:,1) = gamma_mean0;
gamma_cov0 = [0.1,0;0,1];%eye(Dim)*0.1; % The initial covariance is arbitary for filtering but it must be nonzero to avoid singularity in smoothing
gamma_cov_trace(:,1) = reshape(gamma_cov0,Dim2,1);




for i = 2:N
    % matrices and vectors in the conditional Gaussian framework
    sigma_tau = sigma_tau_scale*(1.5 * 3* (tanh(u1_truth(i-1)) + 1 ) + 4);
      %sigma_tau =  noisecoeff*1.5 * 3* (tanh(u2_truth(i-1)) + 1)+4;
%     u1_truth_temp=u1_truth(randperm(length(u1_truth)));  
    u0 = u1_truth(i-1);
    u = u1_truth(i);
    a1 = [-d_u, alpha_2; 0, -d_tau];
    a0 = [omega_u * u0; 0];
    b1 = [sigma_u,0;0,sigma_tau];
    A0 = -d_u * u0;
    A1 = [-omega_u, alpha_1];
    invBoB = 1/sigma_u/sigma_u;

    % time evolution of the posterior mean and posterior covariance
    gamma_mean = gamma_mean0 + (a0 + a1 * gamma_mean0) * dt + (gamma_cov0 * A1') * invBoB * (u-u0 - A0*dt-A1 * gamma_mean0 * dt);
    gamma_cov = gamma_cov0 + (a1 * gamma_cov0 + gamma_cov0 * a1' + b1 * b1' - (gamma_cov0 * A1') * invBoB * (gamma_cov0 * A1')') * dt;     
    
    % save the posterior statistics
    gamma_mean_trace(:,i) = gamma_mean;
    gamma_cov_trace(:,i) = reshape(gamma_cov,Dim2,[]);

    % update
    gamma_mean0 = gamma_mean;
    gamma_cov0 = gamma_cov;

end
filter_tau = gamma_mean_trace(2,:); 

% -- Smoothing and backward sampling --

mu_s = zeros(Dim,N); % Save the posterior mean in smoothing
R_s = zeros(Dim2,N); % Save the posterior covariance in smoothing
C = zeros(Dim2,N); % An intermediate matrix used in smoothing
 
% Smoothing is backward
% Intial values for smoothing (at the last time instant)
mu_s(:,end) = gamma_mean;
R_s(:,end) = reshape(gamma_cov,Dim2,1);
R_s_temp = gamma_cov;rd_Y = randn(Dim*Num,N);
Y_Sampling = zeros(Dim,N*Num); % Save for the backward sampled trajectory

%%%
temp = mvnrnd(gamma_mean,gamma_cov);


Y_Sampling(:,end) = temp;

%%%

for j = Num:-1:1
    if mod(j,10) == 1
        disp(j)
    end
    
    %%%%%Code should go here
    
    for i = N-1:-1:1
        % Matrices and vectors in the conditional Gaussian smoothing and
        % backward sampling
        u0 = u1_truth(i);
        sigma_tau = sigma_tau_scale*(1.5 * 3* (tanh(u1_truth(i)) + 1 ) + 4);
         %sigma_tau = 1.5 * 3* (tanh(u2_truth(i)) + 1 )+ 4;
        a1 = [-d_u, alpha_2; 0, -d_tau];
        a0 = [omega_u * u0; 0];
        b1 = [sigma_u,0;0,sigma_tau];
        gamma_cov = reshape(gamma_cov_trace(:,i),Dim,Dim); % filter covariance is needed as the input of smoothing formula 


        Y_Sampling(:, (j-1) * N + i) = Y_Sampling(:, (j-1) * N +  i + 1) + (-a0 - a1 * Y_Sampling(:, (j-1) * N + i + 1)) * dt + b1 * b1' * inv(gamma_cov) * (gamma_mean_trace(:,i) ... 
                - Y_Sampling(:, (j-1) * N + i + 1)) * dt + b1 * randn(Dim,1) * sqrt(dt); % Backward sampling; the sampled trajectory has random noise    
 
        if j ~= 1
            Y_Sampling(:, (j-1) * N + i - 1) = Y_Sampling(:, (j-1) * N + i);
        end
    end
end
y_sampling = Y_Sampling(1,:);
z_sampling = Y_Sampling(2,:);
 




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma_tau =sqrt(var(tau_truth) * 2 * d_tau);
gamma_mean_trace = zeros(1,N);
gamma_cov_trace = zeros(1,N);
% initial value 
gamma_mean0 = T_E(1);gamma_mean_trace(1) = gamma_mean0;
gamma_cov0 = eye(1)*0.1; % The initial covariance is arbitary for filtering but it must be nonzero to avoid singularity in smoothing
gamma_cov_trace(1) = gamma_cov0;


T_Sampling = zeros(1,N*Num); % Save for the backward sampled trajectory
for i = 2:N*Num
    % matrices and vectors in the conditional Gaussian framework

    u0 = [y_sampling(i-1); z_sampling(i-1)];
    u = [y_sampling(i); z_sampling(i)];
    a1 = -d_u;
    a0 = -omega_u * y_sampling(i-1) + alpha_1* z_sampling(i-1);
    b1 = sigma_u;
    A0 = [-d_u * y_sampling(i-1) + alpha_2 * z_sampling(i-1); -d_tau * z_sampling(i-1)];
    A1 = [omega_u;0];
    invBoB = [1/sigma_u/sigma_u, 0; 0, 1/sigma_tau/sigma_tau];

    % time evolution of the posterior mean and posterior covariance
    gamma_mean = gamma_mean0 + (a0 + a1 * gamma_mean0) * dt + (gamma_cov0 * A1') * invBoB * (u-u0 - A0*dt-A1 * gamma_mean0 * dt);
    gamma_cov = gamma_cov0 + (a1 * gamma_cov0 + gamma_cov0 * a1' + b1 * b1' - (gamma_cov0 * A1') * invBoB * (gamma_cov0 * A1')') * dt;     

    % save the posterior statistics
    gamma_mean_trace(i) = gamma_mean;
    gamma_cov_trace(i) = gamma_cov;

    % update
    gamma_mean0 = gamma_mean;
    gamma_cov0 = gamma_cov;

end
    
for i = Num*N-1:-1:1
    % Matrices and vectors in the conditional Gaussian smoothing and
    % backward sampling
    u0 = [y_sampling(i); z_sampling(i)];

    a1 = -d_u;
    a0 = -omega_u * y_sampling(i) + alpha_1* z_sampling(i);
    b1 = sigma_u;
    
    T_Sampling(i) = T_Sampling(i+1) + (-a0 - a1 * T_Sampling(i+1)) * dt + b1 * b1' /gamma_cov_trace(i) * (gamma_mean_trace(i) ... 
        - T_Sampling(i+1)) * dt + b1 * randn * sqrt(dt); % Backward sampling; the sampled trajectory has random noise

end


T_Sampling_mat=reshape(T_Sampling,N,Num)';
y_Sampling_mat=reshape(y_sampling,N,Num)';
z_Sampling_mat=reshape(z_sampling,N,Num)';
