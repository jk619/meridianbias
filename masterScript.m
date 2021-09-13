clear
clc
close all


% You can run download_HCP.sh to download the data, otherwise the script
% will ask you if you want matlab to do it for you.

if exist('prfresultsmgz','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions? type Y/N and press return. ','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
        % downloads pRF maps for for each subject in HCP dataset (n=181).
        % downloads Benson's atlas to locate V1 ROI.
        % clones repisotory of vistasoft needed to load mgz files.
        system('sh download_HCP.sh')
        
        
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('Wrong input!')
    end
    
    
end

% We need vistasoft to be able to load mgz surface files.
addpath(genpath('vistasoft'))
% reproduce asymmetry for HCP dataset in Figure 3E.
Fig3E
% reproduce incremental asymmetry for HCP in Figure 4C.
Fig4C
