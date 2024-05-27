% This code shows model fitting (Table 3) and outlier detection (Figure 5) for different methods on the original and extended fluoride datasets, 
% as well as a forest plot Figure 4 for the dataset.

clc; clear all
dataname = 'fluoride';  addpath('result');
model    = {'nMeta','tRE-Meta','MIX-Meta','SYM-Meta','SKM-Meta','tMeta'};

%% the result of model fitting
load('fluoride_org_dec.mat');
fprintf('Fitting results of different models on the original fluoride dataset:\n')
title_str = {'muhat','sigmahat','nuhat','-logLik','AIC','BIC','t_time','d_time'};
fprintf('\n\t\t\t%s\t%s\t%s\t%s\t%5s\t%6s\t%9s\t%6s\n',title_str{:});
for i = 1:length(model)
    fprintf('%-8s%9.3f %8.3f %9.3f %9.3f %8.3f %8.3f %8.3f %8.3f \n', ...
        model{i},me{i}.mu,sqrt(me{i}.s2),me{i}.nu,me{i}.logL.*(-1),me{i}.AIC,me{i}.BIC,me{i}.time,me{i}.dtime);
end

load('fluoride_ext_dec.mat');
fprintf('Fitting results of different models on the extended fluoride dataset:\n')
fprintf('\n\t\t\t%s\t%s\t%s\t%s\t%5s\t%6s\t%9s\t%6s\n',title_str{:});
for i = 1:length(model)
    fprintf('%-8s%9.3f %8.3f %9.3f %9.3f %8.3f %8.3f %8.3f %8.3f \n', ...
        model{i},me{i}.mu,sqrt(me{i}.s2),me{i}.nu,me{i}.logL.*(-1),me{i}.AIC,me{i}.BIC,me{i}.time,me{i}.dtime);
end

%% plot
alpha = 0.05; m = [3,4];
[Y,Hmu,Ci,err,ll_t,T,marS,Ndata,tme,tre,mix,skm,sym] = re(dataname);

% forest plot and the change in log-likelihood by tmeta
figure; fore(Y,Hmu,Ci,err,ll_t,marS,Ndata);

%  outlier detection
figure; plot_outm(tme,tre,mix,skm,sym,m,alpha,Ndata,dataname);
