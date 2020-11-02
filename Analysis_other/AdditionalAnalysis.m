%% alternate figures
% variations and additional metrics
% load combined_xori_data workspace

%% rate matching the rate match
% computes rate-match SI but samples only units from asynch and contingent
% with approximately equal firing rates before adaptation

clear e i rmrm_post_int
i=1;
for e = 1:length(cell_type_int)
    if ~isnan(rm_int_post(e,16))
        if cell_type_int(e)==0
            rmrm_post_int(i)=geomean([f0_post_int(e,5) f0_post_int(e,21)]);
            i=i+1;
        else
            rmrm_post_int(i)=geomean([f1_post_int(e,5) f1_post_int(e,21)]);
            i=i+1;
        end
    end
end
figure
histogram(rmrm_post_int,0:10:140)
figure
histogram(rmrm_post_int,0:5:50)

i=1;
for e = 1:length(cell_type_sync)
    for f = 1:16
        if ~isnan(rm_sync_post(e,f))
            switch f
                case 1
                    nn=1;
                    oo=1;
                case 2
                    nn=2;
                    oo=1;
                case 3
                    nn=3;
                    oo=1;
                case 4
                    nn=4;
                    oo=1;
                case 5
                    nn=1;
                    oo=2;
                case 6
                    nn=2;
                    oo=2;
                case 7
                    nn=3;
                    oo=2;
                case 8
                    nn=4;
                    oo=2;
                case 9
                    nn=1;
                    oo=3;
                case 10
                    nn=2;
                    oo=3;
                case 11
                    nn=3;
                    oo=3;
                case 12
                    nn=4;
                    oo=3;
                case 13
                    nn=1;
                    oo=4;
                case 14
                    nn=2;
                    oo=4;
                case 15
                    nn=3;
                    oo=4;
                case 16
                    nn=4;
                    oo=4;
            end
            if cell_type_sync(e)==0
                rmrm_sync(i,1)=geomean([f0_post_sync(e,nn) f0_post_sync(e,5*oo+1)]);
            else
                rmrm_sync(i,1)=geomean([f1_post_sync(e,nn) f1_post_sync(e,5*oo+1)]);
            end
            rmrm_sync(i,2)=rm_sync_post(e,f);
            rmrm_sync(i,3)=rm_sync_pre(e,f);
            i=i+1;
        end
    end
end
figure
histogram(rmrm_sync(:,1),0:10:100)

tmp1=rmrm_sync(rmrm_sync(:,1)<5,:);
temp1=datasample(tmp1,14,'Replace',false); 
tmp2=rmrm_sync(rmrm_sync(:,1)>=5 & rmrm_sync(:,1)<10,:);
temp2=datasample(tmp2,9,'Replace',false); 
tmp3=rmrm_sync(rmrm_sync(:,1)>=10 & rmrm_sync(:,1)<15,:);
temp3=datasample(tmp3,9,'Replace',false); 
tmp4=rmrm_sync(rmrm_sync(:,1)>=15 & rmrm_sync(:,1)<20,:);
temp4=datasample(tmp4,9,'Replace',false); 
tmp5=rmrm_sync(rmrm_sync(:,1)>=20 & rmrm_sync(:,1)<25,:);
temp5=datasample(tmp5,9,'Replace',false);
tmp6=rmrm_sync(rmrm_sync(:,1)>=25 & rmrm_sync(:,1)<30,:);
temp6=datasample(tmp6,1,'Replace',false); 
tmp7=rmrm_sync(rmrm_sync(:,1)>=30 & rmrm_sync(:,1)<35,:);
temp7=datasample(tmp7,4,'Replace',false); 
tmp8=rmrm_sync(rmrm_sync(:,1)>=35 & rmrm_sync(:,1)<40,:);
temp8=datasample(tmp8,2,'Replace',false); 
tmp9=rmrm_sync(rmrm_sync(:,1)>=40,:);
temp9=datasample(tmp9,4,'Replace',false);
rmrm_sync_sampled=[temp1(:,2:3); temp2(:,2:3); temp3(:,2:3); temp4(:,2:3);...
    temp5(:,2:3); temp6(:,2:3); temp7(:,2:3); temp8(:,2:3); temp9(:,2:3)];

figure; 
subplot(121); hold on
histogram(rm_int_post(:,16)-rm_int_pre(:,16))
title('Asynch')
supertitle('rate match rate match')
ylabel('# of units')
xlabel('change in SIrm (post-pre)')
xlim([-2 2])
axis square
plot([0 0],[0,25],'k--')
subplot(122); hold on
histogram(rmrm_sync_sampled(:,1)-rmrm_sync_sampled(:,2))
title('Contingent')
xlabel('change in SIrm (post-pre)')
plot([0 0],[0,25],'k--')
xlim([-2 2])
axis square

%% Orientation Selectivity vs MI

figure;
for e = 1:length(cell_type_sync)
    if cell_type_sync(e)==0
        if f0_pre_sync(e,5)>f0_pre_sync(e,21)
            subplot(121); hold on
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_post_sync1(e)-Area_pre_sync1(e),'r.')
        else
            subplot(121); hold on
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_post_sync1(e)-Area_pre_sync1(e),'r.')
        end
    else
        if f1_pre_sync(e,5)>f1_pre_sync(e,21)
            subplot(121); hold on
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_post_sync1(e)-Area_pre_sync1(e),'r.')
        else
            subplot(121); hold on
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_post_sync1(e)-Area_pre_sync1(e),'r.')
        end
    end
end
supertitle('Change in Area metric as a function of OS')
subplot(121); hold on
title('synchronous')
xlabel('OS')
ylabel('Change in Area Metric (post-pre)')

for e = 1:length(cell_type_int)
    if cell_type_int(e)==0
        if f0_pre_int(e,5)>f0_pre_int(e,21)
            subplot(122); hold on
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_post_int1(e)-Area_pre_int1(e),'r.')
        else
            subplot(122); hold on
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_post_int1(e)-Area_pre_int1(e),'r.')
        end
    else
        if f1_pre_int(e,5)>f1_pre_int(e,21)
            subplot(122); hold on
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_post_int1(e)-Area_pre_int1(e),'r.')
        else
            subplot(122); hold on
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_post_int1(e)-Area_pre_int1(e),'r.')
        end
    end
end
subplot(121); axis square; refline(0,0); subplot(122); axis square; refline(0,0)
% subplot(2,5,6); hold on
title('Interleaved')

%% orientation selectivity vs SI
% OS (ratio of Mask/Test) vs change in SI (rate match)

idx=1; clear tmp tmp2
for e = 1:length(cell_type_sync)
%     if fit_qual_pre_sync(e) > 0.7 && fit_qual_post_sync(e) >0.7
        if cell_type_sync(e)==0
            if f0_pre_sync(e,5) > f0_pre_sync(e,21)
                tmp(idx,1:4)=1-(f0_pre_sync(e,21)-f0_pre_sync(e,1))/(f0_pre_sync(e,5)-f0_pre_sync(e,1));
                tmp2(idx,1:4)=(rm_sync_post(e,16))-(rm_sync_pre(e,16));
                idx=idx+1;
            else
                tmp(idx,1:4)=1-(f0_pre_sync(e,5)-f0_pre_sync(e,1))/(f0_pre_sync(e,21)-f0_pre_sync(e,1));
                tmp2(idx,1:4)=(rm_sync_post(e,16))-(rm_sync_pre(e,16));
                idx=idx+1;
            end
        else
            if f1_pre_sync(e,5) > f1_pre_sync(e,21)
                tmp(idx,1:4)=1-(f1_pre_sync(e,21)-f1_pre_sync(e,1))/(f1_pre_sync(e,5)-f1_pre_sync(e,1));
                tmp2(idx,1:4)=(rm_sync_post(e,16))-(rm_sync_pre(e,16));
                idx=idx+1;
            else
                tmp(idx,1:4)=1-(f1_pre_sync(e,5)-f1_pre_sync(e,1))/(f1_pre_sync(e,21)-f1_pre_sync(e,1));
                tmp2(idx,1:4)=(rm_sync_post(e,16))-(rm_sync_pre(e,16));
                idx=idx+1;
            end
        end
%     end
end
tmp=tmp(~isnan(tmp2));
tmp2=tmp2(~isnan(tmp2));
% subplot(2,4,4); hold on
figure; subplot(1,2,1); hold on
plot(tmp,tmp2,'k.')
[r_tuning_sync50, p_tuning_sync50]=corrcoef(tmp,tmp2);
plot([0 1],[0 0],'k--')
ylim([-2 1.5])
xlim([0 1])
xlabel('Tuning Selectivity')
ylabel('\Delta Normalization (post-pre)')
title('Contingent Adaptation')
set(gca,'TickDir','out')
h = lsline;
axis square
temp=polyfit(get(h,'xdata'),get(h,'ydata'),1)
% plot(0,temp(1),'rx') % -0.0757 -0.0723
% plot(0,temp(2),'gx')


