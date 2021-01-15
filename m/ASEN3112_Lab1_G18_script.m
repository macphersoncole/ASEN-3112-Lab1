clc;
clear;
close all;

%% Load Data & Constant Declaration

files1 = dir('*-OTW.txt');
data1 = {};
for i = 1:length(files1)
    data1(i) = {readmatrix(files1(i).name)};
end
data1 = cell2table(data1); 
%{
Columns are as follows: 1) Time [sec]
                        2) Torsion Angle [degrees]
                        3) Torsional Epsilon [degrees]
                        4) Torsion Torque [lbf*in]
                        5) Axial Epsilon [in]
%}
OTW1 = data1{1,1}{:,:}; 
OTW2 = data1{1,2}{:,:};
OTW3 = data1{1,3}{:,:};
OTW4 = data1{1,4}{:,:};
OTW5 = data1{1,5}{:,:};
OTW6 = data1{1,6}{:,:};
OTW7 = data1{1,7}{:,:};
OTW8 = data1{1,8}{:,:};
OTW1(:,2:3) = OTW1(:,2:3).*(pi/180);
%OTW1(:,2) = (OTW1(:,2)-max(OTW1(:,2)));
OTW2(:,2:3) = OTW2(:,2:3).*(pi/180);
OTW3(:,2:3) = OTW3(:,2:3).*(pi/180);
OTW4(:,2:3) = OTW4(:,2:3).*(pi/180);
OTW5(:,2:3) = OTW5(:,2:3).*(pi/180);
OTW6(:,2:3) = OTW6(:,2:3).*(pi/180);
OTW7(:,2:3) = OTW7(:,2:3).*(pi/180);
OTW8(:,2:3) = OTW8(:,2:3).*(pi/180);

D_e = 3/4; % Exterior Diameter [in]
R_e = D_e/2; % Exterior Radius [in]
t = 1/16; % Thickness [in]
R = (R_e + (R_e-t))/2; % Inline radius [in]
L = 10; % Length [in]
G = 3.75*(10^6); % Shear Modulus [psi]
T_0 = 0; % Initial torque [lbs*in]
T_max = 20; % Max toruqe [lbs*in]
tau_max = 7800; % Max shear stress at max torque is about 7800 {psi}
SF = 2.8; % Provides a safety factor of 2.8
b = 2*pi*R; % Cicumference [in]
beta = 1/3; % Assumed since (2*pi*R_e)/t > 5
J_alpha = beta*b*(t^3); % Polar moment of inertia [in^4]
J_beta = J_alpha;

max1 = find(OTW1(:,4)==max(OTW1(:,4)));
max2 = find(OTW2(:,4)==max(OTW2(:,4)));
max3 = find(OTW3(:,4)==max(OTW3(:,4)));
%% Torque vs Shear Strain Extensometer

pfit1 = polyfit(OTW1(:,3),OTW1(:,4),1);
pfit2 = polyfit(OTW2(:,3),OTW2(:,4),1);
pfit3 = polyfit(OTW3(:,3),OTW3(:,4),1);

figure
plot(OTW1(:,3),pfit1(1)*OTW1(:,3)+pfit1(2),...
    OTW2(:,3),pfit2(1)*OTW2(:,3)+pfit1(2),...
    OTW3(:,3),pfit3(1)*OTW3(:,3)+pfit1(2),...
    'linewidth',2);
ylabel("Torque [lbs-in]");
xlabel("Shear Stain");
title("Torque vs Shear Strain");

%% Torque vs Shear Strain from Twist Angle

T1 = (OTW1(:,2).*G.*J_beta)./L;
T2 = (OTW2(:,2).*G.*J_beta)./L;
T3 = (OTW3(:,2).*G.*J_beta)./L;

gamma1 = (OTW1(:,2).*R)./L;
gamma2 = (OTW2(:,2).*R)./L;
gamma3 = (OTW3(:,2).*R)./L;
%gamma1 = (T1*R)/(G*J_beta);

figure
plot(gamma1,T1,...
    gamma2,T2,...
    gamma3,T3,...
    'linewidth',2);
ylabel("Torque [lbs-in]");
xlabel("Shear Stain");
title("Torque vs Shear Strain");

%% Torsional Rigidity

rigiditySlopeCalc1 = mean(T1./gamma1)*R;
rigiditySlopeCalc2 = mean(T2./gamma2)*R;
rigiditySlopeCalc3 = mean(T3./gamma3)*R;
rigiditySlopeData1 = pfit1(1)*R;
rigiditySlopeData2 = pfit2(1)*R;
rigiditySlopeData3 = pfit3(1)*R;

rigidityTheretical = G*J_beta;


