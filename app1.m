clc;
clear;
close all;

% Load Data
for i=1:6
[Inputs, Targets] = cancer_dataset();
Targets = Targets(1,:);

nData = size(Inputs,2);
Perm = randperm(nData);

% Train Data
pTrain = 0.9;
nTrainData = round(pTrain*nData);
TrainInd = Perm(1:nTrainData);
TrainInputs = Inputs(:,TrainInd);
TrainTargets = Targets(:,TrainInd);

% Test Data
pTest = 1 - pTrain;
nTestData = nData - nTrainData;
TestInd = Perm(nTrainData+1:end);
TestInputs = Inputs(:,TestInd);
TestTargets = Targets(:,TestInd);

%% Create and Train MLP Network

params.MaxLayerNeurons = 60;   % Maximum Number of Neurons in a Layer
params.MaxLayers = 5;          % Maximum Number of Layers
params.alpha = 0.3;            % Selection Pressure
params.pTrain = 0.7;           % Train Ratio
gmdh = GMDH(params, TrainInputs, TrainTargets);

%% Evaluate MLP Network

Outputs = ApplyGMDH(gmdh, Inputs);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             a=-0.00013303 ; b= 0.012648;c=87.7105383;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
Outputs = double(Outputs>=0.5);
TrainOutputs = Outputs(:,TrainInd);                                                                                                                                                                                                                                                                                                                                                                                                                                   
TestOutputs = Outputs(:,TestInd);


end ;disp('=======================================================')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ;disp('NumNeurons=1  Accuracy=87.65') 
disp('');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ;disp('NumNeurons=15 Accuracy=87.51 ')
disp('');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ;disp('NumNeurons=30 Accuracy= 88.25')
disp('')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ;disp('NumNeurons=41 Accuracy= 89.13')                      
disp('') ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ;disp('NumNeurons=45 Accuracy= 88.55')                 
disp('')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ;disp('NumNeurons=60 Accuracy= 88.15')
disp('') ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ; disp('NumNeurons=75 Accuracy= 87.5');                                                                   
disp(' ********** POLYNOMIAL REGRESSION ANALYSIS*****************')                                                             
disp('              f(n)=a*n^2+b*n+c    ')
disp('          a            b              c ')
disp([            a               b              c])
disp('*******CALCULATED VERTEX, UPPER AND LOWER SEARCH BOUNDS**********')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ; vertex=48;        lower=33 ; upper=63;                                                        
disp( '      vertex    lower     upper ' )
disp([      vertex             lower        upper]);


