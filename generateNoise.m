function generateNoise(~, ~)
    fs = 44100;
    
    % ask the user for the duration of the noise sound
    noise_duration = inputdlg('Enter noise duration in seconds:', 'Noise Generation', [1 50]);
    
    if isempty(noise_duration)
        return;  % Cancel button clicked, do nothing
    end
    
    % Convert string input to a numeric value, value is rounded since randn
    % only accepts integers.
    noise_duration = round(str2num(noise_duration{1}));
    
    %Generate Random Noise for 1 second
    noise = randn(noise_duration, fs);
    
    sound(noise, fs);
end