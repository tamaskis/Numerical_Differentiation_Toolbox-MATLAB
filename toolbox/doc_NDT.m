%==========================================================================
%
% doc_Numerical_Differentiation_Toolbox  Opens the documentation for the
% Numerical Differentiation_Toolbox.
%
%   doc_NDT
%   doc_NDT function_name
%   doc_NDT(function_name)
%   doc_NDT tech
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-29
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   name   - (char) name of the function
%
%==========================================================================
function doc_NDT(name)

    % opens index if no function name specified
    if nargin == 0
        web('html/index.html');

    % opens technical documentation
    elseif strcmpi(name,'tech')
        open Numerical_Differentiation_using_the_Complex_Step_Approximation.pdf
        
    % opens specified function documentation
    else
        web(strcat('html/',name,'_doc.html'));

    end
end