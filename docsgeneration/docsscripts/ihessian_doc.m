%% |ihessian|
% Hessian matrix of a multivariate, scalar-valued function using the complex-step approximation.
% 
% <index.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   H = ihessian(f,x0)
%   H = ihessian(f,x0,h)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f(\mathbf{x})" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>multivariate, scalar-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;f:\mathbb{R}^{n}\rightarrow\mathbb{R}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}_{0}" title="" /></td>
%           <td><TT>x0</TT></td>
%           <td>point at which to evaluate the Hessian matrix</td>
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{H}(\mathbf{x}_{0})" title="" /></td>
%           <td><TT>H</TT></td>
%           <td>Hessian matrix of <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(\mathbf{x}_{0})" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}=\mathbf{x}_{0}" title="" /></td>
%           <td style="text-align:center">n×n<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example
% _Approximate the Hessian matrix of $f(\mathbf{x})=x_{1}^{5}x_{2}+x_{1}\sin^{3}{x_{2}}$
% at $\mathbf{x}=\mathbf{x}_{0}=(5,8)^{T}$ using the |ihessian| function, 
% and compare the result to the true result of_
%
% $$\mathbf{H}(\mathbf{x}_{0})=\left.\pmatrix{20x_{1}^{3}x_{2} & 5x_{1}^{4}
% +3\sin^{2}{x_{2}}\cos{x_{2}} \cr 5x_{1}^{4}+3\sin^{2}{x_{2}}\cos{x_{2}} &
% 6x_{1}\sin{x_{2}}\cos^{2}{x_{2}}-3x_{1}\sin^{3}{x_{2}}}\right|_{(x_{1},
% x_{2})=(5,8)}=\pmatrix{20(5)^{3}(8) & 5(5)^{4}+3\sin^{2}{(8)}\cos{(8)} 
% \cr 5(5)^{4}+3\sin^{2}{(8)}\cos{(8)} & 6(5)\sin{(8)}\cos^{2}{(8)}
% -3(5)\sin^{3}{(8)}}$$
%
% Approximating the Hessian matrix,
f = @(x) x(1)^5*x(2)+x(1)*sin(x(2))^3;
x0 = [5;8];
H = ihessian(f,x0)
%%
% Calculating the error,
error = H-[20*5^3*8,5*5^4+3*sin(8)^2*cos(8);5*5^4+3*sin(8)^2*cos(8),...
    6*5*sin(8)*cos(8)^2-3*5*sin(8)^3]
%% See also
% <iderivative_doc.html |iderivative|> | 
% <ipartial_doc.html |ipartial|> | 
% <igradient_doc.html |igradient|> | 
% <idirectional_doc.html |idirectional|> | 
% <ijacobian_doc.html |ijacobian|>