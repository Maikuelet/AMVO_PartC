%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  MESH  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------  DESCRIPTION  -------------------% 
% This function generates the mesh geometry. The mesh 
% choosen for the problem is uniform. For furure versions
% it could be improved to non-uniform meshes.
%
% -----------------  INPUT PARAMETERS  --------------------%
% P = Initial Point
% O = Final Point


function [p] = Mesh (P,O,dx)

     p = P : dx : O;

end
    


