function grid = CreateComplexGrid(n)

% This function produces a 2D square array which contains equally spaced
% points, and complex numbers at each point akin to an
% argand diagram bounded between the lines -2<=x<=2 & -2i<=y<=2i
%
% Input:  n:  represents how many rows and columns are in the complex grid
%
% Output: grid: a complex grid with equally spaced points akin to an argand
%               diagram of size nxn with a complex number at each point
% Author: Ahmad Barzak


% Establish a set of n points in the x and y direction within the bounds
% of the grid
x = linspace(-2,2,n);     % domain of x points from -2 to 2
y = linspace(2i,-2i,n);   % range of y points from -2i to 2i

% Use the meshgrid function to create two cartesian grids for the x and y
% values, then add them together to get an n by n grid of complex
% coordinates with equally spaced points
[X,Y] = meshgrid(x,y);
grid = X + Y;

end
