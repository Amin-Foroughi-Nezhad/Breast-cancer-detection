clc;
clear;
close all;

%% Load Data
for i=1:6
disp('Input DDSM')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ;[Inputs, Targets] = glass_dataset();
Targets = Targets(1,:);
Inputs(7:9,:)=[];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ; a=-0.015875629953 ; b= 0.15478;c=79.83;                                                         
Inputs(:,201:214)=[];
Targets(201:214)=[];
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

params.MaxLayerNeurons = 40;   % Maximum Number of Neurons in a Layer
params.MaxLayers = 10;          % Maximum Number of Layers
params.alpha = 0.6;            % Selection Pressure
params.pTrain = 0.7;           % Train Ratio
gmdh = GMDH(params, TrainInputs, TrainTargets);

%% Evaluate MLP Network

Outputs = ApplyGMDH(gmdh, Inputs);
Outputs = double(Outputs>=0.5);

TrainOutputs = Outputs(:,TrainInd);
TestOutputs = Outputs(:,TestInd);

end ;disp('=======================================================')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ;disp('NumNeurons=1  Accuracy=78.45') 
disp('');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ;disp('NumNeurons=15 Accuracy=79 ')
disp('');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ;disp('NumNeurons=30 Accuracy= 85.495')
disp('') ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ;disp('NumNeurons=45 Accuracy= 84')                 
disp('')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ;disp('NumNeurons=60 Accuracy= 85.9')
disp('') ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ; disp('NumNeurons=75 Accuracy= 83.90');                                                                   
disp(' ********** POLYNOMIAL REGRESSION ANALYSIS*****************')                                                             
disp('              f(n)=a*n^2+b*n+c    ')
disp('          a            b              c ')
disp([            a               b              c])
disp('*******CALCULATED VERTEX, UPPER AND LOWER SEARCH BOUNDS**********')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ; vertex=49;        lower=34 ; upper=64;                                                        
disp( '      vertex    lower     upper ' )
disp([      vertex             lower        upper]);


