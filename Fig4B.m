% JK 03/2021
clear
clc

subjects = dir('./data/prfresultsmgz/');
subjects=subjects(~ismember({subjects.name},{'999997','999998','999999'}));
subjects = {subjects.name};

subjects_char=char(subjects);
ok=(isstrprop(subjects_char(:,1),'digit'));
subjects = subjects(ok);

hemi = {'lh';'rh'}
moving = 0:5:50;
width = 10*2;
datasets = {'HCP'};

myamp = NaN(2,length(subjects),length(moving),length(hemi));
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
        
        %
        if h == 1
            
            hvmap.vol  = (mod(90 - hvmap.vol + 180, 360) - 180); % adjust angle to Benson atlas so it is consistent with TDM and NSD
            
        elseif h == 2
            
            hvmap.vol  = (mod(90 - hvmap.vol + 180, 360) - 180);
            hvmap.vol = hvmap.vol .* -1;
            
        end
        
        
        myrois = (squeeze(atlas.vol == 1))';
        
        for hv = 1:2
            
            for m = 1: length(moving)
                
                x = moving(m);
                
                
                if hv == 1
                    
                    
                    
                    
                    horzvert1 = hvmap.vol>=((90-x)-(width/2));
                    horzvert1 = horzvert1 & hvmap.vol<=(90-x);
                    horzvert2 = hvmap.vol>=(90+x);
                    horzvert2 = horzvert2 & hvmap.vol<=((90+x)+(width/2));
                    horzvert = (horzvert1 | horzvert2) &  myrois;
                    
                    
                    
                    
                elseif hv == 2
                    
                    horzvert1 = hvmap.vol >= 0+x;
                    horzvert2 = hvmap.vol <= (0+x)+width/2;
                    horzvert3 = hvmap.vol >= (180-x) - width/2;
                    horzvert4 =  hvmap.vol <= (180-x);
                    horzvert = ((horzvert1 & horzvert2) | (horzvert3 & horzvert4)) & myrois;
                    
                end
                
                
                
                
                horzvert = horzvert & ecc.vol < 8;
                myamp(hv,s,m,h) = nanmedian(glmres(horzvert));
                
                
                
                
            end
            
            
            
            
        end
        
    end
    
end



%%



mymeanbeta_nohemi = nanmean(myamp,4);
assym_subj = NaN(length(subjects),length(moving));

for v = 1 : length(moving)
    
    
    horz = mymeanbeta_nohemi(1,:,v);
    vert = mymeanbeta_nohemi(2,:,v);
    

    for s = 1 : length(subjects)
        
        
        assym_subj(s,v) = (horz(s) - vert(s))/((vert(s)+horz(s))/2)*100;
        
    end

end

%%
figure(2);clf

mymeanperc = nanmean(assym_subj);
mystdperc = nanstd(assym_subj,[],1)/sqrt(length(assym_subj));

ppp=plot(moving,mymeanperc,'-o','Linewidth',2,'Color', [0.9490 0.1020 0],'MarkerSize',6); hold on
errorbar(moving,mymeanperc,mystdperc,'Color',[0.9490 0.1020 0],'Linewidth',6)


set(gca,'Fontsize',30)
title('Incremental')
xlabel(sprintf('Meridian (deg)'));
ylabel('Asymmetry ratio (%)')
ylim([-20 100]);
xlim([0 50]);


plot(xlim,[0 0],'--','Color',[0.5 0.5 0.5]);

myticks = xticks;
mytxttick = cell(1,length(myticks));
for m = 1 : length(myticks)
    
    mytxttick{m} = sprintf('%i%s',myticks(m),char(176));
    
end

xticklabels(mytxttick)
set(gcf,'Position',[ 745         804        1511         493])


