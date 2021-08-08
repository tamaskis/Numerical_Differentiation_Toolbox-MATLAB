%==========================================================================
%
% export_html  Publishes documentation (written in .m files) to html files,
% and copies necessary images for documentation to the folder containing
% the html documentation.
%
%   export_html(toolbox,documentation,images)
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-04
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   code_folders    - (array of strings) filepaths to all code needed to 
%                     run examples in the documentation
%   mfiles          - (array of strings) stores specific .m files to
%                     publish; if input as an empty array, all .m files in
%                     "docscripts" are published
%   imagefiles    	- (array of strings) stores specific images to publish;
%                     if input as an empty array, all images in "docimages"
%                     are published
%   delete_html     - (1×1 logical) true if previous "doc/html" folder
%                     should be deleted, false otherwise
%
%==========================================================================
function export_html(code_folders,mfiles,imagefiles,delete_html)
    
    % -----------------------------
    % SETS UP DIRECTORIES/FILEPATHS
    % -----------------------------
    
    % creates "doc/html" if it does not exist
    if exist("../html",'dir') == 0
        mkdir("../html");
    end
    
    % deletes contents of "doc/html" folder if specified
    if delete_html
        html = dir("../html");
        for k = 1:length(html)
            delete("../html/"+html(k).name)
        end
        clc;
    end
    
    % adds path to all directories containing code needed
    for i = 1:length(code_folders)
        addpath(genpath(code_folders(i)));
    end
    
    % ------
    % IMAGES
    % ------
    
    % moves to "doc/docimages" folder (folder storing all images)
    cd("../docimages/");
    
    % creates list of images to publish (either a list of image file names
    % specified by the user, or if the user didn't specify anything, then
    % all .png, .jpg, .svg, .eps, .pbm, .pdf, and .bmp files in the
    % "doc/docimages" folder are included)
    if isempty(imagefiles)
        extensions = ["png","jpg","svg","eps","pbm","pdf","bmp"];
        imagefiles = "";
        for i = 1:length(extensions)
            imagefiles_struct = dir(fullfile(pwd,"*."+extensions(i)));
            for j = 1:length(imagefiles_struct)
                imagefiles = [imagefiles;imagefiles_struct(j).name];
            end
        end
        imagefiles = imagefiles(2:end);
    end
    
    % copies images to "doc/html"
    for i = 1:length(imagefiles)
        copyfile(imagefiles(i),"../html/"+imagefiles(i));
    end
    
    % -------------
    % DOCUMENTATION
    % -------------
    
    % moves to "doc/docscripts" folder (folder storing all .m file
    % documentation)
    cd("../docscripts/");
    
    % creates list of .m files to publish (either a list of .m files
    % specified by the user, or if the user didn't specify anything then
    % all .m files in "doc/docscripts" are included)
    if isempty(mfiles)
        mfiles_struct = dir(fullfile(pwd,'*.m'));
        mfiles = strings(length(mfiles_struct),1);
        for i = 1:length(mfiles)
            mfiles(i) = mfiles_struct(i).name;
        end
    end
    
    % publishes documentation, moving html files from "html" folder in 
    % "docsripts" to "html" folder in "doc"
    for i = 1:length(mfiles)
        fprintf("Publishing "+extractBetween(mfiles(i),1,...
        strlength(mfiles(i))-2)+".html\n");
        publish(mfiles(i),'html');
        movefile("html/*","../html/");
    end

    % removes "html" folder from "docscripts" folder
    rmdir("html");
    
    % returns to "docgeneration" folder
    cd("../docgeneration/");

end