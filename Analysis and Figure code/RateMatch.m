%% comparing normalization via responsivity of post-adaptation stimulus condition to equivalent responsivity in pre-adaptation stimuli
clear
% load cell_type, F0, F1, SEM, LogL pre and post
%% Match responses and calculate index

rsc=zeros(length(cell_type),8);                 % response to single gratings
for e = 1:length(cell_type)                     % columns 1-4 are [6 12 25 50%] contrast of target only, 5-8 are mask only
    if cell_type(e)==0                          % for complex cells
        if resp_f0(e,5)>resp_f0(e,21)           % find target and mask pref
            rsc(e,1:5)=resp_f0_post(e,2:6)-resp_f0_post(e,1);
            rsc(e,6)=resp_f0_post(e,11)-resp_f0_post(e,1);
            rsc(e,7)=resp_f0_post(e,16)-resp_f0_post(e,1);
            rsc(e,8)=resp_f0_post(e,21)-resp_f0_post(e,1);
        else
            rsc(e,1)=resp_f0_post(e,6)-resp_f0_post(e,1);
            rsc(e,2)=resp_f0_post(e,11)-resp_f0_post(e,1);
            rsc(e,3)=resp_f0_post(e,16)-resp_f0_post(e,1);
            rsc(e,4)=resp_f0_post(e,21)-resp_f0_post(e,1);
            rsc(e,5:8)=resp_f0_post(e,2:5)-resp_f0_post(e,1);
        end
    else                                        % for  simple cells
        if resp_f1(e,5)>resp_f1(e,21)
            rsc(e,1:5)=resp_f1_post(e,2:6)-resp_f1_post(e,1);
            rsc(e,6)=resp_f1_post(e,11)-resp_f1_post(e,1);
            rsc(e,7)=resp_f1_post(e,16)-resp_f1_post(e,1);
            rsc(e,8)=resp_f1_post(e,21)-resp_f1_post(e,1);
        else
            rsc(e,1)=resp_f1_post(e,6)-resp_f1_post(e,1);
            rsc(e,2)=resp_f1_post(e,11)-resp_f1_post(e,1);
            rsc(e,3)=resp_f1_post(e,16)-resp_f1_post(e,1);
            rsc(e,4)=resp_f1_post(e,21)-resp_f1_post(e,1);
            rsc(e,5:8)=resp_f1_post(e,2:5)-resp_f1_post(e,1);
        end
    end
end

c1=0.01:0.001:1;                                % create contrast matrix
c0 = zeros(1,991);
L1 = [c1;c0];                                   % matrix w/ contrast of grating 2 = 0
L2 = [c0;c1];                                   % matrix w/ contrast of grating 1 = 0

for e = 1:length(cell_type)                 
    if cell_type(e)==0
        if resp_f0(e,5)>resp_f0(e,21)
            mod_pred_target(e,:)=rvc_fit_NI(params(e,:),L1);    % these predictions should match pre response when contrasts match (:,2:5)
            mod_pred_target2(e,:)=mod_pred_target(e,:)-mod_pred_target(e,1);    % target CRF with baseline subtracted
            mod_pred_mask(e,:)=rvc_fit_NI(params(e,:),L2);      % these predictions should match pre response when contrasts match (:,[6 11 16 21])
            mod_pred_mask2(e,:)=mod_pred_mask(e,:)-mod_pred_mask(e,1);          % mask CRF with baseline subtracted
        else
            mod_pred_mask(e,:)=rvc_fit_NI(params(e,:),L1);      % these predictions should match pre response when contrasts match (:,2:5)
            mod_pred_mask2(e,:)=mod_pred_mask(e,:)-mod_pred_mask(e,1);
            mod_pred_target(e,:)=rvc_fit_NI(params(e,:),L2);    % these predictions should match pre response when contrasts match (:,[6 11 16 21])
            mod_pred_target2(e,:)=mod_pred_target(e,:)-mod_pred_target(e,1);
        end
    else
        if resp_f1(e,5)>resp_f1(e,21)
            mod_pred_target(e,:)=rvc_fit_NI(params(e,:),L1);
            mod_pred_target2(e,:)=mod_pred_target(e,:)-mod_pred_target(e,1);
            mod_pred_mask(e,:)=rvc_fit_NI(params(e,:),L2);
            mod_pred_mask2(e,:)=mod_pred_mask(e,:)-mod_pred_mask(e,1);
        else
            mod_pred_mask(e,:)=rvc_fit_NI(params(e,:),L1);
            mod_pred_mask2(e,:)=mod_pred_mask(e,:)-mod_pred_mask(e,1);
            mod_pred_target(e,:)=rvc_fit_NI(params(e,:),L2);
            mod_pred_target2(e,:)=mod_pred_target(e,:)-mod_pred_target(e,1);
        end
    end
        for f = 1:4                             % Find the contrast (pre) of the model that closest approximates the recorded response
            temp = diff(sign(mod_pred_target2(e,:)-rsc(e,f))); % calculate changes in sign (e.g. positive to negative)
            [x, y] = find(temp~=0,1,'first');
            
            if y<0 | y>0                       % if there was a sign change
                target_match(e,f) = y*0.001+0.009;
            else                                % if there was not a sign change (e.g. all values negative)
                target_match(e,f) = nan;
            end
            clear temp x y
        end
        for f = 5:8
            temp = diff(sign(mod_pred_mask2(e,:)-rsc(e,f)));
            [x, y] = find(temp~=0,1,'first');
            
            if y<0 | y>0                       % if there was a sign change
                mask_match(e,f-4) = y*0.001+0.009;
            else                                % if there was not a sign change (e.g. all values negative)
                mask_match(e,f-4) = nan;
            end
            clear temp x y
        end

