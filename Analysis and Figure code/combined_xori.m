%% Combined Model Comparisons
% matched test and adaptor

% Load variables 
clear; %close all;
% for e = 1
% A = load('129r001p163_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0163=A.SEM_f0;
% SEM_f1163=A.SEM_f1;
% SEM_f0post163=A.SEM_f0_post;
% SEM_f1post163=A.SEM_f1_post;
% pred163 = A.pred;
% pred_post163 = A.pred_post;
% params163 = A.params;
% params_post163 = A.params_post;
% fit_qual163 = A.fit_qual;
% fit_qual_post163 = A.fit_qual_post;
% resp_f0163 = A.resp_f0;
% resp_f1163 = A.resp_f1;
% resp_f0_post163 = A.resp_f0_post;
% resp_f1_post163 = A.resp_f1_post;
% cell_type163 = A.cell_type;
% LogL163 = A.LogL;
% LogL163_post= A.LogL_post;
% A = load('129r001p163_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre163 = A.NIpre;
% NIpost163 = A.NIpost;
% NIrPre163 = A.NIrPre;
% NIrPost163 = A.NIrPost;
% 
% 
% A = load('130l001p165_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0165=A.SEM_f0;
% SEM_f1165=A.SEM_f1;
% SEM_f0post165=A.SEM_f0_post;
% SEM_f1post165=A.SEM_f1_post;
% pred165 = A.pred;
% pred_post165 = A.pred_post;
% params165 = A.params;
% params_post165 = A.params_post;
% fit_qual165 = A.fit_qual;
% fit_qual_post165 = A.fit_qual_post;
% resp_f0165 = A.resp_f0;
% resp_f1165 = A.resp_f1;
% resp_f0_post165 = A.resp_f0_post;
% resp_f1_post165 = A.resp_f1_post;
% cell_type165 = A.cell_type;
% LogL165 = A.LogL;
% LogL165_post= A.LogL_post;
% A = load('130l001p165_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre165 = A.NIpre;
% NIpost165 = A.NIpost;
% NIrPre165 = A.NIrPre;
% NIrPost165 = A.NIrPost;
% 
% 
% A = load('p119_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0119=A.SEM_f0;
% SEM_f1119=A.SEM_f1;
% SEM_f0post119=A.SEM_f0_post;
% SEM_f1post119=A.SEM_f1_post;
% pred119 = A.pred;
% pred_post119 = A.pred_post;
% params119 = A.params;
% params_post119 = A.params_post;
% fit_qual119 = A.fit_qual;
% fit_qual_post119 = A.fit_qual_post;
% resp_f0119 = A.resp_f0;
% resp_f1119 = A.resp_f1;
% resp_f0_post119 = A.resp_f0_post;
% resp_f1_post119 = A.resp_f1_post;
% cell_type119 = A.cell_type;
% LogL119 = A.LogL;
% LogL119_post= A.LogL_post;
% A = load('p119_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre119 = A.NIpre;
% NIpost119 = A.NIpost;
% NIrPre119 = A.NIrPre;
% NIrPost119 = A.NIrPost;
% 
% 
% A = load('132l001p107_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0107=A.SEM_f0;
% SEM_f1107=A.SEM_f1;
% SEM_f0post107=A.SEM_f0_post;
% SEM_f1post107=A.SEM_f1_post;
% pred107 = A.pred;
% pred_post107 = A.pred_post;
% params107 = A.params;
% params_post107 = A.params_post;
% fit_qual107 = A.fit_qual;
% fit_qual_post107 = A.fit_qual_post;
% resp_f0107 = A.resp_f0;
% resp_f1107 = A.resp_f1;
% resp_f0_post107 = A.resp_f0_post;
% resp_f1_post107 = A.resp_f1_post;
% cell_type107 = A.cell_type;
% LogL107 = A.LogL;
% LogL107_post= A.LogL_post;
% A = load('132l001p107_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre107 = A.NIpre;
% NIpost107 = A.NIpost;
% NIrPre107 = A.NIrPre;
% NIrPost107 = A.NIrPost;
% 
% 
% A = load('p114_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0114=A.SEM_f0;
% SEM_f1114=A.SEM_f1;
% SEM_f0post114=A.SEM_f0_post;
% SEM_f1post114=A.SEM_f1_post;
% pred114 = A.pred;
% pred_post114 = A.pred_post;
% params114 = A.params;
% params_post114 = A.params_post;
% fit_qual114 = A.fit_qual;
% fit_qual_post114 = A.fit_qual_post;
% resp_f0114 = A.resp_f0;
% resp_f1114 = A.resp_f1;
% resp_f0_post114 = A.resp_f0_post;
% resp_f1_post114 = A.resp_f1_post;
% cell_type114 = A.cell_type;
% LogL114 = A.LogL;
% LogL114_post= A.LogL_post;
% A = load('p114_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre114 = A.NIpre;
% NIpost114 = A.NIpost;
% NIrPre114 = A.NIrPre;
% NIrPost114 = A.NIrPost;
% 
% 
% A = load('129r001p164c_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0164=A.SEM_f0;
% SEM_f1164=A.SEM_f1;
% SEM_f0post164=A.SEM_f0_post;
% SEM_f1post164=A.SEM_f1_post;
% pred164 = A.pred;
% pred_post164 = A.pred_post;
% params164 = A.params;
% params_post164 = A.params_post;
% fit_qual164 = A.fit_qual;
% fit_qual_post164 = A.fit_qual_post;
% resp_f0164 = A.resp_f0;
% resp_f1164 = A.resp_f1;
% resp_f0_post164 = A.resp_f0_post;
% resp_f1_post164 = A.resp_f1_post;
% cell_type164 = A.cell_type;
% LogL164 = A.LogL;
% LogL164_post= A.LogL_post;
% A = load('129r001p164c_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre164 = A.NIpre;
% NIpost164 = A.NIpost;
% NIrPre164 = A.NIrPre;
% NIrPost164 = A.NIrPost;
% 
% 
% A = load('130l001p166_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0166=A.SEM_f0;
% SEM_f1166=A.SEM_f1;
% SEM_f0post166=A.SEM_f0_post;
% SEM_f1post166=A.SEM_f1_post;
% pred166 = A.pred;
% pred_post166 = A.pred_post;
% params166 = A.params;
% params_post166 = A.params_post;
% fit_qual166 = A.fit_qual;
% fit_qual_post166 = A.fit_qual_post;
% resp_f0166 = A.resp_f0;
% resp_f1166 = A.resp_f1;
% resp_f0_post166 = A.resp_f0_post;
% resp_f1_post166 = A.resp_f1_post;
% cell_type166 = A.cell_type;
% LogL166 = A.LogL;
% LogL166_post= A.LogL_post;
% A = load('130l001p166_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre166 = A.NIpre;
% NIpost166 = A.NIpost;
% NIrPre166 = A.NIrPre;
% NIrPost166 = A.NIrPost;
% 
% 
% A = load('131r001p118c_ws_sorted_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0118=A.SEM_f0;
% SEM_f1118=A.SEM_f1;
% SEM_f0post118=A.SEM_f0_post;
% SEM_f1post118=A.SEM_f1_post;
% pred118 = A.pred;
% pred_post118 = A.pred_post;
% params118 = A.params;
% params_post118 = A.params_post;
% fit_qual118 = A.fit_qual;
% fit_qual_post118 = A.fit_qual_post;
% resp_f0118 = A.resp_f0;
% resp_f1118 = A.resp_f1;
% resp_f0_post118 = A.resp_f0_post;
% resp_f1_post118 = A.resp_f1_post;
% cell_type118 = A.cell_type;
% LogL118 = A.LogL;
% LogL118_post= A.LogL_post;
% A = load('131r001p118c_ws_sorted_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre118 = A.NIpre;
% NIpost118 = A.NIpost;
% NIrPre118 = A.NIrPre;
% NIrPost118 = A.NIrPost;
% 
% 
% A = load('132l001p109_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0109=A.SEM_f0;
% SEM_f1109=A.SEM_f1;
% SEM_f0post109=A.SEM_f0_post;
% SEM_f1post109=A.SEM_f1_post;
% pred109 = A.pred;
% pred_post109 = A.pred_post;
% params109 = A.params;
% params_post109 = A.params_post;
% fit_qual109 = A.fit_qual;
% fit_qual_post109 = A.fit_qual_post;
% resp_f0109 = A.resp_f0;
% resp_f1109 = A.resp_f1;
% resp_f0_post109 = A.resp_f0_post;
% resp_f1_post109 = A.resp_f1_post;
% cell_type109 = A.cell_type;
% LogL109 = A.LogL;
% LogL109_post= A.LogL_post;
% A = load('132l001p109_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre109 = A.NIpre;
% NIpost109 = A.NIpost;
% NIrPre109 = A.NIrPre;
% NIrPost109 = A.NIrPost;
% 
% 
% A = load('p115_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% SEM_f0115=A.SEM_f0;
% SEM_f1115=A.SEM_f1;
% SEM_f0post115=A.SEM_f0_post;
% SEM_f1post115=A.SEM_f1_post;
% pred115 = A.pred;
% pred_post115 = A.pred_post;
% params115 = A.params;
% params_post115 = A.params_post;
% fit_qual115 = A.fit_qual;
% fit_qual_post115 = A.fit_qual_post;
% resp_f0115 = A.resp_f0;
% resp_f1115 = A.resp_f1;
% resp_f0_post115 = A.resp_f0_post;
% resp_f1_post115 = A.resp_f1_post;
% cell_type115 = A.cell_type;
% LogL115 = A.LogL;
% LogL115_post= A.LogL_post;
% A = load('p115_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre115 = A.NIpre;
% NIpost115 = A.NIpost;
% NIrPre115 = A.NIrPre;
% NIrPost115 = A.NIrPost;
% 
% 
% % A = load('129r001p156_workspace_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% % SEM_f0156=A.SEM_f0;
% % SEM_f1156=A.SEM_f1;
% % SEM_f0post156=A.SEM_f0_post;
% % SEM_f1post156=A.SEM_f1_post;
% % pred156 = A.pred;
% % pred_post156 = A.pred_post;
% % params156 = A.params;
% % params_post156 = A.params_post;
% % fit_qual156 = A.fit_qual;
% % fit_qual_post156 = A.fit_qual_post;
% % resp_f0156 = A.resp_f0;
% % resp_f1156 = A.resp_f1;
% % resp_f0_post156 = A.resp_f0_post;
% % resp_f1_post156 = A.resp_f1_post;
% % cell_type156 = A.cell_type;
% % % LogL156 = A.LogL;
% % % LogL156_post= A.LogL_post;
% % A = load('129r001p156_workspace_sort_model_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
% % NIpre156 = A.NIpre;
% % NIpost156 = A.NIpost;
% % NIrPre156 = A.NIrPre;
% % NIrPost156 = A.NIrPost;
% % 
% % 
% % A = load('130l001p105_workspace_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% % SEM_f0105=A.SEM_f0;
% % SEM_f1105=A.SEM_f1;
% % SEM_f0post105=A.SEM_f0_post;
% % SEM_f1post105=A.SEM_f1_post;
% % pred105 = A.pred;
% % pred_post105 = A.pred_post;
% % params105 = A.params;
% % params_post105 = A.params_post;
% % fit_qual105 = A.fit_qual;
% % fit_qual_post105 = A.fit_qual_post;
% % resp_f0105 = A.resp_f0;
% % resp_f1105 = A.resp_f1;
% % resp_f0_post105 = A.resp_f0_post;
% % resp_f1_post105 = A.resp_f1_post;
% % cell_type105 = A.cell_type;
% % % LogL105 = A.LogL;
% % % LogL105_post= A.LogL_post;
% % A = load('130l001p105_workspace_sort_model_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
% % NIpre105 = A.NIpre;
% % NIpost105 = A.NIpost;
% % NIrPre105 = A.NIrPre;
% % NIrPost105 = A.NIrPost;
% % 
% % 
% % A = load('130r001p110_workspace_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% % SEM_f0110=A.SEM_f0;
% % SEM_f1110=A.SEM_f1;
% % SEM_f0post110=A.SEM_f0_post;
% % SEM_f1post110=A.SEM_f1_post;
% % pred110 = A.pred;
% % pred_post110 = A.pred_post;
% % params110 = A.params;
% % params_post110 = A.params_post;
% % fit_qual110 = A.fit_qual;
% % fit_qual_post110 = A.fit_qual_post;
% % resp_f0110 = A.resp_f0;
% % resp_f1110 = A.resp_f1;
% % resp_f0_post110 = A.resp_f0_post;
% % resp_f1_post110 = A.resp_f1_post;
% % cell_type110 = A.cell_type;
% % % LogL110 = A.LogL;
% % % LogL110_post= A.LogL_post;
% % A = load('130r001p110_workspace_sort_model_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
% % NIpre110 = A.NIpre;
% % NIpost110 = A.NIpost;
% % NIrPre110 = A.NIrPre;
% % NIrPost110 = A.NIrPost;
% % 
% % 
% % A = load('131r001p121_workspace_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% % SEM_f0121=A.SEM_f0;
% % SEM_f1121=A.SEM_f1;
% % SEM_f0post121=A.SEM_f0_post;
% % SEM_f1post121=A.SEM_f1_post;
% % pred121 = A.pred;
% % pred_post121 = A.pred_post;
% % params121 = A.params;
% % params_post121 = A.params_post;
% % fit_qual121 = A.fit_qual;
% % fit_qual_post121 = A.fit_qual_post;
% % resp_f0121 = A.resp_f0;
% % resp_f1121 = A.resp_f1;
% % resp_f0_post121 = A.resp_f0_post;
% % resp_f1_post121 = A.resp_f1_post;
% % cell_type121 = A.cell_type;
% % % LogL121 = A.LogL;
% % % LogL121_post= A.LogL_post;
% % A = load('131r001p121_workspace_sort_model_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
% % NIpre121 = A.NIpre;
% % NIpost121 = A.NIpost;
% % NIrPre121 = A.NIrPre;
% % NIrPost121 = A.NIrPost;
% % 
% % 
% % A = load('132l001p106_ws_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% % SEM_f0106=A.SEM_f0;
% % SEM_f1106=A.SEM_f1;
% % SEM_f0post106=A.SEM_f0_post;
% % SEM_f1post106=A.SEM_f1_post;
% % pred106 = A.pred;
% % pred_post106 = A.pred_post;
% % params106 = A.params;
% % params_post106 = A.params_post;
% % fit_qual106 = A.fit_qual;
% % fit_qual_post106 = A.fit_qual_post;
% % resp_f0106 = A.resp_f0;
% % resp_f1106 = A.resp_f1;
% % resp_f0_post106 = A.resp_f0_post;
% % resp_f1_post106 = A.resp_f1_post;
% % cell_type106 = A.cell_type;
% % % LogL106 = A.LogL;
% % % LogL106_post= A.LogL_post;
% % A = load('132l001p106_ws_sort_model_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
% % NIpre106 = A.NIpre;
% % NIpost106 = A.NIpost;
% % NIrPre106 = A.NIrPre;
% % NIrPost106 = A.NIrPost;
% % 
% % 
% % A = load('132r002p116_workspace_sort_model.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
% % SEM_f0116=A.SEM_f0;
% % SEM_f1116=A.SEM_f1;
% % SEM_f0post116=A.SEM_f0_post;
% % SEM_f1post116=A.SEM_f1_post;
% % pred116 = A.pred;
% % pred_post116 = A.pred_post;
% % params116 = A.params;
% % params_post116 = A.params_post;
% % fit_qual116 = A.fit_qual;
% % fit_qual_post116 = A.fit_qual_post;
% % resp_f0116 = A.resp_f0;
% % resp_f1116 = A.resp_f1;
% % resp_f0_post116 = A.resp_f0_post;
% % resp_f1_post116 = A.resp_f1_post;
% % cell_type116 = A.cell_type;
% % % LogL116 = A.LogL;
% % % LogL116_post= A.LogL_post;
% % A = load('132r002p116_workspace_sort_model_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
% % NIpre116 = A.NIpre;
% % NIpost116 = A.NIpost;
% % NIrPre116 = A.NIrPre;
% % NIrPost116 = A.NIrPost;
% end
%% sorted together: (for recovery figure)
A = load('contingent1_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0163=A.SEM_f0;
SEM_f1163=A.SEM_f1;
SEM_f0post163=A.SEM_f0_post;
SEM_f1post163=A.SEM_f1_post;
pred163 = A.pred;
pred_post163 = A.pred_post;
params163 = A.params;
params_post163 = A.params_post;
fit_qual163 = A.fit_qual;
fit_qual_post163 = A.fit_qual_post;
resp_f0163 = A.resp_f0;
resp_f1163 = A.resp_f1;
resp_f0_post163 = A.resp_f0_post;
resp_f1_post163 = A.resp_f1_post;
cell_type163 = A.cell_type;
LogL163 = A.LogL;
LogL163_post= A.LogL_post;
% A = load('129r001p163_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre163 = A.NIpre;
% NIpost163 = A.NIpost;
% NIrPre163 = A.NIrPre;
% NIrPost163 = A.NIrPost;


A = load('contingent2_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0165=A.SEM_f0;
SEM_f1165=A.SEM_f1;
SEM_f0post165=A.SEM_f0_post;
SEM_f1post165=A.SEM_f1_post;
pred165 = A.pred;
pred_post165 = A.pred_post;
params165 = A.params;
params_post165 = A.params_post;
fit_qual165 = A.fit_qual;
fit_qual_post165 = A.fit_qual_post;
resp_f0165 = A.resp_f0;
resp_f1165 = A.resp_f1;
resp_f0_post165 = A.resp_f0_post;
resp_f1_post165 = A.resp_f1_post;
cell_type165 = A.cell_type;
LogL165 = A.LogL;
LogL165_post= A.LogL_post;
% A = load('130l001p165_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre165 = A.NIpre;
% NIpost165 = A.NIpost;
% NIrPre165 = A.NIrPre;
% NIrPost165 = A.NIrPost;


A = load('contingent3_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0119=A.SEM_f0;
SEM_f1119=A.SEM_f1;
SEM_f0post119=A.SEM_f0_post;
SEM_f1post119=A.SEM_f1_post;
pred119 = A.pred;
pred_post119 = A.pred_post;
params119 = A.params;
params_post119 = A.params_post;
fit_qual119 = A.fit_qual;
fit_qual_post119 = A.fit_qual_post;
resp_f0119 = A.resp_f0;
resp_f1119 = A.resp_f1;
resp_f0_post119 = A.resp_f0_post;
resp_f1_post119 = A.resp_f1_post;
cell_type119 = A.cell_type;
LogL119 = A.LogL;
LogL119_post= A.LogL_post;
% A = load('p119_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre119 = A.NIpre;
% NIpost119 = A.NIpost;
% NIrPre119 = A.NIrPre;
% NIrPost119 = A.NIrPost;


A = load('contingent4_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0107=A.SEM_f0;
SEM_f1107=A.SEM_f1;
SEM_f0post107=A.SEM_f0_post;
SEM_f1post107=A.SEM_f1_post;
pred107 = A.pred;
pred_post107 = A.pred_post;
params107 = A.params;
params_post107 = A.params_post;
fit_qual107 = A.fit_qual;
fit_qual_post107 = A.fit_qual_post;
resp_f0107 = A.resp_f0;
resp_f1107 = A.resp_f1;
resp_f0_post107 = A.resp_f0_post;
resp_f1_post107 = A.resp_f1_post;
cell_type107 = A.cell_type;
LogL107 = A.LogL;
LogL107_post= A.LogL_post;
% A = load('132l001p107_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre107 = A.NIpre;
% NIpost107 = A.NIpost;
% NIrPre107 = A.NIrPre;
% NIrPost107 = A.NIrPost;


A = load('contingent5_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0114=A.SEM_f0;
SEM_f1114=A.SEM_f1;
SEM_f0post114=A.SEM_f0_post;
SEM_f1post114=A.SEM_f1_post;
pred114 = A.pred;
pred_post114 = A.pred_post;
params114 = A.params;
params_post114 = A.params_post;
fit_qual114 = A.fit_qual;
fit_qual_post114 = A.fit_qual_post;
resp_f0114 = A.resp_f0;
resp_f1114 = A.resp_f1;
resp_f0_post114 = A.resp_f0_post;
resp_f1_post114 = A.resp_f1_post;
cell_type114 = A.cell_type;
LogL114 = A.LogL;
LogL114_post= A.LogL_post;
% A = load('p114_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre114 = A.NIpre;
% NIpost114 = A.NIpost;
% NIrPre114 = A.NIrPre;
% NIrPost114 = A.NIrPost;


A = load('asynch1_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0164=A.SEM_f0;
SEM_f1164=A.SEM_f1;
SEM_f0post164=A.SEM_f0_post;
SEM_f1post164=A.SEM_f1_post;
pred164 = A.pred;
pred_post164 = A.pred_post;
params164 = A.params;
params_post164 = A.params_post;
fit_qual164 = A.fit_qual;
fit_qual_post164 = A.fit_qual_post;
resp_f0164 = A.resp_f0;
resp_f1164 = A.resp_f1;
resp_f0_post164 = A.resp_f0_post;
resp_f1_post164 = A.resp_f1_post;
cell_type164 = A.cell_type;
LogL164 = A.LogL;
LogL164_post= A.LogL_post;
% A = load('129r001p164c_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre164 = A.NIpre;
% NIpost164 = A.NIpost;
% NIrPre164 = A.NIrPre;
% NIrPost164 = A.NIrPost;


A = load('asynch2_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0166=A.SEM_f0;
SEM_f1166=A.SEM_f1;
SEM_f0post166=A.SEM_f0_post;
SEM_f1post166=A.SEM_f1_post;
pred166 = A.pred;
pred_post166 = A.pred_post;
params166 = A.params;
params_post166 = A.params_post;
fit_qual166 = A.fit_qual;
fit_qual_post166 = A.fit_qual_post;
resp_f0166 = A.resp_f0;
resp_f1166 = A.resp_f1;
resp_f0_post166 = A.resp_f0_post;
resp_f1_post166 = A.resp_f1_post;
cell_type166 = A.cell_type;
LogL166 = A.LogL;
LogL166_post= A.LogL_post;
% A = load('130l001p166_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre166 = A.NIpre;
% NIpost166 = A.NIpost;
% NIrPre166 = A.NIrPre;
% NIrPost166 = A.NIrPost;


A = load('asynch3_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0118=A.SEM_f0;
SEM_f1118=A.SEM_f1;
SEM_f0post118=A.SEM_f0_post;
SEM_f1post118=A.SEM_f1_post;
pred118 = A.pred;
pred_post118 = A.pred_post;
params118 = A.params;
params_post118 = A.params_post;
fit_qual118 = A.fit_qual;
fit_qual_post118 = A.fit_qual_post;
resp_f0118 = A.resp_f0;
resp_f1118 = A.resp_f1;
resp_f0_post118 = A.resp_f0_post;
resp_f1_post118 = A.resp_f1_post;
cell_type118 = A.cell_type;
LogL118 = A.LogL;
LogL118_post= A.LogL_post;
% A = load('131r001p118c_ws_sorted_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre118 = A.NIpre;
% NIpost118 = A.NIpost;
% NIrPre118 = A.NIrPre;
% NIrPost118 = A.NIrPost;


A = load('asynch4_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0109=A.SEM_f0;
SEM_f1109=A.SEM_f1;
SEM_f0post109=A.SEM_f0_post;
SEM_f1post109=A.SEM_f1_post;
pred109 = A.pred;
pred_post109 = A.pred_post;
params109 = A.params;
params_post109 = A.params_post;
fit_qual109 = A.fit_qual;
fit_qual_post109 = A.fit_qual_post;
resp_f0109 = A.resp_f0;
resp_f1109 = A.resp_f1;
resp_f0_post109 = A.resp_f0_post;
resp_f1_post109 = A.resp_f1_post;
cell_type109 = A.cell_type;
LogL109 = A.LogL;
LogL109_post= A.LogL_post;
% A = load('132l001p109_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre109 = A.NIpre;
% NIpost109 = A.NIpost;
% NIrPre109 = A.NIrPre;
% NIrPost109 = A.NIrPost;


A = load('asynch5_proc.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0115=A.SEM_f0;
SEM_f1115=A.SEM_f1;
SEM_f0post115=A.SEM_f0_post;
SEM_f1post115=A.SEM_f1_post;
pred115 = A.pred;
pred_post115 = A.pred_post;
params115 = A.params;
params_post115 = A.params_post;
fit_qual115 = A.fit_qual;
fit_qual_post115 = A.fit_qual_post;
resp_f0115 = A.resp_f0;
resp_f1115 = A.resp_f1;
resp_f0_post115 = A.resp_f0_post;
resp_f1_post115 = A.resp_f1_post;
cell_type115 = A.cell_type;
LogL115 = A.LogL;
LogL115_post= A.LogL_post;
% A = load('p115_ws_sort_model_NI_logl.mat','NIpre','NIpost','NIrPre','NIrPost');
% NIpre115 = A.NIpre;
% NIpost115 = A.NIpost;
% NIrPre115 = A.NIrPre;
% NIrPost115 = A.NIrPost;

clear A
%% define combined variables
params_pre_sync = [params163; params165; params119; params107; params114];
params_post_sync = [params_post163; params_post165; params_post119; params_post107; params_post114];
fit_qual_pre_sync = [fit_qual163 fit_qual165 fit_qual119 fit_qual107 fit_qual114];
fit_qual_post_sync = [fit_qual_post163 fit_qual_post165 fit_qual_post119 fit_qual_post107 fit_qual_post114];
f0_pre_sync = [resp_f0163; resp_f0165; resp_f0119; resp_f0107; resp_f0114];
f0_post_sync = [resp_f0_post163; resp_f0_post165; resp_f0_post119; resp_f0_post107; resp_f0_post114];
f1_pre_sync = [resp_f1163; resp_f1165; resp_f1119; resp_f1107; resp_f1114];
f1_post_sync = [resp_f1_post163; resp_f1_post165; resp_f1_post119; resp_f1_post107; resp_f1_post114];
% stderr_pre_sync = [stderr_pre163; stderr_pre165; stderr_pre119; stderr_pre107; stderr_pre114];
% stderr_post_sync = [stderr_post163; stderr_post165; stderr_post119; stderr_post107; stderr_post114];
cell_type_sync = [cell_type163 cell_type165 cell_type119 cell_type107 cell_type114];
% NI_pre_sync = [NIpre163; NIpre165; NIpre119; NIpre107; NIpre114];
% NIrm_pre_sync = [NIrPre163; NIrPre165; NIrPre119; NIrPre107; NIrPre114];
% NI_post_sync = [NIpost163; NIpost165; NIpost119; NIpost107; NIpost114];
% NIrm_post_sync = [NIrPost163; NIrPost165; NIrPost119; NIrPost107; NIrPost114];
pred_pre_sync = [pred163; pred165; pred119; pred107; pred114];
pred_post_sync = [pred_post163; pred_post165; pred_post119; pred_post107; pred_post114];
SEM_f0_sync = [SEM_f0163; SEM_f0165; SEM_f0119; SEM_f0107; SEM_f0114];
SEM_f1_sync = [SEM_f1163; SEM_f1165; SEM_f1119; SEM_f1107; SEM_f1114];
SEM_f0_post_sync = [SEM_f0post163; SEM_f0post165; SEM_f0post119; SEM_f0post107; SEM_f0post114];
SEM_f1_post_sync = [SEM_f1post163; SEM_f1post165; SEM_f1post119; SEM_f1post107; SEM_f1post114];
LogL_sync=[LogL163; LogL165; LogL119; LogL107; LogL114];
LogL_sync_post=[LogL163_post; LogL165_post; LogL119_post; LogL107_post; LogL114_post];

params_pre_int = [params164; params166; params118; params109; params115];
params_post_int = [params_post164; params_post166; params_post118; params_post109; params_post115];
fit_qual_pre_int = [fit_qual164 fit_qual166 fit_qual118 fit_qual109 fit_qual115];
fit_qual_post_int = [fit_qual_post164 fit_qual_post166 fit_qual_post118 fit_qual_post109 fit_qual_post115];
f0_pre_int = [resp_f0164; resp_f0166; resp_f0118; resp_f0109; resp_f0115];
f0_post_int = [resp_f0_post164; resp_f0_post166; resp_f0_post118; resp_f0_post109; resp_f0_post115];
f1_pre_int = [resp_f1164; resp_f1166; resp_f1118; resp_f1109; resp_f1115];
f1_post_int = [resp_f1_post164; resp_f1_post166; resp_f1_post118; resp_f1_post109; resp_f1_post115];
% stderr_pre_int = [stderr_pre164; stderr_pre166; stderr_pre118; stderr_pre109; stderr_pre115];
% stderr_post_int = [stderr_post164; stderr_post166; stderr_post118; stderr_post109; stderr_post115];
cell_type_int = [cell_type164 cell_type166 cell_type118 cell_type109 cell_type115];
% NI_pre_int = [NIpre164; NIpre166; NIpre118; NIpre109; NIpre115];
% NIrm_pre_int = [NIrPre164; NIrPre166; NIrPre118; NIrPre109; NIrPre115];
% NI_post_int = [NIpost164; NIpost166; NIpost118; NIpost109; NIpost115];
% NIrm_post_int = [NIrPost164; NIrPost166; NIrPost118; NIrPost109; NIrPost115];
pred_pre_int = [pred164; pred166; pred118; pred109; pred115];
pred_post_int = [pred_post164; pred_post166; pred_post118; pred_post109; pred_post115];
SEM_f0_int = [SEM_f0164; SEM_f0166; SEM_f0118; SEM_f0109; SEM_f0115];
SEM_f1_int = [SEM_f1164; SEM_f1166; SEM_f1118; SEM_f1109; SEM_f1115];
SEM_f0_post_int = [SEM_f0post164; SEM_f0post166; SEM_f0post118; SEM_f0post109; SEM_f0post115];
SEM_f1_post_int = [SEM_f1post164; SEM_f1post166; SEM_f1post118; SEM_f1post109; SEM_f1post115];
LogL_int=[LogL164; LogL166; LogL118; LogL109; LogL115];
LogL_int_post=[LogL164_post; LogL166_post; LogL118_post; LogL109_post; LogL115_post];

% params_pre_comp = [params156; params105; params110; params121; params106; params116];
% params_post_comp = [params_post156; params_post105; params_post110; params_post121; params_post106; params_post116];
% fit_qual_pre_comp = [fit_qual156 fit_qual105 fit_qual110 fit_qual121 fit_qual106 fit_qual116];
% fit_qual_post_comp = [fit_qual_post156 fit_qual_post105 fit_qual_post110 fit_qual_post121 fit_qual_post106 fit_qual_post116];
% f0_pre_comp = [resp_f0156; resp_f0105; resp_f0110; resp_f0121; resp_f0106; resp_f0116];
% f0_post_comp = [resp_f0_post156; resp_f0_post105; resp_f0_post110; resp_f0_post121; resp_f0_post106; resp_f0_post116];
% f1_pre_comp = [resp_f1156; resp_f1105; resp_f1110; resp_f1121; resp_f1106; resp_f1116];
% f1_post_comp = [resp_f1_post156; resp_f1_post105; resp_f1_post110; resp_f1_post121; resp_f1_post106; resp_f1_post116];
% % stderr_pre_comp = [stderr_pre156; stderr_pre105; stderr_pre110; stderr_pre121; stderr_pre106; stderr_pre116];
% % stderr_post_comp = [stderr_post156; stderr_post105; stderr_post110; stderr_post121; stderr_post106; stderr_post116];
% cell_type_comp = [cell_type156 cell_type105 cell_type110 cell_type121 cell_type106 cell_type116];
% NI_pre_comp = [NIpre156; NIpre105; NIpre110; NIpre121; NIpre106; NIpre116];
% NIrm_pre_comp = [NIrPre156; NIrPre105; NIrPre110; NIrPre121; NIrPre106; NIrPre116];
% NI_post_comp = [NIpost156; NIpost105; NIpost110; NIpost121; NIpost106; NIpost116];
% NIrm_post_comp = [NIrPost156; NIrPost105; NIrPost110; NIrPost121; NIrPost106; NIrPost116];
% pred_pre_comp = [pred156; pred105; pred110; pred121; pred106; pred116];
% pred_post_comp = [pred_post156; pred_post105; pred_post110; pred_post121; pred_post106; pred_post116];
% SEM_f0_comp = [SEM_f0156; SEM_f0105; SEM_f0110; SEM_f0121; SEM_f0106; SEM_f0116];
% SEM_f1_comp = [SEM_f1156; SEM_f1105; SEM_f1110; SEM_f1121; SEM_f1106; SEM_f1116];
% SEM_f0_post_comp = [SEM_f0post156; SEM_f0post105; SEM_f0post110; SEM_f0post121; SEM_f0post106; SEM_f0post116];
% SEM_f1_post_comp = [SEM_f1post156; SEM_f1post105; SEM_f1post110; SEM_f1post121; SEM_f1post106; SEM_f1post116];

% NIrm_pre_sync(:) = 1-NIrm_pre_sync(:);
% NIrm_pre_int(:) = 1 - NIrm_pre_int(:);
% NIrm_pre_comp(:) = 1 - NIrm_pre_comp(:);
% NIrm_post_sync(:) = 1 - NIrm_post_sync(:);
% NIrm_post_int(:) = 1 - NIrm_post_int(:);
% NIrm_post_comp(:) = 1 - NIrm_post_comp(:);
clearvars -except SEM_f0_comp SEM_f1_comp SEM_f0_post_comp SEM_f1_post_comp...
    SEM_f0_int SEM_f1_int SEM_f0_post_int SEM_f1_post_int...
    SEM_f0_sync SEM_f1_sync SEM_f0_post_sync SEM_f1_post_sync...
    NIrm_post_comp NI_post_comp NIrm_pre_comp NI_pre_comp cell_type_comp stderr_post_comp stderr_pre_comp...
    f1_post_comp f1_pre_comp f0_post_comp f0_pre_comp fit_qual_post_comp fit_qual_pre_comp params_post_comp params_pre_comp...
    NIrm_post_sync NI_post_sync NIrm_pre_sync NI_pre_sync cell_type_sync stderr_post_sync stderr_pre_sync f1_post_sync...
    f1_pre_sync f0_post_sync f0_pre_sync fit_qual_post_sync fit_qual_pre_sync params_post_sync params_pre_sync...
    NIrm_post_int NI_post_int NIrm_pre_int NI_pre_int cell_type_int stderr_post_int stderr_pre_int f1_post_int...
    f1_pre_int f0_post_int f0_pre_int fit_qual_post_int fit_qual_pre_int params_post_int params_pre_int...
    pred_pre_sync pred_post_sync pred_pre_int pred_post_int pred_pre_comp pred_post_comp...
    LogL_sync LogL_int LogL_sync_post LogL_int_post
disp('vars loaded')

%% Log liklihood normalization (setting between 0 and 1)

figure
subplot(2,2,1); histogram(LogL_sync(:,4),0:0.1:1)
subplot(2,2,2); histogram(LogL_sync_post(:,4),0:0.1:1)
subplot(2,2,3); histogram(LogL_int(:,4),0:0.1:1)
subplot(2,2,4); histogram(LogL_int_post(:,4),0:0.1:1)

%% Area Under Curve: Masking Index
% (a-b)/(a+b) where a = area under preferred grating curve; b = area under plaid (test+mask)
% 'a' and 'b' half rectified before metric is computed
% greater area metric values = more normalized; small values = less normalized
% Figure 3

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
                if f0_post_sync(e,5) > f0_post_sync(e,1)+3*SEM_f0_sync(e,1)
                    tmp2(e,1) = (trapz(f0_post_sync(e,1:5))-trapz(f0_post_sync(e,[1 1 1 1 1])));
                    tmp2(e,2) = (trapz(f0_post_sync(e,21:25))-trapz(f0_post_sync(e,[21 21 21 21 21])));
                    tmp2(e,3) = (trapz(f0_post_sync(e,16:20))-trapz(f0_post_sync(e,[16 16 16 16 16])));
                    tmp2(e,4) = (trapz(f0_post_sync(e,11:15))-trapz(f0_post_sync(e,[11 11 11 11 11])));
                    tmp2(e,5) = (trapz(f0_post_sync(e,6:10))-trapz(f0_post_sync(e,[6 6 6 6 6])));
                else
                    tmp2(e,:) = nan;
                end
            else
                tmp(e,:) = nan;
                tmp2(e,:)=nan;
            end
        else
            if f0_pre_sync(e,21)> f0_pre_sync(e,1)+3*SEM_f0_sync(e,1)
                tmp(e,1) = (trapz(f0_pre_sync(e,[1 6 11 16 21]))-trapz(f0_pre_sync(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f0_pre_sync(e,[5 10 15 20 25]))-trapz(f0_pre_sync(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f0_pre_sync(e,[4 9 14 19 24]))-trapz(f0_pre_sync(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f0_pre_sync(e,[3 8 13 18 23]))-trapz(f0_pre_sync(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f0_pre_sync(e,[2 7 12 17 22]))-trapz(f0_pre_sync(e,[2 2 2 2 2])));
            else
                tmp(e,:) = nan;
            end
            if f0_post_sync(e,21) > f0_post_sync(e,1)+3*SEM_f0_sync(e,1)
                tmp2(e,1) = (trapz(f0_post_sync(e,[1 6 11 16 21]))-trapz(f0_post_sync(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f0_post_sync(e,[5 10 15 20 25]))-trapz(f0_post_sync(e,[5 5 5 5 5])));
                tmp2(e,3) = (trapz(f0_post_sync(e,[4 9 14 19 24]))-trapz(f0_post_sync(e,[4 4 4 4 4])));
                tmp2(e,4) = (trapz(f0_post_sync(e,[3 8 13 18 23]))-trapz(f0_post_sync(e,[3 3 3 3 3])));
                tmp2(e,5) = (trapz(f0_post_sync(e,[2 7 12 17 22]))-trapz(f0_post_sync(e,[2 2 2 2 2])));
            else
                tmp2(e,:) = nan;
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
                if f1_post_sync(e,5) > f1_post_sync(e,1)+3*SEM_f1_sync(e,1)
                    tmp2(e,1) = (trapz(f1_post_sync(e,1:5))-trapz(f1_post_sync(e,[1 1 1 1 1])));
                    tmp2(e,2) = (trapz(f1_post_sync(e,21:25))-trapz(f1_post_sync(e,[21 21 21 21 21])));
                    tmp2(e,3) = (trapz(f1_post_sync(e,16:20))-trapz(f1_post_sync(e,[16 16 16 16 16])));
                    tmp2(e,4) = (trapz(f1_post_sync(e,11:15))-trapz(f1_post_sync(e,[11 11 11 11 11])));
                    tmp2(e,5) = (trapz(f1_post_sync(e,6:10))-trapz(f1_post_sync(e,[6 6 6 6 6])));
                else
                    tmp2(e,:) = nan;
                end
            else
                tmp(e,:) = nan;
                tmp2(e,:)=nan;
            end
        else
            if f1_pre_sync(e,21)> f1_pre_sync(e,1)+3*SEM_f1_sync(e,1)
                tmp(e,1) = (trapz(f1_pre_sync(e,[1 6 11 16 21]))-trapz(f1_pre_sync(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f1_pre_sync(e,[5 10 15 20 25]))-trapz(f1_pre_sync(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f1_pre_sync(e,[4 9 14 19 24]))-trapz(f1_pre_sync(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f1_pre_sync(e,[3 8 13 18 23]))-trapz(f1_pre_sync(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f1_pre_sync(e,[2 7 12 17 22]))-trapz(f1_pre_sync(e,[2 2 2 2 2])));
                if f1_post_sync(e,21) > f1_post_sync(e,1)+3*SEM_f1_sync(e,1)
                    tmp2(e,1) = (trapz(f1_post_sync(e,[1 6 11 16 21]))-trapz(f1_post_sync(e,[1 1 1 1 1])));
                    tmp2(e,2) = (trapz(f1_post_sync(e,[5 10 15 20 25]))-trapz(f1_post_sync(e,[5 5 5 5 5])));
                    tmp2(e,3) = (trapz(f1_post_sync(e,[4 9 14 19 24]))-trapz(f1_post_sync(e,[4 4 4 4 4])));
                    tmp2(e,4) = (trapz(f1_post_sync(e,[3 8 13 18 23]))-trapz(f1_post_sync(e,[3 3 3 3 3])));
                    tmp2(e,5) = (trapz(f1_post_sync(e,[2 7 12 17 22]))-trapz(f1_post_sync(e,[2 2 2 2 2])));
                else
                    tmp2(e,:) = nan;
                end
            else
                tmp(e,:) = nan;
                tmp2(e,:)=nan;
            end
        end
    end
end

tmp(tmp<0)=0;                           % removes negative areas
tmp2(tmp2<0)=0;

for e = 1:length(cell_type_sync)        % calculates area metric for each mask %
    Area_pre_sync1(e) = (tmp(e,1)-tmp(e,2))/(tmp(e,1)+tmp(e,2));
    Area_post_sync1(e)= (tmp2(e,1)-tmp2(e,2))/(tmp2(e,1)+tmp2(e,2));
    
    Area_pre_sync2(e) = (tmp(e,1)-tmp(e,3))/(tmp(e,1)+tmp(e,3));
    Area_post_sync2(e)= (tmp2(e,1)-tmp2(e,3))/(tmp2(e,1)+tmp2(e,3));
    
    Area_pre_sync3(e) = (tmp(e,1)-tmp(e,4))/(tmp(e,1)+tmp(e,4));
    Area_post_sync3(e)= (tmp2(e,1)-tmp2(e,4))/(tmp2(e,1)+tmp2(e,4));
    
    Area_pre_sync4(e) = (tmp(e,1)-tmp(e,5))/(tmp(e,1)+tmp(e,5));
    Area_post_sync4(e)= (tmp2(e,1)-tmp2(e,5))/(tmp2(e,1)+tmp2(e,5));
end
for e = 1:length(Area_pre_sync1)        % cleans up invalid (nan) responses
    if Area_pre_sync1(e) == -1
        Area_pre_sync1(e) = nan;
        Area_post_sync1(e)= nan;
    end
    if Area_post_sync1(e) == -1
        Area_pre_sync1(e) = nan;
        Area_post_sync1(e)= nan;
    end
    if isnan(Area_pre_sync1(e))
        Area_post_sync1(e) = nan;
    end
    if isnan(Area_post_sync1(e))
        Area_pre_sync1(e) = nan;
    end
end
for e = 1:length(Area_pre_sync2)
    if Area_pre_sync2(e) == -1
        Area_pre_sync2(e) = nan;
        Area_post_sync2(e)= nan;
    end
    if Area_post_sync2(e) == -1
        Area_pre_sync2(e) = nan;
        Area_post_sync2(e)= nan;
    end
    if isnan(Area_pre_sync2(e))
        Area_post_sync2(e) = nan;
    end
    if isnan(Area_post_sync2(e))
        Area_pre_sync2(e) = nan;
    end
end
for e = 1:length(Area_pre_sync3)
    if Area_pre_sync3(e) == -1
        Area_pre_sync3(e) = nan;
        Area_post_sync3(e)= nan;
    end
    if Area_post_sync3(e) == -1
        Area_pre_sync3(e) = nan;
        Area_post_sync3(e)= nan;
    end
    if isnan(Area_pre_sync3(e))
        Area_post_sync3(e) = nan;
    end
    if isnan(Area_post_sync3(e))
        Area_pre_sync3(e) = nan;
    end
end
for e = 1:length(Area_pre_sync4)
    if Area_pre_sync4(e) == -1
        Area_pre_sync4(e) = nan;
        Area_post_sync4(e)= nan;
    end
    if Area_post_sync4(e) == -1
        Area_pre_sync4(e) = nan;
        Area_post_sync4(e)= nan;
    end
    if isnan(Area_pre_sync4(e))
        Area_post_sync4(e) = nan;
    end
    if isnan(Area_post_sync4(e))
        Area_pre_sync4(e) = nan;
    end
end

% ASYNCHRONOUS/INTERLEAVED
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
                if f0_post_int(e,5) > f0_post_int(e,1)+3*SEM_f0_int(e,1)
                    tmp2(e,1) = (trapz(f0_post_int(e,1:5))-trapz(f0_post_int(e,[1 1 1 1 1])));
                    tmp2(e,2) = (trapz(f0_post_int(e,21:25))-trapz(f0_post_int(e,[21 21 21 21 21])));
                    tmp2(e,3) = (trapz(f0_post_int(e,16:20))-trapz(f0_post_int(e,[16 16 16 16 16])));
                    tmp2(e,4) = (trapz(f0_post_int(e,11:15))-trapz(f0_post_int(e,[11 11 11 11 11])));
                    tmp2(e,5) = (trapz(f0_post_int(e,6:10))-trapz(f0_post_int(e,[6 6 6 6 6])));
                else
                    tmp2(e,:) = nan;
                end
            else
                tmp(e,:) = nan;
                tmp2(e,:)=nan;
            end
        else
            if f0_pre_int(e,21)> f0_pre_int(e,1)+3*SEM_f0_int(e,1)
                tmp(e,1) = (trapz(f0_pre_int(e,[1 6 11 16 21]))-trapz(f0_pre_int(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f0_pre_int(e,[5 10 15 20 25]))-trapz(f0_pre_int(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f0_pre_int(e,[4 9 14 19 24]))-trapz(f0_pre_int(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f0_pre_int(e,[3 8 13 18 23]))-trapz(f0_pre_int(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f0_pre_int(e,[2 7 12 17 22]))-trapz(f0_pre_int(e,[2 2 2 2 2])));
            else
                tmp(e,:) = nan;
            end
            if f0_post_int(e,21) > f0_post_int(e,1)+3*SEM_f0_int(e,1)
                tmp2(e,1) = (trapz(f0_post_int(e,[1 6 11 16 21]))-trapz(f0_post_int(e,[1 1 1 1 1])));
                tmp2(e,2) = (trapz(f0_post_int(e,[5 10 15 20 25]))-trapz(f0_post_int(e,[5 5 5 5 5])));
                tmp2(e,3) = (trapz(f0_post_int(e,[4 9 14 19 24]))-trapz(f0_post_int(e,[4 4 4 4 4])));
                tmp2(e,4) = (trapz(f0_post_int(e,[3 8 13 18 23]))-trapz(f0_post_int(e,[3 3 3 3 3])));
                tmp2(e,5) = (trapz(f0_post_int(e,[2 7 12 17 22]))-trapz(f0_post_int(e,[2 2 2 2 2])));
            else
                tmp2(e,:) = nan;
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
                if f1_post_int(e,5) > f1_post_int(e,1)+3*SEM_f1_int(e,1)
                    tmp2(e,1) = (trapz(f1_post_int(e,1:5))-trapz(f1_post_int(e,[1 1 1 1 1])));
                    tmp2(e,2) = (trapz(f1_post_int(e,21:25))-trapz(f1_post_int(e,[21 21 21 21 21])));
                    tmp2(e,3) = (trapz(f1_post_int(e,16:20))-trapz(f1_post_int(e,[16 16 16 16 16])));
                    tmp2(e,4) = (trapz(f1_post_int(e,11:15))-trapz(f1_post_int(e,[11 11 11 11 11])));
                    tmp2(e,5) = (trapz(f1_post_int(e,6:10))-trapz(f1_post_int(e,[6 6 6 6 6])));
                else
                    tmp2(e,:) = nan;
                end
            else
                tmp(e,:) = nan;
                tmp2(e,:)=nan;
            end
        else
            if f1_pre_int(e,21)> f1_pre_int(e,1)+3*SEM_f1_int(e,1)
                tmp(e,1) = (trapz(f1_pre_int(e,[1 6 11 16 21]))-trapz(f1_pre_int(e,[1 1 1 1 1])));
                tmp(e,2) = (trapz(f1_pre_int(e,[5 10 15 20 25]))-trapz(f1_pre_int(e,[5 5 5 5 5])));
                tmp(e,3) = (trapz(f1_pre_int(e,[4 9 14 19 24]))-trapz(f1_pre_int(e,[4 4 4 4 4])));
                tmp(e,4) = (trapz(f1_pre_int(e,[3 8 13 18 23]))-trapz(f1_pre_int(e,[3 3 3 3 3])));
                tmp(e,5) = (trapz(f1_pre_int(e,[2 7 12 17 22]))-trapz(f1_pre_int(e,[2 2 2 2 2])));
                if f1_post_int(e,21) > f1_post_int(e,1)+3*SEM_f1_int(e,1)
                    tmp2(e,1) = (trapz(f1_post_int(e,[1 6 11 16 21]))-trapz(f1_post_int(e,[1 1 1 1 1])));
                    tmp2(e,2) = (trapz(f1_post_int(e,[5 10 15 20 25]))-trapz(f1_post_int(e,[5 5 5 5 5])));
                    tmp2(e,3) = (trapz(f1_post_int(e,[4 9 14 19 24]))-trapz(f1_post_int(e,[4 4 4 4 4])));
                    tmp2(e,4) = (trapz(f1_post_int(e,[3 8 13 18 23]))-trapz(f1_post_int(e,[3 3 3 3 3])));
                    tmp2(e,5) = (trapz(f1_post_int(e,[2 7 12 17 22]))-trapz(f1_post_int(e,[2 2 2 2 2])));
                else
                    tmp2(e,:) = nan;
                end
            else
                tmp(e,:) = nan;
                tmp2(e,:)=nan;
            end
        end
    end
end

tmp(tmp<0)=0;
tmp2(tmp2<0)=0;

for e = 1:length(cell_type_int)
    Area_pre_int1(e) = (tmp(e,1)-tmp(e,2))/(tmp(e,1)+tmp(e,2)); % 50
    Area_post_int1(e)= (tmp2(e,1)-tmp2(e,2))/(tmp2(e,1)+tmp2(e,2));
    
    Area_pre_int2(e) = (tmp(e,1)-tmp(e,3))/(tmp(e,1)+tmp(e,3)); % 25
    Area_post_int2(e)= (tmp2(e,1)-tmp2(e,3))/(tmp2(e,1)+tmp2(e,3));
    
    Area_pre_int3(e) = (tmp(e,1)-tmp(e,4))/(tmp(e,1)+tmp(e,4)); % 12
    Area_post_int3(e)= (tmp2(e,1)-tmp2(e,4))/(tmp2(e,1)+tmp2(e,4));
    
    Area_pre_int4(e) = (tmp(e,1)-tmp(e,5))/(tmp(e,1)+tmp(e,5)); % 6
    Area_post_int4(e)= (tmp2(e,1)-tmp2(e,5))/(tmp2(e,1)+tmp2(e,5));
end
for e = 1:length(Area_pre_int1)
    if Area_pre_int1(e) == -1
        Area_pre_int1(e) = nan;
        Area_post_int1(e)= nan;
    end
    if Area_post_int1(e) == -1
        Area_pre_int1(e) = nan;
        Area_post_int1(e)= nan;
    end
    if isnan(Area_pre_int1(e))
        Area_post_int1(e) = nan;
    end
    if isnan(Area_post_int1(e))
        Area_pre_int1(e) = nan;
    end
end
for e = 1:length(Area_pre_int2)
    if Area_pre_int2(e) == -1
        Area_pre_int2(e) = nan;
        Area_post_int2(e)= nan;
    end
    if Area_post_int2(e) == -1
        Area_pre_int2(e) = nan;
        Area_post_int2(e)= nan;
    end
    if isnan(Area_pre_int2(e))
        Area_post_int2(e) = nan;
    end
    if isnan(Area_post_int2(e))
        Area_pre_int2(e) = nan;
    end
end
for e = 1:length(Area_pre_int3)
    if Area_pre_int3(e) == -1
        Area_pre_int3(e) = nan;
        Area_post_int3(e)= nan;
    end
    if Area_post_int3(e) == -1
        Area_pre_int3(e) = nan;
        Area_post_int3(e)= nan;
    end
    if isnan(Area_pre_int3(e))
        Area_post_int3(e) = nan;
    end
    if isnan(Area_post_int3(e))
        Area_pre_int3(e) = nan;
    end
end
for e = 1:length(Area_pre_int4)
    if Area_pre_int4(e) == -1
        Area_pre_int4(e) = nan;
        Area_post_int4(e)= nan;
    end
    if Area_post_int4(e) == -1
        Area_pre_int4(e) = nan;
        Area_post_int4(e)= nan;
    end
    if isnan(Area_pre_int4(e))
        Area_post_int4(e) = nan;
    end
    if isnan(Area_post_int4(e))
        Area_pre_int4(e) = nan;
    end
end

% % % % % % % Histograms of Area (dif(post-pre)
figure;     % subplot for each mask
subplot(2,4,4); hold on
histogram(Area_post_sync1-Area_pre_sync1,-2:0.2:2)
plot([0 0],[0 120],'k--')
title('Contingent, mask=50%')
axis square
set(gca,'TickDir','out')
subplot(2,4,3); hold on
histogram(Area_post_sync2-Area_pre_sync2,-2:0.2:2)
plot([0 0],[0 80],'k--')
title('mask=25%')
axis square
subplot(2,4,2); hold on
histogram(Area_post_sync3-Area_pre_sync3,-2:0.2:2)
plot([0 0],[0 80],'k--')
title('mask=12%')
axis square
subplot(2,4,1); hold on
histogram(Area_post_sync4-Area_pre_sync4,-2:0.2:2)
plot([0 0],[0 80],'k--')
title('mask=6%')
axis square
subplot(2,4,8); hold on
histogram(Area_post_int1-Area_pre_int1,-2:0.2:2)
plot([0 0],[0 35],'k--')
set(gca,'TickDir','out')
title('Asynchronous, mask=50%')
axis square
subplot(2,4,7); hold on
histogram(Area_post_int2-Area_pre_int2,-2:0.2:2)
plot([0 0],[0 30],'k--')
title('mask=25%')
axis square
subplot(2,4,6); hold on
histogram(Area_post_int3-Area_pre_int3,-2:0.2:2)
plot([0 0],[0 30],'k--')
title('mask=12%')
axis square
subplot(2,4,5); hold on
histogram(Area_post_int4-Area_pre_int4,-2:0.2:2)
plot([0 0],[0 30],'k--')
title('mask=6%')
axis square
xlabel('Area Index Difference (Post-Pre)')
ylabel('# of Units')
supertitle('Difference, Area(post)-Area(pre)')

% % % % % % means
Area_mean_sync = [nanmean(Area_pre_sync1) nanmean(Area_pre_sync2) nanmean(Area_pre_sync3) nanmean(Area_pre_sync4)];
Area_mean_sync_post = [nanmean(Area_post_sync1) nanmean(Area_post_sync2) nanmean(Area_post_sync3) nanmean(Area_post_sync4)];
Area_SEM_sync = [nanstd(Area_pre_sync1)/sqrt(length(Area_pre_sync1)) nanstd(Area_pre_sync2)/sqrt(length(Area_pre_sync2)) nanstd(Area_pre_sync3)/sqrt(length(Area_pre_sync3)) nanstd(Area_pre_sync4)/sqrt(length(Area_pre_sync4))];
Area_SEM_sync_post = [nanstd(Area_post_sync1)/sqrt(length(Area_post_sync1)) nanstd(Area_post_sync2)/sqrt(length(Area_post_sync2)) nanstd(Area_post_sync3)/sqrt(length(Area_post_sync3)) nanstd(Area_post_sync4)/sqrt(length(Area_post_sync4))];
Area_std_sync = [nanstd(Area_pre_sync1) nanstd(Area_pre_sync2) nanstd(Area_pre_sync3) nanstd(Area_pre_sync4)];
Area_std_sync_post = [nanstd(Area_post_sync1) nanstd(Area_post_sync2) nanstd(Area_post_sync3) nanstd(Area_post_sync4)];

Area_mean_int = [nanmean(Area_pre_int1) nanmean(Area_pre_int2) nanmean(Area_pre_int3) nanmean(Area_pre_int4)];
Area_mean_int_post = [nanmean(Area_post_int1) nanmean(Area_post_int2) nanmean(Area_post_int3) nanmean(Area_post_int4)];
Area_SEM_int = [nanstd(Area_pre_int1)/sqrt(length(Area_pre_int1)) nanstd(Area_pre_int2)/sqrt(length(Area_pre_int2)) nanstd(Area_pre_int3)/sqrt(length(Area_pre_int3)) nanstd(Area_pre_int4)/sqrt(length(Area_pre_int4))];
Area_SEM_int_post = [nanstd(Area_post_int1)/sqrt(length(Area_post_int1)) nanstd(Area_post_int2)/sqrt(length(Area_post_int2)) nanstd(Area_post_int3)/sqrt(length(Area_post_int3)) nanstd(Area_post_int4)/sqrt(length(Area_post_int4))];
Area_std_int = [nanstd(Area_pre_int1) nanstd(Area_pre_int2) nanstd(Area_pre_int3) nanstd(Area_pre_int4)];
Area_std_int_post = [nanstd(Area_post_int1) nanstd(Area_post_int2) nanstd(Area_post_int3) nanstd(Area_post_int4)];

[nanmean([Area_pre_sync4 Area_pre_int4]) nanmean([Area_pre_sync3 Area_pre_int3]) nanmean([Area_pre_sync2 Area_pre_int2]) nanmean([Area_pre_sync1 Area_pre_int1])];
[nanstd([Area_pre_sync4 Area_pre_int4])/sqrt(248+369) nanstd([Area_pre_sync3 Area_pre_int3])/sqrt(248+369) nanstd([Area_pre_sync2 Area_pre_int2])/sqrt(248+369) nanstd([Area_pre_sync1 Area_pre_int1])/sqrt(248+369)];
 
[ttest_AUC_sync1, p_AUC_sync1] = ttest(Area_post_sync1,Area_pre_sync1);
[ttest_AUC_sync2, p_AUC_sync2] = ttest(Area_post_sync2,Area_pre_sync2);
[ttest_AUC_sync3, p_AUC_sync3] = ttest(Area_post_sync3,Area_pre_sync3);
[ttest_AUC_sync4, p_AUC_sync4] = ttest(Area_post_sync4,Area_pre_sync4);

[ttest_AUC_int1, p_AUC_int1] = ttest(Area_post_int1,Area_pre_int1);
[ttest_AUC_int2, p_AUC_int2] = ttest(Area_post_int2,Area_pre_int2);
[ttest_AUC_int3, p_AUC_int3] = ttest(Area_post_int3,Area_pre_int3);
[ttest_AUC_int4, p_AUC_int4] = ttest(Area_post_int4,Area_pre_int4);

disp('AUC')

%% Ratio of f1/f0
% Figure 4A
for e = 1:length(f0_pre_sync)
    if cell_type_sync==0
        if f0_pre_sync(e,5)>f0_pre_sync(e,21)
            Fratio_sync(e)=f1_pre_sync(e,5)/(f0_pre_sync(e,5)-f0_pre_sync(e,1));
        else
            Fratio_sync(e)=f1_pre_sync(e,21)/(f0_pre_sync(e,21)-f0_pre_sync(e,1));
        end
    else
        if f1_pre_sync(e,5)>f1_pre_sync(e,21)
            Fratio_sync(e)=f1_pre_sync(e,5)/(f0_pre_sync(e,5)-f0_pre_sync(e,1));
        else
            Fratio_sync(e)=f1_pre_sync(e,21)/(f0_pre_sync(e,21)-f0_pre_sync(e,1));
        end
    end
end

for e = 1:length(f0_pre_int)
    if cell_type_int==0
        if f0_pre_int(e,5)>f0_pre_int(e,21)
            Fratio_int(e)=f1_pre_int(e,5)/(f0_pre_int(e,5)-f0_pre_int(e,1));
        else
            Fratio_int(e)=f1_pre_int(e,21)/(f0_pre_int(e,21)-f0_pre_int(e,1));
        end
    else
        if f1_pre_int(e,5)>f1_pre_int(e,21)
            Fratio_int(e)=f1_pre_int(e,5)/(f0_pre_int(e,5)-f0_pre_int(e,1));
        else
            Fratio_int(e)=f1_pre_int(e,21)/(f0_pre_int(e,21)-f0_pre_int(e,1));
        end
    end
end

% spearman correlation:
clear tmp tmp2
tmp=Fratio_sync(~isnan(Area_pre_sync2));
tmp2=Area_pre_sync2(~isnan(Area_pre_sync2));
[Fcorr_s, Fcorr_s2]=corr(tmp',tmp2','Type','Spearman');
clear tmp tmp2
tmp=Fratio_int(~isnan(Area_pre_int2));
tmp2=Area_pre_int2(~isnan(Area_pre_int2));
[Fcorr_a, Fcorr_a2]=corr(tmp',tmp2','Type','Spearman');

%% rate adaptation
i=1;
for e=1:length(cell_type_sync)
    if cell_type_sync(e)==0
        if f0_pre_sync(e,5)>f0_pre_sync(e,21)
            rateadapt_s(i)=f0_post_sync(e,5)/f0_pre_sync(e,5);
            i=i+1;
        else
            rateadapt_s(i)=f0_post_sync(e,21)/f0_pre_sync(e,21);
            i=i+1;
        end
    else
        if f1_pre_sync(e,5)>f1_pre_sync(e,21)
            rateadapt_s(i)=f1_post_sync(e,5)/f1_pre_sync(e,5);
            i=i+1;
        else
            rateadapt_s(i)=f1_post_sync(e,21)/f1_pre_sync(e,21);
            i=i+1;
        end
    end
end
i=1;
for e=1:length(cell_type_int)
    if cell_type_int(e)==0
        if f0_pre_int(e,5)>f0_pre_int(e,21)
            rateadapt_a(i)=f0_post_int(e,5)/f0_pre_int(e,5);
            i=i+1;
        else
            rateadapt_a(i)=f0_post_int(e,21)/f0_pre_int(e,21);
            i=i+1;
        end
    else
        if f1_pre_int(e,5)>f1_pre_int(e,21)
            rateadapt_a(i)=f1_post_int(e,5)/f1_pre_int(e,5);
            i=i+1;
        else
            rateadapt_a(i)=f1_post_int(e,21)/f1_pre_int(e,21);
            i=i+1;
        end
    end
end
rateadapt_s=rateadapt_s(~isnan(Area_pre_sync2));
tmp=(Area_post_sync2-Area_pre_sync2); tmp=tmp(~isnan(tmp));
[r_rateadapt_s, p_rateadapt_s]=corr(rateadapt_s',tmp','type','Spearman')
rateadapt_a=rateadapt_a(~isnan(Area_pre_int2));
tmp=(Area_post_int2-Area_pre_int2); tmp=tmp(~isnan(tmp));
[r_rateadapt_a, p_rateadapt_a]=corr(rateadapt_a',tmp','type','Spearman')

%% Normalization Indices (basic) / Suppression Index (SI)
% % % % % % basic index % % % % % % %
% % % % % % % constraining values between -2:2

NI_pre_sync(NI_pre_sync<-2)=-2.0;
NI_post_sync(NI_post_sync<-2)=-2.0;
NI_pre_int(NI_pre_int<-2)=-2.0;
NI_post_int(NI_post_int<-2)=-2.0;
NI_pre_sync(NI_pre_sync>2)=2.0;
NI_post_sync(NI_post_sync>2)=2.0;
NI_pre_int(NI_pre_int>2)=2;
NI_post_int(NI_post_int>2)=2.0;

% Remove NaNs - units that didn't fit inclusion criteria
% % % % Contingent
for e = 1:length(cell_type_sync)
    si_sync_pre(e,:) = NI_pre_sync(e,:);
    si_sync_post(e,:)=NI_post_sync(e,:);
end
for e = 1:size(si_sync_pre,1)
    for f = 1:size(si_sync_pre,2)

        if isnan(si_sync_pre(e,f))
            si_sync_post(e,f) = nan;
        end
        
        if isnan(si_sync_post(e,f))
            si_sync_pre(e,f) = nan;
        end
    end
end
% % % % Interleaved
for e = 1:length(cell_type_int)
        si_int_pre(e,:) = NI_pre_int(e,:);
        si_int_post(e,:)=NI_post_int(e,:);
end
for e = 1:size(si_int_pre,1)
    for f = 1:size(si_int_pre,2)

        if isnan(si_int_pre(e,f))
            si_int_post(e,f) = nan;
        end

        if isnan(si_int_post(e,f))
            si_int_pre(e,f) = nan;
        end
    end
end

% % % % % % % SCATTERPLOT
figure % SPLIT BY MASK: plots every valid case (unit can be represented >1x)
for e = 1:length(si_sync_pre)
    subplot(2,4,1); hold on
    plot((si_sync_pre(e,1:4)),(si_sync_post(e,1:4)),'k.')
    subplot(2,4,2); hold on
    plot((si_sync_pre(e,5:8)),(si_sync_post(e,5:8)),'k.')
    subplot(2,4,3); hold on
    plot((si_sync_pre(e,9:12)),(si_sync_post(e,9:12)),'k.')
    subplot(2,4,4); hold on
    plot((si_sync_pre(e,13:16)),(si_sync_post(e,13:16)),'k.')
end
subplot(2,4,1); hold on
supertitle('SI basic')
axis square
xlabel('NI Pre-Adapt')
ylabel('NI Post-Adapt')
title('contingent')
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,2); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,3); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,4); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)

for e = 1:length(si_int_pre)
    subplot(2,4,5); hold on
    plot((si_int_pre(e,1:4)),(si_int_post(e,1:4)),'k.')
    subplot(2,4,6); hold on
    plot((si_int_pre(e,5:8)),(si_int_post(e,5:8)),'k.')
    subplot(2,4,7); hold on
    plot((si_int_pre(e,9:12)),(si_int_post(e,9:12)),'k.')
    subplot(2,4,8); hold on
    plot((si_int_pre(e,13:16)),(si_int_post(e,13:16)),'k.')
end
subplot(2,4,5); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
title('async')
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,6); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,7); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,8); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)


% % % % % % % % Histograms of NI difference (post-pre)
figure;     % subplot for each mask
subplot(2,4,4); hold on
tmp=si_sync_post(:,13:16)-si_sync_pre(:,13:16);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 80],'k--')
axis square
title('Contingent, mask=50%')
set(gca,'TickDir','out')
subplot(2,4,3); hold on
tmp=si_sync_post(:,9:12)-si_sync_pre(:,9:12);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 80],'k--')
axis square
title('mask=25%')
set(gca,'TickDir','out')
subplot(2,4,2); hold on
tmp=si_sync_post(:,5:8)-si_sync_pre(:,5:8);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 80],'k--')
axis square
title('mask=12%')
set(gca,'TickDir','out')
subplot(2,4,1); hold on
tmp=si_sync_post(:,1:4)-si_sync_pre(:,1:4);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 80],'k--')
axis square
title('mask=6%')
set(gca,'TickDir','out')
subplot(2,4,8); hold on
tmp=si_int_post(:,13:16)-si_int_pre(:,13:16);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 25],'k--')
axis square
title('Asynchronous')
set(gca,'TickDir','out')
subplot(2,4,7); hold on
tmp=si_int_post(:,9:12)-si_int_pre(:,9:12);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 25],'k--')
axis square
set(gca,'TickDir','out')
subplot(2,4,6); hold on
tmp=si_int_post(:,5:8)-si_int_pre(:,5:8);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 25],'k--')
axis square
set(gca,'TickDir','out')
subplot(2,4,5); hold on
tmp=si_int_post(:,1:4)-si_int_pre(:,1:4);
% tmp(tmp<-5)=-5; tmp(tmp>5)=5;
histogram(tmp,-3:0.25:3)
plot([0 0],[0 25],'k--')
axis square
xlabel('SI Difference (Post-Pre)')
ylabel('# of Units')
set(gca,'TickDir','out')
supertitle('SI basic, SI(post)-SI(pre)')

% % % % % % % % Summary and stats % % % % % % %
clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24
si_mean_sync_pre = nanmean(si_sync_pre(:));

temp1 = [si_sync_pre(:,1); si_sync_pre(:,2); si_sync_pre(:,3); si_sync_pre(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [si_sync_pre(:,4); si_sync_pre(:,6); si_sync_pre(:,7); si_sync_pre(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [si_sync_pre(:,9); si_sync_pre(:,10); si_sync_pre(:,11); si_sync_pre(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [si_sync_pre(:,13); si_sync_pre(:,14); si_sync_pre(:,15); si_sync_pre(:,16)]; temp4 = temp4(~isnan(temp4));
si_mean_sync_pre_m6 = nanmean(temp1);
si_mean_sync_pre_m12 = nanmean(temp2);
si_mean_sync_pre_m25 = nanmean(temp3);
si_mean_sync_pre_m50 =nanmean(temp4);


temp21 = [si_sync_post(:,1); si_sync_post(:,2); si_sync_post(:,3); si_sync_post(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [si_sync_post(:,4); si_sync_post(:,6); si_sync_post(:,7); si_sync_post(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [si_sync_post(:,9); si_sync_post(:,10); si_sync_post(:,11); si_sync_post(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [si_sync_post(:,13); si_sync_post(:,14); si_sync_post(:,15); si_sync_post(:,16)]; temp24 = temp24(~isnan(temp24));
si_mean_sync_post=nanmean(si_sync_post(:));
si_mean_sync_post_m6 = nanmean(temp21);
si_mean_sync_post_m12 = nanmean(temp22);
si_mean_sync_post_m25 = nanmean(temp23);
si_mean_sync_post_m50 = nanmean(temp24);
si_sync_dif=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];

figure
subplot(1,2,1); hold on
a=errorline(0.5,si_mean_sync_post_m6-si_mean_sync_pre_m6,nanstd(temp21-temp1)/sqrt(length(temp1)),'ko');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',5)
a=errorline(1,si_mean_sync_post_m12-si_mean_sync_pre_m12,nanstd(temp22-temp2)/sqrt(length(temp2)),'ko');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',5)
a=errorline(1.5,si_mean_sync_post_m25-si_mean_sync_pre_m25,nanstd(temp23-temp3)/sqrt(length(temp3)),'ko');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',5)
a=errorline(2,si_mean_sync_post_m50-si_mean_sync_pre_m50,nanstd(temp24-temp4)/sqrt(length(temp4)),'ko');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',5)
plot([0.4 2.1],[0 0],'k--')
xlabel('Mask Contrast')
ylabel('Mean NI Difference')
xlim([0.4 2.1])
ylim([-.5 1])
axis square
title('Contingent')
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})
supertitle('SI basic summary')

% % INTERLEAVED
clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24
si_mean_int_pre = nanmean(si_int_pre(:));

temp1 = [si_int_pre(:,1); si_int_pre(:,2); si_int_pre(:,3); si_int_pre(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [si_int_pre(:,4); si_int_pre(:,6); si_int_pre(:,7); si_int_pre(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [si_int_pre(:,9); si_int_pre(:,10); si_int_pre(:,11); si_int_pre(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [si_int_pre(:,13); si_int_pre(:,14); si_int_pre(:,15); si_int_pre(:,16)]; temp4 = temp4(~isnan(temp4));
si_mean_int_pre_m6 = nanmean(temp1);
si_mean_int_pre_m12 = nanmean(temp2);
si_mean_int_pre_m25 = nanmean(temp3);
si_mean_int_pre_m50 =nanmean(temp4);

temp21 = [si_int_post(:,1); si_int_post(:,2); si_int_post(:,3); si_int_post(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [si_int_post(:,4); si_int_post(:,6); si_int_post(:,7); si_int_post(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [si_int_post(:,9); si_int_post(:,10); si_int_post(:,11); si_int_post(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [si_int_post(:,13); si_int_post(:,14); si_int_post(:,15); si_int_post(:,16)]; temp24 = temp24(~isnan(temp24));

si_mean_int_post=nanmean(si_int_post(:));
si_mean_int_post_m6 = nanmean(temp21);
si_mean_int_post_m12 = nanmean(temp22);
si_mean_int_post_m25 = nanmean(temp23);
si_mean_int_post_m50 = nanmean(temp24);
si_int_dif=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];

subplot(1,2,2); hold on
a=errorline(0.5,si_mean_int_post_m6-si_mean_int_pre_m6,nanstd(temp21-temp1)/sqrt(length(temp1)),'ko');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',5)
a=errorline(1,si_mean_int_post_m12-si_mean_int_pre_m12,nanstd(temp22-temp2)/sqrt(length(temp2)),'ko');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',5)
a=errorline(1.5,si_mean_int_post_m25-si_mean_int_pre_m25,nanstd(temp23-temp3)/sqrt(length(temp3)),'ko');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',5)
a=errorline(2,si_mean_int_post_m50-si_mean_int_pre_m50,nanstd(temp24-temp4)/sqrt(length(temp4)),'ko');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',5)
plot([0.4 2.1],[0 0],'k--')
xlim([0.4 2.1])
ylim([-.5 1])
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})
title('Asynchronous')
axis square
clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24


%% Normalization Index - Response-Matching 
% Figure 5C
% summation index = 1 - Plaid/sum(gratings)
% bigger values = more normalization
% % % % % % % constraining values between -2:2
NIrm_pre_sync(NIrm_pre_sync<-2)=-2.0;
NIrm_post_sync(NIrm_post_sync<-2)=-2.0;
NIrm_pre_int(NIrm_pre_int<-2)=-2.0;
NIrm_post_int(NIrm_post_int<-2)=-2.0;
NIrm_pre_sync(NIrm_pre_sync>2)=2.0;
NIrm_post_sync(NIrm_post_sync>2)=2.0;
NIrm_pre_int(NIrm_pre_int>2)=2.;
NIrm_post_int(NIrm_post_int>2)=2.0;


% Remove NaNs - units that didn't fit inclusion criteria (see CalcNormalization.m)
% % % % Contingent
for e = 1:length(cell_type_sync)
    rm_sync_pre(e,:) = NIrm_pre_sync(e,:);
    rm_sync_post(e,:)=NIrm_post_sync(e,:);
end
for e = 1:size(rm_sync_pre,1)
    for f = 1:size(rm_sync_pre,2)

        if isnan(rm_sync_pre(e,f))
            rm_sync_post(e,f) = nan;
        end
        
        if isnan(rm_sync_post(e,f))
            rm_sync_pre(e,f) = nan;
        end
    end
end
% % % % Interleaved
for e = 1:length(cell_type_int)
        rm_int_pre(e,:) = NIrm_pre_int(e,:);
        rm_int_post(e,:)=NIrm_post_int(e,:);
end
for e = 1:size(rm_int_pre,1)
    for f = 1:size(rm_int_pre,2)

        if isnan(rm_int_pre(e,f))
            rm_int_post(e,f) = nan;
        end

        if isnan(rm_int_post(e,f))
            rm_int_pre(e,f) = nan;
        end
    end
end

% % % % % % % SCATTERPLOT
figure % SPLIT BY MASK: plots every valid case (unit can be represented >1x)
for e = 1:length(rm_sync_pre)
    subplot(2,4,1); hold on
    plot((rm_sync_pre(e,1:4)),(rm_sync_post(e,1:4)),'k.')
    subplot(2,4,2); hold on
    plot((rm_sync_pre(e,5:8)),(rm_sync_post(e,5:8)),'k.')
    subplot(2,4,3); hold on
    plot((rm_sync_pre(e,9:12)),(rm_sync_post(e,9:12)),'k.')
    subplot(2,4,4); hold on
    plot((rm_sync_pre(e,13:16)),(rm_sync_post(e,13:16)),'k.')
end
supertitle('rate match SI')
subplot(2,4,1); hold on
title('Contingent')
axis square
xlabel('NI Pre-Adapt')
ylabel('NI Post-Adapt')
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,2); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,3); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,4); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)

for e = 1:length(rm_int_pre)
    subplot(2,4,5); hold on
    plot((rm_int_pre(e,1:4)),(rm_int_post(e,1:4)),'k.')
    subplot(2,4,6); hold on
    plot((rm_int_pre(e,5:8)),(rm_int_post(e,5:8)),'k.')
    subplot(2,4,7); hold on
    plot((rm_int_pre(e,9:12)),(rm_int_post(e,9:12)),'k.')
    subplot(2,4,8); hold on
    plot((rm_int_pre(e,13:16)),(rm_int_post(e,13:16)),'k.')
end
subplot(2,4,5); hold on
title('interleaved')
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,6); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,7); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)
subplot(2,4,8); hold on
axis square
xlim([-2.2 2.2])
ylim([-2.2 2.2])
set(gca,'XTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],'TickDir','out')
refline(1,0)


% just 50-50 case for contingent and asynchronous
figure;     % subplot for each mask
subplot(121); hold on
tmp=rm_sync_post(:,16)-rm_sync_pre(:,16);
histogram(tmp,-2:0.2:2)
plot([0 0],[0 40],'k--')
axis square
set(gca,'TickDir','out')
title('Contingent Adaptation')
subplot(122); hold on
tmp=rm_int_post(:,16)-rm_int_pre(:,16);
histogram(tmp,-2:0.2:2)
plot([0 0],[0 20],'k--')
axis square
set(gca,'TickDir','out')
title('Asynchronous Adaptation')
supertitle('rate match histogram')

% % % % % % % % Summary and stats % % % % % % %
clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24
NIrm_mean_sync_pre = nanmean(rm_sync_pre(:));

temp1 = [rm_sync_pre(:,1); rm_sync_pre(:,2); rm_sync_pre(:,3); rm_sync_pre(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [rm_sync_pre(:,5); rm_sync_pre(:,6); rm_sync_pre(:,7); rm_sync_pre(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [rm_sync_pre(:,9); rm_sync_pre(:,10); rm_sync_pre(:,11); rm_sync_pre(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [rm_sync_pre(:,13); rm_sync_pre(:,14); rm_sync_pre(:,15); rm_sync_pre(:,16)]; temp4 = temp4(~isnan(temp4));
NIrm_mean_sync_pre_m6 = nanmean(temp1);
NIrm_mean_sync_pre_m12 = nanmean(temp2);
NIrm_mean_sync_pre_m25 = nanmean(temp3);
NIrm_mean_sync_pre_m50 =nanmean(temp4);

temp21 = [rm_sync_post(:,1); rm_sync_post(:,2); rm_sync_post(:,3); rm_sync_post(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [rm_sync_post(:,5); rm_sync_post(:,6); rm_sync_post(:,7); rm_sync_post(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [rm_sync_post(:,9); rm_sync_post(:,10); rm_sync_post(:,11); rm_sync_post(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [rm_sync_post(:,13); rm_sync_post(:,14); rm_sync_post(:,15); rm_sync_post(:,16)]; temp24 = temp24(~isnan(temp24));
NIrm_mean_sync_post =   nanmean(rm_sync_post(:));
NIrm_mean_sync_post_m6 = nanmean(temp21);
NIrm_mean_sync_post_m12 = nanmean(temp22);
NIrm_mean_sync_post_m25 = nanmean(temp23);
NIrm_mean_sync_post_m50 = nanmean(temp24);
NIrm_sync_dif=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];

figure
subplot(1,2,1); hold on
a=errorline(0.5,NIrm_mean_sync_post_m6-NIrm_mean_sync_pre_m6,nanstd(temp21-temp1)/sqrt(length(temp1)),'ko');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',5)
a=errorline(1,NIrm_mean_sync_post_m12-NIrm_mean_sync_pre_m12,nanstd(temp22-temp2)/sqrt(length(temp2)),'ko');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',5)
a=errorline(1.5,NIrm_mean_sync_post_m25-NIrm_mean_sync_pre_m25,nanstd(temp23-temp3)/sqrt(length(temp3)),'ko');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',5)
a=errorline(2,NIrm_mean_sync_post_m50-NIrm_mean_sync_pre_m50,nanstd(temp24-temp4)/sqrt(length(temp4)),'ko');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',5)
plot([0.4 2.1],[0 0],'k--')
xlabel('Mask Contrast')
ylabel('Mean NI Difference')
xlim([0.4 2.1])
ylim([-.5 1])
axis square
title('Contingent')
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})
supertitle('rate-match summary (averages)')


% % INTERLEAVED
clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24
NIrm_mean_int_pre = nanmean(rm_int_pre(:));

temp1 = [rm_int_pre(:,1); rm_int_pre(:,2); rm_int_pre(:,3); rm_int_pre(:,4)]; temp1=temp1(~isnan(temp1));
temp2 = [rm_int_pre(:,5); rm_int_pre(:,6); rm_int_pre(:,7); rm_int_pre(:,8)]; temp2 = temp2(~isnan(temp2));
temp3 = [rm_int_pre(:,9); rm_int_pre(:,10); rm_int_pre(:,11); rm_int_pre(:,12)]; temp3 = temp3(~isnan(temp3)); 
temp4 = [rm_int_pre(:,13); rm_int_pre(:,14); rm_int_pre(:,15); rm_int_pre(:,16)]; temp4 = temp4(~isnan(temp4));
NIrm_mean_int_pre_m6 = nanmean(temp1);
NIrm_mean_int_pre_m12 = nanmean(temp2);
NIrm_mean_int_pre_m25 = nanmean(temp3);
NIrm_mean_int_pre_m50 =nanmean(temp4);

temp21 = [rm_int_post(:,1); rm_int_post(:,2); rm_int_post(:,3); rm_int_post(:,4)]; temp21=temp21(~isnan(temp21));
temp22 = [rm_int_post(:,5); rm_int_post(:,6); rm_int_post(:,7); rm_int_post(:,8)]; temp22 = temp22(~isnan(temp22));
temp23 = [rm_int_post(:,9); rm_int_post(:,10); rm_int_post(:,11); rm_int_post(:,12)]; temp23 = temp23(~isnan(temp23)); 
temp24 = [rm_int_post(:,13); rm_int_post(:,14); rm_int_post(:,15); rm_int_post(:,16)]; temp24 = temp24(~isnan(temp24));

NIrm_mean_int_post =    nanmean(rm_int_post(:));
NIrm_mean_int_post_m6 = nanmean(temp21);
NIrm_mean_int_post_m12 = nanmean(temp22);
NIrm_mean_int_post_m25 = nanmean(temp23);
NIrm_mean_int_post_m50 = nanmean(temp24);
NIrm_int_dif=[nanmean(temp21-temp1) nanmean(temp22-temp2) nanmean(temp23-temp3) nanmean(temp24-temp4)];

subplot(1,2,2); hold on
a=errorline(0.5,NIrm_mean_int_post_m6-NIrm_mean_int_pre_m6,nanstd(temp21-temp1)/sqrt(length(temp1)),'ko');
set(a,'MarkerFaceColor',[0 0 0],'MarkerSize',5)
a=errorline(1,NIrm_mean_int_post_m12-NIrm_mean_int_pre_m12,nanstd(temp22-temp2)/sqrt(length(temp2)),'ko');
set(a,'MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',5)
a=errorline(1.5,NIrm_mean_int_post_m25-NIrm_mean_int_pre_m25,nanstd(temp23-temp3)/sqrt(length(temp3)),'ko');
set(a,'MarkerFaceColor',[0.4 0.4 0.4],'MarkerSize',5)
a=errorline(2,NIrm_mean_int_post_m50-NIrm_mean_int_pre_m50,nanstd(temp24-temp4)/sqrt(length(temp4)),'ko');
set(a,'MarkerFaceColor',[0.6 0.6 0.6],'MarkerSize',5)
plot([0.4 2.1],[0 0],'k--')
xlim([0.4 2.1])
ylim([-.5 1])
set(gca,'XTick',[0.5 1 1.5 2],'TickDir','out','XTickLabel',{'6','12','25','50'})
title('Asynchronous')
axis square
clear tmp tmp2 temp1 temp2 temp3 temp4 temp21 temp22 temp23 temp24

[ttest_SI_sync, p_SI_sync] = ttest(rm_sync_post(:,16),rm_sync_pre(:,16));
[ttest_SI_int, p_SI_int] = ttest(rm_int_post(:,16),rm_int_pre(:,16));

stop
%% Load variables for rotated adaptor
clear;

% async
A = load('136l001p155_fit.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0155=A.SEM_f0;
SEM_f1155=A.SEM_f1;
SEM_f0post155=A.SEM_f0_post;
SEM_f1post155=A.SEM_f1_post;
pred155 = A.pred;
pred_post155 = A.pred_post;
params155 = A.params;
params_post155 = A.params_post;
fit_qual155 = A.fit_qual;
fit_qual_post155 = A.fit_qual_post;
resp_f0155 = A.resp_f0;
resp_f1155 = A.resp_f1;
resp_f0_post155 = A.resp_f0_post;
resp_f1_post155 = A.resp_f1_post;
cell_type155 = A.cell_type;
LogL155 = A.LogL;
LogL155_post= A.LogL_post;
A = load('136l001p155_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
NIpre155 = A.NIpre;
NIpost155 = A.NIpost;
NIrPre155 = A.NIrPre;
NIrPost155 = A.NIrPost;

A = load('136r001p135_fit.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0135=A.SEM_f0;
SEM_f1135=A.SEM_f1;
SEM_f0post135=A.SEM_f0_post;
SEM_f1post135=A.SEM_f1_post;
pred135 = A.pred;
pred_post135 = A.pred_post;
params135 = A.params;
params_post135 = A.params_post;
fit_qual135 = A.fit_qual;
fit_qual_post135 = A.fit_qual_post;
resp_f0135 = A.resp_f0;
resp_f1135 = A.resp_f1;
resp_f0_post135 = A.resp_f0_post;
resp_f1_post135 = A.resp_f1_post;
cell_type135 = A.cell_type;
LogL135 = A.LogL;
LogL135_post= A.LogL_post;
A = load('136r001p135_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
NIpre135 = A.NIpre;
NIpost135 = A.NIpost;
NIrPre135 = A.NIrPre;
NIrPost135 = A.NIrPost;

% contingent
A = load('136l001p113_fit.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0113=A.SEM_f0;
SEM_f1113=A.SEM_f1;
SEM_f0post113=A.SEM_f0_post;
SEM_f1post113=A.SEM_f1_post;
pred113 = A.pred;
pred_post113 = A.pred_post;
params113 = A.params;
params_post113 = A.params_post;
fit_qual113 = A.fit_qual;
fit_qual_post113 = A.fit_qual_post;
resp_f0113 = A.resp_f0;
resp_f1113 = A.resp_f1;
resp_f0_post113 = A.resp_f0_post;
resp_f1_post113 = A.resp_f1_post;
cell_type113 = A.cell_type;
LogL113 = A.LogL;
LogL113_post= A.LogL_post;
A = load('136l001p113_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
NIpre113 = A.NIpre;
NIpost113 = A.NIpost;
NIrPre113 = A.NIrPre;
NIrPost113 = A.NIrPost;

A = load('136r001p132_fit.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0132=A.SEM_f0;
SEM_f1132=A.SEM_f1;
SEM_f0post132=A.SEM_f0_post;
SEM_f1post132=A.SEM_f1_post;
pred132 = A.pred;
pred_post132 = A.pred_post;
params132 = A.params;
params_post132 = A.params_post;
fit_qual132 = A.fit_qual;
fit_qual_post132 = A.fit_qual_post;
resp_f0132 = A.resp_f0;
resp_f1132 = A.resp_f1;
resp_f0_post132 = A.resp_f0_post;
resp_f1_post132 = A.resp_f1_post;
cell_type132 = A.cell_type;
LogL132 = A.LogL;
LogL132_post= A.LogL_post;
A = load('136r001p132_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
NIpre132 = A.NIpre;
NIpost132 = A.NIpost;
NIrPre132 = A.NIrPre;
NIrPost132 = A.NIrPost;

A = load('136l001p156_fit.mat','LogL','LogL_post','SEM_f0','SEM_f1','SEM_f0_post','SEM_f1_post','params','params_post','fit_qual','fit_qual_post','resp_f0','resp_f1','resp_f0_post','resp_f1_post','cell_type','pred','pred_post');
SEM_f0156=A.SEM_f0;
SEM_f1156=A.SEM_f1;
SEM_f0post156=A.SEM_f0_post;
SEM_f1post156=A.SEM_f1_post;
pred156 = A.pred;
pred_post156 = A.pred_post;
params156 = A.params;
params_post156 = A.params_post;
fit_qual156 = A.fit_qual;
fit_qual_post156 = A.fit_qual_post;
resp_f0156 = A.resp_f0;
resp_f1156 = A.resp_f1;
resp_f0_post156 = A.resp_f0_post;
resp_f1_post156 = A.resp_f1_post;
cell_type156 = A.cell_type;
LogL156 = A.LogL;
LogL156_post= A.LogL_post;
A = load('136l001p156_NI.mat','NIpre','NIpost','NIrPre','NIrPost');
NIpre156 = A.NIpre;
NIpost156 = A.NIpost;
NIrPre156 = A.NIrPre;
NIrPost156 = A.NIrPost;

%% define combined variables
params_pre_sync = [params113; params132; params156];
params_post_sync = [params_post113; params_post132; params_post156];
fit_qual_pre_sync = [fit_qual113 fit_qual132 fit_qual156];
fit_qual_post_sync = [fit_qual_post113 fit_qual_post132 fit_qual_post156];
f0_pre_sync = [resp_f0113; resp_f0132; resp_f0156];
f0_post_sync = [resp_f0_post113; resp_f0_post132; resp_f0_post156];
f1_pre_sync = [resp_f1113; resp_f1132; resp_f1156];
f1_post_sync = [resp_f1_post113; resp_f1_post132; resp_f1_post156];
% stderr_pre_sync = [stderr_pre113; stderr_pre132; stderr_pre156; stderr_pre107; stderr_pre114];
% stderr_post_sync = [stderr_post113; stderr_post132; stderr_post156; stderr_post107; stderr_post114];
cell_type_sync = [cell_type113 cell_type132 cell_type156];
NI_pre_sync = [NIpre113; NIpre132; NIpre156];
NIrm_pre_sync = [NIrPre113; NIrPre132; NIrPre156];
NI_post_sync = [NIpost113; NIpost132; NIpost156];
NIrm_post_sync = [NIrPost113; NIrPost132; NIrPost156];
pred_pre_sync = [pred113; pred132; pred156];
pred_post_sync = [pred_post113; pred_post132; pred_post156];
SEM_f0_sync = [SEM_f0113; SEM_f0132; SEM_f0156];
SEM_f1_sync = [SEM_f1113; SEM_f1132; SEM_f1156];
SEM_f0_post_sync = [SEM_f0post113; SEM_f0post132; SEM_f0post156];
SEM_f1_post_sync = [SEM_f1post113; SEM_f1post132; SEM_f1post156];
LogL_sync=[LogL113; LogL132; LogL156;];
LogL_sync_post=[LogL113_post; LogL132_post; LogL156_post;];

params_pre_int = [params135; params155];
params_post_int = [params_post135; params_post155];
fit_qual_pre_int = [fit_qual135 fit_qual155];
fit_qual_post_int = [fit_qual_post135 fit_qual_post155];
f0_pre_int = [resp_f0135; resp_f0155];
f0_post_int = [resp_f0_post135; resp_f0_post155];
f1_pre_int = [resp_f1135; resp_f1155];
f1_post_int = [resp_f1_post135; resp_f1_post155];
% stderr_pre_int = [stderr_pre135; stderr_pre155; stderr_pre118; stderr_pre109; stderr_pre115];
% stderr_post_int = [stderr_post135; stderr_post155; stderr_post118; stderr_post109; stderr_post115];
cell_type_int = [cell_type135 cell_type155];
NI_pre_int = [NIpre135; NIpre155];
NIrm_pre_int = [NIrPre135; NIrPre155];
NI_post_int = [NIpost135; NIpost155];
NIrm_post_int = [NIrPost135; NIrPost155];
pred_pre_int = [pred135; pred155];
pred_post_int = [pred_post135; pred_post155];
SEM_f0_int = [SEM_f0135; SEM_f0155];
SEM_f1_int = [SEM_f1135; SEM_f1155];
SEM_f0_post_int = [SEM_f0post135; SEM_f0post155];
SEM_f1_post_int = [SEM_f1post135; SEM_f1post155];
LogL_int=[LogL135; LogL155;];
LogL_int_post=[LogL135_post; LogL155_post;];

% NIrm_pre_sync(:) = 1-NIrm_pre_sync(:);
% NIrm_pre_int(:) = 1 - NIrm_pre_int(:);
% NIrm_pre_comp(:) = 1 - NIrm_pre_comp(:);
% NIrm_post_sync(:) = 1 - NIrm_post_sync(:);
% NIrm_post_int(:) = 1 - NIrm_post_int(:);
% NIrm_post_comp(:) = 1 - NIrm_post_comp(:);
clearvars -except SEM_f0_comp SEM_f1_comp SEM_f0_post_comp SEM_f1_post_comp...
    SEM_f0_int SEM_f1_int SEM_f0_post_int SEM_f1_post_int...
    SEM_f0_sync SEM_f1_sync SEM_f0_post_sync SEM_f1_post_sync...
    NIrm_post_comp NI_post_comp NIrm_pre_comp NI_pre_comp cell_type_comp stderr_post_comp stderr_pre_comp...
    f1_post_comp f1_pre_comp f0_post_comp f0_pre_comp fit_qual_post_comp fit_qual_pre_comp params_post_comp params_pre_comp...
    NIrm_post_sync NI_post_sync NIrm_pre_sync NI_pre_sync cell_type_sync stderr_post_sync stderr_pre_sync f1_post_sync...
    f1_pre_sync f0_post_sync f0_pre_sync fit_qual_post_sync fit_qual_pre_sync params_post_sync params_pre_sync...
    NIrm_post_int NI_post_int NIrm_pre_int NI_pre_int cell_type_int stderr_post_int stderr_pre_int f1_post_int...
    f1_pre_int f0_post_int f0_pre_int fit_qual_post_int fit_qual_pre_int params_post_int params_pre_int...
    pred_pre_sync pred_post_sync pred_pre_int pred_post_int pred_pre_comp pred_post_comp...
    LogL_sync LogL_int LogL_sync_post LogL_int_post
disp('vars loaded')