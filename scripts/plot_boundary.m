## Copyright (C) 2021 luiza
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} plot_boundary (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luiza <luiza@DESKTOP-577RTVM>
## Created: 2021-04-02

function plot_boundary (X, net)
  
  weights = weightsPack(net); 
  x1plot = linspace(min(X(:,1)), max(X(:,1)), 100)';
  x2plot = linspace(min(X(:,2)), max(X(:,2)), 100)';
  [X1, X2] = meshgrid(x1plot, x2plot);
  vals = zeros(size(X1));
  
  for i = 1:size(X1, 2)
     this_X = [X1(:, i), X2(:, i)];
     [maxim, vals(:, i)] = max(nnFeedForward(weights, this_X,net.nin,net.nlayer,net.nhidden,net.nout){net.nlayer+1,1},[],2);
  end

  % Plot the SVM boundary
  hold on
  contour(X1, X2, vals,'b');
  hold off;

endfunction
