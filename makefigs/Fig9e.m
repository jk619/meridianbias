figure(99999);
pick_param = [14 2 4 5 6 8 9 11];
mylabels = labels(pick_param);

cmatrix = triu(calcconfusionmatrix(data0(:,pick_param),[],2),+1);  % pdist.m
cmatrix(cmatrix == 0) = NaN;

corrforlater(2,:) = cmatrix(1,2:end);
%%

cmap1 = cbrewer('seq','PuBu',100,'pchip');
cmap2 = cbrewer('seq','Purples',100,'pchip');

cmap2 = [flipud(cmap2);cmap2];
cmatrix = flipud(corrforlater(2,:));
imagesc(cmatrix,[-0.5 0.5]);
colormap(cmap2);
axis image tight;
colorbar;
set(gca,'XTick',1:7,'XTickLabel',mylabels(2:end));
set(gca,'YTick',1:size(cmatrix,1),'YTickLabel',{'Corrected %BOLD'});
set(gca,'YDir','normal')

set(gca,'Fontsize',15)

for x = 1 : size(cmatrix,1)
    
    for y = 1 : size(cmatrix,2)
        
        if cmatrix(x,y) == 0
            
        elseif cmatrix(x,y) > 0.1 &  cmatrix(x,y) < 0.3;
            
            text(y,x-0.1,sprintf('%.2f',(cmatrix(x,y))),'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'bottom','Fontsize',30,'Color',[1 1 1]); hold on
            
        elseif cmatrix(x,y) > 0.3;
            
            text(y,x-0.1,sprintf('%.2f',(cmatrix(x,y))),'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'bottom','Fontsize',30,'Color',[0 0 0]); hold on
            
        elseif abs(cmatrix(x,y)) > 0.1;
            
            
            text(y,x-0.1,sprintf('%.2f',(cmatrix(x,y))),'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'bottom','Fontsize',30,'Color',[1 1 1]); hold on
            
        else abs(cmatrix(x,y)) > 0.1;
            
            
            text(y,x-0.1,sprintf('%.2f',(cmatrix(x,y))),'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'bottom','Fontsize',30,'Color',[0 0 0]); hold on
            
            
        end
    end
end

t=title('Voxel-wise correlation');
t.FontSize = 15;

t=title('Voxel-wise correlation (V1-V3)');
t.FontSize = 40;
set(gca,'FontSize',30);
set(gcf,'Position',[ 440         116        1142         749]);
box off;
xtickangle(45);
h=gca; h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];