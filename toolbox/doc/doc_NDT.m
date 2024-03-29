%==========================================================================
%
% doc_NDT  Opens the documentation for the Numerical Differentiation 
% Toolbox.
%
%   doc_NDT
%   doc_NDT name
%   doc_NDT tech
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-12
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   name   - (char) name of the function or class
%               --> using "tech" opens the technical documentation
%
%==========================================================================
function doc_NDT(name)
    
    % opens index if no function name specified
    if nargin == 0
        web('html_NDT/index.html');
        
    % opens technical documentation
    elseif strcmpi(name,'tech')
        open(strcat('Numerical_Differentiation.pdf'));
        
    % opens specified function documentation
    else
        web(['html_NDT/',name,'_doc.html']);
        
    end
    
end