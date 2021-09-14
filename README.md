# The influence of non-neural factors on BOLD signal magnitude
Code to reproduce the figures 3C and 4C 

The code will download the HCP 7T retinotopy data from osf together with Benson's V1 definition. 
Figures 3E and 4C are going to be reproduced using Fig3E.m and Fig4C.m

Dependencies:
* freesurfer's matlab functions (specifically MRIread.m). Toolbox comes with freesurfer
but can be also downloaded from:

https://downgit.github.io/#/home?url=https://github.com/freesurfer/freesurfer/tree/dev/matlab



To use the code, download or clone this github repository, then navigate to the repository in the Matlab command window.
Example usage below:

``` Matlab
 % Navigate to the correct directory and add all to path

addpath(genpath('./'))
masterScript.m
 
``` 
 
 
Code (c) Jan Kurzawski

