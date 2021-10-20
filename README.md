# The influence of non-neural factors on BOLD signal magnitude
Code from this repository will reproduce the main figures from the paper and save them in the "figures" directory. All scripts are written in MATLAB 2019b and tested on macOS Big Sur (11.5.2).
The code will download the HCP 7T retinotopy data, Benson's V1 definitions, example NSD maps and a preprocessed TDM dataset. If used scripts and toolboxes are not in MATLAB's path (which is most likely) the code can take care of the dependencies and download all of the necessary files. You will be asked in the beginning of the masterscript.m if you want to do that.

## **Datasets:**

All datasets are public and can be accessed using links below:
1. [HCP 7T retinotopy](https://osf.io/esdu5/)
2. [NSD](http://naturalscenesdataset.org)
3. [TDM](https://osf.io/j2wsc/)

## **Dependencies:**

1. Freesurfer's matlab functions (specifically functions to read surfaces). Toolbox containing this function comes with freesurfer 
and most probably is already in your path if you have freesurfer installed.

Otherwise, it can be downloaded from:

* [matlab.zip](https://osf.io/8bxrk/)

2. Two additional toolboxes that can be downloaded from github:

* [cvncode](https://github.com/cvnlab/cvncode)
* [knkutils](https://github.com/cvnlab/knkutils)

3. If you are using ToolboxToolbox (https://github.com/ToolboxHub/ToolboxToolbox) to control paths you can use [this setup file](https://github.com/WinawerLab/ToolboxRegistry/tree/master/configurations/meridianbias.json) to download all the necesseary dependancies. The setup file has to sit in configurations folder of ToolboxToolbox.

4. Matlab toolboxes required to run code in this repository:
* optimization toolbox
* statistics toolbox 
* parallel computing toolbox

### __NOTE__:

If you are not using ToolboxToolbox and don't want to manually download all the necessary dependencies, the do_0_check_dependencies.m can do it for you. Necessary files are going to be download to the "utils" folder in the directory of this repository. The size of the "utils" folder is 13.9 MB.

## **Running the code:**

This is the content of masterscript.m

``` Matlab
% Navigate to the directory of this repository and run masterscript.m.  You will be 
% asked a series of questions about dependencies and downloading the data.
% You can reply by typing Y for Yes or N for No.

% All figures are saved as a *.png. Due to it's complexity Figure 9 is
% saved as a seperate folder inside "figures" folder where each png file 
% represents one panel.

% Reproduced figures:
% Figure 3E - for HCP data (same code can be used to run it on TDM and NSD)
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
``` 

Code written by JWK 10/19/21

