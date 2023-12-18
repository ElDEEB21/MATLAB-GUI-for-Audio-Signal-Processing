function audioTrim()

    % Ask the user to select an audio file
    [filename, filepath] = uigetfile('*.wav', 'Select Audio File');

    % Check if the user has selected a file
    if ~isequal(filename, 0)
        % Load the selected audio file
        [y, fs] = audioread(fullfile(filepath, filename));

        % Create a dialog to get start and end times
        prompt = {'Enter the start time of the interval to trim (in seconds):', ...
                  'Enter the end time of the interval to trim (in seconds):'};
        dlgTitle = 'Input for Time Interval';
        numLines = 1;
        defaultVals = {'25', '50'};
        inputValues = inputdlg(prompt, dlgTitle, numLines, defaultVals);

        % Check if the user clicked Cancel
        if isempty(inputValues)
            disp('Operation canceled by user.');
            return;
        end

        % Extract start and end times from the input dialog
        startTime = str2double(inputValues{1});
        endTime = str2double(inputValues{2});

        % Ensure the specified times are valid
        if startTime >= 0 && endTime > startTime && endTime <= size(y, 1) / fs
            % Trim the audio to the specified time interval
            startIndex = round(startTime * fs) + 1;
            endIndex = round(endTime * fs);
            trimmedAudio = y(startIndex:endIndex, :);

            % Ask the user to specify the output file name and location
            [outputFilename, outputFilePath] = uiputfile('*.wav', 'Save Trimmed Audio As', 'trimmed_audio.wav');
            if ~isequal(outputFilename, 0)
                % Save the trimmed audio
                audiowrite(fullfile(outputFilePath, outputFilename), trimmedAudio, fs);
                disp('Trimmed audio saved successfully.');
            else
                disp('Trimmed audio not saved.');
            end
        else
            disp('Invalid time interval. Please enter valid start and end times.');
        end
    end

end