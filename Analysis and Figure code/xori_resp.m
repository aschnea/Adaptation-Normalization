%% load nev and expo data
clear
% spikes=nev_reader('FILENAME.nev',0);
% a=ReadExpoXML('FILENAME.xml');

%% assign stim and syncs
stim=a.passes.BlockIDs;
uniq_stim=unique(stim);
syncs=spikes(spikes(:,1)==2000,3);
% syncs=spikes(spikes(:,1)==2000,:); % for when syncs don't match with stim
% syncs=syncs(syncs(:,2)==-3,3);
syncs=[syncs(1)-diff(syncs(2:3));syncs]; % if missing a sync, verify than do this
% i = 1:2:length(syncs); % For Scout System
% syncs=syncs(i); % For Scout System

stopandsave
% save raw data

%% basic pre-processing

index=1;
for i=1:96                                                  % # of channels on array
    resp=spikes(spikes(:,1)==i,:);                          % all spikes on elec i
    sort_codes=unique(resp(:,2));                           % unique units on elec i
    sort_codes=sort_codes(sort_codes~=0 & sort_codes~=255);
    for j=1:length(sort_codes)                              % # of units on each channel
        resp2=resp(resp(:,2)==sort_codes(j),3);
        for k=1:length(syncs)                               % # of stim pulses
            tmp=find(resp2>syncs(k) & resp2<syncs(k)+1);    % take a 1s epoch for each sync since that is length of stim
            resp_times{index,k}=resp2(tmp)-syncs(k);        % stores relative time of each sync
            resp_count(index,k)=length(tmp);                % stores count of spikes for each epoch
        end
        index=index+1;
    end
end

%% chop up by stim

for i=3:max(stim)                                           % stimulus conditions (starts at 3 usually)
   tmp=find(stim==i);
   tmp=tmp(1:(length(tmp)/2));                              % first half of stim repeats (pre-adapt)
   resp_times_pre(i-2,:,:)=resp_times(:,tmp);
   resp_count_pre(i-2,:,:)=resp_count(:,tmp);
   tmp=find(stim==i);
   tmp=tmp((length(tmp)/2+1):end);                          % second half of stim repeats (post-adapt)
   resp_times_post(i-2,:,:)=resp_times(:,tmp);
   resp_count_post(i-2,:,:)=resp_count(:,tmp);
end

%% make psths

% bins=(0.334:0.0666:1);  % epoch of time to analyze - drops first 333ms (1 cycle of drift)
% for i=75 %1:size(resp_times_pre,2)                          % Units
%     for j=1:size(resp_times_pre,1)                          % stim
%         tmp_pre=[];tmp_post=[];
%         for k=1:size(resp_times_pre,3)                      % reps
%             tmp_pre=[tmp_pre;resp_times_pre{j,i,k}];
%             tmp_post=[tmp_post;resp_times_post{j,i,k}];            
%         end
% %         psth_pre(j,i,:)=(1/diff(bins(1:2)))*histc(tmp_pre,bins)/size(resp_times_pre,3);
% %         psth_post(j,i,:)=(1/diff(bins(1:2)))*histc(tmp_post,bins)/size(resp_times_post,3);
%         psth_pre(j,i,:)=(1/diff(bins(1:2)))*histcounts(tmp_pre,bins)/size(resp_times_pre,3);
%         psth_post(j,i,:)=(1/diff(bins(1:2)))*histcounts(tmp_post,bins)/size(resp_times_post,3);
%     end
% end

%%  compute F0 and F1 for the data

clear f0 f1 f2
for i=1:size(resp_times_pre,2)                              % PRE-ADAPT
    
    for k=1:size(resp_times_pre,1)                          % 1:25
        resp1=squeeze(resp_times_pre(k,i,:));               % psth(25x20)
        for j=1:length(resp1)
            [f0(k,j),f1(k,j),f2(k,j)] = get_f1f2(1000*resp1{j},length(resp1{j}),1000,333,667,333);
        end                                                 % calculates F0 and F1 for each stimulus repeat then averages them.
    end

    tmp=[mean(f0(5,:),2)-mean(f0(1,:),2) mean(f1(5,:),2) mean(f0(21,:),2)-mean(f0(1,:),2) mean(f1(21,:),2)];
    ind=find(tmp==max(tmp));
    if ind(1)==1 || ind(1)==3                               % identifies if mean F0 or F1 is larger and classifies the cell in cell_type
        disp('complex')
        cell_type(i)=0;
    else
        disp('simple')
        cell_type(i)=1;
    end

    resp_f0(i,:)=mean(f0,2);
    resp_f1(i,:)=mean(f1,2);
    SEM_f0(i,:)=std(f0,0,2)./sqrt(length(f0));
    SEM_f1(i,:)=std(f1,0,2)./sqrt(length(f1));
end

clear f0 f1 f2
for i=1:size(resp_times_post,2)                             % POST-ADAPT
    
    for k=1:size(resp_times_post,1)                         % 1:25
        resp1=squeeze(resp_times_post(k,i,:));              % psth(25x20)
        for j=1:length(resp1)
            [f0(k,j),f1(k,j),f2(k,j)] = get_f1f2(1000*resp1{j},length(resp1{j}),1000,333,667,333);
        end
    end

    resp_f0_post(i,:)=mean(f0,2);
    resp_f1_post(i,:)=mean(f1,2);
    SEM_f0_post(i,:)=std(f0,0,2)./sqrt(length(f0));
    SEM_f1_post(i,:)=std(f1,0,2)./sqrt(length(f1));
end

stopandsave
% save processed data