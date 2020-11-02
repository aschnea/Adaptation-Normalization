%% load data
clear
% load raw data for each file then run:

%% Extract responses during adaptation
% 	syncs 1001-1160 - 40sec

adaptsyncs = syncs(1001:1160,1);                    % timing of adapt syncs
% resp_adapt = zeros(length(cell_type),160);          % responses during adaptation split into bins
edges1 = 0:2:40;                                    %time bins
edges2 = 0:4:40;

index=1;
for i=1:96                                                      % # of channels on array
    resp=spikes(spikes(:,1)==i,:);                              % all spikes on channel i
    sort_codes=unique(resp(:,2));                               % identifies # of units on channel i 
    sort_codes=sort_codes(sort_codes~=0 & sort_codes~=255);     % removes unsorted waveforms
    for j=1:length(sort_codes)                                  % # of units on each channel
        resp2=resp(resp(:,2)==sort_codes(j),3);                 % filters out spike timing for each unit
        times=[];
        for k=1001:1160                                         % stim pulses during adaptation
            tmp=find(resp2>syncs(k) & resp2<=syncs(k)+0.25);    % take a 250ms epoch for each sync since that is length of adapt stim
            times = [times;resp2(tmp)];                         % cumulatively stores times of all events during adaptation
            resp_count_adapt(index,k-1000)=length(tmp);         % stores count of spikes for each stimulus epoch
        end
        resp_times_adapt{index}=times-syncs(1001);
        count_adapt_sum(index)=sum(resp_count_adapt(index,:));
        index=index+1;
    end
end

for e=1:length(resp_times_adapt)
    psth_adapt1(e,:)=(1/diff(edges1(1:2)))*histcounts(resp_times_adapt{e},edges1);
    psth_adapt2(e,:)=(1/diff(edges2(1:2)))*histcounts(resp_times_adapt{e},edges2);
end

% figure
% for e = 1:length(cell_type)
%     subplot(1,2,1);
%     plot(psth_adapt1(e,:),'k.')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     subplot(1,2,2)
%     plot(psth_adapt2(e,:),'k.')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     pause; clf
% end


%% fit decay function to responses
options=optimset('MaxIter',1E4,'MaxFunEvals',1E4,'TolX',1E-3,'LargeScale','on');

% LSQ manual fit
for e = 1:length(cell_type)
    decay_params1lsq(e,:)=lsqcurvefit('adapt_decayfx',[min(psth_adapt1(e,:)) max(psth_adapt1(e,:)) 1],edges1(2:end),psth_adapt1(e,:),[0.01 0 0],[max(psth_adapt1(e,:)) 200 inf],options);
    pred1lsq(e,:)=adapt_decayfx(decay_params1lsq(e,:),edges1(2:end));
    fq1(e)=1-(var(psth_adapt1(e,:)-pred1lsq(e,:))/var(psth_adapt1(e,:)));
    
    decay_params2lsq(e,:)=lsqcurvefit('adapt_decayfx',[min(psth_adapt2(e,:)) max(psth_adapt2(e,:)) 1],edges2(2:end),psth_adapt2(e,:),[0.01 0 0],[max(psth_adapt2(e,:)) 200 inf],options);
    pred2lsq(e,:)=adapt_decayfx(decay_params2lsq(e,:),edges2(2:end));
    fq2(e)=1-(var(psth_adapt2(e,:)-pred2lsq(e,:))/var(psth_adapt2(e,:)));
    
end

% figure
% for e = 1:length(cell_type)
%     subplot(1,2,1); hold on
%     plot(psth_adapt1(e,:),'k.')
%     plot(pred1lsq(e,:),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     title([decay_params1lsq(e,:) fq1(e)])
%     
%     subplot(1,2,2); hold on
%     plot(psth_adapt2(e,:),'k.')
%     plot(pred2lsq(e,:),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     title([decay_params2lsq(e,:) fq2(e)])
%     pause; clf
% end

% nlinfit tool
% decayfx = @(p,x)(p(1)+p(2)*exp(x*-p(3)));
% for e = 1:length(cell_type)
%     decay_params1(e,:)=nlinfit(edges1(2:end),psth_adapt1(e,:),decayfx,[min(psth_adapt1(e,:)) 1 1],options);
%     
%     decay_params2(e,:)=nlinfit(edges2(2:end),psth_adapt2(e,:),decayfx,[min(psth_adapt2(e,:)) 1 1],options);
%     
%     decay_params3(e,:)=nlinfit(edges3(2:end),psth_adapt3(e,:),decayfx,[min(psth_adapt3(e,:)) 1 1],options);
%     
%     decay_params4(e,:)=nlinfit(edges4(2:end),psth_adapt4(e,:),decayfx,[min(psth_adapt4(e,:)) 1 1],options);
% end
% 
% 
% figure
% for e = 1:length(cell_type)
%     subplot(2,2,1); hold on
%     plot(psth_adapt1(e,:),'k.')
%     plot(decayfx(decay_params1(e,:),edges1(2:end)),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     subplot(2,2,2); hold on
%     plot(psth_adapt2(e,:),'k.')
%     plot(decayfx(decay_params2(e,:),edges2(2:end)),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     subplot(2,2,3); hold on
%     plot(psth_adapt3(e,:),'k.')
%     plot(decayfx(decay_params3(e,:),edges3(2:end)),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     subplot(2,2,4); hold on
%     plot(psth_adapt4(e,:),'k.')
%     plot(decayfx(decay_params4(e,:),edges4(2:end)),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     pause; clf
% end
% 
% % fit tool
% for e = 1:length(cell_type)
%     decay_params1{e}=fit(edges1(2:end)',psth_adapt1(e,:)','exp1');
%     
%     decay_params2{e}=fit(edges2(2:end)',psth_adapt2(e,:)','exp1');
%     
%     decay_params3{e}=fit(edges3(2:end)',psth_adapt3(e,:)','exp1');
%     
%     decay_params4{e}=fit(edges4(2:end)',psth_adapt4(e,:)','exp1');
% end
% 
% figure
% for e = 1:length(cell_type)
%     subplot(2,2,1); hold on
% %     plot(psth_adapt1(e,:),'k.')
%     plot(decay_params1{e},edges1(2:end),psth_adapt1(e,:),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     title([decay_params1{1,e}])
%     subplot(2,2,2); hold on
% %     plot(psth_adapt2(e,:),'k.')
%     plot(decay_params2{e},edges2(2:end),psth_adapt2(e,:),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     title([decay_params2{1,e}])
%     subplot(2,2,3); hold on
% %     plot(psth_adapt3(e,:),'k.')
%     plot(decay_params3{e},edges3(2:end),psth_adapt3(e,:),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     title([decay_params3{1,e}])
%     subplot(2,2,4); hold on
% %     plot(psth_adapt4(e,:),'k.')
%     plot(decay_params4{e},edges4(2:end),psth_adapt4(e,:),'r')
%     xlabel('Time (s)')
%     ylabel('Firing rate')
%     title([decay_params4{1,e}])
%     pause; clf
% end