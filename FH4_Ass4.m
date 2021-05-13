clc; %clear the command line
clear; %remove all previous variables
Epsilono=1e-9/(36*pi); %use permitivity of free space
r_upper=3.0;%upper bound of rho
r_lower=2.0;%lower bound of rho
phi_upper=2*pi;%upper bound of phi
phi_lower=0;%lower bound of phi
theta_upper=pi;%upper bound of z
theta_lower=0;%lower bound of z
Number_of_r_Steps=50; %initialize discretization in the rho direction
dr=(r_upper-r_lower)/Number_of_r_Steps; %The rho increment
Number_of_theta_Steps=50; %initialize the discretization in the z direction
dtheta=(theta_upper-theta_lower)/Number_of_theta_Steps; %The z increment
Number_of_phi_Steps=50; %initialize the phi discretization
dphi=(phi_upper-phi_lower)/Number_of_phi_Steps; %The step in the phi direction
WE=0;%the total engery stored in the region
for k=1:Number_of_phi_Steps
 for j=1:Number_of_theta_Steps
 for i=1:Number_of_r_Steps
 r=r_lower+0.5*dr+(i-1)*dr; %r of current volume element
 theta=theta_lower+0.5*dtheta+(j-1)*dtheta; %theta of current volume element
 phi=phi_lower+0.5*dphi+(k-1)*dphi; %phi of current volume element
 EMag=225988/r^2;%magnitude of electric field of current volume element
 dV=r^2*sin(theta)*dr*dphi*dtheta;%volume of current element
 dWE=0.5*Epsilono*EMag*EMag*dV;%energy stored in current element
 WE=WE+dWE;%get contribution to the total energy
 end %end of the i loop
 end %end of the j loop
end %end of the k loop


