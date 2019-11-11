%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  PostProcess  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------------  DESCRIPTION  ---------------------% 
% This file generates 2 graphics for comparing numerical and 
% analytical solution for Pressure and Velocity at tracking point

%% -------------------- VELOCITY ---------------------------

figure; plot(t,u_nt,t,u_at,'--',t,v_nt,t,v_at,'--'); 
grid on;
legend 'U Numerical' 'U Analytical' 'V Numerical' 'V Analytical'
xlabel 'Time'
ylabel 'Velocity'
title 'Velocity at Tracking Point'


%% -------------------- PRESSURE ---------------------------

figure; plot(t,p_nt,t,p_at,'--'); 
grid on;
legend 'P Numerical' 'P Analytical'
xlabel 'Time'
ylabel 'Pressure'
title 'Pressure at Tracking Point'


