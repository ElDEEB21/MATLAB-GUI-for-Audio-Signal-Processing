function generateNoise(~, ~)
    fs = 44100;
    
    % ask the user for the duration of the noise sound
    noiseDuration = inputdlg('Enter noise duration in seconds:', 'Noise Generation', [1 50]);
    
    if isempty(noiseDuration)
        return;  % Cancel button clicked, do nothing
    end
    
    % Convert string input to a numeric value
    noiseDuration = str2num(noiseDuration{1});
    
    %Generate Random Noise
    noise = randn(1, noiseDuration * fs);
    
    % playing the generated noise sound
    sound(noise, fs);
end