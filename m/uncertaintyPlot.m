% Created By : Selmo Almeida
% Created On : September 24, 2020
% Purpose    : Calculate Uncertainty and Plot 

function uncertaintyPlot(a, b, c, d, e, f, g, h)
    stdPlot = [std(a),std(b),std(c),std(d),std(e),std(f),std(g),std(h)];
    meanPlot = [mean(a),mean(b),mean(c),mean(d),mean(e),mean(f),mean(g),mean(h)];
    
    x = 1:1:8;
    scatter(x,a);
end