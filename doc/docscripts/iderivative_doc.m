%% |iderivative|
% Derivative of a univariate, scalar or vector-valued function using the complex-step approximation.
% 
% <Numerical_Differentiation_Toolbox_Contents_doc.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   df = iderivative(f,x)
%   df = iderivative(f,x,h)
%% Input/Output Parameters
% <html>
%   <table border=1>
%       <tr>
%           <td></td>
%           <td style="text-align:center"><b>Symbol</b></td>
%           <td style="text-align:center"><b>Variable</b></td>
%           <td style="text-align:center"><b>Description</b></td>
%           <td style="text-align:center"><b>Format</b></td>
%       </tr>
%       <tr>
%           <td rowspan="3" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f\text{ or }\mathbf{f}" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>univariate, scalar or vector-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;f:\mathbb{R}\rightarrow\mathbb{R}" title="" /> or <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}:\mathbb{R}\rightarrow\mathbb{R}^{m}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;x" title="" /></td>
%           <td><TT>x</TT></td>
%           <td>point at which to differentiate</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;h" title="" /></td>
%           <td><TT>h</TT></td>
%           <td>(OPTIONAL) step size</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td rowspan="1" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\dfrac{df}{dx}\text{ or }\dfrac{d\mathbf{f}}{dx}" title="" /></td>
%           <td><TT>df</TT></td>
%           <td>derivative of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}" title="" /> (or <img src="https://latex.codecogs.com/svg.latex?\inline&space;f" title="" /> for the univariate case) evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;x" title="" /></td>
%           <td style="text-align:center">m×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example
% _Approximate the derivative of $f(x)=x^{3}$ at $x=2$ using the
% |iderivative| function, and compare the result to the true result of
% $f'(2)=12$_.
%
% Approximating the derivative,
f = @(x) x^3;
df = iderivative(f,2)
%%
% Calculating the error,
error = df-12
%%
% The approximation is therefore accurate to double precision.
%% See also
% <igradient_doc.html |igradient|> | 
% <idirderivative_doc.html |idirderivative|> | 
% <ijacaobian_doc.html |ijacobian|> | 
% <ihessian_doc.html |ihessian|>