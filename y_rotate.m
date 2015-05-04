function new_coord  = y_rotate(old_coord, ang)
% Rotate coordinate system around the y-axis.

rot_x=[    cos(ang)        zeros(size(ang))       -sin(ang)    ]';
rot_y=[ zeros(size(ang))    ones(size(ang))    zeros(size(ang))]';
rot_z=[    sin(ang)        zeros(size(ang))        cos(ang)    ]'; 

%                  
new_coord=[sum(rot_x.*old_coord');   % x component of new coordinate
           sum(rot_y.*old_coord');   % y component of new coordinate
           sum(rot_z.*old_coord')]'; % z component of new coordinate
