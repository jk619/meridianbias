figure(999);clf
subjects = unique(data0(:,12));
before = zeros(size(subjects));
after = zeros(size(subjects));

y = data0(:,1);
yfixed = data0(:,14);
for s = 1 : length(subjects)
    
    
    selected =  data0(:,7) == r & data0(:,12) == s  & data0(:,10) < 5.5 &  data0(:,7) == 1;
    before(s) = nanstd(y(selected))/nanmean(y(selected));
    after(s) = nanstd(yfixed(selected))/nanmean(yfixed(selected));
    
    
end

bigmean_b = nanmean(before);
bigmean_a = nanmean(after);

bigstd_b = nanstd(before)./sqrt(length(unique(data0(:,12))));
bigstd_a = nanstd(after)./sqrt(length(unique(data0(:,12))));


mymeans = [bigmean_b;bigmean_a]';
myerrors = [bigstd_b;bigstd_a]';


cmap = cbrewer('seq','YlGn',100);
ccmap(1,:) = cmap(end-10,:);
cmap = cbrewer('seq','Purples',100);
ccmap(2,:) = cmap(end-10,:);

for b=1:2
    
    hh(b) =bar (b,mymeans(b),'FaceColor','None','EdgeColor',ccmap(b,:),'LineWidth',2); hold on
    errorbar(b,mymeans(b),myerrors(b),'Color',ccmap(b,:),'LineWidth',2)
    ylabel('Coefficent of Variation (%)')
    set(gca,'Fontsize',15)
    set(gcf,'Position', [ 1159         926         280         320])
    xticks([])
    box off
    ylim([0.5 1])
    
end


legend(hh,{'%BOLD';'Corrected %BOLD'})
legend box off

%%

