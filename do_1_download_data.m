clear
close all

rootPath=rootPath();
cd(rootPath);
opts = weboptions('CertificateFilename', '');

str = input('Do you want to download the data (~5 GB). Type Y/N and press return.\n','s');

if strcmp(str,'Y') || strcmp(str,'y')
    
    if exist('./data_hcp/prfresultsmgz/100610/lh.fit1_gain.mgz','file') && exist('./benson_atlas/lh.varea.mgz','file')
        
    else
        
        disp('-------------------------------------------------------')
        disp('Downloading HCP 7T retinotopy data - might take a while')
        disp('-------------------------------------------------------')
        
        websave('./data_hcp.zip', 'https://osf.io/tqprz/download',opts);
        
        disp('Unpacking  HCP 7T retinotopy data')
        disp('-------------------------------------------------------')
        unzip('data_hcp.zip','data_hcp');
        delete('./data_hcp.zip');
        
        
        mkdir('benson_atlas')
        
        disp('Downloading Benson''s V1 definition')
        disp('-------------------------------------------------------')
        websave('./benson_atlas/lh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/lh.benson14_varea.v4_0.mgz',opts);
        websave('./benson_atlas/rh.varea.mgz','https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/rh.benson14_varea.v4_0.mgz',opts);
        
        if exist('./data_tdm/data_tdm.mat','file') == 2
            
        else

            mkdir('data_tdm')
                        
            disp('-------------------------------------------------------')
            disp('Downloading TDM data')
            disp('-------------------------------------------------------')
            
            websave('./data_tdm/data_tdm.mat', 'https://osf.io/u4x5y/download',opts);
            
        end

        if exist('./data_nsd/lh.B0_or.mgz','file')
            
        else
            
            disp('-------------------------------------------------------')
            disp('Downloading NSD data')
            disp('-------------------------------------------------------')
            
            websave('./data_nsd.zip', 'https://osf.io/wc9r7/download',opts);
            disp('Unpacking  NSD data')
            disp('-------------------------------------------------------')
            unzip('./data_nsd.zip');
            delete('./data_nsd.zip');
            
        end
    end
    
elseif strcmp(str,'N') ||  strcmp(str,'n')
    
    error('You need the data!')
    
else
    
    error('Wrong input!')
    
    
end
