%% CREATE_HTML_DOCUMENTATION.m  Creates html documentation.
%
% Copyright © 2021 Tamas Kis
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-08-03



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear;clc;close all;



%% TOOLBOX ROOT DIRECTORY

% filepath to toolbox root directory
toolbox = "../";

% adds path to every subdirectory of toolbox
%addpath(genpath(toolbox));
addpath(toolbox);



%% DOCUMENTATION FILEPATHS

% filepath to source directory for .m documentation files
documentation.source = "docscripts/";

% filepath to destination directory where html documentation should go
documentation.destination = "html/";

% specific .m documentation files that should be published (comment out if
% you want to publish all .m documentation files)
% documentation.mfiles = ["euler_doc";
%                         "ODE_Solver_Toolbox_Contents"];



%% IMAGE FILEPATHS

% filepath to source directory for image files
images.source = "docimages/";

% specific image files that should be published (comment out if you want to
% publish all image files)
%images.files = ["ode_solver_toocomplbox_small.png"];



%% PRODUCE HTML DOCUMENTATION

% publishes the html documentation
export_html(toolbox,documentation,images)