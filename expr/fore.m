function fore(Y,Hmu,Ci,Error,ll_t,MarkerSizes,Ndata)
m = length(Hmu);
for i = 1:m
    y = Y{i}; hmu = Hmu(i);  ci = Ci{i}; 
    error = Error{i};        markerSizes = MarkerSizes{i};
    subplot(m,2,1+2*(i-1))
    h = [];
    for j = 1:length(y)
        h(j) = errorbar(y(j),j,error(j, 1),error(j, 2),'horizontal','o','Color','k','LineWidth',1);
        hold on;
        set(h(j), 'MarkerSize', markerSizes(j));
    end
    hold on;
    hx1 = (max(ci(:,2))-min(ci(:,1)))/10; hy1 = 0.1*Ndata(i);   
    axis([min(ci(:,1))-hx1 max(ci(:,2))+hx1 -2 Ndata(i)+hy1]);
    line([0 0],[0 Ndata(i)+hy1], 'Color', 'k', 'LineStyle', ':', 'LineWidth', 1);
    line([hmu hmu],[-2 Ndata(i)+hy1], 'Color', 'k', 'LineStyle', '-', 'LineWidth', 1);
    xlabel('the effect size'); ylabel('study sample');

    subplot(m,2,2+2*(i-1))
    plot(ll_t{i},'b:','linewidth',1.5)
    hy2 = (max(ll_t{i})-min(ll_t{i}))/5;
    axis([0 length(ll_t{i})+1 min(ll_t{i})+hy2,max(ll_t{i})+hy2/2]);
    xlabel('Iteration number');ylabel('Log-likelihood');
end