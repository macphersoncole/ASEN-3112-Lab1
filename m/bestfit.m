% Created By : Selmo Almeida
% Created On : September 24, 2020
% Purpose    : Create polyfit vectors

function [actualGJ, theoryGJ] = bestfit(a,b, R_avg)

% Use least squares fitting to calculate the torsional rigidity, GJ, 
% for the two ways to obtain the shear strain. Provide the value of the 
% associated uncertainty. Repeat the GJ calculation for each data set after 
% removing obvious outliers and take the average to report the final 
% estimate of GJ. Provide the value of the associated uncertainty.

% This is the best fit line for the Actual Data
coefActual = polyfit(a(:,3),a(:,4),1);
numFitActual = 10000; % Enough to make the plot look continuous.
xFitActual = linspace(min(a(:,3)), max(a(:,3)), numFitActual);
yFitActual = polyval(coefActual, xFitActual);

% This is the best fit line for the Theoretical Data
coefTheory = polyfit(b,a(:,4),1);
numFitTheory = 10000; % Enough to make the plot look continuous.
xFitTheory = linspace(min(b), max(b), numFitTheory);
yFitTheory = polyval(coefTheory, xFitTheory);

actualGJ = coefActual(1,1) * R_avg;
theoryGJ = coefTheory(1,1) * R_avg;

printPlots(a,b,xFitActual,yFitActual,xFitTheory,yFitTheory);

end