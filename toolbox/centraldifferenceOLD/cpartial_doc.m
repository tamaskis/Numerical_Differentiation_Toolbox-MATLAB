%% |fpartial|
% Partial derivative of a multivariate, scalar-valued function using the central difference approximation.
% 
% <index.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   pf = fpartial(f,x0,k)
%   pf = fpartial(f,x0,k,h)
%% Description
% |pf = fpartial(f,x0,k)| numerically evaluates the partial derivative of
% $f(\mathbf{x})$ with respect to $x_{k}$ at 
% $\mathbf{x}=\mathbf{x}_{0}$ using the central difference approximation
% with a default relative step size of $h=\varepsilon^{1/3}$, where 
% $\varepsilon$ is the machine zero.
%
% |pf = fpartial(f,x0,k,h)| numerically evaluates the partial derivative of
% $f(\mathbf{x})$ with respect to $x_{k}$ at 
% $\mathbf{x}=\mathbf{x}_{0}$ using the central difference approximation
% with a user-specified relative step size $h$.
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
%           <td rowspan="4" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><TT>f</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f(\mathbf{x})" title="" /></td>
%           <td>multivariate, scalar-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;f:\mathbb{R}^{n}\rightarrow\mathbb{R}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><TT>x0</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}_{0}" title="" /></td>
%           <td>point at which to differentiate</td>
%           <td style="text-align:center">n×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><TT>k</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;k" title="" /></td>
%           <td>index of element of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /> to differentiate with respect to</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><TT>h</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;h" title="" /></td>
%           <td>(OPTIONAL) relative step size</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td rowspan="1" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><TT>pf</TT></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\dfrac{\partial f}{\partial x_{k}}\bigg\rvert_{\mathbf{x}=\mathbf{x}_{0}}" title="" /></td>
%           <td>partial derivative of <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(\mathbf{x})" title="" /> with respect to <img src="https://latex.codecogs.com/svg.latex?\inline&space;x_{k}" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}=\mathbf{x}_{0}" title="" /></td>
%           <td style="text-align:center">m×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example
% _Approximate the partial derivative of $f(x,y)=x^{3}\sin{y}$ with respect
% to $y$ at at $(x,y)=(5,1)$ using the |fpartial| function, and compare the
% result to the true result of_
%
% $$\left.\frac{\partial f}{\partial y}\right|_{(x,y)=(5,1)}=5^{3}\cos{(1)}$$
%
% First, we rewrite this function as $f(\mathbf{x})=x_{1}^{3}\sin{x_{2}}$.
f = @(x) x(1)^3*sin(x(2));
%%
% Since the second component of $\mathbf{x}$ represents $y$, to approximate
% the derivative, we use
k = 2;
%%
% Approximating the partial derivative using the |fpartial| function,
pf = fpartial(f,[5;1],k)
%%
% Calculating the error,
error = pf-5^3*cos(1)
%% See also
% <cderivative_doc.html |cderivative|> | 
% <cgradient_doc.html |cgradient|> | 
% <cdirectional_doc.html |cdirectional|> | 
% <cjacobian_doc.html |cjacobian|> | 
% <chessian_doc.html |chessian|>