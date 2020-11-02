
clear all

for qq=1:2

    train_contrast=1;
    plaid_contrast=0.5;     %contrast of adapter, 0.5 means 0.5+0.5 plaid

    ak_exp=2;
    num_neurons=120;
    oris=(0:179);
    ori_prefs=(0:1.5:178.5);
    tsteps=500;

    con=(0:0.02:1);
    mask_con=con;

    adapt_ori=0;        %assumes the plaid also has orthogonal ori
    if qq==1
        test_ori=0;         %assumes the plaid also has orthogonal ori
    else
        test_ori=45;         %assumes the plaid also has orthogonal ori
    end

    % tuninng
    k=3;        %sets tuning curve width; gives half width of ~24 deg
    offset=0.3;

    %   fatigue parameters
    a_initial=0;
    a_peak=0.5;
    alpha2=0.05;
    beta=0.005;

    weights=0.027*ones(num_neurons,num_neurons); %0.032
    con_sat=0.5;
    alpha=0.005;

    for i=1:length(ori_prefs)                   %defines the tuning of each cell
        tune(i,:)=exp(k*(cos((pi*(oris-ori_prefs(i))/90))-1))+offset;
    end

    %calculates the response of each cell to each ori and each contrast
    for c=1:length(con)
        F(:,:,c)=con(c)*tune;           % FF input for con(c)
        for j=1:length(oris)            % compute responses for each ori
            for i=1:length(ori_prefs)   % compute responses for each cell
                norm=weights(i,:)*squeeze((F(:,j,c).^ak_exp));       % normalization term
                R(i,j,c)=(F(i,j,c)^ak_exp)/(con_sat^ak_exp+norm);         % R(neuron,ori,contrast)
            end
        end
    end

    R_max=max(squeeze(R(:,:,end))');        %peak response of each of the 120 cells

    disp('Done with basic model')

    %% masking exp: just looks at the masking with no adaptation

    %   the FF input (unscalued by contrast) for the test ori and the 90 deg mask
    resp_c1=tune(:,find(test_ori==oris));          % response of all cells to test ori, unscaled by contrast
    resp_c2=tune(:,find(test_ori==oris)+90);        % response of all cells to test ori+90, unscaled by contrast

    %   the FF input (unscalued by contrast) for the adapt ori and the 90 deg mask
    resp_c1a=tune(:,find(adapt_ori==oris));          % adapt ori
    resp_c2a=tune(:,find(adapt_ori==oris)+90);        % response of all cells to adapt ori+90, unscaled by contrast

    for c1=1:length(con)                            %target contrast
        for c2=1:length(mask_con)                   %mask contrast

            %for test
            F1(:,c1)=con(c1)*resp_c1;
            F2(:,c2)=mask_con(c2)*resp_c2;
            F_plaid(:,c1,c2)=F1(:,c1)+F2(:,c2);     %Response of all cells as a function of grat1 and grat2 contrast
            for i=1:length(ori_prefs)               % compute responses for each neuron
                norm=weights(i,:)*squeeze(F_plaid(:,c1,c2).^ak_exp);
                R_plaid(i,c1,c2)=(F_plaid(i,c1,c2)^ak_exp)/(con_sat^ak_exp+norm);
            end

            %for adapter
            F1a(:,c1)=con(c1)*resp_c1a;
            F2a(:,c2)=mask_con(c2)*resp_c2a;
            F_plaida(:,c1,c2)=F1a(:,c1)+F2a(:,c2);
            for i=1:length(ori_prefs)
                norm=weights(i,:)*squeeze(F_plaida(:,c1,c2).^ak_exp);
                R_plaida(i,c1,c2)=(F_plaida(i,c1,c2)^ak_exp)/(con_sat^ak_exp+norm);
            end
        end
    end

    disp('Done with plaid rvc')

    %%      adapt plaid and update norm weights

    % caclulate the target as the mean across all oris
    tmp=find(con==train_contrast);
    resp_tmp=squeeze(R(:,:,tmp));       %response of all cells to highest contrast grating (across oris)
    for i=1:size(resp_tmp,1)        %cell 1
        for j=1:size(resp_tmp,1)    %cell 2
            resp_hom(i,j)=mean(resp_tmp(i,:).*resp_tmp(j,:));       %average response product across all oris for cell i,j
        end
    end

    % set initial adapted weights (for first time step) to the weights defined above
    tmp=find(con==plaid_contrast);
    weights_adapt(1,:,:)=weights;
    R_plaid_adapt(1,:)=squeeze(R_plaida(:,tmp,tmp));      % define the response at the first time step as the resp to the plaid
    F_plaid_tmp=plaid_contrast*resp_c1a+plaid_contrast*resp_c2a;                % the FF input for the plaid
    fatigue_factor(1,:)=a_initial*zeros(num_neurons,1);

    for t=2:tsteps      %adapt loop

        if mod(t,2)==0
            resp_prod(t,:,:)=R_plaid_adapt(t-1,:)'*R_plaid_adapt(t-1,:);        %response product for the adapter at previous time step
        else
            resp_prod(t,:,:)=zeros(size(resp_prod,2),size(resp_prod,3));        %response product for the adapter at previous time step
        end
        weights_adapt(t,:,:)=max(0,squeeze(weights_adapt(t-1,:,:))+alpha*(squeeze(resp_prod(t,:,:))-resp_hom)); %update the weights

        %recompute the responses again with the new normalization weights for each cell (only the response to the plaid adapter
        for i=1:length(ori_prefs)
            norm=squeeze(weights_adapt(t,i,:))'*(F_plaid_tmp.^ak_exp);
            R_plaid_adapt(t,i)=(F_plaid_tmp(i)^ak_exp)/(con_sat^ak_exp+norm);

            fatigue_factor(t,i)=fatigue_factor(t-1,i)+alpha2*(R_plaid_adapt(t,i)/R_max(i))-beta*(fatigue_factor(t-1,i)/a_peak);
            if fatigue_factor(t,i)>a_peak
                fatigue_factor(t,i)=a_peak;
            end
            R_plaid_adapt(t,i)=R_plaid_adapt(t,i)*(1-fatigue_factor(t,i));
        end

    end

    disp('Done adapting')

    %test masking after contingent adaptation
    weights2=squeeze(weights_adapt(end,:,:));       %define new weights as the final learned weights above
    for c1=1:length(con)            %masking exp exactly as coded above but with new normalization weights
        for c2=1:length(mask_con)
            for i=1:length(ori_prefs)
                norm=weights2(i,:)*squeeze(F_plaid(:,c1,c2).^ak_exp);
                R_plaid2(i,c1,c2)=(F_plaid(i,c1,c2)^ak_exp)/(con_sat^ak_exp+norm);
                R_plaid2(i,c1,c2)=(1-fatigue_factor(end,i))*R_plaid2(i,c1,c2);
                norm_all(i,c1,c2)=norm;
            end
        end
    end

    disp('Done with plaid rvc contingent adaptation')

    %%      adapt asynch and update norm weights--same as section just above but for asynch adaptation

    tmp=find(con==plaid_contrast);
    weights_adapt2(1,:,:)=weights;      %set weights to initial guess
    R_plaid_adapt2(1,1,:)=squeeze(R_plaida(:,1,tmp));    %response to a 50% contrast grating
    R_plaid_adapt2(1,2,:)=squeeze(R_plaida(:,tmp,1));    %response to a 50% contrast grating
    F_comp1_tmp=plaid_contrast*resp_c1a;
    F_comp2_tmp=plaid_contrast*resp_c2a;
    fatigue_factor2(1,:)=a_initial*zeros(num_neurons,1);

    for t=2:tsteps

        if mod(t,2)==0
            resp_prod2(t,:,:)=squeeze(R_plaid_adapt2(t-1,1,:))*squeeze(R_plaid_adapt2(t-1,1,:))';
        else
            resp_prod2(t,:,:)=squeeze(R_plaid_adapt2(t-1,2,:))*squeeze(R_plaid_adapt2(t-1,2,:))';
        end
        weights_adapt2(t,:,:)=max(0,squeeze(weights_adapt2(t-1,:,:))+alpha*(squeeze(resp_prod2(t,:,:))-resp_hom));

        %recompute the responses again with the new normalization weights
        for i=1:length(ori_prefs)
            norm=squeeze(weights_adapt2(t,i,:))'*(F_comp1_tmp.^ak_exp);
            R_plaid_adapt2(t,1,i,:)=(F_comp1_tmp(i)^ak_exp)/(con_sat^ak_exp+norm);

            norm=squeeze(weights_adapt2(t,i,:))'*(F_comp2_tmp.^ak_exp);
            R_plaid_adapt2(t,2,i,:)=(F_comp2_tmp(i)^ak_exp)/(con_sat^ak_exp+norm);

            if mod(t,2)==0
                fatigue_factor2(t,i)=fatigue_factor2(t-1,i)+alpha2*(R_plaid_adapt2(t-1,1,i)/R_max(i))-beta*(fatigue_factor2(t-1,i)/a_peak);
            else
                fatigue_factor2(t,i)=fatigue_factor2(t-1,i)+alpha2*(R_plaid_adapt2(t-1,2,i)/R_max(i))-beta*(fatigue_factor2(t-1,i)/a_peak);
            end
            if fatigue_factor2(t,i)>a_peak
                fatigue_factor2(t,i)=a_peak;
            end
            R_plaid_adapt2(t,1,i,:)=R_plaid_adapt2(t,1,i,:)*(1-fatigue_factor2(t,i));
            R_plaid_adapt2(t,2,i,:)=R_plaid_adapt2(t,2,i,:)*(1-fatigue_factor2(t,i));

        end

    end

    disp('Done adapting')

    % masking exp for test ori after contingent adaptation

    weights2=squeeze(weights_adapt2(end,:,:));
    for c1=1:length(con)
        for c2=1:length(mask_con)
            for i=1:length(ori_prefs)
                norm=weights2(i,:)*squeeze(F_plaid(:,c1,c2).^ak_exp);
                R_plaid3(i,c1,c2)=(F_plaid(i,c1,c2)^ak_exp)/(con_sat^ak_exp+norm);
                R_plaid3(i,c1,c2)=(1-fatigue_factor(end,i))*R_plaid3(i,c1,c2);
                norm_all(i,c1,c2)=norm;
            end
        end
    end

    disp('Done with plaid rvc-asynch')

    %%  calculate areas
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

    weights2=squeeze(weights_adapt(end,:,:));
    weights3=squeeze(weights_adapt2(end,:,:));

    for c=1:length(con)
        for j=1:length(oris)
            for i=1:length(ori_prefs)
                norm=weights2(i,:)*squeeze((F(:,j,c).^ak_exp));
                R2(i,j,c)=(F(i,j,c)^ak_exp)/(con_sat^ak_exp+norm);
                R2a(i,j,c)=(1-fatigue_factor(end,i))*R2(i,j,c);
                norm=weights3(i,:)*squeeze((F(:,j,c).^ak_exp));
                R3(i,j,c)=(F(i,j,c)^ak_exp)/(con_sat^ak_exp+norm);
                R3a(i,j,c)=(1-fatigue_factor2(end,i))*R3(i,j,c);
            end
        end

    end

    qq
%     westrick_plots
    Fi7_model
    pause(0.5)

end
