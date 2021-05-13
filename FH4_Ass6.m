VOut=0;%voltage on outer conductor 
VIn=1.0;%voltage on inner conductor 
NumberOfXPoints=50; %number of points in the x direction
NumberOfUnKnowns=NumberOfXPoints*NumberOfYPoints; %this is the total number of unknowns
A=zeros(NumberOfUnKnowns, NumberOfUnKnowns); %this is the matrix of coefficients
b=zeros(NumberOfUnKnowns,1);%this is the right hand side vector
jleft=(NumberOfXPoints)/4;%index of inner conductor left side
jright=3*jleft;%index of inner conductor right side
ibottom=(NumNumberOfYPoints=NumberOfXPoints; %number of points in the y direction
berOfYPoints)/4;%index of inner conductor Bottom side
itop=3*ibottom;%index of inner conductor Top side
EquationCounter=1; %this is the counter of the equations
for i=1:NumberOfXPoints %repeat for all rows
 for j=1:NumberOfYPoints %repeat for all columns
 if((i>=ibottom & i<=itop) & (j>=jleft & j<=jright))%V=1 for all points inside the inner conductor 
 A(EquationCounter, EquationCounter)=1;
 b(EquationCounter,1)=VIn;
 else
 A(EquationCounter, EquationCounter)=-4;
 if(j==1) %this is the first column
 b(EquationCounter, 1)=b(EquationCounter,1)-VOut; % left point is on boundary
 else%store the coefficient of the left point
 A(EquationCounter,EquationCounter-1)=1.0; 
 end
 if(j==NumberOfYPoints) % this is the last column
 b(EquationCounter, 1)= b(EquationCounter,1)-VOut;%on right boundary
 else %store coefficient of right boundary
 A(EquationCounter, EquationCounter+1)=1.0;
 end
 if(i==1) % this is the first row
 b(EquationCounter,1)=b(EquationCounter,1)-VOut; %top point is on boundary
 else %store coefficient of top point
 A(EquationCounter, EquationCounter-NumberOfXPoints)=1;
 end
 if(i==NumberOfXPoints) % this is the last row
 b(EquationCounter,1)=b(EquationCounter,1)-VOut; %bottom point is on boundary
 else%store coefficient of bottom point
     A(EquationCounter, EquationCounter+NumberOfXPoints)=1.0; 
 end
 end
 EquationCounter=EquationCounter+1;
 end
end
V=A\b; %obtain the vector of voltages 
V_Square=reshape(V, NumberOfXPoints, NumberOfYPoints);%convert values into a rectangular matrix
surf(V_Square); %obtain the surface figure
figure;
[C,h] = contour(V_Square);% obtain the contour figure
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
colormap cool;
figure;
contour(V_Square);
[px,py] = gradient(V_Square);
hold on, quiver(-px,-py), hold off%obtain the electric field map by using E=-Gradient(V)