%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  PreProcess  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------------  DESCRIPTION  ---------------------% 
% This file prepares all the information required for solving
% the problem in the appropiate way for the solver
%

%% ------------------ INITIALIZE VARIABLES -----------------

% Temporal tracking numerical results for (i_ref,j_ref)
u_nt = zeros(S,1);  % X-Velocity numerical tracking
v_nt = zeros(S,1);  % Y-Velocity numerical tracking
p_nt = zeros(S,1);  % Pressure numerical tracking

% Temporal tracking analytic results for (i_ref,j_ref)
u_at = zeros(S,1);  % X-Velocity analytical tracking 
v_at = zeros(S,1);  % Y-Velocity analytical tracking 
p_at = zeros(S,1);  % Pressure analytical tracking 

% Cumulative simulation time for printing is inizialized
tprint = T_sample;

%% ------------------ INITIAL CONDITIONS -----------------
% The analytical solution velocity fields at t=0 and t=0+At 
% will be defined as initial conditions

% Notation
% *_1 -> *_n-1 (previous time step)
% *_2 -> *_n   (current time step)
% *_3 -> *_n+1 (following time step)


% Analytical fields are calculated at t=0...
[ u_1 , v_1 , p_1 ] = AnalyticField (N , L , t(1) , nu , rho); 

% ... and stored in analytical and numerical tracking for t=0
[u_nt(1), v_nt(1), p_nt(1)] = StoreTrack ( u_1 , v_1 , p_1 , i_ref , j_ref );
[u_at(1), v_at(1), p_at(1)] = StoreTrack ( u_1 , v_1 , p_1 , i_ref , j_ref );


% Analytical fields are calculated at t=0+At...
[ u_2 , v_2 , p_2 ] = AnalyticField (N , L , t(2) , nu , rho);

% ... and stored in analytical and numerical tracking for t=0+At
[u_nt(2), v_nt(2), p_nt(2)] = StoreTrack ( u_2 , v_2 , p_2 , i_ref , j_ref );
[u_at(2), v_at(2), p_at(2)] = StoreTrack ( u_2 , v_2 , p_2 , i_ref , j_ref );
