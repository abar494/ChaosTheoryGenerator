function [colourvalues] = LookupColourValues(colour, colournames, values)

% This searches for and returns the colour values for a given colour, from
% cell array of colour names and a 2D array of their associated colour
% values, case insensitive. The error message 'Colour not found' is
% displayed in red along with a colour value of [0 0 0] if the colour is
% not found in the cell array.
%
% Inputs: colour:      a string which contains a colour name to search for
%         colournames: a cell array of colour names with each colour name
%                      being a string (one string per element)
%         values:     a 2D array of colour values with each row containing
%                      a set of three colour values read from the text
%                      file. The colour values in the 2d array and their
%                      associated colournames in the cell array should have
%                      the same row number. Column 1, 2 and 3 contain the
%                      percent values of red, green and blue respectively
%                      (from 0 to 1)
%
% Output: colourvalues: a row from the the colour values list that
%                       corresponds to the colour being searched. Columns
%                       1, 2 and 3 are the percent values of red, green
%                       and blue respectively (0 to 1).
% Author: Ahmad Barzak


% obtain the number of colours in the colournames array, this is the
% maximum number of rows in the colournames and the values array
maxrow = length(colournames);

% set initial conditions for use in the while loop
row = 1;
notfound = 1;

while notfound
    
    % check the row to see whether the colour you want to look up is the
    % same as the one in the current row of the colournames array
    %(case insensitive)
    isitfound = strcmpi(colournames{row},colour);
    
    % if there is no match with the current row, the row number increments
    % and the process is repeated again until the row is larger than the
    % maximum row
    if isitfound == 0
        row = row +1;
        
        % as we can not search a row that is larger than the number of
        % colours in the cell array, an error message is printed, the while
        % loop is deactivated and the values [0 0 0] is returned.
        if row > maxrow
            fprintf(2, ' Colour not found ');
            notfound = 0;
            colourvalues = [0 0 0];
        end
        
        % if there is a match with the current row, then the while loop is
        % deactivated and particular row of the values 2D array is returned
    else
        notfound = 0;
        colourvalues = values(row, 1:3);
    end
end
end