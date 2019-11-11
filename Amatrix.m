%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%   A MATRIX     %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function creates the A matrix with its corresponding 
% coeficients.
%
% -----------------  INPUT PARAMETERS  --------------------%
% N  =  Number of Mesh nodes
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% A  = Coefficient Matrix of A*pp = b system
%
% ---------------  COMPUTE PARAMETERS  --------------------%
% d  =  CV face length
% L  =  Domai Length 
%
% ----------------------  DATA STORED  ----------------------% 
%
% A = Saves  Coefficient matrix in a [N^2][N^2] matrix



function [A] = Amatrix (N)

    A = zeros (N^2,N^2);
    
    K=zeros(N,N);
    for i=1:N
        for j=1:N
            K(i,j)=i+(j-1)*N;
        end
    end
    
    for k=1:N^2
        
        j=fix((k-1)/N)+1;
        i=k-(j-1)*N;
        
        %Centered
        A(k,k)=-4;
        
        %West
        if i==1 A(k,K(N,j))=1; 
        else A(k,k-1)=1;
        end  
        
        %Est
        if i==N A(k,K(1,j))=1;
        else A(k,k+1)=1;
        end
        
        %South
        if j==1 A(k,K(i,N))=1;
        else A(k,k-N)=1;
        end
        
        %North
        if j==N A(k,K(i,1))=1;
        else A(k,k+N)=1;
        end
        
        A(5,5)=-4.1; % for avoiding singularity of A matrix
        
    end
            
    