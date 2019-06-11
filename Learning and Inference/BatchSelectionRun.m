function [dataPointsAdded] = BatchSelectionRun(count, confidenceFilterPos, confidenceFilterNeg, Input1, Output1)

% Read the unlabeled data
s = strcat('fnameUnLabelledBatches-',num2str(count), '.csv');
X1 = readUnlabbedBatchData('UnlabelledBatch.xlsx', s);

% Run model on X1
[Y,~,~] = myNeuralNetworkFunction(X1');

% Get the indices that have high confidence 
% C < confidenceFilterNeg for 0 
% C > confidenceFilterPos for 1
index1 = find(Y< confidenceFilterNeg);
index2 = find(Y> confidenceFilterPos);

% Get all session IDs that match index1 and index2
Index1 = zeros(1, length(index1));
if ~isempty(Index1)
for i=1:length(index1)
    Index1(i)=X1(index1(i), 4);
end
Index1 = unique(Index1);
%get index of X1 to add
a = find(X1(:,4) == Index1(1))';
for i=2:length(Index1)
    a = [a, find(X1(:,4) == Index1(i))'];
end
Input1=[Input1;X1(a,:)]; %Add all zero values
Output1 =[Output1; zeros(length(a),1)];
end

Index2 = zeros(1, length(index2));
if ~isempty(Index2)
for i=1:length(index2)
    Index2(i)=X1(index2(i), 4);
end
Index2 = unique(Index2);
%get index of X2 to add
b = find(X1(:,4) == Index2(1))';
for i=2:length(Index2)
    b = [b, find(X1(:,4) == Index2(i))'];
end
Input1=[Input1;X1(b,:)]; %All all one values
Output1 =[Output1; ones(length(b),1)];
end

dataPointsAdded = (length(index1) + length(index2));

% Geneate a new NN Again with the newly added data
generateNN_Model(Input1, Output1);
end
