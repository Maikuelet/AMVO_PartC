%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  AnalyticField  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function calculates the analytic solution of the velocity 
% and pressure field for all domain at a given time instant
%
% -----------------  INPUT PARAMETERS  --------------------%
% N   =  Number of Mesh nodes
% L   =  Domain length
% t   =  Time instant
% nu  =  Cinematic viscosity
% rho =  Density
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% u  = X-Velocity field
% v  = Y-Velocity field
% p  = Pressure field
%
% ---------------  COMPUTE PARAMETERS  --------------------%
% d  =  CV face length
% x  =  x position array
% y  =  y position array
% F  =  Time depended factor
%


function [ u , v , p ] = AnalyticField ( N , L , t , nu , rho )

    d = L/N;  
    u = zeros(N+2, N+2);
    
    % ---------- u field ------------------------
    
    x = Mesh (0 , L+d , d);
    y = Mesh (-d/2, L+d/2, d); 
    
    F=exp(-8*pi^2*nu*t);
    
    for i=2:1:N+1
        for j=2:1:N+1
            u(i,j)=cos(2*pi*x(i))*sin(2*pi*y(j))*F;
        end
    end
    
    u=halo_update(u);
    
    
    % ---------- v field ------------------------
    
    v = zeros(N+2,N+2);
    
    x = Mesh (-d/2 , L+d/2 , d);
    y = Mesh (0, L+d, d);    
    
   for i=2:1:N+1
        for j=2:1:N+1
            v(i,j) = -sin(2*pi*x(i))*cos(2*pi*y(j))*F;
        end
    end
    
    v = halo_update(v);
    
    % ---------- p field ------------------------
    
    p = zeros(N+2,N+2);
    
    x = Mesh (-d/2 , L+d/2 , d);
    y = Mesh (-d/2 , L+d/2 , d);   
    
    for i=2:1:N+1
        for j=2:1:N+1
            p(i,j) = -F^2 * rho/2 * ( (cos(2*pi*x(i)))^2 + (cos(2*pi*y(j)))^2 );
        end
    end
    
    p = halo_update(p);
    
end
    
    
   