% Navigate to the correct directory and add all to path

addpath(genpath('./'))
%%
do_0_check_dependencies   % check if all the necessary functions are in the path.
%%
do_1_download_data          % downloads necessary data.
%%
do_2_preprocess             % prepares data for figures.
%%
do_3_make_figures           % reproduce figures and saves them in the newly created "figures" directory.