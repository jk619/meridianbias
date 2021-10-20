clc
% add folder with figure scripts
addpath(genpath('makefigs'))

if ~exist('./figures','dir')
    mkdir('figures')
end
%% reproduce Figure 3E for HCP data
close all
Fig3E
saveas(gcf,'Fig3E','epsc')
%% reproduce incremental asymmetry for HCP in Figure 4C.
close all
Fig4C
print('-dpng','-r300','./figures/4.png');
%% reproduce %BOLD vs cortical depths
close all
Fig5
print('-dpng','-r300','./figures/5.png');
%% show non-neural factors on spheres
close all
Fig6
print('-dpng','-r300','./figures/6.png');
%% show correlation and GLM
close all
Fig7
print('-dpng','-r300','./figures/7.png');
%% non-linear fitting
close all
Fig8
print('-dpng','-r300','./figures/8.png');
%% All panels of Figure 9
if ~exist('./figures/Fig9/','dir')
    mkdir('./figures/Fig9/');
end
close all
Fig9a
print('-dpng','-r300','./figures/Fig9/a.png');
close all
Fig9b
print('-dpng','-r300','./figures/Fig9/b.png');
close all
Fig9c
print('-dpng','-r300','./figures/Fig9/c.png');
close all
Fig9d
print('-dpng','-r300','./figures/Fig9/d.png');
close all
Fig9e
print('-dpng','-r300','./figures/Fig9/e.png');
close all;
%% Sinus figures
Fig10
print('-dpng','-r300','./figures/10.png');
close all;