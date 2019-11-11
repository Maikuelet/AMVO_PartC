%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  GRADIENT FUNCTION  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function calculate de dradient of a field pp in a 
% presure centered mesh.
%
% -----------------  INPUT PARAMETERS  --------------------%
% N  =  Number of Mesh nodes
% L  =  Domai Length 
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% grad_ppx  = dpp/dx Pressure Gradient in X
% grad_ppy  = dpp/dy Pressure Gradient in Y
%
% ---------------  COMPUTE PARAMETERS  --------------------%
% d  =  CV face length
% L  =  Domai Length 
%
% ----------------------  DATA STORED  ----------------------% 
%
% grad_ppx  = Saves  X Gradient in a [N+2] vector
% grad_ppy  = Saves  Y Gradient in a [N+2] vector


function [grad_ppx,grad_ppy]=grad(pp,L)

    N=size(pp,1)-2;
    d=L/N;
    
    grad_ppx=zeros(N+2);
    grad_ppy=zeros(N+2);
    
    for i=2:N+1
        for j=2:N+1
            grad_ppx(i,j)=(pp(i+1,j)-pp(i,j))/d;
            grad_ppy(i,j)=(pp(i,j+1)-pp(i,j))/d;
        end
    end
    
    grad_ppx=halo_update(grad_ppx);
    grad_ppy=halo_update(grad_ppy);

end