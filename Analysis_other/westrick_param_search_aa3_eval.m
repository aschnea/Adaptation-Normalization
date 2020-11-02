%% param search evaluation
% loads param search files
% verifies key predictions are met
% plots values
% saves 'good' parameter combinations
clear
%% load files
% folder=fullfile('\\data.einsteinmed.org\users\Kohn Lab\amir_data\ParamSearch\');
folder=fullfile('\\data.einsteinmed.org\users\Anna Jasper\Amir\');
filename1='westrick_param_search_temp_';

% variable sizes:
% am=10x120x51 *2 *3
% R_plaid=10x120x51x51 *2 *3
% tune=10x120x180
% weights=10x120x120 *2 *3
% weights_adapt=10x1000x120x120 *2

% save fit quality (RMS or LSQ) of model to normalized data trend
% rank square and look at the ones that do the best

good=[];
%%
for n=10:10:630000
    filename=sprintf('%s%s%g.mat',folder,filename1,n);
%     m=matfile(filename);
    m=load(filename,'amrr','am2rr','am3rr');
    for a=1:10
        am=squeeze(m.amrr(a,:,:));
        am2=squeeze(m.am2rr(a,:,:));
        am3=squeeze(m.am3rr(a,:,:));
        tmp=mean(am2-am,1);
        tmp2=mean(am3-am,1);
        if all((tmp(5:end)-tmp2(5:end))>0)  % mean MI contingent always greater than mean MI asynchronous
            if all(tmp2<=0) && tmp(end)>0
                % cases where mean MI is negative for both at medium
                % contrast and mean MI is positive (negative) for
                % contingent (asynchronous) at highest contrast
                good=[good; n-10+a];
            end
        end
        clear am am2 am3 tmp tmp2
    end
    
    clear m a
end
