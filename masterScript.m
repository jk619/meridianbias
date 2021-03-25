clear
clc
close

% You can run s0_download_HCP.sh to download the data, otherwise the script
% will ask you if you want matlab to do it

if exist('prfresultsmgz','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions? Y/N ','s');
    
    if strcomp(str,'Y')
        
        system('sh s0_download_HCP.sh')
        
    elseif strcomp(str,'N')
        
        error('You need the data!')
        
    else
        
        error('wrong input')
    end
    
    
end
addpath(genpath('vistasoft'))

% reproduce asymmetry for HCP dataset in Figure 3
Fig3C
% reproduce icremental asymmetry for HCP in Figure 4
Fig4B
