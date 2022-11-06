%==========================================================================
%
% imin  Minimum of two numbers (complexified version of |min|).
%
%   m = imin(x,y)
%
% See also min.
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
%   m       - (1×1 complex) minimum of the inputs
%
%==========================================================================
function m = imin(x,y)
    if real(x) > real(y)
        m = y;
    else
        m = x;
    end
end