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
%% Methology
% All of these functions are implemented using the complex-step
% approximation of the derivative (this is why each function is prefixed
% with an "i"; it is meant to indicate the imaginary unit). A complete
% written documentation is available that details the implementation in
% depth.