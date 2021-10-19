figure(6);clf
fprintf('Reproducing Figure 6.....\n')

warning('off')
[path2merge,b,c] = fileparts(which('mergestruct.m'));

if contains(path2merge,'json')
    rmpath(path2merge);
end
setenv('SUBJECTS_DIR','./data_nsd');

subplot(4,3,9)
map = MRIread(['./data_nsd/lh.meanbeta_layer_avg.mgz']);
datatoplot = map.vol;

bins = -5:.05:5;

load ('stan_cmaps','bc_blueredsat2');
cmap0 = cmaplookup(bins,-5,5,[],bc_blueredsat2);
[rawimg,Lookup,rgbimg] = cvnlookup('subj01',1,datatoplot,[-5 5],cmap0,-5,[],0);


color = [0.5];
[r,c,t] = size(rgbimg);
[i j] = find(all(rgbimg == repmat(color,r,c,3),3));

for ii = 1: length(i)
    rgbimg(i(ii),j(ii),:) = ones(1,3);
end

a = imagesc(rgbimg(:,1:1000,:)); axis image tight;

axis off
axis square
datatoplot(datatoplot<-5) = NaN;
datatoplot(datatoplot>5) = NaN;
title('%BOLD')
%%
subplot(4,3,12)

N = hist(datatoplot,bins);
for p=1:length(bins), hh = bar(bins(p),N(p),.05); set(hh,'FaceColor',cmap0(p,:),'EdgeColor','none');,hold on ; end

myxticks = [-5:1:5];
xticks(myxticks)
xlabel('BOLD signal change (%)')
ylabel('Count')
set(gca,'Fontsize',10)
box off
set(gcf,'Position',[        1000         863         698         475])
ylim([0 max(N)])
xlim([-2 5])
axis square
% print('-dpng','-r300','./fig1/2.png');
%%
subplot(4,3,2)

map = MRIread(['./data_nsd/lh.meancoilbias_layer_avg.mgz']);
datatoplot = map.vol;
bins = 0:10:1200;
cmap0 = cmaplookup(bins,0,1200,[],gray(256));
[rawimg,Lookup,rgbimg] = cvnlookup('subj02',1,datatoplot,[0 1200],cmap0,0,[],0);


color = [0.5];
[r,c,t] = size(rgbimg);
[i j] = find(all(rgbimg == repmat(color,r,c,3),3));

for ii = 1: length(i)
    
    rgbimg(i(ii),j(ii),:) = ones(1,3);
end

a = imagesc(rgbimg(:,1:1000,:)); axis image tight;
axis off
axis square
datatoplot(datatoplot<0) = NaN;
datatoplot(datatoplot>1200) = NaN;
title('RF coil bias EPI')
%%
subplot(4,3,5)

N = hist(datatoplot,bins);

for p=1:length(bins), hh = bar(bins(p),N(p),10);, set(hh,'FaceColor',cmap0(p,:),'EdgeColor','none');,hold on ; end
xticks([0:500:1200])
% myxticks = [0:100:1500]
xlabel('BOLD signal change (%)')
ylabel('Count')
box off
axis square
xlabel('Signal intensity (raw scanner units)')

%%
subplot(4,3,7)
load ('stan_cmaps','cmo_haline');
map = MRIread(['./data_nsd/lh.thickness.mgz']);

datatoplot = map.vol;
bins = 0:0.03:5;
cmap0 = cmaplookup(bins,1,4,[],cmo_haline);


[rawimg,Lookup,rgbimg] = cvnlookup('subj01',1,datatoplot,[0 5],cmap0,0,[],0);


color = [0.5];
[r,c,t] = size(rgbimg);
[i j] = find(all(rgbimg == repmat(color,r,c,3),3));

for ii = 1: length(i)
    
    rgbimg(i(ii),j(ii),:) = ones(1,3);
end

a = imagesc(rgbimg(:,1:1000,:));
axis square
axis off


datatoplot(datatoplot<=0) = NaN;
datatoplot(datatoplot>5) = NaN;
title('Cortical thickness')
%%
subplot(4,3,10)

N = hist(datatoplot,bins);

