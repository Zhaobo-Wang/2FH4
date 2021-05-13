clc; %clear the command window
clear; %clear all variables
mu=4*pi*1e-7;
pho=0.000001;
I=1.0;%current of the filament
end1=[0.01 0.01 0];%end of the filament
end2=[-0.01 0.01 0];%end of the filament
end3=[-0.01 -0.01 0];
end4=[0.01 -0.01 0];
Number_of_Segments=1000;%number of increasing steps along the filament
dl_1=(end2-end1);%vector increment along the filament
dl_2=(end3-end2);%vector increment along the filament
dl_3=(end4-end3);%vector increment along the filament
dl_4=(end1-end4);%vector increment along the filament
dl = (dl_1+dl_2+dl_3+dl_4)/Number_of_Segments;
aN=[0 0 1];% direction normal to the surface of the coil counter
NumberOfphoSteps=20;%number of increasing steps of the coil area along the y direction
NumberOfphiSteps=20;%number of increasing steps of the coil area along the z direction
phomin=0;%lowest y corodinate of the coil
phomax=0.002;%maxium y corodinate of the coil
phimin=0;%lowest z corodinate of the coil
phimax=2*pi;%maxium z corodinate of the coil
dpho=(phomax-phomin)/NumberOfphoSteps;% area increment along the y direction
dphi=(phimax-phimin)/NumberOfphiSteps;% area increment along the z direction
flux=0;%flux through the coil
dS=pho*dpho*dphi;%increament area 
%--------------
zp=0.0;%z coordinate is always 0.0 on the coil
for i=1:NumberOfphoSteps %repeat for all points in the z direction
for j=1:NumberOfphiSteps %repeat for all points in the y direction
phop=phomin+0.5*dpho+(i-1)*dpho;%y coordinate of current surface element
phip=phimin+0.5*dphi+(j-1)*dphi;%z coordinate of current surface element
Rp=[phop phip zp];%the position of current surface element
B=[0 0 0];%the magnetic field at current surface element
for k=1:Number_of_Segments %repeat for all divisions in the z direction
C=end1+(i-1)*dl+0.5*dl; %C center of current subsection
R=Rp-C; %vector pointing from current subsection to the current observation point
norm_R=norm(R); %get the distance between the current surface element and the observation point
R_Hat=R/norm_R; %unit vector in the direction of R
dH=(I/(4*pi*norm_R*norm_R))*cross(dl,R_Hat); %this is the contribution from current element
B=B+mu*dH;
end %end of i loop
dflux=dS*dot(B,aN);%flux through current surface element
flux=flux+dflux;%get contribution to the total flux
end %end of n loop
end % end of m loop
M=flux/I;% the mutual inductance

M
