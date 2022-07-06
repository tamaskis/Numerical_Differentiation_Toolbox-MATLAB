%==========================================================================
%
% iabs  Absolute value ("complexified" version of the |abs| function).
%
%   y = iabs(x)
%
% See also abs.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-07-06
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
%
% -------
% OUTPUT:
% -------
%   y       - (1×1 complex) absolute value of x
%
%==========================================================================
function y = iabs(x)
    if (real(x) < 0)
        y = -real(x)-1i*imag(x);
    else
        y = x;
    end
end