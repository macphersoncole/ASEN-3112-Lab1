% Created By : Selmo Almeida
% Created On : September 24, 2020
% Purpose    : Calculate Actual and Theoretical Torsional Rigidity

function ctwTheory(R_e,R_i,t,G, R_avg)

    A_e = pi * R_avg^2; % Enclosed Area of Cylinder
    
    exactJ  = (pi/2) * ((R_e^4)-(R_i^4)); % Exact Value
    theoryJ = (4 * (A_e^2))/ ((2 * pi * R_avg) / t); % Theoretical Value
    
    exactGJ = G * exactJ
    theoryGJ = G * theoryJ

end