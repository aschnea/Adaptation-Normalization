%% tune+norm experiment
% to determine the orientation specificity of adaptation's effect on Normalization

% Files:
% 136r001p172-s %SF=1.5 (async)
% 136r001p174-s 
% 136l001p108-s
% 136l001p110-s (async)
% 136l001p121-s %SF=2
% 136l001p123-s %SF=2 (async)

% stimuli:
% 8 tuning stim (22.5° shifts
% 16 gratings/plaids of varying contrast (combinations allow for MI
% calculation)

% Expo Stim IDs:
% 0 is blank
% 1 and 2 are adaptors
% 3-18 are plaids/components
% 19-26 are ori tuning
% 13-14 repeats pre-adaptation, 20 repeats post-adaptation
% pre ends at 640
% post begins at 843
%% Raw Data:
clear
% % spikes=nev_reader('136l001p123-s.nev',0);
% % a=ReadExpoXML('136l001#123[xoric_adapt_tune+norm].xml');
% % spikes=nev_reader('136l001p121-s.nev',0);
% % a=ReadExpoXML('136l001#121[xori_adapt_tune+norm].xml');

% stim=a.passes.BlockIDs;
% uniq_stim=unique(stim);
% syncs=spikes(spikes(:,1)==2000,3);
% % syncs=spikes(spikes(:,1)==2000,:); % for when syncs don't match with stim
% % syncs=syncs(syncs(:,2)==-3,3);
% % syncs=[syncs(1)-diff(syncs(2:3));syncs]; % if missing a sync, verify than do this
% % i = 1:2:length(syncs); % For Scout System
% % syncs=syncs(i); % For Scout System

stopandsave
% save as <pfilename_rawdata>
%% load file
clear
% contingent adapt files
% load('136r001p174_rawdata.mat','spikes','syncs','stim')
% load('136l001p108_rawdata.mat','spikes','syncs','stim')
% load('136l001p121_rawdata.mat','spikes','syncs','stim')

% Interleaved adapt files
% load('136r001p172_rawdata.mat','spikes','syncs','stim')
% load('136l001p110_rawdata.mat','spikes','syncs','stim')
% load('136l001p123_rawdata.mat','spikes','syncs','stim')
%% pre-processing

index=1;
for i=1:96                                                  % # of channels on array
    resp=spikes(spikes(:,1)==i,:);                          % all spikes on elec i
    sort_codes=unique(resp(:,2));                           % unique units on elec i
    sort_codes=sort_codes(sort_codes~=0 & sort_codes~=255);
    for j=1:length(sort_codes)                              % j = # of units on each channel
        resp2=resp(resp(:,2)==sort_codes(j),3);
        for k=1:length(syncs)                               % # of stim pulses
            tmp=find(resp2>syncs(k) & resp2<syncs(k)+1);    % take a 1s epoch for each sync since that is length of stim
            resp_times{index,k}=resp2(tmp)-syncs(k);        % stores relative time of each sync
            resp_count(index,k)=length(tmp);                % stores count of spikes for each epoch
        end
        index=index+1;
    end
end

% chop up by stim:
for i=3:max(stim)                                           % stimulus conditions (starts at 3 usually)
   tmp=find(stim==i);
   tmp=tmp(1:13);                                           % first half of stim repeats (pre-adapt)
   % should be 1:20; fix for next acute
   resp_times_pre(i-2,:,:)=resp_times(:,tmp);
   resp_count_pre(i-2,:,:)=resp_count(:,tmp);
   tmp=find(stim==i);
   tmp=tmp(end-19:end);                                     % second half of stim repeats (post-adapt)
   resp_times_post(i-2,:,:)=resp_times(:,tmp);
   resp_count_post(i-2,:,:)=resp_count(:,tmp);
   % uniq_stim x cells x repeats
end

%% check stim
% looks at tuning curves and CRFs w/ mask to check for sensible resposnes

% figure;
% for e = 1:116
% subplot(1,2,1); hold on % plots tuning stim
% plot(mean(squeeze(resp_count_pre(17:end,e,:)),2),'k-')
% plot(mean(squeeze(resp_count_post(17:end,e,:)),2),'r--')
% title('tuning')
% subplot(1,2,2); hold on % plots plaids
% plot(mean(squeeze(resp_count_pre(1:16,e,:)),2),'k.')
% plot(mean(squeeze(resp_count_post(1:16,e,:)),2),'r.')
% title('plaids')
% pause; clf
% end

%%  compute F0 and F1 for the data

clear f0 f1 f2
% PRE-ADAPT
for i=1:size(resp_times_pre,2)                              % for each unit
    
    for k=1:size(resp_times_pre,1)                          % for each stim (24)
        resp1=squeeze(resp_times_pre(k,i,:));               % psth(24x13)
        for j=1:length(resp1)
            [f0(k,j),f1(k,j),f2(k,j)] = get_f1f2(1000*resp1{j},length(resp1{j}),1000,333,667,333);
        end                             % calculates F0 and F1 for each stimulus repeat then averages them.
    end

    tmp=[mean(f0(5,:),2)-mean(f0(1,:),2) mean(f1(5,:),2) mean(f0(9,:),2)-mean(f0(1,:),2) mean(f1(9,:),2)];
    ind=find(tmp==max(tmp));
    if ind(1)==1 || ind(1)==3           % identifies if mean F0 or F1 is larger and classifies the cell in cell_type
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
% POST-ADAPT
for i=1:size(resp_times_post,2)                             
    
    for k=1:size(resp_times_post,1)
        resp1=squeeze(resp_times_post(k,i,:));
        for j=1:length(resp1)
            [f0(k,j),f1(k,j),f2(k,j)] = get_f1f2(1000*resp1{j},length(resp1{j}),1000,333,667,333);
        end
    end

    resp_f0_post(i,:)=mean(f0,2);
    resp_f1_post(i,:)=mean(f1,2);
    SEM_f0_post(i,:)=std(f0,0,2)./sqrt(length(f0));
    SEM_f1_post(i,:)=std(f1,0,2)./sqrt(length(f1));
end

%% compute normalization strength - Masking Index
% (a-b)/(a+b) where a = area under preferred grating curve; b = area under plaid (test+mask)
% 'a' and 'b' half rectified before metric is computed
% greater area metric values = more normalized; small values = less normalized

clear tmp tmp2
for e = 1:length(cell_type)        % calculates 'AUCt' (first column) and 'AUCtm' (columns 2-5)
    if cell_type(e)==0
        if resp_f0(e,5) > resp_f0(e,9) % 5 and 9 are high contrast grating stim
            if resp_f0(e,5) > resp_f0(e,1)+3*SEM_f0(e,1)
                tmp(e,1) = (trapz(resp_f0(e,1:5))-trapz(resp_f0(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(resp_f0(e,[9 10 11 12 16]))-trapz(resp_f0(e,[9 9 9 9 9])));
                
                tmp2(e,1) = (trapz(resp_f0_post(e,1:5))-trapz(resp_f0_post(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(resp_f0_post(e,[9 10 11 12 16]))-trapz(resp_f0_post(e,[9 9 9 9 9])));
            else    % exclude 'unresponseive' units
                tmp(e,1) = nan;
                tmp(e,2) = nan;
                tmp2(e,1) = nan;
                tmp2(e,2) = nan;
            end
        else
            if resp_f0(e,9) > resp_f0(e,1)+3*SEM_f0(e,1)
                tmp(e,1) = (trapz(resp_f0(e,[1 6 7 8 9]))-trapz(resp_f0(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(resp_f0(e,[5 13 14 15 16]))-trapz(resp_f0(e,[5 5 5 5 5])));
                
                tmp2(e,1) = (trapz(resp_f0_post(e,[1 6 7 8 9]))-trapz(resp_f0_post(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(resp_f0_post(e,[5 13 14 15 16]))-trapz(resp_f0_post(e,[5 5 5 5 5])));
            else
                tmp(e,1) = nan;
                tmp(e,2) = nan;
                tmp2(e,1) = nan;
                tmp2(e,2) = nan;
            end
        end
    else
        if resp_f1(e,5) > resp_f1(e,9)
            if resp_f1(e,5) > resp_f1(e,1)+3*SEM_f1(e,1)
                tmp(e,1) = (trapz(resp_f1(e,1:5))-trapz(resp_f1(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(resp_f1(e,[9 10 11 12 16]))-trapz(resp_f1(e,[9 9 9 9 9])));
                
                tmp2(e,1) = (trapz(resp_f1_post(e,1:5))-trapz(resp_f1_post(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(resp_f1_post(e,[9 10 11 12 16]))-trapz(resp_f1_post(e,[9 9 9 9 9])));
            else
                tmp(e,1) = nan;
                tmp(e,2) = nan;
                tmp2(e,1) = nan;
                tmp2(e,2) = nan;
            end
        else
            if resp_f1(e,9) > resp_f1(e,1)+3*SEM_f1(e,1)
                tmp(e,1) = (trapz(resp_f1(e,[1 6 7 8 9]))-trapz(resp_f1(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(resp_f1(e,[5 13 14 15 16]))-trapz(resp_f1(e,[5 5 5 5 5])));
                
                tmp2(e,1) = (trapz(resp_f1_post(e,[1 6 7 8 9]))-trapz(resp_f1_post(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(resp_f1_post(e,[5 13 14 15 16]))-trapz(resp_f1_post(e,[5 5 5 5 5])));
            else
                tmp(e,1) = nan;
                tmp(e,2) = nan;
                tmp2(e,1) = nan;
                tmp2(e,2) = nan;
            end
        end
    end
end

tmp(tmp<0)=0;                           % removes negative areas
tmp2(tmp2<0)=0;

for e = 1:length(cell_type)             % calculates area metric for each mask contrast
    Area_pre(e) = (tmp(e,1)-tmp(e,2))/(tmp(e,1)+tmp(e,2));
    Area_post(e)= (tmp2(e,1)-tmp2(e,2))/(tmp2(e,1)+tmp2(e,2));
end
for e = 1:length(Area_pre)        % cleans up invalid (nan) responses and makes pre and post # equal
    if Area_pre(e) == -1
        Area_pre(e) = nan;
        Area_post(e)= nan;
    end
    if Area_post(e) == -1
        Area_pre(e) = nan;
        Area_post(e)= nan;
    end
    if isnan(Area_pre(e))
        Area_post(e) = nan;
    end
    if isnan(Area_post(e))
        Area_pre(e) = nan;
    end
end

figure
plot(Area_pre,Area_post,'k.')
refline(1,0)
title('Area Index')


stopandsave
% save as <pfiles_procdata>