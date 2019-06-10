clc
close all
clear

%Main workflow to run the self learning approach

%Step 1: read Labelled Data
[Input1,Input2, Output1, Output2] = generateNN_data('fnameLabelledProcessed.csv');

%%Step 2: Train and then genrate the NN model on the labelled data only
%NN_Model will train on the labelled data and then generate a usuable model
%called myNeuralNetworkFunction that can be used to generate outputs for
%the nonusuable data
generateNN_Model(Input1, Output1);

%%Step 3: Observe the results from running the generated model on independant labelled data 
[Y2,~,~] = myNeuralNetworkFunction(Input2');
Y2(Y2>=0.5)=1; Y2(Y2<0.5)=0;
Y2 = Y2';
%Print on the screen the error rate and confusion matrix
errorRate= sum(abs(Y2-Output2))/length(Y2)
%Generate a confusion matrix and print on screen
confusionmat(Y2,Output2)


%%Step 4: Call the function to run different batches on the generated NN and
%%then update the model
confidenceFilterNeg = 0.0001;
confidenceFilterPos = 0.9999;
numOfRuns = 100;

dataPointsAdded = zeros(1, numOfRuns);
for count=1:numOfRuns
dataPointsAdded(count) = batchSelectionRun(count-1, confidenceFilterPos, confidenceFilterNeg, Input1, Output1);
% Test Batch results on independant labelled data 
[Y2,~,~] = myNeuralNetworkFunction(Input2');
Y2(Y2>=0.5)=1; Y2(Y2<0.5)=0;
Y2 = Y2';
%Print on the screen the confusion matrix for each added batch
errorRate(count)= sum(abs(Y2-Output2))/length(Y2);
confusionmat(Y2,Output2)
end

%step 5: Plot the error rate propagation along with its moving average
plots;