idx=1; clear tmp tmp2
for e = 1:length(cell_type_int)
%     if fit_qual_pre_int(e) > 0.7 && fit_qual_post_int(e) >0.7
        if cell_type_int(e)==0
            if f0_pre_int(e,5) > f0_pre_int(e,21)
                tmp(idx,1:4)=1-(f0_pre_int(e,21)-f0_pre_int(e,1))/(f0_pre_int(e,5)-f0_pre_int(e,1));
                tmp2(idx,1:4)=(rm_int_post(e,16))-(rm_int_pre(e,16));
                idx=idx+1;
            else
                tmp(idx,1:4)=1-(f0_pre_int(e,5)-f0_pre_int(e,1))/(f0_pre_int(e,21)-f0_pre_int(e,1));
                tmp2(idx,1:4)=(rm_int_post(e,16))-(rm_int_pre(e,16));
                idx=idx+1;
            end
        else
            if f1_pre_int(e,5) > f1_pre_int(e,21)
                tmp(idx,1:4)=1-(f1_pre_int(e,21)-f1_pre_int(e,1))/(f1_pre_int(e,5)-f1_pre_int(e,1));
                tmp2(idx,1:4)=(rm_int_post(e,16))-(rm_int_pre(e,16));
                idx=idx+1;
            else
                tmp(idx,1:4)=1-(f1_pre_int(e,5)-f1_pre_int(e,1))/(f1_pre_int(e,21)-f1_pre_int(e,1));
                tmp2(idx,1:4)=(rm_int_post(e,16))-(rm_int_pre(e,16));
                idx=idx+1;
            end
        end
%     end
end
tmp=tmp(~isnan(tmp2));
tmp2=tmp2(~isnan(tmp2));
% subplot(2,4,8); hold on
subplot(1,2,2); hold on
plot(tmp,tmp2,'k.')
[r_tuning_int50, p_tuning_int50]=corrcoef(tmp,tmp2);
plot([0 1],[0 0],'k--')
ylim([-2 1.5])
xlim([0 1])
set(gca,'TickDir','out')
xlabel('Tuning Selectivity')
ylabel('\Delta Normalization (post-pre)')
title('Asynchronous Adaptation')
h = lsline;
axis square
temp=polyfit(get(h,'xdata'),get(h,'ydata'),1)

%% save responses to gratings and plaids
for e=1:length(cell_type_sync)
    if cell_type_sync(e)==0
        resp50_c(e,:)=[f0_pre_sync(e,5) f0_pre_sync(e,21) f0_pre_sync(e,25)];
        resp50_post_c(e,:)=[f0_post_sync(e,5) f0_post_sync(e,21) f0_post_sync(e,25)];
        resp25_c(e,:)=[f0_pre_sync(e,4) f0_pre_sync(e,16) f0_pre_sync(e,19)];
        resp25_post_c(e,:)=[f0_post_sync(e,4) f0_post_sync(e,16) f0_post_sync(e,19)];
    else
        resp50_c(e,:)=[f1_pre_sync(e,5) f1_pre_sync(e,21) f1_pre_sync(e,25)];
        resp50_post_c(e,:)=[f1_post_sync(e,5) f1_post_sync(e,21) f1_post_sync(e,25)];
        resp25_c(e,:)=[f1_pre_sync(e,4) f1_pre_sync(e,16) f1_pre_sync(e,19)];
        resp25_post_c(e,:)=[f1_post_sync(e,4) f1_post_sync(e,16) f1_post_sync(e,19)];
    end
end

for e=1:length(cell_type_int)
    if cell_type_int(e)==0
        resp50_a(e,:)=[f0_pre_int(e,5) f0_pre_int(e,21) f0_pre_int(e,25)];
        resp50_post_a(e,:)=[f0_post_int(e,5) f0_post_int(e,21) f0_post_int(e,25)];
        resp25_a(e,:)=[f0_pre_int(e,4) f0_pre_int(e,16) f0_pre_int(e,19)];
        resp25_post_a(e,:)=[f0_post_int(e,4) f0_post_int(e,16) f0_post_int(e,19)];
    else
        resp50_a(e,:)=[f1_pre_int(e,5) f1_pre_int(e,21) f1_pre_int(e,25)];
        resp50_post_a(e,:)=[f1_post_int(e,5) f1_post_int(e,21) f1_post_int(e,25)];
        resp25_a(e,:)=[f1_pre_int(e,4) f1_pre_int(e,16) f1_pre_int(e,19)];
        resp25_post_a(e,:)=[f1_post_int(e,4) f1_post_int(e,16) f1_post_int(e,19)];
    end
end

clear nn oo a ans e f contingent asynch h i temp temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8...
    temp9 tmp tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 tmp9 tmppre tmppost x

%% simple vs complex
% split MI and SI results
tmp=Area_post_sync4(cell_type_sync==0);     % 50% mask, complex cells
tmp2=Area_pre_sync4(cell_type_sync==0);
tmp3=Area_post_sync4(cell_type_sync==1);    % 50% mask, simple cells
tmp4=Area_pre_sync4(cell_type_sync==1);
tmp5=NI_diff_sync(cell_type_sync==0);
tmp6=si_sync_post(cell_type_sync==0,16);
tmp7=si_sync_pre(cell_type_sync==0,16);
tmp8=si_sync_post(cell_type_sync==1,16);
tmp9=si_sync_pre(cell_type_sync==1,16);
tmp1=NI_diff_sync(cell_type_sync==1);

figure
subplot(321)
histogram(tmp-tmp2,-1:0.1:1);
title('complex')
xlabel('AM diff')
subplot(322)
histogram(tmp3-tmp4,-1:0.1:1);
title('Simple')
xlabel('AM diff')
subplot(323)
histogram(tmp6-tmp7,-2:0.2:2);
xlabel('SI dff')
subplot(324)
histogram(tmp8-tmp9,-2:0.2:2)
xlabel('SI diff')
subplot(325)
histogram(tmp5,-2:0.2:2)
xlabel('RM diff')
subplot(326)
histogram(tmp1,-2:0.2:2)
xlabel('RM diff')
supertitle('Simple v Complex: contingent adapt')

tmp=Area_post_int4(cell_type_int==0);
tmp2=Area_pre_int4(cell_type_int==0);
tmp3=Area_post_int4(cell_type_int==1);
tmp4=Area_pre_int4(cell_type_int==1);
tmp5=NI_diff_int(cell_type_int==0);
tmp6=si_int_post(cell_type_int==0,16);
tmp7=si_int_pre(cell_type_int==0,16);
tmp8=si_int_post(cell_type_int==1,16);
tmp9=si_int_pre(cell_type_int==1,16);
tmp1=NI_diff_int(cell_type_int==1);

figure
subplot(321)
histogram(tmp-tmp2,-1:0.1:1);
title('complex')
xlabel('AM diff')
subplot(322)
histogram(tmp3-tmp4,-1:0.1:1);
title('Simple')
xlabel('AM diff')
subplot(323)
histogram(tmp6-tmp7,-2:0.2:2);
xlabel('SI dff')
subplot(324)
histogram(tmp8-tmp9,-2:0.2:2)
xlabel('SI diff')
subplot(325)
histogram(tmp5,-2:0.2:2)
xlabel('RM diff')
subplot(326)
histogram(tmp1,-2:0.2:2)
xlabel('RM diff')
supertitle('Simple v Complex: async adapt')

%% Basline MI vs Orientation selectivity
% plots basline normalization strength as a function of OS
% ori selectivity = ratio of mask to test response (1-Rmask/Rtest) (greater values = more tuned)

figure;
for e = 1:length(cell_type_sync)
    if cell_type_sync(e)==0
        if f0_pre_sync(e,5)>f0_pre_sync(e,21)
            subplot(3,5,1); hold on
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync4(e),'k.')
            subplot(3,5,2); hold on
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync3(e),'g.')
            subplot(3,5,3); hold on
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync2(e),'c.')
            subplot(3,5,4); hold on
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync1(e),'r.')
            subplot(3,5,5); hold on
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync4(e),'k.')
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync3(e),'k.')
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync2(e),'k.')
            plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),Area_pre_sync1(e),'k.')
        else
            subplot(3,5,1); hold on
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync4(e),'k.')
            subplot(3,5,2); hold on
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync3(e),'g.')
            subplot(3,5,3); hold on
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync2(e),'c.')
            subplot(3,5,4); hold on
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync1(e),'r.')
            subplot(3,5,5); hold on
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync4(e),'k.')
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync3(e),'k.')
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync2(e),'k.')
            plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),Area_pre_sync1(e),'k.')
        end
    else
        if f1_pre_sync(e,5)>f1_pre_sync(e,21)
            subplot(3,5,1); hold on
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync4(e),'k.')
            subplot(3,5,2); hold on
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync3(e),'g.')
            subplot(3,5,3); hold on
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync2(e),'c.')
            subplot(3,5,4); hold on
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync1(e),'r.')
            subplot(3,5,5); hold on
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync4(e),'k.')
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync3(e),'k.')
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync2(e),'k.')
            plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),Area_pre_sync1(e),'k.')
        else
            subplot(3,5,1); hold on
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync4(e),'k.')
            subplot(3,5,2); hold on
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync3(e),'g.')
            subplot(3,5,3); hold on
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync2(e),'c.')
            subplot(3,5,4); hold on
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync1(e),'r.')
            subplot(3,5,5); hold on
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync4(e),'k.')
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync3(e),'k.')
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync2(e),'k.')
            plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),Area_pre_sync1(e),'k.')
        end
    end
