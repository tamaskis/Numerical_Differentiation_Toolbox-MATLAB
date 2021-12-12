# Numerical Differentiation Toolbox [![View Numerical Differentiation Toolbox on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox)

This toolbox supplies functions to evaluate derivatives, partial derivatives, gradients, directional derivatives, Jacobian matrices, and Hessian matrices using the complex-step approximation of a derivative.


## Documentation

[Toolbox Documentation](https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/)\
[Technical Documentation](https://tamaskis.github.io/documentation/Numerical_Differentiation_Using_the_Complex_Step_Approximation.pdf)


## Differentiation Functions

`df = iderivative(f,x0)`\
`pf = ipartial(f,x0,j)`\
`g = igradient(f,x0)`\
`Dv = idirectional(f,x0,v)`\
`J = ijacobian(f,x0)`\
`H = ihessian(f,x0)`


## "Complexified" Functions
`y = iabs(x)`\
`z = iatan2(y,x)`\
`z = iatan2d(y,x)`