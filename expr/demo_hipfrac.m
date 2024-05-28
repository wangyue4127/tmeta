% This code shows model fitting (Table 2) and outlier detection (Figure 3) for different methods on the hipfrac dataset, 
% as well as a forest plot Figure 1 for the dataset.

clc; clear all
dataname = 'hipfrac'; addpath('result');
model    = {'nMeta','tRE-Meta','MIX-Meta','SYM-Meta','SKM-Meta','tMeta'};

%% the result of model fitting
load('hipfrac_org_dec.mat');
fprintf('Fitting results of different models on the hipfrac dataset:\n')
title_str = {'muhat','sigmahat','nuhat','-logLik','BIC','time'};
fprintf('\n\t\t\t%s\t%s\t%s\t%s\t%6s\t%7s\n',title_str{:});
for i = 1:length(model)
    fprintf('%-8s%9.3f %8.3f %10.3f %8.3f %8.3f %8.3f \n', ...
        model{i},me{i}.mu,sqrt(me{i}.s2),me{i}.nu,me{i}.logL.*(-1),me{i}.BIC,me{i}.time+me{i}.dtime);
end

%% plot
alpha = 0.05; m = 1;
[Y,Hmu,Ci,err,ll_t,T,marS,Ndata,tme,tre,mix,skm,sym] = re(dataname);
% forest plot and the change in log-likelihood by tmeta
figure; fore(Y,Hmu,Ci,err,ll_t,marS,Ndata);

%  outlier detection
figure; plot_outm(tme,tre,mix,skm,sym,m,alpha,Ndata,dataname);
