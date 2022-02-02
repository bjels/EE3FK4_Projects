% Electric and magnetic field line plots for a rectangular waveguide (WG)
% Current and charge density plots for a rectangular WG
% 12/21/2021
% Adapted from: https://www.mathworks.com/matlabcentral/fileexchange/73101-rectangular-waveguide-e-h-field-plot-for-all-modes

clc; clear;

p = 'What is the a value? ';
a = input(p); %chosen length of WG (cm)
b = a/2; %width of WG (cm); chosen to be half the length

f_op = 45*10.^9; %operation frequency (Hz)
c = physconst('LightSpeed'); %light propagation velocity in a vacuum
m = 1; n = 0; %mode no. in x and y directions, respectively (for dominant mode)

fc = c*100/2*sqrt((m/a).^2+(n/b).^2); %cutoff freq
l = 2*a; %lambda

e0 = 8.854e-12; %permittivity of free space
er = 1; %relative permittivity

u = 4*pi*10e-7; %magnetic permeability of free space
ur = 1; %relative permeability

om = 2*pi*f_op; %operation freq (rad/s) - omega
Pl = 50; %no. of pts for plot

be = om*(sqrt(u*e0)); %propagation const. beta
be_x = m*pi/a; %x component of beta
be_y = n*pi/b; %y component of beta
be_c = sqrt(be_x.^2+be_y.^2);
be_z = sqrt(be.^2-be_c.^2);

%front cross-section (TE10)
z = 0;
x = linspace(0, a, Pl);
y = linspace(0, b, Pl);
[x,y] = meshgrid(x,y);

%TEmn fields (E and H, respectively)
Elec_x = cos(be_x.*x).*sin(be_y.*y).*exp(-j*be_z*z);       
Elec_y = -sin(be_x.*x).*cos(be_y.*y).*exp(-j*be_z*z);
Elec_z = zeros(size(real(Elec_y)));
Magn_x = sin(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-j*be_z*z);
Magn_y = cos(m*pi.*x./a).*sin(n*pi.*y./b).*exp(-j*be_z*z);
Magn_z = -cos(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-j*be_z*z);

figure();
quiver(x,y,real(Elec_x),real(Elec_y));
hold on
quiver(x,y,real(Magn_x),real(Magn_y));
grid on
title('Front Section Plot of E-H Fields (Mode TE10)');
legend('Electric Field (E)','Magnetic Field (H)');
xlabel('x (0 to a)');
ylabel('y (0 to b=a/2)');

%top cross-section (TE10)
y = b; %xz plane pos.
x = linspace(0,a,Pl);
z = linspace(0,l,Pl);
[x,z] = meshgrid(x,z);

%TEmn fields (E and H, respectively)
Elec_x = cos(be_x.*x).*sin(be_y.*y).*exp(-j*be_z*z);    
Elec_y = -sin(be_x.*x).*cos(be_y.*y).*exp(-j*be_z*z);
Elec_z = zeros(size(real(Elec_y)));
Magn_x = sin(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-j*be_z*z);
Magn_y = cos(m*pi.*x./a).*sin(n*pi.*y./b).*exp(-j*be_z*z);
Magn_z = -cos(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-j*be_z*z);

figure();
quiver(z,x,real(Elec_z),real(Elec_x));
hold on
quiver(z,x,real(Magn_z),real(Magn_x));
grid on
title('Top Section Plot of E-H Fields (Mode TE10)');
legend('Electric Field (E)','Magnetic Field (H)');
ylabel('x (0 to a)');
xlabel('z');

%side cross-section (TE10)
x = a/2;
y = linspace(0,b,Pl);
z = linspace(0,2*l,Pl);
[y,z] = meshgrid(y,z);

%TEmn fields (E and H, respectively)
Elec_x = cos(be_x.*x).*sin(be_y.*y).*exp(-j*be_z*z);
Elec_y = -sin(be_x.*x).*cos(be_y.*y).*exp(-j*be_z*z);
Elec_z = zeros(size(real(Elec_y)));
Magn_x = sin(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-j*be_z*z);
Magn_y = cos(m*pi.*x./a).*sin(n*pi.*y./b).*exp(-j*be_z*z);
Magn_z = -cos(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-j*be_z*z);

figure();
quiver(z,y,real(Elec_z),real(Elec_y));
hold on
quiver(z,y,real(Magn_z),real(Magn_y));
grid on
title('Side Section Plot of E-H Fields (Mode TE10)');
legend('Electric Field (E)','Magnetic Field (H)');
ylabel('y (0 to b)');
xlabel('z');
