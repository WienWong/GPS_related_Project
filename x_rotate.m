function new_coord  = x_rotate(old_coord, ang)
% Any Cartesian coordinate system can be transformed to another Cartesian 
% coordinate system through three succeeded rotations if their origins are
% the same and if they are both right-handed or left-handed coordinate sys.
%
% Rotate coordinate system around the x-axis. Alpha is the rotating
% angle, which has a positive sign for a counter-clockwise
% rotation as viewed from the positive axis to the origin.

rot_x = [ ones(size(ang))  zeros(size(ang))  zeros(size(ang))]'; 
rot_y = [zeros(size(ang))         cos(ang)           sin(ang)]';
rot_z = [zeros(size(ang))        -sin(ang)           cos(ang)]'; 

%                
new_coord = [sum(rot_x.*old_coord')    % x component of new coordinate 
             sum(rot_y.*old_coord')    % y component of new coordinate 
             sum(rot_z.*old_coord')]'; % z component of new coordinate
