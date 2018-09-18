%% Deep learning for classification on the MNIST dataset

addpath(fullfile('..','common'))

%% Prepare the dataset

% The MNIST dataset is a set of handwritten digits categorized 0-9 and is
% available at http://yann.lecun.com/exdb/mnist/.

% The following line will download (if necessary) and prepare the dataset
% to use in MATLAB.
[imgDataTrain, labelsTrain, imgDataTest, labelsTest] = prepareData;

% Set the following to true if you want to actually compute the training,
% false if you want to use precomputed results.
doTrain = false;

%% Let's look at a few of the images
% Randomize the images for display
warning off images:imshow:magnificationMustBeFitForDockedFigure
perm = randperm(numel(labelsTrain), 25);
subset = imgDataTrain(:,:,1,perm);
montage(subset)

%% How do we classify a digit?
% First, we need a model - let's load one
load MNISTModel

% Predict the class of an image
randIndx = randi(numel(labelsTest));
img = imgDataTest(:,:,1,randIndx);
actualLabel = labelsTest(randIndx);

predictedLabel = net.classify(img);
imshow(img);
title(['Predicted: ' char(predictedLabel) ', Actual: ' char(actualLabel)])

%% Need a starting point? Check the documentation!
% search "deep learning"
web(fullfile(docroot, 'nnet/deep-learning-training-from-scratch.html'))


%% Prepare the CNN
% One of the simplest possible convnets, it contains one convolutional
% layer, one ReLU, one pooling layer, and one fully connected layer

layers = [  imageInputLayer([28 28 1])
            convolution2dLayer(5,20)
            reluLayer
            maxPooling2dLayer(2, 'Stride', 2)
            fullyConnectedLayer(10)
            softmaxLayer
            classificationLayer()   ]
        
%% Attempt 1: Set training options and train the network

if doTrain
    
    miniBatchSize = 8192;
    options = trainingOptions( 'sgdm',...
        'MiniBatchSize', miniBatchSize,...
        'Plots', 'training-progress');

    net = trainNetwork(imgDataTrain, labelsTrain, layers, options);
    
else
    playVideo(fullfile('results','net1.mp4'))
end

%% Attempt 2: Change the learning rate

if doTrain

    options = trainingOptions( 'sgdm',...
        'MiniBatchSize', miniBatchSize,...
        'Plots', 'training-progress',...
        'InitialLearnRate', 0.0001);

    net = trainNetwork(imgDataTrain, labelsTrain, layers, options);
    
else
    playVideo(fullfile('results','net2.mp4'))
end

%% (optional aside) Why change learning rate?
edit gradientDescentVisualization.m

%% Attempt 3: Change the network architecture

layers = [
    imageInputLayer([28 28 1])

    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,64,'Padding',1)
    batchNormalizationLayer
    reluLayer

    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

if doTrain

    options = trainingOptions( 'sgdm',...
        'MiniBatchSize', miniBatchSize,...
        'Plots', 'training-progress');

    net = trainNetwork(imgDataTrain, labelsTrain, layers, options);
    
else
    playVideo(fullfile('results','net3.mp4'));
end

%% Classify the test data set
if ~doTrain
    load(fullfile('results','net3.mat'))
end

predLabelsTest = net.classify(imgDataTest);

testAccuracy = sum(predLabelsTest == labelsTest) / numel(labelsTest)

%% Try to classify something else
img = imread('letterW.png');
actualLabel = 'W';

predictedLabel = net.classify(img);
imshow(img);
title(['Predicted: ' char(predictedLabel) ', Actual: ' char(actualLabel)])