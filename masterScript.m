clear
clc


% You can run download_HCP.sh to download the data, otherwise the script
% will ask you if you want matlab to do it for you.

if exist('prfresultsmgz','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions? type Y/N and press return. ','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
        system('sh download_HCP.sh')
        
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('wrong input')
    end
    
    
end

% We need vistasoft to be able to load mgz surface files
addpath(genpath('vistasoft'))
% reproduce asymmetry for HCP dataset in Figure 3
Fig3C
% reproduce icremental asymmetry for HCP in Figure 4
Fig4B
