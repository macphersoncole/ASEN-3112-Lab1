% Created By : Selmo Almeida
% Created On : September 24, 2020
% Purpose    : Create plots

function printPlots(a,b,x1,y1,x2,y2)
% IV.2.1 Analysis of the Closed Thin Wall Specimen
% Plot the torque vs. shear strain provided by the extensometer, as well as
% the torque vs. shear strain calculated using the total rotation angle
% imposed by the testing machine.

figure
scatter(a(:,3),a(:,4),'.', 'Linewidth', 2)
hold on
scatter(b,a(:,4),'.', 'k', 'Linewidth', 2)
plot(x1,y1,'Linewidth', 2)
plot(x2,y2, 'c', 'Linewidth', 2)
hold off
grid on
title('Torsion vs. Shear Strain')
ylabel('Torsion (lbs-in)')
xlabel('Shear Strain (radians)')
legend('Actual', 'Theoretical', 'Best Fit (Actual)', 'Best Fit (Theoretical)')

end