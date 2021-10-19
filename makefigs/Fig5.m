cmap(1,:) = [0.8941    0.1020    0.1098];
cmap(2,:) = [0.2157    0.4941    0.7216];
cmap(3,:) = [0.3020    0.6863    0.2902];
cmap(4,:) = [0.5961    0.3059    0.6392];
cmap(5,:) = [ 1.0000    0.4980         0];


layers = unique(data0(:,11));
subjects = unique(data0(:,12));
hemi = unique(data0(:,13));
eccen = data0(:,10);
roi = data0(:,7);
wedges = [[0 40];[50 90]];

assym_subj = zeros(length(subjects),length(layers));

for s = 1 : length(subjects)
    
    for l = 1 : length(layers)
        
        sel = data0(:,11) == l & data0(:,12) == s & eccen <= 5.5 & roi == 1;
        mybold = data0(sel,1);
        myangle = data0(sel,6);
        
        horz_ind = myangle > wedges(1,1) & myangle < wedges(1,2);
        vert_ind = myangle > wedges(2,1) & myangle < wedges(2,2);
        
        horz = nanmedian(mybold(horz_ind));
        vert = nanmedian(mybold(vert_ind));
        assym_subj(s,l) = (horz - vert)/((vert+horz)/2)*100;
    end
end

%%
figure(5);
for s = 1 : size(assym_subj,1)

    name{s} = sprintf('S%i',s);
    plot(assym_subj(s,:),'Linewidth',4,'Color',cmap(s,:)); hold on
    
end

ylim([-10 100])
ylabel('Asymetry ratio (%)')
xlabel({'Cortical depth';'superficial -> deep'})
set(gca,'Fontsize',20)
xlim([0 7])
xticks([0:7])
legend box off
box off
plot(mean(assym_subj),'--','Linewidth',3,'Color',[0.7 0.7 0.7]);
name{end+1} = 'mean';
leg=legend(name);
xticks([1 6]);
xticklabels({'10%';'90%'});
ax1 = gca;

set(gcf,'Position',[        1000         770         388         568])

