% demo_tmeta fits tMeta on the mag dataset. 
% Note: To run the results on another dataset, you can replace the mag dataset.

clc;clear all
addpath('data'); addpath('../prog'); rng(1);

%% load data
% mag dataset
load mag.txt;     y = mag(:,2);       es2 = mag(:,3).^2;

% hipfrac dataset
% load hipfrac.txt; y = hipfrac(:,2);   es2 = hipfrac(:,3);

% original fluoride toothpaste dataset
% load marinho.txt; y = marinho(:,8);   es2   = marinho(:,9).^2;

% modified fluoride toothpaste dataset
% load marinho.txt; y   = marinho(:,8); es2   = marinho(:,9).^2;
%                   yad = unifrnd(1,2); es2ad = 1/12; 
%                   y   = [y;yad];      es2   = [es2;es2ad];          

% original CDP dataset
% load cdp.txt;     y = cdp(:,3);       es2 = cdp(:,4).^2;

% modified CDP dataset
% load cdpm.txt;    y = cdpm(:,3);      es2 = cdpm(:,4).^2;

%% %% Selecting the initialisation method
algini = {'sample','rand','randn'}; IDini = 2;

%% model fitting
[tme,t_cpu,opts] = simu_1(y,es2,algini{IDini});

%% the result of model fitting
fprintf('Model fitting results for tmeta:\n')
fprintf('\n\t\t%s\t%s\t%s\t%s\t\t%s\t\t%s\n','muhat','sigmahat','nuhat','logLik','AIC','BIC');
fprintf('%13.3f\t%6.3f\t%8.3f\t%6.3f\t%8.3f%8.3f\n',tme.mu, sqrt(tme.s2), tme.nu,tme.logL, tme.AIC, tme.BIC);

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




