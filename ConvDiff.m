%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  CONV-DIFF    %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function computes the convective and diffusive term t
% values at each grid poin and saves it into the diff matrix.
%
% -----------------  INPUT PARAMETERS  --------------------%
% u  =  Velocity in X [m/s]
% v  =  Velocity in Y [m/s]
% L  =  Domai Length
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% conv = convective term matrix
% diff = diffusive term matrix 
%
% ---------------  COMPUTE PARAMETERS  --------------------%
% d  =  CV face length
% N  =  Number of Mesh nodes
% u  =  Velocity in X [m/s]
%
% ----------------------  DATA STORED  ----------------------% 
%
% conv = stores convective term matrix [N+2][N+2]
% diff = stores diffusive term matrix [N+2][N+2]

function [conv,diff] = ConvDiff (u,v,L)
  
    N = size(v,1)-2;
    
    d = L/N;

    conv = zeros(N+2,N+2);
    diff=zeros(N+2,N+2);
    
    for i=2:N+1
        for j=2:N+1
            
            %CONVECTIVE TERM
            u_e = (u(i+1,j)+u(i,j))/2;
            F_e = d*u_e;
            conv_e = u_e*F_e;
            
            u_w = (u(i-1,j)+u(i,j))/2;
            F_w = d*u_w;
            conv_w = u_w*F_w;
            
            u_n = (u(i,j+1)+u(i,j))/2;
            F_n = (d/2)*(v(i,j)+v(i+1,j));
            conv_n = u_n*F_n;
            
            u_s = (u(i,j-1)+u(i,j))/2;
            F_s = (d/2)*(v(i,j-1)+v(i+1,j-1));
            conv_s = u_s*F_s;
            
            conv(i,j) = conv_e - conv_w + conv_n - conv_s;
            
            %DIFFUSIVE TERM 
            diff_e=u(i+1,j)-u(i,j);
            diff_w=u(i,j)-u(i-1,j);
            diff_n=u(i,j+1)-u(i,j);
            diff_s=u(i,j)-u(i,j-1);
            diff(i,j)= diff_e -diff_w +diff_n -diff_s;
            
        end
    end
    
    conv = halo_update (conv);
    diff=halo_update(diff);
    
end
