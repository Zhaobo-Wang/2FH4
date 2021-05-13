clc;
clear;
%%initialize
V=0;
S1=0;
S2=0;
S3=0;
S4=0;
S5=0;
S6=0;
S=0;
%%lower bound of the coordinates
r=0;
phi = pi/4;
theta= pi/4;

Number_of_r_Steps = 100;
Number_of_phi_Steps = 100;
Number_of_theta_Steps = 100;

%% dr/dphi/dtheta
dr = (2-0)/Number_of_r_Steps;
dphi = (pi/2 - pi/4)/Number_of_phi_Steps; 
dtheta = (pi/2 - pi/4)/Number_of_theta_Steps;

%% the following calculates the volume of the enclosed surface
for k = 1:Number_of_theta_Steps
    for j = 1:Number_of_phi_Steps
        for i = 1:Number_of_r_Steps
            V = V+r^2*sin(theta)*dr*dphi*dtheta;
        end
        r = r+dr;
    end
    r = 0;
end

%% the following calculate the s1 s5 area
%%r*dr*dtheta
for k= 1:Number_of_theta_Steps
    for j = 1:Number_of_r_Steps
        S1 = S1 + r*dr*dtheta;
    end
    r = r+dr;
end
        
S5 = S1;


%% the following calculate the s2 s3 area
theta = pi/4;
%%sin(theta)*r*dr*dphi
for k = 1:Number_of_r_Steps
    for j = 1:Number_of_phi_Steps
        S2 = S2+r*sin(theta)*dr*dphi;
    end
    r = r+dr;
end

%%sin(theta)*r*dr*dphi
theta = pi/2;
for k = 1:Number_of_r_Steps
    for j = 1:Number_of_phi_Steps
        S3 = S3 + r*sin(theta)*dr*dphi;%r is changing according integral
    end
    r = r+dr;
end

%% the following calculate the s4 area 
%%r^2*sin(theta)*dtheta*dphi

r = 2;

for k = 1:Number_of_phi_Steps
    for j = 1:Number_of_theta_Steps   
        S4 = S4 + r^2*sin(theta)*dtheta*dphi;
    end
    theta = theta +dtheta;%theta is changing according integral
end

S = S1+S2+S3+S4+S5;
