% Created By : Selmo Almeida
% Created On : September 24, 2020
% Purpose    : Read in files

function [CTW1, CTW2, CTW3, CTW4, CTW5, CTW6, CTW7, CTW8] = readInFiles


%% Import Files
% Create a list of all files
% files1 = dir('*-OTW.txt');
files2 = dir('*-CTW.txt');

%% Read in all files in the list
% data1 = {};
% for i = 1:length(files1)
%     data1(i) = {readmatrix(files1(i).name)};
% end

data2 = {};
for i = 1:length(files2)
    data2(i) = {readmatrix(files2(i).name)};
end

%% Convert data to usable type (double)
data2 = cell2table(data2); % convert data to table
for i = 1:width(data2)
    CTW = data2{1,i}{:,:}; % remove nested table
    
    % Clean Up Data By limiting to Max Torque
    [~,idx] = max(CTW(:,4));
    
    CTW(:,2) = (CTW(:,2) - CTW(1,2)) * pi/180;
    CTW(:,3) = (CTW(:,3) - CTW(1,3)) * pi/180;
    
    CTW = abs(CTW(1:idx,:));
    
    switch i
        case 1
            CTW1 = CTW;
        case 2
            CTW2 = CTW;
        case 3
            CTW3 = CTW;
        case 4
            CTW4 = CTW;
        case 5
            CTW5 = CTW;
        case 6
            CTW6 = CTW;
        case 7
            CTW7 = CTW;
        otherwise
            CTW8 = CTW;
    end % end of switch case
    
end % end of for loop

% clear data1 data2 files1 files2 i % clears variables/clutter from workspace

end