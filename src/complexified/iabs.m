%==========================================================================
%
% iabs "Complexified" version of the absolute value (abs) function.
%
%   y = iabs(x)
%
% See also abs.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-10
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_Using_the_Complex_Step_Approximation.pdf
%
% REFERENCES:
%   [1] https://mdolab.engin.umich.edu/misc/files/complexify.f90
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
function result = iabs(x)
    if (real(x) < 0)
        result = -real(x)-1i*imag(x);
    else
        result = x;
    end
end