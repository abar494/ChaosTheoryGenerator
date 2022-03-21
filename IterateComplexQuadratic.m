function NumIterations = IterateComplexQuadratic(z, c, maxit)

% This function passes in a specified value complex numbers z and c into
% the complex quadratic f(z) = z^2 + c then passes the output back into the
% function as the new z value in a repeated process, returning the number
% of iterations z has undergone before the magnitude of the output >= 3 or
% returning 0 instead if the z undergoes the maximum number of iterations
% and the magnitude is still < 3, making that z value a member of the Julia
% set for that particular c.
%
% Inputs:   z:        the complex value we wish to determine the nature of
%                     by repeatedly passing into the complex quadratic
%           c:        a specific complex number which represents and is
%                     used to create its own Julia set.
%           maxit:    The maximum number of iterations performed before
%                     deeming a z value to be part of our Julia Set
%
% Output:   NumIterations: The number of iterations a z value yields from
%                          the complex quadratic process in respect to
%                          the specific c value used
% Author: Ahmad Barzak


% Set a starting value for the number of iterations (in this case we'll
% have it at 0) and activate the while loop with the boolean value
% MaybeInSet
NumIterations = 0;
MaybeInSet = 1;


while MaybeInSet
    
    % Feed the original z value into the function f(z) = z^2 + c
    zoutput = z^2 + c;
    
    % Obtain the magnitude of the output (The absolute value function is
    % used to give the magnitude of a complex number)
    zoutputmag = abs(zoutput);
    
    % the iteration number increments after every time after every time
    % z is successfully fed into the function.
    NumIterations = NumIterations + 1;
    
    % The output becomes the new z value to be fed back into
    % the function as long as the output magnitude is less than 3, and the
    % iteration number hasn't passed the maximum.
    z = zoutput;
    
    % If the z value undergoes more iterations
    % than the maximum iteration number chosen, then we deem it to be
    % a member of the Julia Set and thus deactivate the while loop and
    % set the iteration number to 0 to indicate this
    if NumIterations > maxit
        NumIterations = 0;
        MaybeInSet = 0;
        
        % if the z output's magnitude becomes greater
        % than 3, then the while loop is deactived and
        % the number of iterations that occured are stored
    elseif zoutputmag >= 3
        MaybeInSet = 0;
    end
end
end