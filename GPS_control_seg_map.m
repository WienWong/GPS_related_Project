% 2015-04-04 GPS control segment
% 38.8033 N, 104.5256 W   % Schriever Air Force Base, Coordinates
% 21.3114 N, 157.7964 W   % Hawaii, Coordinates
% 7.3133 S, 72.4111 E     % Diego Garcia, Coordinates
% 28.4889 N, 80.5778 W    % Cape Canaveral
% 7.56' S 14.25'W         % Ascension Island
% 8.7167 N, 167.7333 E    % Kwajalein
% 34.7328 N, 120.5681 W   % Vandenberg AFB California

% The ground antennas are co-located in four of the Monitor stations:
% Ascension Island
% Cape Canaveral
% Diego Garcia
% Kwajalein

clc;close all;

x11=360-104.5; y11=38.8;                  % Schriever Air Force Base
plot(x11,y11,'dg','LineWidth',2);
hold on;
plot(x11,y11,'pr','LineWidth',2);

x21=72.4; y21=-7.3;                       % Diego Garcia
plot(x21,y21,'*y');
plot(x21,y21,'dg','LineWidth',2);

x12=360-157.8; y12=21.3;                  % Hawaii
plot(x12,y12,'dg','LineWidth',2);

load('topo.mat','topo','topomap1');
contour(0:359,-89:90,topo,[0 0],'b');
axis equal;
% box on displays the boundary of the current axes. 
box on 

set(gca,'XLim',[0 360],'YLim',[-90 90], ...
    'XTick',[0 60 120 180 240 300 360], ...
    'Ytick',[-90 -60 -30 0 30 60 90]);
xlabel('Longitude');ylabel('Latitude');
title('Initial GPS control segment map');

x22=360-80.6; y22=28.5;                   % Cape Canaveral
plot(x22,y22,'dg','LineWidth',2);
plot(x22,y22,'*y');

x31=167.7; y31=8.7;                       % Kwajalein
plot(x31,y31,'dg','LineWidth',2);
plot(x31,y31,'*y');

x32=360-14.3; y32=-7.6;                   % Ascension Island
plot(x32,y32,'dg','LineWidth',2);
plot(x32,y32,'*y');

x33=360-120.6; y33=34.7;                  % Vandenberg AFB California
plot(x33,y33,'pm','LineWidth',2);
legend('Monitor Station','Master Control Station',...
    'Ground Antenna','Location','SouthEast');
