%% |idirderivative|
% Directional derivative of a multivariate, scalar-valued function using the complex-step approximation.
% 
% <Numerical_Differentiation_Toolbox_Contents_doc.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   Dv = idirderivative(f,x,v)
%   Dv = idirderivative(f,x,v,h)
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
%           <td rowspan="4" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>multivariate, scalar-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;f:\mathbb{R}^{m}\rightarrow\mathbb{R}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /></td>
%           <td><TT>x</TT></td>
%           <td>point at which to evaluate the directional derivative</td>
%           <td style="text-align:center">n×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{v}" title="" /></td>
%           <td><TT>v</TT></td>
%           <td>vector defining direction of differentiation</td>
%           <td style="text-align:center">n×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;h" title="" /></td>
%           <td><TT>h</TT></td>
%           <td>(OPTIONAL) step size</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td rowspan="1" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;D_{\mathbf{v}}" title="" /></td>
%           <td><TT>Dv</TT></td>
%           <td>directional derivative of <img src="https://latex.codecogs.com/svg.latex?\inline&space;f" title="" /> 
%               evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /> 
%               in the direction of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{v}" title="" /></td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example
% _Approximate the directional derivative of_
%
% $$f(\mathbf{x})=x_{1}^{5}+\sin^{3}{x_{2}}$$
%
% _at_
%
% $$\mathbf{x}=\pmatrix{5\cr8}$$
%
% _in the direction of_
%
% $$\mathbf{v}=\pmatrix{10\cr20}$$
%
% _using the |idirderivative| function, and compare the result to the true 
% result of_
%
% $$D_{\mathbf{v}}f=31250+60\sin^{2}{(8)}\cos{(8)}$$
%
% Approximating the directional derivative,
f = @(x) x(1)^5+sin(x(2))^3;
x = [5;8];
v = [10;20];
Dv = idirderivative(f,x,v)
%%
% Calculating the error,
error = Dv-(31250+60*sin(8)^2*cos(8))
%%
% The approximation is therefore accurate to double precision.
%% See also
% <iderivative_doc.html |iderivative|> | 
% <igradient_doc.html |igradient|> | 
% <ijacobian_doc.html |ijacobian|> | 
% <ihessian_doc.html |ihessian|>