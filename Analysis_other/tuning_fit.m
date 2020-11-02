%% run this on xori_resp data for each file:
%%  fit contrast response functions with LSQ
clear params pred fit_qual params_post pred_post fit_qual_post

lb=[0; 0; 0; 0; 0; 0];                                      % lower bounds
ub=Inf*ones(6,1);                                           % upper bounds
options=optimset('MaxIter',1E4,'MaxFunEvals',1E4,'TolX',1E-3,'LargeScale','on');
con_dummy = zeros(length(resp),2);

for i=1:length(cell_type)                                   % fit for PRE-Adapt
%     for k=1:10                                            % for testing how random initial guesses affects params

        if cell_type(i)==0
            resp=resp_f0(i,:);
        else
            resp=resp_f1(i,:);
        end

        x0=[resp(1) max(resp) 2 max(resp) max(resp)/3 max(resp)/3]; % generate initial guesses for optimizer
%         if k>1
%             x0=(x0*5).*rand(1,6);
%         end
        
        params(i,:)=lsqcurvefit('rvc_fit',x0,con_dummy,resp,lb,ub,options);     % fits functions
        pred(i,:)=rvc_fit(params(i,:),con_dummy);                   % stores model predictions
        fit_qual(i)=1-(var(resp-pred(i,:))/var(resp));              % calculate fit quality

%     end
    disp(i)
end

for i=1:length(cell_type)                   % fit for POST-Adapt
        if cell_type(i)==0
            resp=resp_f0_post(i,:);
        else
            resp=resp_f1_post(i,:);
        end

        x0=[resp(1) max(resp) 2 max(resp) max(resp)/3 max(resp)/3];
        
        params_post(i,:)=lsqcurvefit('rvc_fit',x0,con_dummy,resp,lb,ub,options);
        pred_post(i,:)=rvc_fit(params_post(i,:),con_dummy);
        fit_qual_post(i)=1-(var(resp-pred_post(i,:))/var(resp));

    disp(i)
end

%% fit contrast response functions with Max Liklihood
lb=[0; 0; 0; 0; 0; 0];                                      % lower bounds
ub=Inf*ones(6,1);                                           % upper bounds
clear tmp
for i=1:length(cell_type)                                   % fit for PRE-Adapt
%     for k=1:10                                            % for testing how random initial guesses affects params

        if cell_type(i)==0
            data=resp_f0(i,:);
        else
            data=resp_f1(i,:);
        end

        p=params(i,:); % generate initial guesses for optimizer
%         if k>1
%             p=(p).*rand(1,6);
%         end
        
        [pars(i,:), LogL(i,:)]=max_likelihood(p,data,lb,ub);    % fits functions
        pred_mle(i,:)=rvc_fit(pars(i,:),con_dummy);               % stores model predictions
%         fit_qual_mle(i)=1-(var(resp-pred(i,:))/var(resp));          % calculate fit quality
%         tmp(i,k,:)=logL(i,:);
%     end
    disp(i)
end

% for i = 1:length(cell_type)
%     for k=1:10
%         temp(k)=(tmp(i,k,1)-tmp(i,k,2))/(tmp(i,k,3)-tmp(i,k,2));
%     end
%     [~, temp2] = max(temp);
%     LogL(i,:)=tmp(i,temp2,:);
%     clear temp
% end
clear tmp
for i=1:length(cell_type)                   % fit for POST-Adapt
%     for k=1:10
        if cell_type(i)==0
            data=resp_f0_post(i,:);
        else
            data=resp_f1_post(i,:);
        end

        p=params_post(i,:);
%         if k>1
%             p=(p*5).*rand(1,6);
%         end

        [pars_post(i,:), LogL_post(i,:)]=max_likelihood(p,data,lb,ub);    % fits functions
        pred_mle_post(i,:)=rvc_fit(params_post(i,:),con_dummy);
%         fit_qual_mle_post(i)=1-(var(resp-pred_post(i,:))/var(resp));
%         tmp(i,k,:)=logL_post(i,:);

    disp(i)
%     end
end
% for i = 1:length(cell_type)
%     for k=1:10
%         temp(k)=(tmp(i,k,1)-tmp(i,k,2))/(tmp(i,k,3)-tmp(i,k,2));
%     end
%     [~, temp2] = max(temp);
%     LogL_post(i,:)=tmp(i,temp2,:);
%     clear temp
% end

for e=1:length(LogL)
    LogL(e,4)=(LogL(e,1)-LogL(e,2))/(LogL(e,3)-LogL(e,2));
    LogL_post(e,4)=(LogL_post(e,1)-LogL_post(e,2))/(LogL_post(e,3)-LogL_post(e,2));
end
stop
%% plot contrast response functions and fits
ak_col=['k' 'r' 'b' 'g' 'c'];
figure(12)
for i=1:length(cell_type)                   % PRE-Adapt
    if fit_qual(i)>.7
        if cell_type(i)==0
            resp=resp_f0(i,:);
        else
            resp=resp_f1(i,:);
        end

        subplot(2,2,1)
        for j=1:5
            h=plot(resp((j-1)*5+1:j*5),'o-');
            hold on
            set(h,'Color',ak_col(j))
            h=plot(pred(i,(j-1)*5+1:j*5),':');
            set(h,'Color',ak_col(j))
        end
        title([i cell_type(i) fit_qual(i)])
        
        if cell_type(i)==0
            resp=resp_f0_post(i,:);
        else
            resp=resp_f1_post(i,:);
        end

        subplot(2,2,2)
        for j=1:5
            h=plot(resp((j-1)*5+1:j*5),'o-');
            hold on
            set(h,'Color',ak_col(j))
            h=plot(pred_post(i,(j-1)*5+1:j*5),':');
            set(h,'Color',ak_col(j))
        end
        title([i cell_type(i) fit_qual_post(i)])

                if cell_type(i)==0
            resp=resp_f0(i,:);
        else
            resp=resp_f1(i,:);
        end

        subplot(2,2,3); hold on
        for j=1:5
            h=plot(resp((j-1)*5+1:j*5),'o-');
            set(h,'Color',ak_col(j))
            h=plot(pred_mle(i,(j-1)*5+1:j*5),':');
            set(h,'Color',ak_col(j))
        end
        title([i cell_type(i) fit_qual(i)])
        
        if cell_type(i)==0
            resp=resp_f0_post(i,:);
        else
            resp=resp_f1_post(i,:);
        end

        subplot(2,2,4); hold on
        for j=1:5
            h=plot(resp((j-1)*5+1:j*5),'o-');
            set(h,'Color',ak_col(j))
            h=plot(pred_mle_post(i,(j-1)*5+1:j*5),':');
            set(h,'Color',ak_col(j))
        end
        title([i cell_type(i) fit_qual_post(i)])
        pause(1)
        clf;
    end
end