end
supertitle('Area metric as a function of tuning (ratio)')
subplot(3,5,1); hold on
title('synchronous')

for e = 1:length(cell_type_int)
    if cell_type_int(e)==0
        if f0_pre_int(e,5)>f0_pre_int(e,21)
            subplot(3,5,6); hold on
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int4(e),'k.')
            subplot(3,5,7); hold on
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int3(e),'g.')
            subplot(3,5,8); hold on
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int2(e),'c.')
            subplot(3,5,9); hold on
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int1(e),'r.')
            subplot(3,5,10); hold on
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int4(e),'k.')
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int3(e),'k.')
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int2(e),'k.')
            plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),Area_pre_int1(e),'k.')
        else
            subplot(3,5,6); hold on
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int4(e),'k.')
            subplot(3,5,7); hold on
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int3(e),'g.')
            subplot(3,5,8); hold on
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int2(e),'c.')
            subplot(3,5,9); hold on
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int1(e),'r.')
            subplot(3,5,10); hold on
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int4(e),'k.')
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int3(e),'k.')
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int2(e),'k.')
            plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),Area_pre_int1(e),'k.')
        end
    else
        if f1_pre_int(e,5)>f1_pre_int(e,21)
            subplot(3,5,6); hold on
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int4(e),'k.')
            subplot(3,5,7); hold on
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int3(e),'g.')
            subplot(3,5,8); hold on
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int2(e),'c.')
            subplot(3,5,9); hold on
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int1(e),'r.')
            subplot(3,5,10); hold on
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int4(e),'k.')
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int3(e),'k.')
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int2(e),'k.')
            plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),Area_pre_int1(e),'k.')
        else
            subplot(3,5,6); hold on
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int4(e),'k.')
            subplot(3,5,7); hold on
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int3(e),'g.')
            subplot(3,5,8); hold on
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int2(e),'c.')
            subplot(3,5,9); hold on
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int1(e),'r.')
            subplot(3,5,10); hold on
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int4(e),'k.')
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int3(e),'k.')
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int2(e),'k.')
            plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),Area_pre_int1(e),'k.')
        end
    end
end
subplot(3,5,6); hold on
title('Interleaved')

%% Change in SI as a function of ori selectivity
% compares how well tuned the cell is to the two gratings vs change in normalization
% (ratio R(mask)/R(test))


% % % % % % FIRST TUNING METRIC: RATIO % % % % % % %
figure;  % Sync
for e = 1:length(cell_type_sync)
    if fit_qual_pre_sync(e) > 0.7 && fit_qual_post_sync(e) >0.7
        if cell_type_sync(e)==0
            if f0_pre_sync(e,5) > f0_pre_sync(e,21)
                subplot(3,5,1); hold on
                plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),nanmean(NI_diff_sync(e,1:4)),'k.')
                subplot(3,5,2); hold on
                plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),nanmean(NI_diff_sync(e,5:8)),'g.')
                subplot(3,5,3); hold on
                plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),nanmean(NI_diff_sync(e,9:12)),'c.')
                subplot(3,5,4); hold on
                plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),nanmean(NI_diff_sync(e,13:16)),'r.')
                subplot(3,5,5); hold on
                plot(1-f0_pre_sync(e,21)/f0_pre_sync(e,5),nanmean(NI_diff_sync(e,:)),'k.')
            else
                subplot(3,5,1); hold on
                plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),nanmean(NI_diff_sync(e,[1 5 9 13])),'k.')
                subplot(3,5,2); hold on
                plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),nanmean(NI_diff_sync(e,[2 6 10 14])),'g.')
                subplot(3,5,3); hold on
                plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),nanmean(NI_diff_sync(e,[3 7 11 15])),'c.')
                subplot(3,5,4); hold on
                plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),nanmean(NI_diff_sync(e,[4 8 12 16])),'r.')
                subplot(3,5,5); hold on
                plot(1-f0_pre_sync(e,5)/f0_pre_sync(e,21),nanmean(NI_diff_sync(e,:)),'k.')
            end
        else
            if f1_pre_sync(e,5) > f1_pre_sync(e,21)
                subplot(3,5,1); hold on
                plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),nanmean(NI_diff_sync(e,1:4)),'k.')
                subplot(3,5,2); hold on
                plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),nanmean(NI_diff_sync(e,5:8)),'g.')
                subplot(3,5,3); hold on
                plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),nanmean(NI_diff_sync(e,9:12)),'c.')
                subplot(3,5,4); hold on
                plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),nanmean(NI_diff_sync(e,13:16)),'r.')
                subplot(3,5,5); hold on
                plot(1-f1_pre_sync(e,21)/f1_pre_sync(e,5),nanmean(NI_diff_sync(e,:)),'k.')
            else
                subplot(3,5,1); hold on
                plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),nanmean(NI_diff_sync(e,[1 5 9 13])),'k.')
                subplot(3,5,2); hold on
                plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),nanmean(NI_diff_sync(e,[2 6 10 14])),'g.')
                subplot(3,5,3); hold on
                plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),nanmean(NI_diff_sync(e,[3 7 11 15])),'c.')
                subplot(3,5,4); hold on
                plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),nanmean(NI_diff_sync(e,[4 8 12 16])),'r.')
                subplot(3,5,5); hold on
                plot(1-f1_pre_sync(e,5)/f1_pre_sync(e,21),nanmean(NI_diff_sync(e,:)),'k.')
            end 
        end
    end
end
subplot(3,5,1); title('Synchronous')

% INTERLEAVED
for e = 1:length(cell_type_int)
    if fit_qual_pre_int(e) > 0.7 && fit_qual_post_int(e) >0.7
        if cell_type_int(e)==0
            if f0_pre_int(e,5) > f0_pre_int(e,21)
                subplot(3,5,6); hold on
                plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),nanmean(NI_diff_int(e,1:4)),'k.')
                subplot(3,5,7); hold on
                plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),nanmean(NI_diff_int(e,5:8)),'g.')
                subplot(3,5,8); hold on
                plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),nanmean(NI_diff_int(e,9:12)),'c.')
                subplot(3,5,9); hold on
                plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),nanmean(NI_diff_int(e,13:16)),'r.')
                subplot(3,5,10); hold on
                plot(1-f0_pre_int(e,21)/f0_pre_int(e,5),nanmean(NI_diff_int(e,:)),'k.')
            else
                subplot(3,5,6); hold on
                plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),nanmean(NI_diff_int(e,[1 5 9 13])),'k.')
                subplot(3,5,7); hold on
                plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),nanmean(NI_diff_int(e,[2 6 10 14])),'g.')
                subplot(3,5,8); hold on
                plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),nanmean(NI_diff_int(e,[3 7 11 15])),'c.')
                subplot(3,5,9); hold on
                plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),nanmean(NI_diff_int(e,[4 8 12 16])),'r.')
                subplot(3,5,10); hold on
                plot(1-f0_pre_int(e,5)/f0_pre_int(e,21),nanmean(NI_diff_int(e,:)),'k.')
            end
        else
            if f1_pre_int(e,5) > f1_pre_int(e,21)
                subplot(3,5,6); hold on
                plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),nanmean(NI_diff_int(e,1:4)),'k.')
                subplot(3,5,7); hold on
                plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),nanmean(NI_diff_int(e,5:8)),'g.')
                subplot(3,5,8); hold on
                plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),nanmean(NI_diff_int(e,9:12)),'c.')
                subplot(3,5,9); hold on
                plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),nanmean(NI_diff_int(e,13:16)),'r.')
                subplot(3,5,10); hold on
                plot(1-f1_pre_int(e,21)/f1_pre_int(e,5),nanmean(NI_diff_int(e,:)),'k.')
            else
                subplot(3,5,6); hold on
                plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),nanmean(NI_diff_int(e,[1 5 9 13])),'k.')
                subplot(3,5,7); hold on
                plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),nanmean(NI_diff_int(e,[2 6 10 14])),'g.')
                subplot(3,5,8); hold on
                plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),nanmean(NI_diff_int(e,[3 7 11 15])),'c.')
                subplot(3,5,9); hold on
                plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),nanmean(NI_diff_int(e,[4 8 12 16])),'r.')
                subplot(3,5,10); hold on
                plot(1-f1_pre_int(e,5)/f1_pre_int(e,21),nanmean(NI_diff_int(e,:)),'k.')
            end
        end
    end
end
subplot(3,5,6); title('Interleaved')

