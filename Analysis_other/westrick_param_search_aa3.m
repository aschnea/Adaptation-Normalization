clear

train=0.1:0.1:1;
cont_sat=0.3:0.05:1;
offset=0:0.1:0.4;
rate_adapt=0:0.05:1;
test_ori=[1 45];
t_steps=1000;
bw=0.25:0.25:5;

design=NaN(length(test_ori)*length(train)*length(cont_sat)*length(offset)*length(rate_adapt)*length(bw)*length(t_steps),7);
idx=1;
for p=1:length(test_ori)
    for i=1:length(train)
        for j=1:length(cont_sat)
            for k=1:length(offset)
                for m=1:length(rate_adapt)
                    for r=1:length(bw)
                        for q=1:length(t_steps)
                            design(idx,:)=[test_ori(p) train(i) cont_sat(j) offset(k) rate_adapt(m) bw(r) t_steps(q)];
                            idx=idx+1;
                        end
                    end
                end
            end
        end
    end
end

tunerr=NaN(10,120,180);%120,180);
weightsrr=NaN(10,120,120);%120,120);
weights2rr=NaN(10,120,120);%120,120);
weights3rr=NaN(10,120,120);%120,120);
Rrr=NaN(10,120,180,51);%120,180,51);
R_plaidrr=NaN(10,120,51,51);%120,51,51);
R_plaid2rr=NaN(10,120,51,51);%120,51,51);
R_plaid3rr=NaN(10,120,51,51);%120,51,51);
amrr=NaN(10,120,51);%120,51);
am2rr=NaN(10,120,51);%120,51);
am3rr=NaN(10,120,51);%120,51);
weights_adapt=NaN(10,t_steps,120,120);
weights_adapt2=NaN(10,t_steps,120,120);

%%
for rr=1:length(design)
    sindex = mod(rr,10);
    if sindex ==0
      sindex =10;
    end 
    if mod(rr,10) == 1 && rr>1
      disp(num2str(rr))
      save([pwd '/Amir/westrick_param_search_temp_' num2str(rr-1)], 'tunerr', 'weightsrr','weights2rr','weights3rr',...
          'Rrr','R_plaidrr','R_plaid2rr', 'R_plaid3rr', 'amrr', 'am2rr', 'am3rr','weights_adapt','weights_adpat2');
      disp('saved')
      tunerr=NaN(10,120,180);%120,180);
      weightsrr=NaN(10,120,120);%120,120);
      weights2rr=NaN(10,120,120);%120,120);
      weights3rr=NaN(10,120,120);%120,120);
      Rrr=NaN(10,120,180,51);%120,180,51);
      R_plaidrr=NaN(10,120,51,51);%120,51,51);
      R_plaid2rr=NaN(10,120,51,51);%120,51,51);
      R_plaid3rr=NaN(10,120,51,51);%120,51,51);
      amrr=NaN(10,120,51);%120,51);
      am2rr=NaN(10,120,51);%120,51);
      am3rr=NaN(10,120,51);%120,51);
    end
       


    for qq=1:2

        train_contrast=design(rr,2);
        num_neurons=120;
        oris=(1:180);       % stim oris
        ori_prefs=(0:1.5:178.5);    % unit ori preferences
        tsteps=design(rr,end);
        con=(0:0.01:0.5);           % contrast
        mask_con=con;

        adapt_ori=1;                % assumes the plaid also has orthogonal ori
        if qq==1
            test_ori=1;             % test stimuli matched to adapt stimuli
        else
            test_ori=45;            % test stimuli rotated 45 deg to adapt stimuli
        end

        % for setting up the tuninng
        k=design(rr,6)*ones(num_neurons,1);        %sets tuning curve width; gives half width of ~24 deg
        ampl=ones(num_neurons,1);   % amplitude of responses

        offset=design(rr,4);
