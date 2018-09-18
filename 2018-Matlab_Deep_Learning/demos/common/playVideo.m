function playVideo(filename)
    reader = vision.VideoFileReader(filename);
    player = vision.VideoPlayer('Position', [50 100 1300 750]);
    
    while ~isDone(reader)
        imgFrame = reader();
        player(imgFrame)
    end
    
    release(reader)
    release(player)
end