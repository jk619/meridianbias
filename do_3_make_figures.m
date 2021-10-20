clc
% add folder with figure scripts
addpath(genpath('makefigs'))

if ~exist('./figures','dir')
    mkdir('figures')
end
%% reproduce Figure 3E for HCP data
close all
Fig3E
saveas(gcf,'./figures/Fig3E','epsc')
%% reproduce incremental asymmetry for HCP in Figure 4C.
close all
Fig4C
saveas(gcf,'./figures/Fig4C','epsc')
%% reproduce %BOLD vs cortical depths
close all
Fig5
saveas(gcf,'./figures/Fig5','epsc')
%% show non-neural factors on spheres
close all
Fig6
saveas(gcf,'./figures/Fig6','epsc')
%% show correlation and GLM
close all
Fig7
saveas(gcf,'./figures/Fig7','epsc')
%% non-linear fitting
close all
Fig8
saveas(gcf,'./figures/Fig8','epsc')
%% All panels of Figure 9
if ~exist('./figures/Fig9/','dir')
    mkdir('./figures/Fig9/');
end
close all
Fig9a
saveas(gcf,'./figures/Fig9/Fig9a','epsc')
close all
Fig9b
saveas(gcf,'./figures/Fig9/Fig9b','epsc')
close all
Fig9c
saveas(gcf,'./figures/Fig9/Fig9c','epsc')
close all
Fig9d
saveas(gcf,'./figures/Fig9/Fig9d','epsc')
close all
Fig9e
saveas(gcf,'./figures/Fig9/Fig9e','epsc')
close all;
%% Sinus figures
Fig10
saveas(gcf,'./figures/Fig10','epsc')
close all;