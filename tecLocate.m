% 2014-06-11
% This file aims to locate interesting TEC value from igsgxxx0.13i.txt file

close all;clear all;clc;

tec = NaN*ones(13,1);

fid = fopen('igsg0300.13i.txt');

ready=0;

while ~ready                % to locate the specific line '   -22.5-180.0 180.0   5.0 450.0                            LAT/LON1/LON2/DLON/H'
    test = fgetl(fid);
    if strcmp(test,'   -22.5-180.0 180.0   5.0 450.0                            LAT/LON1/LON2/DLON/H')
        ready = 1;
        fprintf(test,'\n'); %display the matched line at command window
    end
end

garb = fgetl(fid);          %jump one line
use_lin = fgetl(fid);       %this line gives useful information
dat = str2num(use_lin);     %convert from string to specific numerical value

for i=1:13                  %one day includes 13 sample points 

    tec(i)=dat(11)/10;      %value divided by 10 gives the true TEC value
    for j=1:428             %jump 429 lines and just ignore them  
        garb=fgetl(fid);
    end
    
    use_lin = fgetl(fid);   %find out the second interesting line
    dat = str2num(use_lin); %convert to specific numerical value
end

tec'                        %display at command window
%TEC = zeros(13,155);       %total of 155 sample days
TEC(:,5) = tec';

fclose(fid);
