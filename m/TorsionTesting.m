% Created By : Selmo Almeida
% Created On : September 8, 2020
% Purpose    : Reads in LabView files and plots data

clear
close all
clc

global L t R_e t D_e R_i G R_avg
L = 10; % length [inches]
t = 1/16; % thickness [inches]
D_e = 3/4; % exterior diameter [inches]
R_e = 3/8; % exterior radius [inches]
R_i = R_e - t; % interior radius [inches]
G = 3.75E6; % Shear Modulus
R_avg = (R_e + R_i) / 2; % Average Radius

[CTW1, CTW2, CTW3, CTW4, CTW5, CTW6, CTW7, CTW8] = readInFiles;

%% Convert TWIST ANGLE of machine TO SHEAR STRAIN
CTW1_gamma = (CTW1(:,2) * R_e) / L;
CTW2_gamma = (CTW2(:,2) * R_e) / L;
CTW3_gamma = (CTW3(:,2) * R_e) / L;
CTW4_gamma = (CTW4(:,2) * R_e) / L;
CTW5_gamma = (CTW5(:,2) * R_e) / L;
CTW6_gamma = (CTW6(:,2) * R_e) / L;
CTW7_gamma = (CTW7(:,2) * R_e) / L;
CTW8_gamma = (CTW8(:,2) * R_e) / L;


%% Torsional Rigidity
[cA1,cT1] = bestfit(CTW1,CTW1_gamma, R_avg);
[cA2,cT2] = bestfit(CTW2,CTW2_gamma, R_avg);
[cA3,cT3] = bestfit(CTW3,CTW3_gamma, R_avg);
[cA4,cT4] = bestfit(CTW4,CTW4_gamma, R_avg);
[cA5,cT5] = bestfit(CTW5,CTW5_gamma, R_avg);
[cA6,cT6] = bestfit(CTW6,CTW6_gamma, R_avg);
[cA7,cT7] = bestfit(CTW7,CTW7_gamma, R_avg);
[cA8,cT8] = bestfit(CTW8,CTW8_gamma, R_avg);

%% Calculating Exact and Theoretical Rigidity (J) of Cylinder
ctwTheory(R_e,R_i,t, G, R_avg)

% Compare the value of GJ obtained through the experiments with the çc
% theoretical predictions obtained using exact theory and thin wall theory. 
% Discuss the differences.

