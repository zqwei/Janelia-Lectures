function visualizeFeatures(net)
%% Visualize Features of a Convolutional Neural Network
%
% Convolutional neural networks use _features_ to classify images. The
% network learns these features itself during the training process. What
% the network learns during training is sometimes unclear. However, you can
% use the |deepDreamImage| function to visualize the features learned.
%
% The _convolutional_ layers of a network output multiple 2-D arrays. Each
% array (or channel) corresponds to a filter applied to the layer input.
% The channels output by _fully connected_ layers correspond to high-level
% combinations of the features learned by earlier layers.
%
% You can visualize what the learned features look like by using
% |deepDreamImage| to generate images that strongly activate a particular
% channel of the network layers.
%
% The example requires Neural Network Toolbox(TM), Image Processing
% Toolbox(TM), and Neural Network Toolbox Model _for AlexNet Network_
% support package.


%% Visualize Convolutional Layers
% There are five 2-D convolutional layers in the AlexNet network. The
% convolutional layers towards the beginning of the network have a small
% receptive field size and learn small, low-level features. The layers
% towards the end of the network have larger receptive field sizes and
% learn larger features.
%
% Using the Layers property, view the network architecture and locate the
% convolutional layers. Notice that the 2-D convolutional layers are
% different for AlexNet, GoogLEnet, VGG-16, VGG-19.
net.Layers

% Find where the layers are in the network first;
convLayers = find(strncmp('conv',{net.Layers(:).Name},4)); % convolutional layers
fullLayers = find(strncmp('fc',{net.Layers(:).Name},2));% fully connected layers

%%
% *Features on Convolutional Layer 1*
%
% Set |layer| to be the first convolutional layer. This layer is the second
% layer in the network.
layer = convLayers(1);
name = net.Layers(layer).Name

%%
% Visualize the first 56 features learned by this layer using
% |deepDreamImage| by setting |channels| to be the vector of indices
% |1:56|. Set |'PyramidLevels'| to 1 so that the images are not scaled. To
% display the images together, you can use |montage| (Image Processing
% Toolbox).

%%
% |deepDreamImage| uses a compatible GPU, by default, if available.
% Otherwise it uses the CPU. A CUDA(R) enabled NVIDIA(R) GPU with compute
% capability 3.0 or higher is required for training on a GPU.
channels = 1:56;

I = deepDreamImage(net,layer,channels, ...
    'PyramidLevels',1);

figure
montage(I)
title(['Layer ',name,' Features'])

%%
% These images mostly contain edges and colors, which indicates that the
% filters at layer |'conv1'| are edge detectors and color filters. The edge
% detectors are at different angles, which allows the network to construct
% more complex features in the later layers.

%%
% *Features on Convolutional Layer 2*
%
% These features are created using the features from layer |'conv1'|. The
% second convolutional layer is named |'conv2'|, which corresponds to layer
% 6. Visualize the first 30 features learned by this layer by setting
% |channels| to be the vector of indices |1:30|.
layer = convLayers(2);
channels = 1:30;

I = deepDreamImage(net,layer,channels,...
    'PyramidLevels',1);

figure
montage(I)
name = net.Layers(layer).Name;
title(['Layer ',name,' Features'])

%%
% *Features on Convolutional Layers 3-5*
%
% For each of the remaining convolutional layers, visualize the first 30
% features learned. To suppress detailed output on the optimization
% process, set |'Verbose'| to |'false'| in the call to |deepDreamImage|.
% Notice that the layers which are deeper into the network yield more
% detailed filters.
layers = convLayers(3:end);
channels = 1:30;

for layer = layers
    I = deepDreamImage(net,layer,channels,...
        'Verbose',false, ...
        'PyramidLevels',1);
    
    figure
    montage(I)
    name = net.Layers(layer).Name;
    title(['Layer ',name,' Features'])
end

%% Visualize Fully Connected Layers
% The fully connected layers are towards the end of the network and learn 
% high-level combinations of the features learned by the earlier layers.
%
% Select the first two fully connected layers (layers 17 and 20).
layers = fullLayers(1:2);

%%
% For each of these layers, use |deepDreamImage| to visualize the first six
% features. Set |'NumIterations'| to 20 in the call to |deepDreamImage| to
% produce more detailed images. The images generated from the final fully
% connected layer correspond to the image classes.
net.Layers(end).ClassNames
nc = length(net.Layers(end).ClassNames);
channels = 1:nc;

for layer = layers
    I = deepDreamImage(net,layer,channels, ...
        'Verbose',true, ...
        'NumIterations',50);
    
    figure
    montage(I)
    name = net.Layers(layer).Name;
    title(['Layer ',name,' Features'])
end

%%
% To produce images that resemble each class the most closely, select the
% final fully connected layer, and set |channels| to be the indices of the
% classes.
layer = fullLayers(end);

%
% The class names are stored in the |ClassNames| property of the output
% layer (the last layer). You can view the names of the selected classes by
% selecting the entries in |channels|.
%
% Generate detailed images that strongly activate these classes.
I = deepDreamImage(net,layer,channels, ...
    'Verbose',false);%, ...
    %'NumIterations',50);

figure
montage(I)
name = net.Layers(layer).Name;
title(['Layer ',name,' Features'])
