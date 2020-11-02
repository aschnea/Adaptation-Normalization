%% MI recovery
% Figure 8

% separate masking index by file to look at pre levels
% MI1 = [Area_pre_sync2(1:102); Area_post_sync2(1:102)];
% MI2 = [Area_pre_int2(1:97); Area_post_int2(1:97)];
% MI3 = [Area_pre_sync2(103:241); Area_post_sync2(103:241)];
% MI4 = [Area_pre_int2(98:242); Area_post_int2(98:242)];
% MI5 = [Area_pre_int2(243:366); Area_post_int2(243:366)];
% MI6 = [Area_pre_sync2(242:351); Area_post_sync2(242:351)];
% MI7 = [Area_pre_sync2(352:377); Area_post_sync2(352:377)];
% MI8 = [Area_pre_int2(367:390); Area_post_int2(367:390)];
% MI9 = [Area_pre_sync2(378:522); Area_post_sync2(378:522)];
% MI10 = [Area_pre_int2(390:526); Area_post_int2(390:526)];

% for sorted together:
MI1 = [Area_pre_sync2(1:77); Area_post_sync2(1:77)];
MI2 = [Area_pre_int2(1:78); Area_post_int2(1:78)];
MI3 = [Area_pre_sync2(78:183); Area_post_sync2(78:183)];
MI4 = [Area_pre_int2(79:242); Area_post_int2(79:242)];
MI5 = [Area_pre_int2(185:270); Area_post_int2(185:270)];
MI6 = [Area_pre_sync2(184:266); Area_post_sync2(184:266)];
MI7 = [Area_pre_sync2(267:279); Area_post_sync2(267:279)];
MI8 = [Area_pre_int2(271:283); Area_post_int2(271:283)];
MI9 = [Area_pre_sync2(280:end); Area_post_sync2(280:end)];
MI10 = [Area_pre_int2(284:end); Area_post_int2(284:end)];


figure
hold on
% plot([1.0 2 3],[nanmean(MI1(1,:)) nanmean(MI1(2,:)) nanmean(MI2(1,:))],'go-')
% plot([1.02 2.02 3.02],[nanmean(MI3(1,:)) nanmean(MI3(2,:)) nanmean(MI4(1,:))],'go-')
errorline([1.04 2.04 3.04],[nanmean(MI5(1,:))./nanmean(MI5(1,:))*100 nanmean(MI5(2,:))./nanmean(MI5(1,:))*100 nanmean(MI6(1,:))./nanmean(MI5(1,:))*100],...
    [nanstd(MI5(1,:))/sqrt(length(MI5)) nanstd(MI5(2,:))/sqrt(length(MI5)) nanstd(MI6(1,:))/sqrt(length(MI6))],'bo-')
% plot([1.06 2.06 3.06],[nanmean(MI7(1,:)) nanmean(MI7(2,:)) nanmean(MI8(1,:))],'go-')
% plot([1.08 2.08 3.08],[nanmean(MI9(1,:)) nanmean(MI9(2,:)) nanmean(MI10(1,:))],'go-')
tmp=[MI1 MI3 MI7 MI9]; tmp=tmp(:,~isnan(tmp(1,:)));
tmp2=[MI2 MI4 MI8 MI10]; tmp2=tmp2(:,~isnan(tmp2(1,:)));
errorline([1 2 3],[nanmean(tmp(1,:))./nanmean(tmp(1,:))*100 nanmean(tmp(2,:))./nanmean(tmp(1,:))*100 nanmean(tmp2(1,:))./nanmean(tmp(1,:))*100],[nanstd(tmp(1,:))/sqrt(length(tmp)) nanstd(tmp(2,:))/sqrt(length(tmp)) nanstd(tmp2(1,:))/sqrt(length(tmp2))],'ko-')
xlabel('Adapt condition')
ylabel('MI')
xlim([0.7 3.5])
set(gca,'TickDir','out','XTick',[1 2 3],'XTickLabel','pre')
axis square

[t_prepre_c p_prepre_c] = ttest2(tmp(1,:),tmp2(1,:));
[t_postpre_c p_postpre_c] = ttest2(tmp(2,:),tmp2(1,:));
nanmean(tmp(1,:))
nanmean(tmp(2,:))
nanmean(tmp2(1,:))
[t_prepre_a p_prepre_a] = ttest2(MI5(1,:),MI6(1,:));
[t_postpre_a p_postpre_a] = ttest2(MI5(2,:),MI6(1,:));
nanmean(MI5(1,:))
nanmean(MI5(2,:))
nanmean(MI6(1,:))

figure
hold on
errorline([1.04 2.04 3.04],[nanmean(Area_pre_int2)./nanmean(Area_pre_int2)*100 nanmean(Area_post_int2)./nanmean(Area_pre_int2)*100 ...
    nanmean(MI6(1,:))./nanmean(Area_pre_int2)*100],...
    [nanstd(Area_pre_int2)/sqrt(length(Area_pre_int2)) nanstd(Area_post_int2)/sqrt(length(Area_pre_int2)) nanstd(MI6(1,:))/sqrt(length(MI6))],'bo-')
