%% f1/f0 ratio vs pre-adapt MI
% Figure 4A
% load Fratio and Area from combined_xori

figure
subplot(121); hold on
plot(Fratio_sync,Area_pre_sync2,'g.')
plot(geomean(Fratio_sync(~isnan(Area_pre_sync2))),nanmean(Area_pre_sync2),'rx')
axis square
xlabel('F1/F0 ratio')
ylabel('Masking Index (pre)')
plot([1 1],[-1 1],'k--')
plot([0.01 100],[0 0],'k--')
set(gca,'Xscale','log')
subplot(122); hold on
plot(Fratio_int,Area_pre_int2,'b.')
plot(geomean(Fratio_int(~isnan(Area_pre_int2))),nanmean(Area_pre_int2),'rx')
axis square
plot([1 1],[-1 1],'k--')
plot([0.01 100],[0 0],'k--')
set(gca,'Xscale','log')
supertitle('F1/F0 ratio vs MI pre')

%% masking and gain change as a function of orientation preference
% Figure 4 B and C
% load oripref_pre and AM_diff from tunenorm_combined

figure
subplot(121); hold on
plot(oripref_pre_c,AM_diff_c,'k.')
plot([-90 90],[0 0],'k--')
ylim([-2 2])
title('Contingent adaptation')
xlabel('Ori pref')
ylabel('delta Masking Index')
axis square
subplot(122); hold on
plot(oripref_pre_a,AM_diff_a,'k.')
plot([-90 90],[0 0],'k--')
ylim([-2 2])
title('Asynchronous adaptation')
axis square
supertitle('nonpicky')