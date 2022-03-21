function [colournames, values] = ReadColourValues(Filename)

% This function takes a text file of colour values mapped to colour values,
% reads it and returns a cell array of colour names and a 2d array of their
% corresponding colour values. The error message 
% 'Error opening file <filename>' is displayed in red if the text file can
% not be opened.
%
% Inputs: Filename: a string containing the filename of a text file which
%                   contains a list of colour names and their associated
%                   colour values. Every line will first have the colour
%                   name and then three colour values (percent values of
%                   red green and blue from 0 to 1), all seperated by
%                   spaces.
%
% Outputs:colournames: a cell array of colour names with each colour name
%                      being a string read from the text file, one colour
%                      in each row of the cell array.
%          values:     a 2D array of colour values with each row containing
%                      a set of three colour values read from the text
%                      file. The colour values in the 2d array and their
%                      associated colournames in the cell array should have
%                      the same row number. Column 1, 2 and 3 contain the
%                      percent values of red, green and blue respectively
%                      (from 0 to 1)
% Author: Ahmad Barzak


% Open the file
fid = fopen(Filename, 'r');

% Check if the file has opened correctly, if not display
% 'Error opening file <filename>' in red
if fid == -1
    fprintf(2, 'Error opening file %s\n',Filename);
    return
end

line = fgetl(fid);   %  get the first line in the file
colournames = {};    % establish an empty cell array to hold colournames
values = [];         % establish an empty array to hold values

% Set the integer i = 1 in order to have an incrementing integer for use in
% the following while loop
i = 1;

% Set a while loop with the condition that there are characters in the line
while ischar(line)
    
    % It can be difficult to process lines with both text and numerical
    % values, so the position of the space character that divides the two
    % parts is obtained for each line.
    % strfind creates an array of the space character positions in the line
    spacearray = strfind(line, ' ');
    firstspace = spacearray(1); % The first space position is obtained
    
    % the colour name is all the characters in the line right
    % before the first space
    string = line(1:(firstspace-1));
    
    % After every cycle in the while loop, the string on each line gets
    % added into the colournames cell array
    colournames{i} = string;
    
    i = i + 1; % after an addition in the cell array, integer increments
    
    % the portion of the line containing numerical values is all the
    % characters after the first space
    numberline = line(firstspace + 1:end);
    
    % the numerical values in a line are scanned for and turned into an
    % array, which is vertically appended in the values array.
    numberdata = sscanf(numberline, '%f %f %f');
    values = [values;numberdata'];
    
    % the next line in the file is obtained and the code repeats for each
    % line, filling the colournames cell array and the values 2D array,
    % until all lines in the file are read
    line = fgetl(fid);   
end

% note that the while loop generates a horizontal cell array of colour
% names, to get a vertical cell array, we transpose colournames
colournames = colournames';
fclose(fid);
end