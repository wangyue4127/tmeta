function [met,opts]=Metaini(y,es2,method,opts,sam)
% initialization of parameters

rng(sam)
time_start=cputime;
switch method
    case 'sample'
        met.mu  = mean(y);met.s2 = var(y); met.nu = 2.1; met.a = 1.1;
        met.tau = (met.nu+1)/(met.nu+sum((y-met.mu).^2./(met.s2+es2)));
    case 'rand'
        met.mu = rand; met.s2 = rand; met.nu = 4; 
    case 'randn'
        met.mu = randn(1); met.s2 = abs(randn(1)); met.nu = 2.1;
end
time_end=cputime;
opts.time.ini=time_end-time_start;