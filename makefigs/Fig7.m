fprintf('Reproducing Figure 7......\n')


combos = {[2 4 8]};
pick_param = [1 2 4 8 11 6 5 9];

for s = 1 : 5
    
    data0 = data_bak;
    positiveBOLD = data0(:,10)<5.5 & ismember(data0(:,7),[1 2 3]) & all(isfinite(data0(:,combos{1})),2) & data0(:,12) == s;
    data0 = data0(positiveBOLD,:);
    cmatrix = triu(calcconfusionmatrix(data0(:,pick_param),[],2),+1);  % pdist.m
    cmatrix(cmatrix == 0) = NaN;
    big_matrix(:,:,s) = cmatrix;
    
end

for x =  1 : size(big_matrix,1)
    for y = 1 : size(big_matrix,2);
        
        [~,mypval] = (ttest(big_matrix(x,y,:)))
        pvalmat{x,y} = pval2stars(mypval)
    end
    
end

findns = contains(pvalmat,'n.s.')
pvalmat(findns) = {'   '};
data0 = data_bak;
combos = {[2 4 8]};
positiveBOLD = data0(:,10)<5.5 & ismember(data0(:,7),[1 2 3]) & all(isfinite(data0(:,combos{1})),2);
data0 = data0(positiveBOLD,:);


figure(7);clf
set(gcf,'Position',[ 1000         775        1268         563])
subplot(1,2,1)
pick_param = [1 2 4 8 11 6 5 9];
mylabels = labels(pick_param);



for s = 1
    
    cmatrix = triu(calcconfusionmatrix(data0(:,pick_param),[],2),+1);  % pdist.m
    cmatrix(cmatrix == 0) = NaN;
    
    cmap2 = cmo_balance;
    cmap2 = [[1 1 1];cmo_balance];
    imagesc(cmatrix,[-0.5 0.5]);
    colormap(cmap2);
    axis image tight;
    colorbar;
    set(gca,'XTick',1:size(cmatrix,1),'XTickLabel',mylabels);
    set(gca,'YTick',1:size(cmatrix,1),'YTickLabel',mylabels);
    set(gca,'YDir','normal')
    
    for x = 1 : size(cmatrix,1)
        
        for y = 1 : size(cmatrix,2)
            
            if contains(pvalmat{x,y},'   ')
            
%             if cmatrix(x,y) == 0
%                 
%             elseif cmatrix(x,y) > 0.1 &  cmatrix(x,y) < 0.3
%                 
%                 text(y,x-0.4,sprintf('%.2f \n%s',(cmatrix(x,y)),pvalmat{x,y}),'HorizontalAlignment', 'center', ...
%                     'VerticalAlignment', 'bottom','Fontsize',15,'Color',[0.7 0.7 0.7]); hold on
%                 
%             elseif cmatrix(x,y) > 0.3
%                 
%                 text(y,x-0.4,sprintf('%.2f \n%s',(cmatrix(x,y)),pvalmat{x,y}),'HorizontalAlignment', 'center', ...
%                     'VerticalAlignment', 'bottom','Fontsize',15,'Color',[0.7 0.7 0.7]); hold on
%                 
%             elseif cmatrix(x,y) < 0.1
%                 
%                 
%                 text(y,x-0.4,sprintf('%.2f \n%s',(cmatrix(x,y)),pvalmat{x,y}),'HorizontalAlignment', 'center', ...
%                     'VerticalAlignment', 'bottom','Fontsize',15,'Color',[0.7 0.7 0.7]); hold on
%             end
            
            else
                          if cmatrix(x,y) == 0
                
            elseif cmatrix(x,y) > 0.1 &  cmatrix(x,y) < 0.3
                
                text(y,x-0.4,sprintf('%.2f \n%s',(cmatrix(x,y)),pvalmat{x,y}),'HorizontalAlignment', 'center', ...
                    'VerticalAlignment', 'bottom','Fontsize',15,'Color',[0 0 0]); hold on
                
            elseif cmatrix(x,y) > 0.3
                
                text(y,x-0.4,sprintf('%.2f \n%s',(cmatrix(x,y)),pvalmat{x,y}),'HorizontalAlignment', 'center', ...
                    'VerticalAlignment', 'bottom','Fontsize',15,'Color',[0 0 0]); hold on
                
            elseif cmatrix(x,y) < 0.1
                
                
                text(y,x-0.4,sprintf('%.2f \n%s',(cmatrix(x,y)),pvalmat{x,y}),'HorizontalAlignment', 'center', ...
                    'VerticalAlignment', 'bottom','Fontsize',15,'Color',[0 0 0]); hold on
            end
            
            end
            
        end
    end
    
