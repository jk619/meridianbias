load ./data_tdm/data_tdm;

hemi_str = {'lh';'rh'};
wh = 9;

labels = {'%BOLD' 'Curvature' 'sinus' 'Thickness' ' Angle w.r.t. B_0' 'Polar angle' 'Roi' 'Bias-corrected EPI' 'RF coil bias' 'Ecc' 'Depth' 'subjects' 'hemi' 'Corrected %BOLD'};


for subject=1:5
    temp = [];
    for hemi=1:2
        for layer=1:6
            temp = cat(1,temp,data{subject,hemi}{layer}(:,wh));
        end
    end
    sc = nanmedian(temp);
    
    for hemi=1:2
        for layer=1:6
            
            data{subject,hemi}{layer}(:,wh) = data{subject,hemi}{layer}(:,wh) ./ sc;
            data{subject,hemi}{layer}(:,5) = abs(data{subject,hemi}{layer}(:,5)-90);
            data{subject,hemi}{layer}(:,6) = abs(data{subject,hemi}{layer}(:,6)-90);
            %             pa =
            
        end
    end
end


data0 = [];
for subject=1:5
    for hemi=1:2
        for layer=1:6
            
            selected = ones(1,size(data{subject,hemi}{layer},1))';
            data0 = cat(1,data0,cat(2,data{subject,hemi}{layer},layer*ones(sum(selected),1),subject*ones(sum(selected),1),hemi*ones(sum(selected),1)));
            
        end
    end
end

data_bak = data0;
%%
addpath(genpath('makefigs'));
cmap = cbrewer('qual','Set1',5);

