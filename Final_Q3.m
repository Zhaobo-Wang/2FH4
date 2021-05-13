clc; %clear the command line
clear; %remove all previous variables
Epsilono=8.854e-12; %use permittivity of air
D=1e-6; %the surface charge density
P=[0 0.1 0]; %the position of the observation point
E=zeros(1,3); % initialize E=(0 ,0, 0)
Number_of_x_Steps=100;%initialize discretization in the x direction
Number_of_z_Steps=100;%initialize discretization in %the z direction
x_lower=-0.5; %the lower boundary of x
x_upper=0.5; %the upper boundary of x
z_lower=-0.5; %the lower boundary of y
z_upper=0.5; %the upper boundary of y
dx=(x_upper- x_lower)/Number_of_x_Steps; %the x increment or the width of a grid
dz=(z_upper- z_lower)/Number_of_z_Steps; %The y increment or the length of a grid
ds=dx*dz; %the area of a single grid
dQ=D*ds; % the charge on a single grid
for j=1: Number_of_z_Steps
for i=1: Number_of_x_Steps
x= x_lower +dx/2+(i-1)*dx; %the x component of the center of a grid
z= z_lower +dz/2+(j-1)*dz; %the y component of the center of a grid
R=P-[x 0 z];% vector R is the vector seen from the center of the grid to the observation point
RMag=norm(R); % magnitude of vector R
E=E+(dQ/(4*Epsilono*pi* RMag ^2))*R; % get contribution to the E field
end
end

E


