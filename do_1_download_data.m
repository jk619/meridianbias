clear
close all

rootPath=rootPath();
cd(rootPath);
opts = weboptions('CertificateFilename', '');
if exist('prfresultsmgz','dir') && exist('benson_atlas','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions and Benson''s V1 definition (2.4 GB). Type Y/N and press return.\n','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
        % download pRF maps for each subject in HCP dataset (n=181).
        
        disp('-------------------------------------------------------')
        disp('Downloading HCP 7T retinotopy data - might take a while')
        disp('-------------------------------------------------------')
        
        websave('./prfresultsmgz.zip', 'https://osf.io/tqprz/download',opts);
        
        disp('Unpacking  HCP 7T retinotopy data')
        disp('-------------------------------------------------------')
        unzip('prfresultsmgz.zip')
        delete('./prfresultsmgz.zip');

        
        % download Benson's atlas to locate V1 ROI.
        
        mkdir('benson_atlas')
        
        disp('Downloading Benson''s V1 definition')
        disp('-------------------------------------------------------')
        websave('./benson_atlas/lh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/lh.benson14_varea.v4_0.mgz',opts);
        websave('./benson_atlas/rh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/rh.benson14_varea.v4_0.mgz',opts);
        
        
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('Wrong input!')
    end
    
    
end

if exist('data_tdm','dir')
    
else
    
    str = input('Do you want to download TDM data (600mb). Type Y/N and press return.\n','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
        mkdir('data_tdm')
        
        % download pRF maps for each subject in HCP dataset (n=181).
        
        disp('-------------------------------------------------------')
        disp('Downloading TDM data')
        disp('-------------------------------------------------------')
        
        websave('./data_tdm/data_tdm.mat', 'https://osf.io/u4x5y/download',opts);
        
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('Wrong input!')
    end
end

if exist('data_nsd','dir')
    
else
    str = input('Do you want to download NSD maps (1.6GB). Type Y/N and press return.\n','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
        
        disp('-------------------------------------------------------')
        disp('Downloading NSD data')
        disp('-------------------------------------------------------')
        
        websave('./data_nsd.zip', 'https://osf.io/wc9r7/download',opts);
        disp('Unpacking  NSD data')
        disp('-------------------------------------------------------')
        unzip('./data_nsd.zip');
        delete('./data_nsd.zip');
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('Wrong input!')
    end
end