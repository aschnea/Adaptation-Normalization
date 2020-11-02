%% combines x-ori and rotated files in to 1 summary figure

%% % % % % % % % rate match Summary and stats % % % % % % %
% % % % % % for matched data
% Figure 5 C D
% CONTINGENT
load('rot_combined2.mat','rm_sync_pre', 'rm_sync_post', 'rm_int_pre', 'rm_int_post');
% append rotated variables with _r
load('model_ws_recent_logl4.mat','rm_sync_pre', 'rm_sync_post', 'rm_int_pre', 'rm_int_post');

clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24

NIrm_mean_sync_pre = nanmean(rm_sync_pre(:));   % mean of all data points, pre
temp1 = [rm_sync_pre(:,1); rm_sync_pre(:,2); rm_sync_pre(:,3); rm_sync_pre(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [rm_sync_pre(:,4); rm_sync_pre(:,6); rm_sync_pre(:,7); rm_sync_pre(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [rm_sync_pre(:,9); rm_sync_pre(:,10); rm_sync_pre(:,11); rm_sync_pre(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [rm_sync_pre(:,13); rm_sync_pre(:,14); rm_sync_pre(:,15); rm_sync_pre(:,16)]; temp4 = temp4(~isnan(temp4));
NIrm_mean_sync_pre_m6 = nanmean(temp1);     % mean of 6% mask, pre
NIrm_mean_sync_pre_m12 = nanmean(temp2);    % 12% mask
NIrm_mean_sync_pre_m25 = nanmean(temp3);    % 25% mask
NIrm_mean_sync_pre_m50 =nanmean(temp4);     % 50% mask

temp21 = [rm_sync_post(:,1); rm_sync_post(:,2); rm_sync_post(:,3); rm_sync_post(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [rm_sync_post(:,4); rm_sync_post(:,6); rm_sync_post(:,7); rm_sync_post(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [rm_sync_post(:,9); rm_sync_post(:,10); rm_sync_post(:,11); rm_sync_post(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [rm_sync_post(:,13); rm_sync_post(:,14); rm_sync_post(:,15); rm_sync_post(:,16)]; temp24 = temp24(~isnan(temp24));
NIrm_mean_sync_post=nanmean(rm_sync_post(:));   % mean of all data points, post
NIrm_mean_sync_post_m6 = nanmean(temp21);       % 6%
NIrm_mean_sync_post_m12 = nanmean(temp22);      % 12%
NIrm_mean_sync_post_m25 = nanmean(temp23);      % 25%
NIrm_mean_sync_post_m50 = nanmean(temp24);      % 50%
NIrm_sync_dif=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];    % difference post-pre

figure
subplot(1,2,1); hold on
a=errorline(0.5,NIrm_mean_sync_post_m6-NIrm_mean_sync_pre_m6,nanstd(temp21-temp1)/sqrt(length(temp1)),'ko');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',5)
a=errorline(1,NIrm_mean_sync_post_m12-NIrm_mean_sync_pre_m12,nanstd(temp22-temp2)/sqrt(length(temp2)),'ko');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',5)
a=errorline(1.5,NIrm_mean_sync_post_m25-NIrm_mean_sync_pre_m25,nanstd(temp23-temp3)/sqrt(length(temp3)),'ko');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',5)
a=errorline(2,NIrm_mean_sync_post_m50-NIrm_mean_sync_pre_m50,nanstd(temp24-temp4)/sqrt(length(temp4)),'ko');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',5)

%  same as above for rotated data:
NIrm_mean_sync_pre_r = nanmean(rm_sync_pre_r(:));
temp1 = [rm_sync_pre_r(:,1); rm_sync_pre_r(:,2); rm_sync_pre_r(:,3); rm_sync_pre_r(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [rm_sync_pre_r(:,4); rm_sync_pre_r(:,6); rm_sync_pre_r(:,7); rm_sync_pre_r(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [rm_sync_pre_r(:,9); rm_sync_pre_r(:,10); rm_sync_pre_r(:,11); rm_sync_pre_r(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [rm_sync_pre_r(:,13); rm_sync_pre_r(:,14); rm_sync_pre_r(:,15); rm_sync_pre_r(:,16)]; temp4 = temp4(~isnan(temp4));
NIrm_mean_sync_pre_m6r = nanmean(temp1);
NIrm_mean_sync_pre_m12r = nanmean(temp2);
NIrm_mean_sync_pre_m25r = nanmean(temp3);
NIrm_mean_sync_pre_m50r =nanmean(temp4);

temp21 = [rm_sync_post_r(:,1); rm_sync_post_r(:,2); rm_sync_post_r(:,3); rm_sync_post_r(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [rm_sync_post_r(:,4); rm_sync_post_r(:,6); rm_sync_post_r(:,7); rm_sync_post_r(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [rm_sync_post_r(:,9); rm_sync_post_r(:,10); rm_sync_post_r(:,11); rm_sync_post_r(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [rm_sync_post_r(:,13); rm_sync_post_r(:,14); rm_sync_post_r(:,15); rm_sync_post_r(:,16)]; temp24 = temp24(~isnan(temp24));
NIrm_mean_sync_postr=nanmean(rm_sync_post_r(:));
NIrm_mean_sync_post_m6r = nanmean(temp21);
NIrm_mean_sync_post_m12r = nanmean(temp22);
NIrm_mean_sync_post_m25r = nanmean(temp23);
NIrm_mean_sync_post_m50r = nanmean(temp24);
NIrm_sync_dif_r=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];

a=errorline(0.6,NIrm_mean_sync_post_m6r-NIrm_mean_sync_pre_m6r,nanstd(temp21-temp1)/sqrt(length(temp1)),'kx');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',9)
a=errorline(1.1,NIrm_mean_sync_post_m12r-NIrm_mean_sync_pre_m12r,nanstd(temp22-temp2)/sqrt(length(temp2)),'kx');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',9)
a=errorline(1.6,NIrm_mean_sync_post_m25r-NIrm_mean_sync_pre_m25r,nanstd(temp23-temp3)/sqrt(length(temp3)),'kx');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',9)
a=errorline(2.1,NIrm_mean_sync_post_m50r-NIrm_mean_sync_pre_m50r,nanstd(temp24-temp4)/sqrt(length(temp4)),'kx');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',9)
plot([0.4 2.2],[0 0],'k--')
xlabel('Mask Contrast')
ylabel('Mean NI Difference')
xlim([0.4 2.2])
ylim([-.5 1])
axis square
title('Contingent')
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})

% ASYNCHRONOUS
clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24
NIrm_mean_int_pre = nanmean(rm_int_pre(:));

temp1 = [rm_int_pre(:,1); rm_int_pre(:,2); rm_int_pre(:,3); rm_int_pre(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [rm_int_pre(:,4); rm_int_pre(:,6); rm_int_pre(:,7); rm_int_pre(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [rm_int_pre(:,9); rm_int_pre(:,10); rm_int_pre(:,11); rm_int_pre(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [rm_int_pre(:,13); rm_int_pre(:,14); rm_int_pre(:,15); rm_int_pre(:,16)]; temp4 = temp4(~isnan(temp4));
NIrm_mean_int_pre_m6 = nanmean(temp1);
NIrm_mean_int_pre_m12 = nanmean(temp2);
NIrm_mean_int_pre_m25 = nanmean(temp3);
NIrm_mean_int_pre_m50 =nanmean(temp4);

temp21 = [rm_int_post(:,1); rm_int_post(:,2); rm_int_post(:,3); rm_int_post(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [rm_int_post(:,4); rm_int_post(:,6); rm_int_post(:,7); rm_int_post(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [rm_int_post(:,9); rm_int_post(:,10); rm_int_post(:,11); rm_int_post(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [rm_int_post(:,13); rm_int_post(:,14); rm_int_post(:,15); rm_int_post(:,16)]; temp24 = temp24(~isnan(temp24));

NIrm_mean_int_post=nanmean(rm_int_post(:));
NIrm_mean_int_post_m6 = nanmean(temp21);
NIrm_mean_int_post_m12 = nanmean(temp22);
NIrm_mean_int_post_m25 = nanmean(temp23);
NIrm_mean_int_post_m50 = nanmean(temp24);
NIrm_int_dif=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];

subplot(1,2,2); hold on
a=errorline(0.5,NIrm_mean_int_post_m6-NIrm_mean_int_pre_m6,nanstd(temp21-temp1)/sqrt(length(temp1)),'ko');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',5)
a=errorline(1,NIrm_mean_int_post_m12-NIrm_mean_int_pre_m12,nanstd(temp22-temp2)/sqrt(length(temp2)),'ko');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',5)
a=errorline(1.5,NIrm_mean_int_post_m25-NIrm_mean_int_pre_m25,nanstd(temp23-temp3)/sqrt(length(temp3)),'ko');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',5)
a=errorline(2,NIrm_mean_int_post_m50-NIrm_mean_int_pre_m50,nanstd(temp24-temp4)/sqrt(length(temp4)),'ko');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',5)

NIrm_mean_int_pre_r = nanmean(rm_int_pre_r(:));
temp1 = [rm_int_pre_r(:,1); rm_int_pre_r(:,2); rm_int_pre_r(:,3); rm_int_pre_r(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [rm_int_pre_r(:,4); rm_int_pre_r(:,6); rm_int_pre_r(:,7); rm_int_pre_r(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [rm_int_pre_r(:,9); rm_int_pre_r(:,10); rm_int_pre_r(:,11); rm_int_pre_r(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [rm_int_pre_r(:,13); rm_int_pre_r(:,14); rm_int_pre_r(:,15); rm_int_pre_r(:,16)]; temp4 = temp4(~isnan(temp4));
NIrm_mean_int_pre_m6r = nanmean(temp1);
NIrm_mean_int_pre_m12r = nanmean(temp2);
NIrm_mean_int_pre_m25r = nanmean(temp3);
NIrm_mean_int_pre_m50r =nanmean(temp4);

temp21 = [rm_int_post_r(:,1); rm_int_post_r(:,2); rm_int_post_r(:,3); rm_int_post_r(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [rm_int_post_r(:,4); rm_int_post_r(:,6); rm_int_post_r(:,7); rm_int_post_r(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [rm_int_post_r(:,9); rm_int_post_r(:,10); rm_int_post_r(:,11); rm_int_post_r(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [rm_int_post_r(:,13); rm_int_post_r(:,14); rm_int_post_r(:,15); rm_int_post_r(:,16)]; temp24 = temp24(~isnan(temp24));
NIrm_mean_int_postr=nanmean(rm_int_post_r(:));
NIrm_mean_int_post_m6r = nanmean(temp21);
NIrm_mean_int_post_m12r = nanmean(temp22);
NIrm_mean_int_post_m25r = nanmean(temp23);
NIrm_mean_int_post_m50r = nanmean(temp24);
NIrm_int_dif_r=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];

a=errorline(0.6,NIrm_mean_int_post_m6r-NIrm_mean_int_pre_m6r,nanstd(temp21-temp1)/sqrt(length(temp1)),'kx');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',9)
a=errorline(1.1,NIrm_mean_int_post_m12r-NIrm_mean_int_pre_m12r,nanstd(temp22-temp2)/sqrt(length(temp2)),'kx');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',9)
a=errorline(1.6,NIrm_mean_int_post_m25r-NIrm_mean_int_pre_m25r,nanstd(temp23-temp3)/sqrt(length(temp3)),'kx');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',9)
a=errorline(2.1,NIrm_mean_int_post_m50r-NIrm_mean_int_pre_m50r,nanstd(temp24-temp4)/sqrt(length(temp4)),'kx');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',9)
plot([0.4 2.2],[0 0],'k--')
xlabel('Mask Contrast')
ylabel('Mean NI Difference')
xlim([0.4 2.2])
ylim([-.5 1])
axis square
title('Asynchronous')
supertitle('rate-match summary: cirlce = xori, x=rotated')
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})


%% Area metric summary
load('rot_combined2.mat', 'Area_post_int1', 'Area_post_int2', 'Area_post_int3', 'Area_post_int4', 'Area_post_sync1',...
    'Area_post_sync2', 'Area_post_sync3', 'Area_post_sync4', 'Area_pre_int1', 'Area_pre_int2', 'Area_pre_int3',...
    'Area_pre_int4', 'Area_pre_sync1', 'Area_pre_sync2', 'Area_pre_sync3', 'Area_pre_sync4');
load('rot_combined2.mat', 'Area_mean_int', 'Area_mean_int_post', 'Area_mean_sync', 'Area_mean_sync_post')
% append rotated variables with r
load('model_ws_recent_logl4.mat', 'Area_mean_int', 'Area_mean_int_post', 'Area_mean_sync', 'Area_mean_sync_post',...
    'Area_post_int1', 'Area_post_int2', 'Area_post_int3', 'Area_post_int4', 'Area_post_sync1', 'Area_post_sync2',...
    'Area_post_sync3', 'Area_post_sync4', 'Area_pre_int1', 'Area_pre_int2', 'Area_pre_int3', 'Area_pre_int4',...
    'Area_pre_sync1', 'Area_pre_sync2', 'Area_pre_sync3', 'Area_pre_sync4')

figure
subplot(1,2,1); hold on
tmp=Area_post_sync4-Area_pre_sync4;
a=errorline(0.5,Area_mean_sync_post(4)-Area_mean_sync(4),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_sync3-Area_pre_sync3;
a=errorline(1,Area_mean_sync_post(3)-Area_mean_sync(3),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_sync2-Area_pre_sync2;
a=errorline(1.5,Area_mean_sync_post(2)-Area_mean_sync(2),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_sync1-Area_pre_sync1;
a=errorline(2,Area_mean_sync_post(1)-Area_mean_sync(1),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
plot([0.4 2.1],[0 0],'k--')
xlabel('Mask Contrast')
ylabel('Mean AM Difference')
xlim([0.4 2.1])
ylim([-0.6 0.3])
title('Contingent')
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})
axis square
subplot(1,2,2); hold on
tmp=Area_post_int4-Area_pre_int4;
a=errorline(0.5,Area_mean_int_post(4)-Area_mean_int(4),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_int3-Area_pre_int3;
a=errorline(1,Area_mean_int_post(3)-Area_mean_int(3),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_int2-Area_pre_int2;
a=errorline(1.5,Area_mean_int_post(2)-Area_mean_int(2),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_int1-Area_pre_int1;
a=errorline(2,Area_mean_int_post(1)-Area_mean_int(1),nanstd(tmp(:))/sqrt(length(tmp)),'ko');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
plot([0.4 2.1],[0 0],'k--')
xlim([0.4 2.1])
ylim([-0.6 0.3])
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})
axis square
title('Asynchronous')

subplot(1,2,1); hold on
tmp=Area_post_sync4r-Area_pre_sync4r;
a=errorline(0.5,Area_mean_sync_postr(4)-Area_mean_syncr(4),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_sync3r-Area_pre_sync3r;
a=errorline(1,Area_mean_sync_postr(3)-Area_mean_syncr(3),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_sync2r-Area_pre_sync2r;
a=errorline(1.5,Area_mean_sync_postr(2)-Area_mean_syncr(2),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_sync1r-Area_pre_sync1r;
a=errorline(2,Area_mean_sync_postr(1)-Area_mean_syncr(1),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])

subplot(1,2,2); hold on
tmp=Area_post_int4r-Area_pre_int4r;
a=errorline(0.5,Area_mean_int_postr(4)-Area_mean_intr(4),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_int3r-Area_pre_int3r;
a=errorline(1,Area_mean_int_postr(3)-Area_mean_intr(3),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_int2r-Area_pre_int2r;
a=errorline(1.5,Area_mean_int_postr(2)-Area_mean_intr(2),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])
tmp=Area_post_int1r-Area_pre_int1r;
a=errorline(2,Area_mean_int_postr(1)-Area_mean_intr(1),nanstd(tmp(:))/sqrt(length(tmp)),'ro');
set(a,'MarkerSize',5,'MarkerFaceColor',[0 0 0])

%% statistical difference between AM matched vs AM rotated

[t_AM_6_c, p_AM_6_c] = ttest2(Area_post_sync1-Area_pre_sync4,Area_post_sync1r-Area_pre_sync4r);
[t_AM_12_c, p_AM_12_c] = ttest2(Area_post_sync2-Area_pre_sync3,Area_post_sync2r-Area_pre_sync3r);
[t_AM_25_c, p_AM_25_c] = ttest2(Area_post_sync3-Area_pre_sync2,Area_post_sync3r-Area_pre_sync2r);
[t_AM_50_c, p_AM_50_c] = ttest2(Area_post_sync4-Area_pre_sync1,Area_post_sync4r-Area_pre_sync1r);

[t_AM_6_a, p_AM_6_a] = ttest2(Area_post_int1-Area_pre_int4,Area_post_int1r-Area_pre_int4r);
[t_AM_12_a, p_AM_12_a] = ttest2(Area_post_int2-Area_pre_int3,Area_post_int2r-Area_pre_int3r);
[t_AM_25_a, p_AM_25_a] = ttest2(Area_post_int3-Area_pre_int2,Area_post_int3r-Area_pre_int2r);
[t_AM_50_a, p_AM_50_a] = ttest2(Area_post_int4-Area_pre_int1,Area_post_int4r-Area_pre_int1r);