for p=1:length(bins), hh = bar(bins(p),N(p),0.03);, set(hh,'FaceColor',cmap0(p,:),'EdgeColor','none');,hold on ; end
xticks([0.5:5]);
xlabel('BOLD signal change (%)');
ylabel('Count');
box off
axis square
xlabel('Cortical thickness (mm)')
xlim([0.5 5]);


%%

subplot(4,3,3)
map = MRIread(['./data_nsd/lh.meanbc_layer_avg.mgz']);
datatoplot = map.vol;
bins = -1:0.02:3;
cmap0 = cmaplookup(bins,0,2,[],gray(256));
[rawimg,Lookup,rgbimg] = cvnlookup('subj01',1,datatoplot,[-1 3],cmap0,0,[],0);
color = [0.5];
[r,c,t] = size(rgbimg);
[i j] = find(all(rgbimg == repmat(color,r,c,3),3));

for ii = 1: length(i)
    
    rgbimg(i(ii),j(ii),:) = ones(1,3);
end

a = imagesc(rgbimg(:,1:1000,:)); 
axis off
axis square

datatoplot(datatoplot<-1) = NaN;
datatoplot(datatoplot>3) = NaN;
title('Bias-corrected EPI')

%%
subplot(4,3,6)
N = hist(datatoplot,bins);

for p=1:length(bins), hh = bar(bins(p),N(p),0.02);, set(hh,'FaceColor',cmap0(p,:),'EdgeColor','none');,hold on ; end
xticks([0:0.5:2])

xlabel('BOLD signal change (%)')
ylabel('Count')
box off
axis square
xlabel('Bias-corrected EPI intensity (normalized)')
xlim([0 2])

%%
subplot(4,3,8)
map = MRIread(['data_nsd/lh.B0_or.mgz']);
datatoplot = map.vol;

bins = 0:2:180;
cmap0 = cmaplookup(bins,0,180,[],magma(256));
[rawimg,Lookup,rgbimg] = cvnlookup('subj01',1,datatoplot,[0 180],cmap0,0,[],0);

color = [0.5];
[r,c,t] = size(rgbimg);
[i j] = find(all(rgbimg == repmat(color,r,c,3),3));

for ii = 1: length(i)
    
    rgbimg(i(ii),j(ii),:) = ones(1,3);
end

a = imagesc(rgbimg(:,1:1000,:));
axis square
axis off
title('Angle with respect to B0');

%%
subplot(4,3,11)

N = hist(datatoplot,bins);

for p=1:length(bins), hh = bar(bins(p),N(p),2);, set(hh,'FaceColor',cmap0(p,:),'EdgeColor','none');,hold on ; end
xticks([0:30:180])
% xticks
% myxticks = [0:100:1500]
xlabel('BOLD signal change (%)');
ylabel('Count');
box off
axis square
xlabel('Angle with respect to B0 (deg)');
%%
subplot(4,3,1)
map = MRIread(['./data_nsd/lh.curvature.mgz']);
datatoplot = map.vol;
bins = -1:0.015:1;
cmap0 = cmaplookup(bins,-1,1,[],flipud(gray(256)));


[rawimg,Lookup,rgbimg] = cvnlookup('subj01',1,datatoplot,[-1  1],cmap0,-1,[],0);


color = [0.5];
[r,c,t] = size(rgbimg);
[i j] = find(all(rgbimg == repmat(color,r,c,3),3));

for ii = 1: length(i)
    
    rgbimg(i(ii),j(ii),:) = ones(1,3);
end

a = imagesc(rgbimg(:,1:1000,:));
axis off
axis square

datatoplot(datatoplot<-2) = NaN;
datatoplot(datatoplot>2) = NaN;
title('Cortical curvature')


%%
subplot(4,3,4)

N = hist(datatoplot,bins);

for p=1:length(bins), hh = bar(bins(p),N(p),0.015);, set(hh,'FaceColor',cmap0(p,:),'EdgeColor','none');,hold on ; end
xticks([-1:0.5:1])
% xticks
% myxticks = [0:100:1500]
xlabel('BOLD signal change (%)')
ylabel('Count')
box off
axis square
xlabel('Cortical curvature (a.u.)')
xlim([-0.7 0.7])

set(gcf,'Position',[591         458        1504         850])
addpath(path2merge);