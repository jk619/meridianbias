clc
clear
opts = weboptions('CertificateFilename', '');

if license('test','statistics_toolbox') && license('test','optimization_toolbox') && license('test','distrib_computing_toolbox')
    
    disp('-------------------------------------------------------------')
    disp('You have all the necessary Matlab toolboxes to run this code.')
    disp('-------------------------------------------------------------')
    
else
    error('Some of the needed Matlab toolboxes are missing')
end


str = input('\nDo you want to use ToolboxToolbox to setup paths? \nThis assumes that you already have ToolboxToolbox and the meridianbias.json (see README.md). Type Y/N and press return.\n','s');

if strcmp(str,'Y') || strcmp(str,'y')
    
    if exist('tbUse.m','file') == 2
        
        disp('ToolboxToolbox is in your path')
        
        if exist(sprintf('%s/toolboxes/ToolboxRegistry/configurations/meridianbias.json',userpath)) == 2
            
            disp('meridianbias.json exists')
        else
            error('You don''t have meridianbias.json file (see README.md)')
        end
        
    else
        error('ToolboxToolbox not detected in the path')
        
    end
    
    
    tbUse meridianbias
    
    if exist('cvnlookup.m') == 2 && exist('MRIread.m') == 2 && exist('calcconfusionmatrix.m');
        disp('-------------------')
        disp('You are good to go!')
        disp('-------------------')
    end
    
elseif strcmp(str,'N') ||  strcmp(str,'n')
    
    if exist('cvnlookup.m') == 2 && exist('MRIread.m') == 2 && exist('calcconfusionmatrix.m');
        disp('-------------------')
        disp('You are good to go!')
        disp('-------------------')
    else
        
        str = input('Do you want to download necessary toolboxes to utils folder in this directory. Type Y/N and press return.\n','s');
        if strcmp(str,'Y') || strcmp(str,'y')
            if ~exist('./utils','dir')
                mkdir('utils')
            end
            
            websave('./utils/matlab.zip', 'https://osf.io/8bxrk/download',opts);
            cd('utils');
            unzip('./matlab.zip');
            system('git -c http.sslVerify=false clone https://github.com/cvnlab/knkutils.git');
            system('git -c http.sslVerify=false clone https://github.com/cvnlab/cvncode.git');
            cd('..');
            addpath(genpath('./utils'));
            delete('./utils/matlab.zip');
            disp('-------------------');
            disp('You are good to go!');
            disp('-------------------');
            
        elseif strcmp(str,'N') ||  strcmp(str,'n')
            error('You need dependencies! See README.md')
        else
            
            error('Wrong input!')
        end
    end
else
    error('Wrong input!')
end



