clc; % clear the command line 
clear; % remove all previous variables

O  = [0 0 0]; % the origin
R1 = [1 2 3]; % Point R1
R2 = [3 2 1]; % Point R2

V_R1O = R1 - O; % vector R1
V_R2O = R2 - O; % vector R2

V_R1O_dot_V_R2O = dot(V_R1O, V_R2O); % dot product R1*R2
V_R1O_dot_V_R1O = dot(V_R1O, V_R1O); % dot product R1*R1

Proj_V_R1O_V_R2O = (V_R1O_dot_V_R2O/V_R1O_dot_V_R1O)*V_R1O_dot_V_R1O;
% calculate the projection R1 ON R2 by formula

Mag_V_R1O = norm(V_R1O);% magnitude of R1
Mag_V_R2O = norm(V_R2O);% magnitude of R2

Cos_theta = V_R1O_dot_V_R2O/(Mag_V_R1O*Mag_V_R2O);
% cos value of the angle between R1 and R2
theta = acos(Cos_theta); % the angle between R1 and R2