% % % % % % % % % TO THROW OUT BAD MATCHES (I.E. WHERE PRE-CONTRAST IS HIGHER THAN POST BUT PRE RESPONSE IS LESS THAN POST
%     if cell_type(e)==0
%         if (resp_f0(e,3)-SEM_f0(e,3)) > resp_f0_post(e,3) && (resp_f0(e,4)-SEM_f0(e,4)) > resp_f0_post(e,4) && (resp_f0(e,5)-SEM_f0(e,5)) > resp_f0_post(e,5)
%             if target_match(e,1) > 0.100  % throw out values where contrast-pre > contrast-post but there was response suppression after adaptation
%                 target_match(e,1) = nan;
%             end
%             if target_match(e,2) > 0.160
%                 target_match(e,2) = nan;
%             end
%             if target_match(e,3) > 0.290
%                 target_match(e,3) = nan;
%             end
%             if target_match(e,4) > 0.540
%                 target_match(e,4) = nan;
%             end
%         end
%         if (resp_f0(e,11)-SEM_f0(e,11)) > resp_f0_post(e,11) && (resp_f0(e,16)-SEM_f0(e,16)) > resp_f0_post(e,16) && (resp_f0(e,21)-SEM_f0(e,21)) > resp_f0_post(e,21)
%             if mask_match(e,1) > 0.100
%                 mask_match(e,1) = nan;
%             end
%             if mask_match(e,2) > 0.160
%                 mask_match(e,2) = nan;
%             end
%             if mask_match(e,3) > 0.290
%                 mask_match(e,3) = nan;
%             end
%             if mask_match(e,4) > 0.540
%                 mask_match(e,4) = nan;
%             end
%         end
%     else
%         if (resp_f1(e,3)-SEM_f1(e,3)) > resp_f1_post(e,3) && (resp_f1(e,4)-SEM_f1(e,4)) > resp_f1_post(e,4) && (resp_f1(e,5)-SEM_f1(e,5)) > resp_f1_post(e,5)
%             if target_match(e,1) > 0.100    % throw out values where contrast-pre > contrast-post but there was response suppression after adaptation
%                 target_match(e,1) = nan;
%             end
%             if target_match(e,2) > 0.160
%                 target_match(e,2) = nan;
%             end
%             if target_match(e,3) > 0.290
%                 target_match(e,3) = nan;
%             end
%             if target_match(e,4) > 0.540
%                 target_match(e,4) = nan;
%             end
%         end
%         if (resp_f1(e,11)-SEM_f1(e,11)) > resp_f1_post(e,11) && (resp_f1(e,16)-SEM_f1(e,16)) > resp_f1_post(e,16) && (resp_f1(e,21)-SEM_f1(e,21)) > resp_f1_post(e,21)
%             if mask_match(e,1) > 0.100
%                 mask_match(e,1) = nan;
%             end
%             if mask_match(e,2) > 0.160
%                 mask_match(e,2) = nan;
%             end
%             if mask_match(e,3) > 0.290
%                 mask_match(e,3) = nan;
%             end
%             if mask_match(e,4) > 0.540
%                 mask_match(e,4) = nan;
%             end
%         end
%     end

% % % % % % % % % for plotting CRFs and model fits
%         ak_col=['k' 'r' 'b' 'g' 'c'];
%         figure(1); hold on            % predictions of single-grating contrast matrix (pre) and post-adapt recorded responses
%         plot(mod_pred_target(e,:),'b:')
%         plot(mod_pred_mask(e,:),'r:')
%         plot([52 115 241 491],rsc(e,1:4),'b.-','markersize',10)
%         plot([52 115 241 491],rsc(e,5:8),'r.-','markersize',10)
%         if cell_type(e)==0
%             if resp_f0(e,5)>resp_f0(e,21)
%                 plot([1 52 115 241 491],resp_f0(e,1:5),'bo')
%                 plot([1 52 115 241 491],resp_f0(e,[1 6 11 16 21]),'ro')
%             else
%                 plot([1 52 115 241 491],resp_f0(e,1:5),'ro')
%                 plot([1 52 115 241 491],resp_f0(e,[1 6 11 16 21]),'bo')
%             end
%         else
%             if resp_f1(e,5)>resp_f1(e,21)
%                 plot([1 52 115 241 491],resp_f1(e,1:5),'bo')
%                 plot([1 52 115 241 491],resp_f1(e,[1 6 11 16 21]),'ro')
%             else
%                 plot([1 52 115 241 491],resp_f1(e,1:5),'ro')
%                 plot([1 52 115 241 491],resp_f1(e,[1 6 11 16 21]),'bo')
%             end
%         end
%         set(gca,'xscale','log')
%         ylim([0 max(resp_f0(e,:))])
%         title(sprintf('Unit %g, Fit=%g, d1=%g, d2=%g',e,fit_qual(e),params(e,5),params(e,6)))
%         legend('Grating 1 Fit (pre)','Grating 2 Fit (pre)','Grating 1 Response (post)','Grating 2 Response (post)','Grating 1 Response (pre)','Grating 2 Response (pre)')
%         
%         figure(2); hold on            % Pre and Post contrast response functions w/ model fits
%         if cell_type(e)==0
%             subplot(1,2,1); hold on
%             for g=1:5
%                 h = plot([3 6 12 25 50],resp_f0(e,(g-1)*5+1:g*5),'.-');
%                 set(h,'color',ak_col(g))
%                 h = plot([3 6 12 25 50],pred(e,(g-1)*5+1:g*5),':');
%                 set(h,'color',ak_col(g))
%                 set(gca,'xscale','log')
%                 ylim([0 max(resp_f0(e,:))])
%                 title('CRF pre')
%             end
%             subplot(1,2,2); hold on
%             for g=1:5
%                 h = plot([3 6 12 25 50],resp_f0_post(e,(g-1)*5+1:g*5),'.-');
%                 ylim([0 max(resp_f0(e,:))])
%                 set(h,'color',ak_col(g))
%                 set(gca,'xscale','log')
%                 title('CRF post')
%             end
%         else
%             subplot(1,2,1); hold on
%             for g=1:5
%                 h = plot([3 6 12 25 50],resp_f1(e,(g-1)*5+1:g*5),'.-');
%                 set(h,'color',ak_col(g))
%                 h = plot([3 6 12 25 50],pred(e,(g-1)*5+1:g*5),':');
%                 set(h,'color',ak_col(g))
%                 set(gca,'xscale','log')
%                 ylim([0 max(resp_f1(e,:))])
%                 title('CRF pre')
%             end
%             subplot(1,2,2); hold on
%             for g=1:5
%                 h = plot([3 6 12 25 50],resp_f1_post(e,(g-1)*5+1:g*5),'.-');
%                 set(h,'color',ak_col(g))
%                 set(gca,'xscale','log')
%                 ylim([0 max(resp_f1(e,:))])
%                 title('CRF post')
%             end
%         end
%         
%         figure(3); hold on                % Check for single-grating predictions equal model pre-adapt predictions at matching contrasts
%         plot(mod_pred_target(e,[53 116 241 491]),'kx') % for steps of 0.01: [6 12 25 50]
%         plot(mod_pred_mask(e,[53 116 241 491]),'rx') % for steps of 0.01: [6 12 25 50]
%         plot(pred(e,2:5),'ko')
%         plot(pred(e,[6 11 16 21]),'ro')
% 
%         pause; clf(3); clf(1); clf(2)
end

%% % % % % % % % % % % % FIT % % % % % % % % % % %
% used to include LogL_post(e,4) > 0.7 in addition to LogL_pre

for e = 1:length(cell_type)                         % To find pre-adapt contrast which generates same response as post-adapt response
    for i = 1:4                                     % for the 4 non-zero target contrasts
        if cell_type(e)==0                          % Complex cells
            if resp_f0(e,5)>resp_f0(e,21)           % Grating 1 is target
                j = 1;                                          % mask contrast = 6%
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[target_match(e,i);0];             % matching contrast of target with mask = 0
                denominator2=[0;mask_match(e,j)];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f0_post(e,1+i) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,6) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i) = 1-(resp_f0_post(e,i+6)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,5)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i) = nan;
                    NIrPre(e,i) = nan;
                end
                
                j = 2;                                          % mask contrast = 12%
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [12]
                denominator1=[target_match(e,i);0];
                denominator2=[0;mask_match(e,j)];
                if LogL(e,4) > 0.7 && resp_f0_post(e,1+i) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,11) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i+4) = 1-(resp_f0_post(e,i+11)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,6));
                    NIrPre(e,i+4) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+4) = nan;
                    NIrPre(e,i+4) = nan;
                end
                
                j = 3;                                          % mask contrast = 25
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [25]
                denominator1=[target_match(e,i);0];
                denominator2=[0;mask_match(e,j)];
                if LogL(e,4) > 0.7 && resp_f0_post(e,1+i) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,16) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i+8) = 1-(resp_f0_post(e,i+16)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,7));
                    NIrPre(e,i+8) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+8) = nan;
                    NIrPre(e,i+8) = nan;
                end
                
                j = 4;                                          % mask contrast = 50%
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [50]
                denominator1=[target_match(e,i);0];
                denominator2=[0;mask_match(e,j)];
                if LogL(e,4) > 0.7 && resp_f0_post(e,1+i) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,21) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i+12) = 1-(resp_f0_post(e,i+21)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,8));
                    NIrPre(e,i+12) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+12) = nan;
                    NIrPre(e,i+12) = nan;
                end
            else                                            % Grating 2 is target
                j = 1;                                          % mask contrast = 6%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f0_post(e,2) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,i*5+1) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i) = 1-(resp_f0_post(e,i*5+2)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,5)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i) = nan;
                    NIrPre(e,i) = nan;
                end
                
                j = 2;                                          % mask contrast = 12%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f0_post(e,3) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,i*5+1) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i+4) = 1-(resp_f0_post(e,i*5+3)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,6)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i+4) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+4) = nan;
                    NIrPre(e,i+4) = nan;
                end
                
                j = 3;                                          % mask contrast = 25%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f0_post(e,4) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,i*5+1) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i+8) = 1-(resp_f0_post(e,i*5+4)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,7)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i+8) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+8) = nan;
                    NIrPre(e,i+8) = nan;
                end
                
                j = 4;                                          % mask contrast = 50%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f0_post(e,5) > resp_f0_post(e,1)+3*SEM_f0_post(e,1) && resp_f0_post(e,i*5+1) > resp_f0_post(e,1)+3*SEM_f0_post(e,1)
                    NIrPost(e,i+12) = 1-(resp_f0_post(e,i*5+5)-resp_f0_post(e,1))/(rsc(e,i)+rsc(e,8)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i+12) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+12) = nan;
                    NIrPre(e,i+12) = nan;
                end 
            end
        else
            if resp_f1(e,5)>resp_f1(e,21)           % Grating 1 is target
                j = 1;                                          % mask contrast = 6%
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[target_match(e,i);0];             % matching contrast of target with mask = 0
                denominator2=[0;mask_match(e,j)];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f1_post(e,1+i) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,6) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i) = 1-(resp_f1_post(e,i+6)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,5)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i) = nan;
                    NIrPre(e,i) = nan;
                end
                
                j = 2;                                          % mask contrast = 12%
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [12]
                denominator1=[target_match(e,i);0];
                denominator2=[0;mask_match(e,j)];
                if LogL(e,4) > 0.7 && resp_f1_post(e,1+i) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,11) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i+4) = 1-(resp_f1_post(e,i+11)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,6));
                    NIrPre(e,i+4) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+4) = nan;
                    NIrPre(e,i+4) = nan;
                end
                
                j = 3;                                          % mask contrast = 25
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [25]
                denominator1=[target_match(e,i);0];
                denominator2=[0;mask_match(e,j)];
                if LogL(e,4) > 0.7 && resp_f1_post(e,1+i) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,16) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i+8) = 1-(resp_f1_post(e,i+16)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,7));
                    NIrPre(e,i+8) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+8) = nan;
                    NIrPre(e,i+8) = nan;
                end
                
                j = 4;                                          % mask contrast = 50%
                c_match=[target_match(e,i); mask_match(e,j)];   % sets contrast matches for target = [6 12 25 50] and mask = [50]
                denominator1=[target_match(e,i);0];
                denominator2=[0;mask_match(e,j)];
                if LogL(e,4) > 0.7 && resp_f1_post(e,1+i) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,21) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i+12) = 1-(resp_f1_post(e,i+21)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,8));
                    NIrPre(e,i+12) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+12) = nan;
                    NIrPre(e,i+12) = nan;
                end
            else                                            % Grating 2 is target
                j = 1;                                          % mask contrast = 6%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f1_post(e,2) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,i*5+1) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i) = 1-(resp_f1_post(e,i*5+2)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,5)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i) = nan;
                    NIrPre(e,i) = nan;
                end
                
                j = 2;                                          % mask contrast = 12%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f1_post(e,3) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,i*5+1) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i+4) = 1-(resp_f1_post(e,i*5+3)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,6)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i+4) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+4) = nan;
                    NIrPre(e,i+4) = nan;
                end
                
                j = 3;                                          % mask contrast = 25%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f1_post(e,4) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,i*5+1) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i+8) = 1-(resp_f1_post(e,i*5+4)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,7)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i+8) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+8) = nan;
                    NIrPre(e,i+8) = nan;
                end
                
                j = 4;                                          % mask contrast = 50%
                c_match=[mask_match(e,j); target_match(e,i)];   % sets contrast matches for target = [6 12 25 50] and mask = [6]
                denominator1=[0;target_match(e,i)];             % matching contrast of target with mask = 0
                denominator2=[mask_match(e,j);0];               % matching contrast of mask with target = 0
                
                if LogL(e,4) > 0.7 && resp_f1_post(e,5) > resp_f1_post(e,1)+3*SEM_f1_post(e,1) && resp_f1_post(e,i*5+1) > resp_f1_post(e,1)+3*SEM_f1_post(e,1)
                    NIrPost(e,i+12) = 1-(resp_f1_post(e,i*5+5)-resp_f1_post(e,1))/(rsc(e,i)+rsc(e,8)); %#ok<*SAGROW> %normalization index for post
                    NIrPre(e,i+12) = 1-(rvc_fit_NI(params(e,:),c_match)-pred(e,1))/(rvc_fit_NI(params(e,:),denominator1)+rvc_fit_NI(params(e,:),denominator2)-mod_pred_target(e,1)-mod_pred_mask(e,1));
                else
                    NIrPost(e,i+12) = nan;
                    NIrPre(e,i+12) = nan;
                end
            end
        end
    end
