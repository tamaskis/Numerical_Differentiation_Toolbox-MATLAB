%% Numerical Differentiation Toolbox Documentation
%
% <<numerical_differentiation_toolbox.png>>
%
% Copyright © 2021 Tamas Kis
%% Functions
% * <iderivative_doc.html *|iderivative|*> Derivative of a univariate, scalar or vector-valued function.
% * <ipartial_doc.html *|ipartial|*> Partial derivative of a multivariate, scalar or vector-valued function.
% * <igradient_doc.html *|igradient|*> Gradient of a multivariate, scalar-valued function.
% * <idirectional_doc.html *|idirectional|*> Directional derivative of a multivariate, scalar-valued function.
% * <ijacobian_doc.html *|ijacobian|*> Jacobian matrix of a multivariate, vector-valued function.
% * <ihessian_doc.html *|ihessian|*> Hessian matrix of a multivariate, scalar-valued function.
%
% *NOTE:* Two other functions, |iatan2| and |iabs|, are also included with
% this toolbox. These functions are simply "complexified" versions of
% |atan2| and |abs| and are thus left undocumented.
%% Technical Documentation
% Click <https://tamaskis.github.io/documentation/Numerical%20Differentiation%20Using%20the%20Complex-Step%20Approximation.pdf here>.
%% Methology
% All of these functions are implemented using the complex-step
% approximation of the derivative (this is why each function is prefixed
% with an "i"; it is meant to indicate the imaginary unit). A complete
% <https://tamaskis.github.io/documentation/Numerical%20Differentiation%20Using%20the%20Complex-Step%20Approximation.pdf
% technical documentation> is available that details the implementation in
% depth.
%% Warnings/Disclaimers
% * There are some special cases of functions where the complex-step 
% approximation will not work directly; for example, trying to
% differentiate functions using MATLAB's |atan2| or |abs| would result in
% errors. We can "complexify" these functions to make them suitable for use
% with the complex-step approximation; in this toolbox, we have included
% |iatan2| and |iabs| in src/complexified. However, more complexified
% functions can be found (programmed in Fortran) at
% https://mdolab.engin.umich.edu/misc/files/complexify.f90.
% * Most differentiable functions can be used with the various functions of
% this toolbox. Functions that result in errors (likely due to
% complexification issues) are summarized in Section 1.3.3 of the <https://tamaskis.github.io/documentation/Numerical%20Differentiation%20Using%20the%20Complex-Step%20Approximation.pdf
% technical documentation>.
% * The functions in this toolbox cannot perform higher-order derivatives
% (this limitation is discussed in Section 1.3.1 of the
% <https://tamaskis.github.io/documentation/Numerical%20Differentiation%20Using%20the%20Complex-Step%20Approximation.pdf
% technical documentation>).
% * All of the functions are (generally) accurate to double precision *with the
% the exception of* <ihessian_doc.html |ihessian|>. An alternative that
% will perform better is the |hessian| function provided by the <https://www.mathworks.com/matlabcentral/fileexchange/13490-adaptive-robust-numerical-differentiation?s_tid=srchtitle
% Adaptive Robust Numerical Differentiation> toolbox.
% * No error estimates are provided.
%% Installation
% The toolbox can be downloaded from <https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox File Exchange> or 
% <https://github.com/tamaskis/Numerical_Differentiation_Toolbox-MATLAB GitHub>.
% The downloaded zip folder contains the following:
%
% * *docs* → Contains the HTML documentation. To open a copy of the HTML
% documentation locally on your computer, open docs/index.html.
% * *LICENSE* → Software license.
% * *Numerical Differentiation Toolbox.mltbx* → Toolbox installer.
% * *Numerical Differentiation Using the Complex-Step Approximation.pdf* → Technical documentation.
% * *README.md* → Markdown documentation for GitHub repository.
% * *src* → Contains the actual functions/software.
% * *test* → Contains scripts that perform unit tests on various functions.
%
% *To install as a toolbox*, simply open "Numerical Differentiation
% Toolbox.mltbx" and MATLAB will automatically perform the installation. 
% Afterwards, you will always have access to all functions of this toolbox.
% Alternatively, you can use individual functions by copying them from the
% "src" folder to whatever folder your other code is in.