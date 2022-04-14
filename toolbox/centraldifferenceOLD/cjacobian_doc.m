%% |cjacobian|
% Jacobian matrix of a multivariate, vector-valued function using the central difference approximation.
% 
% <index.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   J = cjacobian(f,x0)
%   J = cjacobian(f,x0,h)
%% Description
% |J = cjacobian(f,x0)| numerically evaluates the Jacobian matrix of
% $\mathbf{f}(\mathbf{x})$ at $\mathbf{x}=\mathbf{x}_{0}$ using the 
% central difference approximation with a default relative step size of 
% $h=\varepsilon^{1/3}$, where $\varepsilon$ is the machine zero.
%
% |J = cjacobian(f,x0,h)| numerically evaluates the Jacobian matrix of 
% $\mathbf{f}(\mathbf{x})$ at $\mathbf{x}=\mathbf{x}_{0}$ using the 
% central difference approximation with a user-specified relative step size 
% $h$.
%% Input/Output Parameters
% <html>
%   <table border=1>
%       <tr>
%           <td></td>
%           <td style="text-align:center"><b>Variable</b></td>
%           <td style="text-align:center"><b>Symbol</b></td>
%           <td style="text-align:center"><b>Description</b></td>
%           <td style="text-align:center"><b>Format</b></td>
%       </tr>
%       <tr>
%           <td rowspan="3" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><TT>f</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}(\mathbf{x})" title="" /></td>
%           <td>multivariate, vector-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><TT>x0</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}_{0}" title="" /></td>
%           <td>point at which to evaluate the Jacobian matrix</td>
%           <td style="text-align:center">n×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><TT>h</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;h" title="" /></td>
%           <td>(OPTIONAL) relative step size</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td rowspan="1" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><TT>J</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{J}(\mathbf{x}_{0})=\dfrac{\partial\mathbf{f}}{\partial\mathbf{x}}\bigg\rvert_{\mathbf{x}=\mathbf{x}_{0}}" title="" /></td>
%           <td>Jacobian matrix of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}(\mathbf{x})" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}=\mathbf{x}_{0}" title="" /></td>
%           <td style="text-align:center">m×n<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example
% _Approximate the Jacobian matrix of_
%
% $$f(\mathbf{x})=\pmatrix{x_{1} \cr 5x_{3} \cr 4x_{2}^{2}-2x_{3} \cr x_{3}\sin{x_{1}}}$$
%
% _at $\mathbf{x}=\mathbf{x}_{0}=(5,6,7)^{T}$ using the |cjacobian| 
% function, and compare the result to the true result of_
%
% $$\mathbf{J}(\mathbf{x}_{0})=\pmatrix{1 & 0 & 0 \cr 0 & 0 & 5 \cr 0 & 48 
% & -2 \cr 7\cos{(5)} & 0 & \sin{(5)}}$$
%
% Approximating the Jacobian,
f = @(x) [x(1);5*x(3);4*x(2)^2-2*x(3);x(3)*sin(x(1))];
x0 = [5;6;7];
J = cjacobian(f,x0)
%%
% Calculating the error,
error = J-[1,0,0;0,0,5;0,48,-02;7*cos(5),0,sin(5)]
%%
% _*NOTE:* The function and its corresponding Jacobian are from an example
% on <https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant#Example_4 Wikipedia>._
%% See also
% <cderivative_doc.html |cderivative|> | 
% <fpartial_doc.html |fpartial|> | 
% <cgradient_doc.html |cgradient|> | 
% <cdirectional_doc.html |cdirectional|> | 
% <chessian_doc.html |chessian|>