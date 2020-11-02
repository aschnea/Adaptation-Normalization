%% Model intuition
% Figure 6
% load westrick_model
% contrast response function examples: Figure 6 BFJ
R_tar=mean(squeeze(R_plaid(:,:,1)),1);
R_pld=mean(squeeze(R_plaid(:,:,end)),1);
R_tar2=mean(squeeze(R_plaid2(:,:,1)),1);
R_pld2=mean(squeeze(R_plaid2(:,:,end)),1);
R_tar3=mean(squeeze(R_plaid3(:,:,1)),1);
R_pld3=mean(squeeze(R_plaid3(:,:,end)),1);

figure
subplot(2,2,1)
plot(R_tar,'k')
hold on;box off
plot(R_tar2,'g')
axis square
title('Contingent adaptation')
subplot(222)
hold on; box off
plot(R_tar,'k')
plot(R_tar3,'b')
axis square
title('Asynch adaptation')
subplot(223)
hold on; box off
plot(R_pld,'k')
plot(R_pld2,'g')
axis square
subplot(224)
hold on; box off
plot(R_pld,'k')
plot(R_pld3,'b')
axis square

% response products: Figure 6 CG
figure
supertitle('Map of response product (R_iR_j)')
subplot(221)
imagesc(squeeze(resp_prod(3,:,:)))
colormap('bone')
% zlim([0 0.22])
axis square
set(gca,'TickDir','out')
subplot(222)
imagesc(squeeze(resp_prod(4,:,:)))
colormap('bone')
% zlim([0 0.22])
axis square
set(gca,'TickDir','out')
subplot(223)
imagesc(squeeze(resp_prod2(3,:,:)))
colormap('bone')
% zlim([0 0.22])
axis square
set(gca,'TickDir','out')
xlabel('Orientation preference, unit 1')
ylabel('Orientation preference, unit 2')
subplot(224)
imagesc(squeeze(resp_prod2(4,:,:)))
colormap('bone')
% zlim([0 0.22])
axis square
set(gca,'TickDir','out')

% homeostatic target: Figure 6 DH
figure; imagesc(resp_hom); set(gca,'TickDir','out'); axis square
colormap('bone')

% change in weight matrices: Figure 6 EI
figure; 
subplot(131)
imagesc(weights-weights)
% zlim([-0.027 0.1156])
title('pre')
axis square
set(gca,'TickDir','out')
bb(:,1)=(1:-0.01:0);
bb(:,3)=(0:0.01:1);
bb(1:51,2)=bb(1:51,3);
bb(52:end,2)=bb(52:end,1);
bb=flipud(bb);
colormap(bb)
subplot(132)
supertitle('Norm Model Weights')
imagesc(weights2-weights)
% zlim([-0.027 0.1156])
title('contingent')
axis square
set(gca,'TickDir','out')
colormap(bb)
subplot(133)
imagesc(weights3-weights)
% zlim([-0.027 0.1156])
title('asynch')
xlabel('Orientation preference, unit 1')
ylabel('Orientation preference, unit 2')
axis square
set(gca,'TickDir','out')
colormap(bb)