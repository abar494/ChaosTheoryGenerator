function [ImageArray] = GenerateJuliaSets(cvalues, n, colourmap)

% This function takes a sequence of complex values and produces a cell
% array of their respective Julia Set images.
%
% Inputs: cvalues: a 1D array of complex values where each value is
%                  used to create it's own particular Julia Set image
%         n:      represents how many rows and columns are in the grid used
%
%        colourmap:  a colourmap of size nx3, each row representing a
%                    shade of colour. the columns have numbers equally
%                    spaced from their starting red, green and blue
%                    percent values to their respective ending percent
%                    values (column 1 is red, 2 is green and 3 is blue)
%
% Output: ImageArray: A cell array with each element containing a RGB
%                     image of a Julia Set (represented by an nxnx3 3D
%                     array) generated by their particular complex
%                     number in the cvalue array and then coloured
%                     based on the colourmap
% Author: Ahmad Barzak


% Dimensions of the complex value array and the colourmap are obtained,
% with the rows also being the maximum cutoff value that is used in
% determining the nature of each point of a complex grid
lengthofcs = length(cvalues);
[rows,~] = size(colourmap);

% An empty cell array is created, to soon be filled with RGB images of
% julia sets by the following for loop.
ImageArray = {};

for i = 1:lengthofcs
    
    % for each complex value in the cvalue array, a grid of complex points
    % size nxn is generated using CreateComplexGrid
    grid = CreateComplexGrid(n);
    
    % the number of iterations of the Julia Set process that each complex
    % number in the grid undergoes with respect to the specific complex
    % value is assigned to their respective points using JuliaSetPoints
    points = JuliaSetPoints(grid,cvalues(i),rows);
    
    % these points are coloured accordingly with reference to the colourmap
    % using ColourJulia, generating a 3D nxnx3 RGB image of the Julia Set
    % for the specific complex value
    Juliaimage = ColourJulia(points,colourmap);
    
    % These generated images are one by one added as elements to the
    % cell array called ImageArray until all the cvalues are finished.
    ImageArray{i} = Juliaimage;
end
end