
clc;
clear;
mo=4*pi*1e-7; % the permeability of air
I=1; % this is a value of a current that assumed to flow in the first conductor

% calculation is the matrial of the coils core is air 
d=0.1;
a1=  0.01; 
a2 = 0.04;
A2= pi*a2.^2;

N=1; % the number of turns of the coil
%% B vector magnetic field
B12 = (mo*I*a1.^2)/(2*(a1.^2+d.^2)^(3/2))
%% flux linkage calculation 
phi12 = B12*A2;

lamda=N*phi12;
% multual inductance calculation 
M12=lamda/I;
fprintf('The numerical value of the mutual inductance is %4.2E H \n',M12)

