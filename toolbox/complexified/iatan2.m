%==========================================================================
%
% iatan2  Four-quadrant inverse tangent in radians ("complexified" version 
% of the |atan2| function).
%
%   z = iatan2(y,x)
%
% See also atan2.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-13
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
%   y       - (1×1 complex) input argument
%   x       - (1×1 complex) input argument
%
% -------
% OUTPUT:
% -------
%   z       - (1×1 complex) four quadrant inverse tangent of (x,y) [rad]
%
%==========================================================================
function z = iatan2(y,x)
    a = real(y);
    b = imag(y);
    c = real(x);
    d = imag(x);
    z = atan2(a,c)+1i*((c*b-a*d)/(a^2+c^2));
end