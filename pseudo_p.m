%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  PSEUDO PRESSURE  %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function computes Pseudo-Pressure
%
% -----------------  INPUT PARAMETERS  --------------------%
% u_p = Velocty X direction [m/s]
% v_p = Velocty Y direction [m/s]
% L  =  Domai Length [m]
% -----------------  OUTPUT PARAMETERS  -------------------%
% max_error_conv  = Convective error 
% max_error_diff  = Diffusive error 
%
% ---------------  COMPUTE PARAMETERS  --------------------%
% d  =  CV face length
%
% ----------------------  DATA STORED  ----------------------% 
% A = Coefficient Matrix



function [pp] = pseudo_p(u_p,v_p,L)
    
    N=size(u_p,1)-2;    % Number of nodes in a array
    d=L/N;              % Volume length
    
    % Coeficient matrix. A*pp_vect is the volume integral of the laplacian of 
    % pseudo preassure   
    A = Amatrix(N);   
    
    % b is the volume integral of the divergence of de predictive velocity
    b = bvector(u_p,v_p,L);

    % Solve the equations system A*pp_vect=b
    pp_vect=A\b;
    
    %Transmform the 1D pp_vect to the 2D pp field form
    pp=zeros(N+2);

    for k=1:N^2
        j = 1+fix((k-1)/N)+1;
        i = 1+k-(j-2)*N;
        pp(i,j) = pp_vect(k);
    end

    pp=halo_update(pp);

end


