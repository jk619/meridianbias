clear
clc
close all

rootPath=ebsrootPath();
cd(rootPath);

% check dependencies

if ~exist('MRIread.m','file')
    error('You need freesurfer''s matlab toolbox')
end

if exist('prfresultsmgz','dir') && exist('benson_atlas','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions and Benson''s V1 definition. Type Y/N and press return. ','s');
    
    if strcmp(str,'Y') || strcmp(str,'y') || strcmp(str,'yes') || strcmp(str,'Yes')
        
        % downloads pRF maps for for each subject in HCP dataset (n=181).
        
        
        disp('Downloading HCP 7T retinotopy data - might take a while')
        websave('./prfresultsmgz.zip', 'https://osf.io/tqprz/download');
        unzip('prfresultsmgz.zip')

        % downloads Benson's atlas to locate V1 ROI.

        mkdir('benson_atlas')
        
        websave('./benson_atlas/lh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/lh.benson14_varea.v4_0.mgz');
        websave('./benson_atlas/rh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/rh.benson14_varea.v4_0.mgz');

        
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
