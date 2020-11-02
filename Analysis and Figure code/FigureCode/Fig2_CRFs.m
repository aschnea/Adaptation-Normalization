%% Plotting Contrast-response Functions

% This code identifies example cells for contingent and asynchronous
% adaptation and makes contrast response functions, highlighting the MI.
% finds cells that meet fit criteria, plots responses to Target+Mask
% combinations, shades area under curve.
%% Synchronous Adapt Units
% ak_col=['k' 'r' 'b' 'g' 'c'];
% current example cell: 18
figure;
for e=1:length(cell_type_sync)
    if LogL_sync(e,4)>0.7 && LogL_sync_post(e,4)>0.7 && f0_pre_sync(e,5)>3*SEM_f0_sync(e,1) && f0_pre_sync(e,21)>3*SEM_f0_sync(e,1)
        if cell_type_sync(e)==0
            if f0_pre_sync(e,5)>f0_pre_sync(e,21)        
                subplot(1,2,1); hold on
                a=area(0:4,f0_pre_sync(e,21:25));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f0_pre_sync(e,1:5));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_pre_sync(e,(f-1)*5+1:f*5)-f0_pre_sync(e,(f-1)*5+1),SEM_f0_sync(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end

                title([e Area_pre_sync4(e) Area_pre_sync3(e) Area_pre_sync2(e) Area_pre_sync1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_sync(e,1:25))+max(SEM_f0_sync(e,:))])

                subplot(1,2,2); hold on
                a=area(0.2:4.2,f0_post_sync(e,21:25));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f0_post_sync(e,1:5));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_post_sync(e,(f-1)*5+1:f*5),SEM_f0_post_sync(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_post_sync4(e) Area_post_sync3(e) Area_post_sync2(e) Area_post_sync1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_sync(e,1:25))+max(SEM_f0_sync(e,:))])
                legend('Mask Contrast = 0','6.25','12.5','25','50','Location','northwest')
                pause; clf
            else
                subplot(1,2,1); hold on
                b = area(0:4,f0_pre_sync(e,[1 6 11 16 21])-f0_pre_sync(e,[1 1 1 1 1]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                a = area(0.2:4.2,f0_pre_sync(e,[5 10 15 20 25])-f0_pre_sync(e,[5 5 5 5 5]));
                set(a,'FaceColor',[0.3 0.3 0.3]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_pre_sync(e,[f f+5 f+10 f+15 f+20])-f0_pre_sync(e,f),SEM_f0_sync(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_pre_sync4(e) Area_pre_sync3(e) Area_pre_sync2(e) Area_pre_sync1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_sync(e,1:25))+max(SEM_f0_sync(e,:))])

                subplot(1,2,2); hold on
                b = area(0:4,f0_post_sync(e,[1 6 11 16 21])-f0_post_sync(e,[1 1 1 1 1]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                a = area(0.2:4.2,f0_post_sync(e,[5 10 15 20 25])-f0_post_sync(e,[5 5 5 5 5]));
                set(a,'FaceColor',[0.3 0.3 0.3]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_post_sync(e,[f f+5 f+10 f+15 f+20])-f0_post_sync(e,f),SEM_f0_post_sync(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_post_sync4(e) Area_post_sync3(e) Area_post_sync2(e) Area_post_sync1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_sync(e,1:25))+max(SEM_f0_sync(e,:))])
                pause; clf
            end
        else
            if f1_pre_sync(e,5)>f1_pre_sync(e,21)
                subplot(1,2,1); hold on
                a=area(0.2:4.2,f1_pre_sync(e,21:25));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_pre_sync(e,1:5));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_pre_sync(e,(f-1)*5+1:f*5),SEM_f1_sync(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_pre_sync4(e) Area_pre_sync3(e) Area_pre_sync2(e) Area_pre_sync1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_sync(e,1:25))+max(SEM_f1_sync(e,:))])

                subplot(1,2,2); hold on
                a=area(0.2:4.2,f1_post_sync(e,21:25));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_post_sync(e,1:5));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_post_sync(e,(f-1)*5+1:f*5),SEM_f1_post_sync(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_post_sync4(e) Area_post_sync3(e) Area_post_sync2(e) Area_post_sync1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_sync(e,1:25))+max(SEM_f1_sync(e,:))])
                legend('Mask Contrast = 0','6.25','12.5','25','50','Location','northwest')
                pause; clf
            else
                subplot(1,2,1); hold on
                a=area(0.2:4.2,f1_pre_sync(e,[5 10 15 20 25]));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_pre_sync(e,[1 6 11 16 21]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_pre_sync(e,[f f+5 f+10 f+15 f+20]),SEM_f1_sync(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end

                title([e Area_pre_sync4(e) Area_pre_sync3(e) Area_pre_sync2(e) Area_pre_sync1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_sync(e,1:25))+max(SEM_f1_sync(e,:))])

                subplot(1,2,2); hold on
                a=area(0.2:4.2,f1_post_sync(e,[5 10 15 20 25]));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_post_sync(e,[1 6 11 16 21]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_post_sync(e,[f f+5 f+10 f+15 f+20]),SEM_f1_post_sync(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_post_sync4(e) Area_post_sync3(e) Area_post_sync2(e) Area_post_sync1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_sync(e,1:25))+max(SEM_f1_sync(e,:))])
                legend('Mask Contrast = 0','6.25','12.5','25','50','Location','northwest')
                pause; clf
            end
        end
    end
end

