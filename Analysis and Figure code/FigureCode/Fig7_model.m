
%plot of model in paper format

%   plot example cells masking before and after each adaptation
% change in area metric

try
    tmp=find(con==plaid_contrast);
catch
    tmp=find(con==0.5);
end

am=am(:,1:tmp);am2=am2(:,1:tmp);am3=am3(:,1:tmp);

aa=mean(am2-am,1);
bb=mean(am3-am,1);
aa2=std(am2-am,0,1)/sqrt(length(am));
bb2=std(am3-am,0,1)/sqrt(length(am));

if qq==1
        figure
        subplot(3,3,1)
        plot(squeeze(R_plaid(1,1:tmp,1)),'k')
        hold on;box off
        area(squeeze(R_plaid(1,1:tmp,1)))
        plot(squeeze(R_plaid(1,1:tmp,tmp)),'r')
        area(squeeze(R_plaid(1,1:tmp,tmp)))
        axis([0 25 0 1])
        set(gca,'XScale','log','TickDir','out')
    
        subplot(3,3,2)
        plot(squeeze(R_plaid2(1,1:tmp,1)),'k')
        hold on;box off
        area(squeeze(R_plaid2(1,1:tmp,1)))
        plot(squeeze(R_plaid2(1,1:tmp,tmp)),'g')
        area(squeeze(R_plaid2(1,1:tmp,tmp)))
        title('Contingent adaptation')
        axis([0 25 0 1])
        set(gca,'XScale','log','TickDir','out')

        subplot(3,3,3)
        plot(squeeze(R_plaid3(1,1:tmp,1)),'k')
        hold on;box off
        area(squeeze(R_plaid3(1,1:tmp,1)))
        plot(squeeze(R_plaid3(1,1:tmp,tmp)),'b')
        area(squeeze(R_plaid3(1,1:tmp,tmp)))
        title('Asynch adaptation')
        axis([0 25 0 1])
        set(gca,'XScale','log','TickDir','out')
        
        try
            supertitle(num2str(rr))
        end
%         for i=1:3
%             subplot(3,3,i)
%             set(gca,'YLim',[0 max([squeeze(R_plaid(1,:,1)) squeeze(R_plaid2(1,:,1)) squeeze(R_plaid3(1,:,1))])])
%             set(gca,'XLim',[0 11])
%         end
end

if qq==1
    ax=subplot(323);
%     plot((1:length(am2(1,:))),am2(1,:)-am(1,:),'g')
    hold on;box off
    errorline((1:length(am2(1,:))),mean(am2-am,1),std(am2-am,0,1)/sqrt(size(am,1)),'g')
    fill_between(ax,1:26,mean(am2-am,1)+std(am2-am,0,1)/sqrt(size(am,1)),...
        mean(am2-am,1)-std(am2-am,0,1)/sqrt(size(am,1)),'y',0.5,'g')
%     plot((1:length(am2(1,:))),am3(1,:)-am(1,:),'b')
    errorline((1:length(am2(1,:))),mean(am3-am,1),std(am3-am,0,1)/sqrt(size(am,1)),'b')
    fill_between(ax,1:26,mean(am3-am,1)+std(am3-am,0,1)/sqrt(size(am,1)),...
        mean(am3-am,1)-std(am3-am,0,1)/sqrt(size(am,1)),'r',0.5,'b')
    plot([0 25],[0 0],'k--')
    xlabel('Ori pref')
    ylabel('Change mask ind')
    axis([0 25 -0.4 0.4])
    set(gca,'TickDir','out')
else
    ax=subplot(324);
%     plot((1:length(am2(1,:))),am2(31,:)-am(31,:),'g')
    hold on;box off
    errorline((1:length(am2(1,:))),mean(am2-am,1),std(am2-am,0,1)/sqrt(size(am,1)),'g')
    fill_between(ax,1:26,mean(am2-am,1)+std(am2-am,0,1)/sqrt(size(am,1)),...
        mean(am2-am,1)-std(am2-am,0,1)/sqrt(size(am,1)),'r',0.5,'b')
%     plot((1:length(am2(1,:))),am3(31,:)-am(31,:),'b')
    errorline((1:length(am2(1,:))),mean(am3-am,1),std(am3-am,0,1)/sqrt(size(am,1)),'b')
    fill_between(ax,1:26,mean(am3-am,1)+std(am3-am,0,1)/sqrt(size(am,1)),...
        mean(am3-am,1)-std(am3-am,0,1)/sqrt(size(am,1)),'r',0.5,'b')
    plot([0 25],[0 0],'k--')
    xlabel('Ori pref')
    axis([0 25 -0.4 0.4])
    set(gca,'TickDir','out')
end

if qq==1
    subplot(325)
    plot(ori_prefs,am2(:,end)-am(:,end),'g')
    hold on;box off
    plot(ori_prefs,am3(:,end)-am(:,end),'b')
    plot([0 200],[0 0],'k--')
    xlabel('Ori pref')
    ylabel('Change mask ind')
    ylim([-1 0.5])
    set(gca,'TickDir','out')
else
    subplot(326)
    plot(ori_prefs,am2(:,end)-am(:,end),'g')
    hold on;box off
    plot(ori_prefs,am3(:,end)-am(:,end),'b')
    plot([0 200],[0 0],'k--')
    xlabel('Ori pref')
    ylim([-0.5 0.5])
    set(gca,'TickDir','out')
end
