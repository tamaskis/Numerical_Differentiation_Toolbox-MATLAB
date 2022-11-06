%==========================================================================
%
% imax  Maximum of two numbers (complexified version of |max|).
%
%   m = imax(x,y)
%
% See also max.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-06
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/files/Numerical_Differentiation.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   x       - (1×1 complex) input argument
%   y       - (1×1 complex) input argument
%
% -------
% OUTPUT:
% -------
%   m       - (1×1 complex) maximum of x and y
%
%==========================================================================
function m = imax(x,y)
    if real(x) < real(y)
        m = y;
    else
        m = x;
    end
end