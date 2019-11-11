%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%  SolveINS  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------------  DESCRIPTION  ---------------------% 
% This file solves de INS problem ans stores tracking values 
% for the indicated control volume
%
% Notation
% *_1 -> *_n-1 (previous time step)
% *_2 -> *_n   (current time step)
% *_3 -> *_n+1 (following time step)

fprintf('\n ---------STARTING SIMULATION------------ \n');

tic;

for k=3:S  
    
    % Analytical solution for t(k) is calculated...
    [ u_3 , v_3 , p_3 ] = AnalyticField (N , L , t(k) , nu , rho);
    
    % ... and stored in analytical solution tracking array for t(k)
    [u_at(k), v_at(k), p_at(k)] = StoreTrack ( u_3 , v_3 , p_3 , i_ref , j_ref );
    
    
    % Analytical solution for t(k) is calculated...
    [ u_3 , v_3 , p_3 ] = InstantSolveINS ( u_1, v_1, u_2, v_2, L, At, nu, rho, epsilon,lambda);
    
    % ... and stored in numerical solution tracking array for t(k)
    [u_nt(k), v_nt(k), p_nt(k)] = StoreTrack ( u_3 , v_3 , p_3 , i_ref , j_ref );
    
    % Window change 
    u_1 = u_2; v_1 = v_2; p_1 = p_2; 
    u_2 = u_3; v_2 = v_3; p_2 = p_3;
    
    
    if t(k) > tprint
        fprintf('  %.2f [s] simulated from %.3f [s] of total simulation \n',tprint,T);
        tprint = tprint + T_sample;
    end
    
    
end

fprintf('--------SIMULATION FINISHED---------- \n');

fprintf('   Total computation time: %.3f [s] \n',toc);