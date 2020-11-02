function [pars,log_L] = VM_ML(p,data,lb,ub)
% this function fits a von mises to tuning data using maximum liklihood
% p = initial guesses for parameters
    % p1 = offset
    % p2 = gain
    % p3 = width
    % p4 = center

options = optimset('TolFun',1e-5,'TolX',1e-4,'Maxiter',10000,...
    'MaxFunEvals',10000,'Display','off','LargeScale','off');

[pars,log_L]=fmincon(@mymodel2,p,[],[],[],[],lb,ub,[],options);

log_ub=sum(log(((data.^data).*exp(-1*data))./factorial(round(data))));
ave_resp=mean(data)*ones(size(data,1),size(data,2));
log_lb=sum(log(((ave_resp.^data).*exp(-1*ave_resp))./factorial(round(data))));

log_L=[-1*log_L log_lb log_ub];

    function [log_L] = mymodel2(p)
        xdata=[90 67.5 45 22.5 0 -22.5 -45 -67.5];
%         xdata=xdata+90;
        xdata=deg2rad(xdata);               % for tunenorm
%         xdata = deg2rad(0:22.5:157.5);      % for xori
%         xdata = deg2rad(0:30:150);          % for ensembles
        m = p(1);
        a = p(2);
        c = p(3);
        ThetaP = p(4);
        predicted = m + a*exp(c*(cos(xdata-ThetaP)-1));
        
        log_L=sum(log(((predicted.^data).*exp(-1*predicted))./factorial(round(data))));
        if isinf(log_L) || isnan(log_L)
            predicted=predicted/10;
            data=data/10;
            log_L=sum(log(((predicted.^data).*exp(-1*predicted))./factorial(round(data))));
        end
        log_L=-1*log_L;
    end
end
