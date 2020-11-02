function [pars,log_L] = max_likelihood(p,data,lb,ub)
%p = initial guesses for parameters
% fits descriptive function from Freeman et al 2002 using maximum likelihood

% ori=(0:22.5:157.5);
options = optimset('TolFun',1e-5,'TolX',1e-4,'Maxiter',10000,'MaxFunEvals',10000,...
    'Display','off','LargeScale','off');

[pars,log_L]=fmincon(@mymodel,p,[],[],[],[],lb,ub,[],options);

log_ub=sum(log(((data.^data).*exp(-1*data))./factorial(round(data))));
ave_resp=mean(data)*ones(size(data,1),size(data,2));
log_lb=sum(log(((ave_resp.^data).*exp(-1*ave_resp))./factorial(round(data))));

log_L=[-1*log_L log_lb log_ub];

    function [log_L] = mymodel(p) %x0
        
%         base=x0(1);
%         resp=x0(2);
%         width=x0(3);
%         oripref=x0(4);
%         pred=base+resp*exp(width*(cos(deg2rad(2*(ori-oripref)))-1));
%         pred=pred';

        con1=[0 0.0625 0.125 0.25 0.5];
        con1=[con1 con1 con1 con1 con1];
        con2=[0*ones(1,5) 0.0625*ones(1,5) 0.125*ones(1,5) 0.25*ones(1,5) 0.5*ones(1,5)];
        con=[con1;con2];
        
        num=(p(2)*con(1,:)+p(4)*con(2,:)).^p(3);
        den=1+(p(5)*con(1,:)).^p(3)+(p(6)*con(2,:)).^p(3);
        
        predicted=p(1)+(num./den);
             
        log_L=sum(log(((predicted.^data).*exp(-1*predicted))./factorial(round(data))));
        if isinf(log_L) || isnan(log_L)
            predicted=predicted/10;
            data=data/10;
            log_L=sum(log(((predicted.^data).*exp(-1*predicted))./factorial(round(data))));
        end
        log_L=-1*log_L;
    end
end