end

figure;
for e = 1:length(cell_type)
    if cell_type(e)==0
        subplot(1,2,1); hold on;
        plot(NIrPre(e,:),NIrPost(e,:),'k.');
    else
        subplot(1,2,2); hold on
        plot(NIrPre(e,:),NIrPost(e,:),'r.');
    end
end
subplot(1,2,1); hold on
refline(1,0);
xlabel('NI Pre-Adaptation');
ylabel('NI Post-Adaptation');
title('complex');
% set(gca,'XScale','log','YScale','log')
axis square
% xlim([0.1 2])
% ylim([0.1 2])

subplot(1,2,2); hold on
refline(1,0);
xlabel('NI Pre-Adaptation');
ylabel('NI Post-Adaptation');
title('simple');
% set(gca,'XScale','log','YScale','log')
axis square
% xlim([0.1 2])
% ylim([0.1 2])
supertitle('Normalization Index, Response Match')

%% Basic Normalization Index

% Normalization Index(NI)=response(AB)/(response(A)+response(B))
% AB is both gradients presented at max contrast
% A and B are response to individual gradients at max contrast while other is 0

NIpre=zeros(length(cell_type),16);
NIpost=zeros(length(cell_type),16);

% critiria pre post separate. R(gratings)>spontaneous.
for e=1:length(cell_type)
    if cell_type(e)==0
        tmp=resp_f0(e,:);
        tmp(2:5)=[max([tmp(1) tmp(2)]) max([tmp(1) tmp(3)]) max([tmp(1) tmp(4)]) max([tmp(1) tmp(5)])];
        tmp(6) = max([tmp(1) tmp(6)]);
        tmp(11) = max([tmp(1) tmp(11)]);
        tmp(16) = max([tmp(1) tmp(16)]);
        tmp(21) = max([tmp(1) tmp(21)]);
        tmp2=resp_f0_post(e,:);
        tmp2(2:5)=[max([tmp2(1) tmp2(2)]) max([tmp2(1) tmp2(3)]) max([tmp2(1) tmp2(4)]) max([tmp2(1) tmp2(5)])];
        tmp2(6) = max([tmp2(1) tmp2(6)]);
        tmp2(11) = max([tmp2(1) tmp2(11)]);
        tmp2(16) = max([tmp2(1) tmp2(16)]);
        tmp2(21) = max([tmp2(1) tmp2(21)]);
        if tmp(5)>tmp(21);
            for i = 1:4
                if tmp(6)>tmp(1)+3*SEM_f0(e,1) || tmp(1+i)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i) = 1-(tmp(6+i)-tmp(1))/(tmp(1+i)+tmp(6)-2*tmp(1));
                else
                    NIpre(e,i) = nan;
                end
                if tmp2(6)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i) = 1-(tmp2(6+i)-tmp2(1))/(tmp2(1+i)+tmp2(6)-2*tmp2(1));
                else
                    NIpost(e,i)= nan;
                end
                if tmp(11)>tmp(1)+3*SEM_f0(e,1) || tmp(1+i)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i+4) = 1-(tmp(11+i)-tmp(1))/(tmp(1+i)+tmp(11)-2*tmp(1));
                else
                    NIpre(e,i+4) = nan;
                end
                if tmp2(11)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i+4) = 1-(tmp2(11+i)-tmp2(1))/(tmp2(1+i)+tmp2(11)-2*tmp2(1));
                else
                    NIpost(e,i+4)= nan;
                end
                if tmp(16)>tmp(1)+3*SEM_f0(e,1) || tmp(1+i)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i+8) = 1-(tmp(16+i)-tmp(1))/(tmp(1+i)+tmp(16)-2*tmp(1));
                else
                    NIpre(e,i+8) = nan;
                end
                if tmp2(16)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i+8) = 1-(tmp2(16+i)-tmp2(1))/(tmp2(1+i)+tmp2(16)-2*tmp2(1));
                else
                    NIpost(e,i+8)= nan;
                end
                if tmp(21)>tmp(1)+3*SEM_f0(e,1) || tmp(1+i)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i+12) = 1-(tmp(21+i)-tmp(1))/(tmp(1+i)+tmp(21)-2*tmp(1));
                else
                    NIpre(e,i+12) = nan;
                end
                if tmp2(21)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i+12) = 1-(tmp2(21+i)-tmp2(1))/(tmp2(1+i)+tmp2(21)-2*tmp2(1));
                else
                    NIpost(e,i+12) =nan;
                end
            end
        else
            for i = 1:4
                if tmp(2)>tmp(1)+3*SEM_f0(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i) = 1-(tmp(5*i+2)-tmp(1))/(tmp(1+i)+tmp(2)-2*tmp(1));
                else
                    NIpre(e,i) = nan;
                end
                if tmp2(2)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i) = 1-(tmp2(5*i+2)-tmp2(1))/(tmp2(1+5*i)+tmp2(2)-2*tmp2(1));
                else
                    NIpost(e,i)= nan;
                end
                if tmp(3)>tmp(1)+3*SEM_f0(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i+4) = 1-(tmp(5*i+3)-tmp(1))/(tmp(1+5*i)+tmp(3)-2*tmp(1));
                else
                    NIpre(e,i+4) = nan;
                end
                if tmp2(3)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i+4) = 1-(tmp2(5*i+3)-tmp2(1))/(tmp2(1+5*i)+tmp2(3)-2*tmp2(1));
                else
                    NIpost(e,i+4)= nan;
                end
                if tmp(4)>tmp(1)+3*SEM_f0(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i+8) = 1-(tmp(5*i+4)-tmp(1))/(tmp(1+5*i)+tmp(4)-2*tmp(1));
                else
                    NIpre(e,i+8) = nan;
                end
                if tmp2(4)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i+8) = 1-(tmp2(5*i+4)-tmp2(1))/(tmp2(1+5*i)+tmp2(4)-2*tmp2(1));
                else
                    NIpost(e,i+8)= nan;
                end
                if tmp(5)>tmp(1)+3*SEM_f0(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f0(e,1)
                    NIpre(e,i+12) = 1-(tmp(5*i+5)-tmp(1))/(tmp(1+5*i)+tmp(5)-2*tmp(1));
                else
                    NIpre(e,i+12) = nan;
                end
                if tmp2(5)>tmp2(1)+3*SEM_f0_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f0_post(e,1)
                    NIpost(e,i+12) = 1-(tmp2(5*i+5)-tmp2(1))/(tmp2(1+5*i)+tmp2(5)-2*tmp2(1));
                else
                    NIpost(e,i+12)= nan;
                end
            end
        end
    else
        tmp=resp_f1(e,:);
        tmp(2:5)=[max([tmp(1) tmp(2)]) max([tmp(1) tmp(3)]) max([tmp(1) tmp(4)]) max([tmp(1) tmp(5)])];
        tmp(6) = max([tmp(1) tmp(6)]);
        tmp(11) = max([tmp(1) tmp(11)]);
        tmp(16) = max([tmp(1) tmp(16)]);
        tmp(21) = max([tmp(1) tmp(21)]);
        tmp2=resp_f1_post(e,:);
        tmp2(2:5)=[max([tmp2(1) tmp2(2)]) max([tmp2(1) tmp2(3)]) max([tmp2(1) tmp2(4)]) max([tmp2(1) tmp2(5)])];
        tmp2(6) = max([tmp2(1) tmp2(6)]);
        tmp2(11) = max([tmp2(1) tmp2(11)]);
        tmp2(16) = max([tmp2(1) tmp2(16)]);
        tmp2(21) = max([tmp2(1) tmp2(21)]);
        if tmp(5)>tmp(21)
            for i = 1:4
                if tmp(6)>tmp(1)+3*SEM_f1(e,1) || tmp(1+i)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i) = 1-(tmp(6+i)-tmp(1))/(tmp(1+i)+tmp(6)-2*tmp(1));
                else
                    NIpre(e,i) = nan;
                end
                if tmp2(6)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i) = 1-(tmp2(6+i)-tmp2(1))/(tmp2(1+i)+tmp2(6)-2*tmp2(1));
                else
                    NIpost(e,i)= nan;
                end
                if tmp(11)>tmp(1)+3*SEM_f1(e,1) || tmp(1+i)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i+4) = 1-(tmp(11+i)-tmp(1))/(tmp(1+i)+tmp(11)-2*tmp(1));
                else
                    NIpre(e,i+4) = nan;
                end
                if tmp2(11)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i+4) = 1-(tmp2(11+i)-tmp2(1))/(tmp2(1+i)+tmp2(11)-2*tmp2(1));
                else
                    NIpost(e,i+4)= nan;
                end
                if tmp(16)>tmp(1)+3*SEM_f1(e,1) || tmp(1+i)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i+8) = 1-(tmp(16+i)-tmp(1))/(tmp(1+i)+tmp(16)-2*tmp(1));
                else
                    NIpre(e,i+8) = nan;
                end
                if tmp2(16)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i+8) = 1-(tmp2(16+i)-tmp2(1))/(tmp2(1+i)+tmp2(16)-2*tmp2(1));
                else
                    NIpost(e,i+8)= nan;
                end
                if tmp(21)>tmp(1)+3*SEM_f1(e,1) || tmp(1+i)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i+12) = 1-(tmp(21+i)-tmp(1))/(tmp(1+i)+tmp(21)-2*tmp(1));
                else
                    NIpre(e,i+12) = nan;
                end
                if tmp2(21)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(1+i)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i+12) = 1-(tmp2(21+i)-tmp2(1))/(tmp2(1+i)+tmp2(21)-2*tmp2(1));
                else
                    NIpost(e,i+12) =nan;
                end
            end
        else
            for i = 1:4
                if tmp(2)>tmp(1)+3*SEM_f1(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i) = 1-(tmp(5*i+2)-tmp(1))/(tmp(1+i)+tmp(2)-2*tmp(1));
                else
                    NIpre(e,i) = nan;
                end
                if tmp2(2)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i) = 1-(tmp2(5*i+2)-tmp2(1))/(tmp2(1+5*i)+tmp2(2)-2*tmp2(1));
                else
                    NIpost(e,i)= nan;
                end
                if tmp(3)>tmp(1)+3*SEM_f1(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i+4) = 1-(tmp(5*i+3)-tmp(1))/(tmp(1+5*i)+tmp(3)-2*tmp(1));
                else
                    NIpre(e,i+4) = nan;
                end
                if tmp2(3)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i+4) = 1-(tmp2(5*i+3)-tmp2(1))/(tmp2(1+5*i)+tmp2(3)-2*tmp2(1));
                else
                    NIpost(e,i+4)= nan;
                end
                if tmp(4)>tmp(1)+3*SEM_f1(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i+8) = 1-(tmp(5*i+4)-tmp(1))/(tmp(1+5*i)+tmp(4)-2*tmp(1));
                else
                    NIpre(e,i+8) = nan;
                end
                if tmp2(4)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i+8) = 1-(tmp2(5*i+4)-tmp2(1))/(tmp2(1+5*i)+tmp2(4)-2*tmp2(1));
                else
                    NIpost(e,i+8)= nan;
                end
                if tmp(5)>tmp(1)+3*SEM_f1(e,1) || tmp(i*5+1)>tmp(1)+3*SEM_f1(e,1)
                    NIpre(e,i+12) = 1-(tmp(5*i+5)-tmp(1))/(tmp(1+5*i)+tmp(5)-2*tmp(1));
                else
                    NIpre(e,i+12) = nan;
                end
                if tmp2(5)>tmp2(1)+3*SEM_f1_post(e,1) || tmp2(i*5+1)>tmp2(1)+3*SEM_f1_post(e,1)
                    NIpost(e,i+12) = 1-(tmp2(5*i+5)-tmp2(1))/(tmp2(1+5*i)+tmp2(5)-2*tmp2(1));
                else
                    NIpost(e,i+12)= nan;
                end
            end
        end
    end
end

% figure
% subplot(1,4,1); hold on
% plot(NIpre(:,1:4),NIpost(:,1:4),'k.');
% axis square
% % xlim([0.1 2])
% % ylim([0.1 2])
% refline(1,0);
% xlabel('NI Pre-Adaptation');
% ylabel('NI Post-Adaptation');
% title('6% mask');
% subplot(1,4,2); hold on
% plot(NIpre(:,5:8),NIpost(:,5:8),'k.');
% axis square
% % xlim([0.1 2])
% % ylim([0.1 2])
% refline(1,0);
% title('12% mask');
% supertitle('Basic Normalization Index')
% subplot(1,4,3); hold on
% plot(NIpre(:,9:12),NIpost(:,9:12),'k.');
% axis square
% % xlim([0.1 2])
% % ylim([0.1 2])
% refline(1,0);
% title('25% mask');
% subplot(1,4,4); hold on
% plot(NIpre(:,13:16),NIpost(:,13:16),'k.');
% axis square
% % xlim([0.1 2])
% % ylim([0.1 2])
% refline(1,0);
% title('50% mask');

stopandsave
% save SI and SIrm