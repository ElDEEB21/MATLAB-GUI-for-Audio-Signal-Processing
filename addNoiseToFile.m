function addNoiseToFile(~, ~)
        
    % Ask the user to select an audio file
    [fileName, filePath] = uigetfile('*.wav', 'Select an Audio File');

    % Check if the user has selected a file
    if ~isequal(fileName, 0)
        % Load the selected audio file
        [y, fs] = audioread(fullfile(filePath, fileName));

        % Add white noise to the audio
        noiseLevel = 0.1; % Adjust the noise level as needed
        noisyAudio = y + noiseLevel * randn(size(y));

        % Save the audio with noise
        [outputFileName, outputFilePath] = uiputfile('*.wav', 'Save Noisy Audio As', 'noisy_audio.wav');
        
        if ~isequal(outputFileName, 0)
            audiowrite(fullfile(outputFilePath, outputFileName), noisyAudio, fs);
            msgbox('Audio was saved successfully');
        else
            return; % Cancel button clicked, do nothing
        end
    end

end