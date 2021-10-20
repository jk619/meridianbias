figure(9);clf
fprintf('Reproducing Figure 9......\n')

%%
sel = data0(:,7) == 1;
mydata = data0(sel,:);


subplot(1,2,1)
binx = [0:0.3:90];
biny = [-2:0.05:15];
[n] = hist2d(flatten(mydata(:,6)),flatten(mydata(:,1)),binx,biny);

h1 = imagesc(log(n)); colormap(hot);
set(h1,'XData',[binx(1) binx(end)],'YData',[biny(1) biny(end)]);
axis tight square;
set(gca,'YDir','normal');
caxis([0 6]);
ylabel('%BOLD');
xlabel(['Polar angle' newline 'Horizontal     ->     Vertical' ]);

cmap = cbrewer('seq','Greens',100,'pchip');
cmap = [[1 1 1];cmap];
colormap(cmap);
xticks(0:15:90);
box off
hold on
myline=localregression(flatten(mydata(:,6)),flatten(mydata(:,1)),binx,1,[],[],1);
plot(binx,myline,'Linewidth',5,'Color',cmap(1,:));
plot(binx,myline,'Linewidth',2,'Color',cmap(end-10,:));

set(gca,'Fontsize',15);

points(1) = nanmean(myline(1:34));
points(2) = nanmean(myline(268:end));

asymmetry = (points(1) - points(end)) ./ ((points(end)+points(1))/2) * 100;
title(sprintf('V1 Asymmetry(%%) = %.1f', asymmetry));
originalSize1 = get(gca, 'Position');


c=colorbar;
c.Ticks = [];
c.Label.String = 'Log frequency';
set(gca, 'Position', originalSize1);
set(gcf,'Position',[    63         402        1248         894])
set(gca,'Fontsize',25);


subplot(1,2,2)

plot(binx,myline,'Color',cmap(end-20,:),'LineWidth',5)
xlabel(['Polar angle' newline 'Horizontal     ->     Vertical' ])
xlim([0 90])
xticks(0:15:90)
axis square
set(gca,'Fontsize',25)
box off
format compact