%% INTERLEAVED
% current example cell: 299
ak_col=['k' 'r' 'b' 'g' 'c'];
figure;
for e=100:length(cell_type_int) % [] %
    if LogL_int(e,4)>0.7 && LogL_int_post(e,4)>0.7 && f0_pre_int(e,5)>3*SEM_f0_int(e,1) && f0_pre_int(e,21)>3*SEM_f0_int(e,1)
        if cell_type_int(e)==0
            if f0_pre_int(e,5)>f0_pre_int(e,21)        
                subplot(1,2,1); hold on
                b=area(0:4,f0_pre_int(e,1:5)-f0_pre_int(e,[1 1 1 1 1]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                a=area(0.2:4.2,f0_pre_int(e,21:25)-f0_pre_int(e,[21 21 21 21 21]));
                set(a,'FaceColor',[0.3 0.3 0.3])
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_pre_int(e,(f-1)*5+1:f*5)-f0_pre_int(e,(f-1)*5+1),SEM_f0_int(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_pre_int4(e) Area_pre_int3(e) Area_pre_int2(e) Area_pre_int1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_int(e,1:25))+max(SEM_f0_int(e,:))])

                subplot(1,2,2); hold on
                b=area(0:4,f0_post_int(e,1:5)-f0_post_int(e,[1 1 1 1 1]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                a=area(0.2:4.2,f0_post_int(e,21:25)-f0_post_int(e,[21 21 21 21 21]));
                set(a,'FaceColor',[0.3 0.3 0.3])
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_post_int(e,(f-1)*5+1:f*5)-f0_post_int(e,(f-1)*5+1),SEM_f0_post_int(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_post_int4(e) Area_post_int3(e) Area_post_int2(e) Area_post_int1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_int(e,1:25))+max(SEM_f0_int(e,:))])
                legend('Mask Contrast = 0','6.25','12.5','25','50','Location','northwest')
                pause; clf
            else
                subplot(1,2,1); hold on
                b = area(0:4,f0_pre_int(e,[1 6 11 16 21]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                a = area(0.2:4.2,f0_pre_int(e,[5 10 15 20 25]));
                set(a,'FaceColor',[0.3 0.3 0.3]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_pre_int(e,[f f+5 f+10 f+15 f+20]),SEM_f0_int(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_pre_int4(e) Area_pre_int3(e) Area_pre_int2(e) Area_pre_int1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_int(e,1:25))+max(SEM_f0_int(e,:))])

                subplot(1,2,2); hold on
                b = area(0:4,f0_post_int(e,[1 6 11 16 21]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                a = area(0.2:4.2,f0_post_int(e,[5 10 15 20 25]));
                set(a,'FaceColor',[0.3 0.3 0.3]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f0_post_int(e,[f f+5 f+10 f+15 f+20]),SEM_f0_post_int(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                title([e Area_post_int4(e) Area_post_int3(e) Area_post_int2(e) Area_post_int1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f0_pre_int(e,1:25))+max(SEM_f0_int(e,:))])
                pause; clf
            end
        else
            if f1_pre_int(e,5)>f1_pre_int(e,21)
                subplot(1,2,1); hold on
                a=area(0.2:4.2,f1_pre_int(e,21:25));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_pre_int(e,1:5));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_pre_int(e,(f-1)*5+1:f*5),SEM_f1_int(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_pre_int4(e) Area_pre_int3(e) Area_pre_int2(e) Area_pre_int1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_int(e,1:25))+max(SEM_f1_int(e,:))])

                subplot(1,2,2); hold on
                a=area(0.2:4.2,f1_post_int(e,21:25));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_post_int(e,1:5));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h = errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_post_int(e,(f-1)*5+1:f*5),SEM_f1_post_int(e,(f-1)*5+1:f*5),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_post_int4(e) Area_post_int3(e) Area_post_int2(e) Area_post_int1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_int(e,1:25))+max(SEM_f1_int(e,:))])
                legend('Mask Contrast = 0','6.25','12.5','25','50','Location','northwest')
                pause; clf
            else
                subplot(1,2,1); hold on
                a=area(0.2:4.2,f1_pre_int(e,[5 10 15 20 25]));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_pre_int(e,[1 6 11 16 21]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_pre_int(e,[f f+5 f+10 f+15 f+20]),SEM_f1_int(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_pre_int4(e) Area_pre_int3(e) Area_pre_int2(e) Area_pre_int1(e)])
                xlabel('Target Contrast (%)')
                ylabel('Response (sp/s)')
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_int(e,1:25))+max(SEM_f1_int(e,:))])

                subplot(1,2,2); hold on
                a=area(0.2:4.2,f1_post_int(e,[5 10 15 20 25]));
                set(a,'FaceColor',[0.3 0.3 0.3])
                b=area(0:4,f1_post_int(e,[1 6 11 16 21]));
                set(b,'FaceColor',[0.5 0.5 0.5]);
                for f=1:5
                    h=errorline([0+0.05*f-0.05 1+0.05*f-0.05 2+0.05*f-0.05 3+0.05*f-0.05 4+0.05*f-0.05],f1_post_int(e,[f f+5 f+10 f+15 f+20]),SEM_f1_post_int(e,[f f+5 f+10 f+15 f+20]),'-o');
%                     set(h,'color',[0 0 0]+0.2*(f-1))
                end
                
                title([e Area_post_int4(e) Area_post_int3(e) Area_post_int2(e) Area_post_int1(e)])
%                 set(gca,'xscale','log')
                set(gca,'XTick',[0 1 2 3 4])
                set(gca,'XTickLabel',{'0','6.25','12.5','25','50'},'TickDir','out');
                axis square
                xlim([0 4.3])
                ylim([0 max(f1_pre_int(e,1:25))+max(SEM_f1_int(e,:))])
                legend('Mask Contrast = 0','6.25','12.5','25','50','Location','northwest')
                pause; clf
            end
        end
    end
end
