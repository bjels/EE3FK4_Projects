%Method of Images for Magnetostatics
%2021-11-14

clear;

u0 = 4*pi*10^-7; %magnetic permeability of free space
I = 1; %arbitrary current
B_coeff = u0*(I/(2*pi)); %simplifying multiplication for Bx & By

%setting vectors for axes
X = -3:0.01:3; 
Y = 0:0.01:5;

[x,y] = meshgrid(X,Y); %empty plot

%simplifying multiplication for Bx & By
c1 = y-1;
c2 = y+1;

%find magnetic flux density in x & y directions (aphi components)
Bx=B_coeff*(-c1./(c1.^2 + x.^2) + c2./(c2.^2 + x.^2));
By=B_coeff*(x./(c1.^2 + x.^2) - x./(c2.^2 + x.^2));

%create plot for magnetic flux lines
streamslice(x, y, Bx, By);
box on;
title('Sky Bjel (bjels, 400255999)');
xlabel('x'); ylabel('y');
