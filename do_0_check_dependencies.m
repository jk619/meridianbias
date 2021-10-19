clc

str = input('Do you want to use ToolboxToolbox to setup paths? This assumes you already have meridianbias.json Y/N ','s');

if strcmp(str,'Y') || strcmp(str,'y')
    
    tbUse meridianbias
    
    if exist('cvnlookup.m') == 2 && exist('MRIread.m') == 2 && exist('calcconfusionmatrix.m')
        
        disp('You are good to go!')
        
    end
    
elseif strcmp(str,'N') ||  strcmp(str,'n')
    
    if exist('cvnlookup.m') == 2 && exist('MRIread.m') == 2 && exist('calcconfusionmatrix.m')
        
        disp('You are good to go!')
        
    else
        
        disp('You need dependencies! See README.md')
    end
end