%% alternative MI (1-M/T)
% AI = 1 means strong normalization. AI < 0 means supralinear summation
% Need to define 'tmp' from primary script (combined_comparisons_model->AI)
for e = 1:length(tmp)
    AI_pre_int1(e)=1-tmp(e,5)/tmp(e,1); % 6
    AI_pre_int2(e)=1-tmp(e,4)/tmp(e,1); % 12
    AI_pre_int3(e)=1-tmp(e,3)/tmp(e,1); % 25
    AI_pre_int4(e)=1-tmp(e,2)/tmp(e,1); % 50
    
    AI_post_int1(e)=1-tmp2(e,5)/tmp2(e,1); % 6
    AI_post_int2(e)=1-tmp2(e,4)/tmp2(e,1); % 12
    AI_post_int3(e)=1-tmp2(e,3)/tmp2(e,1); % 25
    AI_post_int4(e)=1-tmp2(e,2)/tmp2(e,1); % 50
end

for e = 1:length(tmp)
    AI_pre_sync1(e)=1-tmp(e,5)/tmp(e,1); % 6
    AI_pre_sync2(e)=1-tmp(e,4)/tmp(e,1); % 12
    AI_pre_sync3(e)=1-tmp(e,3)/tmp(e,1); % 25
    AI_pre_sync4(e)=1-tmp(e,2)/tmp(e,1); % 50
    
    AI_post_sync1(e)=1-tmp2(e,5)/tmp2(e,1); % 6
    AI_post_sync2(e)=1-tmp2(e,4)/tmp2(e,1); % 12
    AI_post_sync3(e)=1-tmp2(e,3)/tmp2(e,1); % 25
    AI_post_sync4(e)=1-tmp2(e,2)/tmp2(e,1); % 50
end

figure
subplot(2,4,1); hold on
plot(AI_pre_sync1(:),AI_post_sync1(:),'k.')
refline(1,0)
subplot(2,4,2); hold on
plot(AI_pre_sync2(:),AI_post_sync2(:),'k.')
refline(1,0)
subplot(2,4,3); hold on
plot(AI_pre_sync3(:),AI_post_sync3(:),'k.')
refline(1,0)
subplot(2,4,4); hold on
plot(AI_pre_sync4(:),AI_post_sync4(:),'k.')
refline(1,0)
subplot(2,4,5); hold on
plot(AI_pre_int1(:),AI_post_int1(:),'k.')
refline(1,0)
subplot(2,4,6); hold on
plot(AI_pre_int2(:),AI_post_int2(:),'k.')
refline(1,0)
subplot(2,4,7); hold on
plot(AI_pre_int3(:),AI_post_int3(:),'k.')
refline(1,0)
subplot(2,4,8); hold on
plot(AI_pre_int4(:),AI_post_int4(:),'k.')
refline(1,0)

figure;     % subplot for each mask
subplot(2,4,1); hold on
histogram(AI_post_sync1-AI_pre_sync1,-5:0.1:5)
plot([0 0],[0 80],'k--')
% title('Contingent, mask=50%')
subplot(2,4,2); hold on
histogram(AI_post_sync2-AI_pre_sync2,-5:0.1:5)
plot([0 0],[0 60],'k--')
% title('mask=25%')
subplot(2,4,3); hold on
histogram(AI_post_sync3-AI_pre_sync3,-5:0.1:5)
plot([0 0],[0 60],'k--')
% title('mask=12%')
subplot(2,4,4); hold on
histogram(AI_post_sync4-AI_pre_sync4,-5:0.1:5)
plot([0 0],[0 60],'k--')
% title('mask=6%')
subplot(2,4,5); hold on
histogram(AI_post_int1-AI_pre_int1,-5:0.1:5)
plot([0 0],[0 30],'k--')
title('Asynchronous, mask=50%')
subplot(2,4,6); hold on
histogram(AI_post_int2-AI_pre_int2,-5:0.1:5)
plot([0 0],[0 25],'k--')
% title('mask=25%')
subplot(2,4,7); hold on
histogram(AI_post_int3-AI_pre_int3,-5:0.1:5)
plot([0 0],[0 25],'k--')
% title('mask=12%')
subplot(2,4,8); hold on
histogram(AI_post_int4-AI_pre_int4,-5:0.1:5)
plot([0 0],[0 30],'k--')
% title('mask=6%')
xlabel('Area Index Difference (Pre-Post)')
ylabel('# of Units')

supertitle('Difference, Area(post)-Area(pre)')

%% Change in Rmax vs change in normalization
% 1. SI; 2. MI
for e = 1:length(cell_type_sync)
    if max(f0_pre_sync(e,:)) > max(f1_pre_sync(e,:))
        Rmaxchange_sync(e)= (max(f0_pre_sync(e,:))-max(f0_post_sync(e,:)));
    else
        Rmaxchange_sync(e)= (max(f1_pre_sync(e,:))-max(f1_post_sync(e,:)));
    end
end
for e = 1:length(cell_type_int)
    if max(f0_pre_int(e,:)) > max(f1_pre_int(e,:))
        Rmaxchange_int(e)= (max(f0_pre_int(e,:))-max(f0_post_int(e,:)));
    else
        Rmaxchange_int(e)= (max(f1_pre_int(e,:))-max(f1_post_int(e,:)));
    end
end
figure % Change in Rmax vs change in SI
subplot(1,2,1); hold on
plot(Rmaxchange_sync,NI_diff_sync(:,4),'k.')
lsline
subplot(1,2,2); hold on
plot(Rmaxchange_int,NI_diff_int(:,4),'k.')
lsline

figure % Change in Rmax vs change in Area metric
subplot(1,2,1); hold on
plot(Rmaxchange_sync,Area_pre_sync4-Area_post_sync4,'k.')
lsline
subplot(1,2,2); hold on
plot(Rmaxchange_int,Area_pre_int4-Area_post_int4,'k.')
lsline

figure % Change in Rmax vs basline Area metric
subplot(1,2,1); hold on
plot(Rmaxchange_sync,Area_pre_sync4,'k.')
lsline
subplot(1,2,2); hold on
plot(Rmaxchange_int,Area_pre_int4,'k.')
lsline

%% Carandini 1997 contingency metric
% unadapted area under CRF/adapted area
% 1) with spontaneous FR subtracted
% 2) without subtraction

