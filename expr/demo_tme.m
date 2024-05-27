% demo_tme shows the results on the mag dataset by tMeta.
% Note: To run the results on another dataset, you can replace the mag dataset.

clc;clear all
addpath('data'); addpath('../prog');

%% load data
load mag.txt; y = mag(:,2); es2 = mag(:,3).^2;

%% %% Selecting the initialisation method
algini = {'sample','rand','randn'}; IDini = 2;

%% model fitting
[tme,t_cpu,opts] = simu_1(y,es2,algini{IDini});

%% the result of model fitting
fprintf('Model fitting results for tmeta:\n')
fprintf('\n\t\t%s\t%s\t%s\t%s\t\t%s\t\t%s\n','muhat','sigma2hat','nuhat','logLik','AIC','BIC');
fprintf('%13.2f\t%6.2f\t%8.2f\t%6.2f\t%8.2f%8.2f\n',tme.mu, tme.s2, tme.nu,tme.logL, tme.AIC, tme.BIC);

%% the change of log-likelihood with number of iterations and CPU time
subplot(1,2,1)
plot(tme.ll_t,'b:','linewidth',1.5)
xlabel('Iteration number'); ylabel('Log-likelihood');
hx2 = length(tme.ll_t)/5; hy2 = (max(tme.ll_t)-min(tme.ll_t))/5;
axis([0 length(tme.ll_t)+1 min(tme.ll_t)+hy2,max(tme.ll_t)+hy2/2]);

subplot(1,2,2)
plot(tme.T,tme.ll_t,'b:','linewidth',1.5);xlabel('cpu time');
hx3 = tme.T(end)/5+1e-8;
axis([tme.T(1)-hx3 tme.T(end)+hx3 min(tme.ll_t)+hy2,max(tme.ll_t)+hy2/2]);




