clc; clear all; close all;
%% Overview
%{
Coding To-Dos. To claim a task, type this next to it: [Name, NOT STARTED/% PROGRESS/DONE]
    
    Open: Max, Aaron, Cole
    Closed: Selmo, Thyme, Demetrius
    
    
    - Comment code.

    Closed Thin Wall Specimen:
        - Plot the torque vs. shear strain provided by the extensometer, as well as the torque vs. shear
        strain calculated using the total rotation angle imposed by the testing machine.
        - Use least squares fitting to calculate the torsional rigidity, GJ, for the two ways to obtain
        the shear strain. Provide the value of the associated uncertainty. Repeat the GJ calculation
        for each data set after removing obvious outliers and take the average to report the final
        estimate of GJ. Provide the value of the associated uncertainty.

    Open Thin Wall Specimen:
        - Plot the torque vs. shear strain provided by the extensometer, as well as the torque vs. shear
        strain calculated using the total rotation angle imposed by the testing machine.
        - Use least squares fitting to calculate the torsional rigidity, GJ, for the two ways to obtain
        the shear strain. Provide the value of the associate uncertainty. Repeat the GJ calculation
        for each data set after removing obvious outliers and take the average to report the final
        estimate of GJ. Provide the value of the associated uncertainty.

Deadlines:
    Get data read in and tabulated:
    Closed thin wall analysis code:
    Open thin wall analysis code:
    Final Report: Sept 28th before class.
%}

%% Readin
TorsionTesting
% 1 - Time, 2 - phi, 3 - ep_theta, 4 - torque, 5 - ep_axial

%% Constants
G = 3.75e6; %psi
R_avg = mean([R_e (R_e-t)]);

%% OTW Plots

J_ext = zeros(8,1);
Uncert_ext = zeros(8,1);
J_calc = zeros(8,1);
Uncert_calc = zeros(8,1);

for i=1:8
    figure(i)
    hold on;
    torque = data1{1,i}{:,:}(:,4);
    strain_ext = (pi/180)*data1{1,i}{:,:}(:,3);
    strain_ext = strain_ext - strain_ext(1);
    strain_calc = data1{1,i}{:,:}(:,2) * (pi/180) * t / L;
    strain_calc = strain_calc - strain_calc(1);
    torque_calc = data1{1,i}{:,:}(:,2) * (pi/180) * G * (1/3 * 2*pi*R_avg * t^3) / L;
    torque_calc = torque_calc - torque_calc(1);
    
    plot(strain_ext,torque) %torque against strain (extensometer)
    [temp,gof] = fit(strain_ext,torque,'poly1'); 
    J_ext(i) = temp(1);
    Uncert_ext(i) = gof.rmse;
    
    plot(strain_calc,torque) %torque against strain (calc)
    [temp,gof] = fit(strain_calc,torque_calc,'poly1'); 
    J_calc(i) = temp(1);
    Uncert_calc(i) = gof.rmse;
    
    title('Torque vs Strain')
    xlabel('Strain')
    ylabel('Torque Nm')
    legend('Extensometer','Calculated')
end

J_ext_avg = t*mean(J_ext);
Uncert_ext_avg = t*mean(Uncert_ext);
J_calc_avg = t*mean(J_calc);
Uncert_calc_avg = t*mean(Uncert_calc);

