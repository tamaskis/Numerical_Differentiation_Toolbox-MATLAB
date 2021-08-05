%% |ijacobian|
% Jacobian matrix of a multivariate, vector-valued function using the complex-step approximation.
% 
% <Numerical_Differentiation_Toolbox_Contents_doc.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   J = ijacobian(f,x)
%   J = ijacobian(f,x,h)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>multivariate, vector-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /></td>
%           <td><TT>x</TT></td>
%           <td>point at which to evaluate the Jacobian matrix</td>
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{J}(\mathbf{x})=\dfrac{\partial\mathbf{f}}{\partial\mathbf{x}}" title="" /></td>
%           <td><TT>J</TT></td>
%           <td>Jacobian matrix of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /></td>
%           <td style="text-align:center">m×n<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example
% _Approximate the Jacobian matrix of_
%
% $$f(\mathbf{x})=\pmatrix{x_{1} \cr 5x_{3} \cr 4x_{2}^{2}-2x_{3} \cr x_{3}\sin{x_{1}}}$$
%
% _at_
%
% $$\mathbf{x}=\pmatrix{5\cr6\cr7}$$
%
% _using the |ijacobian| function, and compare the result to the true
% result of_
%
% $$\mathbf{J}\left(\pmatrix{5\cr6\cr7}\right)=\pmatrix{1 & 0 & 0 \cr 0 & 0 & 5 \cr 0 & 48 & -2 \cr 7\cos{(5)} & 0 & \sin{(5)}}$$
%
% Approximating the Jacobian,
f = @(x) [x(1);5*x(3);4*x(2)^2-2*x(3);x(3)*sin(x(1))];
x = [5;6;7];
J = ijacobian(f,x)
%%
% Calculating the error,
error = J-[1,0,0;0,0,5;0,48,-02;7*cos(5),0,sin(5)]
%%
% The approximation is essentially accurate to double precision.
%
% _*NOTE:* The function and its corresponding Jacobian are from an example
% on <https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant#Example_4 Wikipedia>._
%% See also
% <iderivative_doc.html |iderivative|> | 
% <igradient_doc.html |igradient|> | 
% <idirderivative_doc.html |idirderivative|> | 
% <ihessian_doc.html |ihessian|>