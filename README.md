# The influence of non-neural factors on BOLD signal magnitude
Code from this repository will reproduce the main figures in the paper.
The code will download the HCP 7T retinotopy data, Benson's V1 definitions, example NSD maps and a preprocessed TDM dataset. 

*HCP 7T retinotopy - doi:https://doi.org/10.1167/18.13.23
*NSD               - http://naturalscenesdataset.org
*TDM               - https://doi.org/10.1038/s41592-020-0941-6

Dependencies:

Freesurfer's matlab functions (specifically MRIread.m). Toolbox comes with freesurfer
but can be also downloaded from:

* https://downgit.github.io/#/home?url=https://github.com/freesurfer/freesurfer/tree/dev/matlab

Two additional toolboxes that can be downloaded from github

* cvncode https://github.com/cvnlab/cvncode
* knkutils https://github.com/cvnlab/knkutils

If you are using ToolboxToolbox (https://github.com/ToolboxHub/ToolboxToolbox) to control paths and Matlab environemnt you can use this setup file to download all the necesseary dependancies.
https://github.com/WinawerLab/ToolboxRegistry/tree/master/configurations/meridianbias.json


If you are no using ToolboxToolbox and don't want to manually download the necessary dependencies, the do_0_check_dependencies.m can do it for you.

To use the code, clone this github repositor and navigate to the repository in the Matlab command window.

Example usage below:

This is the content of masterscript.m

``` Matlab
 % Navigate to the correct directory and add all to path

addpath(genpath('./'))
%%
do_0_check_dependencies.m     % check if all the necessary functions are in the path.
%%
do_1_download_data.m          % downloads necessary data.
%%
do_2_preprocess.m             % prepares data for figures.
%%
do_3_make_figures.m           % reproduce figures and saves them in the newly created "figures" directory.
 
``` 
 
 
Code (c) Jan Kurzawski

