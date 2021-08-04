%% |iderivative|
% Derivative of a univariate function using the complex-step approximation.
% 
% <Numerical_Differentiation_Toolbox_Contents.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   df = iderivative(f,x)
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
%           <td rowspan="2" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>univariate function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;f:\mathbb{R}\rightarrow\mathbb{R}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;x" title="" /></td>
%           <td><TT>x</TT></td>
%           <td>point at which to differentiate</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td rowspan="1" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f'(x)" title="" /></td>
%           <td><TT>df</TT></td>
%           <td>derivative of <img src="https://latex.codecogs.com/svg.latex?\inline&space;f" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;x" title="" /></td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example #1
% _Evaluate the derivative of $f(x)=x^{3}$ at $x=2$._
f = @(x) x^3;
df = iderivative(f,2)
%% Example #2
% _Evaluate the derivative $f(x)=\cos{x}$ at $x=0$._
f = @(x) cos(x);
df = iderivative(f,0)
%% See also
% <igradient_doc.html |igradient|> | 
% <ijacobian_doc.html |ijacobian|> | 
% <ihessian_doc.html |ihessian|>