function [tme,t_cpu,opts]=simu_1(y,es2,ini)
disp_it = 0; num = 3; Ndata = length(y);
%% tMeta
opts = []; opts.maxit = 5000; opts.disp_it = disp_it; opts.tol = 1e-8;nopts = opts;

time_start = cputime;
[meini,opts]=Metaini(y,es2,ini,opts,21);
[mep,opts]=tMeta(y,es2,opts,meini);
t_cpu = cputime-time_start;

tme.mu=mep.mu;  tme.s2=mep.s2;       
if mep.nu~=1e8; tme.nu=mep.nu; else; tme.nu=inf; end
tme.ll_t=opts.errlog;  tme.logL=opts.logL; 
tme.tau=mep.tau;       [tme.vtau tme.IDtau]=sort(tme.tau);

tme.iternum=opts.itnum; tme.T=opts.time.ini+opts.time.preit+cumsum(opts.time.it);
tme.Tend=tme.T(end);        tme.AIC=2*num-2*tme.logL; tme.BIC=log(Ndata)*num-2*tme.logL;



