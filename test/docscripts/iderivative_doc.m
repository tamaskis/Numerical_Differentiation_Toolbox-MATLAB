%% |iderivative|
% Derivative of a univariate, scalar or vector-valued function using the complex-step approximation.
% 
% <index.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   df = iderivative(f,x0)
%   df = iderivative(f,x0,h)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}(x)" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>univariate, vector-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}:\mathbb{R}\rightarrow\mathbb{R}^{m}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;x_{0}" title="" /></td>
%           <td><TT>x0</TT></td>
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\dfrac{d\mathbf{f}}{dx}\bigg\rvert_{x=x_{0}}" title="" /></td>
%           <td><TT>df</TT></td>
%           <td>derivative of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}(x)" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;x=x_{0}" title="" /></td>
%           <td style="text-align:center">m×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%
% *NOTE:* This function also works for scalar-valued functions (in that
% case, we simply have $m=1$).
%% Example #1: Derivative of a scalar-valued function.
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
%% Example #2: Derivative of a vector-valued function.
% _Approximate the derivative of_
%
% $$\mathbf{f}(t)=\pmatrix{\sin{t}\cr\cos{t}}$$
%
% _at $t=1$ using the |iderivative| function, and compare the result to the
% true result of_
%
% $$\left.\frac{d\mathbf{f}}{dx}\right|_{t=1}=\pmatrix{\cos{(1)}\cr-\sin{(1)}}$$
%
% Approximating the derivative,
f = @(t) [sin(t);cos(t)];
df = iderivative(f,1)
%%
% Calculating the error,
error = df-[cos(1);-sin(1)]
%%
% The approximation is therefore accurate to double precision.
%% See also
% <ipartial_doc.html |ipartial|> | 
% <igradient_doc.html |igradient|> | 
% <idirectional_doc.html |idirectional|> | 
% <ijacaobian_doc.html |ijacobian|> | 
% <ihessian_doc.html |ihessian|>