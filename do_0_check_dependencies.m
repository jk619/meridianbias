clc
clear
str = input('Do you want to use ToolboxToolbox to setup paths? \nThis assumes you already have the meridianbias.json Y/N\n','s');

if strcmp(str,'Y') || strcmp(str,'y')
    
    tbUse meridianbias
    
    if exist('cvnlookup.m') == 2 && exist('MRIread.m') == 2 && exist('calcconfusionmatrix.m')
        disp('-------------------')
        disp('You are good to go!')
        disp('-------------------')
        
        
    end
    
elseif strcmp(str,'N') ||  strcmp(str,'n')
    
    if exist('cvnlookup.m') == 2 && exist('MRIread.m') == 2 && exist('calcconfusionmatrix.m')
        
        disp('-------------------')
        disp('You are good to go!')
        disp('-------------------')
        
    else
        
        str = input('Do you want to download necessary toolboxes to utils folder in this directory Y/N?\n','s');
        if strcmp(str,'Y') || strcmp(str,'y')
            
            if ~exist('./utils','dir')
                mkdir('./utils')
                
            end
            
            websave('./utils/matlab.zip', 'https://osf.io/pm54w/download');
            cd('utils')
            unzip('./matlab.zip')
            system('git clone https://github.com/cvnlab/knkutils')
            system('git clone https://github.com/cvnlab/cvncode')
            cd('..')
            
            addpath(genpath('./utils'));
            
        elseif strcmp(str,'N') ||  strcmp(str,'n')
            
            disp('You need dependencies! See README.md')
            
            if exist('cvnlookup.m') == 2 && exist('MRIread.m') == 2 && exist('calcconfusionmatrix.m')
                
                disp('-------------------')
                disp('You are good to go!')
                disp('-------------------')
                
            else
                
                disp('Something went wrong with the download\n')

            end
        end
        
        
    end
end