% 1)
clear tmp tmp2
for e = 1:length(cell_type_sync)        % calculates 'AUCt' (first column) and 'AUCtm' (columns 2-5)
    if cell_type_sync(e)==0
        if f0_pre_sync(e,5) > f0_pre_sync(e,21)
            if f0_pre_sync(e,5) > f0_pre_sync(e,1)+3*SEM_f0_sync(e,1)
                tmp(e,1) = (trapz(f0_pre_sync(e,1:5))-trapz(f0_pre_sync(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f0_pre_sync(e,21:25))-trapz(f0_pre_sync(e,[21 21 21 21 21])));
                tmp(e,3) = (trapz(f0_pre_sync(e,16:20))-trapz(f0_pre_sync(e,[16 16 16 16 16])));
                tmp(e,4) = (trapz(f0_pre_sync(e,11:15))-trapz(f0_pre_sync(e,[11 11 11 11 11])));
                tmp(e,5) = (trapz(f0_pre_sync(e,6:10))-trapz(f0_pre_sync(e,[6 6 6 6 6])));
                
                tmp2(e,1) = (trapz(f0_post_sync(e,1:5))-trapz(f0_post_sync(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f0_post_sync(e,21:25))-trapz(f0_post_sync(e,[21 21 21 21 21])));
                tmp2(e,3) = (trapz(f0_post_sync(e,16:20))-trapz(f0_post_sync(e,[16 16 16 16 16])));
                tmp2(e,4) = (trapz(f0_post_sync(e,11:15))-trapz(f0_post_sync(e,[11 11 11 11 11])));
                tmp2(e,5) = (trapz(f0_post_sync(e,6:10))-trapz(f0_post_sync(e,[6 6 6 6 6])));
            end
        else
            if f0_pre_sync(e,21)> f0_pre_sync(e,1)+3*SEM_f0_sync(e,1)
                tmp(e,1) = (trapz(f0_pre_sync(e,[1 6 11 16 21]))-trapz(f0_pre_sync(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f0_pre_sync(e,[5 10 15 20 25]))-trapz(f0_pre_sync(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f0_pre_sync(e,[4 9 14 19 24]))-trapz(f0_pre_sync(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f0_pre_sync(e,[3 8 13 18 23]))-trapz(f0_pre_sync(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f0_pre_sync(e,[2 7 12 17 22]))-trapz(f0_pre_sync(e,[2 2 2 2 2])));
                
                tmp2(e,1) = (trapz(f0_post_sync(e,[1 6 11 16 21]))-trapz(f0_post_sync(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f0_post_sync(e,[5 10 15 20 25]))-trapz(f0_post_sync(e,[5 5 5 5 5])));
                tmp2(e,3) = (trapz(f0_post_sync(e,[4 9 14 19 24]))-trapz(f0_post_sync(e,[4 4 4 4 4])));
                tmp2(e,4) = (trapz(f0_post_sync(e,[3 8 13 18 23]))-trapz(f0_post_sync(e,[3 3 3 3 3])));
                tmp2(e,5) = (trapz(f0_post_sync(e,[2 7 12 17 22]))-trapz(f0_post_sync(e,[2 2 2 2 2])));
            end
        end
    else
        if f1_pre_sync(e,5) > f1_pre_sync(e,21)
            if f1_pre_sync(e,5) > f1_pre_sync(e,1)+3*SEM_f1_sync(e,1)
                tmp(e,1) = (trapz(f1_pre_sync(e,1:5))-trapz(f1_pre_sync(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f1_pre_sync(e,21:25))-trapz(f1_pre_sync(e,[21 21 21 21 21])));
                tmp(e,3) = (trapz(f1_pre_sync(e,16:20))-trapz(f1_pre_sync(e,[16 16 16 16 16])));
                tmp(e,4) = (trapz(f1_pre_sync(e,11:15))-trapz(f1_pre_sync(e,[11 11 11 11 11])));
                tmp(e,5) = (trapz(f1_pre_sync(e,6:10))-trapz(f1_pre_sync(e,[6 6 6 6 6])));
                
                tmp2(e,1) = (trapz(f1_post_sync(e,1:5))-trapz(f1_post_sync(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f1_post_sync(e,21:25))-trapz(f1_post_sync(e,[21 21 21 21 21])));
                tmp2(e,3) = (trapz(f1_post_sync(e,16:20))-trapz(f1_post_sync(e,[16 16 16 16 16])));
                tmp2(e,4) = (trapz(f1_post_sync(e,11:15))-trapz(f1_post_sync(e,[11 11 11 11 11])));
                tmp2(e,5) = (trapz(f1_post_sync(e,6:10))-trapz(f1_post_sync(e,[6 6 6 6 6])));
            end
        else
            if f1_pre_sync(e,21)> f1_pre_sync(e,1)+3*SEM_f1_sync(e,1)
                tmp(e,1) = (trapz(f1_pre_sync(e,[1 6 11 16 21]))-trapz(f1_pre_sync(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f1_pre_sync(e,[5 10 15 20 25]))-trapz(f1_pre_sync(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f1_pre_sync(e,[4 9 14 19 24]))-trapz(f1_pre_sync(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f1_pre_sync(e,[3 8 13 18 23]))-trapz(f1_pre_sync(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f1_pre_sync(e,[2 7 12 17 22]))-trapz(f1_pre_sync(e,[2 2 2 2 2])));
                
                tmp2(e,1) = (trapz(f1_post_sync(e,[1 6 11 16 21]))-trapz(f1_post_sync(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f1_post_sync(e,[5 10 15 20 25]))-trapz(f1_post_sync(e,[5 5 5 5 5])));
                tmp2(e,3) = (trapz(f1_post_sync(e,[4 9 14 19 24]))-trapz(f1_post_sync(e,[4 4 4 4 4])));
                tmp2(e,4) = (trapz(f1_post_sync(e,[3 8 13 18 23]))-trapz(f1_post_sync(e,[3 3 3 3 3])));
                tmp2(e,5) = (trapz(f1_post_sync(e,[2 7 12 17 22]))-trapz(f1_post_sync(e,[2 2 2 2 2])));
            end
        end
    end
end

tmp(tmp<0)=0;                           % removes negative areas
tmp2(tmp2<0)=0;

for e = 1:length(cell_type_sync)        % calculates area metric for each mask %
    CarandiniAI1_sync1(e,:) = [tmp(e,1)/tmp2(e,1) tmp(e,1) tmp2(e,1)];     % target
    CarandiniAI2_sync1(e,:) = [tmp(e,2)/tmp2(e,2) tmp(e,2) tmp2(e,2)];     % 50% mask
    CarandiniAI3_sync1(e,:) = [tmp(e,3)/tmp2(e,3) tmp(e,3) tmp2(e,3)];     % 25% mask
    CarandiniAI4_sync1(e,:) = [tmp(e,4)/tmp2(e,4) tmp(e,4) tmp2(e,4)];     % 12% mask
    CarandiniAI5_sync1(e,:) = [tmp(e,5)/tmp2(e,5) tmp(e,5) tmp2(e,5)];     % 6% mask
end
% CarandiniAI1_sync1(CarandiniAI1_sync1>10)=10;
% CarandiniAI2_sync1(CarandiniAI2_sync1>10)=10;
% CarandiniAI3_sync1(CarandiniAI3_sync1>10)=10;
% CarandiniAI4_sync1(CarandiniAI4_sync1>10)=10;
% CarandiniAI5_sync1(CarandiniAI5_sync1>10)=10;

clear tmp tmp2
for e = 1:length(cell_type_int)        % calculates 'AUCt' (first column) and 'AUCtm' (columns 2-5)
    if cell_type_int(e)==0
        if f0_pre_int(e,5) > f0_pre_int(e,21)
            if f0_pre_int(e,5) > f0_pre_int(e,1)+3*SEM_f0_int(e,1)
                tmp(e,1) = (trapz(f0_pre_int(e,1:5))-trapz(f0_pre_int(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f0_pre_int(e,21:25))-trapz(f0_pre_int(e,[21 21 21 21 21])));
                tmp(e,3) = (trapz(f0_pre_int(e,16:20))-trapz(f0_pre_int(e,[16 16 16 16 16])));
                tmp(e,4) = (trapz(f0_pre_int(e,11:15))-trapz(f0_pre_int(e,[11 11 11 11 11])));
                tmp(e,5) = (trapz(f0_pre_int(e,6:10))-trapz(f0_pre_int(e,[6 6 6 6 6])));
                
                tmp2(e,1) = (trapz(f0_post_int(e,1:5))-trapz(f0_post_int(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f0_post_int(e,21:25))-trapz(f0_post_int(e,[21 21 21 21 21])));
                tmp2(e,3) = (trapz(f0_post_int(e,16:20))-trapz(f0_post_int(e,[16 16 16 16 16])));
                tmp2(e,4) = (trapz(f0_post_int(e,11:15))-trapz(f0_post_int(e,[11 11 11 11 11])));
                tmp2(e,5) = (trapz(f0_post_int(e,6:10))-trapz(f0_post_int(e,[6 6 6 6 6])));
            end
        else
            if f0_pre_int(e,21)> f0_pre_int(e,1)+3*SEM_f0_int(e,1)
                tmp(e,1) = (trapz(f0_pre_int(e,[1 6 11 16 21]))-trapz(f0_pre_int(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f0_pre_int(e,[5 10 15 20 25]))-trapz(f0_pre_int(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f0_pre_int(e,[4 9 14 19 24]))-trapz(f0_pre_int(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f0_pre_int(e,[3 8 13 18 23]))-trapz(f0_pre_int(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f0_pre_int(e,[2 7 12 17 22]))-trapz(f0_pre_int(e,[2 2 2 2 2])));
                
                tmp2(e,1) = (trapz(f0_post_int(e,[1 6 11 16 21]))-trapz(f0_post_int(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f0_post_int(e,[5 10 15 20 25]))-trapz(f0_post_int(e,[5 5 5 5 5])));
                tmp2(e,3) = (trapz(f0_post_int(e,[4 9 14 19 24]))-trapz(f0_post_int(e,[4 4 4 4 4])));
                tmp2(e,4) = (trapz(f0_post_int(e,[3 8 13 18 23]))-trapz(f0_post_int(e,[3 3 3 3 3])));
                tmp2(e,5) = (trapz(f0_post_int(e,[2 7 12 17 22]))-trapz(f0_post_int(e,[2 2 2 2 2])));
            end
        end
    else
        if f1_pre_int(e,5) > f1_pre_int(e,21)
            if f1_pre_int(e,5) > f1_pre_int(e,1)+3*SEM_f1_int(e,1)
                tmp(e,1) = (trapz(f1_pre_int(e,1:5))-trapz(f1_pre_int(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f1_pre_int(e,21:25))-trapz(f1_pre_int(e,[21 21 21 21 21])));
                tmp(e,3) = (trapz(f1_pre_int(e,16:20))-trapz(f1_pre_int(e,[16 16 16 16 16])));
                tmp(e,4) = (trapz(f1_pre_int(e,11:15))-trapz(f1_pre_int(e,[11 11 11 11 11])));
                tmp(e,5) = (trapz(f1_pre_int(e,6:10))-trapz(f1_pre_int(e,[6 6 6 6 6])));
                
                tmp2(e,1) = (trapz(f1_post_int(e,1:5))-trapz(f1_post_int(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f1_post_int(e,21:25))-trapz(f1_post_int(e,[21 21 21 21 21])));
                tmp2(e,3) = (trapz(f1_post_int(e,16:20))-trapz(f1_post_int(e,[16 16 16 16 16])));
                tmp2(e,4) = (trapz(f1_post_int(e,11:15))-trapz(f1_post_int(e,[11 11 11 11 11])));
                tmp2(e,5) = (trapz(f1_post_int(e,6:10))-trapz(f1_post_int(e,[6 6 6 6 6])));
            end
        else
            if f1_pre_int(e,21)> f1_pre_int(e,1)+3*SEM_f1_int(e,1)
                tmp(e,1) = (trapz(f1_pre_int(e,[1 6 11 16 21]))-trapz(f1_pre_int(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f1_pre_int(e,[5 10 15 20 25]))-trapz(f1_pre_int(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f1_pre_int(e,[4 9 14 19 24]))-trapz(f1_pre_int(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f1_pre_int(e,[3 8 13 18 23]))-trapz(f1_pre_int(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f1_pre_int(e,[2 7 12 17 22]))-trapz(f1_pre_int(e,[2 2 2 2 2])));
                
                tmp2(e,1) = (trapz(f1_post_int(e,[1 6 11 16 21]))-trapz(f1_post_int(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f1_post_int(e,[5 10 15 20 25]))-trapz(f1_post_int(e,[5 5 5 5 5])));
                tmp2(e,3) = (trapz(f1_post_int(e,[4 9 14 19 24]))-trapz(f1_post_int(e,[4 4 4 4 4])));
                tmp2(e,4) = (trapz(f1_post_int(e,[3 8 13 18 23]))-trapz(f1_post_int(e,[3 3 3 3 3])));
                tmp2(e,5) = (trapz(f1_post_int(e,[2 7 12 17 22]))-trapz(f1_post_int(e,[2 2 2 2 2]))); %#ok<*SAGROW>
            end
        end
    end
end

tmp(tmp<0)=0;                           % removes negative areas
tmp2(tmp2<0)=0;

for e = 1:length(cell_type_int)        % calculates area metric for each mask %
    CarandiniAI1_int1(e,:) = [tmp(e,1)/tmp2(e,1) tmp(e,1) tmp2(e,1)];     % target
    CarandiniAI2_int1(e,:) = [tmp(e,2)/tmp2(e,2) tmp(e,2) tmp2(e,2)];     % 50% mask
    CarandiniAI3_int1(e,:) = [tmp(e,3)/tmp2(e,3) tmp(e,3) tmp2(e,3)];     % 25% mask
    CarandiniAI4_int1(e,:) = [tmp(e,4)/tmp2(e,4) tmp(e,4) tmp2(e,4)];     % 12% mask
    CarandiniAI5_int1(e,:) = [tmp(e,5)/tmp2(e,5) tmp(e,5) tmp2(e,5)];     % 6% mask
end
% CarandiniAI1_sync1(CarandiniAI1_int1>10)=10;
% CarandiniAI2_sync1(CarandiniAI2_int1>10)=10;
% CarandiniAI3_sync1(CarandiniAI3_int1>10)=10;
% CarandiniAI4_sync1(CarandiniAI4_int1>10)=10;
% CarandiniAI5_sync1(CarandiniAI5_int1>10)=10;

% 2)
clear tmp tmp2
for e = 1:length(cell_type_sync)        % calculates 'AUCt' (first column) and 'AUCtm' (columns 2-5)
    if cell_type_sync(e)==0
        if f0_pre_sync(e,5) > f0_pre_sync(e,21)
            if f0_pre_sync(e,5) > f0_pre_sync(e,1)+3*SEM_f0_sync(e,1)
                tmp(e,1) = trapz(f0_pre_sync(e,1:5));
                tmp(e,2) = trapz(f0_pre_sync(e,21:25));
                tmp(e,3) = trapz(f0_pre_sync(e,16:20));
                tmp(e,4) = trapz(f0_pre_sync(e,11:15));
                tmp(e,5) = trapz(f0_pre_sync(e,6:10));
                
                tmp2(e,1) = trapz(f0_post_sync(e,1:5));
                tmp2(e,2) = trapz(f0_post_sync(e,21:25));
                tmp2(e,3) = trapz(f0_post_sync(e,16:20));
                tmp2(e,4) = trapz(f0_post_sync(e,11:15));
                tmp2(e,5) = trapz(f0_post_sync(e,6:10));
            end
        else
            if f0_pre_sync(e,21)> f0_pre_sync(e,1)+3*SEM_f0_sync(e,1)
                tmp(e,1) = trapz(f0_pre_sync(e,[1 6 11 16 21]));
                tmp(e,2) = trapz(f0_pre_sync(e,[5 10 15 20 25]));
                tmp(e,3) = trapz(f0_pre_sync(e,[4 9 14 19 24]));
                tmp(e,4) = trapz(f0_pre_sync(e,[3 8 13 18 23]));
                tmp(e,5) = trapz(f0_pre_sync(e,[2 7 12 17 22]));
                
                tmp2(e,1) = trapz(f0_post_sync(e,[1 6 11 16 21]));
                tmp2(e,2) = trapz(f0_post_sync(e,[5 10 15 20 25]));
                tmp2(e,3) = trapz(f0_post_sync(e,[4 9 14 19 24]));
                tmp2(e,4) = trapz(f0_post_sync(e,[3 8 13 18 23]));
                tmp2(e,5) = trapz(f0_post_sync(e,[2 7 12 17 22]));
            end
        end
    else
        if f1_pre_sync(e,5) > f1_pre_sync(e,21)
            if f1_pre_sync(e,5) > f1_pre_sync(e,1)+3*SEM_f1_sync(e,1)
                tmp(e,1) = trapz(f1_pre_sync(e,1:5));
                tmp(e,2) = trapz(f1_pre_sync(e,21:25));
                tmp(e,3) = trapz(f1_pre_sync(e,16:20));
                tmp(e,4) = trapz(f1_pre_sync(e,11:15));
                tmp(e,5) = trapz(f1_pre_sync(e,6:10));
                
                tmp2(e,1) = trapz(f1_post_sync(e,1:5));
                tmp2(e,2) = trapz(f1_post_sync(e,21:25));
                tmp2(e,3) = trapz(f1_post_sync(e,16:20));
                tmp2(e,4) = trapz(f1_post_sync(e,11:15));
                tmp2(e,5) = trapz(f1_post_sync(e,6:10));
            end
        else
            if f1_pre_sync(e,21)> f1_pre_sync(e,1)+3*SEM_f1_sync(e,1)
                tmp(e,1) = trapz(f1_pre_sync(e,[1 6 11 16 21]));
                tmp(e,2) = trapz(f1_pre_sync(e,[5 10 15 20 25]));
                tmp(e,3) = trapz(f1_pre_sync(e,[4 9 14 19 24]));
                tmp(e,4) = trapz(f1_pre_sync(e,[3 8 13 18 23]));
                tmp(e,5) = trapz(f1_pre_sync(e,[2 7 12 17 22]));
                
                tmp2(e,1) = trapz(f1_post_sync(e,[1 6 11 16 21]));
                tmp2(e,2) = trapz(f1_post_sync(e,[5 10 15 20 25]));
                tmp2(e,3) = trapz(f1_post_sync(e,[4 9 14 19 24]));
                tmp2(e,4) = trapz(f1_post_sync(e,[3 8 13 18 23]));
                tmp2(e,5) = trapz(f1_post_sync(e,[2 7 12 17 22]));
            end
        end
    end
end

tmp(tmp<0)=0;                           % removes negative areas
tmp2(tmp2<0)=0;

for e = 1:length(cell_type_sync)        % calculates area metric for each mask %
    CarandiniAI1_sync2(e) = tmp(e,1)/tmp2(e,1);  
    CarandiniAI2_sync2(e) = tmp(e,2)/tmp2(e,2);
    CarandiniAI3_sync2(e) = tmp(e,3)/tmp2(e,3);    
    CarandiniAI4_sync2(e) = tmp(e,4)/tmp2(e,4);
    CarandiniAI5_sync2(e) = tmp(e,5)/tmp2(e,5);
end

clear tmp tmp2
for e = 1:length(cell_type_int)        % calculates 'AUCt' (first column) and 'AUCtm' (columns 2-5)
    if cell_type_int(e)==0
        if f0_pre_int(e,5) > f0_pre_int(e,21)
            if f0_pre_int(e,5) > f0_pre_int(e,1)+3*SEM_f0_int(e,1)
                tmp(e,1) = trapz(f0_pre_int(e,1:5));
                tmp(e,2) = trapz(f0_pre_int(e,21:25));
                tmp(e,3) = trapz(f0_pre_int(e,16:20));
                tmp(e,4) = trapz(f0_pre_int(e,11:15));
                tmp(e,5) = trapz(f0_pre_int(e,6:10));
                
                tmp2(e,1) = trapz(f0_post_int(e,1:5));
                tmp2(e,2) = trapz(f0_post_int(e,21:25));
                tmp2(e,3) = trapz(f0_post_int(e,16:20));
                tmp2(e,4) = trapz(f0_post_int(e,11:15));
                tmp2(e,5) = trapz(f0_post_int(e,6:10));
            end
        else
            if f0_pre_int(e,21)> f0_pre_int(e,1)+3*SEM_f0_int(e,1)
                tmp(e,1) = trapz(f0_pre_int(e,[1 6 11 16 21]));
                tmp(e,2) = trapz(f0_pre_int(e,[5 10 15 20 25]));
                tmp(e,3) = trapz(f0_pre_int(e,[4 9 14 19 24]));
                tmp(e,4) = trapz(f0_pre_int(e,[3 8 13 18 23]));
                tmp(e,5) = trapz(f0_pre_int(e,[2 7 12 17 22]));
                
                tmp2(e,1) = trapz(f0_post_int(e,[1 6 11 16 21]));
                tmp2(e,2) = trapz(f0_post_int(e,[5 10 15 20 25]));
                tmp2(e,3) = trapz(f0_post_int(e,[4 9 14 19 24]));
                tmp2(e,4) = trapz(f0_post_int(e,[3 8 13 18 23]));
                tmp2(e,5) = trapz(f0_post_int(e,[2 7 12 17 22]));
            end
        end
    else
        if f1_pre_int(e,5) > f1_pre_int(e,21)
            if f1_pre_int(e,5) > f1_pre_int(e,1)+3*SEM_f1_int(e,1)
                tmp(e,1) = trapz(f1_pre_int(e,1:5));
                tmp(e,2) = trapz(f1_pre_int(e,21:25));
                tmp(e,3) = trapz(f1_pre_int(e,16:20));
                tmp(e,4) = trapz(f1_pre_int(e,11:15));
                tmp(e,5) = trapz(f1_pre_int(e,6:10));
                
                tmp2(e,1) = trapz(f1_post_int(e,1:5));
                tmp2(e,2) = trapz(f1_post_int(e,21:25));
                tmp2(e,3) = trapz(f1_post_int(e,16:20));
                tmp2(e,4) = trapz(f1_post_int(e,11:15));
                tmp2(e,5) = trapz(f1_post_int(e,6:10));
            end
        else
            if f1_pre_int(e,21)> f1_pre_int(e,1)+3*SEM_f1_int(e,1)
                tmp(e,1) = trapz(f1_pre_int(e,[1 6 11 16 21]));
                tmp(e,2) = trapz(f1_pre_int(e,[5 10 15 20 25]));
                tmp(e,3) = trapz(f1_pre_int(e,[4 9 14 19 24]));
                tmp(e,4) = trapz(f1_pre_int(e,[3 8 13 18 23]));
                tmp(e,5) = trapz(f1_pre_int(e,[2 7 12 17 22]));
                
                tmp2(e,1) = trapz(f1_post_int(e,[1 6 11 16 21]));
                tmp2(e,2) = trapz(f1_post_int(e,[5 10 15 20 25]));
                tmp2(e,3) = trapz(f1_post_int(e,[4 9 14 19 24]));
                tmp2(e,4) = trapz(f1_post_int(e,[3 8 13 18 23]));
                tmp2(e,5) = trapz(f1_post_int(e,[2 7 12 17 22])); %#ok<*SAGROW>
            end
        end
    end
end

tmp(tmp<0)=0;                           % removes negative areas
tmp2(tmp2<0)=0;

for e = 1:length(cell_type_int)        % calculates area metric for each mask %
    CarandiniAI1_int2(e) = tmp(e,1)/tmp2(e,1);  
    CarandiniAI2_int2(e) = tmp(e,2)/tmp2(e,2);
    CarandiniAI3_int2(e) = tmp(e,3)/tmp2(e,3);    
    CarandiniAI4_int2(e) = tmp(e,4)/tmp2(e,4);
    CarandiniAI5_int2(e) = tmp(e,5)/tmp2(e,5);
end

figure
subplot(2,5,1)
plot(CarandiniAI1_sync1)

%% correlation of adaptation potency w/ change in norm (NIrm post-pre) %%%
% load variables from adpot files
% Sync files
A=load('129r001p163_ws_sort_adpot.mat','decay_params1lsq','pred1lsq');
decay_params163=A.decay_params1lsq;
decay_pred163=A.pred1lsq;
% resp_adapt163=A.resp_count_adapt;
A=load('130l001p165_ws_sort_adpot.mat','decay_params1lsq','pred1lsq');
decay_params165=A.decay_params1lsq;
decay_pred165=A.pred1lsq;
% resp_adapt165=A.resp_count_adapt;
A=load('p119_ws_sort_adpot.mat','decay_params1lsq','pred1lsq');
decay_params119=A.decay_params1lsq;
decay_pred119=A.pred1lsq;
% resp_adapt119=A.resp_count_adapt;
A=load('p114_ws_sort_adpot.mat','decay_params1lsq','pred1lsq');
decay_params114=A.decay_params1lsq;
decay_pred114=A.pred1lsq;
% resp_adapt114=A.resp_count_adapt;
A=load('132l001p107_ws_adpot.mat','decay_params1lsq','pred1lsq');
decay_params107=A.decay_params1lsq;
decay_pred107=A.pred1lsq;
% resp_adapt107=A.resp_count_adapt;
 
% Interleaved adapt files
A=load('129r001p164c_ws_sort_adpot.mat','decay_params1lsq','pred1lsq');
decay_params164=A.decay_params1lsq;
decay_pred164=A.pred1lsq;
% resp_adapt164=A.resp_count_adapt;
A=load('130l001p166_ws_sort_adpot.mat','decay_params1lsq','pred1lsq');
decay_params166=A.decay_params1lsq;
decay_pred166=A.pred1lsq;
% resp_adapt166=A.resp_count_adapt;
A=load('131r001p118c_ws_sorted_adpot.mat','decay_params1lsq','pred1lsq');
decay_params118=A.decay_params1lsq;
decay_pred118=A.pred1lsq;
% resp_adapt118=A.resp_count_adapt;
A=load('132l001p109_ws_adpot.mat','decay_params1lsq','pred1lsq');
decay_params109=A.decay_params1lsq;
decay_pred109=A.pred1lsq;
% resp_adapt109=A.resp_count_adapt;
A=load('p115_ws_sort_adpot.mat','decay_params1lsq','pred1lsq');
decay_params115=A.decay_params1lsq;
decay_pred115=A.pred1lsq;
% resp_adapt115=A.resp_count_adapt;


decay_params_sync=[decay_params163; decay_params165; decay_params119; decay_params107; decay_params114];
decay_pred_sync=[decay_pred163; decay_pred165; decay_pred119; decay_pred107; decay_pred114];
% resp_adapt_sync=[resp_adapt163 resp_adapt165 resp_adapt119 resp_adapt107 resp_adapt114];
decay_params_int=[decay_params164; decay_params166; decay_params118; decay_params109; decay_params115];
decay_pred_int=[decay_pred164; decay_pred166; decay_pred118; decay_pred109; decay_pred115];
% resp_adapt_int=[resp_adapt164 resp_adapt166 resp_adapt118 resp_adapt109 resp_adapt115];
% decay_params_comp=[decay_params121; decay_params106; decay_params116];
% decay_pred_comp=[decay_pred121; decay_pred106; decay_pred116];
clear A decay_params118 decay_pred118 resp_adapt118 decay_params163 decay_pred163 resp_adapt163...
    decay_params164 decay_pred164 resp_adapt164 decay_params165 decay_pred165 resp_adapt165...
    decay_params166 decay_pred166 resp_adapt166 decay_params119 decay_pred119 resp_adapt119...
    decay_params114 decay_pred114 resp_adapt114 decay_params115 decay_pred115 resp_adapt115...
    decay_params107 decay_pred107 resp_adapt107 decay_params109 decay_pred109 resp_adapt109

% calculate strength drive adapt stimuli provide to each cell:
% from fit function: offset+coefficient-spontaneous Firing (a+b-spont)
for e = 1:length(cell_type_sync)
    if cell_type_sync(e)==0
        adapt_drive_sync(e)=decay_params_sync(e,1)+decay_params_sync(e,2)-f0_pre_sync(e,1);
    else
        adapt_drive_sync(e)=decay_params_sync(e,1)+decay_params_sync(e,2)-f1_pre_sync(e,1);
    end
end
for e = 1:length(cell_type_int)
    if cell_type_int(e)==0
        adapt_drive_int(e)=decay_params_int(e,1)+decay_params_int(e,2)-f0_pre_int(e,1);
    else
        adapt_drive_int(e)=decay_params_int(e,1)+decay_params_int(e,2)-f1_pre_int(e,1);
    end
end

figure
subplot(121); hold on
plot(adapt_drive_sync,Area_post_sync3-Area_pre_sync3,'k.')
set(gca,'XScale','log');
% refline(0,0)
xlabel('Strength of adapt response')  
ylabel('Change in masking index')
title('Contingent adapt')
axis square

subplot(122); hold on
plot(adapt_drive_int,Area_post_int3-Area_pre_int3,'k.')
set(gca,'XScale','log');
% refline(0,0)
xlabel('Strength of adapt response')
title('Asynch adapt')
axis square


% plotting strength of drive to cell vs change in normalization
figure; % Sync.
supertitle('Relating Normalization to Neuronal properties')
subplot(3,2,1)
plot(adapt_drive_sync,NI_diff_sync,'k.')
title('Contingent Adaptation')
xlabel('Adaptation Drive')
ylabel('Change in Normalization')
axis square
lsline
set(gca,'XScale','log');
ylim([-2 1.5])

subplot(322)
plot(adapt_drive_int,NI_diff_int,'k.')
title('Asynchronous Adaptation')
axis square
set(gca,'XScale','log');
lsline
ylim([-2 1.5])

subplot(323)
plot(decay_params_sync(:,2),NI_diff_sync,'k.')
xlabel('Adaptation Intensity')
ylabel('Change in Normalization')
axis square
set(gca,'XScale','log');
lsline
ylim([-2 1.5])

subplot(324)
plot(decay_params_int(:,2),NI_diff_int,'k.')
axis square
set(gca,'XScale','log');
lsline
ylim([-2 1.5])

subplot(325)
plot(decay_params_sync(:,3),NI_diff_sync,'k.')
xlabel('Rate of Decay')
ylabel('Change in Normalization')
axis square
set(gca,'XScale','log');
lsline
ylim([-2 1.5])

subplot(326)
plot(decay_params_int(:,3),NI_diff_int,'k.')
axis square
set(gca,'XScale','log');
lsline
ylim([-2 1.5])


for e = 331:length(cell_type_comp)
    if fit_qual_pre_comp(e) > 0.7 && fit_qual_post_comp(e) >0.7
        if cell_type_comp(e)==0
            if f0_pre_comp(e,5) > f0_pre_comp(e,21)
                subplot(3,5,11); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,4)),'k.')
                subplot(3,5,12); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,8)),'g.') 
                subplot(3,5,13); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,12)),'c.')
                subplot(3,5,14); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,16)),'r.')
                subplot(3,5,15); hold on
                plot(adapt_drive_comp(e-330),nanmean(NI_diff_comp(e,:)),'k.')
            else
                subplot(3,5,11); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,13)),'k.')
                subplot(3,5,12); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,14)),'g.') 
                subplot(3,5,13); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,15)),'c.')
                subplot(3,5,14); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,16)),'r.')
                subplot(3,5,15); hold on
                plot(adapt_drive_comp(e-330),nanmean(NI_diff_comp(e,:)),'k.')
            end
        else
            if f1_pre_comp(e,5) > f1_pre_comp(e,21)
                subplot(3,5,11); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,4)),'k.')
                subplot(3,5,12); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,8)),'g.') 
                subplot(3,5,13); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,12)),'c.')
                subplot(3,5,14); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,16)),'r.')
                subplot(3,5,15); hold on
                plot(adapt_drive_comp(e-330),nanmean(NI_diff_comp(e,:)),'k.')
            else
                subplot(3,5,11); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,13)),'k.')
                subplot(3,5,12); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,14)),'g.') 
                subplot(3,5,13); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,15)),'c.')
                subplot(3,5,14); hold on
                plot(adapt_drive_comp(e-330),(NI_diff_comp(e,16)),'r.')
                subplot(3,5,15); hold on
                plot(adapt_drive_comp(e-330),nanmean(NI_diff_comp(e,:)),'k.')
            end
        end
    end
