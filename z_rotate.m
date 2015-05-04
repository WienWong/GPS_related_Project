function new_coord  = z_rotate(old_coord, ang)
% Rotate coordinate system around the z-axis.

rot_x=[    cos(ang)            sin(ang)       zeros(size(ang))]';
rot_y=[   -sin(ang)            cos(ang)       zeros(size(ang))]';
rot_z=[zeros(size(ang))    zeros(size(ang))    ones(size(ang))]'; 

%              
new_coord=[sum(rot_x.*old_coord');   % x component of new coordinate
           sum(rot_y.*old_coord');   % y component of new coordinate
           sum(rot_z.*old_coord')]'; % z component of new coordinate
