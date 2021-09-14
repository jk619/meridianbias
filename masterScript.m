clear
clc
close all

rootPath=rootPath();
cd(rootPath);

% check dependencies

if ~exist('MRIread.m','file')
    error('MRIread.m was not found. You need freesurfer''s matlab toolbox. See README.md')
end

if exist('prfresultsmgz','dir') && exist('benson_atlas','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions and Benson''s V1 definition. Type Y/N and press return. ','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
        % download pRF maps for each subject in HCP dataset (n=181).
        
        disp('-------------------------------------------------------')
        disp('Downloading HCP 7T retinotopy data - might take a while')
        disp('-------------------------------------------------------')

        websave('./prfresultsmgz.zip', 'https://osf.io/tqprz/download');
        
        disp('Unpacking HCP 7T retinotopy data')
        disp('-------------------------------------------------------')
        unzip('prfresultsmgz.zip')

        % download Benson's atlas to locate V1 ROI.

        mkdir('benson_atlas')
        
        disp('Downloading Benson''s V1 definition')
        disp('-------------------------------------------------------')
        websave('./benson_atlas/lh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/lh.benson14_varea.v4_0.mgz');
        websave('./benson_atlas/rh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/rh.benson14_varea.v4_0.mgz');

        
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('Wrong input!')
    end
    
    
end

%%
% reproduce asymmetry for HCP dataset in Figure 3E. We are going to loop
% through the subjects 
Fig3E
% reproduce incremental asymmetry for HCP in Figure 4C.
Fig4C