end
subplot(3,5,11); set(gca,'XScale','log'); title('Comp')
subplot(3,5,12); set(gca,'XScale','log'); 
subplot(3,5,13); set(gca,'XScale','log'); 
subplot(3,5,14); set(gca,'XScale','log'); 
subplot(3,5,15); set(gca,'XScale','log'); 

% plotting how much the cell adapts vs change in normalization (b)
figure
for e = 1:length(cell_type_sync)
%     if fit_qual_pre_sync(e) > 0.7 && fit_qual_post_sync(e) >0.7
        if cell_type_sync(e)==0
            if f0_pre_sync(e,5) > f0_pre_sync(e,21)
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,2)),'g.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,3)),'c.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,2),nanmean(NI_diff_sync(e,:)),'k.')
            else
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,2)),'g.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,3)),'c.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,2),nanmean(NI_diff_sync(e,:)),'k.')
            end
        else
            if f1_pre_sync(e,5) > f1_pre_sync(e,21)
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,2)),'g.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,3)),'c.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,2),nanmean(NI_diff_sync(e,:)),'k.')
            else
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,2)),'g.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,3)),'c.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,2),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,2),nanmean(NI_diff_sync(e,:)),'k.')
            end
        end
%     end
end
subplot(3,5,1); set(gca,'XScale','log'); title('Sync, mask=6%')
subplot(3,5,2); set(gca,'XScale','log'); title('mask=12%')
subplot(3,5,3); set(gca,'XScale','log'); title('mask=25%')
subplot(3,5,4); set(gca,'XScale','log'); title('mask=50%')
supertitle('Level of Adaptation vs Change in Norm')

