function res = llh2cart(pos)

%       Re: semimajor axis of the Earth or equatorial radius
%        f: Earth Flattening or Oblateness
%      1/f: (inverse flattening): 298.257 223 563
%        e: the eccentricity.
%        N: the radius of curvature in the prime vertical
% pos(:,1): latitude  - or phi
% pos(:,2): longitude - or lambda
% pos(:,3): height    - or h

Re = 6378137;           
f = 1 / 298.257222101;                        
e2 = 2 * f - f^2;       
N = Re ./ sqrt(1 - e2 * sin(pos(:,1)) .* sin(pos(:,1)));

res = [ (N + pos(:,3)) .* cos(pos(:,1)) .* cos(pos(:,2)) ...
        (N + pos(:,3)) .* cos(pos(:,1)) .* sin(pos(:,2)) ... 
        (N * (1-e2) + pos(:,3)) .* sin(pos(:,1)) ]; 
