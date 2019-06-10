%function to load the data from csv and then convert the features into
%numbers rather than strings and charcaters. Finally allign the features in
%the desired order

function [X1, X2, y1, y2] = generateNN_data(csv_name)
tableFeed =  readtable(csv_name);

outputs = tableFeed.frustrated;

Inputs1 = tableFeed.account_id;
inputs2 = tableFeed.metric;
inputs3 = tableFeed.session_id;
Inputs4 = datenum(tableFeed.timestamp); %Convert into double

%convert outputs into usuable data
Output = zeros(1, length(outputs));
for i=1:length(outputs)
    temp1 = outputs(i);
    temp2 = temp1{1,1};
    if strcmp(temp2,'False')
        Output(i) = 0;    
    else
        Output(i) = 1;
    end
end
Output = Output';

%convert inputs into usuable data
Inputs2 = zeros(1, length(inputs2));
for i=1:length(inputs2)
    Inputs2(i) = sum(double(char(inputs2(i))));
end

Inputs3 = zeros(1, length(inputs3));
for i=1:length(inputs3)
    Inputs3(i) = sum(double(char(inputs3(i))));
end

indexToSplit = fix(length(Output)*0.90);
X1 = [Inputs4(1:indexToSplit), Inputs1(1:indexToSplit), Inputs2(1:indexToSplit)', Inputs3(1:indexToSplit)'];
X2 = [Inputs4(indexToSplit+1:end), Inputs1(indexToSplit+1:end), Inputs2(indexToSplit+1:end)', Inputs3(indexToSplit+1:end)'];
y1 = Output(1:indexToSplit);
y2 = Output(indexToSplit+1:end);

end



