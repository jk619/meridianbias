clear
clc
close all

rootPath=ebsrootPath();
cd(rootPath);



% You can run download_HCP.sh to download the data, otherwise the script
% will ask you if you want matlab to do it for you.

if exist('prfresultsmgz','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions? type Y/N and press return. ','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
        % downloads pRF maps for for each subject in HCP dataset (n=181).
        
        disp('Downloading HCP 7T retinotopy data - might take a while')
        websave('./prfresultsmgz.zip', 'https://osf.io/tqprz/download');
        unzip('prfresultsmgz.zip')

        % downloads Benson's atlas to locate V1 ROI.

        mkdir('benson_atlas')
        websave('./benson_atlas/lh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/lh.benson14_varea.v4_0.mgz');
        websave('./benson_atlas/rh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/rh.benson14_varea.v4_0.mgz');

        
        % download MRIr
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('Wrong input!')
    end
    
    
end

% reproduce asymmetry for HCP dataset in Figure 3E.
Fig3E
% reproduce incremental asymmetry for HCP in Figure 4C.
Fig4C
