%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%   InstantSolveINS     %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function calculates vecocity and pressure fields at  
% following (n+1) time instant from current (n) and previous (n-1)
% time instant fields. 
%
% The numerical solution is computed with a EXPLICIT scheme,
% but a IMPLICIT scheme can be also used 
%
% Notation
% *_1 -> *_n-1 (previous time step)
% *_2 -> *_n   (current time step)
% *_3 -> *_n+1 (following time step)
%
% -----------------  INPUT PARAMETERS  --------------------%
% {u_1,v_1} = Velocity field at previous (n-1) instant
% {u_2,v_2} = Velocity field at current (n) instant
% L   =  Domain Length 
% At  =  Time increment
% nu  =  Cinematic viscosity
% rho =  Density
% epsilon = Maximum error (only required if IMPLICIT scheme is used)
% lambda  = Relax factor (only required if IMPLICIT scheme is used)
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% {u_3,v_3,p_3} = Velocity and Pressure fields at following (n+1) instant
%
% ---------------  COMPUTE PARAMETERS  --------------------%
%
% [Cu_1,Du_1] = CONVECTIVE and DIFFUSIVE term in x-momentum equation at n-1
% [Cu_2,Du_2] = CONVECTIVE and DIFFUSIVE term in x-momentum equation at n
% [Cv_1,Dv_1] = CONVECTIVE and DIFFUSIVE term in y-momentum equation at n-1
% [Cv_2,Dv_2] = CONVECTIVE and DIFFUSIVE term in y-momentum equation at n
%
% Ru_1 = Factor funcion of CONVECTIVE and DIFFUSIVE terms for u_1
% Ru_2 = Factor funcion of CONVECTIVE and DIFFUSIVE terms for u_2
% Rv_1 = Factor funcion of CONVECTIVE and DIFFUSIVE terms for v_1
% Rv_2 = Factor funcion of CONVECTIVE and DIFFUSIVE terms for v_2
%
% u_p = Velocty X direction [m/s]
% v_p = Velocty Y direction [m/s]
%
% pp  = Pseudo-Pressure field at n+1
% {grad_ppx,grad_ppy} = Pseudo-Pressure gradient field at n+1



function  [ u_3 , v_3 , p_3 ]= InstantSolveINS( u_1, v_1, u_2, v_2, L, At, nu, rho, epsilon, lambda)

N=size(u_1,1)-2;
d=L/N;

[Cu_1,Du_1] = ConvDiff(u_1,v_1,L);
[Cu_2,Du_2] = ConvDiff(u_2,v_2,L);

[Cv_1,Dv_1] = ConvDiff(v_1,u_1,L);
[Cv_2,Dv_2] = ConvDiff(v_2,u_2,L);

Ru_1 = At/d^2*( -Cu_1 + nu*Du_1 );
Ru_2 = At/d^2*( -Cu_2 + nu*Du_2 );

Rv_1 = At/d^2*( -Cv_1 + nu*Dv_1);
Rv_2 = At/d^2*( -Cv_2 + nu*Dv_2);

up = u_2 + 3/2*Ru_2 - 1/2*Ru_1;
vp = v_2 + 3/2*Rv_2 - 1/2*Rv_1;

pp=pseudo_p(up,vp,L);

[grad_ppx,grad_ppy]=grad(pp,L);

u_3 = up-grad_ppx;
v_3 = vp-grad_ppy;

% %------------- IMLPICIT SCHEME SOLVER--------------------
% i=1;
% e=epsilon+1;
%  
% while e > epsilon
%     
%     Ru_3=At/d^2*(-convective(u_3,v_3,L)+nu*diffusive(u_3));
%     Rv_3=At/d^2*(-convective(v_3,u_3,L)+nu*diffusive(v_3));
%     
%     up= u_3 + Ru_3;
%     vp= v_3 + Rv_3;
%     
%     pp=pseudo_p(up,vp,L);
%     [grad_ppx,grad_ppy]=grad(pp,L);
% 
%     u_3aux = u_2 + 3/2*Ru_2 - 1/2*Ru_1 - grad_ppx;
%     v_3aux = v_2 + 3/2*Rv_2 - 1/2*Rv_1 - grad_ppy;
% 
%     error_u=abs(u_3aux-u_3);
%     error_v=abs(v_3aux-v_3);
%     
%     e=max(max(max(error_u,error_v)));
%     
%     u_3 = u_3+ lambda*(u_3aux-u_3);
%     v_3 = v_3+ lambda*(v_3aux-v_3);
%     
%     i=i+1;
%     error(i)=e;
%     
% end
% %figure; plot(error,'s');

p_3 = pp*rho/At;

end

