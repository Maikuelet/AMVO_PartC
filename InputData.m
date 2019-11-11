%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  INPUT DATA  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------------  DESCRIPTION  ---------------------% 
% This file contains all the parameters needed to make the 
% code run. Each parameter needed should be loaded into this
% file.
%
%% ---------------- MESH DATA -----------------------------

N = 10;     % Number of elements per side
L = 1;      % Total mesh length
d = L/N;    % Element size

%% ---------------- PHYSICAL DATA -------------------------

Re = 100;       % Reynolds number
u0 = 1;         % Reference velocity
nu = u0*L/Re;   % Cinematic viscosity
rho = 1;        % Density

%% ---------------- TIME INTEGRATION DATA -----------------

T  = 5;                 % Total integration time
At = timestep(d,u0,Re); % Calculate required time step
t  = 0 : At : T;        % Time vector
S  = length(t);         % Number of time steps

%% ---------------- NUMERICAL DATA -----------------

i_ref = 3;  % x_index for timetracking element
j_ref = 3;  % y_index for timetracking element

T_sample = 0.1; % Time sample for printing in command window

epsilon = 1e-3; % maximum error (only required if INPLICIT scheme is used)
lambda  = 0.05; % relax factor (only required if INPLICIT scheme is used)

%% ---------------- COMMAND WINDOW PRINT -----------------

fprintf('   Time step: %.3f \n',At);
fprintf('   Element size: %.3f \n',d);
fprintf('   Reynolds number: %.0f \n',Re);
fprintf('   Element (%.0f,%.0f) Velocity and Pressure will be tracked \n',i_ref,j_ref);
