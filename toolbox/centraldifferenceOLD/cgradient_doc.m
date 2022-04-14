%% |cgradient|
% Gradient of a multivariate, scalar-valued function using the central 
% difference approximation.
% 
% <index.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   g = cgradient(f,x0)
%   g = cgradient(f,x0,h)
%% Description
% |g = cgradient(f,x0)| numerically evaluates the gradient of 
% $f(\mathbf{x})$ at $\mathbf{x}=\mathbf{x}_{0}$ using the central 
% difference approximation with a default relative step size of 
% $h=\varepsilon^{1/3}$, where $\varepsilon$ is the machine zero.
%
% |g = cgradient(f,x0,h)| numerically evaluates the gradient of 
% $f(\mathbf{x})$ at $\mathbf{x}=\mathbf{x}_{0}$ using the central 
% difference approximation with a user-specified relative step size $h$.
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f(\mathbf{x})" title="" /></td>
%           <td>multivariate, scalar-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;f:\mathbb{R}^{n}\rightarrow\mathbb{R}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><TT>x0</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}_{0}" title="" /></td>
%           <td>point at which to evaluate the gradient</td>
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
%           <td style="text-align:center"><TT>g</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{g}(\mathbf{x}_{0})=\nabla f(\mathbf{x}_{0})=\dfrac{\partial f}{\partial\mathbf{x}}\bigg\vert_{\mathbf{x}=\mathbf{x}_{0}}" title="" /></td>
%           <td>gradient of <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(\mathbf{x})" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}=\mathbf{x}_{0}" title="" /></td>
%           <td style="text-align:center">n×n<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example
% _Approximate the gradient of $f(\mathbf{x})=x_{1}^{5}+\sin^{3}{x_{2}}$ at
% $\mathbf{x}=\mathbf{x}_{0}=(5,8)^{T}$ using the |cgradient| function, and
% compare the result to the true result of_
%
% $$\nabla f(\mathbf{x}_{0})=\pmatrix{3125\cr3\sin^{2}{(8)}\cos{(8)}}$$
%
% Approximating the gradient,
f = @(x) x(1)^5+sin(x(2))^3;
x0 = [5;8];
g = cgradient(f,x0)
%%
% Calculating the error,
error = g-[3125;3*sin(8)^2*cos(8)]
%% See also
% <cderivative_doc.html |cderivative|> | 
% <fpartial_doc.html |fpartial|> | 
% <cdirectional_doc.html |cdirectional|> | 
% <cjacobian_doc.html |cjacobian|> | 
% <chessian_doc.html |chessian|>