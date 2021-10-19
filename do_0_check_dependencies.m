clc
clear
str = input('Do you want to use ToolboxToolbox to setup paths? \nThis assumes that you already have ToolboxToolbox and the meridianbias.json (see README.md). Type Y/N and press return.\n','s');

if strcmp(str,'Y') || strcmp(str,'y')
    
    if exist('tbUse.m','file') == 2
        
        disp('ToolboxToolbox is in your path')
        
        if exist(sprintf('%s/toolboxes/ToolboxRegistry/configurations/meridianbias.json',userFolder)) == 2
            
            disp('meridianbias.json exists')
        else
            error('You don''t have meridianbias.json file (see README.md)')
        end
        
        
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
            
            websave('./utils/matlab.zip', 'https://osf.io/pm54w/download');
            cd('utils')
            unzip('./matlab.zip')
            system('git clone https://github.com/cvnlab/knkutils')
            system('git clone https://github.com/cvnlab/cvncode')
            cd('..')
            addpath(genpath('./utils'));
            disp('-------------------')
            disp('You are good to go!')
            disp('-------------------')
            
        elseif strcmp(str,'N') ||  strcmp(str,'n')
            error('You need dependencies! See README.md')
        else
            
            error('Wrong input!')
        end
    end
else
    error('Wrong input!')
end



