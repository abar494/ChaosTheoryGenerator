function points = JuliaSetPoints(grid, c, maxit)

% This function determines the nature of each point in a complex number
% grid using the IterateComplexQuadratic function (which calculates the
% number of iterations a z value yeilds from the complex quadratic process
% in respect to the specific c value used), returning a grid of each
% complex grid points' number of iterations or 0 if a point is deemed
% a member of the Julia set
%
% Inputs: grid:  a 2D array of complex numbers
%         c:     a specific complex number which represents and is
%                used to create its own Julia set.
%         maxit: The maximum number of iterations performed before
%                     deeming a z value to be part of our Julia Set
%
% Output: points: a 2d array of numbers, where the number at each point is
%                 the iteration number generated for that particular
%                 complex number (0 if deemed a member of the set)
% Author: Ahmad Barzak


% First establish an empty grid called points which will eventually
% hold the iteration number for each complex number, the same
% size as the grid of complex values
[rows, columns] = size(grid);
points = zeros(rows, columns);

% A nested for loop is used to examine each complex number in the grid, and
% subsequently modify each element of the points array to hold
% the iteration numbers.
for i = 1:rows
    for j = 1:columns
        
        % The function IterateComplexQuadratic is used to calculate the
        % iteration number of complex numbers in the grid and the iteration
        %  number is stored as the new element in the points 2D array
        points(i,j) = IterateComplexQuadratic(grid(i,j),c,maxit);
        
    end
end
end
