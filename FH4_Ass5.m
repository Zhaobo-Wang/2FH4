clc; %clear the command line
clear; %remove all previous variables
% initialize variables
eo=1e-9/(36*pi); % the permittivity in free space
Q=5e-9; % charges on the positive plate
d=0.01;
high_rho = 5.0e-3;
low_rho = 1.0e-3;
diff_rho = high_rho - low_rho;
Number_of_rho_steps=100; %number of steps in the x direction 
drho=diff_rho/Number_of_rho_steps; %x increment
% perform calculations
W=0; % initialize the total energy
for k=1:Number_of_rho_steps
 rho=low_rho+0.5*drho+(k-1)*drho; %current radius
 er=10^3*rho; %current relative permittivity
 S=2*pi*rho*d; % area of the capacitor
 Ds=Q/S; % electric flux density
 dW=0.5*Ds*Ds*S*drho/(er*eo); % energy stored in a thin layer 
 W=W+dW; % get contribution to the total energy
end
C=Q^2/(2*W) 