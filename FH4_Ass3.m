
clc; %clear the command line
clear; %remove all previous variables
Epsilono=8.854e-12; %use permittivity of air
D=2e-6; %the surface charge density
P=[0 0 1]; %the position of the observation point
E=zeros(1,3); % initialize E=(0 ,0, 0)
Number_of_rho_Steps=100;%initialize discretization in the x direction
Number_of_phi_Steps=100;%initialize discretization in %the z direction
rho_lower=0; %the lower boundary of x
rho_upper=1; %the upper boundary of x
phi_lower=0; %the lower boundary of y
phi_upper=2*pi; %the upper boundary of y
drho=(rho_upper- rho_lower)/Number_of_rho_Steps; %the x increment or the width of a grid
dphi=(phi_upper- phi_lower)/Number_of_phi_Steps; %The y increment or the length of a grid


for j=1: Number_of_phi_Steps
   for i=1: Number_of_rho_Steps
        rho= rho_lower +drho/2+(i-1)*drho; %the x component of the center of a grid
        phi= phi_lower +dphi/2+(j-1)*dphi; %the y component of the center of a grid
        R = P-[sqrt(x^2+y^2) atan(y/x) 0];% vector R is the vector seen from the center of the grid to the
        RMag=norm(R); % magnitude of vector R
        
        ds=rho*dphi*drho; 
        dQ=D*ds; % the charge on a single grid
        E=E+(dQ/(4*Epsilono*pi* RMag^3))*R; % get contribution to the E field
   end
end

E
