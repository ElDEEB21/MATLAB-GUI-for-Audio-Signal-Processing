function generateNoise(~, ~)
    fs = 44100;
    
    % ask the user for the duration of the noise sound
    noise_duration = inputdlg('Enter noise duration in seconds:', 'Noise Generation', [1 50]);
    
    if isempty(noise_duration)
        return;  % Cancel button clicked, do nothing
    end
    
    % Convert string input to a numeric value
    noise_duration = str2num(noise_duration{1});
    
    %Generate Random Noise
    noise = randn(1, noise_duration * fs);
    
    % playing the generated noise sound
    sound(noise, fs);
end