% INT.
for e = 1:length(cell_type_int)
%     if fit_qual_pre_int(e) > 0.7 && fit_qual_post_int(e) >0.7
        if cell_type_int(e)==0
            if f0_pre_int(e,5) > f0_pre_int(e,21)
                subplot(3,5,6); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,2)),'g.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,3)),'c.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,2),nanmean(NI_diff_int(e,:)),'k.')
            else
                subplot(3,5,6); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,2)),'g.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,3)),'c.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,2),nanmean(NI_diff_int(e,:)),'k.')
            end
        else
            if f1_pre_int(e,5) > f1_pre_int(e,21)
                subplot(3,5,6); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,2)),'g.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,3)),'c.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,2),nanmean(NI_diff_int(e,:)),'k.')
            else
                subplot(3,5,6); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,2)),'g.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,3)),'c.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,2),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,2),nanmean(NI_diff_int(e,:)),'k.')
            end
        end
%     end
end
subplot(3,5,6); set(gca,'XScale','log'); title('Int')
subplot(3,5,7); set(gca,'XScale','log'); 
subplot(3,5,8); set(gca,'XScale','log'); 
subplot(3,5,9); set(gca,'XScale','log'); 
subplot(3,5,10); set(gca,'XScale','log'); 


plotting rate of adaptation vs change in normalization (c)
figure; % Sync.
for e = 1:length(cell_type_sync)
%     if fit_qual_pre_sync(e) > 0.7 && fit_qual_post_sync(e) >0.7
        if cell_type_sync(e)==0
            if f0_pre_sync(e,5) > f0_pre_sync(e,21)
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,2)),'b.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,3)),'g.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,3),nanmean(NI_diff_sync(e,:)),'k.')
            else
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,2)),'b.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,3)),'g.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,3),nanmean(NI_diff_sync(e,:)),'k.')
            end
        else
            if f1_pre_sync(e,5) > f1_pre_sync(e,21)
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,2)),'b.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,3)),'g.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,3),nanmean(NI_diff_sync(e,:)),'k.')
            else
                subplot(3,5,1); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,1)),'k.')
                subplot(3,5,2); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,2)),'b.') 
                subplot(3,5,3); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,3)),'g.')
                subplot(3,5,4); hold on
                plot(decay_params_sync(e,3),(NI_diff_sync(e,4)),'r.')
                subplot(3,5,5); hold on
                plot(decay_params_sync(e,3),nanmean(NI_diff_sync(e,:)),'k.')
            end
        end
