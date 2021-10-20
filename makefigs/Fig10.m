figure(10);clf
fprintf('Reproducing Figure 10 D&F\n')
subplot(1,2,1)
load('stan_cmaps','mpl_redyellowblue')
mydata = data_bak;
sel = mydata(:,7) == 1 & mydata(:,10) < 5.5;
mydata = mydata(sel,:);
bins = 0:1:90;
cmap0 = cmaplookup(bins,0,90,[],mpl_redyellowblue);
N = hist(mydata(:,6),bins);

for p=1:length(bins), hh = bar(bins(p),N(p)/6,1);, set(hh,'FaceColor',cmap0(p,:),'EdgeColor','None');,hold on ; end

sel = mydata(:,7) == 1 & mydata(:,3) ==0;
mydata = mydata(sel,:);
N2 = hist(mydata(:,6),bins);

for p=1:length(bins), hh = bar(bins(p),N2(p)/6,1);, set(hh,'FaceColor',[1 1 1],'EdgeColor',[0.5 0.5 0.5],'Linewidth',0.1);,hold on ; end

xticks(0:10:90)
xlabel('Polar angle')
ylabel('Count')
title('Polar angle in V1')


set(gca,'Fontsize',15);

box off
xlim([-0.5 90.5]);

h=gca; h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];

%%
subplot(1,2,2);
ct = 1;

clear myline
clear asymmetry
clear voxels
binx = [0:0.3:90];
biny = [-2:0.05:15];


mythrs = [0:0.1:1];

for thr = mythrs
    
    
    mydata = data0;
    sel = data0(:,3) < thr;
    mydata(sel,3) = 0;
    
    sel = mydata(:,7) == 1 & mydata(:,3) == 0;
    mydata = mydata(sel,:);
    
    myline(ct,:)=localregression(flatten(mydata(:,6)),flatten(mydata(:,14)),binx,1,[],[],1);
    points(1) = nanmean(myline(ct,1:34));
    points(2) = nanmean(myline(ct,268:end));
    
    asymmetry(ct) = (points(1) - points(end)) ./ ((points(end)+points(1))/2) * 100;

    voxels(ct) = size(mydata,1);
    ct = ct + 1;
end

cmap = cbrewer('seq','Blues',length(mythrs));
for s = (2 : size(myline,1))
    plot(binx,myline(s,:),'Linewidth',5,'Color',cmap(s,:)); hold on
end


myleg = textscan((num2str(mythrs(1:end))),'%s','Delimiter',' ');
myleg = myleg{1};

myleg(strcmp('',myleg)) = [];
myleg(1) = [];
l=legend(myleg);
l.Location = 'SouthWest';
xlabel('Polar angle');
box off;
legend box off;
l.Title.String = 'Asymmetry(%)';

ylabel('Corrected %BOLD');
set(gca,'Fontsize',10);

for s = 1 : (size(myline,1))-1
    l.String{s} = sprintf('%.1f',asymmetry(s+1));
end

xticks(0:15:90);
set(gca,'Fontsize',15);
xlim([0 90]);
set(gcf,'Position',[920         963        1002         381])