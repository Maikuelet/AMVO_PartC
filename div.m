%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%    DIVERGENCE     %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% Calculate the divergence of a velocity field [u,v]
%
% -----------------  INPUT PARAMETERS  --------------------%
% u = Velocty X direction [m/s]
% v = Velocty Y direction [m/s]
% L  =  Domai Length [m]
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% divergence = Velocity divergence value 
%
% ---------------  COMPUTE PARAMETERS  --------------------%
% d  =  CV face length
% N  =  Number of Mesh nodes
%
%
% ----------------------  DATA STORED  ----------------------% 
% divergene = Saves Divergence values in a [N+2] vector


function [divergence]=div(u,v,L)

    N=size(u,1)-2;
    d=L/N;
    
    divergence=zeros(N+2);
    
    for i=2:N+1
        for j=2:N+1
            divergence(i,j)=(u(i,j)-u(i-1,j))/d + (v(i,j)-v(i,j-1))/d;
        end
    end
    
    divergence=halo_update(divergence);
    
end