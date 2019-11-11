%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   timestep    %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function determine if the fluid is domined by CONVECTIVE or
% DIFFUSIVE effects. Consequenctly, it defines the time step required
% for time integration
%
% -----------------  INPUT PARAMETERS  --------------------%
% d  =  CV face length
% u0 =  Characteristic valocity
% Re =  Reynolds Number
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% At  = Characteristic time step of the problem
%
% -----------------  COMPUTE PARAMETERS  -------------------%
% f  = minoration factor for time step
% Atc = characteristic time step for convective effects
% Atd = characteristic time step for diffusive effects
%

function [At] = timestep(d,u0,Re)
% Chose time step for time integration
    
f=0.4; % minoration factor for time step

Atc = d/u0;         % characteristic time step for convective effects
Atd = 0.5*d*Re/u0;  % characteristic time step for diffusive effects

At=min(Atc,Atd)*f;  % minorated characteristic time step of the problem

if At == Atc*f
    fprintf('The time integretion is dominated by CONVEITVE effects \n');

elseif At == Atd*f
    fprintf('The time integretion is dominated by DIFFUSIVE effects \n',toc);

end
        
end

