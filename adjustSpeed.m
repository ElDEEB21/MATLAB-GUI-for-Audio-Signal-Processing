function adjustSpeed(~, ~)
    
    % Ask the user to choose whether to record or select an audio file.
    choice = questdlg('Choose an option',...
                       'Adjust Audio Speed', ...
                       'Open a file', 'Record audio', 'Cancel', 'Open a file');
                   
    switch choice
        case 'Open a file'
            % Select an audio file.
            [fileName, filePath] = uigetfile('.wav', 'Select an Audio File');
            
            % Check if the user has not clicked the cancel button.
            if ~isequal(fileName, 0)
                % Ask the user to enter the speed factor.
                prompt = 'Enter the speed factor for adjusting the speed:';
                speedFactor = inputdlg(prompt, 'Speed Factor', 1, {'1.0'});
                
                % Check if the user has not clicked the cancel button.
                if ~isempty(speedFactor)
                    % Load the audio file.
                    audioFilePath = fullfile(filePath, fileName);
                    [audio, sampleRate] = audioread(audioFilePath);
                    
                    % Adjust the speed of the audio using stretchAudio.
                    adjustedAudio = stretchAudio(audio, str2double(speedFactor{1}));
                    
                    % Ask the user where to save the adjusted audio file.
                    [saveFileName, saveFilePath] = uiputfile('.wav', 'Save Adjusted Audio As', ['adjusted_', fileName]);
                    
                    % Check if the user has not clicked the cancel button.
                    if ~isequal(saveFileName, 0)
                        % Save the adjusted audio.
                        saveFilePath = fullfile(saveFilePath, saveFileName);
                        audiowrite(saveFilePath, adjustedAudio, sampleRate);
                        
                        % Display a message indicating the adjustment is complete.
                        msgbox('File was saved successfully', 'Adjust Speed');
                    end
                end
            end
        case 'Record audio'
            fs = 44100;
            duration = inputdlg('Enter the duration for the recording');

            duration = str2double(duration{1});

            % if the user clicked the cancel button
            if isequal(duration, 0)
                return;
            end

            recorder = audiorecorder(fs, 16, 1);
            record(recorder);

            % Display a wait bar during recording
            WaitBar = waitbar(0, 'Recording Audio...');

            % Update wait bar while recording
            for t = 1:duration
                waitbar(t/duration, WaitBar, sprintf('Recording Audio... %d seconds', t));
                pause(1);
            end

            stop(recorder);

            close(WaitBar);

            % Use audioread to directly read audio data from the file
            audioFilePath = tempname + ".wav";  % Temporary file to store the recorded audio
            audiowrite(audioFilePath, getaudiodata(recorder), fs);
            [y, fs] = audioread(audioFilePath);
            delete(audioFilePath);  % Delete temporary file

            % Ask the user to enter the speed factor.
            prompt = 'Enter the speed factor for adjusting the speed:';
            speedFactor = inputdlg(prompt, 'Speed Factor', 1, {'1.0'});

            % Check if the user has not clicked the cancel button.
            if ~isempty(speedFactor)
                % Adjust the speed of the recorded audio using stretchAudio.
                adjustedAudio = stretchAudio(y, str2double(speedFactor{1}));

                % Ask the user where to save the adjusted recorded audio file.
                [saveFileName, saveFilePath] = uiputfile('.wav', 'Save Adjusted Audio As', 'speedRecording.wav');

                % Check if the user has not clicked the cancel button.
                if ~isequal(saveFileName, 0)
                    % Save the adjusted recorded audio.
                    saveFilePath = fullfile(saveFilePath, saveFileName);
                    audiowrite(saveFilePath, adjustedAudio, fs);

                    % Display a message indicating the adjustment is complete.
                    msgbox('File was saved successfully', 'Adjust Speed');
                end
            end
    end
end