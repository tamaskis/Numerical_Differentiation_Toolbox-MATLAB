%==========================================================================
%
% iatan2d  Four-quadrant inverse tangent in degrees ("complexified" version
% of the |atan2d| function).
%
%   z = iatan2d(y,x)
%
% See also atan2d.
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
%   y       - (1×1 complex) input argument
%   x       - (1×1 complex) input argument
%
% -------
% OUTPUT:
% -------
%   z       - (1×1 complex) four quadrant inverse tangent of (x,y) [deg]
%
%==========================================================================
function z = iatan2d(y,x)
    a = real(y);
    b = imag(y);
    c = real(x);
    d = imag(x);
    z = (180/pi)*(atan2(a,c)+1i*((c*b-a*d)/(a^2+c^2)));
end