tmp=[MI1 MI3 MI7 MI9]; tmp=tmp(:,~isnan(tmp(1,:)));
tmp2=[MI2 MI4 MI8 MI10]; tmp2=tmp2(:,~isnan(tmp2(1,:)));
errorline([1 2 3],[nanmean(Area_pre_sync2)/nanmean(Area_pre_sync2)*100 nanmean(Area_post_sync2)/nanmean(Area_pre_sync2)*100 ...
    nanmean(tmp2(1,:))/nanmean(Area_pre_sync2)*100],[nanstd(Area_pre_sync2)/sqrt(length(Area_pre_sync2))...
    nanstd(Area_post_sync2)/sqrt(length(Area_pre_sync2)) nanstd(tmp2(1,:))/sqrt(length(tmp2))],'ko-')
xlabel('Adapt condition')
ylabel('MI')
xlim([0.7 3.5])
set(gca,'TickDir','out','XTick',[1 2 3],'XTickLabel','pre')
axis square

figure
hold on
% plot([1.0 2 3],[nanmean(MI1(1,:)) nanmean(MI1(2,:)) nanmean(MI2(1,:))],'go-')
% plot([1.02 2.02 3.02],[nanmean(MI3(1,:)) nanmean(MI3(2,:)) nanmean(MI4(1,:))],'go-')
errorline([1.04 2.04 3.04],[nanmean(MI5(1,:)) nanmean(MI5(2,:)) nanmean(MI6(1,:))],...
    [nanstd(MI5(1,:))/sqrt(length(MI5)) nanstd(MI5(2,:))/sqrt(length(MI5)) nanstd(MI6(1,:))/sqrt(length(MI6))],'bo-')
% plot([1.06 2.06 3.06],[nanmean(MI7(1,:)) nanmean(MI7(2,:)) nanmean(MI8(1,:))],'go-')
% plot([1.08 2.08 3.08],[nanmean(MI9(1,:)) nanmean(MI9(2,:)) nanmean(MI10(1,:))],'go-')
tmp=[MI1 MI3 MI7 MI9]; tmp=tmp(:,~isnan(tmp(1,:)));
tmp2=[MI2 MI4 MI8 MI10]; tmp2=tmp2(:,~isnan(tmp2(1,:)));
errorline([1 2 3],[nanmean(tmp(1,:)) nanmean(tmp(2,:)) nanmean(tmp2(1,:))],[nanstd(tmp(1,:))/sqrt(length(tmp)) nanstd(tmp(2,:))/sqrt(length(tmp)) nanstd(tmp2(1,:))/sqrt(length(tmp2))],'go-')
xlabel('Adapt condition')
ylabel('MI')
xlim([0.7 3.5])
set(gca,'TickDir','out','XTick',[1 2 3],'XTickLabel','pre')
axis square

[t_prepre_c p_prepre_c] = ttest2(tmp(1,:),tmp2(1,:));
[t_postpre_c p_postpre_c] = ttest2(tmp(2,:),tmp2(1,:));
nanmean(tmp(1,:))
nanmean(tmp(2,:))
nanmean(tmp2(1,:))
[t_prepre_a p_prepre_a] = ttest2(MI5(1,:),MI6(1,:));
[t_postpre_a p_postpre_a] = ttest2(MI5(2,:),MI6(1,:));
nanmean(MI5(1,:))
nanmean(MI5(2,:))
nanmean(MI6(1,:))

figure
hold on
errorline([1.04 2.04 3.04],[nanmean(Area_pre_int2) nanmean(Area_post_int2) ...
    nanmean(MI6(1,:))],[nanstd(Area_pre_int2)/sqrt(length(Area_pre_int2))...
    nanstd(Area_post_int2)/sqrt(length(Area_pre_int2)) nanstd(MI6(1,:))/sqrt(length(MI6))],'bo-')
tmp=[MI1 MI3 MI7 MI9]; tmp=tmp(:,~isnan(tmp(1,:)));
tmp2=[MI2 MI4 MI8 MI10]; tmp2=tmp2(:,~isnan(tmp2(1,:)));
errorline([1 2 3],[nanmean(Area_pre_sync2) nanmean(Area_post_sync2) ...
    nanmean(tmp2(1,:))],[nanstd(Area_pre_sync2)/sqrt(length(Area_pre_sync2))...
    nanstd(Area_post_sync2)/sqrt(length(Area_pre_sync2)) nanstd(tmp2(1,:))/sqrt(length(tmp2))],'go-')
xlabel('Adapt condition')
ylabel('MI')
xlim([0.7 3.5])
set(gca,'TickDir','out','XTick',[1 2 3],'XTickLabel','pre')
axis square