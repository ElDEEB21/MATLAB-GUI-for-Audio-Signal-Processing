function recordAndSave(~, ~)

    fs = 44100;
    duration = inputdlg('Enter the duration for the recording');

    duration = str2double(duration{1});

    % if the user clicked the cancel button
    if isequal(duration, 0)
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

    y = getaudiodata(recorder);

    close(WaitBar);

    % Ask the user where to save the file
    [fileName, filePath] = uiputfile('*.wav', 'Save Audio File');

    % Check if the user has not clicked the cancel button
    if ~isequal(fileName, 0)
        fullPath = fullfile(filePath, fileName);

        % Save the audio file in the specified path
        audiowrite(fullPath, y, fs);

        msgbox('Recording was saved successfully');
    end