function res = cart2llh(pos)

% Cartesian to Longitude Latitude and Height
%
%  Re: the Earth radius
%   N: the radius of curvature in the prime vertical
%   f: the Earth flattening
% 1/f: (inverse flattening): 298.257 223 563
%   e: eccentricity of the Earth
%  e2: square of the Earth eccentricity

Re = 6378137;
f = 1 / 298.257222101;  
e2 = 2 * f - f^2;       

lon = angle(pos(:,1) + 1i*pos(:,2));
lat = angle( sqrt( pos(:,1).^2 + pos(:,2).^2 ) + 1i*pos(:,3) );

for j = 1:6
  N = Re ./ sqrt(1 - e2*sin(lat).*sin(lat));
  h = sqrt( pos(:,1).^2 + pos(:,2).^2 ) ./ cos(lat) - N;
  lat=angle( sqrt( pos(:,1).^2 + pos(:,2).^2 ) .* ( (1-e2)*N+h ) + 1i*pos(:,3).*(N+h) );
end

res = [lat lon h];
