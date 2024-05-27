% this code shows the results on all the datasets in the paper, including model fitting, outlier detection, forest plots.
function [Y,Hmu,Ci,error,ll_t,T,markerSizes,Ndata,Tme,Treme,Mixme,Fpme,Tpme]=re(dataname)
addpath('result');
switch dataname
    case 'cdp'
        load('cdp_org_fore.mat');
        Y{1}     = y;   Es{1}  = es;   Hmu(1)    = hmu;
        ci  = [y-es*1.96 y+es*1.96];   Ci{1}     = ci;
        mar = 1./(s^2+es.^2);          markerSizes{1} = mar;
        e   = [y-ci(:,1), ci(:,2)-y];  error{1}  = e;
        ll_t{1}  = tme.ll_t;           T{1}      = tme.T;
        Ndata(1) = length(y);
        load('cdp_ext_fore.mat');
        Y{2}  = y;    Es{2}  = es;     Hmu(2)    = hmu;
        ci  = [y-es*1.96 y+es*1.96];   Ci{2}     = ci;
        mar = 1./(s^2+es.^2);          markerSizes{2} = mar;
        e   = [y-ci(:,1), ci(:,2)-y];  error{2}  = e;
        ll_t{2}  = tme.ll_t;           T{2}      = tme.T;
        Ndata(2) = length(y);            
        load('cdp_org_dec.mat');       
        Tme.Tau{1} = me{6}.tau;        Tme.Nu(1) = me{6}.nu;
        Treme.W{1} = me{2}.w;          Mixme.Prob{1} = me{3}.prob;
        Tpme.P{1}  = me{4}.p;          Fpme.P{1} = me{5}.p;
        load('cdp_ext_dec.mat');
        Tme.Tau{2} = me{6}.tau;        Tme.Nu(2) = me{6}.nu;
        Treme.W{2} = me{2}.w;          Mixme.Prob{2} = me{3}.prob;
        Tpme.P{2}  = me{4}.p;          Fpme.P{2} = me{5}.p;
        case 'fluoride'
        load('fluoride_org_fore.mat');
        Y{1}     = y;   Es{1}  = es;   Hmu(1)    = hmu;
        ci  = [y-es*1.96 y+es*1.96];   Ci{1}     = ci;
        mar = 0.1./(s^2+es.^2);        markerSizes{1} = mar;
        e   = [y-ci(:,1), ci(:,2)-y];  error{1}  = e;
        ll_t{1}  = tme.ll_t;           T{1}      = tme.T;
        Ndata(1) = length(y);
        load('fluoride_ext_fore.mat');
        Y{2}  = y;    Es{2}  = es;     Hmu(2)    = hmu;
        ci  = [y-es*1.96 y+es*1.96];   Ci{2}     = ci;
        mar = 0.1./(s^2+es.^2);        markerSizes{2} = mar;
        e   = [y-ci(:,1), ci(:,2)-y];  error{2}  = e;
        ll_t{2}  = tme.ll_t;           T{2}      = tme.T;
        Ndata(2) = length(y);          
        load('fluoride_org_dec.mat');  
        Tme.Tau{1} = me{6}.tau;        Tme.Nu(1) = me{6}.nu;
        Treme.W{1} = me{2}.w;          Mixme.Prob{1} = me{3}.prob;
        Tpme.P{1}  = me{4}.p;          Fpme.P{1} = me{5}.p;
        load('fluoride_ext_dec.mat');
        Tme.Tau{2} = me{6}.tau;        Tme.Nu(2) = me{6}.nu;
        Treme.W{2} = me{2}.w;          Mixme.Prob{2} = me{3}.prob;
        Tpme.P{2}  = me{4}.p;          Fpme.P{2} = me{5}.p;
    case 'hipfrac'
        load('hipfrac_org_fore.mat');
        Y{1}     = y;   Es{1}  = es;   Hmu(1)    = hmu;
        ci  = [y-es*1.96 y+es*1.96];   Ci{1}     = ci;
        mar = 0.4./(s^2+es.^2);        markerSizes{1} = mar;
        e   = [y-ci(:,1), ci(:,2)-y];  error{1}  = e;
        ll_t{1}  = tme.ll_t;           T{1}      = tme.T;
        Ndata(1) = length(y);          
        load('hipfrac_org_dec.mat');   
        Tme.Tau{1} = me{6}.tau;        Tme.Nu(1) = me{6}.nu;
        Treme.W{1} = me{2}.w;          Mixme.Prob{1} = me{3}.prob;
        Tpme.P{1}  = me{4}.p;          Fpme.P{1} = me{5}.p;
    case 'mag'
        load('mag_org_fore.mat');
        Y{1}     = y;   Es{1}  = es;   Hmu(1)    = hmu;
        ci  = [y-es*1.96 y+es*1.96];   Ci{1}     = ci;
        mar = 0.4./(s^2+es.^2);        markerSizes{1} = mar;
        e   = [y-ci(:,1), ci(:,2)-y];  error{1}  = e;
        ll_t{1}  = tme.ll_t;           T{1}      = tme.T;
        Ndata(1) = length(y);          
        load('mag_org_dec.mat');      
        Tme.Tau{1} = me{6}.tau;        Tme.Nu(1) = me{6}.nu;
        Treme.W{1} = me{2}.w;          Mixme.Prob{1} = me{3}.prob;
        Tpme.P{1}  = me{4}.p;           Fpme.P{1} = me{5}.p;
end