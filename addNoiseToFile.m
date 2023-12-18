function addNoiseToFile(~, ~)
        
    % Ask the user to select an audio file
    [filename, filepath] = uigetfile('*.wav', 'Select Audio File');

    % Check if the user has selected a file
    if ~isequal(filename, 0)
        % Load the selected audio file
        [y, fs] = audioread(fullfile(filepath, filename));

        % Add white noise to the audio
        noiseLevel = 0.1; % Adjust the noise level as needed
        noisyAudio = y + noiseLevel * randn(size(y));

        % Save the audio with noise
        [outputFilename, outputFilePath] = uiputfile('*.wav', 'Save Noisy Audio As', 'noisy_audio.wav');
        
        if ~isequal(outputFilename, 0)
            audiowrite(fullfile(outputFilePath, outputFilename), noisyAudio, fs);
            msgbox('Noisy audio saved successfully');
        else
            return; % Cancel button clicked, do nothing
        end
    end

end