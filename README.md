# The influence of non-neural factors on BOLD signal magnitude
Code that will reproduce the main figures in the paper

The code will download the HCP 7T retinotopy data, Benson's V1 definitions, example NSD maps and a preprocessed TDM dataset 

Dependencies:
Freesurfer's matlab functions (specifically MRIread.m). Toolbox comes with freesurfer
but can be also downloaded from:
* https://downgit.github.io/#/home?url=https://github.com/freesurfer/freesurfer/tree/dev/matlab

Two additional toolboxes that can be downloaded from git

* cvncode https://github.com/cvnlab/cvncode
* knkutils https://github.com/cvnlab/knkutils


To use the code, download or clone this github repository, navigate to the repository in the Matlab command window.
Example usage below:

``` Matlab
 % Navigate to the correct directory and add all to path

addpath(genpath('./'))
masterScript.m
 
``` 
 
 
Code (c) Jan Kurzawski

