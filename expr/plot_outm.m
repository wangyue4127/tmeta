function plot_outm(tme,tre,mix,skm,sym,m,alpha,Ndata,dataname)
ml = length(m); nm = 5; ah = 5;
for j=1:ml
    %% t---tau
    subplot(ml,nm,1+5*(j-1));
    itau  = 1./tme.Tau{j};
    if tme.Nu(j)==inf; tme.Nu(j)=1e8; end
    k     = (1+1/tme.Nu(j))*betainv(alpha,tme.Nu(j)/2,1/2); k=1/k;
    outID = find(itau>k); mt = length(outID);
    tau0 = itau;    tau0(outID)=[];
    id0  = 1:Ndata(j); id0(outID) =[];
    plot(tau0,id0,'.','Color',[0 0.4470 0.7410]);hold on;
    for i=1:mt
        if strcmp(dataname, 'cdp')
            if j==1
                plot(itau(outID(i)),outID(i),'*','color',[1 0 1]);hold on;
                text(itau(outID(i)),outID(i),[num2str(outID(i))],'color',[1 0 1]);
            else
                plot(15*i,outID(i),'*','color',[1 0 1]);hold on;
                text(15*i,outID(i),[num2str(outID(i))],'color',[1 0 1]);
            end
        else
            plot(itau(outID(i)),outID(i),'*','color',[1 0 1]);hold on;
            text(itau(outID(i)),outID(i),[num2str(outID(i))],'color',[1 0 1]);
        end
    end
    ymin=min(itau); ymax=max(itau);
    hold on;
    if strcmp(dataname, 'cdp')
        if j==1
            yLimits = [-ah Ndata(j)+ah];
            line([k,k],yLimits,'color','m');
            axis([0 15*mt+8 -ah (Ndata(j)+ah)]);
        else
            yLimits = [-5 Ndata(j)+ah];
            line([5,5],yLimits,'color','m');
            axis([0 15*mt+8 -ah (Ndata(j)+ah)]);
        end
    else
        yLimits = [-5 Ndata(j)+ah];
        axis([ymin-1 ymax+1 -ah (Ndata(j)+ah)])
        line([k,k],yLimits,'color','m');
    end
    ylabel('study sample');
    if j==1;tl=title('$t$Meta');end; set([tl],'Interpreter','latex');
    if j==2||ml==1
        xl=xlabel('$$\mathrm E[\tau]$$');set([xl],'Interpreter','latex');
    end
    if strcmp(dataname, 'cdp')
        if j==2
            set(gca,'xtick', [0 5 15 30]);
            set(gca,'XTicklabel', {0,81.2,88.0,76617});
        end
    end
    %% tre-tau
    %tREMeta异常值识别图
    subplot(ml,nm,2+5*(j-1))
    [treomega.value,treomega.ID]=sort(tre.W{j},'descend');outID=treomega.ID(1:m(j));
    tau0=tre.W{j}; tau0(outID)=[];
    id0 = 1:Ndata(j);   id0(outID) =[];
    plot(tau0,id0,'.','Color',[0 0.4470 0.7410]);hold on;
    for i=1:m(j)
        plot(tre.W{j}(outID(i)),outID(i), '*','color',[1 0 1]);hold on;
        text(tre.W{j}(outID(i)),outID(i),[num2str(outID(i))],'color',[1 0 1]);
    end
    ymin = min(tre.W{j}); ymax = max(tre.W{j});
    h=(ymax-ymin)/5; axis([min(ymin-h,-0.1) max(ymax+h,1.1) -2 (Ndata(j)+ah)]);
    if j==1;tl = title('$$t$$RE-Meta'); set([tl],'Interpreter','latex');end
    if j==2||ml==1;xl=xlabel('$$\omega^0_i/\omega_i$$');set([xl],'Interpreter','latex');end

    %% mix-meta
    subplot(ml,nm,3+5*(j-1))
    outID = find(mix.Prob{j}>0.9); mm = length(outID);
    %         [mix.value,mix.ID]=sort(mixme.prob(:,j),'descend');outID=mix.ID(1:m(j));
    tau0 = mix.Prob{j}; tau0(outID) = [];
    id0  = 1:Ndata(j);         id0(outID)  = [];
    plot(tau0,id0,'.','Color',[0 0.4470 0.7410]);hold on;
    for i=1:mm
        plot(mix.Prob{j}(outID(i)),outID(i),'*','color',[1 0 1]);hold on;
        text(mix.Prob{j}(outID(i)),outID(i),[num2str(outID(i))],'color',[1 0 1]);
    end
    ymin = min(mix.Prob{j}); ymax = max(mix.Prob{j});
    if ymin==ymax; ymax=ymax+0.1;end
    h=(ymax-ymin)/5;
        axis([min(ymin-h,0.89) max(ymax+h,1.05) -2 (Ndata(j)+ah)]);
    axis([min(-0.1,0.89) max(ymax+h,1.05) -2 (Ndata(j)+ah)]);
    hold on;
    yLimits =[-2 Ndata(j)*1.5];
        line([0.9,0.9],yLimits,'color','m');
    if j==1;title('Mix-Meta');end
    if j==2||ml==1;xlabel('post.prob');end
    box on;

    %% tP-Meta
    subplot(ml,nm,4+5*(j-1))
    [tP.value,tP.ID] = sort(sym.P{j});
    id    = find(tP.value<[1:Ndata(j)]'*alpha/Ndata(j));
    outID = tP.ID(id); mf = length(outID);
    P0  = sym.P{j};  P0(outID)  =[];
    id0 = 1:Ndata(j); id0(outID) =[];
    plot(P0,id0,'.','color',[0 0.4470 0.7410]);hold on;
    for i=1:mf
        plot(sym.P{j}(outID(i)),outID(i),'*','color',[1 0 1]);hold on;
        text(sym.P{j}(outID(i)),outID(i),[num2str(outID(i))],'color',[1 0 1]);
    end
    ymin=min(sym.P{j}); ymax=max(sym.P{j});
    if ymin==ymax; ymax=ymax+0.1;end
    h=(ymax-ymin)/5;axis([ymin-h ymax+h -2 (Ndata(j)+ah)]);
    if j==1;title('SYM-Meta');end
    if j==2||ml==1;xl=xlabel('$$p$$-value'); set([xl],'Interpreter','latex');end

    %% tpmeta
    subplot(ml,nm,5+5*(j-1));
    [fP.value,fP.ID] = sort(skm.P{j});
    id    = find(fP.value<[1:Ndata(j)]'*alpha/Ndata(j));
    outID = fP.ID(id); mf = length(outID);
    P0  = skm.P{j};  P0(outID)  =[];
    id0 = 1:Ndata(j); id0(outID) =[];
    plot(P0,id0,'.','color',[0 0.4470 0.7410]);hold on;
    for i=1:mf
        plot(skm.P{j}(outID(i)),outID(i),'*','color',[1 0 1]);hold on;
        text(skm.P{j}(outID(i)),outID(i),[num2str(outID(i))],'color',[1 0 1]);
    end
    ymin=min(skm.P{j}); ymax=max(skm.P{j});
    if ymin==ymax; ymax=ymax+0.1;end
    h=(ymax-ymin)/5;axis([ymin-h ymax+h -2 (Ndata(j)+ah)]);
    if j==1;title('SKM-Meta');end
    if j==2||ml==1;xl=xlabel('$$p$$-value'); set([xl],'Interpreter','latex');end
    box on;
end


