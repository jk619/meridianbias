% Navigate to the correct directory and add all to the path. You will be 
% asked a series of questions about dependencies and downloading the data.
% You can reply by typing Y for Yes or N for No.

% All figures are saved as a *.png. Due to it's complexity Figure 9 is
% saved as a seperate folder inside "figures" folder where each png file 
% represents one panel.

% Reproduced figures:
% Figure 3E
% Figure 4C - for HCP data (same code can be used to run it on TDM and NSD)
% Figure 5
% Figure 6
% Figure 7
% Figure 8
% Figure 9
% FIgure 10 D-F

% Some panels from Figure 10 are not reproduced as they were eddited with 
% additional software.

% Figure 10A was made in slicer ('https://www.slicer.org')
% Figure 10B, Figure 10C and Figure 10E were additioanly modified in
% Illustrator.

addpath(genpath('./'))
%%
do_0_check_dependencies     % check if all the necessary functions are in the path.
%%
do_1_download_data          % download necessary data.
%%
do_2_preprocess             % prepare data for making figures.
%%
do_3_make_figures           % reproduce figures and save them in the newly created "figures" directory.