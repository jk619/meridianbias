% JK 03/2021
clear
clc

subjects = dir('./data/prfresultsmgz/');
subjects=subjects(~ismember({subjects.name},{'999997','999998','999999'}));
subjects = {subjects.name};

subjects_char=char(subjects);
ok=(isstrprop(subjects_char(:,1),'digit'));
subjects = subjects(ok);

hemi = {'lh';'rh'};

width = 20;

myamp = zeros(2,length(subjects),2);
%%
for s = 1:length(subjects)
    
    
    disp(subjects{s})
    subj = subjects{s};
    
    
    
    for h = 1:length(hemi)
        
        
        ecc = MRIread(sprintf('./data/prfresultsmgz/%s/%s.fit1_ecc.mgz',subj,hemi{h}));
        hvmap = MRIread(sprintf('./data/prfresultsmgz/%s/%s.fit1_ang.mgz',subj,hemi{h}));
        meanvol = MRIread(sprintf('./data/prfresultsmgz/%s/%s.fit1_meanvol.mgz',subj,hemi{h}));
        
        atlas = MRIread(sprintf('./data/benson_atlas/%s.varea.mgz',hemi{h}));
        glmres = MRIread(sprintf('./data/prfresultsmgz/%s/%s.fit1_gain.mgz',subj,hemi{h}));
        glmres = (glmres.vol'./meanvol.vol')*100;
        
        
        %% Conversion of analyzepRF polar angle coordinates to Benson atlas
        
        % adjust angle to Benson atlas so it is consistent with TDM and NSD
        % 0 deg represents upper vertical meridian (lower bank of V1), 90 
        % degrees represents horiozntal meridian and 180 deg lower vertical
        % meridian (upper bank of V1).
        
        if h == 1
            
            hvmap.vol  = (mod(90 - hvmap.vol + 180, 360) - 180); 
            
        elseif h == 2
            
            hvmap.vol  = (mod(90 - hvmap.vol + 180, 360) - 180);
            hvmap.vol = hvmap.vol .* -1;
            
        end
        
        
        %%
        % Pick V1  only
        myrois = (squeeze(atlas.vol == 1))';
        
        for hv = 1:2
            
            
            
            if hv == 1
                
                % get cortical space for the horizontal meridian that
                % represents a wedge of 40 degrees. Center of horziontal
                % meridian is represented by 90 deg. We pick a wedge on the
                % cortex that is between 90-20 = 70 and 90+20 = 110. This
                % way we sample cortex that correspond to the wedge in the
                % visual field between 70 and 110 deg centered at 90
                % degrees
          
                horzvert = hvmap.vol>(90-(width)); 
                horzvert = horzvert & hvmap.vol<(90+(width));
                horzvert = horzvert & myrois;
                
                
                
                
            elseif hv == 2
                
                horzvert1 = hvmap.vol > 0;
                horzvert2 = hvmap.vol < 0+width;
                horzvert3 = hvmap.vol > 180 - width;
                horzvert4 =  hvmap.vol < 180;
                horzvert = ((horzvert1 & horzvert2) | (horzvert3 & horzvert4)) & myrois;
                
                
                
                
                
            end
            
            
            horzvert = horzvert & ecc.vol < 8;
            myamp(hv,s,h) = nanmedian(glmres(horzvert));
            
        end
        
        
        
    end
    
end


% return

%%

figure(1);clf

cmap(1,:) = round([130 120 120]/255,2);
cmap(2,:) = round([189 93 181]/255,2);
cmap(3,:) = round([176 155 178]/255,2);


mymeanbold_nohemi = nanmean(myamp,3);

horz = mymeanbold_nohemi(1,:);
vert = mymeanbold_nohemi(2,:);


mystds_v = nanstd(vert)/sqrt(length(subjects)-1);
mystds_h = nanstd(horz)/sqrt(length(subjects)-1);

hv_means = [nanmean(horz) nanmean(vert)];
hv_stds =  [nanstd(horz)/sqrt(length(subjects)-1) nanstd(vert)/sqrt(length(subjects)-1)];



for hv = 1:size(hv_means,2)
    bar(hv,hv_means(hv),'FaceColor',cmap(hv,:),'EdgeColor','None','LineWidth',5,'BarWidth',0.9); hold on
    errorbar(hv,hv_means(hv),hv_stds(hv),'Color',cmap(hv,:)-0.3,'LineWidth',8,'Capsize',0);
end

asymmetry = (hv_means(1) - hv_means(2)) ./ ((hv_means(2)+hv_means(1))/2) * 100;
text(2.2,mean(hv_means),['\it' sprintf('%.1f%%',asymmetry)],'FontSize',25,'Color',cmap(3,:))

ylabel('%BOLD')

plot([1.1 3.5],[hv_means(1)-0.005*hv_means(1)  hv_means(1)-0.005*hv_means(1)],'--','Color',cmap(1,:),'LineWidth',2)
plot([2.1 3.5],[hv_means(2)-0.005*hv_means(2)  hv_means(2)-0.005*hv_means(2)],'--','Color',cmap(2,:),'LineWidth',2)
plot([3.5 3.5],[hv_means(1)-0.005*hv_means(1) hv_means(2)-0.005*hv_means(2)],'--','Color',cmap(3,:),'LineWidth',2)


set(gca,'Fontsize',30)
xticks([1 2])
xticklabels({'HM';'VM'})
title('HCP (n=181)')
ylim([0 0.5])
yticks([0:0.1:0.5])

set(gcf,'Position',[  1584         678         508         619])
xlim([-0.2 4])
box off