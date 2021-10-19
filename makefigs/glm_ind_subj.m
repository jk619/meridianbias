function glm_ind_subj(combos,labels,data_bak)

cmap = cbrewer('qual','Set1',5)
% cmap = repmat([0 0 0],5,1)
clear hh
combos = {combos}
labels(combos{1})

for s = 1 : 5
    
data0 = data_bak;
positiveBOLD = data0(:,10)<5.5 & ismember(data0(:,7),[1 2 3]) & all(isfinite(data0(:,combos{1})),2) & data0(:,12) == s;
data0 = data0(positiveBOLD,:);
y = data0(:,1);

clear X

disp({labels{combos{1}}})

for c = 1 : length(combos{1})
    
    X(:,c) = zscore(data0(:,combos{1}(c)));
    
end

X(:,end+1) = 1;  % constant term
hh(:,s) = X\y;
modelfit = X*hh(:,s);
rec(s) = calccorrelation(modelfit,y)  % r = 0.47


end
hh(end,:) = []
hh = hh'


%%
figure(223);clf
% hh = hh(:,1:end-1);
barcmap(1,:)  = [241 50 55]
barcmap(2,:)  = [0 40 245]
barcmap(3,:)  = [60 140 247]
barcmap(4,:)  = [56 115 229]



barcmap = (barcmap/255);
for c = 1 : (length(combos{1}))
    b=bar(c,nanmean(hh(:,c)),'FaceColor','None','LineWidth',4,'EdgeColor',[0 0 0]); hold on
end



% C = 0:0.05:0.5;
% scatter([1 1 1 1 1],hh(:,s),40,C,'filled')
% hAx = gca;
% cbar = colorbar;
% colormap(map) %your original map...
% hAx.CLim = [0 0.5];
% cbar.Limits = [0 0.5];



for s = 1 : size(hh,2)
    scatt = scatter(repmat(s,[1 5]),hh(:,s),700,cmap,'.')
    
    if s == size(hh,2)
        for ss = 1 : 5
            
            myh{ss} = scatter(s,hh(ss,s),700,cmap(ss,:),'.')
        end
    end
end


[leg,icons] = legend([myh{1} myh{2} myh{3} myh{4} myh{5}],{'S1', 'S2','S3', 'S4', 'S5'},'location','NorthWest')
icons = findobj(icons, '-not', 'Patch', 'none');

% leg.FontSize = 20
set(icons(11:15),'MarkerSize',40);

ylim([-2 2])
ylabel('Beta')

xticks([1:4])
ax1 = gca;
set(ax1,'YAxisLocation','left')
legend boxoff
xticklabels({labels{combos{1}}})
xtickangle(45)
bigR2 = rec.^2*100

set(gcf,'Position',[  1000         918         450         420])
    set(gca,'Fontsize',10)
box off
set(gca,'Fontsize',15)
% t=title('Modelling BOLD')
t.FontSize = 15
% figure(666)
% bar(1,nanmean(bigR2),'FaceColor','None','LineWidth',4); hold on
% xpost = [1 1 1 1 1]
% scatter(xpost,bigR2,700,cmap,'.')
% xticklabels('R^2')
% ylabel('Variance Explained (%)')
% 
% ax1 = gca;
% set(ax1,'YAxisLocation','right')
% set(gcf,'Position',[898   531   104   417])
% set(gcf,'Position',[1000         918         560         420])
% % ylim([10 16])
% set(gca,'Fontsize',15)
% box off
% t=title('Explained variance')
% 
% 
% figure(222);
% 
% for b = 1 : length(bigR2)
%     
%     bar(b,bigR2(b),'FaceColor','None','EdgeColor',cmap(b,:),'LineWidth',4); hold on
% end
% 
% set(gca,'Fontsize',15)
% box off
% ylabel('Variance Explained (%)')
% xticks(1:5)
% 
% for s = 1 : 5
%     
%     myxticks{s} = sprintf('S%i',s)
%     
% end
% 
% xticklabels(myxticks)
% ax1=gca
% set(ax1,'YAxisLocation','right')
% 
% figure(111);
% imagesc(bigR2'); colormap hot
% axis off
% caxis([0 30])
% c=colorbar
% c.FontSize = 115
% ylabel(c, 'Variance Explained (%)')
% axis image
% a =  c.Position %gets the positon and size of the color bar
% set(c,'Position',[a(1)+0.02 a(2) a(3)+0.08 a(4)])% To change size
% 

%%
figure(333)
for b = 1 : length(bigR2)
    
bar(b,bigR2(b),'Facecolor','None','EdgeColor',cmap(b,:),'LineWidth',3); hold on

end
% title('Variance explained')

xticks([1:5])
% xticklabels(myxticks)
set(gca,'Fontsize',30)
ylabel('R^2(%)')
ylim([0 25])
yticks([0 25])
xticks([])
