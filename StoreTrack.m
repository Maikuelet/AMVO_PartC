%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%   StoreTrack    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function stores the velocity and pressure value of the
% CV (i,j) from given Velocity and Pressure fields
%
% -----------------  INPUT PARAMETERS  --------------------%
% {U,V,P} = Velocity and Pressure fields 
% {i,j} = index of the values to store
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% {u,v,p} = Values of Velocity and Pressure at (i,j) 
%

function [ u , v , p ] = StoreTrack (U,V,P,i,j)

u = U(i,j);
v = V(i,j);
p = P(i,j);

end

