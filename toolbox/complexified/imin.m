%==========================================================================
%
% imin  Minimum of two numbers ("complexified" version of the |min| 
% function).
%
%   m = imin(x1,x2)
%
% See also min.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-14
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_using_the_Complex_Step_Approximation.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   x1      - (1×1 complex) input 1
%   x2      - (1×1 complex) input 2
%
% -------
% OUTPUT:
% -------
%   m       - (1×1 complex) minimum of the inputs
%
%==========================================================================
function m = imin(x1,x2)
    if real(x1) > real(x2)
        m = x2;
    else
        m = x1;
    end
end