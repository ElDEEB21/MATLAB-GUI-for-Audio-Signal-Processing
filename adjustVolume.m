function adjustVolume(~, ~)
    % Initialize variables
    audioData = [];
    sampleRate = 0;
    fileName = '';

    % Ask the user whether to select a '.wav' file or record audio
    choice = questdlg('Select an option:', 'Adjust Volume', 'Select a File', 'Record Audio', 'Cancel', 'Select a File');

    switch choice
        case 'Select a File'
            [fileName, filePath] = uigetfile('*.wav', 'Select a .wav file');
            audioFile = fullfile(filePath, fileName);
            [audioData, sampleRate] = audioread(audioFile);

        case 'Record Audio'
            fs = 44100;
            duration = inputdlg('Enter the duration for the recording');

            duration = str2double(duration{1});

            % if the user clicked the cancel button
            if isempty(duration) || isnan(duration)
                return;
            end

            recorder = audiorecorder(fs, 16, 1);
            record(recorder);

            WaitBar = waitbar(0, 'Recording Audio...');

            % Update waitbar while recording
            for t = 1:duration
                waitbar(t/duration, WaitBar, sprintf('Recording Audio... %d seconds', t));
                pause(1);
            end

            stop(recorder);
            
            close(WaitBar);

            audioData = getaudiodata(recorder);
            sampleRate = recorder.SampleRate;


        case 'Cancel'
            return;
    end

    % Ask the user to enter the volume adjustment level using inputdlg
    prompt = 'Enter the volume adjustment level (-100 to 100):';
    dlgTitle = 'Adjust Volume';
    numLines = 1;
    defaultAnswer = {'0'}; % Default value is '0'
    inputAnswer = inputdlg(prompt, dlgTitle, numLines, defaultAnswer);

    % Check if the user canceled the inputdlg
    if isempty(inputAnswer)
        return;
    end

    % Convert user input to a number
    volumeAdjustment = str2double(inputAnswer{1});

    % Check for invalid volume adjustment input
    if isnan(volumeAdjustment) || volumeAdjustment < -100 || volumeAdjustment > 100
        errordlg('Invalid volume adjustment. Enter a value between -100 and 100.', 'Error');
        return;
    end

    % Ask the user where to save the adjusted audio file
    [saveFileName, saveFilePath] = uiputfile('*.wav', 'Save As', 'adjusted_audio.wav');

    % Check if the user canceled the uiputfile dialog
    if isequal(saveFileName, 0)
        return;
    end

    % Perform volume adjustment
    adjustedAudioData = audioData + (audioData * (volumeAdjustment/100));

    % Save the adjusted audio data to the selected file
    adjustedFilePath = fullfile(saveFilePath, saveFileName);
    audiowrite(adjustedFilePath, adjustedAudioData, sampleRate);

    msgbox('Audio was saved successfully');
end