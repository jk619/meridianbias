function rootPath=RootPath()
%
% rootPath = RootPath;
%
% Determine path to root of the ebs directory
%
% This function MUST reside in the directory at the base of the ebs directory structure
%
% This is stolen from @Jon Winawer

rootPath=which('RootPath');

rootPath=fileparts(rootPath);

return