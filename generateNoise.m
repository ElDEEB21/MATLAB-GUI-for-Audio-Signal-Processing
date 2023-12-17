function generateNoise(~, ~)
    fs = 44100;
    
    %Generate Random Noise for 1 second
    noise = randn(1, fs);
    
    sound(noise, fs);
end