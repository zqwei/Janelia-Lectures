%% Visualize Activations of the network
% sample = randi([1 length(testDS.Files)],1);
figure;
% testIm = testDS.readimage(sample);
imgLoc = fullfile('foodData','test','caesar_salad','SaladFinalImage813_resized.jpg');
testIm = testDS.ReadFcn(imgLoc);

imshow(testIm);
title('Test Image');
%% Here is the output after the first convolution in the network

% Find where the layers are in the network first;
convLayers = find(contains({net.Layers(:).Name},'conv')& ~contains({net.Layers(:).Name},'relu')); % convolutional layers
reLULayers = find(contains({net.Layers(:).Name},'relu')& ~contains({net.Layers(:).Name},'conv')); % ReLU layers
    
fullLayers_keyword = 'fc';
if strcmp(class(net),'DAGNetwork')
    % fullLayers_keyword = 'loss';
    useDeepDreamImage = false;
elseif strcmp(class(net),'SeriesNetwork')
    useDeepDreamImage = true;
end
fullLayers = find(contains({net.Layers(:).Name},fullLayers_keyword));% fully connected layers

act1 = activations(net,testIm,net.Layers(convLayers(1)).Name);
visActivations(act1);
title('after convolutions with filters');

%% Here is the output after the second or third (or more) convolution in the network
% simply change the third input to 'conv2' 'conv3' 'conv4' or 'conv5'
act2 = activations(net,testIm,net.Layers(convLayers(2)).Name);
visActivations(act2);
title('after later convolutions');

%% Search for a feature that's being activated
act3 = activations(net,testIm,net.Layers(reLULayers(1)).Name);
figure;
subplot(1,2,2);
visActivations(act3,64);
title('Specific activation output');
subplot(1,2,1);
imshow(testIm);
title('Test image');


% %% This type of exploration is great for convolutions,
% % but tends to break down as the layers get more complex...
% deep_layer = activations(net,testIm,net.Layers(fullLayers(end)).Name);
% visActivations(deep_layer);
% title('Activation after deeper layer');

%% Show deep dream doc - first
% doc nnet
%% Try out on our images!
if useDeepDreamImage
    figure;
    
    tic
    for ii = 1:5
        I = deepDreamImage(net,fullLayers(end),ii,'verbose',false);
        subplot(2,3,ii);
        imshow(I);
        title(net.Layers(end).ClassNames{ii},'Interpreter','none');
        drawnow;
    end
    toc
end

