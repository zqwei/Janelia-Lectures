function imgOut = readMNISTImage(imageArray, imageIndex)
    % helper function to read out an image from the MNIST image array
    imgOut = imageArray(:, :, 1, imageIndex);

end