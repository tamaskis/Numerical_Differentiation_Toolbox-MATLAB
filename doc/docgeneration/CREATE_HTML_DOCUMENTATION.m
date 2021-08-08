%% CREATE_HTML_DOCUMENTATION.m  Creates html documentation.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-07
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear;clc;close all;



%% INPUTS

% array storing file paths to all code needed to run examples in the
% documentation (i.e. source code, external code, etc.)
code_folders = ["../../src"];

% specific .m documentation files that should be published
%   --> define as "[]" if you want to publish all .m documentation files
mfiles = [];

% specific image files that should be published
%   --> define as "[]" if you want to publish all image files
imagefiles = [];

% true if previous "doc/html" folder should be completely deleted, false
% otherwise
delete_html = true;



%% PRODUCE HTML DOCUMENTATION

export_html(code_folders,mfiles,imagefiles,delete_html);