%==========================================================================
%
% idot  Vector dot product ("complexified" version of the |dot| function).
%
%   z = idot(x,y)
%
% See also dot.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-09-10
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
%   x       - (n×1 complex) input argument
%   y       - (n×1 complex) input argument
%
% -------
% OUTPUT:
% -------
%   z       - (1×1 complex) dot product of x and y
%
%==========================================================================
function z = idot(x,y)
    z = x.'*y;
end