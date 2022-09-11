# Numerical Differentiation Toolbox [![View Numerical Differentiation Toolbox on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox)

This toolbox supplies functions and classes to evaluate derivatives, partial derivatives, gradients, directional derivatives, Jacobians, and Hessians using the forward difference, central difference, and complex-step approximations of a derivative.


## Documentation

[Toolbox Documentation](https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/)\
[Technical Documentation](https://tamaskis.github.io/files/Numerical_Differentiation.pdf)

To open the home page of the toolbox documentation in MATLAB, type

```
doc_NDT
```

in the Command Window. To open the documentation of a specific function with name `function_name` from the Command Window, type

```
doc_NDT function_name
```

To open the PDF file with the technical documentation (Numerical_Differentiation.pdf) from the Command Window, type

```
doc_NDT tech
```


## `Differentiator` Class

`D = Differentiator(method)`


## Central Difference Differentiation Functions

`df = cderivative(f,x0)`\
`pf = cpartial(f,x0,k)`\
`g = cgradient(f,x0)`\
`Dv = cdirectional(f,x0,v)`\
`J = cjacobian(f,x0)`\
`H = chessian(f,x0)`\
`H = cvechessian(f,x0)`


## Forward Difference Differentiation Functions

`df = fderivative(f,x0)`\
`pf = fpartial(f,x0,k)`\
`g = fgradient(f,x0)`\
`Dv = fdirectional(f,x0,v)`\
`J = fjacobian(f,x0)`\
`H = fhessian(f,x0)`\
`H = fvechessian(f,x0)`


## Complex-Step Differentiation Functions

`df = iderivative(f,x0)`\
`pf = ipartial(f,x0,k)`\
`g = igradient(f,x0)`\
`Dv = idirectional(f,x0,v)`\
`J = ijacobian(f,x0)`\
`H = ihessian(f,x0)`\
`H = ivechessian(f,x0)`


## "Complexified" Functions
`y = iabs(x)`\
`z = iatan2(y,x)`\
`z = iatan2d(y,x)`\
`z = idot(x,y)`\
`m = imax(x1,x2)`\
`m = imin(x1,x2)`\
`r = imod(a,n)`\
`y = inorm(x)`
