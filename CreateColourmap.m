function [colourmap] = CreateColourmap( StartColours , EndColours , n)

% This function generates a custom colour map represented as a 2D array
% with n rows (shades of colour) and 3 columns (percentage of red, green
% and blue), ranging from a starting colour to an ending colour
%
% Inputs: StartColours: a 1x3 colour array giving starting percentage
%                      values of red, green and blue in the map (0 to 1)
%
%         EndColours:   a 1x3 colour array giving ending percentage values
%                      of red green and blue in the colourmap (from 0 to 1)
%
%         n:            the number of rows in the colour map
%
% Output: colourmap:    a colourmap of size nx3, each row representing a
%                       shade of colour. the columns have numbers equally
%                       spaced from their starting red, green and blue
%                       percent values to their respective ending percent
%                       values (column 1 is red, 2 is green and 3 is blue)
% Author: Ahmad Barzak


% An empty 2D array is generated which will be filled in using a for loop
colourmap = zeros(n, 3);

% a for loop is used to fill the 2D array column by column, with each
% column being the transposed array of equally spaced points from the start
% colour value to the end colour value.
for i = 1:3
    colourmap(:,i) = (linspace(StartColours(i),EndColours(i),n))';
end
end