end
t=title('Voxel-wise correlation (V1-V3)');
t.FontSize = 15;
set(gca,'FontSize',15)
box off
xtickangle(45)
h=gca; h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];
clear corrforlater
corrforlater(1,:) = cmatrix(1,2:end);



for s = 1 : 5

    axes('Position',[.1*s/2+0.1 0.9 .07 .07])
    imagesc(big_matrix(:,:,s),[-0.5 0.5]);
    colormap(cmap2);
    axis image tight;
    set(gca,'YDir','normal')
    axis off
end
%%
combos = {[2 4 8]};
labels(combos{1});
clear hh


for s = 1 : 5
    
    data0 = data_bak;
    positiveBOLD = data0(:,10)<5.5 & ismember(data0(:,7),[1 2 3]) & all(isfinite(data0(:,combos{1})),2) & data0(:,12) == s;
    data0 = data0(positiveBOLD,:);
    y = data0(:,1);
    
    clear X
    
    
    for c = 1 : length(combos{1})
        
        X(:,c) = zscore(data0(:,combos{1}(c)));
        
    end
    
    X(:,end+1) = 1;  % constant term
    hh(:,s) = X\y;
    modelfit = X*hh(:,s);
    rec(s) = calccorrelation(modelfit,y);
    
    
end
hh(end,:) = [];
hh = hh';


%%
subplot(1,2,2)
for c = 1 : (length(combos{1}))
    b=bar(c,nanmean(hh(:,c)),'FaceColor','None','LineWidth',4,'EdgeColor',[0 0 0]); hold on
end

for s = 1 : size(hh,2)
    scatt = scatter(repmat(s,[1 5]),hh(:,s),700,cmap,'.');
    
    if s == size(hh,2)
        for ss = 1 : 5
            
            myh{ss} = scatter(s,hh(ss,s),700,cmap(ss,:),'.');
        end
    end
end

[leg,icons] = legend([myh{1} myh{2} myh{3} myh{4} myh{5}],{'S1', 'S2','S3', 'S4', 'S5'},'location','NorthWest');
icons = findobj(icons, '-not', 'Patch', 'none');


set(icons(11:15),'MarkerSize',40);

ylim([-2 2]);
ylabel('Beta');

xticks([1:4]);
ax1 = gca;
set(ax1,'YAxisLocation','left');
legend boxoff
xticklabels({labels{combos{1}}});
xtickangle(45);
bigR2 = rec.^2*100;

box off
set(gca,'Fontsize',15)
t.FontSize = 15;

%
title('Y = \beta_0+\beta_1XC+ \beta_2XT+ \beta_3XBc_E_P_I','Fontweight','light')
%%
axes('Position',[.75 .7 .15 .15])
box on


for b = 1 : length(bigR2)
    
    bar(b,bigR2(b),'Facecolor','None','EdgeColor',cmap(b,:),'LineWidth',3); hold on

end
% title('Variance explained')

xticks([1:5])
% xticklabels(myxticks)
set(gca,'Fontsize',15)
ylabel('R^2(%)')
ylim([0 25])
yticks([0 25])
xticks([])
box off

%%

