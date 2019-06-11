function [X] = ReadUnlabeledBatchData(csvFile, sheet)

tableFeed =  readtable(csvFile, 'Sheet', sheet);

Inputs1 = tableFeed.account_id;
inputs2 = tableFeed.metric;
inputs3 = tableFeed.session_id;
Inputs4 = datenum(tableFeed.timestamp); % Convert to double

% Convert inputs into usuable data
Inputs2 = zeros(1, length(inputs2));
for i=1:length(inputs2)
    Inputs2(i) = sum(double(char(inputs2(i))));
end

Inputs3 = zeros(1, length(inputs3));
for i=1:length(inputs3)
    Inputs3(i) = sum(double(char(inputs3(i))));
end
X = [Inputs4, Inputs1, Inputs2', Inputs3'];

end
