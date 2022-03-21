function [juliaimage] = ColourJulia(points, colourmap)

% This function takes a grid representing the nature of complex numbers,
% and colours the points deemed a member of a Julia Set black and other
% points to be coloured the particular row from a selected colour map
% that correlates with the point's iteration number.
%
% Inputs:  points:   a 2d array of numbers, where the number at each point
%                    is the iteration number generated for that particular
%                    complex number (0 if deemed a member of the set)
%       colourmap:   a colourmap of size nx3, each row representing a
%                    shade of colour. the columns have numbers equally
%                    spaced from their starting red, green and blue
%                    percent values to their respective ending percent
%                    values (column 1 is red, 2 is green and 3 is blue)
%
% Output: juliaimage: a 3D array which represents an RGB image of the julia
%                     set. Points that are members of the julia set are
%                     black whereas points that aren't are coloured based
%                     on the nature of each point which corresponds to the
%                     row number of the colour map
% Author: Ahmad Barzak


% dimensions of the points grid are obtained and used to create an empty
% 3D unsigned 8 bit integer array to then fill values in using for loops
[rows, cols] = size(points);
juliaimage = zeros(rows,cols,3, 'uint8');

% A triple nested for loop is used to modify every element of the 3D array
for i = 1:rows
    for j = 1:cols
        for k = 1:3
            
            % Points are coloured based on the number of iterations each
            % specific points generates, which corresponds to the row of
            % the colour map and that colours each point accordingly
            if points(i,j) > 0
                
                % multiply percentage of a colour by the max uint8 value
                % 255 to get the colour value
                juliaimage(i,j,k) = colourmap((points(i,j)),k)*255;
                
            end
        end
    end
end
end