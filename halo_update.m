%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  HALO UPDATE  %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function updates the halo values of our case of study. 
%
% -----------------  INPUT PARAMETERS  --------------------%
% f  =  Parameter to update
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% F  =  Updated Parameter


function [F] = halo_update(F)

    N = size(F, 1) - 2;
    F(1, :) = F(N+1, :);
    F(N+2, :) = F(2,:);
    F(:, 1) = F(:, N+1);
    F(:, N+2) = F(:, 2);
    
end