%     end
end
subplot(3,5,1); set(gca,'XScale','log'); title('Sync, mask=6%')
subplot(3,5,2); set(gca,'XScale','log'); title('mask=12%')
subplot(3,5,3); set(gca,'XScale','log'); title('mask=25%')
subplot(3,5,4); set(gca,'XScale','log'); title('mask=50%')
subplot(3,5,5); set(gca,'XScale','log'); title('all masks')
supertitle('Rate of Adaptation vs Change in Norm')

% INT. 
for e = 1:length(cell_type_int)
%     if fit_qual_pre_int(e) > 0.7 && fit_qual_post_int(e) >0.7
        if cell_type_int(e)==0
            if f0_pre_int(e,5) > f0_pre_int(e,21)
                subplot(3,5,6); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,2)),'b.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,3)),'g.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,3),nanmean(NI_diff_int(e,:)),'k.')
            else
                subplot(3,5,6); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,2)),'b.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,3)),'g.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,3),nanmean(NI_diff_int(e,:)),'k.')
            end
        else
            if f1_pre_int(e,5) > f1_pre_int(e,21)
                subplot(3,5,6); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,2)),'b.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,3)),'g.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,3),nanmean(NI_diff_int(e,:)),'k.')
            else
                subplot(3,5,6); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,1)),'k.')
                subplot(3,5,7); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,2)),'b.') 
                subplot(3,5,8); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,3)),'g.')
                subplot(3,5,9); hold on
                plot(decay_params_int(e,3),(NI_diff_int(e,4)),'r.')
                subplot(3,5,10); hold on
                plot(decay_params_int(e,3),nanmean(NI_diff_int(e,:)),'k.')
            end
        end
%     end
end
subplot(3,5,6); set(gca,'XScale','log'); 
subplot(3,5,7); set(gca,'XScale','log');
subplot(3,5,8); set(gca,'XScale','log'); 
subplot(3,5,9); set(gca,'XScale','log'); 
subplot(3,5,10);