%         offset=0;                   % offsets/baseline firing
        %   fatigue parameters
        a_initial=0;
        a_peak=0.5;
        alpha2=design(rr,5);
        beta=0.005;

        weights=0.027*ones(num_neurons,num_neurons); %0.032 % initial weights
        con_sat=design(rr,3);
        alpha=0.001;

        %% define tuning and make basic model
        tune=NaN(120,180);
        for i=1:length(ori_prefs)                   %defines the tuning of each cell
            tune(i,:)=ampl(i)*exp(k(i)*(cos((pi*(oris-ori_prefs(i))/90))-1))+offset;
        end

        %calculates the response of each cell to each ori and each contrast
        F=NaN(120,180,51);
        R=NaN(120,180,51);
        for c=1:length(con)
            F(:,:,c)=con(c)*tune;           % FF input for con(c)
            for j=1:length(oris)            % compute responses for each ori
                for i=1:length(ori_prefs)   % compute responses for each cell
                    norm=weights(i,:)*squeeze((F(:,j,c).^2));       % normalization term
                    R(i,j,c)=(F(i,j,c)^2)/(con_sat^2+norm);         % R(neuron,ori,contrast)
                end
            end
        end

        R_max=max(squeeze(R(:,:,end))');        %peak response of each of the 120 cells

%         disp('Done with basic model')

        %% masking exp: just looks at the masking with no adaptation

        %   the FF input (unscalued by contrast) for the test ori and the 90 deg mask
        resp_c1=tune(:,find(test_ori==oris));          % response of all cells to test ori, unscaled by contrast
        resp_c2=tune(:,find(test_ori==oris)+90);        % response of all cells to test ori+90, unscaled by contrast

        %   the FF input (unscalued by contrast) for the adapt ori and the 90 deg mask
        resp_c1a=tune(:,find(adapt_ori==oris));          % adapt ori
        resp_c2a=tune(:,find(adapt_ori==oris)+90);        % response of all cells to adapt ori+90, unscaled by contrast
        
        F1=NaN(120,51);
        F1a=NaN(120,51);
        F2=NaN(120,51);
        F2a=NaN(120,51);
        F_plaid=NaN(120,51,51);
        F_plaida=NaN(120,51,51);
        R_plaid=NaN(120,51,51);
        R_plaid2=NaN(120,51,51);
        R_plaid3=NaN(120,51,51);
        R_plaida=NaN(120,51,51);
        
        for c1=1:length(con)                            %target contrast
            for c2=1:length(mask_con)                   %mask contrast

                %for test
                F1(:,c1)=con(c1)*resp_c1;
                F2(:,c2)=mask_con(c2)*resp_c2;
                F_plaid(:,c1,c2)=F1(:,c1)+F2(:,c2);     %Response of all cells as a function of grat1 and grat2 contrast
                for i=1:length(ori_prefs)               % compute responses for each neuron
                    norm=weights(i,:)*squeeze(F_plaid(:,c1,c2));
                    R_plaid(i,c1,c2)=(F_plaid(i,c1,c2)^2)/(con_sat^2+norm^2);
                end

                %for adapter
                F1a(:,c1)=con(c1)*resp_c1a;
                F2a(:,c2)=mask_con(c2)*resp_c2a;
                F_plaida(:,c1,c2)=F1a(:,c1)+F2a(:,c2);
                for i=1:length(ori_prefs)
                    norm=weights(i,:)*squeeze(F_plaida(:,c1,c2));
                    R_plaida(i,c1,c2)=(F_plaida(i,c1,c2)^2)/(con_sat^2+norm^2);
                end
            end
        end

%         disp('Done with plaid rvc')

        %%      adapt plaid and update norm weights

        % caclulate the target as the mean across all oris
        resp_hom=NaN(120,120);
        resp_tmp=squeeze(R(:,:,end));       %response of all cells to highest contrast grating (across oris)
        for i=1:size(resp_tmp,1)        %cell 1
            for j=1:size(resp_tmp,1)    %cell 2
                resp_hom(i,j)=mean(resp_tmp(i,:).*resp_tmp(j,:));       %average response product across all oris for cell i,j
            end
        end
        resp_hom=train_contrast*resp_hom;

        % set initial adapted weights (for first time step) to the weights defined above
        R_plaid_adapt=NaN(tsteps,120);
        R_plaid_adapt2=NaN(tsteps,2,120);
        
        resp_prod=NaN(tsteps,120,120);
        resp_prod2=NaN(tsteps,120,120);
        
        weights_adapt(rr,1,:,:)=weights;
        R_plaid_adapt(1,:)=squeeze(R_plaida(:,end,end));      % define the response at the first time step as the resp to the plaid
        F_plaid_tmp=0.5*resp_c1a+0.5*resp_c2a;                % the FF input for the plaid
        fatigue_factor(1,:)=a_initial*zeros(num_neurons,1);

        for t=2:tsteps      %adapt loop
            resp_prod(t,:,:)=R_plaid_adapt(t-1,:)'*R_plaid_adapt(t-1,:);        %response product for the adapter at previous time step
            weights_adapt(rr,t,:,:)=max(0,squeeze(weights_adapt(rr,t-1,:,:))+alpha*(squeeze(resp_prod(t,:,:))-resp_hom)); %update the weights
            
            %recompute the responses again with the new normalization weights for each cell (only the response to the plaid adapter
            for i=1:length(ori_prefs)
                norm=squeeze(weights_adapt(rr,t,i,:))'*F_plaid_tmp;
                R_plaid_adapt(t,i)=(F_plaid_tmp(i)^2)/(con_sat^2+norm^2);

                fatigue_factor(t,i)=fatigue_factor(t-1,i)+alpha2*(R_plaid_adapt(t,i)/R_max(i))-beta*(fatigue_factor(t-1,i)/a_peak);
                if fatigue_factor(t,i)>a_peak
                    fatigue_factor(t,i)=0.5;
                end
                R_plaid_adapt(t,i)=R_plaid_adapt(t,i)*(1-fatigue_factor(t,i));
            end

        end

%         disp('Done adapting')

        %test masking after contingent adaptation
        weights2(:,:)=squeeze(weights_adapt(rr,end,:,:));       %define new weights as the final learned weights above
        norm_all=NaN(120,51,51);
        for c1=1:length(con)            %masking exp exactly as coded above but with new normalization weights
            for c2=1:length(mask_con)

                F1(:,c1)=con(c1)*resp_c1;
                F2(:,c2)=mask_con(c2)*resp_c2;
                F_plaid(:,c1,c2)=F1(:,c1)+F2(:,c2);

                for i=1:length(ori_prefs)
                    norm=weights2(i,:)*squeeze(F_plaid(:,c1,c2));
                    R_plaid2(i,c1,c2)=(F_plaid(i,c1,c2)^2)/(con_sat^2+norm^2);
                    R_plaid2(i,c1,c2)=(1-fatigue_factor(end,i))*R_plaid2(i,c1,c2);
                    norm_all(i,c1,c2)=norm;
                end
            end
        end

%         disp('Done with plaid rvc2')

        %%      adapt asynch and update norm weights--same as section just above but for asynch adaptation

        weights_adapt2(rr,1,:,:)=weights;      %set weights to initial guess
        R_plaid_adapt2(1,1,:)=squeeze(R_plaida(:,1,end));    %response to a 50% contrast grating
        R_plaid_adapt2(1,2,:)=squeeze(R_plaida(:,end,1));    %response to a 50% contrast grating
        F_comp1_tmp=0.5*resp_c1a;
        F_comp2_tmp=0.5*resp_c2a;
        fatigue_factor2(1,:)=a_initial*zeros(num_neurons,1);

        for t=2:tsteps

            if mod(t,2)==0
                resp_prod2(t,:,:)=squeeze(R_plaid_adapt2(t-1,1,:))*squeeze(R_plaid_adapt2(t-1,1,:))';
            else
                resp_prod2(t,:,:)=squeeze(R_plaid_adapt2(t-1,2,:))*squeeze(R_plaid_adapt2(t-1,2,:))';
            end
            weights_adapt2(rr,t,:,:)=max(0,squeeze(weights_adapt2(rr,t-1,:,:))+alpha*(squeeze(resp_prod2(t,:,:))-resp_hom));

            %recompute the responses again with the new normalization weights
            for i=1:length(ori_prefs)
                norm=squeeze(weights_adapt2(rr,t,i,:))'*F_comp1_tmp;
                R_plaid_adapt2(t,1,i,:)=(F_comp1_tmp(i)^2)/(con_sat^2+norm^2);

                norm=squeeze(weights_adapt2(rr,t,i,:))'*F_comp2_tmp;
                R_plaid_adapt2(t,2,i,:)=(F_comp2_tmp(i)^2)/(con_sat^2+norm^2);

                if mod(t,2)==0
                    fatigue_factor2(t,i)=fatigue_factor2(t-1,i)+alpha2*(R_plaid_adapt2(t-1,1,i)/R_max(i))-beta*(fatigue_factor2(t-1,i)/a_peak);
                else
                    fatigue_factor2(t,i)=fatigue_factor2(t-1,i)+alpha2*(R_plaid_adapt2(t-1,2,i)/R_max(i))-beta*(fatigue_factor2(t-1,i)/a_peak);
                end
                if fatigue_factor2(t,i)>a_peak
                    fatigue_factor2(t,i)=0.5;
                end
                R_plaid_adapt2(t,1,i,:)=R_plaid_adapt2(t,1,i,:)*(1-fatigue_factor2(t,i));
                R_plaid_adapt2(t,2,i,:)=R_plaid_adapt2(t,2,i,:)*(1-fatigue_factor2(t,i));

            end

        end

%         disp('Done adapting')

        % masking exp for test ori after contingent adaptation

        weights2(:,:)=squeeze(weights_adapt2(rr,end,:,:));

        for c1=1:length(con)
            for c2=1:length(mask_con)

                F1(:,c1)=con(c1)*resp_c1;
                F2(:,c2)=mask_con(c2)*resp_c2;
                F_plaid(:,c1,c2)=F1(:,c1)+F2(:,c2);

                for i=1:length(ori_prefs)

                    norm=weights2(i,:)*squeeze(F_plaid(:,c1,c2));
                    R_plaid3(i,c1,c2)=(F_plaid(i,c1,c2)^2)/(con_sat^2+norm^2);
                    R_plaid3(i,c1,c2)=(1-fatigue_factor(end,i))*R_plaid3(i,c1,c2);
                    norm_all(i,c1,c2)=norm;

                end

            end
        end

%         disp('Done with plaid rvc2-asynch')

        %%  calculate areas
        area_t=NaN(120,51);
        area_tm=NaN(120,51);
        area2_t=NaN(120,51);
        area2_tm=NaN(120,51);
        area3_t=NaN(120,51);
        area3_tm=NaN(120,51);
        am=NaN(120,51);
        am2=NaN(120,51);
        am3=NaN(120,51);
        
        for i=1:size(R_plaid,1)         %ori pref
            for j=1:size(R_plaid,2)     %contrast of the mask

                tmp1=rvc_area(squeeze(R_plaid(i,1,:)),con);
                tmp2=rvc_area(squeeze(R_plaid(i,:,1)),con);

                if tmp1>tmp2    %decide which grating is the target
                    area_t(i,j)=tmp1;
                    area_tm(i,j)=rvc_area(squeeze(R_plaid(i,j,:)),con);
                    area2_t(i,j)=rvc_area(R_plaid2(i,1,:),con);
                    area2_tm(i,j)=rvc_area(R_plaid2(i,j,:),con);
                    area3_t(i,j)=rvc_area(R_plaid3(i,1,:),con);
                    area3_tm(i,j)=rvc_area(R_plaid3(i,j,:),con);
                else
                    area_t(i,j)=tmp2;
                    area_tm(i,j)=rvc_area(squeeze(R_plaid(i,:,j)),con);
                    area2_t(i,j)=rvc_area(R_plaid2(i,:,1),con);
                    area2_tm(i,j)=rvc_area(R_plaid2(i,:,j),con);
                    area3_t(i,j)=rvc_area(R_plaid3(i,:,1),con);
                    area3_tm(i,j)=rvc_area(R_plaid3(i,:,j),con);
                end

                am(i,j)=(area_t(i,j)-area_tm(i,j))/(area_t(i,j)+area_tm(i,j));
                am2(i,j)=(area2_t(i,j)-area2_tm(i,j))/(area2_t(i,j)+area2_tm(i,j));
                am3(i,j)=(area3_t(i,j)-area3_tm(i,j))/(area3_t(i,j)+area3_tm(i,j));

            end
        end

        %%  calculate tuning curves for new normalization weights

        weights2(:,:)=squeeze(weights_adapt(rr,end,:,:));
        weights3(:,:)=squeeze(weights_adapt2(rr,end,:,:));
        
%         for c=1:length(con)
%             for j=1:length(oris)
%                 for i=1:length(ori_prefs)
%                     norm=weights2(i,:)*squeeze((F(:,j,c).^2));
%                     R2(i,j,c)=(F(i,j,c)^2)/(con_sat^2+norm);
%                     R2a(i,j,c)=(1-fatigue_factor(end,i))*R2(i,j,c);
%                     norm=weights3(i,:)*squeeze((F(:,j,c).^2));
%                     R3(i,j,c)=(F(i,j,c)^2)/(con_sat^2+norm);
%                     R3a(i,j,c)=(1-fatigue_factor2(end,i))*R3(i,j,c);
%                 end
%             end
%         end

        %%  Plots
%         if qq==1
%             save('model_output2_1')
%         else
%             save('model_output2_2')
%         end
            
%         westrick_ak_plots_paper

    end
    tunerr(sindex,:,:) = tune; %NaN(10,120,180);%120,180);
    weightsrr(sindex,:,:) =weights; %NaN(10,120,120);%120,120);
    weights2rr(sindex,:,:) =weights2; %NaN(10,120,120);%120,120);
    weights3rr(sindex,:,:) =weights3; %NaN(10,120,120);%120,120);
    Rrr(sindex,:,:,:) =R;%NaN(10,120,180,51);%120,180,51);
    R_plaidrr(sindex,:,:,:) = R_plaid; %NaN(10,120,51,51);%120,51,51);
    R_plaid2rr(sindex,:,:,:) = R_plaid2; %NaN(10,120,51,51);%120,51,51);
    R_plaid3rr(sindex,:,:,:) = R_plaid3; %NaN(10,120,51,51);%120,51,51);
    amrr(sindex,:,:) =am; %NaN(10,120,51);%120,51);
    am2rr(sindex,:,:) =am2; %NaN(10,120,51);%120,51);
    am3rr(sindex,:,:) =am3; %NaN(10,120,51);%120,51);
    
    
%     tunerr{rr}=tune;
%     weightsrr{rr}=weights;
%     weights2rr{rr}=weights2;
%     weights3rr{rr}=weights3;
%     Rrr{rr}=R;
%     R_plaidrr{rr}=R_plaid;
%     R_plaid2rr{rr}=R_plaid2;
%     R_plaid3rr{rr}=R_plaid3;
%     amrr{rr}=am;
%     am2rr{rr}=am2;
%     am3rr{rr}=am3;
    
    clearvars -except amrr am2rr am3rr weightsrr weights2rr weights3rr design rr tunerr...
        Rrr R_plaidrr R_plaid2rr R_plaid3rr weights_adapt weights_adapt2
%     akstop
end
disp("done")
save('westrick_param_search_aa3_2');
disp("saved")