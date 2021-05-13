clc; 
clear; 
mu=4*pi*1e-7;
I=1.0;%current of the filament
end1_1=[-1 -1 0];%end of the filament_1
end1_2=[1 -1 0];%end of the filament_1
end2_1=[1 -1 0];%end of the filament_2
end2_2=[1 1 0];%end of the filament_2
end3_1=[1 1 0];%end of the filament_3 
end3_2=[-1 1 0];%end of the filament_3
end4_1=[-1 1 0];%end of the filament_4
end4_2=[-1 -1 0];%end of the filament_4
Number_of_Segments=200;%number of increasing steps along the filament
dL1=(end1_2-end1_1)/Number_of_Segments;%vector increment along the filament
dL2=(end2_2-end2_1)/Number_of_Segments;%vector increment along the filament
dL3=(end3_2-end3_1)/Number_of_Segments;%vector increment along the filament
dL4=(end4_2-end4_1)/Number_of_Segments;%vector increment along the filament
aN=[0 0 1];% direction normal to the surface of the coil
NumberOfRhoSteps=20;%number of increasing steps of the coil area along the y direction
NumberOfPhiSteps=20;%number of increasing steps of the coil area along the z direction
Rhomin=0;%lowest rho
Rhomax=0.2;%maxium rho
Phimin=0;%lowest phi
Phimax=2*pi;%maxium phi
dRho=(Rhomax-Rhomin)/NumberOfRhoSteps;% area increment along rho
dPhi=(Phimax-Phimin)/NumberOfPhiSteps;% area increment along phi
dS=dRho*dPhi;%increament area
flux1=0;%flux through the coil
flux2=0;%flux through the coil
flux3=0;%flux through the coil
flux4=0;%flux through the coil
flux=0;%flux through the coil
zp=0;%z coordinate is always 0 on the coil
for m=1:NumberOfPhiSteps %repeat for all points in the z direction
    for n=1:NumberOfRhoSteps %repeat for all points in the y direction
        Rhop=Rhomin+0.5*dRho+(n-1)*dRho;%y coordinate of current surface element
        Phip=Phimin+0.5*dPhi+(m-1)*dPhi;%z coordinate of current surface element
        Rp=[Rhop Phip zp];%the position of current surface element
        B=[0 0 0];%the magnetic field at current surface element
        for i=1:Number_of_Segments %repeat for all divisions in the z direction
            C=end1_1+(i-1)*dL1+0.5*dL1; %X center of current subsection
            R= Rp-C; %vector pointing from current subsection to the current observation point
            norm_R=norm(R); %get the distance between the current surface element and the observation point
            R_Hat=R/norm_R; %unit vector in the direction of R
            dH=(I/(4*pi*norm_R*norm_R))*cross(dL1,R_Hat); %this is the contribution from current element
            B=B+mu*dH;
        end %end of i loop
        dflux=dS*dot(B,aN);%flux through current surface element
        flux1=flux1+dflux;%get contribution to the total flux
    end %end of n loop
end % end of m loop
aN = [0 0 1];
for m=1:NumberOfPhiSteps %repeat for all points in the z direction
    for n=1:NumberOfRhoSteps %repeat for all points in the y direction
        Rhop=Rhomin+0.5*dRho+(n-1)*dRho;%y coordinate of current surface element
        Phip=Phimin+0.5*dPhi+(m-1)*dPhi;%z coordinate of current surface element
        Rp=[Rhop Phip zp];%the position of current surface element
        B=[0 0 0];%the magnetic field at current surface element
        for i=1:Number_of_Segments %repeat for all divisions in the z direction
            C=end2_1+(i-1)*dL2+0.5*dL2; %X center of current subsection
            R= Rp-C; %vector pointing from current subsection to the current observation point
            norm_R=norm(R); %get the distance between the current surface element and the observation point
            R_Hat=R/norm_R; %unit vector in the direction of R
            dH=(I/(4*pi*norm_R*norm_R))*cross(dL2,R_Hat); %this is the contribution from current element
            B=B+mu*dH;
        end %end of i loop
        dflux=dS*dot(B,aN);%flux through current surface element
        flux2=flux2+dflux;%get contribution to the total flux
    end %end of n loop
end % end of m loop
aN = [0 0 1];
for m=1:NumberOfPhiSteps %repeat for all points in the z direction
    for n=1:NumberOfRhoSteps %repeat for all points in the y direction
        Rhop=Rhomin+0.5*dRho+(n-1)*dRho;%y coordinate of current surface element
        Phip=Phimin+0.5*dPhi+(m-1)*dPhi;%z coordinate of current surface element
        Rp=[Rhop Phip zp];%the position of current surface element
        B=[0 0 0];%the magnetic field at current surface element
        for i=1:Number_of_Segments %repeat for all divisions in the z direction
            C=end3_1+(i-1)*dL3+0.5*dL3; %X center of current subsection
            R= Rp-C; %vector pointing from current subsection to the current observation point
            norm_R=norm(R); %get the distance between the current surface element and the observation point
            R_Hat=R/norm_R; %unit vector in the direction of R
            dH=(I/(4*pi*norm_R*norm_R))*cross(dL3,R_Hat); %this is the contribution from current element
            B=B+mu*dH;
        end %end of i loop
        dflux=dS*dot(B,aN);%flux through current surface element
        flux3=flux3+dflux;%get contribution to the total flux
    end %end of n loop
end % end of m loop
aN = [0 0 1];
for m=1:NumberOfPhiSteps %repeat for all points in the z direction
    for n=1:NumberOfRhoSteps %repeat for all points in the y direction
        Rhop=Rhomin+0.5*dRho+(n-1)*dRho;%y coordinate of current surface element
        Phip=Phimin+0.5*dPhi+(m-1)*dPhi;%z coordinate of current surface element
        Rp=[Rhop Phip zp];%the position of current surface element
        B=[0 0 0];%the magnetic field at current surface element
        for i=1:Number_of_Segments %repeat for all divisions in the z direction
            C=end4_1+(i-1)*dL4+0.5*dL4; %X center of current subsection
            R= Rp-C; %vector pointing from current subsection to the current observation point
            norm_R=norm(R); %get the distance between the current surface element and the observation point
            R_Hat=R/norm_R; %unit vector in the direction of R
            dH=(I/(4*pi*norm_R*norm_R))*cross(dL4,R_Hat); %this is the contribution from current element
            B=B+mu*dH;
        end %end of i loop
        dflux=dS*dot(B,aN);%flux through current surface element
        flux4=flux4+dflux;%get contribution to the total flux
    end %end of n loop
end % end of m loop
flux = flux1+flux2+flux3+flux4;
M=flux/I;% the mutual inductance

M