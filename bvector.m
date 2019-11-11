%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%    B VECTOR    %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function creates the b vector using the discretized 
% equation corresponding values.
%
% -----------------  INPUT PARAMETERS  --------------------%
% u_p = Predictor Velocty X direction [m/s]
% v_p = Predictor Velocty Y direction [m/s]
% L   =  Domain Length 
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% b = Independent term in A*pp = b system in array format [N^2]
%

% ---------------  COMPUTE PARAMETERS  --------------------%
% B = Independent term in matrix field format [N][N]



function [b] = bvector(u_p,v_p,L)
    
    N=size(u_p,1)-2;

    B = zeros (N+2,N+2);
    b = zeros (N^2,1);
    d = L/N;
    
    % Compute independent term for each CV in matrix format
    
    for i=2:N+1
        for j=2:N+1
            B(i,j) = (u_p (i,j) - u_p(i-1,j) + v_p(i,j) - v_p(i,j-1))*d;
        end
    end
    
    % Transform independent term B in a array format b
    
    for j=2:N+1
       for i=2:N+1
       b((i-1)+(j-2)*(N)) = B(i,j);
       end
    end
   
end
