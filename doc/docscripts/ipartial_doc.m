%% |ipartial|
% Partial derivative of a multivariate, scalar or vector-valued function using the complex-step approximation.
% 
% <index.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   pf = ipartial(f,x0,j)
%   pf = ipartial(f,x0,j,h)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}(\mathbf{x})" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>multivariate, vector-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}_{0}" title="" /></td>
%           <td><TT>x0</TT></td>
%           <td>point at which to differentiate</td>
%           <td style="text-align:center">n×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;j" title="" /></td>
%           <td><TT>j</TT></td>
%           <td>index of element of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /> to differentiate with respect to</td>
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\dfrac{\partial\mathbf{f}}{\partial x_{j}}\bigg\rvert_{\mathbf{x}=\mathbf{x}_{0}}" title="" /></td>
%           <td><TT>pf</TT></td>
%           <td>partial derivative of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{f}(\mathbf{x})" title="" /> with respect to <img src="https://latex.codecogs.com/svg.latex?\inline&space;x_{j}" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}=\mathbf{x}_{0}" title="" /></td>
%           <td style="text-align:center">m×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%
% *NOTE:* This function also works for scalar-valued functions (in that
% case, we simply have $m=1$).
%% Example #1: Partial derivative of a scalar-valued function.
% _Approximate the partial derivative of $f(x,y)=x^{3}\sin{y}$ with respect
% to $y$ at at $(x,y)=(5,1)$ using the |ipartial| function, and compare the
% result to the true result of_
%
% $$\left.\frac{\partial f}{\partial y}\right|_{(x,y)=(5,1)}=5^{3}\cos{(1)}$$
%
% First, we rewrite this function as $f(\mathbf{x})=x_{1}^{3}\sin{x_{2}}$.
f = @(x) x(1)^3*sin(x(2));
%%
% Since the second component of $\mathbf{x}$ represents $y$, to approximate
% the derivative, we use
j = 2;
%%
% Approximating the partial derivative using the |ipartial| function,
pf = ipartial(f,[5;1],j)
%%
% Calculating the error,
error = pf-5^3*cos(1)
%%
% The approximation is therefore accurate to double precision.
%% Example #2: Partial derivative of a vector-valued function.
% _Approximate the partial derivative of_
%
% $$\mathbf{f}(\mathbf{x})=\pmatrix{\sin{x_{1}}\sin{x_{2}}\cr\cos{x_{1}}\cos{x_{2}}}$$
%
% _with respect to $x_{1}$ at $\mathbf{x}=\mathbf{x}_{0}=(1,2)$ using the 
% |ipartial| function, and compare the result to the true result of_
%
% $$\left.\frac{\partial\mathbf{f}}{\partial x_{1}}\right|_{\mathbf{x}=
% \mathbf{x}_{0}}=\pmatrix{\cos{(1)}\sin{(2)}\cr-\sin{(1)}\cos{(2)}}$$
%
% Defining the function in MATLAB,
f = @(x) [sin(x(1))*sin(x(2));cos(x(1))*cos(x(2))];
%%
% Approximating the partial derivative using the |ipartial| function,
x0 = [1;2];             % point where we are differentiating
j = 1;                  % element of x to differentiate with respect to
pf = ipartial(f,x0,j)   % differentiation
%%
% Calculating the error,
error = pf-[cos(1)*sin(2);-sin(1)*cos(2)]
%%
% The approximation is therefore accurate to double precision.
%% See also
% <derivative_doc.html |ipartial|> | 
% <igradient_doc.html |igradient|> | 
% <idirectional_doc.html |idirectional|> | 
% <ijacaobian_doc.html |ijacobian|> | 
% <ihessian_doc.html |ihessian|>