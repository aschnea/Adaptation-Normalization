%% test and adaptor are matched:
% load Area metric from combined_xori_data
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
clear MI_sync_sampled MI_int_sampled
figure
histogram(Area_pre_int4,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync4,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync4; Area_post_sync4];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,1,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,3,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,36,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,94,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,38,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,6,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,2,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,2,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int4; Area_post_int4];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,1,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,3,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,36,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,94,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,38,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,6,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,2,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,2,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square
supertitle('6%')

i1m=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b1m=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s1m=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c1m=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));

clear MI_sync_sampled MI_int_sampled
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
figure
histogram(Area_pre_int3,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync3,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync3; Area_post_sync3];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,2,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,4,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,25,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,80,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,46,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,8,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,8,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,3,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int3; Area_post_int3];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,2,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,4,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,25,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,80,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,46,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,8,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,8,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,3,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square

i2m=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b2m=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s2m=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c2m=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));

clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
figure
histogram(Area_pre_int2,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync2,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync2; Area_post_sync2];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,3,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,6,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,23,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,45,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,62,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,25,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,11,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,12,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int2; Area_post_int2];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,3,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,6,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,23,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,45,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,62,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,25,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,11,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,12,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square

i3m=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b3m=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s3m=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c3m=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));

clear MI_sync_sampled MI_int_sampled
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
figure
histogram(Area_pre_int1,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync1,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync1; Area_post_sync1];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,4,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,8,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,17,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,36,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,49,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,34,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,43,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int1; Area_post_int1];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,4,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,8,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,17,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,36,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,49,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,34,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,43,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square

i4m=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b4m=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s4m=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c4m=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));
stop
%% test is rotated from adaptor
% load MI from combined_rotated
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
clear MI_sync_sampled MI_int_sampled
figure
histogram(Area_pre_int4,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync4,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync4; Area_post_sync4];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,1,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,43,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,54,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,11,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,4,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,2,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,3,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int4; Area_post_int4];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,1,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,43,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,54,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,11,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,4,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,2,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,3,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square
supertitle('6%')

i1=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b1=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s1=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c1=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));

clear MI_sync_sampled MI_int_sampled
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
figure
histogram(Area_pre_int3,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync3,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync3; Area_post_sync3];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,3,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,19,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,52,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,25,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,9,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,5,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,5,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int3; Area_post_int3];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,3,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,19,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,52,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,25,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,9,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,5,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,5,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square

i2=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b2=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s2=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c2=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));

clear MI_sync_sampled MI_int_sampled
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
figure
histogram(Area_pre_int2,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync2,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync2; Area_post_sync2];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,1,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,1,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,20,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,37,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,32,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,13,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,7,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,6,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int2; Area_post_int2];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,1,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,1,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,20,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,37,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,32,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,13,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,7,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,6,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square

i3=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b3=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s3=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c3=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));

clear MI_sync_sampled MI_int_sampled
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
figure
histogram(Area_pre_int1,-1:0.1:1)
title('asynch')
figure
histogram(Area_pre_sync1,-1:0.1:1)
title('contingent')
% samples for matched:
tmp=[Area_pre_sync1; Area_post_sync1];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,1,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,7,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,29,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,40,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,18,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,10,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,13,2,'Replace',false);  
MI_sync_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8
tmp=[Area_pre_int1; Area_post_int1];
tmp1=tmp(:,tmp(1,:)<-0.4);
temp1=datasample(tmp1,0,2,'Replace',false);
tmp2=tmp(:,tmp(1,:)>=-0.4 & tmp(1,:)<-0.2);
temp2=datasample(tmp2,1,2,'Replace',false);  
tmp3=tmp(:,tmp(1,:)>=-0.2 & tmp(1,:)<0);
temp3=datasample(tmp3,7,2,'Replace',false);  
tmp4=tmp(:,tmp(1,:)>=0 & tmp(1,:)<0.2);
temp4=datasample(tmp4,29,2,'Replace',false);  
tmp5=tmp(:,tmp(1,:)>=0.2 & tmp(1,:)<0.4);
temp5=datasample(tmp5,40,2,'Replace',false);  
tmp6=tmp(:,tmp(1,:)>=0.4 & tmp(1,:)<0.6);
temp6=datasample(tmp6,18,2,'Replace',false);  
tmp7=tmp(:,tmp(1,:)>=0.6 & tmp(1,:)<0.8);
temp7=datasample(tmp7,10,2,'Replace',false);  
tmp8=tmp(:,tmp(1,:)>=0.8);
temp8=datasample(tmp8,13,2,'Replace',false);  
% stop
MI_int_sampled=[temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8];
figure; 
subplot(121); hold on
histogram(MI_int_sampled(2,:)-MI_int_sampled(1,:),'FaceColor','b')
title('Asynchronous')
supertitle('matched MI control')
ylabel('# of units')
xlabel('change in MI (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,60],'k--')
subplot(122); hold on
histogram(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),'FaceColor','g')
title('Contingent')
xlabel('change in MI (post-pre)')
plot([0 0],[0,60],'k--')
xlim([-2 2])
axis square

i4=mean(MI_int_sampled(2,:)-MI_int_sampled(1,:));
b4=std(MI_int_sampled(2,:)-MI_int_sampled(1,:))/sqrt(length(MI_int_sampled));
s4=mean(MI_sync_sampled(2,:)-MI_sync_sampled(1,:));
c4=std(MI_sync_sampled(2,:)-MI_sync_sampled(1,:))/sqrt(length(MI_sync_sampled));
[t_samp, p_samp]=ttest(MI_sync_sampled(2,:)-MI_sync_sampled(1,:),MI_int_sampled(2,:)-MI_int_sampled(1,:));
%%
figure
subplot(211)
hold on
errorline([s1m s2m s3m s4m],[c1m c2m c3m c4m],'g')
errorline([i1m i2m i3m i4m],[b1m b2m b3m b4m],'b')
plot([1 4],[0 0],'k--')
axis square
ylabel('d Masking Index (post-pre)')
set(gca,'TickDir','out')
subplot(212)
hold on
errorline([s1 s2 s3 s4],[c1 c2 c3 c4],'g')
errorline([i1 i2 i3 i4],[b1 b2 b3 b4],'b')
plot([1 4],[0 0],'k--')
axis square
ylabel('d Masking Index (post-pre)')
xlabel('Mask contrast (%)')
set(gca,'TickDir','out')