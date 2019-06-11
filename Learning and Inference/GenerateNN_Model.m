function Generate_NN_Model(Input, Output)
% Input - input data.
% Output - target data.

x = Input';
t = Output';

% Create a Pattern Recognition Network
hiddenLayerSize = 32;
trainFcn = 'trainlm';
net = patternnet(hiddenLayerSize, trainFcn);

% Choose Input and Output Pre/Post-Processing Functions
net.input.processFcns = {'removeconstantrows','mapminmax'};

% Setup Division of Data for Training, Validation, Testing
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Choose a Performance Function
net.performFcn = 'crossentropy';  % Cross-Entropy

% Train the Network
[net,~] = train(net,x,t);

% Generate function for neural network 
genFunction(net,'neuralNetworkFunction');
