clear
clc
<<<<<<< HEAD


=======
close all
>>>>>>> 6a29177356c88f8831219a2222b49dec5e3ce743


% You can run download_HCP.sh to download the data, otherwise the script
% will ask you if you want matlab to do it for you.

if exist('./data/prfresultsmgz','dir')
    
else
    
    str = input('Do you want to download HCP pRF solutions? type Y/N and press return. ','s');
    
    if strcmp(str,'Y') || strcmp(str,'y')
        
<<<<<<< HEAD
        system('sh ./subroutines/download_HCP.sh')
=======
        % downloads pRF maps for for each subject in HCP dataset (n=181).
        % downloads Benson's atlas to locate V1 ROI.
        % clones repisotory of vistasoft needed to load mgz files.
        system('sh download_HCP.sh')
>>>>>>> 6a29177356c88f8831219a2222b49dec5e3ce743
        
        
    elseif strcmp(str,'N') ||  strcmp(str,'n')
        
        error('You need the data!')
        
    else
        
        error('Wrong input!')
    end
    
    
end

<<<<<<< HEAD


addpath(genpath('vistasoft'))
% reproduce asymmetry for HCP dataset in Figure 3
Fig3C
% reproduce incremental asymmetry analysis for HCP in Figure 4
Fig4B
=======
% We need vistasoft to be able to load mgz surface files.
addpath(genpath('vistasoft'))
% reproduce asymmetry for HCP dataset in Figure 3E.
Fig3E
% reproduce incremental asymmetry for HCP in Figure 4C.
Fig4C
>>>>>>> 6a29177356c88f8831219a2222b49dec5e3ce743
